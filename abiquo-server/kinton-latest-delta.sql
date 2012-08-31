--
-- Tables required by Liquibase
--

CREATE TABLE IF NOT EXISTS `kinton`.`DATABASECHANGELOG` (
  `ID` varchar(63) NOT NULL,
  `AUTHOR` varchar(63) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ;


CREATE TABLE IF NOT EXISTS `kinton`.`DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ;
-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: src/2.2/kinton-2.2.xml
-- Ran at: 8/14/12 2:09 AM
-- Against: root@10.60.20.42@jdbc:mysql://10.60.20.42:3306/kinton
-- Liquibase version: 2.0.3
-- *********************************************************************

-- Lock Database
-- Changeset src/2.2/kinton-2.2.xml::1336485500618-1::destevezg (generated)::(Checksum: 3:4441c84bd8a0fcebb40e9bb65aaf5191)
ALTER TABLE `kinton`.`pricingTemplate` ADD `memoryGB` DECIMAL(20,5) DEFAULT '0';

UPDATE pricingTemplate SET memoryGB = memoryMB/1024;

ALTER TABLE `kinton`.`pricingTemplate` DROP COLUMN `memoryMB`;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Column, Custom SQL, Drop Column', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-1', '2.0.3', '3:4441c84bd8a0fcebb40e9bb65aaf5191', 1);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-2::destevezg (generated)::(Checksum: 3:3e028861a9cd184465e4b26a3cfcb777)
ALTER TABLE `kinton`.`metering` MODIFY `user` VARCHAR(128) NOT NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Not-Null Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-2', '2.0.3', '3:3e028861a9cd184465e4b26a3cfcb777', 2);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-5::destevezg (generated)::(Checksum: 3:c79a9d931d4ba6ccb61f1169afba19a8)
ALTER TABLE `kinton`.`costCodeCurrency` ADD CONSTRAINT `idCurrency_FK` FOREIGN KEY (`idCurrency`) REFERENCES `kinton`.`currency` (`idCurrency`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-5', '2.0.3', '3:c79a9d931d4ba6ccb61f1169afba19a8', 3);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-7::destevezg (generated)::(Checksum: 3:5b51a053210935c51c948d0c7fa381dc)
ALTER TABLE `kinton`.`costCode` MODIFY `idCostCode` INT UNSIGNED AUTO_INCREMENT;

ALTER TABLE `kinton`.`pricingCostCode` ADD CONSTRAINT `pricingCostCode_FK2` FOREIGN KEY (`idPricingTemplate`) REFERENCES `kinton`.`pricingTemplate` (`idPricingTemplate`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Set Column as Auto-Increment, Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-7', '2.0.3', '3:5b51a053210935c51c948d0c7fa381dc', 4);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-8::destevezg (generated)::(Checksum: 3:18db5a13981a0ab6234d17f46e8eda05)
ALTER TABLE `kinton`.`pricingTier` ADD CONSTRAINT `pricingTier_FK2` FOREIGN KEY (`idPricingTemplate`) REFERENCES `kinton`.`pricingTemplate` (`idPricingTemplate`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-8', '2.0.3', '3:18db5a13981a0ab6234d17f46e8eda05', 5);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-9::destevezg (generated)::(Checksum: 3:51b22321576067fff7232c38f0ab65c8)
ALTER TABLE `kinton`.`pricingTier` ADD CONSTRAINT `pricingTier_FK1` FOREIGN KEY (`idTier`) REFERENCES `kinton`.`tier` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-9', '2.0.3', '3:51b22321576067fff7232c38f0ab65c8', 6);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-11::destevezg (generated)::(Checksum: 3:219c18769d18cef1d17381ba4a1bb5ce)
DROP TABLE `kinton`.`log`;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Table', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-11', '2.0.3', '3:219c18769d18cef1d17381ba4a1bb5ce', 7);

-- Changeset src/2.2/kinton-2.2.xml::1337940808955-1::destevezg (generated)::(Checksum: 3:6f998f6f3e1878a5b204ced6fe8c34e4)
ALTER TABLE `kinton`.`metering` MODIFY `user` VARCHAR(128) NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Not-Null Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1337940808955-1', '2.0.3', '3:6f998f6f3e1878a5b204ced6fe8c34e4', 8);

-- Changeset src/2.2/kinton-2.2.xml::1337940808955-5::destevezg (generated)::(Checksum: 3:6e1b2afc755e1e0933c651e6b5ee8eb7)
ALTER TABLE `kinton`.`costCodeCurrency` ADD CONSTRAINT `idCostCode_FK` FOREIGN KEY (`idCostCode`) REFERENCES `kinton`.`costCode` (`idCostCode`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1337940808955-5', '2.0.3', '3:6e1b2afc755e1e0933c651e6b5ee8eb7', 9);

-- Changeset src/2.2/kinton-2.2.xml::1337940808955-6::destevezg (generated)::(Checksum: 3:db624edc38a2e1cacb2ebe3a6156bccc)
ALTER TABLE `kinton`.`pricingCostCode` ADD CONSTRAINT `pricingCostCode_FK1` FOREIGN KEY (`idCostCode`) REFERENCES `kinton`.`costCode` (`idCostCode`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1337940808955-6', '2.0.3', '3:db624edc38a2e1cacb2ebe3a6156bccc', 10);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3856::sacedo::(Checksum: 3:58ee105e73f736fa89b0804f646f73e4)
ALTER TABLE `kinton`.`virtualmachine` ADD `keymap` VARCHAR(255);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('sacedo', '', NOW(), 'Add Column', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3856', '2.0.3', '3:58ee105e73f736fa89b0804f646f73e4', 11);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698::zmalik::(Checksum: 3:ccd5c84bb742930df6ccd39f8fb552e5)
CREATE TABLE `kinton`.`scope` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(255) DEFAULT 'auto_name' NOT NULL, `autoEnt` TINYINT(1) DEFAULT 0 NOT NULL, `autoDat` TINYINT(1) DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_SCOPE` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

CREATE TABLE `kinton`.`scope_resource` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idScope` INT UNSIGNED NOT NULL, `idResource` INT UNSIGNED NOT NULL, `resourceType` VARCHAR(64) DEFAULT 'auto_name' NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_SCOPE_RESOURCE` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Create Table (x2)', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698', '2.0.3', '3:ccd5c84bb742930df6ccd39f8fb552e5', 12);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698-columns::zmalik::(Checksum: 3:0d7c4b7edc6c4c10d3f13e101d1151cf)
ALTER TABLE `kinton`.`role` ADD `idScope` INT UNSIGNED;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Add Column', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698-columns', '2.0.3', '3:0d7c4b7edc6c4c10d3f13e101d1151cf', 13);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698-constraints::zmalik::(Checksum: 3:8afd9227de5253e2a04506ad214a6931)
ALTER TABLE `kinton`.`scope_resource` ADD CONSTRAINT `fk_scope_resource_scope` FOREIGN KEY (`idScope`) REFERENCES `kinton`.`scope` (`id`) ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698-constraints', '2.0.3', '3:8afd9227de5253e2a04506ad214a6931', 14);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698-constraints1::zmalik::(Checksum: 3:bd3389b3752100eb6a4262004441e391)
ALTER TABLE `kinton`.`role` ADD CONSTRAINT `fk_role_scope` FOREIGN KEY (`idScope`) REFERENCES `kinton`.`scope` (`id`) ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698-constraints1', '2.0.3', '3:bd3389b3752100eb6a4262004441e391', 15);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698-update-and-inserts::zmalik::(Checksum: 3:2d4ecdd62de718f0b6f8e4b653909ebf)
INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (54, 'USERS_MANAGE_SCOPES', 0);

INSERT INTO `kinton`.`scope` (`autoDat`, `autoEnt`, `id`, `name`, `version_c`) VALUES (0, 0, 1, 'Global scope', 0);

UPDATE `kinton`.`role` SET `idScope` = '1';

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Insert Row (x2), Update Data', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698-update-and-inserts', '2.0.3', '3:2d4ecdd62de718f0b6f8e4b653909ebf', 16);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698-admin::zmalik::(Checksum: 3:af289f7006bdc919bc053d038cbdbf25)
INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (54, 1, 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698-admin', '2.0.3', '3:af289f7006bdc919bc053d038cbdbf25', 17);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3875-0::jdevesa::(Checksum: 3:e9dbdc6f9338442109d48d92ff76a76a)
CREATE TABLE `kinton`.`dvd_management` (`idManagement` INT UNSIGNED NOT NULL, `idImage` INT UNSIGNED);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jdevesa', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3875-0', '2.0.3', '3:e9dbdc6f9338442109d48d92ff76a76a', 18);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3875-1::jdevesa::(Checksum: 3:6a705cc1e1c2c2ba4a9eec6a0a430623)
ALTER TABLE `kinton`.`dvd_management` ADD CONSTRAINT `dvd_management_image_FK` FOREIGN KEY (`idImage`) REFERENCES `kinton`.`virtualimage` (`idImage`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jdevesa', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3875-1', '2.0.3', '3:6a705cc1e1c2c2ba4a9eec6a0a430623', 19);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3875-2::jdevesa::(Checksum: 3:423310274c7be31be9d4435fca0d23f6)
ALTER TABLE `kinton`.`dvd_management` ADD CONSTRAINT `dvd_idManagement_FK` FOREIGN KEY (`idManagement`) REFERENCES `kinton`.`rasd_management` (`idManagement`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jdevesa', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3875-2', '2.0.3', '3:423310274c7be31be9d4435fca0d23f6', 20);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-4033::xthevenot::(Checksum: 3:ee17d425d7bbd7981fff90e0876dec5f)
INSERT INTO `kinton`.`system_properties` (`description`, `name`, `value`, `version_c`) VALUES ('Default index view (0 is the Home, 1 Infrastructure, ...)', 'client.main.defaultView', '0', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('xthevenot', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-4033', '2.0.3', '3:ee17d425d7bbd7981fff90e0876dec5f', 21);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3910::xthevenot::(Checksum: 3:d6ef777a6b393e0a780b4a233d4c6884)
INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (55, 'USERS_MANAGE_RESERVED_MACHINES', 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (55, 1, 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('xthevenot', '', NOW(), 'Insert Row (x2)', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3910', '2.0.3', '3:d6ef777a6b393e0a780b4a233d4c6884', 22);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3658::scastro::(Checksum: 3:76559c1d1d91c98c23197868335d8b30)
DROP TABLE `kinton`.`node_virtual_image_stateful_conversions`;

DROP TABLE `kinton`.`diskstateful_conversions`;

DROP TABLE `kinton`.`vappstateful_conversions`;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('scastro', '', NOW(), 'Drop Table (x3)', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3658', '2.0.3', '3:76559c1d1d91c98c23197868335d8b30', 23);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3898::destevez::(Checksum: 3:de10ff87abd570bc74a50ce7455b7720)
DROP TRIGGER IF EXISTS delete_nodevirtualimage_update_stats;

DELIMITER |
CREATE TRIGGER delete_nodevirtualimage_update_stats AFTER DELETE ON nodevirtualimage
  FOR EACH ROW BEGIN
    DECLARE idDataCenterObj INTEGER;
    DECLARE idVirtualAppObj INTEGER;
    DECLARE idVirtualDataCenterObj INTEGER;
    DECLARE idEnterpriseObj INTEGER;   
    DECLARE costCodeObj int(4); 
    DECLARE previousState VARCHAR(50);
    DECLARE state VARCHAR(50);
    DECLARE ram INTEGER;
    DECLARE cpu INTEGER;
    DECLARE hd bigint;
    DECLARE type INTEGER;
    DECLARE isUsingIP INTEGER;
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
    SELECT vapp.idVirtualApp, vapp.idVirtualDataCenter, vdc.idDataCenter, vdc.idEnterprise INTO idVirtualAppObj, idVirtualDataCenterObj, idDataCenterObj, idEnterpriseObj
      FROM node n, virtualapp vapp, virtualdatacenter vdc
      WHERE vdc.idVirtualDataCenter = vapp.idVirtualDataCenter
      AND n.idNode = OLD.idNode
      AND n.idVirtualApp = vapp.idVirtualApp;
      SELECT vm.idType, vm.cpu, vm.ram, vm.hd, vm.state INTO type, cpu, ram, hd, state
     FROM virtualmachine vm
	WHERE vm.idVM = OLD.idVM;
    SELECT vmts.previousState INTO previousState
     FROM virtualmachinetrackedstate vmts
	WHERE vmts.idVM = OLD.idVM;
    -- INSERT INTO debug_msg (msg) VALUES (CONCAT('deleteNVI ', IFNULL(idDataCenterObj,'NULL'), ' - ',IFNULL(idVirtualAppObj,'NULL'), ' - ',IFNULL(idVirtualDataCenterObj,'NULL'), ' - ',IFNULL(previousState,'NULL')));
-- INSERT INTO debug_msg (msg) VALUES (CONCAT('deleteNVI values', IFNULL(cpu,'NULL'), ' - ',IFNULL(ram,'NULL'), ' - ',IFNULL(hd,'NULL')));						
    --
    IF type = 1 THEN
      IF previousState != "NOT_ALLOCATED" THEN      
        UPDATE IGNORE cloud_usage_stats SET vMachinesTotal = vMachinesTotal-1
          WHERE idDataCenter = idDataCenterObj;
        UPDATE IGNORE vapp_enterprise_stats SET vmCreated = vmCreated-1
          WHERE idVirtualApp = idVirtualAppObj;
        UPDATE IGNORE vdc_enterprise_stats SET vmCreated = vmCreated-1
          WHERE idVirtualDataCenter = idVirtualDataCenterObj;
           UPDATE IGNORE enterprise_resources_stats 
               SET vCpuUsed = vCpuUsed - cpu,
                   memoryUsed = memoryUsed - ram,
                   localStorageUsed = localStorageUsed - hd
           WHERE idEnterprise = idEnterpriseObj;
           UPDATE IGNORE dc_enterprise_stats 
           SET     vCpuUsed = vCpuUsed - cpu,
               memoryUsed = memoryUsed - ram,
               localStorageUsed = localStorageUsed - hd
           WHERE idEnterprise = idEnterpriseObj AND idDataCenter = idDataCenterObj;
           UPDATE IGNORE vdc_enterprise_stats 
           SET     vCpuUsed = vCpuUsed - cpu,
               memoryUsed = memoryUsed - ram,
               localStorageUsed = localStorageUsed - hd
           WHERE idVirtualDataCenter = idVirtualDataCenterObj;                 
      END IF;
      --
      IF previousState = "ON" THEN
        UPDATE IGNORE cloud_usage_stats SET vMachinesRunning = vMachinesRunning-1
        WHERE idDataCenter = idDataCenterObj;
        UPDATE IGNORE vapp_enterprise_stats SET vmActive = vmActive-1
        WHERE idVirtualApp = idVirtualAppObj;
        UPDATE IGNORE vdc_enterprise_stats SET vmActive = vmActive-1
        WHERE idVirtualDataCenter = idVirtualDataCenterObj;
      END IF;
    END IF;
    SELECT IF(vi.cost_code IS NULL, 0, vi.cost_code) INTO costCodeObj
        FROM virtualimage vi
        WHERE vi.idImage = OLD.idImage;
    IF EXISTS( SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVMRegisterEvents' ) THEN
       IF EXISTS(SELECT * FROM virtualimage vi WHERE vi.idImage=OLD.idImage) THEN 
	          CALL AccountingVMRegisterEvents(OLD.idVM, type, "-", "NOT_ALLOCATED", previousState, ram, cpu, hd, costCodeObj);
        END IF;              
     END IF;
  END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3898', '2.0.3', '3:de10ff87abd570bc74a50ce7455b7720', 24);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3727::destevez::(Checksum: 3:ce98b001ef068af5bcb4f1c2e37d5a28)
DROP TRIGGER IF EXISTS update_virtualmachine_update_stats;

DELIMITER |
CREATE TRIGGER update_virtualmachine_update_stats AFTER UPDATE ON virtualmachine
    FOR EACH ROW BEGIN
        DECLARE idDataCenterObj INTEGER;
        DECLARE idVirtualAppObj INTEGER;
        DECLARE idVirtualDataCenterObj INTEGER;	
        DECLARE costCodeObj int(4);
	DECLARE previousState VARCHAR(50);
	DECLARE extraHDSize BIGINT DEFAULT 0;
	-- For debugging purposes only        
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   
	-- We always store previous state when starting a transaction
	IF NEW.state != OLD.state AND NEW.state='LOCKED' THEN
		UPDATE virtualmachinetrackedstate SET previousState=OLD.state WHERE idVM=NEW.idVM;
	END IF;
	--
	SELECT vmts.previousState INTO previousState
        FROM virtualmachinetrackedstate vmts
	WHERE vmts.idVM = NEW.idVM;
	-- -- INSERT INTO debug_msg (msg) VALUES (CONCAT('UPDATE: ', NEW.idVM, ' - ', OLD.idType, ' - ', NEW.idType, ' - ', OLD.state, ' - ', NEW.state, ' - ', previousState));	
        --  Updating enterprise_resources_stats: VCPU Used, Memory Used, Local Storage Used
        IF OLD.idHypervisor IS NULL OR (OLD.idHypervisor != NEW.idHypervisor) THEN
            SELECT pm.idDataCenter INTO idDataCenterObj
            FROM hypervisor hy, physicalmachine pm
            WHERE NEW.idHypervisor=hy.id
            AND hy.idPhysicalMachine=pm.idPhysicalMachine;
        ELSE 
            SELECT pm.idDataCenter INTO idDataCenterObj
            FROM hypervisor hy, physicalmachine pm
            WHERE OLD.idHypervisor=hy.id
            AND hy.idPhysicalMachine=pm.idPhysicalMachine;
        END IF;     
        --
        SELECT n.idVirtualApp, vapp.idVirtualDataCenter INTO idVirtualAppObj, idVirtualDataCenterObj
        FROM nodevirtualimage nvi, node n, virtualapp vapp
        WHERE NEW.idVM = nvi.idVM
        AND nvi.idNode = n.idNode
        AND vapp.idVirtualApp = n.idVirtualApp;   
-- -- INSERT INTO debug_msg (msg) VALUES (CONCAT('update values ', IFNULL(idDataCenterObj,'NULL'), ' - ',IFNULL(idVirtualAppObj,'NULL'), ' - ',IFNULL(idVirtualDataCenterObj,'NULL'), ' - ',IFNULL(previousState,'NULL')));
	--
	-- Imported VMs will be updated on create_node_virtual_image
	-- Used Stats (vCpuUsed, vMemoryUsed, vStorageUsed) are updated from delete_nodevirtualimage_update_stats ON DELETE nodevirtualimage when updating the VApp
	-- Main case: an imported VM changes its state (from LOCKED to ...)
	IF NEW.idType = 1 AND (NEW.state != OLD.state) THEN
            IF NEW.state = "ON" AND (previousState != "ON" OR OLD.state="UNKNOWN") THEN 
                -- New Active		
                UPDATE IGNORE vapp_enterprise_stats SET vmActive = vmActive+1
                WHERE idVirtualApp = idVirtualAppObj;
                UPDATE IGNORE vdc_enterprise_stats SET vmActive = vmActive+1
                WHERE idVirtualDataCenter = idVirtualDataCenterObj;
                UPDATE IGNORE cloud_usage_stats SET vMachinesRunning = vMachinesRunning+1
                WHERE idDataCenter = idDataCenterObj;       
		SELECT IFNULL(SUM(limitResource),0) * 1048576 INTO extraHDSize 
		FROM rasd_management rm, rasd r 
		WHERE rm.idResource = r.instanceID AND rm.idVM = NEW.idVM AND rm.idResourceType=17;    
		-- INSERT INTO debug_msg (msg) VALUES (CONCAT('NEW ExtraHDs added ', extraHDSize));
                UPDATE IGNORE enterprise_resources_stats 
                    SET vCpuUsed = vCpuUsed + NEW.cpu,
                        memoryUsed = memoryUsed + NEW.ram,
                        localStorageUsed = localStorageUsed + NEW.hd + extraHDSize
                WHERE idEnterprise = NEW.idEnterprise;
                UPDATE IGNORE dc_enterprise_stats 
                SET     vCpuUsed = vCpuUsed + NEW.cpu,
                    memoryUsed = memoryUsed + NEW.ram,
                    localStorageUsed = localStorageUsed + NEW.hd + extraHDSize
                WHERE idEnterprise = NEW.idEnterprise AND idDataCenter = idDataCenterObj;
                UPDATE IGNORE vdc_enterprise_stats 
                SET     vCpuUsed = vCpuUsed + NEW.cpu,
                    memoryUsed = memoryUsed + NEW.ram,
                    localStorageUsed = localStorageUsed + NEW.hd + extraHDSize
                WHERE idVirtualDataCenter = idVirtualDataCenterObj;		
	    ELSEIF (NEW.state IN ("PAUSED","OFF","NOT_ALLOCATED","UNKNOWN") AND OLD.state="LOCKED" AND previousState = "ON") OR 
	    		  (NEW.state IN ("PAUSED","OFF","NOT_ALLOCATED","UNKNOWN") AND OLD.state="ON") THEN
                -- When Undeploying a full Vapp
                -- Undeploying the Vapp implies OLD.state = LOCKED + previousState = ON 
                -- Powering OFF the VM implies  OLD.state = LOCKED + previousState = ON
                -- Destroying the VM implies OLD.state = ON
                UPDATE IGNORE vapp_enterprise_stats SET vmActive = vmActive-1
                WHERE idVirtualApp = idVirtualAppObj;
                UPDATE IGNORE vdc_enterprise_stats SET vmActive = vmActive-1
                WHERE idVirtualDataCenter = idVirtualDataCenterObj;
                UPDATE IGNORE cloud_usage_stats SET vMachinesRunning = vMachinesRunning-1
                WHERE idDataCenter = idDataCenterObj;
				SELECT IFNULL(SUM(limitResource),0) * 1048576 INTO extraHDSize 
				FROM rasd_management rm, rasd r 
				WHERE rm.idResource = r.instanceID AND rm.idVM = NEW.idVM AND rm.idResourceType=17;    
				-- INSERT INTO debug_msg (msg) VALUES (CONCAT('NEW ExtraHDs removed ', extraHDSize));
                UPDATE IGNORE enterprise_resources_stats 
                    SET vCpuUsed = vCpuUsed - NEW.cpu,
                        memoryUsed = memoryUsed - NEW.ram,
                        localStorageUsed = localStorageUsed - NEW.hd - extraHDSize
                WHERE idEnterprise = NEW.idEnterprise;
                UPDATE IGNORE dc_enterprise_stats 
                SET     vCpuUsed = vCpuUsed - NEW.cpu,
                    memoryUsed = memoryUsed - NEW.ram,
                    localStorageUsed = localStorageUsed - NEW.hd - extraHDSize
                WHERE idEnterprise = NEW.idEnterprise AND idDataCenter = idDataCenterObj;
                UPDATE IGNORE vdc_enterprise_stats 
                SET     vCpuUsed = vCpuUsed - NEW.cpu,
                    memoryUsed = memoryUsed - NEW.ram,
                    localStorageUsed = localStorageUsed - NEW.hd - extraHDSize
                WHERE idVirtualDataCenter = idVirtualDataCenterObj; 
                -- INSERT INTO debug_msg (msg) VALUES (CONCAT('NEW state is NOT_RUNNING ', OLD.state, ' - ', previousState));
            END IF;
        END IF;
        --
        SELECT IF(vi.cost_code IS NULL, 0, vi.cost_code) INTO costCodeObj
        FROM virtualimage vi
        WHERE vi.idImage = NEW.idImage;
        -- Register Accounting Events
        IF EXISTS( SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVMRegisterEvents' ) THEN
       		 IF EXISTS(SELECT * FROM virtualimage vi WHERE vi.idImage=NEW.idImage) THEN 
	          CALL AccountingVMRegisterEvents(NEW.idVM, NEW.idType, OLD.state, NEW.state, previousState, NEW.ram, NEW.cpu, NEW.hd + extraHDSize, costCodeObj);
       		 END IF;              
	    END IF;
      END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3727', '2.0.3', '3:ce98b001ef068af5bcb4f1c2e37d5a28', 25);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-4059-4114::destevez::(Checksum: 3:2b2dd67788b94b5af2a1445377d8bbb2)
DROP PROCEDURE IF EXISTS CalculateEnterpriseResourcesStats;

DELIMITER |
CREATE PROCEDURE CalculateEnterpriseResourcesStats()
   BEGIN
  DECLARE idEnterpriseObj INTEGER;
  DECLARE vCpuReserved BIGINT UNSIGNED;
  DECLARE vCpuUsed BIGINT UNSIGNED;
  DECLARE memoryReserved BIGINT UNSIGNED;
  DECLARE memoryUsed BIGINT UNSIGNED;
  DECLARE localStorageReserved BIGINT UNSIGNED;
  DECLARE localStorageUsed BIGINT UNSIGNED;
  DECLARE extStorageReserved BIGINT UNSIGNED; 
  DECLARE extStorageUsed BIGINT UNSIGNED; 
  DECLARE publicIPsReserved BIGINT UNSIGNED;
  DECLARE publicIPsUsed BIGINT UNSIGNED;
  DECLARE vlanReserved BIGINT UNSIGNED; 
  DECLARE vlanUsed BIGINT UNSIGNED; 
  DECLARE extraHDUsed BIGINT UNSIGNED;

  DECLARE no_more_enterprises INTEGER;

  DECLARE curDC CURSOR FOR SELECT idEnterprise FROM enterprise;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_enterprises=1;

  SET no_more_enterprises = 0;
  SET idEnterpriseObj = -1;

  OPEN curDC;

  TRUNCATE enterprise_resources_stats;

  dept_loop:WHILE(no_more_enterprises = 0) DO
    FETCH curDC INTO idEnterpriseObj;
    IF no_more_enterprises=1 THEN
        LEAVE dept_loop;
    END IF;
    -- INSERT INTO debug_msg (msg) VALUES (CONCAT('Iteracion Enterprise: ',idEnterpriseObj));
    --
    SELECT cpuHard, ramHard, hdHard, storageHard, vlanHard INTO vCpuReserved, memoryReserved, localStorageReserved, extStorageReserved, vlanReserved
    FROM enterprise e
    WHERE e.idEnterprise = idEnterpriseObj;
    --
    SELECT IF (SUM(vm.cpu) IS NULL, 0, SUM(vm.cpu)), IF (SUM(vm.ram) IS NULL, 0, SUM(vm.ram)), IF (SUM(vm.hd) IS NULL, 0, SUM(vm.hd)) INTO vCpuUsed, memoryUsed, localStorageUsed
    FROM virtualmachine vm
    WHERE vm.state = "ON"
    AND vm.idType = 1
    AND vm.idEnterprise = idEnterpriseObj;
    --
    SELECT IFNULL(SUM(limitResource),0) * 1048576  INTO extraHDUsed
	FROM rasd_management rm, rasd r, virtualmachine vm 
	WHERE rm.idResource = r.instanceID AND rm.idVM = vm.idVM AND rm.idResourceType=17
	AND vm.state="ON"
	AND vm.idType=1
	AND vm.idEnterprise = idEnterpriseObj;   
	--
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO vlanUsed
    FROM virtualdatacenter vdc, vlan_network vn
    WHERE vdc.networktypeID=vn.network_id
    AND vdc.idEnterprise=idEnterpriseObj;
    --
    SELECT IF (SUM(r.limitResource) IS NULL, 0, SUM(r.limitResource)) INTO extStorageUsed
    FROM rasd_management rm, rasd r, volume_management vm, virtualdatacenter vdc
    WHERE rm.idManagement = vm.idManagement
    AND vdc.idVirtualDataCenter = rm.idVirtualDataCenter
    AND r.instanceID = rm.idResource
    AND (vm.state = 1 OR vm.state = 2)
    AND rm.idResource IS NOT NULL
    AND vdc.idEnterprise = idEnterpriseObj;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO publicIPsReserved
    FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, datacenter dc, rasd_management rm, virtualdatacenter vdc
    WHERE ipm.vlan_network_id = vn.vlan_network_id
    AND vn.network_configuration_id = nc.network_configuration_id
    AND vn.network_id = dc.network_id   
    AND vn.networktype = 'PUBLIC'             
    AND rm.idManagement = ipm.idManagement
    AND vdc.idVirtualDataCenter = rm.idVirtualDataCenter
    AND vdc.idEnterprise = idEnterpriseObj;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO publicIPsUsed
    FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, datacenter dc, rasd_management rm, virtualdatacenter vdc
    WHERE ipm.vlan_network_id = vn.vlan_network_id
    AND vn.network_configuration_id = nc.network_configuration_id
    AND vn.network_id = dc.network_id            
    AND vn.networktype = 'PUBLIC'    
    AND rm.idManagement = ipm.idManagement
    AND vdc.idVirtualDataCenter = rm.idVirtualDataCenter
    AND rm.idVM IS NOT NULL
    AND vdc.idEnterprise = idEnterpriseObj;


    -- Inserts stats row
    INSERT INTO enterprise_resources_stats (idEnterprise,vCpuReserved,vCpuUsed,memoryReserved,memoryUsed,localStorageReserved,localStorageUsed,extStorageReserved, extStorageUsed, publicIPsReserved, publicIPsUsed, vlanReserved, vlanUsed)
     VALUES (idEnterpriseObj,vCpuReserved,vCpuUsed,memoryReserved,memoryUsed,localStorageReserved,localStorageUsed+extraHDUsed,extStorageReserved, extStorageUsed, publicIPsReserved, publicIPsUsed, vlanReserved, vlanUsed);

  END WHILE dept_loop;
  CLOSE curDC;

   END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-4059-4114', '2.0.3', '3:2b2dd67788b94b5af2a1445377d8bbb2', 26);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-4127-4114::destevez::(Checksum: 3:be509954d54d99afb53946f5dcb9a2a6)
DROP PROCEDURE IF EXISTS CalculateVdcEnterpriseStats;

DELIMITER |
CREATE PROCEDURE CalculateVdcEnterpriseStats()
   BEGIN
  DECLARE idVirtualDataCenterObj INTEGER;
  DECLARE idEnterprise INTEGER;
  DECLARE vdcName VARCHAR(45);
  DECLARE vmCreated MEDIUMINT UNSIGNED;
  DECLARE vmActive MEDIUMINT UNSIGNED;
  DECLARE volCreated MEDIUMINT UNSIGNED;
  DECLARE volAssociated MEDIUMINT UNSIGNED;
  DECLARE volAttached MEDIUMINT UNSIGNED;
  DECLARE vCpuReserved BIGINT UNSIGNED; 
  DECLARE vCpuUsed BIGINT UNSIGNED; 
  DECLARE memoryReserved BIGINT UNSIGNED;
  DECLARE memoryUsed BIGINT UNSIGNED; 
  DECLARE localStorageReserved BIGINT UNSIGNED; 
  DECLARE localStorageUsed BIGINT UNSIGNED; 
  DECLARE extStorageReserved BIGINT UNSIGNED; 
  DECLARE extStorageUsed BIGINT UNSIGNED; 
  DECLARE publicIPsReserved MEDIUMINT UNSIGNED;
  DECLARE publicIPsUsed MEDIUMINT UNSIGNED;
  DECLARE vlanReserved MEDIUMINT UNSIGNED; 
  DECLARE vlanUsed MEDIUMINT UNSIGNED;   
  DECLARE extraHDUsed BIGINT UNSIGNED;

  DECLARE no_more_vdcs INTEGER;

  DECLARE curDC CURSOR FOR SELECT vdc.idVirtualDataCenter, vdc.idEnterprise, vdc.name FROM virtualdatacenter vdc;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_vdcs = 1;

  SET no_more_vdcs = 0;
  SET idVirtualDataCenterObj = -1;

  OPEN curDC;

  TRUNCATE vdc_enterprise_stats;

  dept_loop:WHILE(no_more_vdcs = 0) DO
    FETCH curDC INTO idVirtualDataCenterObj, idEnterprise, vdcName;
    IF no_more_vdcs=1 THEN
        LEAVE dept_loop;
    END IF;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO vmCreated
    FROM nodevirtualimage nvi, virtualmachine v, node n, virtualapp vapp
    WHERE nvi.idNode IS NOT NULL
    AND v.idVM = nvi.idVM
    AND n.idNode = nvi.idNode
    AND n.idVirtualApp = vapp.idVirtualApp
    AND vapp.idVirtualDataCenter = idVirtualDataCenterObj
    AND v.state != "NOT_ALLOCATED" AND v.state != "UNKNOWN";
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO vmActive
    FROM nodevirtualimage nvi, virtualmachine v, node n, virtualapp vapp
    WHERE nvi.idNode IS NOT NULL
    AND v.idVM = nvi.idVM
    AND n.idNode = nvi.idNode
    AND n.idVirtualApp = vapp.idVirtualApp
    AND vapp.idVirtualDataCenter = idVirtualDataCenterObj
    AND v.state = "ON";
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO volCreated
    FROM rasd_management rm
    WHERE rm.idVirtualDataCenter = idVirtualDataCenterObj
    AND rm.idResource IS NOT NULL
    AND rm.idResourceType=8;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO volAssociated
    FROM rasd_management rm
    WHERE rm.idVirtualApp IS NOT NULL
    AND rm.idResource IS NOT NULL
    AND rm.idVirtualDataCenter = idVirtualDataCenterObj
    AND rm.idResourceType=8;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO volAttached
    FROM volume_management vm, rasd_management rm
    WHERE rm.idManagement = vm.idManagement
    AND rm.idVirtualApp IS NOT NULL
    AND rm.idResource IS NOT NULL
    AND rm.idVirtualDataCenter = idVirtualDataCenterObj
    AND state = 2;
    --
    SELECT IF (SUM(cpuHard) IS NULL, 0, SUM(cpuHard)), IF (SUM(ramHard) IS NULL, 0, SUM(ramHard)), IF (SUM(hdHard) IS NULL, 0, SUM(hdHard)), IF (SUM(storageHard) IS NULL, 0, SUM(storageHard)), IF (SUM(vlanHard) IS NULL, 0, SUM(vlanHard)) INTO vCpuReserved, memoryReserved, localStorageReserved, extStorageReserved, vlanReserved
    FROM virtualdatacenter 
    WHERE idVirtualDataCenter = idVirtualDataCenterObj;
    --
    SELECT IF (SUM(vm.cpu) IS NULL, 0, SUM(vm.cpu)), IF (SUM(vm.ram) IS NULL, 0, SUM(vm.ram)), IF (SUM(vm.hd) IS NULL, 0, SUM(vm.hd)) INTO vCpuUsed, memoryUsed, localStorageUsed
    FROM virtualmachine vm, nodevirtualimage nvi, node n, virtualapp vapp
    WHERE vm.idVM = nvi.idVM
    AND nvi.idNode = n.idNode
    AND vapp.idVirtualApp = n.idVirtualApp
    AND vm.state = "ON"
    AND vm.idType = 1
    AND vapp.idVirtualDataCenter = idVirtualDataCenterObj;
    --
    SELECT IF (SUM(r.limitResource) IS NULL, 0, SUM(r.limitResource)) INTO extStorageUsed
    FROM rasd_management rm, rasd r, volume_management vm
    WHERE rm.idManagement = vm.idManagement    
    AND r.instanceID = rm.idResource
    AND (vm.state = 1 OR vm.state = 2)
    AND rm.idVirtualDataCenter = idVirtualDataCenterObj;
    --
    SELECT IFNULL(SUM(limitResource),0) * 1048576  INTO extraHDUsed
	FROM rasd_management rm, rasd r, virtualmachine vm 
	WHERE rm.idResource = r.instanceID AND rm.idVM = vm.idVM AND rm.idResourceType=17
	AND vm.state="ON"
	AND vm.idType=1
	AND rm.idVirtualDataCenter = idVirtualDataCenterObj; 
	--
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO publicIPsUsed
    FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, datacenter dc, rasd_management rm
    WHERE ipm.vlan_network_id = vn.vlan_network_id
    AND vn.network_configuration_id = nc.network_configuration_id
    AND vn.network_id = dc.network_id           
    AND vn.networktype = 'PUBLIC'     
    AND rm.idManagement = ipm.idManagement
    AND rm.idVM IS NOT NULL
    AND rm.idVirtualDataCenter = idVirtualDataCenterObj;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO publicIPsReserved
    FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, datacenter dc, rasd_management rm
    WHERE ipm.vlan_network_id = vn.vlan_network_id
    AND vn.network_configuration_id = nc.network_configuration_id
    AND vn.network_id = dc.network_id                
    AND vn.networktype = 'PUBLIC'
    AND rm.idManagement = ipm.idManagement
    AND rm.idVirtualDataCenter = idVirtualDataCenterObj;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO vlanUsed
    FROM virtualdatacenter vdc, vlan_network vn
    WHERE vdc.networktypeID = vn.network_id
    AND vdc.idVirtualDataCenter = idVirtualDataCenterObj;
   -- 


    -- Inserts stats row
    INSERT INTO vdc_enterprise_stats (idVirtualDataCenter,idEnterprise,vdcName,vmCreated,vmActive,volCreated,volAssociated,volAttached, vCpuReserved, vCpuUsed, memoryReserved, memoryUsed, localStorageReserved, localStorageUsed, extStorageReserved, extStorageUsed, publicIPsReserved, publicIPsUsed, vlanReserved, vlanUsed)
    VALUES (idVirtualDataCenterObj,idEnterprise,vdcName,vmCreated,vmActive,volCreated,volAssociated,volAttached, vCpuReserved, vCpuUsed, memoryReserved, memoryUsed, localStorageReserved, localStorageUsed + extraHDUsed, extStorageReserved, extStorageUsed, publicIPsReserved, publicIPsUsed, vlanReserved, vlanUsed );


  END WHILE dept_loop;
  CLOSE curDC;

   END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-4127-4114', '2.0.3', '3:be509954d54d99afb53946f5dcb9a2a6', 27);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-4114-4166::destevez::(Checksum: 3:64ba2418c95dabffd34a95ede7aa3bf8)
DROP PROCEDURE IF EXISTS CalculateVappEnterpriseStats;

DELIMITER |
CREATE PROCEDURE CalculateVappEnterpriseStats()
   BEGIN
  DECLARE idVirtualAppObj INTEGER;
  DECLARE idEnterprise INTEGER;
  DECLARE idVirtualDataCenter INTEGER;
  DECLARE vappName VARCHAR(45);
  DECLARE vdcName VARCHAR(45);
  DECLARE vmCreated MEDIUMINT UNSIGNED;
  DECLARE vmActive MEDIUMINT UNSIGNED;
  DECLARE volAssociated MEDIUMINT UNSIGNED;
  DECLARE volAttached MEDIUMINT UNSIGNED;

  DECLARE no_more_vapps INTEGER;

  DECLARE curDC CURSOR FOR SELECT vapp.idVirtualApp, vapp.idEnterprise, vapp.idVirtualDataCenter, vapp.name, vdc.name FROM virtualapp vapp, virtualdatacenter vdc WHERE vdc.idVirtualDataCenter = vapp.idVirtualDataCenter;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_vapps = 1;

  SET no_more_vapps = 0;
  SET idVirtualAppObj = -1;

  OPEN curDC;

  TRUNCATE vapp_enterprise_stats;

  dept_loop:WHILE(no_more_vapps = 0) DO
    FETCH curDC INTO idVirtualAppObj, idEnterprise, idVirtualDataCenter, vappName, vdcName;
    IF no_more_vapps=1 THEN
        LEAVE dept_loop;
    END IF;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO vmCreated
    FROM nodevirtualimage nvi, virtualmachine v, node n, virtualapp vapp
    WHERE nvi.idNode IS NOT NULL
    AND v.idVM = nvi.idVM
    AND n.idNode = nvi.idNode
    AND n.idVirtualApp = vapp.idVirtualApp
    AND vapp.idVirtualApp = idVirtualAppObj
    AND v.state != "NOT_ALLOCATED" AND v.state != "UNKNOWN"
    and v.idType = 1;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO vmActive
    FROM nodevirtualimage nvi, virtualmachine v, node n, virtualapp vapp
    WHERE nvi.idNode IS NOT NULL
    AND v.idVM = nvi.idVM
    AND n.idNode = nvi.idNode
    AND n.idVirtualApp = vapp.idVirtualApp
    AND vapp.idVirtualApp = idVirtualAppObj
    AND v.state = "ON"
    and v.idType = 1;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO volAssociated
    FROM rasd_management rm
    WHERE rm.idVirtualApp = idVirtualAppObj
    AND rm.idResource IS NOT NULL
    AND rm.idResourceType=8;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO volAttached
    FROM volume_management vm, rasd_management rm
    WHERE rm.idManagement = vm.idManagement
    AND rm.idResource IS NOT NULL
    AND rm.idVirtualApp = idVirtualAppObj
    AND state = 2;

    -- Inserts stats row
    INSERT INTO vapp_enterprise_stats (idVirtualApp,idEnterprise,idVirtualDataCenter,vappName,vdcName,vmCreated,vmActive,volAssociated,volAttached)
    VALUES (idVirtualAppObj, idEnterprise,idVirtualDataCenter,vappName,vdcName,vmCreated,vmActive,volAssociated,volAttached);


  END WHILE dept_loop;
  CLOSE curDC;

   END;
|
DELIMITER ;

DROP PROCEDURE IF EXISTS CalculateCloudUsageStats;

DELIMITER |
CREATE PROCEDURE CalculateCloudUsageStats()
   BEGIN
  DECLARE idDataCenterObj INTEGER;
  DECLARE serversTotal BIGINT UNSIGNED;
  DECLARE serversRunning BIGINT UNSIGNED;
  DECLARE storageTotal BIGINT UNSIGNED;
  DECLARE storageUsed BIGINT UNSIGNED;
  DECLARE publicIPsTotal BIGINT UNSIGNED;
  DECLARE publicIPsReserved BIGINT UNSIGNED;
  DECLARE publicIPsUsed BIGINT UNSIGNED;
  DECLARE vMachinesTotal BIGINT UNSIGNED;
  DECLARE vMachinesRunning BIGINT UNSIGNED;
  DECLARE vCpuTotal BIGINT UNSIGNED;
  DECLARE vCpuReserved BIGINT UNSIGNED;
  DECLARE vCpuUsed BIGINT UNSIGNED;
  DECLARE vMemoryTotal BIGINT UNSIGNED;
  DECLARE vMemoryReserved BIGINT UNSIGNED;
  DECLARE vMemoryUsed BIGINT UNSIGNED;
  DECLARE vStorageReserved BIGINT UNSIGNED;
  DECLARE vStorageUsed BIGINT UNSIGNED;
  DECLARE vStorageTotal BIGINT UNSIGNED;
  DECLARE numUsersCreated BIGINT UNSIGNED;
  DECLARE numVDCCreated BIGINT UNSIGNED;
  DECLARE numEnterprisesCreated BIGINT UNSIGNED;
  DECLARE storageReserved BIGINT UNSIGNED; 
  DECLARE vlanReserved BIGINT UNSIGNED; 
  DECLARE vlanUsed BIGINT UNSIGNED; 

  DECLARE no_more_dcs INTEGER;

  DECLARE curDC CURSOR FOR SELECT idDataCenter FROM datacenter;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_dcs=1;

  SET no_more_dcs=0;
  SET idDataCenterObj = -1;

  OPEN curDC;

  TRUNCATE cloud_usage_stats;

  dept_loop:WHILE(no_more_dcs=0) DO
    FETCH curDC INTO idDataCenterObj;
    IF no_more_dcs=1 THEN
        LEAVE dept_loop;
    END IF;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO serversTotal
    FROM physicalmachine
    WHERE idDataCenter = idDataCenterObj
    AND idState!=2;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO serversRunning
    FROM physicalmachine
    WHERE idDataCenter = idDataCenterObj
    AND idState=3;
    --
    SELECT IF (SUM(limitResource) IS NULL, 0, SUM(limitResource))   INTO storageTotal
    FROM rasd r, rasd_management rm, virtualdatacenter vdc
    WHERE rm.idResource = r.instanceID
    AND vdc.idVirtualDataCenter=rm.idVirtualDataCenter
    AND vdc.idDataCenter = idDataCenterObj;
    --
    SELECT IF (SUM(r.limitResource) IS NULL, 0, SUM(r.limitResource)) INTO storageUsed
    FROM storage_pool sp, storage_device sd, volume_management vm, rasd_management rm, rasd r
    WHERE vm.idStorage = sp.idStorage
    AND sp.idStorageDevice = sd.id
    AND vm.idManagement = rm.idManagement
    AND r.instanceID = rm.idResource
    AND rm.idResourceType = 8
    AND rm.idResource IS NOT NULL
    AND (vm.state = 1)
    AND sd.idDataCenter = idDataCenterObj;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO publicIPsTotal
    FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, datacenter dc
    WHERE ipm.vlan_network_id = vn.vlan_network_id
    AND vn.network_configuration_id = nc.network_configuration_id
    AND vn.network_id = dc.network_id
    AND dc.idDataCenter = idDataCenterObj;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO publicIPsReserved
    FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, datacenter dc
    WHERE ipm.vlan_network_id = vn.vlan_network_id
    AND vn.network_configuration_id = nc.network_configuration_id
    AND vn.network_id = dc.network_id
    AND vn.networktype = 'PUBLIC'             
    AND ipm.mac IS NOT NULL
    AND dc.idDataCenter = idDataCenterObj;
    --
    SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO publicIPsUsed
    FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, datacenter dc, rasd_management rm
    WHERE ipm.vlan_network_id = vn.vlan_network_id
    AND vn.network_configuration_id = nc.network_configuration_id
    AND vn.network_id = dc.network_id
    AND vn.networktype = 'PUBLIC'             
    AND rm.idManagement = ipm.idManagement
    AND ipm.mac IS NOT NULL
    AND rm.idVM IS NOT NULL
    AND dc.idDataCenter = idDataCenterObj;
    --
    SELECT  IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO vMachinesTotal
    FROM nodevirtualimage nvi, virtualmachine v, node n, virtualapp vapp, virtualdatacenter vdc
    WHERE v.idVM = nvi.idVM
    AND n.idNode=nvi.idNode
    AND vapp.idVirtualApp = n.idVirtualApp
    AND vdc.idVirtualDataCenter = vapp.idVirtualDataCenter
    AND vdc.idDataCenter = idDataCenterObj
    AND v.state != "NOT_ALLOCATED" AND v.state != "UNKNOWN" 
    and v.idType = 1;
    --
    SELECT  IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO vMachinesRunning
    FROM nodevirtualimage nvi, virtualmachine v, node n, virtualapp vapp, virtualdatacenter vdc
    WHERE v.idVM = nvi.idVM
    AND n.idNode=nvi.idNode
    AND vapp.idVirtualApp = n.idVirtualApp
    AND vdc.idVirtualDataCenter = vapp.idVirtualDataCenter
    AND vdc.idDataCenter = idDataCenterObj
    AND v.state = "ON"
    and v.idType = 1;
    --
    SELECT IF (SUM(cpu) IS NULL,0,SUM(cpu)), IF (SUM(ram) IS NULL,0,SUM(ram)), IF (SUM(cpuUsed) IS NULL,0,SUM(cpuUsed)), IF (SUM(ramUsed) IS NULL,0,SUM(ramUsed)) 			INTO vCpuTotal, vMemoryTotal, vCpuUsed, vMemoryUsed
    FROM physicalmachine
    WHERE idDataCenter = idDataCenterObj
    AND idState = 3; 
    --
    CALL get_datastore_size_by_dc(idDataCenterObj,vStorageTotal);
    CALL get_datastore_used_size_by_dc(idDataCenterObj,vStorageUsed);
    --
    SELECT IF (SUM(vlanHard) IS NULL, 0, SUM(vlanHard))  INTO vlanReserved
    FROM enterprise_limits_by_datacenter 
    WHERE idDataCenter = idDataCenterObj AND idEnterprise IS NOT NULL;

    -- Inserts stats row
    INSERT INTO cloud_usage_stats
    (idDataCenter,
    serversTotal,serversRunning,
    storageTotal,storageUsed,
    publicIPsTotal,publicIPsReserved,publicIPsUsed,
    vMachinesTotal,vMachinesRunning,
    vCpuTotal,vCpuReserved,vCpuUsed,
    vMemoryTotal,vMemoryReserved,vMemoryUsed,
    vStorageReserved,vStorageUsed,vStorageTotal,
    vlanReserved,
    numUsersCreated,numVDCCreated,numEnterprisesCreated)
    VALUES
    (idDataCenterObj,
    serversTotal,serversRunning,
    storageTotal,storageUsed,
    publicIPsTotal,publicIPsReserved,publicIPsUsed,
    vMachinesTotal,vMachinesRunning,
    vCpuTotal,0,vCpuUsed,
    vMemoryTotal,0,vMemoryUsed,
    0,vStorageUsed,vStorageTotal,
    vlanReserved,
    0,0,0);

  END WHILE dept_loop;
  CLOSE curDC;

  -- All Cloud Stats (idDataCenter -1): vCpuReserved, VMemoryReserved, VStorageReserved, NumUsersCreated, NumVDCCreated, NumEnterprisesCreated
  SELECT IF (SUM(cpuHard) IS NULL,0,SUM(cpuHard)), IF (SUM(ramHard) IS NULL,0,SUM(ramHard)), IF (SUM(hdHard) IS NULL,0,SUM(hdHard)), IF (SUM(storageHard) IS NULL,0,SUM(storageHard)) INTO vCpuReserved, vMemoryReserved, vStorageReserved, storageReserved
  FROM enterprise e;
  --
  SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO numUsersCreated
  FROM user;
  --
  SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO numVDCCreated
  FROM virtualdatacenter vdc;
  --
  SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO numEnterprisesCreated
  FROM enterprise e;
  --
  SELECT  IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO vlanUsed
  FROM vlan_network;

  -- Inserts stats row
    INSERT INTO cloud_usage_stats
    (idDataCenter,
    serversTotal,serversRunning,
    storageTotal,storageUsed,
    publicIPsTotal,publicIPsReserved,publicIPsUsed,
    vMachinesTotal,vMachinesRunning,
    vCpuTotal,vCpuReserved,vCpuUsed,
    vMemoryTotal,vMemoryReserved,vMemoryUsed,
    vStorageReserved,vStorageUsed,vStorageTotal,
    vlanUsed,
    numUsersCreated,numVDCCreated,numEnterprisesCreated)
    VALUES
    (-1,
    0,0,
    0,0,
    0,0,0,
    0,0,
    0,vCpuReserved,0,
    0,vMemoryReserved,0,
    vStorageReserved,0,0,
    vlanUsed,
    numUsersCreated,numVDCCreated,numEnterprisesCreated);
   END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File, Custom SQL, SQL From File', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-4114-4166', '2.0.3', '3:64ba2418c95dabffd34a95ede7aa3bf8', 28);

-- Release Database Lock
-- Release Database Lock
