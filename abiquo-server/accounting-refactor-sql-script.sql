# Introduction of OPTIMIZED ACCOUNTING
# This script defines all of the DBMS changes to:
# 1. Create a new separate accounting schema (for new objects only)
# 2. Create an optimised storage version of the existing accounting_event_detail table 
# 3. Make accounting queries against the detail table scalable
# 4. Core functionality to recover 'missed' accounting periods (currently requires manual identification and running)
#    - Also will skip periods if re-run, when existing data detected
# 5. Core functionality to change accounting period from 1 hour (i.e. allowing customers to collect detail data 
#    at a 1 day account period will give further massive DBMS space saving benefits). Note, further work required
#    to control granularity independently of the account period.
#
# Other misc notes:
# - Cost Codes now only stored against VM-CPU resources, rather than against CPU, Memory and LocalHD

DROP PROCEDURE IF EXISTS kinton.accounting_optimizations;

DELIMITER |
CREATE PROCEDURE kinton.accounting_optimizations() 
BEGIN
	SELECT "Applying accounting Premium optimizations in new schema..." as " ";

    # Create new schema to hold the accounting objects...
    CREATE SCHEMA IF NOT EXISTS kinton_accounting;


	SELECT "Creating new name tables..." as " ";

	IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='object_name') THEN
        SELECT "Creating table - kinton_accounting.object_name" as " ";
        CREATE TABLE `kinton_accounting`.`object_name` (
          idObject          INT(16)         NOT NULL AUTO_INCREMENT,
          objectName        VARCHAR(511)    NOT NULL,
          startTime         TIMESTAMP       NOT NULL,
          endTime           TIMESTAMP       NULL,
          PRIMARY KEY (idObject)
        ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
    END IF;

	IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='ent_name') THEN
        SELECT "Creating table - kinton_accounting.ent_name" as " ";
        CREATE TABLE `kinton_accounting`.`ent_name` (
          idEnterprise      INT(10)         NOT NULL,
          enterpriseName    VARCHAR(40)     NOT NULL,
          startTime         TIMESTAMP       NOT NULL,
          endTime           TIMESTAMP       NULL,
          PRIMARY KEY (idEnterprise)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    END IF;

	IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='vdc_name') THEN
        SELECT "Creating table - kinton_accounting.vdc_name" as " ";
        CREATE TABLE `kinton_accounting`.`vdc_name` (
          idVirtualDataCenter   INT(10)         NOT NULL,
          vdcName               VARCHAR(40)     NOT NULL,
          startTime             TIMESTAMP       NOT NULL,
          endTime               TIMESTAMP       NULL,
          PRIMARY KEY (idVirtualDataCenter)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    END IF;

	IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='vapp_name') THEN
        SELECT "Creating table - kinton_accounting.vapp_name" as " ";
        CREATE TABLE `kinton_accounting`.`vapp_name` (
          idVirtualApp          INT(10)         NOT NULL,
          vappName              VARCHAR(40)     NOT NULL,
          startTime             TIMESTAMP       NOT NULL,
          endTime               TIMESTAMP       NULL,
          PRIMARY KEY (idVirtualApp)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    END IF;

	IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='vm_name') THEN
        SELECT "Creating table - kinton_accounting.vm_name" as " ";
        CREATE TABLE `kinton_accounting`.`vm_name` (
          idVM                  BIGINT(20)      NOT NULL,
          vmName                VARCHAR(255)    NOT NULL,
          startTime             TIMESTAMP       NOT NULL,
          endTime               TIMESTAMP       NULL,
          PRIMARY KEY (idVM)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    END IF;

    # Refined version of the 'old' accounting table, removing duplicated string data and column references...
	IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='accounting_event_detail') THEN
        SELECT "Creating table - kinton_accounting.accounting_event_detail" as " ";
        CREATE TABLE kinton_accounting.accounting_event_detail (
          `idAccountingEvent`           bigint(20)          NOT NULL auto_increment,
          `startTime`                   timestamp           NOT NULL default '0000-00-00 00:00:00',
          `endTime`                     timestamp           NOT NULL default '0000-00-00 00:00:00',
          `idAccountingResourceType`    tinyint(4)          NOT NULL,
          `resourceType`                int(20)             NOT NULL,
          `resourceUnits`               bigint(20)          NOT NULL,
          `resourceName`                int(20)             NOT NULL,
          `idEnterprise`                int(11) unsigned    NOT NULL,
          `idVirtualDataCenter`         int(11) unsigned    NOT NULL,
          `idVirtualApp`                int(11) unsigned    default NULL,
          `idVirtualMachine`            int(11) unsigned    default NULL,
          `costCode`                    int(4)              default NULL,
          `idStorageTier`               int(10)             default NULL,
          `version_c`                   int(11)             default '0',
          PRIMARY KEY  (`idAccountingEvent`)
        ) ENGINE=InnoDB
        AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
    END IF;

    # Refined version of the 'old' accounting table, removing duplicated string data and column references...
	IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='accounting_parameters') THEN
        SELECT "Creating table - kinton_accounting.accounting_parameters" as " ";
        CREATE TABLE kinton_accounting.accounting_parameters(
            idParam     INT(5)          NOT NULL AUTO_INCREMENT,
            paramName   VARCHAR(64)     NOT NULL,
            paramValue  VARCHAR(511)    NOT NULL,
            PRIMARY KEY (idParam),
            CONSTRAINT UNIQUE unique_param (paramName)
        ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

        # Populate up the default table param values, too...
        SELECT "Populating intial kinton_accounting.accounting_parameters" as " ";
        INSERT INTO kinton_accounting.accounting_parameters(paramName, paramValue) VALUES('AccountingEnabled', 1);
        INSERT INTO kinton_accounting.accounting_parameters(paramName, paramValue) VALUES('DeleteRegEventsUseSPParam', 0);
        INSERT INTO kinton_accounting.accounting_parameters(paramName, paramValue) VALUES('DeleteRegEventsDeleteHours', 2160); # 90 days by default...
    END IF;
END;
|
DELIMITER ;

# Now invoke the SP
CALL kinton.accounting_optimizations();

# And on successful completion, remove the SP, so we are not cluttering the DBMS with upgrade code!
DROP PROCEDURE IF EXISTS kinton.accounting_optimizations;



# Helper stored procedures used to access the name tables...
SELECT "Creating name table helper FUNCTIONs..." as " ";

DROP FUNCTION IF EXISTS kinton_accounting.ABQ_OBJECT_NAME_TO_ID;
DELIMITER |
CREATE FUNCTION kinton_accounting.ABQ_OBJECT_NAME_TO_ID (objName VARCHAR(511))
  RETURNS INT
   DETERMINISTIC
    BEGIN
     DECLARE id INT;
     SELECT idObject INTO id FROM kinton_accounting.object_name o WHERE o.objectName=objName;
     IF id IS NULL THEN
        INSERT INTO kinton_accounting.object_name (objectName, startTime) VALUES (objName, now());
        SELECT LAST_INSERT_ID() INTO id;
     END IF;
     RETURN id;
    END|
DELIMITER ;

DROP FUNCTION IF EXISTS kinton_accounting.ABQ_OBJECT_ID_TO_NAME;
DELIMITER |
CREATE FUNCTION kinton_accounting.ABQ_OBJECT_ID_TO_NAME (idObj INT)
  RETURNS VARCHAR(511)
   DETERMINISTIC
    BEGIN
     DECLARE objName VARCHAR(511);
     SELECT objectName INTO objName FROM kinton_accounting.object_name o WHERE o.idObject=idObj;
     RETURN objName;
    END|
DELIMITER ;

DROP FUNCTION IF EXISTS kinton_accounting.ABQ_ADD_ENT_NAME;
DELIMITER |
CREATE FUNCTION kinton_accounting.ABQ_ADD_ENT_NAME(id INT(10), eName VARCHAR(40))
  RETURNS INT
   DETERMINISTIC
    BEGIN
        DECLARE nameInDB VARCHAR(40);
        IF id IS NOT NULL THEN
            SELECT enterpriseName INTO nameInDB FROM kinton_accounting.ent_name WHERE idEnterprise=id;
            IF nameInDB IS NULL THEN
                INSERT INTO kinton_accounting.ent_name (idEnterprise, enterpriseName, startTime) VALUES (id, eName, now());
            END IF;
        END IF;
        IF nameInDB <> eName THEN
            UPDATE kinton_accounting.ent_name SET enterpriseName=eName WHERE idEnterprise=id;
        END IF;
        RETURN id;
    END|
DELIMITER ;

DROP FUNCTION IF EXISTS kinton_accounting.ABQ_ENT_ID_TO_NAME;
DELIMITER |
CREATE FUNCTION kinton_accounting.ABQ_ENT_ID_TO_NAME (id INT)
  RETURNS VARCHAR(40)
   DETERMINISTIC
    BEGIN
     DECLARE entName VARCHAR(40);
     SELECT enterpriseName INTO entName FROM kinton_accounting.ent_name e WHERE e.idEnterprise=id;
     RETURN entName;
    END|
DELIMITER ;

DROP FUNCTION IF EXISTS kinton_accounting.ABQ_ADD_VDC_NAME;
DELIMITER |
CREATE FUNCTION kinton_accounting.ABQ_ADD_VDC_NAME(id INT(10), vName VARCHAR(40))
  RETURNS INT
   DETERMINISTIC
    BEGIN
        DECLARE nameInDB VARCHAR(40);
        IF id IS NOT NULL THEN
            SELECT vdcName INTO nameInDB FROM kinton_accounting.vdc_name WHERE idVirtualDataCenter=id;
            IF nameInDB IS NULL THEN
                INSERT INTO kinton_accounting.vdc_name (idVirtualDataCenter, vdcName, startTime) VALUES (id, vName, now());
            END IF;
        END IF;
        IF nameInDB <> vName THEN
            UPDATE kinton_accounting.vdc_name SET vdcName=vName WHERE idVirtualDataCenter=id;
        END IF;
        RETURN id;
    END|
DELIMITER ;

DROP FUNCTION IF EXISTS kinton_accounting.ABQ_VDC_ID_TO_NAME;
DELIMITER |
CREATE FUNCTION kinton_accounting.ABQ_VDC_ID_TO_NAME (id INT)
  RETURNS VARCHAR(40)
   DETERMINISTIC
    BEGIN
     DECLARE vName VARCHAR(40);
     SELECT vdcName INTO vName FROM kinton_accounting.vdc_name v WHERE v.idVirtualDataCenter=id;
     RETURN vName;
    END|
DELIMITER ;

DROP FUNCTION IF EXISTS kinton_accounting.ABQ_ADD_VAPP_NAME;
DELIMITER |
CREATE FUNCTION kinton_accounting.ABQ_ADD_VAPP_NAME(id INT(10), vName VARCHAR(40))
  RETURNS INT
   DETERMINISTIC
    BEGIN
        DECLARE nameInDB VARCHAR(40);
        IF id IS NOT NULL THEN
            SELECT vappName INTO nameInDB FROM kinton_accounting.vapp_name WHERE idVirtualApp=id;
            IF nameInDB IS NULL THEN
                INSERT INTO kinton_accounting.vapp_name (idVirtualApp, vappName, startTime) VALUES (id, vName, now());
            END IF;
        END IF;
        IF nameInDB <> vName THEN
            UPDATE kinton_accounting.vapp_name SET vappName=vName WHERE idVirtualApp=id;
        END IF;
        RETURN id;
    END|
DELIMITER ;

DROP FUNCTION IF EXISTS kinton_accounting.ABQ_VAPP_ID_TO_NAME;
DELIMITER |
CREATE FUNCTION kinton_accounting.ABQ_VAPP_ID_TO_NAME (id INT)
  RETURNS VARCHAR(40)
   DETERMINISTIC
    BEGIN
     DECLARE vName VARCHAR(40);
     SELECT vappName INTO vName FROM kinton_accounting.vapp_name v WHERE v.idVirtualApp=id;
     RETURN vName;
    END|
DELIMITER ;

DROP FUNCTION IF EXISTS kinton_accounting.ABQ_ADD_VM_NAME;
DELIMITER |
CREATE FUNCTION kinton_accounting.ABQ_ADD_VM_NAME(id INT(10), vName VARCHAR(255))
  RETURNS INT
   DETERMINISTIC
    BEGIN
        DECLARE nameInDB VARCHAR(255);
        IF id IS NOT NULL THEN
            SELECT vmName INTO nameInDB FROM kinton_accounting.vm_name WHERE idVM=id;
            IF nameInDB IS NULL THEN
                INSERT INTO kinton_accounting.vm_name (idVM, vmName, startTime) VALUES (id, vName, now());
            END IF;
        END IF;
        IF nameInDB <> vName THEN
            UPDATE kinton_accounting.vm_name SET vmName=vName WHERE idVM=id;
        END IF;
        RETURN id;
    END|
DELIMITER ;

DROP FUNCTION IF EXISTS kinton_accounting.ABQ_VM_ID_TO_NAME;
DELIMITER |
CREATE FUNCTION kinton_accounting.ABQ_VM_ID_TO_NAME(id INT)
  RETURNS VARCHAR(255)
   DETERMINISTIC
    BEGIN
     DECLARE vName VARCHAR(255);
     SELECT vmName INTO vName FROM kinton_accounting.vm_name v WHERE v.idVM=id;
     RETURN vName;
    END|
DELIMITER ;



# Once we have the TABLES and supporting functions in place we insert the 
# existing accounting data into the new optimized table.   We do this prior
# to creating the new UpdateAccounting SP, so we are sure that nothing else gets
# into the new table until this INSERT has completed...
DROP PROCEDURE IF EXISTS kinton_accounting.migrate_accounting_data;
DELIMITER |
CREATE PROCEDURE kinton_accounting.migrate_accounting_data() 
BEGIN
    SELECT COUNT(*) INTO @migratedCount FROM kinton_accounting.accounting_event_detail;
    IF @migratedCount = 0 THEN
        SELECT "Copying existing accounting data into optimized tables (might take a while!)..." as " ";

        INSERT INTO kinton_accounting.accounting_event_detail
            (   startTime, endTime,
                idAccountingResourceType, resourceType, resourceUnits, resourceName, 
                idEnterprise, idVirtualDataCenter, idVirtualApp, idVirtualMachine,
                costCode, idStorageTier, version_c
            )
            SELECT
                startTime, endTime,
                idAccountingResourceType, kinton_accounting.ABQ_OBJECT_NAME_TO_ID(resourceType),
                resourceUnits, kinton_accounting.ABQ_OBJECT_NAME_TO_ID(resourceName), 
                kinton_accounting.ABQ_ADD_ENT_NAME(idEnterprise, enterpriseName),
                kinton_accounting.ABQ_ADD_VDC_NAME(idVirtualDataCenter, virtualDataCenter),
                kinton_accounting.ABQ_ADD_VAPP_NAME(idVirtualApp, virtualApp),
                kinton_accounting.ABQ_ADD_VM_NAME(idVirtualMachine, virtualMachine),
                IF(idAccountingResourceType=1,costCode,NULL),
                idStorageTier, version_c    
            FROM
            (
                SELECT 
                    `accounting_event_detail`.`startTime`  AS `startTime`,
                    `accounting_event_detail`.`endTime` AS `endTime`,
                    `accounting_event_detail`.`idAccountingResourceType` AS `idAccountingResourceType`,
                    `accounting_event_detail`.`resourceType` AS `resourceType`,
                    `accounting_event_detail`.`resourceName` AS `resourceName`,
                    MAX(`accounting_event_detail`.`resourceUnits`)  AS `resourceUnits`, # Use the max resources reported in the hour, where multiple entries exist!
                    `accounting_event_detail`.`idEnterprise` AS `idEnterprise`,
                    `accounting_event_detail`.`idVirtualDataCenter` AS `idVirtualDataCenter`,
                    `accounting_event_detail`.`idVirtualApp` AS `idVirtualApp`,
                    `accounting_event_detail`.`idVirtualMachine` AS `idVirtualMachine`,
                    `accounting_event_detail`.`enterpriseName` AS `enterpriseName`,
                    `accounting_event_detail`.`virtualDataCenter` AS `virtualDataCenter`,
                    `accounting_event_detail`.`virtualApp` AS `virtualApp`,
                    `accounting_event_detail`.`virtualMachine` AS `virtualMachine`,
                    `accounting_event_detail`.`costCode` AS `costCode`,
                    `accounting_event_detail`.`idStorageTier` AS `idStorageTier`,
                    version_c
                FROM kinton.`accounting_event_detail`
                GROUP BY 
                    `accounting_event_detail`.`startTime`,
                    `accounting_event_detail`.`endTime`,
                    `accounting_event_detail`.`idAccountingResourceType`,
                    `accounting_event_detail`.`resourceName`,
                    `accounting_event_detail`.`idEnterprise`,
                    `accounting_event_detail`.`idVirtualDataCenter`,
                    `accounting_event_detail`.`idVirtualApp`,
                    `accounting_event_detail`.`idVirtualMachine`,
                    `accounting_event_detail`.`costCode`
            ) TMP_HOURLY_USAGE_MAX_VW_EXTENDED;

        SELECT "Copy of existing accounting data complete!" as " ";
    ELSE
        SELECT "kinton_accounting.accounting_event_detail already contains data, so data migration was skipped!" as " ";
    END IF;
END;
|
DELIMITER ;

# Now invoke the SP to migrate the data...
CALL kinton_accounting.migrate_accounting_data();

# And on successful completion, remove the SP, so we are not cluttering the DBMS with upgrade code!
DROP PROCEDURE IF EXISTS kinton_accounting.migrate_accounting_data;


SELECT "Creating new accouting stored procedures..." as " ";
DROP PROCEDURE IF EXISTS kinton_accounting.CreateTMPEventTables;
DELIMITER |
CREATE PROCEDURE `kinton_accounting`.`CreateTMPEventTables`()
    NOT DETERMINISTIC
    SQL SECURITY DEFINER
BEGIN
    CREATE TEMPORARY TABLE kinton_accounting.tmp_vm_events_period (
        `idVMAccountingEvent`   BIGINT(20)  UNSIGNED    NOT NULL AUTO_INCREMENT,
        `idVM`                  INTEGER(10) UNSIGNED    NOT NULL,
        `idEnterprise`          INTEGER(10) UNSIGNED    NOT NULL,
        `idVirtualDataCenter`   INTEGER(10) UNSIGNED    NOT NULL,
        `idVirtualApp`          INTEGER(10) UNSIGNED    NOT NULL,
        `cpu`                   INTEGER(10) UNSIGNED    NOT NULL,
        `ram`                   INTEGER(10) UNSIGNED    NOT NULL,
        `hd`                    BIGINT(20) UNSIGNED     NOT NULL,
        `startTime`             TIMESTAMP               NULL,
        `stopTime`              TIMESTAMP               NULL,
        `costCode`              INT(10)                 DEFAULT NULL,
        `hypervisorType`        VARCHAR(255)            DEFAULT NULL,
        `DELTA_TIME`            INTEGER(10)             NULL,
        `PERIOD_START`          TIMESTAMP               NOT NULL,
        `PERIOD_END`            TIMESTAMP               NOT NULL,
        `VIRTUAL_MACHINE`       VARCHAR(255),
        `VIRTUAL_APP`           VARCHAR(255),
        `VIRTUAL_DATACENTER`    VARCHAR(255),
        `VIRTUAL_ENTERPRISE`    VARCHAR(255),
        PRIMARY KEY (`idVMAccountingEvent`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

    CREATE TEMPORARY TABLE kinton_accounting.tmp_storage_events_period (
        `idStorageAccountingEvent`  BIGINT(20) UNSIGNED     NOT NULL,
        `idResource`                VARCHAR(50)             DEFAULT NULL,
        `resourceName`              VARCHAR(511)            DEFAULT NULL,
        `idVM`                      INTEGER(10) unsigned    NULL,
        `idStorageTier`             INTEGER(10) UNSIGNED    NULL,
        `idEnterprise`              INTEGER(10) UNSIGNED    NOT NULL,
        `idVirtualDataCenter`       INTEGER(10) UNSIGNED    NOT NULL,
        `idVirtualApp`              INTEGER(10) UNSIGNED    NULL,
        `sizeReserved`              BIGINT UNSIGNED         NOT NULL, -- SELECT limitResource INTO limitResourceObj FROM rasd r
        `startTime`                 TIMESTAMP               NULL,
        `stopTime`                  TIMESTAMP               NULL,
        `DELTA_TIME`                INTEGER(10)             NULL,
        `PERIOD_START`              TIMESTAMP               NOT NULL,
        `PERIOD_END`                TIMESTAMP               NOT NULL,
        `VIRTUAL_DATACENTER`        VARCHAR(255),
        `VIRTUAL_ENTERPRISE`        VARCHAR(255),
        PRIMARY KEY (`idStorageAccountingEvent`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

    CREATE TEMPORARY TABLE kinton_accounting.tmp_ips_events_period (
        `idIPsAccountingEvent`      BIGINT(20) UNSIGNED     NOT NULL,
        `idEnterprise`              INTEGER(10) UNSIGNED    NOT NULL,
        `idVirtualDataCenter`       INTEGER(10) UNSIGNED    NOT NULL,
        `ip`                        VARCHAR(20)             NOT NULL,
        `startTime`                 TIMESTAMP               NULL,
        `stopTime`                  TIMESTAMP               NULL,
        `DELTA_TIME`                INTEGER(10)             NULL,
        `PERIOD_START`              TIMESTAMP               NOT NULL,
        `PERIOD_END`                TIMESTAMP               NOT NULL,
        `VIRTUAL_DATACENTER`        VARCHAR(255),
        `VIRTUAL_ENTERPRISE`        VARCHAR(255),
        PRIMARY KEY (`idIPsAccountingEvent`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

    CREATE TEMPORARY TABLE kinton_accounting.tmp_vlan_events_period (
        `idVLANAccountingEvent`     BIGINT(20) UNSIGNED     NOT NULL,
        `idEnterprise`              INTEGER(10) UNSIGNED    NOT NULL,
        `idVirtualDataCenter`       INTEGER(10) UNSIGNED    NOT NULL,
        `networkName`               VARCHAR(40)             NOT NULL,
        `startTime`                 TIMESTAMP               NULL,
        `stopTime`                  TIMESTAMP               NULL,
        `DELTA_TIME`                INTEGER(10)             NULL,
        `PERIOD_START`              TIMESTAMP               NOT NULL,
        `PERIOD_END`                TIMESTAMP               NOT NULL,
        `VIRTUAL_DATACENTER`        VARCHAR(255),
        `VIRTUAL_ENTERPRISE`        VARCHAR(255),
        PRIMARY KEY (`idVLANAccountingEvent`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

END|
DELIMITER ;


DROP PROCEDURE IF EXISTS kinton_accounting.DropTMPEventTables;
DELIMITER |
CREATE PROCEDURE `kinton_accounting`.`DropTMPEventTables`()
    NOT DETERMINISTIC
    SQL SECURITY DEFINER
BEGIN
    DROP TEMPORARY TABLE kinton_accounting.tmp_vm_events_period;
    DROP TEMPORARY TABLE kinton_accounting.tmp_storage_events_period;
    DROP TEMPORARY TABLE kinton_accounting.tmp_ips_events_period;
    DROP TEMPORARY TABLE kinton_accounting.tmp_vlan_events_period;
END|
DELIMITER ;


DROP PROCEDURE IF EXISTS kinton_accounting.PopulateTMPEventTables;
DELIMITER |
CREATE PROCEDURE `kinton_accounting`.`PopulateTMPEventTables`(IN period_start TIMESTAMP, IN period_secs INT(8) UNSIGNED)
    NOT DETERMINISTIC
    SQL SECURITY DEFINER
BEGIN
    DECLARE period_end TIMESTAMP;

    SELECT TIMESTAMPADD(SECOND,period_secs,period_start) INTO period_end;

    # LAST_HOUR_USAGE_VM_VW
    INSERT INTO tmp_vm_events_period (  idVMAccountingEvent, idVM, idEnterprise, idVirtualDataCenter, idVirtualApp,
                                        cpu, ram, hd, startTime, stopTime, costCode, hypervisorType,
                                        DELTA_TIME, PERIOD_START, PERIOD_END, VIRTUAL_MACHINE, VIRTUAL_APP, VIRTUAL_DATACENTER, VIRTUAL_ENTERPRISE)
    SELECT
        `accounting_event_vm`.`idVMAccountingEvent` AS `idVMAccountingEvent`,
        `accounting_event_vm`.`idVM` AS `idVM`,
        `accounting_event_vm`.`idEnterprise` AS `idEnterprise`,
        `accounting_event_vm`.`idVirtualDataCenter` AS `idVirtualDataCenter`,
        `accounting_event_vm`.`idVirtualApp` AS `idVirtualApp`,
        `accounting_event_vm`.`cpu` AS `cpu`,
        `accounting_event_vm`.`ram` AS `ram`,
        `accounting_event_vm`.`hd` AS `hd`,
        `accounting_event_vm`.`startTime` AS `startTime`,
        `accounting_event_vm`.`stopTime` AS `stopTime`,
        `accounting_event_vm`.`costCode` AS `costCode`,
        `accounting_event_vm`.`hypervisorType` AS `hypervisorType`,
        (UNIX_TIMESTAMP(`accounting_event_vm`.`stopTime`) - UNIX_TIMESTAMP(`accounting_event_vm`.`startTime`)) AS `DELTA_TIME`,
        period_start AS `PERIOD_START`, # was: `ROUNDED_HOUR`
        period_end AS `PERIOD_END`,
        CONCAT(IF(ISNULL(`virtualmachine`.`description`),_utf8'',substr(`virtualmachine`.`description`,1,120)),_utf8' - ',`virtualmachine`.`name`) AS `VIRTUAL_MACHINE`,
        `virtualapp`.`name` AS `VIRTUAL_APP`,
        `virtualdatacenter`.`name` AS `VIRTUAL_DATACENTER`,
        `enterprise`.`name` AS `VIRTUAL_ENTERPRISE`
    FROM
        kinton.`accounting_event_vm`
        JOIN kinton.`virtualmachine` on(`accounting_event_vm`.`idVM` = `virtualmachine`.`idVM`)
        JOIN kinton.`virtualapp` on(`accounting_event_vm`.`idVirtualApp` = `virtualapp`.`idVirtualApp`)
        JOIN kinton.`virtualdatacenter` on(`accounting_event_vm`.`idVirtualDataCenter` = `virtualdatacenter`.`idVirtualDataCenter`)
        JOIN kinton.`enterprise` on(`accounting_event_vm`.`idEnterprise` = `enterprise`.`idEnterprise`)
    WHERE
        # Is currently active, and was active prior to the end of the account period
        (`accounting_event_vm`.`startTime` <= period_end AND `accounting_event_vm`.`stopTime` IS NULL) OR
        # OR stopped running during the account period
        ((`accounting_event_vm`.stopTime >= period_start) AND (`accounting_event_vm`.stopTime < period_end));

    # LAST_HOUR_USAGE_STORAGE_VW
    INSERT INTO tmp_storage_events_period ( idStorageAccountingEvent, idResource, resourceName, idVM, idStorageTier,
                                            idEnterprise, idVirtualDataCenter, idVirtualApp, sizeReserved,
                                            startTime, stopTime, 
                                            DELTA_TIME, PERIOD_START, PERIOD_END, VIRTUAL_DATACENTER, VIRTUAL_ENTERPRISE)
    SELECT 
        `accounting_event_storage`.idStorageAccountingEvent AS idStorageAccountingEvent,
        `accounting_event_storage`.idResource AS idResource,
        `accounting_event_storage`.resourceName AS resourceName,
        `accounting_event_storage`.idVM AS idVM,
        `accounting_event_storage`.idStorageTier AS idStorageTier,
        `accounting_event_storage`.idEnterprise AS idEnterprise,
        `accounting_event_storage`.idVirtualDataCenter AS idVirtualDataCenter,
        `accounting_event_storage`.idVirtualApp AS idVirtualApp,
        `accounting_event_storage`.sizeReserved AS sizeReserved,    
        `accounting_event_storage`.startTime AS startTime,
        `accounting_event_storage`.stopTime AS stopTime,
        (UNIX_TIMESTAMP(`accounting_event_storage`.stopTime) - UNIX_TIMESTAMP(`accounting_event_storage`.startTime)) AS `DELTA_TIME`,
        period_start AS `PERIOD_START`, # was: `ROUNDED_HOUR`,
        period_end AS `PERIOD_END`,
        `virtualdatacenter`.`name` AS `VIRTUAL_DATACENTER`,
        `enterprise`.`name` AS `VIRTUAL_ENTERPRISE` 
     FROM 
        kinton.`accounting_event_storage`
        JOIN kinton.`virtualdatacenter` ON(`accounting_event_storage`.idVirtualDataCenter = `virtualdatacenter`.`idVirtualDataCenter`)
        JOIN kinton.`enterprise` ON(`accounting_event_storage`.idEnterprise = `enterprise`.`idEnterprise`) 
     WHERE 
        # Is currently active, and was active prior to the end of the account period
        (`accounting_event_storage`.`startTime` <= period_end AND `accounting_event_storage`.stopTime IS NULL) OR
        # OR stopped running during the account period
        ((`accounting_event_storage`.stopTime >= period_start) AND (`accounting_event_storage`.stopTime < period_end));


    # LAST_HOUR_USAGE_IPS_VW
    INSERT INTO tmp_ips_events_period ( idIPsAccountingEvent, idEnterprise, idVirtualDataCenter,
                                        ip, startTime, stopTime, 
                                        DELTA_TIME, PERIOD_START, PERIOD_END, VIRTUAL_DATACENTER, VIRTUAL_ENTERPRISE)
    SELECT 
        `accounting_event_ips`.idIPsAccountingEvent AS idIPsAccountingEvent,
        `accounting_event_ips`.idEnterprise AS idEnterprise,
        `accounting_event_ips`.idVirtualDataCenter AS idVirtualDataCenter,
        `accounting_event_ips`.ip AS ip,    
        `accounting_event_ips`.startTime AS startTime,
        `accounting_event_ips`.stopTime AS stopTime,
        (unix_timestamp(`accounting_event_ips`.stopTime) - unix_timestamp(`accounting_event_ips`.startTime)) AS `DELTA_TIME`,
        period_start AS `PERIOD_START`, # was: `ROUNDED_HOUR`,
        period_end AS `PERIOD_END`,
        `virtualdatacenter`.`name` AS `VIRTUAL_DATACENTER`,
        `enterprise`.`name` AS `VIRTUAL_ENTERPRISE` 
    FROM 
        kinton.`accounting_event_ips`
        JOIN kinton.`virtualdatacenter`ON (`accounting_event_ips`.idVirtualDataCenter = `virtualdatacenter`.`idVirtualDataCenter`)
        JOIN kinton.`enterprise` ON (`accounting_event_ips`.idEnterprise = `enterprise`.`idEnterprise`) 
    WHERE
        # IP Is currently RESERVED, and was reserved prior to the end of the account period
        (`accounting_event_ips`.`startTime` <= period_end AND `accounting_event_ips`.stopTime IS NULL) OR
        # IP stopped being reserved during the account period
        ((`accounting_event_ips`.stopTime >= period_start) AND (`accounting_event_ips`.stopTime < period_end));


    # LAST_HOUR_USAGE_VLAN_VW
    INSERT INTO tmp_vlan_events_period ( idVLANAccountingEvent, idEnterprise, idVirtualDataCenter,
                                        networkName, startTime, stopTime, 
                                        DELTA_TIME, PERIOD_START, PERIOD_END, VIRTUAL_DATACENTER, VIRTUAL_ENTERPRISE)
    SELECT 
        `accounting_event_vlan`.idVLANAccountingEvent AS idVLANAccountingEvent,
        `accounting_event_vlan`.idEnterprise AS idEnterprise,
        `accounting_event_vlan`.idVirtualDataCenter AS idVirtualDataCenter,
        `accounting_event_vlan`.network_name AS networkName,    
        `accounting_event_vlan`.startTime AS startTime,
        `accounting_event_vlan`.stopTime AS stopTime,
        (unix_timestamp(`accounting_event_vlan`.stopTime) - unix_timestamp(`accounting_event_vlan`.startTime)) AS `DELTA_TIME`,
        period_start AS `PERIOD_START`, # was: `ROUNDED_HOUR`,
        period_end AS `PERIOD_END`,
        `virtualdatacenter`.`name` AS `VIRTUAL_DATACENTER`,
        `enterprise`.`name` AS `VIRTUAL_ENTERPRISE` 
    FROM 
        kinton.`accounting_event_vlan`
        JOIN kinton.`virtualdatacenter` ON (`accounting_event_vlan`.idVirtualDataCenter = `virtualdatacenter`.`idVirtualDataCenter`)
        JOIN kinton.`enterprise` ON (`accounting_event_vlan`.idEnterprise = `enterprise`.`idEnterprise`)
    WHERE 
        # VLAN is still Reserved
        (`accounting_event_vlan`.`startTime` <= period_end AND `accounting_event_vlan`.stopTime IS NULL) OR
        # VLAN stopped being reserved during the account period
        ((`accounting_event_vlan`.stopTime >= period_start) AND (`accounting_event_vlan`.stopTime < period_end));
END|
DELIMITER ;


# This is the main SP called from the 'old' UpdateAccounting SP
DROP PROCEDURE IF EXISTS kinton_accounting.GenerateAccountingPeriodData;
DELIMITER |
CREATE PROCEDURE `kinton_accounting`.`GenerateAccountingPeriodData`(IN period_start TIMESTAMP, IN period_secs INT(8) UNSIGNED)
    NOT DETERMINISTIC
    SQL SECURITY DEFINER
BEGIN
    # First, check if we already have any data for this period, and do nothing if we already have data
    # Also - Verify the the accounting period is in the past and not current/future
    DECLARE period_end TIMESTAMP;
    SELECT TIMESTAMPADD(SECOND,period_secs,period_start) INTO period_end;

    SELECT COUNT(*) INTO @periodDataCount
        FROM `kinton_accounting`.`accounting_event_detail` 
        WHERE startTime=period_start AND endTime=period_end;

    IF ((@periodDataCount = 0) AND (NOW() > period_end)) THEN
        # Create a TMP table, which will store intermediate data, so we can write
        # the old style MAX_HOURLY data straight into the detail table
        CREATE TEMPORARY TABLE kinton_accounting.tmp_accounting_event_detail (
          `idAccountingEvent` bigint(20) NOT NULL auto_increment,
          `startTime` timestamp NOT NULL default '0000-00-00 00:00:00',
          `endTime` timestamp NOT NULL default '0000-00-00 00:00:00',
          `idAccountingResourceType` tinyint(4) NOT NULL,
          `resourceType` int(20) NOT NULL,
          `resourceUnits` bigint(20) NOT NULL,
          `resourceName` int(20) NOT NULL,
          `idEnterprise` int(11) unsigned NOT NULL,
          `idVirtualDataCenter` int(11) unsigned NOT NULL,
          `idVirtualApp` int(11) unsigned default NULL,
          `idVirtualMachine` int(11) unsigned default NULL,
          `costCode` int(4) default NULL,
          `idStorageTier` int(10) default NULL,
          `version_c` int(11) default '0',
          PRIMARY KEY  (`idAccountingEvent`)
        ) ENGINE=InnoDB
        AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

        # Create & populate TMP copies of the event tables which contain only data
        # pertaining to the account period we are processing
        CALL kinton_accounting.CreateTMPEventTables();
        CALL kinton_accounting.PopulateTMPEventTables(period_start, period_secs);

        # Now INSERT the raw period event data into the TMP detail table
        -- For VM Resources Accounting
        INSERT INTO kinton_accounting.tmp_accounting_event_detail(
          `startTime`,
          `endTime`, 
          `idAccountingResourceType`,
          `resourceType`,
          `resourceUnits`,
          `resourceName`, 
          `idEnterprise`, 
          `idVirtualDataCenter`, 
          `idVirtualApp`, 
          `idVirtualMachine`, 
          `costCode`,
          `idStorageTier`)
        SELECT DISTINCT
              T.`PERIOD_START`,
              T.`PERIOD_END`,
              1,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID('VirtualMachine-vcpu'),
              T.cpu,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.`VIRTUAL_MACHINE`),
              kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
              kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
              kinton_accounting.ABQ_ADD_VAPP_NAME(T.`idVirtualApp`, T.`VIRTUAL_APP`),
              kinton_accounting.ABQ_ADD_VM_NAME(T.`idVM`, T.`VIRTUAL_MACHINE`),
              T.`costCode`,
              NULL
        FROM kinton_accounting.tmp_vm_events_period T;

        INSERT INTO kinton_accounting.tmp_accounting_event_detail(
          `startTime`,
          `endTime`, 
          `idAccountingResourceType`,
          `resourceType`,
          `resourceUnits`,
          `resourceName`, 
          `idEnterprise`, 
          `idVirtualDataCenter`, 
          `idVirtualApp`, 
          `idVirtualMachine`, 
          `costCode`,
          `idStorageTier`)
        SELECT DISTINCT
              T.`PERIOD_START`,
              T.`PERIOD_END`,
              2,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID('VirtualMachine-vram'),
              T.`ram`,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.`VIRTUAL_MACHINE`),
              kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
              kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
              kinton_accounting.ABQ_ADD_VAPP_NAME(T.`idVirtualApp`, T.`VIRTUAL_APP`),
              kinton_accounting.ABQ_ADD_VM_NAME(T.`idVM`, T.`VIRTUAL_MACHINE`),
              NULL,
              NULL
        FROM kinton_accounting.tmp_vm_events_period T;

        INSERT INTO kinton_accounting.tmp_accounting_event_detail(
          `startTime`,
          `endTime`, 
          `idAccountingResourceType`,
          `resourceType`,
          `resourceUnits`,
          `resourceName`, 
          `idEnterprise`, 
          `idVirtualDataCenter`, 
          `idVirtualApp`, 
          `idVirtualMachine`, 
          `costCode`,
          `idStorageTier`)
        SELECT DISTINCT
              T.`PERIOD_START`,
              T.`PERIOD_END`,
              3,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID('VirtualMachine-vhd'),
              T.`hd`,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.`VIRTUAL_MACHINE`),
              kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
              kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
              kinton_accounting.ABQ_ADD_VAPP_NAME(T.`idVirtualApp`, T.`VIRTUAL_APP`),
              kinton_accounting.ABQ_ADD_VM_NAME(T.`idVM`, T.`VIRTUAL_MACHINE`),
              NULL,
              NULL
        FROM kinton_accounting.tmp_vm_events_period T;

        -- Storage
        INSERT INTO kinton_accounting.tmp_accounting_event_detail(
          `startTime`,
          `endTime`, 
          `idAccountingResourceType`,
          `resourceType`,
          `resourceUnits`,
          `resourceName`, 
          `idEnterprise`, 
          `idVirtualDataCenter`, 
          `idVirtualApp`, 
          `idVirtualMachine`, 
          `costCode`,
          `idStorageTier`)
        SELECT DISTINCT
              T.`PERIOD_START`,
              T.`PERIOD_END`,
              4,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID('ExternalStorage'),
              T.`sizeReserved`,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID(CONCAT(IF (T.`resourceName` IS NULL, '', T.`resourceName`), ' - ', T.`idResource`)),
              kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
              kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
              NULL,
              NULL, 
              NULL,
              T.`idStorageTier`
        FROM kinton_accounting.tmp_storage_events_period T;

        -- IP
        INSERT INTO kinton_accounting.tmp_accounting_event_detail(
          `startTime`,
          `endTime`, 
          `idAccountingResourceType`,
          `resourceType`,
          `resourceUnits`,
          `resourceName`, 
          `idEnterprise`, 
          `idVirtualDataCenter`, 
          `idVirtualApp`, 
          `idVirtualMachine`, 
          `costCode`,
          `idStorageTier`)
        SELECT DISTINCT
              T.`PERIOD_START`,
              T.`PERIOD_END`,
              5,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID('IPAddress'),
              1,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.`ip`),
              kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
              kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
              NULL,
              NULL, 
              NULL,
              NULL
        FROM kinton_accounting.tmp_ips_events_period T;

        -- VLAN
        INSERT INTO kinton_accounting.tmp_accounting_event_detail(
          `startTime`,
          `endTime`, 
          `idAccountingResourceType`,
          `resourceType`,
          `resourceUnits`,
          `resourceName`, 
          `idEnterprise`, 
          `idVirtualDataCenter`, 
          `idVirtualApp`, 
          `idVirtualMachine`, 
          `costCode`,
          `idStorageTier`)
        SELECT DISTINCT
              T.`PERIOD_START`,
              T.`PERIOD_END`,
              6,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID('VLAN'),
              1,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.`networkName`),
              kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
              kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
              NULL,
              NULL, 
              NULL,
              NULL
        FROM kinton_accounting.tmp_vlan_events_period T;

        -- Hypervisor Type
        INSERT INTO kinton_accounting.tmp_accounting_event_detail(
          `startTime`,
          `endTime`, 
          `idAccountingResourceType`,
          `resourceType`,
          `resourceUnits`,
          `resourceName`, 
          `idEnterprise`, 
          `idVirtualDataCenter`, 
          `idVirtualApp`, 
          `idVirtualMachine`, 
          `costCode`,
          `idStorageTier`)
        SELECT DISTINCT
              T.`PERIOD_START`,
              T.`PERIOD_END`,
              7,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID('VirtualMachine-hypervisorType'),
              1,
              kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.hypervisorType),
              kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
              kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
              kinton_accounting.ABQ_ADD_VAPP_NAME(T.`idVirtualApp`, T.`VIRTUAL_APP`),
              kinton_accounting.ABQ_ADD_VM_NAME(T.`idVM`, T.`VIRTUAL_MACHINE`),
              NULL,
              NULL
        FROM kinton_accounting.tmp_vm_events_period T;

        # And INSERT the MAX_HOURLY data into the new detail table, using the TMP table data
        # as the source...
        INSERT INTO `kinton_accounting`.`accounting_event_detail` 
            (startTime, endTime, idAccountingResourceType, resourceType, resourceUnits, resourceName,
             idEnterprise, idVirtualDataCenter, idVirtualApp, idVirtualMachine,
             costCode, idStorageTier)
        SELECT
            startTime, endTime, idAccountingResourceType, resourceType, resourceUnits, resourceName,
            idEnterprise, idVirtualDataCenter, idVirtualApp, idVirtualMachine,
            costCode, idStorageTier
        FROM 
        (SELECT 
            acc.`startTime`  AS `startTime`,
            acc.`endTime` AS `endTime`,
            acc.`idAccountingResourceType` AS `idAccountingResourceType`,
            acc.`resourceType` AS `resourceType`,
            acc.`resourceName` AS `resourceName`,
            MAX(acc.`resourceUnits`)  AS `resourceUnits`,
            acc.`idEnterprise` AS `idEnterprise`,
            acc.`idVirtualDataCenter` AS `idVirtualDataCenter`,
            acc.`idVirtualApp` AS `idVirtualApp`,
            acc.`idVirtualMachine` AS `idVirtualMachine`,
            acc.`costCode` AS `costCode`,
            acc.`idStorageTier` AS `idStorageTier`
            FROM kinton_accounting.`tmp_accounting_event_detail` acc
            GROUP BY 
                acc.`startTime`,
                acc.`idAccountingResourceType`,
                acc.`resourceName`,
                acc.`idEnterprise`,
                acc.`idVirtualDataCenter`,
                acc.`idVirtualApp`,
                acc.`idVirtualMachine`,
                acc.`costCode`
        ) tmp_data;

        # Finally, clean up the TMP tables...
        CALL kinton_accounting.DropTMPEventTables();
        DROP TEMPORARY TABLE kinton_accounting.`tmp_accounting_event_detail`;
    END IF;
END|
DELIMITER ;




SELECT "Creating new optimised accounting VIEWs..." as " ";
# This is now the main view that should be be used to access accounting data...
DROP VIEW IF EXISTS kinton_accounting.HOURLY_USAGE_MAX_2_VW;
CREATE VIEW kinton_accounting.HOURLY_USAGE_MAX_2_VW
AS
SELECT
        a.startTime, a.endTime,
        idAccountingResourceType,
        kinton_accounting.ABQ_OBJECT_ID_TO_NAME(resourceType) AS resourceType,
        kinton_accounting.ABQ_OBJECT_ID_TO_NAME(resourceName) AS resourceName, 
        resourceUnits,
        a.idEnterprise, a.idVirtualDataCenter, a.idVirtualApp, a.idVirtualMachine,
        en.enterpriseName AS enterpriseName,
        vdcn.vdcName AS virtualDataCenter,
        vappn.vappName AS virtualApp,
        vmn.vmName AS virtualMachine,
        costCode, idStorageTier,
        cc.name AS costCodeName,
        t.name AS storageTierName
FROM kinton_accounting.accounting_event_detail a
LEFT JOIN kinton_accounting.ent_name en ON (a.idEnterprise=en.idEnterprise)
LEFT JOIN kinton_accounting.vdc_name vdcn ON (a.idVirtualDataCenter=vdcn.idVirtualDataCenter)
LEFT JOIN kinton_accounting.vapp_name vappn ON (a.idVirtualApp=vappn.idVirtualApp)
LEFT JOIN kinton_accounting.vm_name vmn ON (a.idVirtualMachine=vmn.idVM)
LEFT JOIN kinton.costCode cc ON (a.costCode=cc.idCostCode)
LEFT JOIN kinton.tier t ON (a.idStorageTier=t.id);

# This is now the main view that should be be used to access accounting data...
DROP VIEW IF EXISTS kinton_accounting.HOURLY_USAGE_MAX_VW;
CREATE VIEW kinton_accounting.HOURLY_USAGE_MAX_VW
AS
SELECT
        a.startTime, a.endTime,
        idAccountingResourceType,
        kinton_accounting.ABQ_OBJECT_ID_TO_NAME(resourceType) AS resourceType,
        kinton_accounting.ABQ_OBJECT_ID_TO_NAME(resourceName) AS resourceName, 
        resourceUnits,
        a.idEnterprise, a.idVirtualDataCenter, a.idVirtualApp, a.idVirtualMachine,
        en.enterpriseName AS enterpriseName,
        vdcn.vdcName AS virtualDataCenter,
        vappn.vappName AS virtualApp,
        vmn.vmName AS virtualMachine,
        costCode, idStorageTier
FROM kinton_accounting.accounting_event_detail a
LEFT JOIN kinton_accounting.ent_name en ON (a.idEnterprise=en.idEnterprise)
LEFT JOIN kinton_accounting.vdc_name vdcn ON (a.idVirtualDataCenter=vdcn.idVirtualDataCenter)
LEFT JOIN kinton_accounting.vapp_name vappn ON (a.idVirtualApp=vappn.idVirtualApp)
LEFT JOIN kinton_accounting.vm_name vmn ON (a.idVirtualMachine=vmn.idVM);


#
# Definition for the HOURLY_USAGE_SUM_VW view : 
#
DROP VIEW IF EXISTS kinton_accounting.HOURLY_USAGE_SUM_VW;
CREATE SQL SECURITY DEFINER VIEW kinton_accounting.HOURLY_USAGE_SUM_VW AS 
  SELECT 
    v.startTime AS startTime,
    v.endTime AS endTime,
    v.idAccountingResourceType AS idAccountingResourceType,
    v.resourceType AS resourceType,
    SUM(v.resourceUnits) AS resourceUnits,
    v.idEnterprise AS idEnterprise,
    v.idVirtualDataCenter AS idVirtualDataCenter,
    v.enterpriseName AS enterpriseName,
    v.virtualDataCenter AS virtualDataCenter 
  FROM
    kinton_accounting.HOURLY_USAGE_MAX_VW v 
  GROUP BY 
    v.startTime,
    v.idAccountingResourceType,
    v.idEnterprise, v.idVirtualDataCenter;


#
# Definition for the DAILY_USAGE_SUM_VW view : 
#
DROP VIEW IF EXISTS kinton_accounting.DAILY_USAGE_SUM_VW;
CREATE SQL SECURITY DEFINER VIEW kinton_accounting.DAILY_USAGE_SUM_VW AS 
	SELECT 
		CAST(a.startTime AS DATE) AS startTime,
		CAST(a.startTime AS DATE) AS endTime,
		a.idAccountingResourceType AS idAccountingResourceType,
		kinton_accounting.ABQ_OBJECT_ID_TO_NAME(a.resourceType) AS resourceType,
		SUM(a.resourceUnits) AS resourceUnits,
		a.idEnterprise AS idEnterprise,
		a.idVirtualDataCenter AS idVirtualDataCenter,
        en.enterpriseName AS enterpriseName,
        vdcn.vdcName AS virtualDataCenter
	FROM 
		kinton_accounting.accounting_event_detail a 
        LEFT JOIN kinton_accounting.ent_name en ON (a.idEnterprise=en.idEnterprise)
        LEFT JOIN kinton_accounting.vdc_name vdcn ON (a.idVirtualDataCenter=vdcn.idVirtualDataCenter)
	GROUP BY
        CAST(a.startTime AS DATE),
        a.idAccountingResourceType,
        a.idEnterprise, a.idVirtualDataCenter;

#
# Definition for the MONTHLY_USAGE_SUM_VW view : 
#
DROP VIEW IF EXISTS kinton_accounting.MONTHLY_USAGE_SUM_VW;
CREATE SQL SECURITY DEFINER VIEW kinton_accounting.MONTHLY_USAGE_SUM_VW AS 
	SELECT 
        CAST((a.startTime - INTERVAL (DAYOFMONTH(a.startTime) - 1) day) AS DATE) AS startTime,
        LAST_DAY(a.startTime) AS endTime,
        a.idAccountingResourceType AS idAccountingResourceType,
        kinton_accounting.ABQ_OBJECT_ID_TO_NAME(a.resourceType) AS resourceType,
        SUM(a.resourceUnits) AS resourceUnits,
        a.idEnterprise AS idEnterprise,
        a.idVirtualDataCenter AS idVirtualDataCenter,
        en.enterpriseName AS enterpriseName,
        vdcn.vdcName AS virtualDataCenter
    FROM 
        kinton_accounting.accounting_event_detail a 
        LEFT JOIN kinton_accounting.ent_name en ON (a.idEnterprise=en.idEnterprise)
        LEFT JOIN kinton_accounting.vdc_name vdcn ON (a.idVirtualDataCenter=vdcn.idVirtualDataCenter)
    GROUP BY
        CAST((a.startTime - INTERVAL (dayofmonth(a.startTime) - 1) day) AS DATE), 
        a.idAccountingResourceType,
        a.idEnterprise, a.idVirtualDataCenter;




#
#
# Finally, changes to the existing 'kinton' schema accounting objects.   We will use the existing 'UpdateAccounting' SP to launch the new
# accounting behaviour, and update the old objects to point to the new tables.
# We will also rename the old kinton accounting_event_detail table and create a new view with the same name, which points to the 'new'
# table
#
#
SELECT "Updating the old UpdateAccounting and DeleteOldRegisteredEvents stored procedures..." as " ";
-- 
-- UpdateAccounting
--
-- Inserts rows at accounting_event_detail based on Views defined for VMs, Storage and IPs events
-- 
DROP PROCEDURE IF EXISTS kinton.UpdateAccounting;
DELIMITER |
CREATE PROCEDURE `kinton`.`UpdateAccounting`()
    NOT DETERMINISTIC
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
    DECLARE accounting_enabled INT(1);

	IF EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='accounting_parameters') THEN
        # Get the parameters to determine which flavours of accounting are enabled...
        SELECT paramValue INTO accounting_enabled FROM kinton_accounting.accounting_parameters WHERE paramName='AccountingEnabled';
    ELSE
        # If no accounting parameter table exists, then we will not run any accounting...
        SELECT 0 INTO accounting_enabled;
    END IF;

    IF (accounting_enabled <> 0) THEN
        # The underlying SP now handles differing account period sizes, although other areas of prod only support 1 hour,
        # so we hard code that support for now...
        CALL kinton_accounting.GenerateAccountingPeriodData(
                    from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600))), # Period StartTime
                    3600                                                                            # Period Length (in seconds)
        );
    END IF;
END|
DELIMITER ;

-- 
-- DeleteOldRegisteredEvents
--
-- Auxiliar procedure to delete old rows from event registering tables
-- All events registered older than 'hours' parameter from now will be deleted
-- 
DROP PROCEDURE IF EXISTS `kinton`.DeleteOldRegisteredEvents;
DELIMITER |
CREATE PROCEDURE `kinton`.DeleteOldRegisteredEvents(    
IN hours INT(2) UNSIGNED)
BEGIN   
    DECLARE sp_param_enabled INT(1);
    DECLARE param_hours INT(8);

	IF EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='accounting_parameters') THEN
        # Get the parameters to determine which flavours of accounting are enabled...
        SELECT paramValue INTO sp_param_enabled FROM kinton_accounting.accounting_parameters WHERE paramName='DeleteRegEventsUseSPParam';
        SELECT paramValue INTO param_hours FROM kinton_accounting.accounting_parameters WHERE paramName='DeleteRegEventsDeleteHours';
    ELSE
        # If no accounting parameter table exists, then we default to legacy support...
        SELECT 1 INTO sp_param_enabled;
    END IF;

    IF (sp_param_enabled = 0) THEN
        # We should be using the DBMS stored value, not the one supplied to the SP
        SELECT param_hours INTO hours;
    END IF;

    DELETE FROM accounting_event_vm  WHERE stopTime < date_sub(NOW(), INTERVAL hours HOUR);
    DELETE FROM accounting_event_storage  WHERE stopTime < date_sub(NOW(), INTERVAL hours HOUR);
    DELETE FROM accounting_event_ips  WHERE stopTime < date_sub(NOW(), INTERVAL hours HOUR);
    DELETE FROM accounting_event_vlan  WHERE stopTime < date_sub(NOW(), INTERVAL hours HOUR);
END|
DELIMITER ;


#
# The views below are only suitable for existing customers, and ideally should not exist
# on a fresh install.   However, we will leave them in place, in case existing customers
# are performing a fresh install...
#

SELECT "Updating the old _VW views to point to the new schema views..." as " ";
#
# Definition for the HOURLY_USAGE_MAX_VW view: 
#
DROP VIEW IF EXISTS kinton.HOURLY_USAGE_MAX_VW;
CREATE SQL SECURITY DEFINER VIEW kinton.HOURLY_USAGE_MAX_VW AS 
	SELECT * FROM kinton_accounting.HOURLY_USAGE_MAX_VW;

#
# Definition for the HOURLY_USAGE_SUM_VW view : 
#
DROP VIEW IF EXISTS kinton.HOURLY_USAGE_SUM_VW;
CREATE SQL SECURITY DEFINER VIEW kinton.HOURLY_USAGE_SUM_VW AS 
	SELECT * FROM kinton_accounting.HOURLY_USAGE_SUM_VW;


#
# Definition for the DAILY_USAGE_SUM_VW view : 
#
DROP VIEW IF EXISTS kinton.DAILY_USAGE_SUM_VW;
CREATE SQL SECURITY DEFINER VIEW kinton.DAILY_USAGE_SUM_VW AS 
	SELECT * FROM kinton_accounting.DAILY_USAGE_SUM_VW;

#
# Definition for the MONTHLY_USAGE_SUM_VW view : 
#
DROP VIEW IF EXISTS kinton.MONTHLY_USAGE_SUM_VW;
CREATE SQL SECURITY DEFINER VIEW kinton.MONTHLY_USAGE_SUM_VW AS 
	SELECT * FROM kinton_accounting.MONTHLY_USAGE_SUM_VW;


#
# Now we will rename the existing accounting_event_detail table and replace it with a VIEW pointing to the
# new table...
#
DROP PROCEDURE IF EXISTS kinton_accounting.rename_detail_table;
DELIMITER |
CREATE PROCEDURE kinton_accounting.rename_detail_table() 
BEGIN
	IF EXISTS (SELECT * FROM information_schema.tables WHERE table_schema= 'kinton' AND table_name='accounting_event_detail' AND table_type <> 'VIEW') THEN
        SELECT "Renaming table - kinton.accounting_event_detail" as " ";
        ALTER TABLE kinton.accounting_event_detail RENAME TO kinton.accounting_event_detail_deprecated;
    END IF;
END;
|
DELIMITER ;

# Now invoke the SP...
CALL kinton_accounting.rename_detail_table();
# And on successful completion, remove the SP, so we are not cluttering the DBMS with upgrade code!
DROP PROCEDURE IF EXISTS kinton_accounting.rename_detail_table;

SELECT "Create a new view to replace the 'old' accounting_event_detail table..." as " ";
#
# Definition for the accounting_event_detail view (for compatibility purposes):
# Note : This is missing the 'unreferenced' version_c column at the end,
# as the view does not include it. 
#
DROP VIEW IF EXISTS kinton.accounting_event_detail;
CREATE SQL SECURITY DEFINER VIEW kinton.accounting_event_detail AS 
	SELECT * FROM kinton_accounting.HOURLY_USAGE_MAX_VW;

# Drop the old LAST_HOUR views...
SELECT "Removing the deprecated LAST_HOUR_ views..." as " ";
DROP VIEW IF EXISTS kinton.LAST_HOUR_USAGE_IPS_VW;
DROP VIEW IF EXISTS kinton.LAST_HOUR_USAGE_STORAGE_VW;
DROP VIEW IF EXISTS kinton.LAST_HOUR_USAGE_VLAN_VW;
DROP VIEW IF EXISTS kinton.LAST_HOUR_USAGE_VM_VW;
SELECT "Accounting upgrade complete!" as " ";
