DROP DATABASE IF EXISTS kinton;
CREATE DATABASE IF NOT EXISTS kinton;
USE kinton;

-- DROP DATABASE IF EXISTS kinton_acounting;
-- CREATE DATABASE IF NOT EXISTS kinton;
-- USE kinton;
-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: src/kinton_master_changelog.xml
-- Ran at: 10/5/12 2:15 AM
-- Against: root@10.60.20.42@jdbc:mysql://10.60.20.42:3306/kinton
-- Liquibase version: 2.0.3
-- *********************************************************************

-- Create Database Lock Table
CREATE TABLE `kinton`.`DATABASECHANGELOGLOCK` (`ID` INT NOT NULL, `LOCKED` TINYINT(1) NOT NULL, `LOCKGRANTED` DATETIME, `LOCKEDBY` VARCHAR(255), CONSTRAINT `PK_DATABASECHANGELOGLOCK` PRIMARY KEY (`ID`));

INSERT INTO `kinton`.`DATABASECHANGELOGLOCK` (`ID`, `LOCKED`) VALUES (1, 0);

-- Lock Database
-- Create Database Change Log Table
CREATE TABLE `kinton`.`DATABASECHANGELOG` (`ID` VARCHAR(63) NOT NULL, `AUTHOR` VARCHAR(63) NOT NULL, `FILENAME` VARCHAR(200) NOT NULL, `DATEEXECUTED` DATETIME NOT NULL, `ORDEREXECUTED` INT NOT NULL, `EXECTYPE` VARCHAR(10) NOT NULL, `MD5SUM` VARCHAR(35), `DESCRIPTION` VARCHAR(255), `COMMENTS` VARCHAR(255), `TAG` VARCHAR(255), `LIQUIBASE` VARCHAR(20), CONSTRAINT `PK_DATABASECHANGELOG` PRIMARY KEY (`ID`, `AUTHOR`, `FILENAME`));

-- Changeset src/kinton_master_changelog.xml::sql_mode::destevez::(Checksum: 3:825e3d2ad2e776f91586d6a0f1f70155)
SET SESSION sql_mode='';

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL', 'EXECUTED', 'src/kinton_master_changelog.xml', 'sql_mode', '2.0.3', '3:825e3d2ad2e776f91586d6a0f1f70155', 1);

-- Changeset src/2.0ga/schema.xml::1337848104277-1::destevezg (generated)::(Checksum: 3:1fa499c79ccc8dd6441f5be160a8a20a)
CREATE TABLE `kinton`.`accounting_event_detail` (`idAccountingEvent` BIGINT AUTO_INCREMENT NOT NULL, `startTime` TIMESTAMP DEFAULT '0000-00-00 00:00:00', `endTime` TIMESTAMP DEFAULT '0000-00-00 00:00:00', `idAccountingResourceType` TINYINT NOT NULL, `resourceType` VARCHAR(255) NOT NULL, `resourceUnits` BIGINT NOT NULL, `resourceName` VARCHAR(511) NOT NULL, `idEnterprise` INT UNSIGNED NOT NULL, `idVirtualDataCenter` INT UNSIGNED NOT NULL, `idVirtualApp` INT UNSIGNED, `idVirtualMachine` INT UNSIGNED, `enterpriseName` VARCHAR(255) NOT NULL, `virtualDataCenter` VARCHAR(255) NOT NULL, `virtualApp` VARCHAR(255), `virtualMachine` VARCHAR(255), `costCode` INT, `idStorageTier` INT, `version_c` INT DEFAULT 0, CONSTRAINT `PK_ACCOUNTING_EVENT_DETAIL` PRIMARY KEY (`idAccountingEvent`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-1', '2.0.3', '3:1fa499c79ccc8dd6441f5be160a8a20a', 2);

-- Changeset src/2.0ga/schema.xml::1337848104277-2::destevezg (generated)::(Checksum: 3:a5b0a4d26eaffc3be0bb048d99cf20d1)
CREATE TABLE `kinton`.`accounting_event_ips` (`idIPsAccountingEvent` BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, `idManagement` INT UNSIGNED NOT NULL, `idEnterprise` INT UNSIGNED NOT NULL, `idVirtualDataCenter` INT UNSIGNED NOT NULL, `ip` VARCHAR(20) NOT NULL, `startTime` TIMESTAMP, `stopTime` TIMESTAMP, `consolidated` TINYINT(1) DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_ACCOUNTING_EVENT_IPS` PRIMARY KEY (`idIPsAccountingEvent`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-2', '2.0.3', '3:a5b0a4d26eaffc3be0bb048d99cf20d1', 3);

-- Changeset src/2.0ga/schema.xml::1337848104277-3::destevezg (generated)::(Checksum: 3:4e9ef329616b20821f92e3b940adbc15)
CREATE TABLE `kinton`.`accounting_event_storage` (`idStorageAccountingEvent` BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, `idResource` VARCHAR(50), `resourceName` VARCHAR(511), `idVM` INT UNSIGNED, `idStorageTier` INT UNSIGNED, `idEnterprise` INT UNSIGNED NOT NULL, `idVirtualDataCenter` INT UNSIGNED NOT NULL, `idVirtualApp` INT UNSIGNED, `sizeReserved` BIGINT UNSIGNED NOT NULL, `startTime` TIMESTAMP, `stopTime` TIMESTAMP, `consolidated` TINYINT(1) DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_ACCOUNTING_EVENT_STORAGE` PRIMARY KEY (`idStorageAccountingEvent`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-3', '2.0.3', '3:4e9ef329616b20821f92e3b940adbc15', 4);

-- Changeset src/2.0ga/schema.xml::1337848104277-4::destevezg (generated)::(Checksum: 3:a033f02497669d24b6ed860cb02c221c)
CREATE TABLE `kinton`.`accounting_event_vlan` (`idVLANAccountingEvent` BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, `vlan_network_id` INT UNSIGNED NOT NULL, `idEnterprise` INT UNSIGNED NOT NULL, `idVirtualDataCenter` INT UNSIGNED NOT NULL, `network_name` VARCHAR(40) NOT NULL, `startTime` TIMESTAMP, `stopTime` TIMESTAMP, `consolidated` TINYINT(1) DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_ACCOUNTING_EVENT_VLAN` PRIMARY KEY (`idVLANAccountingEvent`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-4', '2.0.3', '3:a033f02497669d24b6ed860cb02c221c', 5);

-- Changeset src/2.0ga/schema.xml::1337848104277-5::destevezg (generated)::(Checksum: 3:47f51627ad81dc49264f67b42f543ba2)
CREATE TABLE `kinton`.`accounting_event_vm` (`idVMAccountingEvent` BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, `idVM` INT UNSIGNED NOT NULL, `idEnterprise` INT UNSIGNED NOT NULL, `idVirtualDataCenter` INT UNSIGNED NOT NULL, `idVirtualApp` INT UNSIGNED NOT NULL, `cpu` INT UNSIGNED NOT NULL, `ram` INT UNSIGNED NOT NULL, `hd` BIGINT UNSIGNED NOT NULL, `startTime` TIMESTAMP, `stopTime` TIMESTAMP, `consolidated` TINYINT(1) DEFAULT 0 NOT NULL, `costCode` INT, `hypervisorType` VARCHAR(255), `version_c` INT DEFAULT 0, CONSTRAINT `PK_ACCOUNTING_EVENT_VM` PRIMARY KEY (`idVMAccountingEvent`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-5', '2.0.3', '3:47f51627ad81dc49264f67b42f543ba2', 6);

-- Changeset src/2.0ga/schema.xml::1337848104277-6::destevezg (generated)::(Checksum: 3:8c73779c204ec6278df878eddd80b77f)
CREATE TABLE `kinton`.`alerts` (`id` CHAR(36) NOT NULL, `type` VARCHAR(60) NOT NULL, `value` VARCHAR(60) NOT NULL, `description` VARCHAR(240), `tstamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_ALERTS` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-6', '2.0.3', '3:8c73779c204ec6278df878eddd80b77f', 7);

-- Changeset src/2.0ga/schema.xml::1337848104277-7::destevezg (generated)::(Checksum: 3:787fd9772c35d842e8fd632d6268028b)
CREATE TABLE `kinton`.`apps_library` (`id_apps_library` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idEnterprise` INT UNSIGNED NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_APPS_LIBRARY` PRIMARY KEY (`id_apps_library`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-7', '2.0.3', '3:787fd9772c35d842e8fd632d6268028b', 8);

-- Changeset src/2.0ga/schema.xml::1337848104277-8::destevezg (generated)::(Checksum: 3:2f2cf3e39a6718ebebb7479456783cec)
CREATE TABLE `kinton`.`auth_group` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(20), `description` VARCHAR(50), `version_c` INT DEFAULT 0, CONSTRAINT `PK_AUTH_GROUP` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-8', '2.0.3', '3:2f2cf3e39a6718ebebb7479456783cec', 9);

-- Changeset src/2.0ga/schema.xml::1337848104277-9::destevezg (generated)::(Checksum: 3:c061c7bf09669bd5f7beaa3673089e9c)
CREATE TABLE `kinton`.`auth_serverresource` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(50), `description` VARCHAR(100), `idGroup` INT UNSIGNED, `idRole` INT UNSIGNED NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_AUTH_SERVERRESOURCE` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-9', '2.0.3', '3:c061c7bf09669bd5f7beaa3673089e9c', 10);

-- Changeset src/2.0ga/schema.xml::1337848104277-10::destevezg (generated)::(Checksum: 3:1b46903b83f80f738d133f73f614035e)
CREATE TABLE `kinton`.`auth_serverresource_exception` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idResource` INT UNSIGNED NOT NULL, `idUser` INT UNSIGNED NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_AUTH_SERVERRESOURCE_EXCEPTION` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-10', '2.0.3', '3:1b46903b83f80f738d133f73f614035e', 11);

-- Changeset src/2.0ga/schema.xml::1337848104277-11::destevezg (generated)::(Checksum: 3:a18dcd1a1be857c76cd9eea2a9884cd2)
CREATE TABLE `kinton`.`category` (`idCategory` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(30) NOT NULL, `isErasable` INT UNSIGNED DEFAULT 1 NOT NULL, `isDefault` INT UNSIGNED DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_CATEGORY` PRIMARY KEY (`idCategory`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-11', '2.0.3', '3:a18dcd1a1be857c76cd9eea2a9884cd2', 12);

-- Changeset src/2.0ga/schema.xml::1337848104277-12::destevezg (generated)::(Checksum: 3:479e5e3af9e6a44f4fc9dbed80e6a997)
CREATE TABLE `kinton`.`chargeback_simple` (`idAccountingResourceType` TINYINT NOT NULL, `resourceType` VARCHAR(20) NOT NULL, `costPerHour` DECIMAL(15,12) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_CHARGEBACK_SIMPLE` PRIMARY KEY (`idAccountingResourceType`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-12', '2.0.3', '3:479e5e3af9e6a44f4fc9dbed80e6a997', 13);

-- Changeset src/2.0ga/schema.xml::1337848104277-13::destevezg (generated)::(Checksum: 3:d6d05a87d471ea3396b72755a678b96f)
CREATE TABLE `kinton`.`chef_runlist` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idVM` INT UNSIGNED NOT NULL, `name` VARCHAR(100) NOT NULL, `description` VARCHAR(255), `priority` INT DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_CHEF_RUNLIST` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-13', '2.0.3', '3:d6d05a87d471ea3396b72755a678b96f', 14);

-- Changeset src/2.0ga/schema.xml::1337848104277-14::destevezg (generated)::(Checksum: 3:96dd6e407f119eb964fe42c62c2ca79e)
CREATE TABLE `kinton`.`cloud_usage_stats` (`idDataCenter` INT AUTO_INCREMENT NOT NULL, `serversTotal` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `serversRunning` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `storageTotal` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `storageReserved` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `storageUsed` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `publicIPsTotal` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `publicIPsReserved` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `publicIPsUsed` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vlanReserved` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vlanUsed` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vMachinesTotal` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vMachinesRunning` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vCpuTotal` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vCpuReserved` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vCpuUsed` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vMemoryTotal` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vMemoryReserved` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vMemoryUsed` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vStorageReserved` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vStorageUsed` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vStorageTotal` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `numUsersCreated` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `numVDCCreated` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `numEnterprisesCreated` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_CLOUD_USAGE_STATS` PRIMARY KEY (`idDataCenter`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-14', '2.0.3', '3:96dd6e407f119eb964fe42c62c2ca79e', 15);

-- Changeset src/2.0ga/schema.xml::1337848104277-15::destevezg (generated)::(Checksum: 3:760ab69dd396ccb94f6918d55a485cca)
CREATE TABLE `kinton`.`costCode` (`idCostCode` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(20) NOT NULL, `description` VARCHAR(100) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_COSTCODE` PRIMARY KEY (`idCostCode`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-15', '2.0.3', '3:760ab69dd396ccb94f6918d55a485cca', 16);

-- Changeset src/2.0ga/schema.xml::1337848104277-16::destevezg (generated)::(Checksum: 3:350a5d3c65c40a8fd81b1130a9114c49)
CREATE TABLE `kinton`.`costCodeCurrency` (`idCostCodeCurrency` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idCostCode` INT UNSIGNED, `idCurrency` INT UNSIGNED, `price` DECIMAL(20,5) DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_COSTCODECURRENCY` PRIMARY KEY (`idCostCodeCurrency`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-16', '2.0.3', '3:350a5d3c65c40a8fd81b1130a9114c49', 17);

-- Changeset src/2.0ga/schema.xml::1337848104277-17::destevezg (generated)::(Checksum: 3:52e834853212606010797cd36204c702)
CREATE TABLE `kinton`.`currency` (`idCurrency` INT UNSIGNED AUTO_INCREMENT NOT NULL, `symbol` VARCHAR(10) NOT NULL, `name` VARCHAR(20) NOT NULL, `digits` INT DEFAULT 2 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_CURRENCY` PRIMARY KEY (`idCurrency`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-17', '2.0.3', '3:52e834853212606010797cd36204c702', 18);

-- Changeset src/2.0ga/schema.xml::1337848104277-18::destevezg (generated)::(Checksum: 3:777e471b83d5a83febb9f9808983a265)
CREATE TABLE `kinton`.`datacenter` (`idDataCenter` INT UNSIGNED AUTO_INCREMENT NOT NULL, `uuid` VARCHAR(40), `name` VARCHAR(20) NOT NULL, `situation` VARCHAR(100), `network_id` INT UNSIGNED, `version_c` INT DEFAULT 0, CONSTRAINT `PK_DATACENTER` PRIMARY KEY (`idDataCenter`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-18', '2.0.3', '3:777e471b83d5a83febb9f9808983a265', 19);

-- Changeset src/2.0ga/schema.xml::1337848104277-19::destevezg (generated)::(Checksum: 3:d68cedf4ba1325816fbcdb17e78f4bb4)
CREATE TABLE `kinton`.`datastore` (`idDatastore` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(255) NOT NULL, `rootPath` VARCHAR(42) NOT NULL, `directory` VARCHAR(255) NOT NULL, `enabled` TINYINT(1) DEFAULT 0 NOT NULL, `size` BIGINT UNSIGNED NOT NULL, `usedSize` BIGINT UNSIGNED NOT NULL, `datastoreUuid` VARCHAR(255), `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_DATASTORE` PRIMARY KEY (`idDatastore`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-19', '2.0.3', '3:d68cedf4ba1325816fbcdb17e78f4bb4', 20);

-- Changeset src/2.0ga/schema.xml::1337848104277-20::destevezg (generated)::(Checksum: 3:53a123366dce86c925fde8ee9bbf5cfb)
CREATE TABLE `kinton`.`datastore_assignment` (`idDatastore` INT UNSIGNED NOT NULL, `idPhysicalMachine` INT UNSIGNED DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 1 NOT NULL) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-20', '2.0.3', '3:53a123366dce86c925fde8ee9bbf5cfb', 21);

-- Changeset src/2.0ga/schema.xml::1337848104277-21::destevezg (generated)::(Checksum: 3:d2145318a654660d2fbaf801a8359041)
CREATE TABLE `kinton`.`dc_enterprise_stats` (`idDCEnterpriseStats` INT AUTO_INCREMENT NOT NULL, `idDataCenter` INT NOT NULL, `idEnterprise` INT NOT NULL, `vCpuReserved` BIGINT UNSIGNED DEFAULT 0, `vCpuUsed` BIGINT UNSIGNED DEFAULT 0, `memoryReserved` BIGINT UNSIGNED DEFAULT 0, `memoryUsed` BIGINT UNSIGNED DEFAULT 0, `localStorageReserved` BIGINT UNSIGNED DEFAULT 0, `localStorageUsed` BIGINT UNSIGNED DEFAULT 0, `extStorageReserved` BIGINT UNSIGNED DEFAULT 0, `extStorageUsed` BIGINT UNSIGNED DEFAULT 0, `repositoryReserved` BIGINT UNSIGNED DEFAULT 0, `repositoryUsed` BIGINT UNSIGNED DEFAULT 0, `publicIPsReserved` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `publicIPsUsed` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vlanReserved` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vlanUsed` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_DC_ENTERPRISE_STATS` PRIMARY KEY (`idDCEnterpriseStats`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-21', '2.0.3', '3:d2145318a654660d2fbaf801a8359041', 22);

-- Changeset src/2.0ga/schema.xml::1337848104277-22::destevezg (generated)::(Checksum: 3:9e463f91eba996f9ffea2d3d0d60c578)
CREATE TABLE `kinton`.`dhcpOption` (`idDhcpOption` INT UNSIGNED AUTO_INCREMENT NOT NULL, `dhcp_opt` INT NOT NULL, `gateway` VARCHAR(40), `network_address` VARCHAR(40) NOT NULL, `mask` INT NOT NULL, `netmask` VARCHAR(20) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_DHCPOPTION` PRIMARY KEY (`idDhcpOption`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-22', '2.0.3', '3:9e463f91eba996f9ffea2d3d0d60c578', 23);

-- Changeset src/2.0ga/schema.xml::1337848104277-23::destevezg (generated)::(Checksum: 3:d988c667cb5fb43d55ceea415d9d5205)
CREATE TABLE `kinton`.`disk_management` (`idManagement` INT UNSIGNED NOT NULL, `idDatastore` INT UNSIGNED, `version_c` INT DEFAULT 0) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-23', '2.0.3', '3:d988c667cb5fb43d55ceea415d9d5205', 24);

-- Changeset src/2.0ga/schema.xml::1337848104277-24::destevezg (generated)::(Checksum: 3:0f2fd84257dfbe356711b4ca8cd305a7)
CREATE TABLE `kinton`.`diskstateful_conversions` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `imagePath` VARCHAR(256) NOT NULL, `idManagement` INT UNSIGNED NOT NULL, `state` VARCHAR(50) NOT NULL, `convertionTimestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_DISKSTATEFUL_CONVERSIONS` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-24', '2.0.3', '3:0f2fd84257dfbe356711b4ca8cd305a7', 25);

-- Changeset src/2.0ga/schema.xml::1337848104277-25::destevezg (generated)::(Checksum: 3:130b6dc57dfad1397c35625d5d1463c2)
CREATE TABLE `kinton`.`enterprise` (`idEnterprise` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(40) NOT NULL, `ramSoft` BIGINT DEFAULT 0 NOT NULL, `cpuSoft` BIGINT DEFAULT 0 NOT NULL, `hdSoft` BIGINT DEFAULT 0 NOT NULL, `storageSoft` BIGINT DEFAULT 0 NOT NULL, `repositorySoft` BIGINT DEFAULT 0 NOT NULL, `vlanSoft` BIGINT DEFAULT 0 NOT NULL, `publicIPSoft` BIGINT DEFAULT 0 NOT NULL, `ramHard` BIGINT DEFAULT 0 NOT NULL, `cpuHard` BIGINT DEFAULT 0 NOT NULL, `hdHard` BIGINT DEFAULT 0 NOT NULL, `storageHard` BIGINT DEFAULT 0 NOT NULL, `repositoryHard` BIGINT DEFAULT 0 NOT NULL, `vlanHard` BIGINT DEFAULT 0 NOT NULL, `publicIPHard` BIGINT DEFAULT 0 NOT NULL, `chef_url` VARCHAR(255), `chef_client` VARCHAR(50), `chef_validator` VARCHAR(50), `chef_client_certificate` TEXT, `chef_validator_certificate` TEXT, `isReservationRestricted` TINYINT(1) DEFAULT 0, `version_c` INT DEFAULT 1 NOT NULL, `idPricingTemplate` INT UNSIGNED, CONSTRAINT `PK_ENTERPRISE` PRIMARY KEY (`idEnterprise`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-25', '2.0.3', '3:130b6dc57dfad1397c35625d5d1463c2', 26);

-- Changeset src/2.0ga/schema.xml::1337848104277-26::destevezg (generated)::(Checksum: 3:69bfe558818115ac4b4dfa84d3d8de1e)
CREATE TABLE `kinton`.`enterprise_limits_by_datacenter` (`idDatacenterLimit` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idEnterprise` INT UNSIGNED, `idDataCenter` INT UNSIGNED, `ramSoft` BIGINT NOT NULL, `cpuSoft` BIGINT NOT NULL, `hdSoft` BIGINT NOT NULL, `storageSoft` BIGINT NOT NULL, `repositorySoft` BIGINT NOT NULL, `vlanSoft` BIGINT NOT NULL, `publicIPSoft` BIGINT NOT NULL, `ramHard` BIGINT NOT NULL, `cpuHard` BIGINT NOT NULL, `hdHard` BIGINT NOT NULL, `storageHard` BIGINT NOT NULL, `repositoryHard` BIGINT NOT NULL, `vlanHard` BIGINT NOT NULL, `publicIPHard` BIGINT NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, `default_vlan_network_id` INT UNSIGNED, CONSTRAINT `PK_ENTERPRISE_LIMITS_BY_DATACENTER` PRIMARY KEY (`idDatacenterLimit`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-26', '2.0.3', '3:69bfe558818115ac4b4dfa84d3d8de1e', 27);

-- Changeset src/2.0ga/schema.xml::1337848104277-27::destevezg (generated)::(Checksum: 3:81c8e8fb31d3d86128542bfe21e002a9)
CREATE TABLE `kinton`.`enterprise_properties` (`idProperties` INT UNSIGNED AUTO_INCREMENT NOT NULL, `enterprise` INT UNSIGNED, `version_c` INT DEFAULT 0, CONSTRAINT `PK_ENTERPRISE_PROPERTIES` PRIMARY KEY (`idProperties`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-27', '2.0.3', '3:81c8e8fb31d3d86128542bfe21e002a9', 28);

-- Changeset src/2.0ga/schema.xml::1337848104277-28::destevezg (generated)::(Checksum: 3:5e0b809fab55e8118cc216e1d306bf3a)
CREATE TABLE `kinton`.`enterprise_properties_map` (`enterprise_properties` INT UNSIGNED NOT NULL, `map_key` VARCHAR(30) NOT NULL, `value` VARCHAR(50), `version_c` INT DEFAULT 0) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-28', '2.0.3', '3:5e0b809fab55e8118cc216e1d306bf3a', 29);

-- Changeset src/2.0ga/schema.xml::1337848104277-29::destevezg (generated)::(Checksum: 3:3efb70d74c36d5683996dfd24c8ddf12)
CREATE TABLE `kinton`.`enterprise_resources_stats` (`idEnterprise` INT AUTO_INCREMENT NOT NULL, `vCpuReserved` BIGINT UNSIGNED DEFAULT 0, `vCpuUsed` BIGINT UNSIGNED DEFAULT 0, `memoryReserved` BIGINT UNSIGNED DEFAULT 0, `memoryUsed` BIGINT UNSIGNED DEFAULT 0, `localStorageReserved` BIGINT UNSIGNED DEFAULT 0, `localStorageUsed` BIGINT UNSIGNED DEFAULT 0, `extStorageReserved` BIGINT UNSIGNED DEFAULT 0, `extStorageUsed` BIGINT UNSIGNED DEFAULT 0, `repositoryReserved` BIGINT UNSIGNED DEFAULT 0, `repositoryUsed` BIGINT UNSIGNED DEFAULT 0, `publicIPsReserved` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `publicIPsUsed` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vlanReserved` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `vlanUsed` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_ENTERPRISE_RESOURCES_STATS` PRIMARY KEY (`idEnterprise`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-29', '2.0.3', '3:3efb70d74c36d5683996dfd24c8ddf12', 30);

-- Changeset src/2.0ga/schema.xml::1337848104277-30::destevezg (generated)::(Checksum: 3:59245dc17805f9917702e777dece5d96)
CREATE TABLE `kinton`.`enterprise_theme` (`idEnterprise` INT UNSIGNED NOT NULL, `company_logo_path` TEXT, `theme` TEXT, `version_c` INT DEFAULT 0, CONSTRAINT `PK_ENTERPRISE_THEME` PRIMARY KEY (`idEnterprise`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-30', '2.0.3', '3:59245dc17805f9917702e777dece5d96', 31);

-- Changeset src/2.0ga/schema.xml::1337848104277-31::destevezg (generated)::(Checksum: 3:cb53ef7e84b6a2edd5eb4c691b082e2e)
CREATE TABLE `kinton`.`heartbeatlog` (`id` CHAR(36) NOT NULL, `abicloud_id` VARCHAR(60), `client_ip` VARCHAR(16) NOT NULL, `physical_servers` INT NOT NULL, `virtual_machines` INT NOT NULL, `volumes` INT NOT NULL, `virtual_datacenters` INT NOT NULL, `virtual_appliances` INT NOT NULL, `organizations` INT NOT NULL, `total_virtual_cores_allocated` BIGINT NOT NULL, `total_virtual_cores_used` BIGINT NOT NULL, `total_virtual_cores` BIGINT DEFAULT 0 NOT NULL, `total_virtual_memory_allocated` BIGINT NOT NULL, `total_virtual_memory_used` BIGINT NOT NULL, `total_virtual_memory` BIGINT DEFAULT 0 NOT NULL, `total_volume_space_allocated` BIGINT NOT NULL, `total_volume_space_used` BIGINT NOT NULL, `total_volume_space` BIGINT DEFAULT 0 NOT NULL, `virtual_images` BIGINT NOT NULL, `operating_system_name` VARCHAR(60) NOT NULL, `operating_system_version` VARCHAR(60) NOT NULL, `database_name` VARCHAR(60) NOT NULL, `database_version` VARCHAR(60) NOT NULL, `application_server_name` VARCHAR(60) NOT NULL, `application_server_version` VARCHAR(60) NOT NULL, `java_version` VARCHAR(60) NOT NULL, `abicloud_version` VARCHAR(60) NOT NULL, `abicloud_distribution` VARCHAR(60) NOT NULL, `tstamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_HEARTBEATLOG` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-31', '2.0.3', '3:cb53ef7e84b6a2edd5eb4c691b082e2e', 32);

-- Changeset src/2.0ga/schema.xml::1337848104277-32::destevezg (generated)::(Checksum: 3:a54346d08d039caf856158c98342047a)
CREATE TABLE `kinton`.`hypervisor` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idPhysicalMachine` INT UNSIGNED NOT NULL, `ip` VARCHAR(39) NOT NULL, `ipService` VARCHAR(39) NOT NULL, `port` INT NOT NULL, `user` VARCHAR(255) DEFAULT 'user' NOT NULL, `password` VARCHAR(255) DEFAULT 'password' NOT NULL, `version_c` INT DEFAULT 0, `type` VARCHAR(255) NOT NULL, CONSTRAINT `PK_HYPERVISOR` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-32', '2.0.3', '3:a54346d08d039caf856158c98342047a', 33);

-- Changeset src/2.0ga/schema.xml::1337848104277-33::destevezg (generated)::(Checksum: 3:4553169cea18f126cd0add78eac0a8a7)
CREATE TABLE `kinton`.`initiator_mapping` (`idInitiatorMapping` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idManagement` INT UNSIGNED NOT NULL, `initiatorIqn` VARCHAR(256) NOT NULL, `targetIqn` VARCHAR(256) NOT NULL, `targetLun` INT NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_INITIATOR_MAPPING` PRIMARY KEY (`idInitiatorMapping`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-33', '2.0.3', '3:4553169cea18f126cd0add78eac0a8a7', 34);

-- Changeset src/2.0ga/schema.xml::1337848104277-34::destevezg (generated)::(Checksum: 3:b2a4028100a7a39f1d1020a793a2bd9f)
CREATE TABLE `kinton`.`ip_pool_management` (`idManagement` INT UNSIGNED NOT NULL, `mac` VARCHAR(20), `name` VARCHAR(30), `ip` VARCHAR(20) NOT NULL, `vlan_network_name` VARCHAR(40), `vlan_network_id` INT UNSIGNED, `quarantine` TINYINT(1) DEFAULT 0 NOT NULL, `available` TINYINT(1) DEFAULT 1 NOT NULL, `version_c` INT DEFAULT 1 NOT NULL) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-34', '2.0.3', '3:b2a4028100a7a39f1d1020a793a2bd9f', 35);

-- Changeset src/2.0ga/schema.xml::1337848104277-35::destevezg (generated)::(Checksum: 3:114b963b04c30bcc8c4d309ae5680cc3)
CREATE TABLE `kinton`.`license` (`idLicense` INT AUTO_INCREMENT NOT NULL, `data` VARCHAR(1000) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_LICENSE` PRIMARY KEY (`idLicense`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-35', '2.0.3', '3:114b963b04c30bcc8c4d309ae5680cc3', 36);

-- Changeset src/2.0ga/schema.xml::1337848104277-36::destevezg (generated)::(Checksum: 3:ee7e8564f9a6f927ba5cd46c21a88d36)
CREATE TABLE `kinton`.`log` (`idLog` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idVirtualApp` INT UNSIGNED NOT NULL, `description` VARCHAR(250) NOT NULL, `logDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `deleted` TINYINT(1) DEFAULT 0, `version_c` INT DEFAULT 0, CONSTRAINT `PK_LOG` PRIMARY KEY (`idLog`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-36', '2.0.3', '3:ee7e8564f9a6f927ba5cd46c21a88d36', 37);

-- Changeset src/2.0ga/schema.xml::1337848104277-37::destevezg (generated)::(Checksum: 3:2afd5ca9c33785df19d5bb7d1ea1c7e8)
CREATE TABLE `kinton`.`metering` (`idMeter` BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, `idDatacenter` INT UNSIGNED, `datacenter` VARCHAR(20), `idRack` INT UNSIGNED, `rack` VARCHAR(20), `idPhysicalMachine` INT UNSIGNED, `physicalmachine` VARCHAR(256), `idStorageSystem` INT UNSIGNED, `storageSystem` VARCHAR(256), `idStoragePool` VARCHAR(40), `storagePool` VARCHAR(256), `idVolume` VARCHAR(50), `volume` VARCHAR(256), `idNetwork` INT UNSIGNED, `network` VARCHAR(256), `idSubnet` INT UNSIGNED, `subnet` VARCHAR(256), `idEnterprise` INT UNSIGNED, `enterprise` VARCHAR(40), `idUser` INT UNSIGNED, `user` VARCHAR(128), `idVirtualDataCenter` INT UNSIGNED, `virtualDataCenter` VARCHAR(40), `idVirtualApp` INT UNSIGNED, `virtualApp` VARCHAR(30), `idVirtualMachine` INT UNSIGNED, `virtualmachine` VARCHAR(256), `severity` VARCHAR(100) NOT NULL, `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `performedby` VARCHAR(255) NOT NULL, `actionperformed` VARCHAR(100) NOT NULL, `component` VARCHAR(255), `stacktrace` TEXT, `version_c` INT DEFAULT 0, CONSTRAINT `PK_METERING` PRIMARY KEY (`idMeter`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-37', '2.0.3', '3:2afd5ca9c33785df19d5bb7d1ea1c7e8', 38);

-- Changeset src/2.0ga/schema.xml::1337848104277-38::destevezg (generated)::(Checksum: 3:2b979f45c26c5d78a80ceeab7e7f109b)
CREATE TABLE `kinton`.`network` (`network_id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `uuid` VARCHAR(40) NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_NETWORK` PRIMARY KEY (`network_id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-38', '2.0.3', '3:2b979f45c26c5d78a80ceeab7e7f109b', 39);

-- Changeset src/2.0ga/schema.xml::1337848104277-39::destevezg (generated)::(Checksum: 3:bc49a7c19baf45004bf6519288bbfa37)
CREATE TABLE `kinton`.`network_configuration` (`network_configuration_id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `gateway` VARCHAR(40), `network_address` VARCHAR(40) NOT NULL, `mask` INT NOT NULL, `netmask` VARCHAR(20) NOT NULL, `primary_dns` VARCHAR(20), `secondary_dns` VARCHAR(20), `sufix_dns` VARCHAR(40), `fence_mode` VARCHAR(20) NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_NETWORK_CONFIGURATION` PRIMARY KEY (`network_configuration_id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-39', '2.0.3', '3:bc49a7c19baf45004bf6519288bbfa37', 40);

-- Changeset src/2.0ga/schema.xml::1337848104277-40::destevezg (generated)::(Checksum: 3:6b91194ab89222dcf4e42dcf86a9b16c)
CREATE TABLE `kinton`.`node` (`idVirtualApp` INT UNSIGNED NOT NULL, `idNode` INT UNSIGNED AUTO_INCREMENT NOT NULL, `modified` INT NOT NULL, `posX` INT DEFAULT 0 NOT NULL, `posY` INT DEFAULT 0 NOT NULL, `type` VARCHAR(50) NOT NULL, `name` VARCHAR(255) NOT NULL, `ip` VARCHAR(15), `mac` VARCHAR(17), `version_c` INT DEFAULT 0, CONSTRAINT `PK_NODE` PRIMARY KEY (`idNode`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-40', '2.0.3', '3:6b91194ab89222dcf4e42dcf86a9b16c', 41);

-- Changeset src/2.0ga/schema.xml::1337848104277-41::destevezg (generated)::(Checksum: 3:5649c82dca080d57f5e9f1ded0f7fa8a)
CREATE TABLE `kinton`.`node_virtual_image_stateful_conversions` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `newName` VARCHAR(255) NOT NULL, `idVirtualApplianceStatefulConversion` INT UNSIGNED NOT NULL, `idNodeVirtualImage` INT UNSIGNED NOT NULL, `idVirtualImageConversion` INT UNSIGNED, `idDiskStatefulConversion` INT UNSIGNED, `state` VARCHAR(50) NOT NULL, `subState` VARCHAR(50), `version_c` INT DEFAULT 0, `idTier` INT UNSIGNED NOT NULL, `idManagement` INT UNSIGNED, CONSTRAINT `PK_NODE_VIRTUAL_IMAGE_STATEFUL_CONVERSIONS` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-41', '2.0.3', '3:5649c82dca080d57f5e9f1ded0f7fa8a', 42);

-- Changeset src/2.0ga/schema.xml::1337848104277-42::destevezg (generated)::(Checksum: 3:1be16468c3ddde51bd8426c9aeb9b373)
CREATE TABLE `kinton`.`nodenetwork` (`idNode` INT UNSIGNED NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_NODENETWORK` PRIMARY KEY (`idNode`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-42', '2.0.3', '3:1be16468c3ddde51bd8426c9aeb9b373', 43);

-- Changeset src/2.0ga/schema.xml::1337848104277-43::destevezg (generated)::(Checksum: 3:d45df511418af4a35e7902e37d7109b8)
CREATE TABLE `kinton`.`noderelationtype` (`idNodeRelationType` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(20), `version_c` INT DEFAULT 0, CONSTRAINT `PK_NODERELATIONTYPE` PRIMARY KEY (`idNodeRelationType`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-43', '2.0.3', '3:d45df511418af4a35e7902e37d7109b8', 44);

-- Changeset src/2.0ga/schema.xml::1337848104277-44::destevezg (generated)::(Checksum: 3:bcf1d9ce455ec5a034d49f8cdc77bbae)
CREATE TABLE `kinton`.`nodestorage` (`idNode` INT UNSIGNED DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_NODESTORAGE` PRIMARY KEY (`idNode`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-44', '2.0.3', '3:bcf1d9ce455ec5a034d49f8cdc77bbae', 45);

-- Changeset src/2.0ga/schema.xml::1337848104277-45::destevezg (generated)::(Checksum: 3:4299e545c98449bcf16aaba9d3dd5af8)
CREATE TABLE `kinton`.`nodevirtualimage` (`idNode` INT UNSIGNED NOT NULL, `idVM` INT UNSIGNED, `idImage` INT UNSIGNED NOT NULL, `version_c` INT DEFAULT 0) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-45', '2.0.3', '3:4299e545c98449bcf16aaba9d3dd5af8', 46);

-- Changeset src/2.0ga/schema.xml::1337848104277-46::destevezg (generated)::(Checksum: 3:0905951d123429ef1a7b0017106c8ee9)
CREATE TABLE `kinton`.`one_time_token` (`idOneTimeTokenSession` INT UNSIGNED AUTO_INCREMENT NOT NULL, `token` VARCHAR(128) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_ONE_TIME_TOKEN` PRIMARY KEY (`idOneTimeTokenSession`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-46', '2.0.3', '3:0905951d123429ef1a7b0017106c8ee9', 47);

-- Changeset src/2.0ga/schema.xml::1337848104277-47::destevezg (generated)::(Checksum: 3:de0b803f07cd4aa3007ffbf9668a63ea)
CREATE TABLE `kinton`.`ovf_package` (`id_ovf_package` INT AUTO_INCREMENT NOT NULL, `id_apps_library` INT UNSIGNED NOT NULL, `url` VARCHAR(255) NOT NULL, `name` VARCHAR(255), `description` VARCHAR(255), `iconUrl` VARCHAR(255), `productName` VARCHAR(255), `productUrl` VARCHAR(45), `productVersion` VARCHAR(45), `productVendor` VARCHAR(45), `idCategory` INT UNSIGNED, `diskSizeMb` BIGINT, `version_c` INT DEFAULT 0, `type` VARCHAR(50) NOT NULL, CONSTRAINT `PK_OVF_PACKAGE` PRIMARY KEY (`id_ovf_package`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-47', '2.0.3', '3:de0b803f07cd4aa3007ffbf9668a63ea', 48);

-- Changeset src/2.0ga/schema.xml::1337848104277-48::destevezg (generated)::(Checksum: 3:0b09400a24f84219969aad8045a2a18e)
CREATE TABLE `kinton`.`ovf_package_list` (`id_ovf_package_list` INT AUTO_INCREMENT NOT NULL, `name` VARCHAR(45) NOT NULL, `url` VARCHAR(255), `id_apps_library` INT UNSIGNED NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_OVF_PACKAGE_LIST` PRIMARY KEY (`id_ovf_package_list`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-48', '2.0.3', '3:0b09400a24f84219969aad8045a2a18e', 49);

-- Changeset src/2.0ga/schema.xml::1337848104277-49::destevezg (generated)::(Checksum: 3:5f1327b65c8ac5737d7b7c3e1081b8ee)
CREATE TABLE `kinton`.`ovf_package_list_has_ovf_package` (`id_ovf_package_list` INT NOT NULL, `id_ovf_package` INT NOT NULL, `version_c` INT DEFAULT 0) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-49', '2.0.3', '3:5f1327b65c8ac5737d7b7c3e1081b8ee', 50);

-- Changeset src/2.0ga/schema.xml::1337848104277-50::destevezg (generated)::(Checksum: 3:024157dffa5204f1647087501ae70c0e)
CREATE TABLE `kinton`.`physicalmachine` (`idPhysicalMachine` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idRack` INT UNSIGNED, `idDataCenter` INT UNSIGNED NOT NULL, `name` VARCHAR(256) NOT NULL, `description` VARCHAR(100), `ram` INT NOT NULL, `cpu` INT NOT NULL, `ramUsed` INT NOT NULL, `cpuUsed` INT NOT NULL, `idState` INT UNSIGNED DEFAULT 0 NOT NULL, `vswitchName` VARCHAR(200) NOT NULL, `idEnterprise` INT UNSIGNED, `initiatorIQN` VARCHAR(256), `version_c` INT DEFAULT 0, `ipmiIP` VARCHAR(39), `ipmiPort` INT UNSIGNED, `ipmiUser` VARCHAR(255), `ipmiPassword` VARCHAR(255), CONSTRAINT `PK_PHYSICALMACHINE` PRIMARY KEY (`idPhysicalMachine`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-50', '2.0.3', '3:024157dffa5204f1647087501ae70c0e', 51);

-- Changeset src/2.0ga/schema.xml::1337848104277-51::destevezg (generated)::(Checksum: 3:806f7e446f68098dd0d41c0105a24438)
CREATE TABLE `kinton`.`pricingCostCode` (`idPricingCostCode` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idPricingTemplate` INT UNSIGNED NOT NULL, `idCostCode` INT UNSIGNED NOT NULL, `price` DECIMAL(20,5) DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_PRICINGCOSTCODE` PRIMARY KEY (`idPricingCostCode`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-51', '2.0.3', '3:806f7e446f68098dd0d41c0105a24438', 52);

-- Changeset src/2.0ga/schema.xml::1337848104277-52::destevezg (generated)::(Checksum: 3:56295e26860afbba5936ef2dc472e0a0)
CREATE TABLE `kinton`.`pricingTemplate` (`idPricingTemplate` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idCurrency` INT UNSIGNED NOT NULL, `name` VARCHAR(256) NOT NULL, `chargingPeriod` INT UNSIGNED NOT NULL, `minimumCharge` INT UNSIGNED NOT NULL, `showChangesBefore` TINYINT(1) DEFAULT 0 NOT NULL, `standingChargePeriod` DECIMAL(20,5) DEFAULT 0 NOT NULL, `minimumChargePeriod` DECIMAL(20,5) DEFAULT 0 NOT NULL, `vcpu` DECIMAL(20,5) DEFAULT 0 NOT NULL, `memoryMB` DECIMAL(20,5) DEFAULT 0 NOT NULL, `hdGB` DECIMAL(20,5) DEFAULT 0 NOT NULL, `vlan` DECIMAL(20,5) DEFAULT 0 NOT NULL, `publicIp` DECIMAL(20,5) DEFAULT 0 NOT NULL, `defaultTemplate` TINYINT(1) DEFAULT 0 NOT NULL, `description` VARCHAR(1000) NOT NULL, `last_update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_PRICINGTEMPLATE` PRIMARY KEY (`idPricingTemplate`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-52', '2.0.3', '3:56295e26860afbba5936ef2dc472e0a0', 53);

-- Changeset src/2.0ga/schema.xml::1337848104277-53::destevezg (generated)::(Checksum: 3:047c5fbafa97112cfa815ca57b7d9136)
CREATE TABLE `kinton`.`pricingTier` (`idPricingTier` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idPricingTemplate` INT UNSIGNED NOT NULL, `idTier` INT UNSIGNED NOT NULL, `price` DECIMAL(20,5) DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_PRICINGTIER` PRIMARY KEY (`idPricingTier`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-53', '2.0.3', '3:047c5fbafa97112cfa815ca57b7d9136', 54);

-- Changeset src/2.0ga/schema.xml::1337848104277-54::destevezg (generated)::(Checksum: 3:4796cbed4e74dd02dcc2f68df1794d79)
CREATE TABLE `kinton`.`privilege` (`idPrivilege` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(50) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_PRIVILEGE` PRIMARY KEY (`idPrivilege`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-54', '2.0.3', '3:4796cbed4e74dd02dcc2f68df1794d79', 55);

-- Changeset src/2.0ga/schema.xml::1337848104277-55::destevezg (generated)::(Checksum: 3:f196649f225ac654a9587ceb1878b586)
CREATE TABLE `kinton`.`rack` (`idRack` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idDataCenter` INT UNSIGNED NOT NULL, `name` VARCHAR(20) NOT NULL, `shortDescription` VARCHAR(30), `largeDescription` VARCHAR(100), `vlan_id_min` INT UNSIGNED DEFAULT 2, `vlan_id_max` INT UNSIGNED DEFAULT 4094, `vlans_id_avoided` VARCHAR(255) DEFAULT '', `vlan_per_vdc_expected` INT UNSIGNED DEFAULT 8, `nrsq` INT UNSIGNED DEFAULT 10, `haEnabled` TINYINT(1) DEFAULT 0, `version_c` INT DEFAULT 0, CONSTRAINT `PK_RACK` PRIMARY KEY (`idRack`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-55', '2.0.3', '3:f196649f225ac654a9587ceb1878b586', 56);

-- Changeset src/2.0ga/schema.xml::1337848104277-56::destevezg (generated)::(Checksum: 3:253740b8f537edc756c126a302f88433)
CREATE TABLE `kinton`.`rasd` (`address` VARCHAR(256), `addressOnParent` VARCHAR(25), `allocationUnits` VARCHAR(15), `automaticAllocation` INT, `automaticDeallocation` INT, `caption` VARCHAR(15), `changeableType` INT, `configurationName` VARCHAR(15), `connectionResource` VARCHAR(256), `consumerVisibility` INT, `description` VARCHAR(255), `elementName` VARCHAR(255) NOT NULL, `generation` BIGINT, `hostResource` VARCHAR(256), `instanceID` VARCHAR(50) NOT NULL, `limitResource` BIGINT, `mappingBehaviour` INT, `otherResourceType` VARCHAR(50), `parent` VARCHAR(50), `poolID` VARCHAR(50), `reservation` BIGINT, `resourceSubType` VARCHAR(15), `resourceType` INT NOT NULL, `virtualQuantity` INT, `weight` INT, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_RASD` PRIMARY KEY (`instanceID`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-56', '2.0.3', '3:253740b8f537edc756c126a302f88433', 57);

-- Changeset src/2.0ga/schema.xml::1337848104277-57::destevezg (generated)::(Checksum: 3:73427f139a1db872852342e290eef17f)
CREATE TABLE `kinton`.`rasd_management` (`idManagement` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idResourceType` VARCHAR(5) NOT NULL, `idVirtualDataCenter` INT UNSIGNED, `idVM` INT UNSIGNED, `idResource` VARCHAR(50), `idVirtualApp` INT UNSIGNED, `version_c` INT DEFAULT 1 NOT NULL, `temporal` INT UNSIGNED, `sequence` INT UNSIGNED, CONSTRAINT `PK_RASD_MANAGEMENT` PRIMARY KEY (`idManagement`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-57', '2.0.3', '3:73427f139a1db872852342e290eef17f', 58);

-- Changeset src/2.0ga/schema.xml::1337848104277-58::destevezg (generated)::(Checksum: 3:e458e4c5fa8663a002b73404936feaac)
CREATE TABLE `kinton`.`register` (`id` CHAR(36) NOT NULL, `company_name` VARCHAR(60) NOT NULL, `company_address` VARCHAR(240) NOT NULL, `company_state` VARCHAR(60) NOT NULL, `company_country_code` VARCHAR(2) NOT NULL, `company_industry` VARCHAR(255), `contact_title` VARCHAR(60) NOT NULL, `contact_name` VARCHAR(60) NOT NULL, `contact_email` VARCHAR(60) NOT NULL, `contact_phone` VARCHAR(60) NOT NULL, `company_size_revenue` VARCHAR(60) NOT NULL, `company_size_employees` VARCHAR(60) NOT NULL, `subscribe_development_news` TINYINT(1) DEFAULT 0 NOT NULL, `subscribe_commercial_news` TINYINT(1) DEFAULT 0 NOT NULL, `allow_commercial_contact` TINYINT(1) DEFAULT 0 NOT NULL, `creation_date` TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL, `last_updated` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_REGISTER` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-58', '2.0.3', '3:e458e4c5fa8663a002b73404936feaac', 59);

-- Changeset src/2.0ga/schema.xml::1337848104277-59::destevezg (generated)::(Checksum: 3:4290f1bf5e82a9c984a4c2f45aa39289)
CREATE TABLE `kinton`.`remote_service` (`idRemoteService` INT UNSIGNED AUTO_INCREMENT NOT NULL, `uri` VARCHAR(255) NOT NULL, `idDataCenter` INT UNSIGNED NOT NULL, `status` INT UNSIGNED DEFAULT 0 NOT NULL, `remoteServiceType` VARCHAR(255) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_REMOTE_SERVICE` PRIMARY KEY (`idRemoteService`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-59', '2.0.3', '3:4290f1bf5e82a9c984a4c2f45aa39289', 60);

-- Changeset src/2.0ga/schema.xml::1337848104277-60::destevezg (generated)::(Checksum: 3:106c340f4a0e9c1c846366d46ead4b3f)
CREATE TABLE `kinton`.`repository` (`idRepository` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idDataCenter` INT UNSIGNED NOT NULL, `name` VARCHAR(30), `URL` VARCHAR(255) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_REPOSITORY` PRIMARY KEY (`idRepository`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-60', '2.0.3', '3:106c340f4a0e9c1c846366d46ead4b3f', 61);

-- Changeset src/2.0ga/schema.xml::1337848104277-61::destevezg (generated)::(Checksum: 3:7c35032bce567fc743c7560c27367c0f)
CREATE TABLE `kinton`.`role` (`idRole` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(40) DEFAULT 'auto_name' NOT NULL, `idEnterprise` INT UNSIGNED, `blocked` TINYINT(1) DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_ROLE` PRIMARY KEY (`idRole`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-61', '2.0.3', '3:7c35032bce567fc743c7560c27367c0f', 62);

-- Changeset src/2.0ga/schema.xml::1337848104277-62::destevezg (generated)::(Checksum: 3:42731c72cb6d0e17604237240fc0562e)
CREATE TABLE `kinton`.`role_ldap` (`idRole_ldap` INT AUTO_INCREMENT NOT NULL, `idRole` INT UNSIGNED NOT NULL, `role_ldap` VARCHAR(128) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_ROLE_LDAP` PRIMARY KEY (`idRole_ldap`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-62', '2.0.3', '3:42731c72cb6d0e17604237240fc0562e', 63);

-- Changeset src/2.0ga/schema.xml::1337848104277-63::destevezg (generated)::(Checksum: 3:e0e26dde37f9d7d63c09fd55968c0977)
CREATE TABLE `kinton`.`roles_privileges` (`idRole` INT UNSIGNED NOT NULL, `idPrivilege` INT UNSIGNED NOT NULL, `version_c` INT DEFAULT 0) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-63', '2.0.3', '3:e0e26dde37f9d7d63c09fd55968c0977', 64);

-- Changeset src/2.0ga/schema.xml::1337848104277-64::destevezg (generated)::(Checksum: 3:0d056c8aecd4026dcda8627ad06d634c)
CREATE TABLE `kinton`.`session` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `user` VARCHAR(128) NOT NULL, `key` VARCHAR(100) NOT NULL, `expireDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `idUser` INT UNSIGNED, `authType` VARCHAR(20) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_SESSION` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-64', '2.0.3', '3:0d056c8aecd4026dcda8627ad06d634c', 65);

-- Changeset src/2.0ga/schema.xml::1337848104277-65::destevezg (generated)::(Checksum: 3:86505391e8081fdbbef2365031e93a74)
CREATE TABLE `kinton`.`storage_device` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(256) NOT NULL, `idDataCenter` INT UNSIGNED NOT NULL, `management_ip` VARCHAR(256) NOT NULL, `management_port` INT UNSIGNED DEFAULT 0 NOT NULL, `iscsi_ip` VARCHAR(256) NOT NULL, `iscsi_port` INT UNSIGNED DEFAULT 0 NOT NULL, `storage_technology` VARCHAR(256), `username` VARCHAR(256), `password` VARCHAR(256), `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_STORAGE_DEVICE` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-65', '2.0.3', '3:86505391e8081fdbbef2365031e93a74', 66);

-- Changeset src/2.0ga/schema.xml::1337848104277-66::destevezg (generated)::(Checksum: 3:32239c8a6898e6748abd20b04a51e0a1)
CREATE TABLE `kinton`.`storage_pool` (`idStorage` VARCHAR(40) NOT NULL, `idStorageDevice` INT UNSIGNED NOT NULL, `idTier` INT UNSIGNED NOT NULL, `isEnabled` TINYINT(1) DEFAULT 1 NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, `totalSizeInMb` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `usedSizeInMb` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `availableSizeInMb` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `name` VARCHAR(256), CONSTRAINT `PK_STORAGE_POOL` PRIMARY KEY (`idStorage`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-66', '2.0.3', '3:32239c8a6898e6748abd20b04a51e0a1', 67);

-- Changeset src/2.0ga/schema.xml::1337848104277-67::destevezg (generated)::(Checksum: 3:6f8230da5dbd7b92cce93f40529c836e)
CREATE TABLE `kinton`.`system_properties` (`systemPropertyId` INT UNSIGNED AUTO_INCREMENT NOT NULL, `version_c` INT DEFAULT 0, `name` VARCHAR(255) NOT NULL, `value` VARCHAR(255) NOT NULL, `description` VARCHAR(255), CONSTRAINT `PK_SYSTEM_PROPERTIES` PRIMARY KEY (`systemPropertyId`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-67', '2.0.3', '3:6f8230da5dbd7b92cce93f40529c836e', 68);

-- Changeset src/2.0ga/schema.xml::1337848104277-68::destevezg (generated)::(Checksum: 3:ae0cb00375718d9e76a33ef29b7bf6be)
CREATE TABLE `kinton`.`tasks` (`id` INT AUTO_INCREMENT NOT NULL, `status` VARCHAR(20) NOT NULL, `component` VARCHAR(20) NOT NULL, `action` VARCHAR(20) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_TASKS` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-68', '2.0.3', '3:ae0cb00375718d9e76a33ef29b7bf6be', 69);

-- Changeset src/2.0ga/schema.xml::1337848104277-69::destevezg (generated)::(Checksum: 3:062eb2720262e56cfe8c260344e5de20)
CREATE TABLE `kinton`.`tier` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(40) NOT NULL, `description` VARCHAR(255) NOT NULL, `isEnabled` TINYINT(1) DEFAULT 1 NOT NULL, `idDataCenter` INT UNSIGNED NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_TIER` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-69', '2.0.3', '3:062eb2720262e56cfe8c260344e5de20', 70);

-- Changeset src/2.0ga/schema.xml::1337848104277-70::destevezg (generated)::(Checksum: 3:59dc8765f11cc6fde61d76ad1654aafb)
CREATE TABLE `kinton`.`ucs_rack` (`idRack` INT UNSIGNED NOT NULL, `ip` VARCHAR(20) NOT NULL, `port` INT NOT NULL, `user_rack` VARCHAR(255) NOT NULL, `password` VARCHAR(255) NOT NULL, `defaultTemplate` VARCHAR(200), `maxMachinesOn` INT DEFAULT 0, `version_c` INT DEFAULT 0) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-70', '2.0.3', '3:59dc8765f11cc6fde61d76ad1654aafb', 71);

-- Changeset src/2.0ga/schema.xml::1337848104277-71::destevezg (generated)::(Checksum: 3:27d3915c699b72899dd8d35e3de536f3)
CREATE TABLE `kinton`.`user` (`idUser` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idRole` INT UNSIGNED NOT NULL, `idEnterprise` INT UNSIGNED, `user` VARCHAR(128) NOT NULL, `name` VARCHAR(128) NOT NULL, `surname` VARCHAR(50), `description` VARCHAR(100), `email` VARCHAR(200), `locale` VARCHAR(10) NOT NULL, `password` VARCHAR(32), `availableVirtualDatacenters` VARCHAR(255), `active` INT UNSIGNED DEFAULT 0 NOT NULL, `authType` VARCHAR(20) NOT NULL, `creationDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_USER` PRIMARY KEY (`idUser`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-71', '2.0.3', '3:27d3915c699b72899dd8d35e3de536f3', 72);

-- Changeset src/2.0ga/schema.xml::1337848104277-72::destevezg (generated)::(Checksum: 3:580ee3ec6feb35780f7165b1b284eaa7)
CREATE TABLE `kinton`.`vapp_enterprise_stats` (`idVirtualApp` INT AUTO_INCREMENT NOT NULL, `idEnterprise` INT NOT NULL, `idVirtualDataCenter` INT NOT NULL, `vappName` VARCHAR(45), `vdcName` VARCHAR(45), `vmCreated` MEDIUMINT UNSIGNED DEFAULT 0, `vmActive` MEDIUMINT UNSIGNED DEFAULT 0, `volAssociated` MEDIUMINT UNSIGNED DEFAULT 0, `volAttached` MEDIUMINT UNSIGNED DEFAULT 0, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_VAPP_ENTERPRISE_STATS` PRIMARY KEY (`idVirtualApp`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-72', '2.0.3', '3:580ee3ec6feb35780f7165b1b284eaa7', 73);

-- Changeset src/2.0ga/schema.xml::1337848104277-73::destevezg (generated)::(Checksum: 3:0b96fb1106b6a6757d5536412fa985e5)
CREATE TABLE `kinton`.`vappstateful_conversions` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idVirtualApp` INT UNSIGNED NOT NULL, `idUser` INT UNSIGNED NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_VAPPSTATEFUL_CONVERSIONS` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-73', '2.0.3', '3:0b96fb1106b6a6757d5536412fa985e5', 74);

-- Changeset src/2.0ga/schema.xml::1337848104277-74::destevezg (generated)::(Checksum: 3:08886937fc7101c1a6cee4d8c80ed3fa)
CREATE TABLE `kinton`.`vdc_enterprise_stats` (`idVirtualDataCenter` INT AUTO_INCREMENT NOT NULL, `idEnterprise` INT NOT NULL, `vdcName` VARCHAR(45), `vmCreated` MEDIUMINT UNSIGNED DEFAULT 0, `vmActive` MEDIUMINT UNSIGNED DEFAULT 0, `volCreated` MEDIUMINT UNSIGNED DEFAULT 0, `volAssociated` MEDIUMINT UNSIGNED DEFAULT 0, `volAttached` MEDIUMINT UNSIGNED DEFAULT 0, `vCpuReserved` BIGINT UNSIGNED DEFAULT 0, `vCpuUsed` BIGINT UNSIGNED DEFAULT 0, `memoryReserved` BIGINT UNSIGNED DEFAULT 0, `memoryUsed` BIGINT UNSIGNED DEFAULT 0, `localStorageReserved` BIGINT UNSIGNED DEFAULT 0, `localStorageUsed` BIGINT UNSIGNED DEFAULT 0, `extStorageReserved` BIGINT UNSIGNED DEFAULT 0, `extStorageUsed` BIGINT UNSIGNED DEFAULT 0, `publicIPsReserved` MEDIUMINT UNSIGNED DEFAULT 0 NOT NULL, `publicIPsUsed` MEDIUMINT UNSIGNED DEFAULT 0 NOT NULL, `vlanReserved` MEDIUMINT UNSIGNED DEFAULT 0 NOT NULL, `vlanUsed` MEDIUMINT UNSIGNED DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_VDC_ENTERPRISE_STATS` PRIMARY KEY (`idVirtualDataCenter`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-74', '2.0.3', '3:08886937fc7101c1a6cee4d8c80ed3fa', 75);

-- Changeset src/2.0ga/schema.xml::1337848104277-75::destevezg (generated)::(Checksum: 3:063283fb7dbf433f93070fe153c9a135)
CREATE TABLE `kinton`.`virtual_appliance_conversions` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idConversion` INT UNSIGNED NOT NULL, `idVirtualAppliance` INT UNSIGNED NOT NULL, `idUser` INT UNSIGNED, `forceLimits` TINYINT(1), `idNode` INT UNSIGNED, `version_c` INT DEFAULT 0, CONSTRAINT `PK_VIRTUAL_APPLIANCE_CONVERSIONS` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-75', '2.0.3', '3:063283fb7dbf433f93070fe153c9a135', 76);

-- Changeset src/2.0ga/schema.xml::1337848104277-76::destevezg (generated)::(Checksum: 3:22888bcaa7edf918356316881c639995)
CREATE TABLE `kinton`.`virtualapp` (`idVirtualApp` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idVirtualDataCenter` INT UNSIGNED NOT NULL, `idEnterprise` INT UNSIGNED, `name` VARCHAR(30) NOT NULL, `public` INT UNSIGNED NOT NULL, `high_disponibility` INT UNSIGNED NOT NULL, `error` INT UNSIGNED NOT NULL, `nodeconnections` TEXT, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_VIRTUALAPP` PRIMARY KEY (`idVirtualApp`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-76', '2.0.3', '3:22888bcaa7edf918356316881c639995', 77);

-- Changeset src/2.0ga/schema.xml::1337848104277-77::destevezg (generated)::(Checksum: 3:5115c624b35d8bb58fc4b20ccc127e13)
CREATE TABLE `kinton`.`virtualdatacenter` (`idVirtualDataCenter` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idEnterprise` INT UNSIGNED NOT NULL, `name` VARCHAR(40), `idDataCenter` INT UNSIGNED NOT NULL, `networktypeID` INT UNSIGNED, `hypervisorType` VARCHAR(255) NOT NULL, `ramSoft` BIGINT DEFAULT 0 NOT NULL, `cpuSoft` BIGINT DEFAULT 0 NOT NULL, `hdSoft` BIGINT DEFAULT 0 NOT NULL, `storageSoft` BIGINT DEFAULT 0 NOT NULL, `vlanSoft` BIGINT DEFAULT 0 NOT NULL, `publicIPSoft` BIGINT DEFAULT 0 NOT NULL, `ramHard` BIGINT DEFAULT 0 NOT NULL, `cpuHard` BIGINT DEFAULT 0 NOT NULL, `hdHard` BIGINT DEFAULT 0 NOT NULL, `storageHard` BIGINT DEFAULT 0 NOT NULL, `vlanHard` BIGINT DEFAULT 0 NOT NULL, `publicIPHard` BIGINT DEFAULT 0 NOT NULL, `default_vlan_network_id` INT UNSIGNED, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_VIRTUALDATACENTER` PRIMARY KEY (`idVirtualDataCenter`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-77', '2.0.3', '3:5115c624b35d8bb58fc4b20ccc127e13', 78);

-- Changeset src/2.0ga/schema.xml::1337848104277-78::destevezg (generated)::(Checksum: 3:4bf4da8397db1467955f7367abc244d0)
CREATE TABLE `kinton`.`virtualimage` (`idImage` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(255) NOT NULL, `description` VARCHAR(255), `pathName` VARCHAR(255) NOT NULL, `hd_required` BIGINT, `ram_required` INT UNSIGNED, `cpu_required` INT, `iconUrl` VARCHAR(255), `idCategory` INT UNSIGNED NOT NULL, `idRepository` INT UNSIGNED, `type` VARCHAR(50) NOT NULL, `ethDriverType` VARCHAR(16), `idMaster` INT UNSIGNED, `idEnterprise` INT UNSIGNED, `shared` INT UNSIGNED DEFAULT 0 NOT NULL, `ovfid` VARCHAR(255), `stateful` INT UNSIGNED NOT NULL, `diskFileSize` BIGINT UNSIGNED NOT NULL, `chefEnabled` TINYINT(1) DEFAULT 0 NOT NULL, `cost_code` INT DEFAULT 0, `creation_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `creation_user` VARCHAR(128) NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_VIRTUALIMAGE` PRIMARY KEY (`idImage`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-78', '2.0.3', '3:4bf4da8397db1467955f7367abc244d0', 79);

-- Changeset src/2.0ga/schema.xml::1337848104277-79::destevezg (generated)::(Checksum: 3:a4f5454fefbf871ee9892ce6776f2078)
CREATE TABLE `kinton`.`virtualimage_conversions` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idImage` INT UNSIGNED NOT NULL, `sourceType` VARCHAR(50), `targetType` VARCHAR(50) NOT NULL, `sourcePath` VARCHAR(255), `targetPath` VARCHAR(255) NOT NULL, `state` VARCHAR(50) NOT NULL, `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, `size` BIGINT, `version_c` INT DEFAULT 0, CONSTRAINT `PK_VIRTUALIMAGE_CONVERSIONS` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-79', '2.0.3', '3:a4f5454fefbf871ee9892ce6776f2078', 80);

-- Changeset src/2.0ga/schema.xml::1337848104277-80::destevezg (generated)::(Checksum: 3:03eb1ec9b1cea36680f39207ec0cb265)
CREATE TABLE `kinton`.`virtualmachine` (`idVM` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idHypervisor` INT UNSIGNED, `idImage` INT UNSIGNED, `UUID` VARCHAR(36) NOT NULL, `name` VARCHAR(255) NOT NULL, `description` VARCHAR(255), `ram` INT UNSIGNED, `cpu` INT UNSIGNED, `hd` BIGINT UNSIGNED, `vdrpPort` INT UNSIGNED, `vdrpIP` VARCHAR(39), `state` VARCHAR(50) NOT NULL, `subState` VARCHAR(50), `high_disponibility` INT UNSIGNED NOT NULL, `idConversion` INT UNSIGNED, `idType` INT UNSIGNED DEFAULT 0 NOT NULL, `idUser` INT UNSIGNED, `idEnterprise` INT UNSIGNED, `idDatastore` INT UNSIGNED, `password` VARCHAR(32), `network_configuration_id` INT UNSIGNED, `temporal` INT UNSIGNED, `ethDriverType` VARCHAR(16), `version_c` INT DEFAULT 0, CONSTRAINT `PK_VIRTUALMACHINE` PRIMARY KEY (`idVM`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-80', '2.0.3', '3:03eb1ec9b1cea36680f39207ec0cb265', 81);

-- Changeset src/2.0ga/schema.xml::1337848104277-81::destevezg (generated)::(Checksum: 3:aaeeca88536c792823792daff78fc302)
CREATE TABLE `kinton`.`virtualmachinetrackedstate` (`idVM` INT UNSIGNED NOT NULL, `previousState` VARCHAR(50) NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_VIRTUALMACHINETRACKEDSTATE` PRIMARY KEY (`idVM`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-81', '2.0.3', '3:aaeeca88536c792823792daff78fc302', 82);

-- Changeset src/2.0ga/schema.xml::1337848104277-82::destevezg (generated)::(Checksum: 3:26947b00d958299de2b04874501cb62d)
CREATE TABLE `kinton`.`vlan_network` (`vlan_network_id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `network_id` INT UNSIGNED NOT NULL, `network_configuration_id` INT UNSIGNED NOT NULL, `network_name` VARCHAR(40) NOT NULL, `vlan_tag` INT UNSIGNED, `networktype` VARCHAR(15) DEFAULT 'INTERNAL' NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, `enterprise_id` INT UNSIGNED, CONSTRAINT `PK_VLAN_NETWORK` PRIMARY KEY (`vlan_network_id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-82', '2.0.3', '3:26947b00d958299de2b04874501cb62d', 83);

-- Changeset src/2.0ga/schema.xml::1337848104277-83::destevezg (generated)::(Checksum: 3:7e17f77ecfd27b92c4f31099bab23263)
CREATE TABLE `kinton`.`vlan_network_assignment` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `vlan_network_id` INT UNSIGNED NOT NULL, `idRack` INT UNSIGNED NOT NULL, `idVirtualDataCenter` INT UNSIGNED, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_VLAN_NETWORK_ASSIGNMENT` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-83', '2.0.3', '3:7e17f77ecfd27b92c4f31099bab23263', 84);

-- Changeset src/2.0ga/schema.xml::1337848104277-84::destevezg (generated)::(Checksum: 3:ad296e1cb54e03f2bca4d616edbad6cd)
CREATE TABLE `kinton`.`vlans_dhcpOption` (`idVlan` INT UNSIGNED NOT NULL, `idDhcpOption` INT UNSIGNED NOT NULL, `version_c` INT DEFAULT 0) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-84', '2.0.3', '3:ad296e1cb54e03f2bca4d616edbad6cd', 85);

-- Changeset src/2.0ga/schema.xml::1337848104277-85::destevezg (generated)::(Checksum: 3:0c21699680283121de7813315629e44f)
CREATE TABLE `kinton`.`volume_management` (`idManagement` INT UNSIGNED NOT NULL, `usedSize` BIGINT UNSIGNED DEFAULT 0 NOT NULL, `idSCSI` VARCHAR(256) NOT NULL, `state` INT NOT NULL, `idStorage` VARCHAR(40) NOT NULL, `idImage` INT UNSIGNED, `version_c` INT DEFAULT 0) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-85', '2.0.3', '3:0c21699680283121de7813315629e44f', 86);

-- Changeset src/2.0ga/schema.xml::1337848104277-86::destevezg (generated)::(Checksum: 3:7a8b4908fb9d95a66944fee41a1203c6)
CREATE TABLE `kinton`.`workload_enterprise_exclusion_rule` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idEnterprise1` INT UNSIGNED NOT NULL, `idEnterprise2` INT UNSIGNED NOT NULL, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_WORKLOAD_ENTERPRISE_EXCLUSION_RULE` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-86', '2.0.3', '3:7a8b4908fb9d95a66944fee41a1203c6', 87);

-- Changeset src/2.0ga/schema.xml::1337848104277-87::destevezg (generated)::(Checksum: 3:a92b34c47f2346398f5b8b119fc7e530)
CREATE TABLE `kinton`.`workload_fit_policy_rule` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `fitPolicy` VARCHAR(20) NOT NULL, `idDatacenter` INT UNSIGNED, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_WORKLOAD_FIT_POLICY_RULE` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-87', '2.0.3', '3:a92b34c47f2346398f5b8b119fc7e530', 88);

-- Changeset src/2.0ga/schema.xml::1337848104277-88::destevezg (generated)::(Checksum: 3:1730d1e6ce407813be6ceb6d424317f6)
CREATE TABLE `kinton`.`workload_machine_load_rule` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `ramLoadPercentage` INT UNSIGNED NOT NULL, `cpuLoadPercentage` INT UNSIGNED NOT NULL, `idDatacenter` INT UNSIGNED, `idRack` INT UNSIGNED, `idMachine` INT UNSIGNED, `version_c` INT DEFAULT 1 NOT NULL, CONSTRAINT `PK_WORKLOAD_MACHINE_LOAD_RULE` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-88', '2.0.3', '3:1730d1e6ce407813be6ceb6d424317f6', 89);

-- Changeset src/2.0ga/schema.xml::1337848104277-89::destevezg (generated)::(Checksum: 3:aa74d712d9cfccf4c578872a99fa0e59)
ALTER TABLE `kinton`.`datastore_assignment` ADD PRIMARY KEY (`idDatastore`, `idPhysicalMachine`);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Primary Key', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-89', '2.0.3', '3:aa74d712d9cfccf4c578872a99fa0e59', 90);

-- Changeset src/2.0ga/schema.xml::1337848104277-90::destevezg (generated)::(Checksum: 3:22e25d11ab6124ead2cbb6fde07eeb66)
ALTER TABLE `kinton`.`ovf_package_list_has_ovf_package` ADD PRIMARY KEY (`id_ovf_package_list`, `id_ovf_package`);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Primary Key', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-90', '2.0.3', '3:22e25d11ab6124ead2cbb6fde07eeb66', 91);

-- Changeset src/2.0ga/schema.xml::1337848104277-194::destevezg (generated)::(Checksum: 3:a380c7f9fc0bc3ea9fe1e4be4d4fcd2c)
CREATE UNIQUE INDEX `name` ON `kinton`.`category`(`name`);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Index', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-194', '2.0.3', '3:a380c7f9fc0bc3ea9fe1e4be4d4fcd2c', 92);

-- Changeset src/2.0ga/schema.xml::1337848104277-195::destevezg (generated)::(Checksum: 3:4eff3205127c7bc1a520db1b06261792)
CREATE UNIQUE INDEX `user_auth_idx` ON `kinton`.`user`(`user`, `authType`);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Index', 'EXECUTED', 'src/2.0ga/schema.xml', '1337848104277-195', '2.0.3', '3:4eff3205127c7bc1a520db1b06261792', 93);

-- Changeset src/2.0ga/schema.xml::1337865595474-1::destevezg (generated)::(Checksum: 3:465179a94d1a28d6942f8bb44a9beceb)
ALTER TABLE `kinton`.`accounting_event_ips` MODIFY `startTime` TIMESTAMP NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Not-Null Constraint', 'EXECUTED', 'src/2.0ga/schema.xml', '1337865595474-1', '2.0.3', '3:465179a94d1a28d6942f8bb44a9beceb', 94);

-- Changeset src/2.0ga/schema.xml::1337865595474-2::destevezg (generated)::(Checksum: 3:9fcade3f621d8902edd5fe7e0cd7c864)
ALTER TABLE `kinton`.`accounting_event_ips` MODIFY `stopTime` TIMESTAMP NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Not-Null Constraint', 'EXECUTED', 'src/2.0ga/schema.xml', '1337865595474-2', '2.0.3', '3:9fcade3f621d8902edd5fe7e0cd7c864', 95);

-- Changeset src/2.0ga/schema.xml::1337865595474-3::destevezg (generated)::(Checksum: 3:e863feedebe5753f3d3c3f6bf637ee52)
ALTER TABLE `kinton`.`accounting_event_storage` MODIFY `startTime` TIMESTAMP NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Not-Null Constraint', 'EXECUTED', 'src/2.0ga/schema.xml', '1337865595474-3', '2.0.3', '3:e863feedebe5753f3d3c3f6bf637ee52', 96);

-- Changeset src/2.0ga/schema.xml::1337865595474-4::destevezg (generated)::(Checksum: 3:eca37028c90adad85e58e56a696eef03)
ALTER TABLE `kinton`.`accounting_event_storage` MODIFY `stopTime` TIMESTAMP NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Not-Null Constraint', 'EXECUTED', 'src/2.0ga/schema.xml', '1337865595474-4', '2.0.3', '3:eca37028c90adad85e58e56a696eef03', 97);

-- Changeset src/2.0ga/schema.xml::1337865595474-5::destevezg (generated)::(Checksum: 3:04401822cd01707f6c95c5e8385714ab)
ALTER TABLE `kinton`.`accounting_event_vlan` MODIFY `startTime` TIMESTAMP NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Not-Null Constraint', 'EXECUTED', 'src/2.0ga/schema.xml', '1337865595474-5', '2.0.3', '3:04401822cd01707f6c95c5e8385714ab', 98);

-- Changeset src/2.0ga/schema.xml::1337865595474-6::destevezg (generated)::(Checksum: 3:9ec41f0bf6e618839b6b3b24e0073770)
ALTER TABLE `kinton`.`accounting_event_vlan` MODIFY `stopTime` TIMESTAMP NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Not-Null Constraint', 'EXECUTED', 'src/2.0ga/schema.xml', '1337865595474-6', '2.0.3', '3:9ec41f0bf6e618839b6b3b24e0073770', 99);

-- Changeset src/2.0ga/schema.xml::1337865595474-7::destevezg (generated)::(Checksum: 3:2481e182d0b6ad7dfcdaadf1d3e0b3fb)
ALTER TABLE `kinton`.`accounting_event_vm` MODIFY `startTime` TIMESTAMP NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Not-Null Constraint', 'EXECUTED', 'src/2.0ga/schema.xml', '1337865595474-7', '2.0.3', '3:2481e182d0b6ad7dfcdaadf1d3e0b3fb', 100);

-- Changeset src/2.0ga/schema.xml::1337865595474-8::destevezg (generated)::(Checksum: 3:c9ea354150730436040615b45ad45cbf)
ALTER TABLE `kinton`.`accounting_event_vm` MODIFY `stopTime` TIMESTAMP NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Not-Null Constraint', 'EXECUTED', 'src/2.0ga/schema.xml', '1337865595474-8', '2.0.3', '3:c9ea354150730436040615b45ad45cbf', 101);

-- Changeset src/2.0ga/views.xml::1335522742615-197::destevezg (generated)::(Checksum: 3:19045b95150d1691be2db56be4b2a037)
CREATE VIEW `kinton`.`HOURLY_USAGE_MAX_VW` AS select `accounting_event_detail`.`startTime` AS `startTime`,`accounting_event_detail`.`endTime` AS `endTime`,`accounting_event_detail`.`idAccountingResourceType` AS `idAccountingResourceType`,`accounting_event_detail`.`resourceType` AS `resourceType`,`accounting_event_detail`.`resourceName` AS `resourceName`,max(`accounting_event_detail`.`resourceUnits`) AS `resourceUnits`,`accounting_event_detail`.`idEnterprise` AS `idEnterprise`,`accounting_event_detail`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`accounting_event_detail`.`idVirtualApp` AS `idVirtualApp`,`accounting_event_detail`.`idVirtualMachine` AS `idVirtualMachine`,`accounting_event_detail`.`enterpriseName` AS `enterpriseName`,`accounting_event_detail`.`virtualDataCenter` AS `virtualDataCenter`,`accounting_event_detail`.`virtualApp` AS `virtualApp`,`accounting_event_detail`.`virtualMachine` AS `virtualMachine` from `accounting_event_detail` group by `accounting_event_detail`.`startTime`,`accounting_event_detail`.`endTime`,`accounting_event_detail`.`idAccountingResourceType`,`accounting_event_detail`.`resourceType`,`accounting_event_detail`.`resourceName`,`accounting_event_detail`.`idEnterprise`,`accounting_event_detail`.`idVirtualDataCenter`,`accounting_event_detail`.`idVirtualApp`,`accounting_event_detail`.`idVirtualMachine`,`accounting_event_detail`.`enterpriseName`,`accounting_event_detail`.`virtualDataCenter`,`accounting_event_detail`.`virtualApp`,`accounting_event_detail`.`virtualMachine`;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create View', 'EXECUTED', 'src/2.0ga/views.xml', '1335522742615-197', '2.0.3', '3:19045b95150d1691be2db56be4b2a037', 102);

-- Changeset src/2.0ga/views.xml::1335522742615-196::destevezg (generated)::(Checksum: 3:9869fe725c330aa37e6e07da68d16c25)
CREATE VIEW `kinton`.`DAILY_USAGE_SUM_VW` AS select cast(`v`.`startTime` as date) AS `startTime`,cast(`v`.`startTime` as date) AS `endTime`,`v`.`idAccountingResourceType` AS `idAccountingResourceType`,`v`.`resourceType` AS `resourceType`,sum(`v`.`resourceUnits`) AS `resourceUnits`,`v`.`idEnterprise` AS `idEnterprise`,`v`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`v`.`enterpriseName` AS `enterpriseName`,`v`.`virtualDataCenter` AS `virtualDataCenter` from `HOURLY_USAGE_MAX_VW` `v` group by cast(`v`.`startTime` as date),`v`.`idAccountingResourceType`,`v`.`resourceType`,`v`.`idEnterprise`,`v`.`idVirtualDataCenter`,`v`.`enterpriseName`,`v`.`virtualDataCenter`;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create View', 'EXECUTED', 'src/2.0ga/views.xml', '1335522742615-196', '2.0.3', '3:9869fe725c330aa37e6e07da68d16c25', 103);

-- Changeset src/2.0ga/views.xml::1335522742615-198::destevezg (generated)::(Checksum: 3:c09f0be5aab0442e34c330d4cbc466f6)
CREATE VIEW `kinton`.`HOURLY_USAGE_SUM_VW` AS select `v`.`startTime` AS `startTime`,`v`.`endTime` AS `endTime`,`v`.`idAccountingResourceType` AS `idAccountingResourceType`,`v`.`resourceType` AS `resourceType`,sum(`v`.`resourceUnits`) AS `resourceUnits`,`v`.`idEnterprise` AS `idEnterprise`,`v`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`v`.`enterpriseName` AS `enterpriseName`,`v`.`virtualDataCenter` AS `virtualDataCenter` from `HOURLY_USAGE_MAX_VW` `v` group by `v`.`startTime`,`v`.`endTime`,`v`.`idAccountingResourceType`,`v`.`resourceType`,`v`.`idEnterprise`,`v`.`idVirtualDataCenter`,`v`.`enterpriseName`,`v`.`virtualDataCenter`;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create View', 'EXECUTED', 'src/2.0ga/views.xml', '1335522742615-198', '2.0.3', '3:c09f0be5aab0442e34c330d4cbc466f6', 104);

-- Changeset src/2.0ga/views.xml::1335522742615-199::destevezg (generated)::(Checksum: 3:d8e3551adcbbdbf1d7f4b285400ab942)
CREATE VIEW `kinton`.`LAST_HOUR_USAGE_IPS_VW` AS select `accounting_event_ips`.`idIPsAccountingEvent` AS `idIPsAccountingEvent`,`accounting_event_ips`.`idEnterprise` AS `idEnterprise`,`accounting_event_ips`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`accounting_event_ips`.`ip` AS `ip`,`accounting_event_ips`.`startTime` AS `startTime`,`accounting_event_ips`.`stopTime` AS `stopTime`,(unix_timestamp(`accounting_event_ips`.`stopTime`) - unix_timestamp(`accounting_event_ips`.`startTime`)) AS `DELTA_TIME`,from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600))) AS `ROUNDED_HOUR`,`virtualdatacenter`.`name` AS `VIRTUAL_DATACENTER`,`enterprise`.`name` AS `VIRTUAL_ENTERPRISE` from ((`accounting_event_ips` join `virtualdatacenter` on((`accounting_event_ips`.`idVirtualDataCenter` = `virtualdatacenter`.`idVirtualDataCenter`))) join `enterprise` on((`accounting_event_ips`.`idEnterprise` = `enterprise`.`idEnterprise`))) where (isnull(`accounting_event_ips`.`stopTime`) or ((`accounting_event_ips`.`stopTime` > from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600)))) and ((unix_timestamp(`accounting_event_ips`.`stopTime`) - unix_timestamp(`accounting_event_ips`.`startTime`)) > 3600)) or ((`accounting_event_ips`.`startTime` > from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600)))) and ((unix_timestamp(`accounting_event_ips`.`stopTime`) - unix_timestamp(`accounting_event_ips`.`startTime`)) <= 3600)));

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create View', 'EXECUTED', 'src/2.0ga/views.xml', '1335522742615-199', '2.0.3', '3:d8e3551adcbbdbf1d7f4b285400ab942', 105);

-- Changeset src/2.0ga/views.xml::1335522742615-200::destevezg (generated)::(Checksum: 3:0dcf936b3a90f923643fa62ab50905d4)
CREATE VIEW `kinton`.`LAST_HOUR_USAGE_STORAGE_VW` AS select `accounting_event_storage`.`idStorageAccountingEvent` AS `idStorageAccountingEvent`,`accounting_event_storage`.`idVM` AS `idVM`,`accounting_event_storage`.`idEnterprise` AS `idEnterprise`,`accounting_event_storage`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`accounting_event_storage`.`idVirtualApp` AS `idVirtualApp`,`accounting_event_storage`.`idResource` AS `idResource`,`accounting_event_storage`.`resourceName` AS `resourceName`,`accounting_event_storage`.`idStorageTier` AS `idStorageTier`,`accounting_event_storage`.`sizeReserved` AS `sizeReserved`,`accounting_event_storage`.`startTime` AS `startTime`,`accounting_event_storage`.`stopTime` AS `stopTime`,(unix_timestamp(`accounting_event_storage`.`stopTime`) - unix_timestamp(`accounting_event_storage`.`startTime`)) AS `DELTA_TIME`,from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600))) AS `ROUNDED_HOUR`,`virtualdatacenter`.`name` AS `VIRTUAL_DATACENTER`,`enterprise`.`name` AS `VIRTUAL_ENTERPRISE` from ((`accounting_event_storage` join `virtualdatacenter` on((`accounting_event_storage`.`idVirtualDataCenter` = `virtualdatacenter`.`idVirtualDataCenter`))) join `enterprise` on((`accounting_event_storage`.`idEnterprise` = `enterprise`.`idEnterprise`))) where (isnull(`accounting_event_storage`.`stopTime`) or ((`accounting_event_storage`.`stopTime` > from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600)))) and ((unix_timestamp(`accounting_event_storage`.`stopTime`) - unix_timestamp(`accounting_event_storage`.`startTime`)) > 3600)) or ((`accounting_event_storage`.`startTime` > from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600)))) and ((unix_timestamp(`accounting_event_storage`.`stopTime`) - unix_timestamp(`accounting_event_storage`.`startTime`)) <= 3600)));

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create View', 'EXECUTED', 'src/2.0ga/views.xml', '1335522742615-200', '2.0.3', '3:0dcf936b3a90f923643fa62ab50905d4', 106);

-- Changeset src/2.0ga/views.xml::1335522742615-201::destevezg (generated)::(Checksum: 3:fba05e70c0fb9525cb0e32d895418d15)
CREATE VIEW `kinton`.`LAST_HOUR_USAGE_VLAN_VW` AS select `accounting_event_vlan`.`idVLANAccountingEvent` AS `idVLANAccountingEvent`,`accounting_event_vlan`.`idEnterprise` AS `idEnterprise`,`accounting_event_vlan`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`accounting_event_vlan`.`network_name` AS `networkName`,`accounting_event_vlan`.`startTime` AS `startTime`,`accounting_event_vlan`.`stopTime` AS `stopTime`,(unix_timestamp(`accounting_event_vlan`.`stopTime`) - unix_timestamp(`accounting_event_vlan`.`startTime`)) AS `DELTA_TIME`,from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600))) AS `ROUNDED_HOUR`,`virtualdatacenter`.`name` AS `VIRTUAL_DATACENTER`,`enterprise`.`name` AS `VIRTUAL_ENTERPRISE` from ((`accounting_event_vlan` join `virtualdatacenter` on((`accounting_event_vlan`.`idVirtualDataCenter` = `virtualdatacenter`.`idVirtualDataCenter`))) join `enterprise` on((`accounting_event_vlan`.`idEnterprise` = `enterprise`.`idEnterprise`))) where (isnull(`accounting_event_vlan`.`stopTime`) or ((`accounting_event_vlan`.`stopTime` > from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600)))) and ((unix_timestamp(`accounting_event_vlan`.`stopTime`) - unix_timestamp(`accounting_event_vlan`.`startTime`)) > 3600)) or ((`accounting_event_vlan`.`startTime` > from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600)))) and ((unix_timestamp(`accounting_event_vlan`.`stopTime`) - unix_timestamp(`accounting_event_vlan`.`startTime`)) <= 3600)));

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create View', 'EXECUTED', 'src/2.0ga/views.xml', '1335522742615-201', '2.0.3', '3:fba05e70c0fb9525cb0e32d895418d15', 107);

-- Changeset src/2.0ga/views.xml::1335522742615-202::destevezg (generated)::(Checksum: 3:7d1bf8364c8de37fe3e228b6ea35d56a)
CREATE VIEW `kinton`.`LAST_HOUR_USAGE_VM_VW` AS select `accounting_event_vm`.`idVMAccountingEvent` AS `idVMAccountingEvent`,`accounting_event_vm`.`idVM` AS `idVM`,`accounting_event_vm`.`idEnterprise` AS `idEnterprise`,`accounting_event_vm`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`accounting_event_vm`.`idVirtualApp` AS `idVirtualApp`,`accounting_event_vm`.`cpu` AS `cpu`,`accounting_event_vm`.`ram` AS `ram`,`accounting_event_vm`.`hd` AS `hd`,`accounting_event_vm`.`startTime` AS `startTime`,`accounting_event_vm`.`stopTime` AS `stopTime`,`accounting_event_vm`.`costCode` AS `costCode`,`accounting_event_vm`.`hypervisorType` AS `hypervisorType`,(unix_timestamp(`accounting_event_vm`.`stopTime`) - unix_timestamp(`accounting_event_vm`.`startTime`)) AS `DELTA_TIME`,from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600))) AS `ROUNDED_HOUR`,concat(if(isnull(`virtualmachine`.`description`),'',substr(`virtualmachine`.`description`,1,120)),' - ',`virtualmachine`.`name`) AS `VIRTUAL_MACHINE`,`virtualapp`.`name` AS `VIRTUAL_APP`,`virtualdatacenter`.`name` AS `VIRTUAL_DATACENTER`,`enterprise`.`name` AS `VIRTUAL_ENTERPRISE` from ((((`accounting_event_vm` join `virtualmachine` on((`accounting_event_vm`.`idVM` = `virtualmachine`.`idVM`))) join `virtualapp` on((`accounting_event_vm`.`idVirtualApp` = `virtualapp`.`idVirtualApp`))) join `virtualdatacenter` on((`accounting_event_vm`.`idVirtualDataCenter` = `virtualdatacenter`.`idVirtualDataCenter`))) join `enterprise` on((`accounting_event_vm`.`idEnterprise` = `enterprise`.`idEnterprise`))) where (isnull(`accounting_event_vm`.`stopTime`) or ((`accounting_event_vm`.`stopTime` > from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600)))) and ((unix_timestamp(`accounting_event_vm`.`stopTime`) - unix_timestamp(`accounting_event_vm`.`startTime`)) > 3600)) or ((`accounting_event_vm`.`startTime` > from_unixtime((-(3600) + (truncate((unix_timestamp(now()) / 3600),0) * 3600)))) and ((unix_timestamp(`accounting_event_vm`.`stopTime`) - unix_timestamp(`accounting_event_vm`.`startTime`)) <= 3600)));

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create View', 'EXECUTED', 'src/2.0ga/views.xml', '1335522742615-202', '2.0.3', '3:7d1bf8364c8de37fe3e228b6ea35d56a', 108);

-- Changeset src/2.0ga/views.xml::1335522742615-203::destevezg (generated)::(Checksum: 3:3525d4780909590966ee84aa2034fbe7)
CREATE VIEW `kinton`.`MONTHLY_USAGE_SUM_VW` AS select cast((`v`.`startTime` - interval (dayofmonth(`v`.`startTime`) - 1) day) as date) AS `startTime`,last_day(`v`.`startTime`) AS `endTime`,`v`.`idAccountingResourceType` AS `idAccountingResourceType`,`v`.`resourceType` AS `resourceType`,sum(`v`.`resourceUnits`) AS `resourceUnits`,`v`.`idEnterprise` AS `idEnterprise`,`v`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`v`.`enterpriseName` AS `enterpriseName`,`v`.`virtualDataCenter` AS `virtualDataCenter` from `HOURLY_USAGE_MAX_VW` `v` group by cast((`v`.`startTime` - interval (dayofmonth(`v`.`startTime`) - 1) day) as date),`v`.`idAccountingResourceType`,`v`.`resourceType`,`v`.`idEnterprise`,`v`.`idVirtualDataCenter`,`v`.`enterpriseName`,`v`.`virtualDataCenter`;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create View', 'EXECUTED', 'src/2.0ga/views.xml', '1335522742615-203', '2.0.3', '3:3525d4780909590966ee84aa2034fbe7', 109);

-- Changeset src/2.0ga/data.xml::1335522749701-5::destevezg (generated)::(Checksum: 3:b3f0c67b2f6f4cac3086fefc627fe152)
INSERT INTO `kinton`.`enterprise` (`chef_client`, `chef_client_certificate`, `chef_url`, `chef_validator`, `chef_validator_certificate`, `cpuHard`, `cpuSoft`, `hdHard`, `hdSoft`, `idEnterprise`, `idPricingTemplate`, `isReservationRestricted`, `name`, `publicIPHard`, `publicIPSoft`, `ramHard`, `ramSoft`, `repositoryHard`, `repositorySoft`, `storageHard`, `storageSoft`, `version_c`, `vlanHard`, `vlanSoft`) VALUES (NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, 0, 'Abiquo', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-5', '2.0.3', '3:b3f0c67b2f6f4cac3086fefc627fe152', 110);

-- Changeset src/2.0ga/data.xml::1335522749701-1::destevezg (generated)::(Checksum: 3:de8cf3a70531e851e5914cc06037b9b4)
INSERT INTO `kinton`.`enterprise_resources_stats` (`extStorageReserved`, `extStorageUsed`, `idEnterprise`, `localStorageReserved`, `localStorageUsed`, `memoryReserved`, `memoryUsed`, `publicIPsReserved`, `publicIPsUsed`, `repositoryReserved`, `repositoryUsed`, `vCpuReserved`, `vCpuUsed`, `version_c`, `vlanReserved`, `vlanUsed`) VALUES (0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-1', '2.0.3', '3:de8cf3a70531e851e5914cc06037b9b4', 111);

-- Changeset src/2.0ga/data.xml::1335522749701-2::destevezg (generated)::(Checksum: 3:6ee2a7bfbc6e05a148230fba90faca87)
INSERT INTO `kinton`.`apps_library` (`idEnterprise`, `id_apps_library`, `version_c`) VALUES (1, 1, 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-2', '2.0.3', '3:6ee2a7bfbc6e05a148230fba90faca87', 112);

-- Changeset src/2.0ga/data.xml::1335522749701-4::destevezg (generated)::(Checksum: 3:1b6e28cec49ba1fe6aa832e958625b61)
INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (1, 'ENTERPRISE_ENUMERATE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (2, 'ENTERPRISE_ADMINISTER_ALL', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (3, 'ENTERPRISE_RESOURCE_SUMMARY_ENT', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (4, 'PHYS_DC_ENUMERATE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (5, 'PHYS_DC_RETRIEVE_RESOURCE_USAGE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (6, 'PHYS_DC_MANAGE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (7, 'PHYS_DC_RETRIEVE_DETAILS', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (8, 'PHYS_DC_ALLOW_MODIFY_SERVERS', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (9, 'PHYS_DC_ALLOW_MODIFY_NETWORK', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (10, 'PHYS_DC_ALLOW_MODIFY_STORAGE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (11, 'PHYS_DC_ALLOW_MODIFY_ALLOCATION', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (12, 'VDC_ENUMERATE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (13, 'VDC_MANAGE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (14, 'VDC_MANAGE_VAPP', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (15, 'VDC_MANAGE_NETWORK', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (16, 'VDC_MANAGE_STORAGE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (17, 'VAPP_CUSTOMISE_SETTINGS', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (18, 'VAPP_DEPLOY_UNDEPLOY', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (19, 'VAPP_ASSIGN_NETWORK', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (20, 'VAPP_ASSIGN_VOLUME', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (21, 'VAPP_PERFORM_ACTIONS', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (22, 'VAPP_CREATE_STATEFUL', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (23, 'VAPP_CREATE_INSTANCE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (24, 'APPLIB_VIEW', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (25, 'APPLIB_ALLOW_MODIFY', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (26, 'APPLIB_UPLOAD_IMAGE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (27, 'APPLIB_MANAGE_REPOSITORY', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (28, 'APPLIB_DOWNLOAD_IMAGE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (29, 'APPLIB_MANAGE_CATEGORIES', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (30, 'USERS_VIEW', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (31, 'USERS_MANAGE_ENTERPRISE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (32, 'USERS_MANAGE_USERS', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (33, 'USERS_MANAGE_OTHER_ENTERPRISES', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (34, 'USERS_PROHIBIT_VDC_RESTRICTION', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (35, 'USERS_VIEW_PRIVILEGES', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (36, 'USERS_MANAGE_ROLES', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (37, 'USERS_MANAGE_ROLES_OTHER_ENTERPRISES', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (38, 'USERS_MANAGE_SYSTEM_ROLES', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (39, 'USERS_MANAGE_LDAP_GROUP', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (40, 'USERS_ENUMERATE_CONNECTED', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (41, 'SYSCONFIG_VIEW', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (42, 'SYSCONFIG_ALLOW_MODIFY', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (43, 'EVENTLOG_VIEW_ENTERPRISE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (44, 'EVENTLOG_VIEW_ALL', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (45, 'APPLIB_VM_COST_CODE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (46, 'USERS_MANAGE_ENTERPRISE_BRANDING', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (47, 'SYSCONFIG_SHOW_REPORTS', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (48, 'USERS_DEFINE_AS_MANAGER', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (49, 'PRICING_VIEW', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (50, 'PRICING_MANAGE', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x50)', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-4', '2.0.3', '3:1b6e28cec49ba1fe6aa832e958625b61', 113);

-- Changeset src/2.0ga/data.xml::1335522749701-6::destevezg (generated)::(Checksum: 3:d8fe6ecf9187dc7c3fb35d05bdb8ef4b)
INSERT INTO `kinton`.`workload_fit_policy_rule` (`fitPolicy`, `id`, `idDatacenter`, `version_c`) VALUES ('PROGRESSIVE', 0, NULL, 1);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-6', '2.0.3', '3:d8fe6ecf9187dc7c3fb35d05bdb8ef4b', 114);

-- Changeset src/2.0ga/data.xml::1335522749701-7::destevezg (generated)::(Checksum: 3:6bee14978f59c4c0246e57db5acd1f54)
INSERT INTO `kinton`.`cloud_usage_stats` (`idDataCenter`, `numEnterprisesCreated`, `numUsersCreated`, `numVDCCreated`, `publicIPsReserved`, `publicIPsTotal`, `publicIPsUsed`, `serversRunning`, `serversTotal`, `storageReserved`, `storageTotal`, `storageUsed`, `vCpuReserved`, `vCpuTotal`, `vCpuUsed`, `vMachinesRunning`, `vMachinesTotal`, `vMemoryReserved`, `vMemoryTotal`, `vMemoryUsed`, `vStorageReserved`, `vStorageTotal`, `vStorageUsed`, `version_c`, `vlanReserved`, `vlanUsed`) VALUES (-1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-7', '2.0.3', '3:6bee14978f59c4c0246e57db5acd1f54', 115);

-- Changeset src/2.0ga/data.xml::1335522749701-8::destevezg (generated)::(Checksum: 3:cd8857111c2fccaff489ea361fc63b31)
INSERT INTO `kinton`.`auth_group` (`description`, `id`, `name`, `version_c`) VALUES ('Generic', 1, 'GENERIC', 0);

INSERT INTO `kinton`.`auth_group` (`description`, `id`, `name`, `version_c`) VALUES ('Flex client main menu group', 2, 'MAIN', 0);

INSERT INTO `kinton`.`auth_group` (`description`, `id`, `name`, `version_c`) VALUES ('Flex and server Users Management', 3, 'USER', 0);

INSERT INTO `kinton`.`auth_group` (`description`, `id`, `name`, `version_c`) VALUES ('Flex and server Appliance Library Management', 4, 'APPLIANCE_LIBRARY', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x4)', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-8', '2.0.3', '3:cd8857111c2fccaff489ea361fc63b31', 116);

-- Changeset src/2.0ga/data.xml::1335522749701-9::destevezg (generated)::(Checksum: 3:fb31e2ba074d9a7bc9ba7688e9706dc8)
INSERT INTO `kinton`.`auth_serverresource` (`description`, `id`, `idGroup`, `idRole`, `name`, `version_c`) VALUES ('Login Service', 1, 1, 2, 'LOGIN', 0);

INSERT INTO `kinton`.`auth_serverresource` (`description`, `id`, `idGroup`, `idRole`, `name`, `version_c`) VALUES ('Security to retrieve the whole list of enterprises', 2, 3, 1, 'ENTERPRISE_GET_ALL_ENTERPRISES', 0);

INSERT INTO `kinton`.`auth_serverresource` (`description`, `id`, `idGroup`, `idRole`, `name`, `version_c`) VALUES ('Security to call method getEnterprises in UserCommand', 3, 3, 3, 'ENTERPRISE_GET_ENTERPRISES', 0);

INSERT INTO `kinton`.`auth_serverresource` (`description`, `id`, `idGroup`, `idRole`, `name`, `version_c`) VALUES ('Security to call method getUsers in UserCommand', 4, 3, 3, 'USER_GETUSERS', 0);

INSERT INTO `kinton`.`auth_serverresource` (`description`, `id`, `idGroup`, `idRole`, `name`, `version_c`) VALUES ('Security to retrieve the whole list of users', 5, 3, 1, 'USER_GET_ALL_USERS', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x5)', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-9', '2.0.3', '3:fb31e2ba074d9a7bc9ba7688e9706dc8', 117);

-- Changeset src/2.0ga/data.xml::1335522749701-10::destevezg (generated)::(Checksum: 3:01a0899358975c7e845845aaf5fb68c0)
INSERT INTO `kinton`.`enterprise_properties_map` (`enterprise_properties`, `map_key`, `value`, `version_c`) VALUES (1, 'Support e-mail', 'support@abiquo.com', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-10', '2.0.3', '3:01a0899358975c7e845845aaf5fb68c0', 118);

-- Changeset src/2.0ga/data.xml::1335522749701-11::destevezg (generated)::(Checksum: 3:4e1226a6a36ae74e4ed982725b2d4c54)
INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (1, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (2, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (3, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (4, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (5, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (6, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (7, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (8, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (9, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (10, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (11, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (12, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (13, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (14, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (15, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (16, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (17, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (18, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (19, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (20, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (21, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (22, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (23, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (24, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (25, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (26, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (27, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (28, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (29, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (30, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (31, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (32, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (33, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (34, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (35, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (36, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (37, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (38, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (39, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (40, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (41, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (42, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (43, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (44, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (45, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (47, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (48, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (49, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (50, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (3, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (12, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (13, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (14, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (15, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (16, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (17, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (18, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (19, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (20, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (21, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (22, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (23, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (24, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (25, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (26, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (27, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (28, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (29, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (30, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (32, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (34, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (43, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (48, 3, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (12, 2, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (14, 2, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (17, 2, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (18, 2, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (19, 2, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (20, 2, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (21, 2, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (22, 2, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (23, 2, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (43, 2, 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x83)', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-11', '2.0.3', '3:4e1226a6a36ae74e4ed982725b2d4c54', 119);

-- Changeset src/2.0ga/data.xml::1335522749701-12::destevezg (generated)::(Checksum: 3:038b8f4afc535e869fd3474162ffdb8b)
INSERT INTO `kinton`.`role` (`blocked`, `idEnterprise`, `idRole`, `name`, `version_c`) VALUES (1, NULL, 1, 'CLOUD_ADMIN', 0);

INSERT INTO `kinton`.`role` (`blocked`, `idEnterprise`, `idRole`, `name`, `version_c`) VALUES (0, NULL, 2, 'USER', 0);

INSERT INTO `kinton`.`role` (`blocked`, `idEnterprise`, `idRole`, `name`, `version_c`) VALUES (0, NULL, 3, 'ENTERPRISE_ADMIN', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x3)', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-12', '2.0.3', '3:038b8f4afc535e869fd3474162ffdb8b', 120);

-- Changeset src/2.0ga/data.xml::1335522749701-13::destevezg (generated)::(Checksum: 3:089c056314989f6686309ead50938bcb)
INSERT INTO `kinton`.`enterprise_properties` (`enterprise`, `idProperties`, `version_c`) VALUES (1, 1, 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-13', '2.0.3', '3:089c056314989f6686309ead50938bcb', 121);

-- Changeset src/2.0ga/data.xml::1335522749701-14::destevezg (generated)::(Checksum: 3:488515bb737e87d54efc39654c6bc22a)
INSERT INTO `kinton`.`category` (`idCategory`, `isDefault`, `isErasable`, `name`, `version_c`) VALUES (1, 1, 0, 'Others', 0);

INSERT INTO `kinton`.`category` (`idCategory`, `isDefault`, `isErasable`, `name`, `version_c`) VALUES (2, 0, 1, 'Database servers', 0);

INSERT INTO `kinton`.`category` (`idCategory`, `isDefault`, `isErasable`, `name`, `version_c`) VALUES (4, 0, 1, 'Applications servers', 0);

INSERT INTO `kinton`.`category` (`idCategory`, `isDefault`, `isErasable`, `name`, `version_c`) VALUES (5, 0, 1, 'Web servers', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x4)', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-14', '2.0.3', '3:488515bb737e87d54efc39654c6bc22a', 122);

-- Changeset src/2.0ga/data.xml::1335522749701-15::destevezg (generated)::(Checksum: 3:f01c1cb4f6bf52b684078287b4b72312)
INSERT INTO `kinton`.`network` (`network_id`, `uuid`, `version_c`) VALUES (1, '6cd20366-72e5-11df-8f9d-002564aeca80', 1);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-15', '2.0.3', '3:f01c1cb4f6bf52b684078287b4b72312', 123);

-- Changeset src/2.0ga/data.xml::1335522749701-16::destevezg (generated)::(Checksum: 3:82bf294985b44cab8f8c9ce2114366c7)
INSERT INTO `kinton`.`alerts` (`description`, `id`, `tstamp`, `type`, `value`, `version_c`) VALUES (NULL, '1', '2012-04-23 10:25:41.0', 'REGISTER', 'LATER', 0);

INSERT INTO `kinton`.`alerts` (`description`, `id`, `tstamp`, `type`, `value`, `version_c`) VALUES (NULL, '2', '2012-04-23 10:25:41.0', 'HEARTBEAT', 'YES', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x2)', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-16', '2.0.3', '3:82bf294985b44cab8f8c9ce2114366c7', 124);

-- Changeset src/2.0ga/data.xml::1335522749701-17::destevezg (generated)::(Checksum: 3:1671992947b92f05f598e92f29b3de10)
INSERT INTO `kinton`.`user` (`active`, `authType`, `availableVirtualDatacenters`, `creationDate`, `description`, `email`, `idEnterprise`, `idRole`, `idUser`, `locale`, `name`, `password`, `surname`, `user`, `version_c`) VALUES (1, 'ABIQUO', NULL, '2012-04-27 10:25:34.0', 'Main administrator', '', 1, 1, 1, 'en_US', 'Cloud', 'c69a39bd64ffb77ea7ee3369dce742f3', 'Administrator', 'admin', 0);

INSERT INTO `kinton`.`user` (`active`, `authType`, `availableVirtualDatacenters`, `creationDate`, `description`, `email`, `idEnterprise`, `idRole`, `idUser`, `locale`, `name`, `password`, `surname`, `user`, `version_c`) VALUES (1, 'ABIQUO', NULL, '2012-04-27 10:25:34.0', 'Standard user', '', 1, 2, 2, 'en_US', 'Standard', 'c69a39bd64ffb77ea7ee3369dce742f3', 'User', 'user', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x2)', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-17', '2.0.3', '3:1671992947b92f05f598e92f29b3de10', 125);

-- Changeset src/2.0ga/data.xml::1335522749701-18::destevezg (generated)::(Checksum: 3:2b477b3eddc17cd40dc60c24f7c11e64)
INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Time interval in seconds', 'client.applibrary.ovfpackagesDownloadingProgressUpdateInterval', 1, '10', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Time interval in seconds', 'client.applibrary.virtualimageUploadProgressUpdateInterval', 2, '10', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('URL of Abiquo web page', 'client.dashboard.abiquoURL', 3, 'http://www.abiquo.org', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Allow (1) or deny (0) access to the ''Users'' section', 'client.dashboard.allowUsersAccess', 4, '1', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Set to 1 to show an Alert with the text found in Startup_Alert.txt file', 'client.dashboard.showStartUpAlert', 5, '1', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Google Maps will be centered by default at this longitude value', 'client.infra.googleMapsDefaultLatitude', 6, '41.3825', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Google Maps will be centered by default at this latitude value', 'client.infra.googleMapsDefaultLongitude', 7, '2.176944', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Google Maps will be centered by default with this zoom level value', 'client.infra.googleMapsDefaultZoom', 8, '4', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('The map''s Google key used in infrastructure section', 'client.infra.googleMapskey', 9, '0', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Time, in seconds, that applications waits Google Maps to load. After that, application considers that Google Maps service is temporarily unavailable, and is not used', 'client.infra.googleMapsLadTimeOut', 10, '10', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Time interval in seconds', 'client.infra.InfrastructureUpdateInterval', 11, '30', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('URL to display UCS Manager Interface', 'client.infra.ucsManagerLink', 12, '/ucsm/ucsm.jnlp', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Time interval in seconds', 'client.metering.meteringUpdateInterval', 13, '10', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Number entries that will appear when listing IP addresses in different parts of the application', 'client.network.numberIpAdressesPerPage', 14, '25', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('This is the path to the Enterprise logo used in the app', 'client.theme.defaultEnterpriseLogoPath', 15, 'themes/abicloudDefault/logo.png', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Number of enterprises per page that will appear in User Management', 'client.user.numberEnterprisesPerPage', 16, '25', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Number of users per page that will appear in User Management', 'client.user.numberUsersPerPage', 17, '25', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Allow (1) or deny (0) virtual machine remote access', 'client.virtual.allowVMRemoteAccess', 18, '1', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Time interval in seconds', 'client.virtual.virtualApplianceDeployingUpdateInterval', 19, '5', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Time interval in seconds', 'client.virtual.virtualAppliancesUpdateInterval', 20, '30', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('URL of Abiquo virtual image upload limitations web page', 'client.virtual.moreInfoAboutUploadLimitations', 21, 'http://wiki.abiquo.com/display/ABI20/Adding+VM+Templates+to+the+Appliance+Library#AddingVMTemplatestotheApplianceLibrary-UploadingfromtheLocalFilesystem', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Minimum value for vlan ID', 'client.infra.vlanIdMin', 22, '2', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Maximum value for vlan ID', 'client.infra.vlanIdMax', 23, '4094', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Time interval in seconds', 'client.dashboard.dashboardUpdateInterval', 24, '30', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Default Hypervisor password used when creating Physical Machines', 'client.infra.defaultHypervisorPassword', 25, 'temporal', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Default Hypervisor port used when creating Physical Machines', 'client.infra.defaultHypervisorPort', 26, '8889', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Default Hypervisor user used when creating Physical Machines', 'client.infra.defaultHypervisorUser', 27, 'root', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Comma separated values, with the allowed sizes when creating or editing a VolumeManagement', 'client.storage.volumeMaxSizeValues', 28, '1,2,4,8,16,32,64,128,256', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Time interval in seconds to refresh missing virtual image conversions', 'client.virtual.virtualImagesRefreshConversionsInterval', 29, '5', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('URL displayed when the header enterprise logo is clicked', 'client.main.enterpriseLogoURL', 30, 'http://www.abiquo.com', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('URL displayed when the report header logo is clicked, if empty the report button will not be displayed', 'client.main.billingUrl', 31, '', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Allow (1) or deny (0) user to change their password', 'client.main.disableChangePassword', 32, '1', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Redirect to this URL after logout (empty -> login screen)', 'client.logout.url', 33, '', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Allow (1) or deny (0) user to logout', 'client.main.allowLogout', 34, '1', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Show (1) or hide (0) the help icon within the plateform', 'client.wiki.showHelp', 35, '1', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Use (1) or not (0) the default help URL within the plateform', 'client.wiki.showDefaultHelp', 36, '0', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('The default URL opened when not specific help URL is specified', 'client.wiki.defaultURL', 37, 'http://community.abiquo.com/display/ABI20/Abiquo+Documentation+Home', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('datacenter creation wiki', 'client.wiki.infra.createDatacenter', 38, 'http://community.abiquo.com/display/ABI20/Managing+Datacenters#ManagingDatacenters-CreatingaDatacenter', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('datacenter edition wiki', 'client.wiki.infra.editDatacenter', 39, 'http://community.abiquo.com/display/ABI20/Managing+Datacenters#ManagingDatacenters-ModifyingaDatacenter', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('remote service edition wiki', 'client.wiki.infra.editRemoteService', 40, 'http://community.abiquo.com/display/ABI20/Managing+Datacenters#ManagingDatacenters-RemoteServices', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('physical machine creation wiki', 'client.wiki.infra.createPhysicalMachine', 41, 'http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-CreatingPhysicalMachinesonStandardRacks', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('mail notification wiki', 'client.wiki.infra.mailNotification', 42, 'http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-SendingEmailNotifications', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Datastore manager wiki', 'client.wiki.infra.addDatastore', 43, 'http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-DatastoreManagement', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('rack creation wiki', 'client.wiki.infra.createRack', 44, 'http://community.abiquo.com/display/ABI20/Manage+Racks#ManageRacks-CreatingRacks', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('multiple physical machine creation wiki', 'client.wiki.infra.createMultiplePhysicalMachine', 45, 'http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-CreatingMultiplePhysicalMachines', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('public vlan creation wiki', 'client.wiki.network.publicVlan', 46, 'http://community.abiquo.com/display/ABI20/Manage+Network+Configuration#ManageNetworkConfiguration-CreateVLANsforPublicNetworks', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('static routes wiki', 'client.wiki.network.staticRoutes', 47, 'http://community.abiquo.com/display/ABI20/Manage+Network+Configuration#ManageNetworkConfiguration-ConfiguringStaticRoutesUsingDHCP', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('storage device creation wiki', 'client.wiki.storage.storageDevice', 48, 'http://community.abiquo.com/display/ABI20/Managing+External+Storage#ManagingExternalStorage-ManagedStorage', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('storage pool creation wiki', 'client.wiki.storage.storagePool', 49, 'http://community.abiquo.com/display/ABI20/Managing+External+Storage#ManagingExternalStorage-StoragePools', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('tier edition wiki', 'client.wiki.storage.tier', 50, 'http://community.abiquo.com/display/ABI20/Managing+External+Storage#ManagingExternalStorage-TierManagement', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('global rules wiki', 'client.wiki.allocation.global', 51, 'http://community.abiquo.com/display/ABI20/Manage+Allocation+Rules#ManageAllocationRules-GlobalRulesManagement', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('datacenter rules wiki', 'client.wiki.allocation.datacenter', 52, 'http://community.abiquo.com/display/ABI20/Manage+Allocation+Rules#ManageAllocationRules-DatacenterRulesManagement', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('virtual datacenter creation wiki', 'client.wiki.vdc.createVdc', 53, 'http://community.abiquo.com/display/ABI20/Manage+Virtual+Datacenters#ManageVirtualDatacenters-CreatingaVirtualDatacenter', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('virtual app creation wiki', 'client.wiki.vdc.createVapp', 54, 'http://community.abiquo.com/display/ABI20/Basic+operations#BasicOperations-CreatingaNewVirtualAppliance', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('VDC private network creation wiki', 'client.wiki.vdc.createPrivateNetwork', 55, 'http://community.abiquo.com/display/ABI20/Manage+Networks#ManageNetworks-CreateaPrivateVLAN', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('VDC public network creation wiki', 'client.wiki.vdc.createPublicNetwork', 56, 'http://community.abiquo.com/display/ABI20/Manage+Networks#ManageNetworks-PublicIPReservation', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('VDC virtual volume creation wiki', 'client.wiki.vdc.createVolume', 57, 'http://community.abiquo.com/display/ABI20/Manage+Virtual+Storage#ManageVirtualStorage-CreatingaVolumeofManagedStorage', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Virtual Machine edition wiki', 'client.wiki.vm.editVirtualMachine', 58, 'http://community.abiquo.com/display/ABI20/Configure+Virtual+Machines', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Bundles VM wiki', 'client.wiki.vm.bundleVirtualMachine', 59, 'http://community.abiquo.com/display/ABI20/Configure+a+Virtual+Appliance#ConfigureaVirtualAppliance-CreateanInstance', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Network Interface creation wiki', 'client.wiki.vm.createNetworkInterface', 60, 'http://community.abiquo.com/display/ABI20/Configure+Virtual+Machines#ConfigureVirtualMachines-CreatingaNewNetworkInterface', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Virtual Machine instance creation wiki', 'client.wiki.vm.createInstance', 61, 'http://community.abiquo.com/display/ABI20/Create+Virtual+Machine+instances', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Virtual Machine stateful creation wiki', 'client.wiki.vm.createStateful', 62, 'http://community.abiquo.com/display/ABI20/Create+Persistent+Virtual+Machines', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Capture Virtual Machine wiki', 'client.wiki.vm.captureVirtualMachine', 63, 'http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-WorkingwithImportedVirtualMachines', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Show more info when deploying', 'client.wiki.vm.deployInfo', 64, '', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Virtual Image upload wiki', 'client.wiki.apps.uploadVM', 65, 'http://community.abiquo.com/display/ABI20/Adding+VM+Templates+to+the+Appliance+Library#AddingVMTemplatestotheApplianceLibrary-UploadingfromtheLocalFilesystem', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Enterprise creation wiki', 'client.wiki.user.createEnterprise', 66, 'http://community.abiquo.com/display/ABI20/Manage+Enterprises#ManageEnterprises-CreatingorEditinganEnterprise', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Datacenter Limits wiki', 'client.wiki.user.dataCenterLimits', 67, 'http://community.abiquo.com/display/ABI20/Manage+Enterprises#ManageEnterprises-EdittheEnterprise%27sDatacenters', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('User creation wiki', 'client.wiki.user.createUser', 68, 'http://community.abiquo.com/display/ABI20/Manage+Users#ManageUsers-CreatingorEditingaUser', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Role creation wiki', 'client.wiki.user.createRole', 69, 'http://community.abiquo.com/display/ABI20/Manage+Roles+and+Privileges', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Currency creation wiki', 'client.wiki.pricing.createCurrency', 70, 'http://community.abiquo.com/display/ABI20/Pricing+View#PricingView-CurrenciesTab', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('create pricing template wiki', 'client.wiki.pricing.createTemplate', 71, 'http://community.abiquo.com/display/ABI20/Pricing+View#PricingView-PricingModelsTab', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('create pricing cost code wiki', 'client.wiki.pricing.createCostCode', 72, 'http://community.abiquo.com/display/ABI20/Pricing+View#PricingView-CostCodesTab', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Configuration wiki', 'client.wiki.config.general', 73, 'http://community.abiquo.com/display/ABI20/Configuration+view', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Heartbeat configuration wiki', 'client.wiki.config.heartbeat', 74, 'http://community.abiquo.com/display/ABI20/Configuration+view#ConfigurationView-Heartbeating', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Licence configuration wiki', 'client.wiki.config.licence', 75, 'http://community.abiquo.com/display/ABI20/Configuration+view#ConfigurationView-LicenseManagement', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('Registration wiki', 'client.wiki.config.registration', 76, 'http://community.abiquo.com/display/ABI20/Configuration+view#Configurationview-ProductRegistration', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('discover UCS blades wiki', 'client.wiki.infra.discoverBlades', 77, 'http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-DiscoveringBladesonManagedRacks', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('default private vlan name', 'client.network.defaultName', 78, 'default_private_network', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('index of available netmask', 'client.network.defaultNetmask', 79, '2', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('default private vlan address', 'client.network.defaultAddress', 80, '192.168.0.0', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('default private vlan gateway', 'client.network.defaultGateway', 81, '192.168.0.1', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('default primary DNS', 'client.network.defaultPrimaryDNS', 82, '', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('default secondary DNS', 'client.network.defaultSecondaryDNS', 83, '', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `systemPropertyId`, `value`, `version_c`) VALUES ('default sufix DNS', 'client.network.defaultSufixDNS', 84, '', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x84)', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-18', '2.0.3', '3:2b477b3eddc17cd40dc60c24f7c11e64', 126);

-- Changeset src/2.0ga/data.xml::1335522749701-19::destevezg (generated)::(Checksum: 3:b03d4b735795188e0cc3a94276a7f3da)
INSERT INTO `kinton`.`currency` (`digits`, `idCurrency`, `name`, `symbol`, `version_c`) VALUES (2, 1, 'Dollar - $', 'USD', 0);

INSERT INTO `kinton`.`currency` (`digits`, `idCurrency`, `name`, `symbol`, `version_c`) VALUES (2, 2, 'Euro - 0xE282AC', 'EUR', 0);

INSERT INTO `kinton`.`currency` (`digits`, `idCurrency`, `name`, `symbol`, `version_c`) VALUES (0, 3, 'Yen - 0xc2a5', 'JPY', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x3)', 'EXECUTED', 'src/2.0ga/data.xml', '1335522749701-19', '2.0.3', '3:b03d4b735795188e0cc3a94276a7f3da', 127);

-- Changeset src/2.0ga/triggers.xml::datacenter_created::destevez::(Checksum: 3:b50721ed54ab4d7c0f85bbbd1d29118a)
DROP TRIGGER IF EXISTS datacenter_created;

DELIMITER |
CREATE TRIGGER datacenter_created AFTER INSERT ON datacenter
  FOR EACH ROW BEGIN
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
      INSERT IGNORE INTO cloud_usage_stats (idDataCenter) VALUES (NEW.idDataCenter);
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'datacenter_created', '2.0.3', '3:b50721ed54ab4d7c0f85bbbd1d29118a', 128);

-- Changeset src/2.0ga/triggers.xml::datacenter_deleted::destevez::(Checksum: 3:40f90e4bb446751c5a026acb2369301a)
DROP TRIGGER IF EXISTS datacenter_deleted;

DELIMITER |
CREATE TRIGGER datacenter_deleted AFTER DELETE ON datacenter
  FOR EACH ROW BEGIN
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
	DELETE FROM dc_enterprise_stats WHERE idDataCenter = OLD.idDataCenter;
      	DELETE FROM cloud_usage_stats WHERE idDataCenter = OLD.idDataCenter;
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'datacenter_deleted', '2.0.3', '3:40f90e4bb446751c5a026acb2369301a', 129);

-- Changeset src/2.0ga/triggers.xml::virtualapp_created::destevez::(Checksum: 3:3396427a9e720f559ac8c70d2bd4a9a1)
DROP TRIGGER IF EXISTS virtualapp_created;

DELIMITER |
CREATE TRIGGER virtualapp_created AFTER INSERT ON virtualapp
  FOR EACH ROW BEGIN
    DECLARE vdcNameObj VARCHAR(50);
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
      SELECT vdc.name INTO vdcNameObj
      FROM virtualdatacenter vdc
      WHERE NEW.idVirtualDataCenter = vdc.idVirtualDataCenter;
      INSERT IGNORE INTO vapp_enterprise_stats (idVirtualApp, idEnterprise, idVirtualDataCenter, vappName, vdcName) VALUES(NEW.idVirtualApp, NEW.idEnterprise, NEW.idVirtualDataCenter, NEW.name, vdcNameObj);
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'virtualapp_created', '2.0.3', '3:3396427a9e720f559ac8c70d2bd4a9a1', 130);

-- Changeset src/2.0ga/triggers.xml::virtualapp_deleted::destevez::(Checksum: 3:07ce61b5949424284da109fe23b8c678)
DROP TRIGGER IF EXISTS virtualapp_deleted;

DELIMITER |
CREATE TRIGGER virtualapp_deleted AFTER DELETE ON virtualapp
  FOR EACH ROW BEGIN
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
    DELETE FROM vapp_enterprise_stats WHERE idVirtualApp = OLD.idVirtualApp;
  END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'virtualapp_deleted', '2.0.3', '3:07ce61b5949424284da109fe23b8c678', 131);

-- Changeset src/2.0ga/triggers.xml::enterprise_created::destevez::(Checksum: 3:de998f3bdcdabbae102a01355413f942)
DROP TRIGGER IF EXISTS enterprise_created;

DELIMITER |
CREATE TRIGGER enterprise_created AFTER INSERT ON enterprise
    FOR EACH ROW BEGIN      
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN       
            --  Creates a New row in enterprise_resources_stats to store this enterprise's statistics
            INSERT IGNORE INTO enterprise_resources_stats (idEnterprise) VALUES (NEW.idEnterprise);
            --  Initializes stats for reserved resources (by Enterprise & by DataCenter)            
            UPDATE IGNORE cloud_usage_stats SET numEnterprisesCreated = numEnterprisesCreated+1 WHERE idDataCenter = -1;
            UPDATE IGNORE enterprise_resources_stats 
                SET     vCpuReserved = vCpuReserved + NEW.cpuHard,
                    memoryReserved = memoryReserved + NEW.ramHard,
                    localStorageReserved = localStorageReserved + NEW.hdHard,
                    extStorageReserved = extStorageReserved + NEW.storageHard,
                    vlanReserved = vlanReserved + NEW.vlanHard
            WHERE idEnterprise = NEW.idEnterprise;  
            --  Updates enterprises created (in Fake DataCenter) for Full Cloud Statistics
            UPDATE IGNORE cloud_usage_stats 
                SET vCpuReserved=vCpuReserved + NEW.cpuHard,
                    vMemoryReserved=vMemoryReserved + NEW.ramHard,
                    vStorageReserved=vStorageReserved + NEW.hdHard,
                    storageReserved = storageReserved + NEW.storageHard,
                    publicIPsReserved = publicIPsReserved + NEW.publicIPHard
            WHERE idDataCenter = -1;                        
        END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'enterprise_created', '2.0.3', '3:de998f3bdcdabbae102a01355413f942', 132);

-- Changeset src/2.0ga/triggers.xml::enterprise_updated::destevez::(Checksum: 3:ec4f7a3307a524986b254b77296dff2f)
DROP TRIGGER IF EXISTS enterprise_updated;

DELIMITER |
CREATE TRIGGER enterprise_updated AFTER UPDATE ON enterprise
-- WARN: Enterprises are not deleted, logical delete (delete field) 
    FOR EACH ROW BEGIN
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN       
        -- get DataCenter
        -- calculates resources increase        
        UPDATE IGNORE enterprise_resources_stats 
            SET vCpuReserved = vCpuReserved + NEW.cpuHard - OLD.cpuHard,
                memoryReserved = memoryReserved + NEW.ramHard - OLD.ramHard,
                localStorageReserved = localStorageReserved + NEW.hdHard - OLD.hdHard,
                extStorageReserved = extStorageReserved + NEW.storageHard - OLD.storageHard,
                repositoryReserved = repositoryReserved + NEW.repositoryHard - OLD.repositoryHard,
                -- To be updated when IP is actually reserved/freed
                -- publicIPsReserved = publicIPsReserved + NEW.publicIPHard - OLD.publicIPHard,
                vlanReserved = vlanReserved + NEW.vlanHard - OLD.vlanHard
        WHERE idEnterprise = NEW.idEnterprise;
        UPDATE IGNORE cloud_usage_stats 
        SET vCpuReserved = vCpuReserved  + NEW.cpuHard - OLD.cpuHard,
            vMemoryReserved=vMemoryReserved + NEW.ramHard - OLD.ramHard,            
            vStorageReserved = vStorageReserved + NEW.hdHard - OLD.hdHard,
            storageReserved=storageReserved + NEW.storageHard - OLD.storageHard,
            publicIPsReserved = publicIPsReserved + NEW.publicIPHard - OLD.publicIPHard
        WHERE idDataCenter = -1;
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'enterprise_updated', '2.0.3', '3:ec4f7a3307a524986b254b77296dff2f', 133);

-- Changeset src/2.0ga/triggers.xml::enterprise_deleted::destevez::(Checksum: 3:a55c636cdabddeb46b11206c5dc3849b)
DROP TRIGGER IF EXISTS enterprise_deleted;

DELIMITER |
CREATE TRIGGER enterprise_deleted AFTER DELETE ON enterprise
    FOR EACH ROW BEGIN      
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
        DELETE FROM enterprise_resources_stats WHERE idEnterprise = OLD.idEnterprise;           
        UPDATE IGNORE cloud_usage_stats SET numEnterprisesCreated = numEnterprisesCreated-1 WHERE idDataCenter = -1;
        -- init reserved stats
        UPDATE IGNORE cloud_usage_stats 
            SET     vCpuReserved=vCpuReserved - OLD.cpuHard,
                vMemoryReserved=vMemoryReserved - OLD.ramHard,
                vStorageReserved = vStorageReserved - OLD.hdHard,
                storageReserved=storageReserved - OLD.storageHard,                
                -- repositoryReserved = repositoryReserved - OLD.repositoryHard
                -- To be updated when IP is actually reserved/freed
                publicIPsReserved = publicIPsReserved - OLD.publicIPHard
        WHERE idDataCenter = -1;
    END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'enterprise_deleted', '2.0.3', '3:a55c636cdabddeb46b11206c5dc3849b', 134);

-- Changeset src/2.0ga/triggers.xml::create_physicalmachine_update_stats::destevez::(Checksum: 3:66a50b5f2c32b730c41a8589dd1f8c7a)
DROP TRIGGER IF EXISTS create_physicalmachine_update_stats;

DELIMITER |
CREATE TRIGGER create_physicalmachine_update_stats AFTER INSERT ON physicalmachine
FOR EACH ROW BEGIN
IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
    IF NEW.idState = 3 THEN
        UPDATE IGNORE cloud_usage_stats SET serversRunning = serversRunning+1,
               vCpuUsed=vCpuUsed+NEW.cpuUsed, vMemoryUsed=vMemoryUsed+NEW.ramUsed
        WHERE idDataCenter = NEW.idDataCenter;
    END IF;
    IF NEW.idState != 2 THEN
        UPDATE IGNORE cloud_usage_stats SET serversTotal = serversTotal+1, 
               vCpuTotal=vCpuTotal+NEW.cpu, vMemoryTotal=vMemoryTotal+NEW.ram
        WHERE idDataCenter = NEW.idDataCenter;
    END IF;
END IF;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'create_physicalmachine_update_stats', '2.0.3', '3:66a50b5f2c32b730c41a8589dd1f8c7a', 135);

-- Changeset src/2.0ga/triggers.xml::create_datastore_update_stats::destevez::(Checksum: 3:63b76dc59ee95e078b89e6e9f9af5d8a)
DROP TRIGGER IF EXISTS create_datastore_update_stats;

DELIMITER |
CREATE TRIGGER create_datastore_update_stats AFTER INSERT ON datastore_assignment
FOR EACH ROW BEGIN
DECLARE machineState INT UNSIGNED;
DECLARE idDatacenter INT UNSIGNED;
DECLARE enabled INT UNSIGNED;
DECLARE usedSize BIGINT UNSIGNED;
DECLARE size BIGINT UNSIGNED;
DECLARE datastoreuuid VARCHAR(255);
SELECT pm.idState, pm.idDatacenter INTO machineState, idDatacenter FROM physicalmachine pm WHERE pm.idPhysicalMachine = NEW.idPhysicalmachine;
SELECT d.enabled, d.usedSize, d.size, d.datastoreUUID INTO enabled, usedSize, size, datastoreuuid FROM datastore d WHERE d.idDatastore = NEW.idDatastore;
IF (@DISABLED_STATS_TRIGGERS IS NULL) THEN
    IF (SELECT count(*) FROM datastore d LEFT OUTER JOIN datastore_assignment da ON d.idDatastore = da.idDatastore
        LEFT OUTER JOIN physicalmachine pm ON da.idPhysicalMachine = pm.idPhysicalMachine
        WHERE pm.idDatacenter = idDatacenter AND d.datastoreUUID = datastoreuuid AND d.idDatastore != NEW.idDatastore
        AND d.enabled = 1) = 0 THEN
        IF machineState = 3 THEN
            IF enabled = 1 THEN
                UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageUsed = cus.vStorageUsed + usedSize
                WHERE cus.idDataCenter = idDatacenter;
            END IF;
        END IF;
        IF machineState != 2 THEN
            IF enabled = 1 THEN
                UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal + size
                WHERE cus.idDataCenter = idDatacenter;
            END IF;
        END IF;
    END IF;
END IF;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'create_datastore_update_stats', '2.0.3', '3:63b76dc59ee95e078b89e6e9f9af5d8a', 136);

-- Changeset src/2.0ga/triggers.xml::delete_physicalmachine_update_stats::destevez::(Checksum: 3:ad7b8173967a8f2e5be03830b9135c0d)
DROP TRIGGER IF EXISTS delete_physicalmachine_update_stats;

DELIMITER |
CREATE TRIGGER delete_physicalmachine_update_stats AFTER DELETE ON physicalmachine
FOR EACH ROW BEGIN
IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
    IF OLD.idState = 3 THEN
        UPDATE IGNORE cloud_usage_stats SET serversRunning = serversRunning-1,
               vCpuUsed=vCpuUsed-OLD.cpuUsed, vMemoryUsed=vMemoryUsed-OLD.ramUsed
        WHERE idDataCenter = OLD.idDataCenter;
    END IF;
    IF OLD.idState NOT IN (2, 6, 7) THEN
        UPDATE IGNORE cloud_usage_stats SET serversTotal=serversTotal-1,
               vCpuTotal=vCpuTotal-OLD.cpu, vMemoryTotal=vMemoryTotal-OLD.ram
        WHERE idDataCenter = OLD.idDataCenter;
    END IF;
END IF;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'delete_physicalmachine_update_stats', '2.0.3', '3:ad7b8173967a8f2e5be03830b9135c0d', 137);

-- Changeset src/2.0ga/triggers.xml::delete_datastore_update_stats::destevez::(Checksum: 3:3e53176b454b32cb5456e03d7edca066)
DROP TRIGGER IF EXISTS delete_datastore_update_stats;

DELIMITER |
CREATE TRIGGER delete_datastore_update_stats BEFORE DELETE ON datastore
FOR EACH ROW BEGIN
DECLARE machineState INT UNSIGNED;
DECLARE idDatacenter INT UNSIGNED;
SELECT pm.idState, pm.idDatacenter INTO machineState, idDatacenter FROM physicalmachine pm LEFT OUTER JOIN datastore_assignment da ON pm.idPhysicalMachine = da.idPhysicalMachine
WHERE da.idDatastore = OLD.idDatastore;
IF (@DISABLED_STATS_TRIGGERS IS NULL) THEN
    IF (SELECT count(*) FROM datastore d LEFT OUTER JOIN datastore_assignment da ON d.idDatastore = da.idDatastore
        LEFT OUTER JOIN physicalmachine pm ON da.idPhysicalMachine = pm.idPhysicalMachine
        WHERE pm.idDatacenter = idDatacenter AND d.datastoreUUID = OLD.datastoreuuid AND d.idDatastore != OLD.idDatastore
        AND d.enabled = 1) = 0 THEN
        IF machineState = 3 THEN
            IF OLD.enabled = 1 THEN
                UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageUsed = cus.vStorageUsed - OLD.usedSize
                WHERE cus.idDataCenter = idDatacenter;
            END IF;
        END IF;
        IF machineState NOT IN (2, 6, 7) THEN
            IF OLD.enabled = 1 THEN
                UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal - OLD.size
                WHERE cus.idDataCenter = idDatacenter;
            END IF;
        END IF;
    END IF;
END IF;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'delete_datastore_update_stats', '2.0.3', '3:3e53176b454b32cb5456e03d7edca066', 138);

-- Changeset src/2.0ga/triggers.xml::update_physicalmachine_update_stats::destevez::(Checksum: 3:c33a43d75bb96e97f5a752dc0bffdda7)
DROP TRIGGER IF EXISTS update_physicalmachine_update_stats;

DELIMITER |
CREATE TRIGGER update_physicalmachine_update_stats AFTER UPDATE ON physicalmachine
FOR EACH ROW BEGIN
DECLARE datastoreSize BIGINT UNSIGNED;
DECLARE oldDatastoreSize BIGINT UNSIGNED;
IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
    IF OLD.idState != NEW.idState THEN
        IF OLD.idState IN (2, 7) THEN
            -- Machine not managed changes into managed; or disabled_by_ha to Managed
            UPDATE IGNORE cloud_usage_stats SET serversTotal=serversTotal+1,
                   vCpuTotal=vCpuTotal + NEW.cpu,
                   vMemoryTotal=vMemoryTotal + NEW.ram
            WHERE idDataCenter = NEW.idDataCenter;
        END IF;
        IF NEW.idState IN (2,7) THEN
            -- Machine managed changes into not managed or DisabledByHA
            UPDATE IGNORE cloud_usage_stats SET serversTotal=serversTotal-1,
                   vCpuTotal=vCpuTotal-OLD.cpu,
                   vMemoryTotal=vMemoryTotal-OLD.ram
            WHERE idDataCenter = OLD.idDataCenter;
        END IF;
        IF NEW.idState = 3 THEN
            -- Stopped / Halted / Not provisioned passes to Managed (Running)
            UPDATE IGNORE cloud_usage_stats SET serversRunning = serversRunning+1,
                   vCpuUsed=vCpuUsed+NEW.cpuUsed,
                   vMemoryUsed=vMemoryUsed+NEW.ramUsed
            WHERE idDataCenter = NEW.idDataCenter;
        ELSEIF OLD.idState = 3 THEN
            -- Managed (Running) passes to Stopped / Halted / Not provisioned
            UPDATE IGNORE cloud_usage_stats SET serversRunning = serversRunning-1,
                   vCpuUsed=vCpuUsed-OLD.cpuUsed,
                   vMemoryUsed=vMemoryUsed-OLD.ramUsed
            WHERE idDataCenter = OLD.idDataCenter;
        END IF;
    ELSE
        -- No State Changes
        IF NEW.idState NOT IN (2, 6, 7) THEN
            -- If Machine is in a not managed state, changes into resources are ignored, Should we add 'Disabled' state to this condition?
            UPDATE IGNORE cloud_usage_stats SET vCpuTotal=vCpuTotal+(NEW.cpu-OLD.cpu),
                   vMemoryTotal=vMemoryTotal + (NEW.ram-OLD.ram)
            WHERE idDataCenter = OLD.idDataCenter;
        END IF;
        --
        IF NEW.idState = 3 THEN
            UPDATE IGNORE cloud_usage_stats SET vCpuUsed=vCpuUsed + (NEW.cpuUsed-OLD.cpuUsed),
                   vMemoryUsed=vMemoryUsed + (NEW.ramUsed-OLD.ramUsed)
            WHERE idDataCenter = OLD.idDataCenter;
        END IF;
    END IF;
END IF;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'update_physicalmachine_update_stats', '2.0.3', '3:c33a43d75bb96e97f5a752dc0bffdda7', 139);

-- Changeset src/2.0ga/triggers.xml::create_virtualmachine_update_stats::destevez::(Checksum: 3:b4974986747712028c438c1d6396d632)
DROP TRIGGER IF EXISTS create_virtualmachine_update_stats;

DELIMITER |
CREATE TRIGGER create_virtualmachine_update_stats AFTER INSERT ON virtualmachine
    FOR EACH ROW BEGIN
	IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
		INSERT INTO virtualmachinetrackedstate (idVM) VALUES (NEW.idVM);
	END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'create_virtualmachine_update_stats', '2.0.3', '3:b4974986747712028c438c1d6396d632', 140);

-- Changeset src/2.0ga/triggers.xml::delete_virtualmachine_update_stats::destevez::(Checksum: 3:5120ec32cead387a721e49d2046ebbfa)
DROP TRIGGER IF EXISTS delete_virtualmachine_update_stats;

DELIMITER |
CREATE TRIGGER delete_virtualmachine_update_stats AFTER DELETE ON virtualmachine
    FOR EACH ROW BEGIN
	IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
		DELETE FROM virtualmachinetrackedstate WHERE idVM = OLD.idVM;
	END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'delete_virtualmachine_update_stats', '2.0.3', '3:5120ec32cead387a721e49d2046ebbfa', 141);

-- Changeset src/2.0ga/triggers.xml::update_virtualmachine_update_stats::destevez::(Checksum: 3:ce98b001ef068af5bcb4f1c2e37d5a28)
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

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'update_virtualmachine_update_stats', '2.0.3', '3:ce98b001ef068af5bcb4f1c2e37d5a28', 142);

-- Changeset src/2.0ga/triggers.xml::create_nodevirtualimage_update_stats::destevez::(Checksum: 3:cc6a1d71c80071d4e4d2ec5cdad805f2)
DROP TRIGGER IF EXISTS create_nodevirtualimage_update_stats;

DELIMITER |
CREATE TRIGGER create_nodevirtualimage_update_stats AFTER INSERT ON nodevirtualimage
  FOR EACH ROW BEGIN
    DECLARE idDataCenterObj INTEGER;
    DECLARE idVirtualAppObj INTEGER;
    DECLARE idVirtualDataCenterObj INTEGER;
    DECLARE idEnterpriseObj INTEGER;
    DECLARE costCodeObj int(4);
    DECLARE type INTEGER;
    DECLARE state VARCHAR(50);
    DECLARE ram INTEGER;
    DECLARE cpu INTEGER;
    DECLARE hd bigint;
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
    SELECT vapp.idVirtualApp, vapp.idVirtualDataCenter, vdc.idDataCenter, vdc.idEnterprise  INTO idVirtualAppObj, idVirtualDataCenterObj, idDataCenterObj, idEnterpriseObj
      FROM node n, virtualapp vapp, virtualdatacenter vdc
      WHERE vdc.idVirtualDataCenter = vapp.idVirtualDataCenter
      AND n.idNode = NEW.idNode
      AND n.idVirtualApp = vapp.idVirtualApp;
      SELECT vm.idType, vm.state, vm.cpu, vm.ram, vm.hd INTO type, state, cpu, ram, hd
     FROM virtualmachine vm
	WHERE vm.idVM = NEW.idVM;
      --  INSERT INTO debug_msg (msg) VALUES (CONCAT('createNVI ', type, ' - ', state, ' - ', IFNULL(idDataCenterObj,'NULL'), ' - ',IFNULL(idVirtualAppObj,'NULL'), ' - ',IFNULL(idVirtualDataCenterObj,'NULL')));
    IF type=1 THEN
    	-- Imported !!!
		UPDATE IGNORE cloud_usage_stats SET vMachinesTotal = vMachinesTotal+1
                WHERE idDataCenter = idDataCenterObj;
                UPDATE IGNORE vapp_enterprise_stats SET vmCreated = vmCreated+1
                WHERE idVirtualApp = idVirtualAppObj;
                UPDATE IGNORE vdc_enterprise_stats SET vmCreated = vmCreated+1
                WHERE idVirtualDataCenter = idVirtualDataCenterObj;
          IF state = "ON" THEN 	
			UPDATE IGNORE vapp_enterprise_stats SET vmActive = vmActive+1
		        WHERE idVirtualApp = idVirtualAppObj;
		        UPDATE IGNORE vdc_enterprise_stats SET vmActive = vmActive+1
		        WHERE idVirtualDataCenter = idVirtualDataCenterObj;
		        UPDATE IGNORE cloud_usage_stats SET vMachinesRunning = vMachinesRunning+1
		        WHERE idDataCenter = idDataCenterObj;       
		        UPDATE IGNORE enterprise_resources_stats 
		            SET vCpuUsed = vCpuUsed + cpu,
		                memoryUsed = memoryUsed + ram,
		                localStorageUsed = localStorageUsed + hd
		        WHERE idEnterprise = idEnterpriseObj;
		        UPDATE IGNORE dc_enterprise_stats 
		        SET     vCpuUsed = vCpuUsed + cpu,
		            memoryUsed = memoryUsed + ram,
		            localStorageUsed = localStorageUsed + hd
		        WHERE idEnterprise = idEnterpriseObj AND idDataCenter = idDataCenterObj;
		        UPDATE IGNORE vdc_enterprise_stats 
		        SET     vCpuUsed = vCpuUsed + cpu,
		            memoryUsed = memoryUsed + ram,
		            localStorageUsed = localStorageUsed + hd
		        WHERE idVirtualDataCenter = idVirtualDataCenterObj;	
		END IF;
    END IF;    
    SELECT IF(vi.cost_code IS NULL, 0, vi.cost_code) INTO costCodeObj
        FROM virtualimage vi
        WHERE vi.idImage = NEW.idImage;
    IF EXISTS( SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVMRegisterEvents' ) THEN
       IF EXISTS(SELECT * FROM virtualimage vi WHERE vi.idImage=NEW.idImage) THEN 
	          CALL AccountingVMRegisterEvents(NEW.idVM, type, "NOT_ALLOCATED", state, "NOT_ALLOCATED", ram, cpu, hd, costCodeObj);
        END IF;              
     END IF;
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'create_nodevirtualimage_update_stats', '2.0.3', '3:cc6a1d71c80071d4e4d2ec5cdad805f2', 143);

-- Changeset src/2.0ga/triggers.xml::delete_nodevirtualimage_update_stats::destevez::(Checksum: 3:de10ff87abd570bc74a50ce7455b7720)
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

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'delete_nodevirtualimage_update_stats', '2.0.3', '3:de10ff87abd570bc74a50ce7455b7720', 144);

-- Changeset src/2.0ga/triggers.xml::create_volume_management_update_stats::destevez::(Checksum: 3:1cccc879fa605c617e11a1a76de5c641)
DROP TRIGGER IF EXISTS create_volume_management_update_stats;

DELIMITER |
CREATE TRIGGER create_volume_management_update_stats AFTER INSERT ON volume_management
    FOR EACH ROW BEGIN
        DECLARE idDataCenterObj INTEGER;
        DECLARE idVirtualDataCenterObj INTEGER;
        DECLARE idThisEnterprise INTEGER;
        DECLARE limitResourceObj BIGINT;
        DECLARE idResourceObj VARCHAR(50);
        DECLARE idResourceTypeObj VARCHAR(5);
	DECLARE idStorageTier INTEGER;
        DECLARE resourceName VARCHAR(255);
        SELECT vdc.idDataCenter, vdc.idEnterprise, vdc.idVirtualDataCenter INTO idDataCenterObj, idThisEnterprise, idVirtualDataCenterObj
        FROM virtualdatacenter vdc, rasd_management rm
        WHERE vdc.idVirtualDataCenter = rm.idVirtualDataCenter
        AND NEW.idManagement = rm.idManagement;
        --
        SELECT r.elementName, r.limitResource, rm.idResource, rm.idResourceType INTO resourceName, limitResourceObj, idResourceObj, idResourceTypeObj
        FROM rasd r, rasd_management rm
        WHERE r.instanceID = rm.idResource
        AND NEW.idManagement = rm.idManagement;
        --
        SELECT sp.idTier INTO idStorageTier
        FROM storage_pool sp
        WHERE sp.idStorage = NEW.idStorage;
        -- INSERT INTO debug_msg (msg) VALUES (CONCAT('Create VOL idDataCenterObj ',IFNULL(idDataCenterObj,'-')));
        -- INSERT INTO debug_msg (msg) VALUES (CONCAT('Create VOL limitResourceObj ',IFNULL(limitResourceObj,'-')));
        -- INSERT INTO debug_msg (msg) VALUES (CONCAT('Create VOL idResourceObj ',IFNULL(idResourceObj,'-')));
        -- INSERT INTO debug_msg (msg) VALUES (CONCAT('Create VOL idStorageTier ',IFNULL(idStorageTier,'-')));
        -- INSERT INTO debug_msg (msg) VALUES (CONCAT('Create VOL resourceName: ',IFNULL(resourceName,'-')));
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN           
            IF idResourceTypeObj='8' THEN 
                UPDATE IGNORE cloud_usage_stats SET storageTotal = storageTotal+limitResourceObj WHERE idDataCenter = idDataCenterObj;
                UPDATE IGNORE vdc_enterprise_stats SET volCreated = volCreated+1 WHERE idVirtualDataCenter = idVirtualDataCenterObj;
                IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingStorageRegisterEvents' ) THEN
                    CALL AccountingStorageRegisterEvents('CREATE_STORAGE', idResourceObj, resourceName, idStorageTier, idVirtualDataCenterObj, idThisEnterprise, limitResourceObj);
                END IF;               
            END IF;
        END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'create_volume_management_update_stats', '2.0.3', '3:1cccc879fa605c617e11a1a76de5c641', 145);

-- Changeset src/2.0ga/triggers.xml::delete_rasd_management_update_stats::destevez::(Checksum: 3:d72e7eb693e36fd8b50bbf2959badde8)
DROP TRIGGER IF EXISTS delete_rasd_management_update_stats;

DELIMITER |
CREATE TRIGGER delete_rasd_management_update_stats AFTER DELETE ON rasd_management
    FOR EACH ROW BEGIN
        DECLARE idDataCenterObj INTEGER;
        DECLARE idThisEnterprise INTEGER;
        DECLARE limitResourceObj BIGINT;    
        DECLARE resourceName VARCHAR(255);  
	DECLARE currentState VARCHAR(50);
	DECLARE previousState VARCHAR(50);
	DECLARE extraHDSize BIGINT DEFAULT 0;
	SELECT vdc.idDataCenter, vdc.idEnterprise INTO idDataCenterObj, idThisEnterprise
        FROM virtualdatacenter vdc
        WHERE vdc.idVirtualDataCenter = OLD.idVirtualDataCenter;
	SELECT vm.state INTO currentState
        FROM virtualmachine vm
        WHERE vm.idVM = OLD.idVM;
	SELECT vmts.previousState INTO previousState
        FROM virtualmachinetrackedstate vmts
	WHERE vmts.idVM = OLD.idVM;
        SELECT elementName, limitResource INTO resourceName, limitResourceObj
        FROM rasd r
        WHERE r.instanceID = OLD.idResource;
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN           
            IF OLD.idResourceType='8' THEN 
                UPDATE IGNORE cloud_usage_stats SET storageTotal = storageTotal-limitResourceObj WHERE idDataCenter = idDataCenterObj;
                UPDATE IGNORE vdc_enterprise_stats SET volCreated = volCreated-1 WHERE idVirtualDataCenter = OLD.idVirtualDataCenter;
                IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingStorageRegisterEvents' ) THEN
                    CALL AccountingStorageRegisterEvents('DELETE_STORAGE', OLD.idResource, resourceName, 0, OLD.idVirtualDataCenter, idThisEnterprise, limitResourceObj);
                END IF;                  
            END IF;
            IF OLD.idResourceType='17' AND previousState = 'ON' THEN
		-- INSERT INTO debug_msg (msg) VALUES (CONCAT('Removed ExtraHDs ', limitResourceObj, ' for idVM ', OLD.idVM, ' with state ', previousState));  
		SELECT limitResourceObj * 1048576 INTO extraHDSize;
		UPDATE IGNORE enterprise_resources_stats 
                SET localStorageUsed = localStorageUsed - extraHDSize 
                WHERE idEnterprise = idThisEnterprise;
                UPDATE IGNORE dc_enterprise_stats 
                SET localStorageUsed = localStorageUsed - extraHDSize
                WHERE idEnterprise = idThisEnterprise AND idDataCenter = idDataCenterObj;
                UPDATE IGNORE vdc_enterprise_stats 
                SET localStorageUsed = localStorageUsed - extraHDSize
                WHERE idVirtualDataCenter = OLD.idVirtualDataCenter; 		
	    END IF;
        END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'delete_rasd_management_update_stats', '2.0.3', '3:d72e7eb693e36fd8b50bbf2959badde8', 146);

-- Changeset src/2.0ga/triggers.xml::virtualdatacenter_created::destevez::(Checksum: 3:aad1479f52e2c84a12067d06472a16bb)
DROP TRIGGER IF EXISTS virtualdatacenter_created;

DELIMITER |
CREATE TRIGGER virtualdatacenter_created AFTER INSERT ON virtualdatacenter
    FOR EACH ROW BEGIN
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
        UPDATE IGNORE cloud_usage_stats SET numVDCCreated = numVDCCreated + 1 WHERE idDataCenter = NEW.idDataCenter;    
        -- Init Stats
        INSERT IGNORE INTO vdc_enterprise_stats 
            (idVirtualDataCenter,idEnterprise,vdcName,
            vCpuReserved,vCpuUsed,memoryReserved,memoryUsed,localStorageReserved,localStorageUsed,
            extStorageReserved, extStorageUsed, publicIPsReserved,publicIPsUsed,vlanReserved,vlanUsed) 
        VALUES 
            (NEW.idVirtualDataCenter, NEW.idEnterprise, NEW.name,
            NEW.cpuHard, 0, NEW.ramHard, 0, NEW.hdHard, 0,
            NEW.storageHard, 0, 0, 0, NEW.vlanHard, 0);          
    END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'virtualdatacenter_created', '2.0.3', '3:aad1479f52e2c84a12067d06472a16bb', 147);

-- Changeset src/2.0ga/triggers.xml::virtualdatacenter_updated::destevez::(Checksum: 3:b28dcbbbf64fc2044efa37976e97dd23)
DROP TRIGGER IF EXISTS virtualdatacenter_updated;

DELIMITER |
CREATE TRIGGER virtualdatacenter_updated AFTER UPDATE ON virtualdatacenter
    FOR EACH ROW BEGIN
    DECLARE vlanNetworkIdObj INTEGER;    
        	  DECLARE networkNameObj VARCHAR(40);
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   
            -- INSERT INTO debug_msg (msg) VALUES (CONCAT('OLD.networktypeID ', IFNULL(OLD.networktypeID,'NULL'),'NEW.networktypeID ', IFNULL(NEW.networktypeID,'NULL')));
            -- Checks for changes
            IF OLD.name != NEW.name THEN
                -- Name changed !!!
                UPDATE IGNORE vdc_enterprise_stats SET vdcName = NEW.name
                WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
                -- Changes also in Vapp stats
                UPDATE IGNORE vapp_enterprise_stats SET vdcName = NEW.name
                WHERE idVirtualApp IN (SELECT idVirtualApp FROM virtualapp WHERE idVirtualDataCenter=NEW.idVirtualDataCenter);
            END IF; 
            UPDATE IGNORE vdc_enterprise_stats 
            SET vCpuReserved = vCpuReserved - OLD.cpuHard + NEW.cpuHard,
                memoryReserved = memoryReserved - OLD.ramHard + NEW.ramHard,
                localStorageReserved = localStorageReserved - OLD.hdHard + NEW.hdHard,
                -- publicIPsReserved = publicIPsReserved - OLD.publicIPHard + NEW.publicIPHard,
                extStorageReserved = extStorageReserved - OLD.storageHard + NEW.storageHard,
                vlanReserved = vlanReserved - OLD.vlanHard + NEW.vlanHard
            WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;            
        END IF;
        IF OLD.networktypeID IS NOT NULL AND NEW.networktypeID IS NULL THEN
        -- Remove VlanUsed
	    BEGIN
		DECLARE done INTEGER DEFAULT 0;
		DECLARE cursorVlan CURSOR FOR SELECT DISTINCT vn.vlan_network_id, vn.network_name FROM vlan_network vn WHERE vn.network_id = OLD.networktypeID;
		DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
		    
		OPEN cursorVlan;
		    
		REPEAT
		   FETCH cursorVlan into vlanNetworkIdObj, networkNameObj;
		   IF NOT done THEN

		    -- INSERT INTO debug_msg (msg) VALUES (CONCAT('VDC UPDATED -> OLD.networktypeID ', IFNULL(OLD.networktypeID,'NULL'), 'Enterprise: ',IFNULL(OLD.idEnterprise,'NULL'),' VDC: ',IFNULL(OLD.idVirtualDataCenter,'NULL'),IFNULL(vlanNetworkIdObj,'NULL'),IFNULL(networkNameObj,'NULL')));
			IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVLANRegisterEvents' ) THEN
				CALL AccountingVLANRegisterEvents('DELETE_VLAN',vlanNetworkIdObj, networkNameObj, OLD.idVirtualDataCenter,OLD.idEnterprise);
			END IF;
			-- Statistics
			UPDATE IGNORE cloud_usage_stats
				SET     vlanUsed = vlanUsed - 1
				WHERE idDataCenter = -1;
			UPDATE IGNORE enterprise_resources_stats 
				SET     vlanUsed = vlanUsed - 1
				WHERE idEnterprise = OLD.idEnterprise;
			UPDATE IGNORE vdc_enterprise_stats 
				SET     vlanUsed = vlanUsed - 1
			    WHERE idVirtualDataCenter = OLD.idVirtualDataCenter;
		   END IF;    
		UNTIL done END REPEAT;
		CLOSE cursorVlan;
	    END ;
        END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'virtualdatacenter_updated', '2.0.3', '3:b28dcbbbf64fc2044efa37976e97dd23', 148);

-- Changeset src/2.0ga/triggers.xml::virtualdatacenter_deleted::destevez::(Checksum: 3:5cb6a7ee8228db181d3c413dcaf8f221)
DROP TRIGGER IF EXISTS virtualdatacenter_deleted;

DELIMITER |
CREATE TRIGGER virtualdatacenter_deleted BEFORE DELETE ON virtualdatacenter
    FOR EACH ROW BEGIN
    DECLARE currentIdManagement INTEGER DEFAULT -1;
    DECLARE currentDataCenter INTEGER DEFAULT -1;
    DECLARE currentIpAddress VARCHAR(20) DEFAULT '';
    DECLARE no_more_ipsfreed INT;
    DECLARE curIpFreed CURSOR FOR SELECT dc.idDataCenter, ipm.ip, ra.idManagement   
           FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, datacenter dc, rasd_management ra
           WHERE ipm.vlan_network_id = vn.vlan_network_id
           AND vn.network_configuration_id = nc.network_configuration_id
           AND vn.network_id = dc.network_id
       AND vn.networktype = 'PUBLIC'
           AND ra.idManagement = ipm.idManagement
           AND ra.idVirtualDataCenter = OLD.idVirtualDataCenter;
       DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_ipsfreed = 1;   
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
            UPDATE IGNORE cloud_usage_stats SET numVDCCreated = numVDCCreated-1 WHERE idDataCenter = OLD.idDataCenter;  
            -- Remove Stats
            DELETE FROM vdc_enterprise_stats WHERE idVirtualDataCenter = OLD.idVirtualDataCenter;   
           --   
    SET no_more_ipsfreed = 0;       
        OPEN curIpFreed;            
        my_loop:WHILE(no_more_ipsfreed=0) DO 
        FETCH curIpFreed INTO currentDataCenter, currentIpAddress, currentIdManagement;
        IF no_more_ipsfreed=1 THEN
                    LEAVE my_loop;
             END IF;
--      INSERT INTO debug_msg (msg) VALUES (CONCAT('IP_FREED: ',currentIpAddress, ' - idManagement: ', currentIdManagement, ' - OLD.idVirtualDataCenter: ', OLD.idVirtualDataCenter, ' - idEnterpriseObj: ', OLD.idEnterprise));
        -- We reset MAC and NAME for the reserved IPs. Java code should do this!
        UPDATE ip_pool_management set mac=NULL, name=NULL WHERE idManagement = currentIdManagement;
        IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingIPsRegisterEvents' ) THEN
                    CALL AccountingIPsRegisterEvents('IP_FREED',currentIdManagement,currentIpAddress,OLD.idVirtualDataCenter, OLD.idEnterprise);
            END IF;                    
        UPDATE IGNORE cloud_usage_stats SET publicIPsUsed = publicIPsUsed-1 WHERE idDataCenter = currentDataCenter;
        UPDATE IGNORE dc_enterprise_stats SET publicIPsReserved = publicIPsReserved-1 WHERE idDataCenter = currentDataCenter;
        UPDATE IGNORE enterprise_resources_stats SET publicIPsReserved = publicIPsReserved-1 WHERE idEnterprise = OLD.idEnterprise; 
        END WHILE my_loop;         
        CLOSE curIpFreed;
        END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'virtualdatacenter_deleted', '2.0.3', '3:5cb6a7ee8228db181d3c413dcaf8f221', 149);

-- Changeset src/2.0ga/triggers.xml::user_created::destevez::(Checksum: 3:282865b0ac508e4a9e42b987f7038046)
DROP TRIGGER IF EXISTS user_created;

DELIMITER |
CREATE TRIGGER user_created AFTER INSERT ON user
  FOR EACH ROW BEGIN
    -- DECLARE idDataCenterObj INTEGER;
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
    -- SELECT vc.idDataCenter INTO idDataCenterObj
    -- FROM virtualdatacenter vc, enterprise e
    -- WHERE vc.idEnterprise = e.idEnterprise
    -- AND NEW.idEnterprise = e.idEnterprise;
    UPDATE IGNORE cloud_usage_stats SET numUsersCreated = numUsersCreated+1 WHERE idDataCenter = -1;
   END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'user_created', '2.0.3', '3:282865b0ac508e4a9e42b987f7038046', 150);

-- Changeset src/2.0ga/triggers.xml::user_deleted::destevez::(Checksum: 3:875783cf32349a58b2b57f473f1a06fa)
DROP TRIGGER IF EXISTS user_deleted;

DELIMITER |
CREATE TRIGGER user_deleted AFTER DELETE ON user
  FOR EACH ROW BEGIN
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
    UPDATE IGNORE cloud_usage_stats SET numUsersCreated = numUsersCreated-1 WHERE idDataCenter = -1;
  END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'user_deleted', '2.0.3', '3:875783cf32349a58b2b57f473f1a06fa', 151);

-- Changeset src/2.0ga/triggers.xml::update_volume_management_update_stats::destevez::(Checksum: 3:6db070bc2c50a69e7252bc95baf96cd6)
DROP TRIGGER IF EXISTS update_volume_management_update_stats;

DELIMITER |
CREATE TRIGGER update_volume_management_update_stats AFTER UPDATE ON volume_management
    FOR EACH ROW BEGIN
        DECLARE idDataCenterObj INTEGER;
        DECLARE idVirtualAppObj INTEGER;
        DECLARE idVirtualDataCenterObj INTEGER;
        DECLARE idEnterpriseObj INTEGER;
        DECLARE reservedSize BIGINT;
        DECLARE incr INTEGER;
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN       
        SET incr = NEW.usedSize-OLD.usedSize;
        SELECT sd.idDataCenter INTO idDataCenterObj
        FROM storage_pool sp, storage_device sd
        WHERE OLD.idStorage = sp.idStorage
        AND sp.idStorageDevice = sd.id;
        --      
        SELECT vapp.idVirtualApp, vapp.idVirtualDataCenter INTO idVirtualAppObj, idVirtualDataCenterObj
        FROM rasd_management rasd, virtualapp vapp
        WHERE OLD.idManagement = rasd.idManagement
        AND rasd.idVirtualApp = vapp.idVirtualApp;
        --
        SELECT vdc.idEnterprise INTO idEnterpriseObj
        FROM virtualdatacenter vdc
        WHERE vdc.idVirtualDataCenter = idVirtualDataCenterObj;
        --
        SELECT r.limitResource INTO reservedSize
        FROM rasd_management rm, rasd r
        WHERE rm.idManagement = NEW.idManagement
        AND r.instanceID = rm.idResource;
        --
	-- INSERT INTO debug_msg (msg) VALUES (CONCAT('UpdateVol: ',IFNULL(idEnterpriseObj, 'idEnterpriseObj es NULL'), IFNULL(idVirtualDataCenterObj, 'idVirtualDataCenterObj es NULL'), IFNULL(idDataCenterObj, 'idDataCenterObj es NULL')));
	-- INSERT INTO debug_msg (msg) VALUES (CONCAT('UpdateVol: ',OLD.state, NEW.state, reservedSize));
	-- 
        IF NEW.state != OLD.state THEN
            IF NEW.state = 1 THEN 
                UPDATE IGNORE cloud_usage_stats SET storageUsed = storageUsed+reservedSize WHERE idDataCenter = idDataCenterObj;
		UPDATE IGNORE vapp_enterprise_stats SET volAttached = volAttached+1 WHERE idVirtualApp = idVirtualAppObj;
                UPDATE IGNORE enterprise_resources_stats 
                    SET     extStorageUsed = extStorageUsed +  reservedSize
                    WHERE idEnterprise = idEnterpriseObj;
                UPDATE IGNORE dc_enterprise_stats 
                    SET     extStorageUsed = extStorageUsed +  reservedSize
                    WHERE idDataCenter = idDataCenterObj AND idEnterprise = idEnterpriseObj;
                UPDATE IGNORE vdc_enterprise_stats 
                    SET     volAttached = volAttached + 1, extStorageUsed = extStorageUsed +  reservedSize
                WHERE idVirtualDataCenter = idVirtualDataCenterObj;
            END IF;     
	-- IF OLD.state = 1 ====> This is done in update_rasd_management_update_stats
        END IF;
    END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'update_volume_management_update_stats', '2.0.3', '3:6db070bc2c50a69e7252bc95baf96cd6', 152);

-- Changeset src/2.0ga/triggers.xml::update_rasd_management_update_stats::destevez::(Checksum: 3:08d5f873bfce3ea37a605eaf44e9386a)
DROP TRIGGER IF EXISTS update_rasd_management_update_stats;

DELIMITER |
CREATE TRIGGER update_rasd_management_update_stats AFTER UPDATE ON rasd_management
    FOR EACH ROW BEGIN
        DECLARE state VARCHAR(50) CHARACTER SET utf8;
        DECLARE idState INTEGER;
        DECLARE idImage INTEGER;
        DECLARE idDataCenterObj INTEGER;
        DECLARE idEnterpriseObj INTEGER;
        DECLARE reservedSize BIGINT;
        DECLARE ipAddress VARCHAR(20) CHARACTER SET utf8;
	DECLARE type INTEGER;
	DECLARE currentVMState VARCHAR(50);
	DECLARE extraHDSize BIGINT;
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN                                   
            --     
            IF OLD.idResourceType = 8 THEN
                -- vol Attached ?? -- is stateful
                SELECT IF(count(*) = 0, 0, vm.state), idImage INTO idState, idImage
                FROM volume_management vm
                WHERE vm.idManagement = OLD.idManagement;     
                --
		-- INSERT INTO debug_msg (msg) VALUES (CONCAT('UpdateRASD: ',idState,' - ', IFNULL(OLD.idVirtualApp, 'OLD.idVirtualApp es NULL'), IFNULL(NEW.idVirtualApp, 'NEW.idVirtualApp es NULL')));	
		-- Detectamos cambios de VDC: V2V
		IF OLD.idVirtualDataCenter IS NOT NULL AND NEW.idVirtualDataCenter IS NOT NULL AND OLD.idVirtualDataCenter != NEW.idVirtualDataCenter AND OLD.idVirtualApp = NEW.idVirtualApp THEN
			UPDATE IGNORE vdc_enterprise_stats SET volCreated = volCreated-1, volAssociated = volAssociated-1 WHERE idVirtualDataCenter = OLD.idVirtualDataCenter;
			UPDATE IGNORE vdc_enterprise_stats SET volCreated = volCreated+1, volAssociated = volAssociated+1 WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
			IF idState = 1 THEN
				UPDATE IGNORE vdc_enterprise_stats SET volAttached = volAttached-1 WHERE idVirtualDataCenter = OLD.idVirtualDataCenter;
				UPDATE IGNORE vdc_enterprise_stats SET volAttached = volAttached+1 WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
			END IF;
		ELSE 			
		        IF OLD.idVirtualDataCenter IS NOT NULL AND NEW.idVirtualDataCenter IS NOT NULL AND OLD.idVirtualDataCenter != NEW.idVirtualDataCenter THEN
				-- Volume was changed to another VDC not in a V2V operation (cold move)
		            UPDATE IGNORE vdc_enterprise_stats SET volCreated = volCreated+1 WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
			    UPDATE IGNORE vdc_enterprise_stats SET volCreated = volCreated-1 WHERE idVirtualDataCenter = OLD.idVirtualDataCenter;
			END IF;
			-- Volume added from a Vapp
			IF OLD.idVirtualApp IS NULL AND NEW.idVirtualApp IS NOT NULL THEN       
			    UPDATE IGNORE vapp_enterprise_stats SET volAssociated = volAssociated+1 WHERE idVirtualApp = NEW.idVirtualApp;      
			    UPDATE IGNORE vdc_enterprise_stats SET volAssociated = volAssociated+1 WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
			    IF idState = 1 THEN
			        UPDATE IGNORE vapp_enterprise_stats SET volAttached = volAttached+1 WHERE idVirtualApp = NEW.idVirtualApp;
			        UPDATE IGNORE vdc_enterprise_stats SET volAttached = volAttached+1 WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
			    END IF;                         
			END IF;
			-- Volume removed from a Vapp
			IF OLD.idVirtualApp IS NOT NULL AND NEW.idVirtualApp IS NULL THEN
			    UPDATE IGNORE vapp_enterprise_stats SET volAssociated = volAssociated-1 WHERE idVirtualApp = OLD.idVirtualApp;
			    UPDATE IGNORE vdc_enterprise_stats SET volAssociated = volAssociated-1 WHERE idVirtualDataCenter = OLD.idVirtualDataCenter;
		            UPDATE IGNORE vapp_enterprise_stats SET volAttached = volAttached-1 WHERE idVirtualApp = OLD.idVirtualApp;
			    IF idState = 1 THEN
				SELECT vdc.idEnterprise, vdc.idDataCenter INTO idEnterpriseObj, idDataCenterObj
				FROM virtualdatacenter vdc
				WHERE vdc.idVirtualDataCenter = OLD.idVirtualDataCenter;
				SELECT r.limitResource INTO reservedSize
				FROM rasd r
				WHERE r.instanceID = OLD.idResource;
				--  INSERT INTO debug_msg (msg) VALUES (CONCAT('Updating ExtStorage: ',idState,' - ', IFNULL(idDataCenterObj, 'idDataCenterObj es NULL'), IFNULL(idEnterpriseObj, 'idEnterpriseObj es NULL'), reservedSize));	
				UPDATE IGNORE cloud_usage_stats SET storageUsed = storageUsed-reservedSize WHERE idDataCenter = idDataCenterObj;			
				UPDATE IGNORE enterprise_resources_stats 
				    SET     extStorageUsed = extStorageUsed - reservedSize
				    WHERE idEnterprise = idEnterpriseObj;
				UPDATE IGNORE dc_enterprise_stats 
				    SET     extStorageUsed = extStorageUsed - reservedSize
				    WHERE idDataCenter = idDataCenterObj AND idEnterprise = idEnterpriseObj;
				UPDATE IGNORE vdc_enterprise_stats 
				    SET     volAttached = volAttached - 1, extStorageUsed = extStorageUsed - reservedSize
				WHERE idVirtualDataCenter = OLD.idVirtualDatacenter;
			    END IF;                 
			END IF;
			-- Volume added to VDC
			IF OLD.idVirtualDataCenter IS NULL AND NEW.idVirtualDataCenter IS NOT NULL THEN        
			    UPDATE IGNORE vdc_enterprise_stats SET volCreated = volCreated+1 WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
			    UPDATE IGNORE vdc_enterprise_stats SET volAssociated = volAssociated+1 WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
			    -- Stateful are always Attached 
			    IF idState = 1 THEN
			        UPDATE IGNORE vdc_enterprise_stats SET volAttached = volAttached+1 WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;                     
			    END IF;
			END IF;
			-- Volume removed from VDC
			IF OLD.idVirtualDataCenter IS NOT NULL AND NEW.idVirtualDataCenter IS NULL THEN                 
			    UPDATE IGNORE vdc_enterprise_stats SET volCreated = volCreated-1 WHERE idVirtualDataCenter = OLD.idVirtualDataCenter;   
			    UPDATE IGNORE vdc_enterprise_stats SET volAssociated = volAssociated-1 WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
			    -- Stateful are always Attached
			    IF idState = 1 THEN
			        UPDATE IGNORE vdc_enterprise_stats SET volAttached = volAttached-1 WHERE idVirtualDataCenter = OLD.idVirtualDataCenter;                     
			    END IF;
			END IF;                         
                END IF;
            END IF;
            -- From old autoDetachVolume
            -- UPDATE IGNORE volume_management v set v.state = 0
            -- WHERE v.idManagement = OLD.idManagement;
            -- Checks for used IPs
            IF OLD.idVM IS NULL AND NEW.idVM IS NOT NULL THEN
                -- Query for datacenter
                SELECT dc.idDataCenter INTO idDataCenterObj
                FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, datacenter dc
                WHERE ipm.vlan_network_id = vn.vlan_network_id
                AND vn.network_configuration_id = nc.network_configuration_id
                AND vn.network_id = dc.network_id
        	AND vn.networktype = 'PUBLIC'
                AND NEW.idManagement = ipm.idManagement;
                -- Datacenter found ---> PublicIPUsed
                IF idDataCenterObj IS NOT NULL THEN
                    -- Query for enterprise 
                    SELECT vdc.idEnterprise INTO idEnterpriseObj
                    FROM virtualdatacenter vdc
                    WHERE vdc.idVirtualDataCenter = NEW.idVirtualDataCenter;
                    -- 
                    -- UPDATE IGNORE cloud_usage_stats SET publicIPsUsed = publicIPsUsed + 1 WHERE idDataCenter = idDataCenterObj;
                    UPDATE IGNORE enterprise_resources_stats 
                        SET     publicIPsUsed = publicIPsUsed + 1
                        WHERE idEnterprise = idEnterpriseObj;
                    UPDATE IGNORE dc_enterprise_stats 
                        SET     publicIPsUsed = publicIPsUsed + 1
                        WHERE idDataCenter = idDataCenterObj AND idEnterprise = idEnterpriseObj;
                    UPDATE IGNORE vdc_enterprise_stats 
                        SET     publicIPsUsed = publicIPsUsed + 1
                    WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
                END IF;
		-- Added ExtraHD for Imported VM
		-- Query for datacenter
                SELECT vdc.idDataCenter, vdc.idEnterprise INTO idDataCenterObj, idEnterpriseObj
                FROM virtualdatacenter vdc
                WHERE vdc.idVirtualDatacenter = NEW.idVirtualDataCenter;
		SELECT vm.state, vm.idType INTO currentVMState, type
		FROM virtualmachine vm
		WHERE vm.idVM = NEW.idVM;
		SELECT IFNULL(r.limitResource,0) * 1048576 INTO extraHDSize
		FROM rasd r
		WHERE NEW.idResourceType=17 AND r.instanceID = NEW.idResource;
		-- INSERT INTO debug_msg (msg) VALUES (CONCAT('Added ExtraHDs UpdateRASDMana ', IFNULL(extraHDSize,'NULL'), ' for idVM ', IFNULL(NEW.idVM,'NULL'), ' with state ', IFNULL(currentVMState,'NULL'), ' type ', IFNULL(type,'NULL')));  
		IF extraHDSize IS NOT NULL  AND currentVMState = 'ON' THEN -- this is an imported machine
		UPDATE IGNORE enterprise_resources_stats 
                SET localStorageUsed = localStorageUsed + extraHDSize
                WHERE idEnterprise = idEnterpriseObj;
                UPDATE IGNORE dc_enterprise_stats 
                SET localStorageUsed = localStorageUsed + extraHDSize
                WHERE idEnterprise = idEnterpriseObj AND idDataCenter = idDataCenterObj;
                UPDATE IGNORE vdc_enterprise_stats 
                SET localStorageUsed = localStorageUsed + extraHDSize
                WHERE idVirtualDataCenter = NEW.idVirtualDataCenter; 
		-- INSERT INTO debug_msg (msg) VALUES (CONCAT('INSERTED ExtraHDs stats ', IFNULL(extraHDSize,'NULL'), ' for idEnterpriseObj ', IFNULL(idEnterpriseObj,'NULL'), ' with idDataCenterObj ', IFNULL(idDataCenterObj,'NULL'), ' and NEW.idVirtualDataCenter ', IFNULL(NEW.idVirtualDataCenter,'NULL')));	
		END IF;
            END IF;
            -- Checks for unused IPs
            IF OLD.idVM IS NOT NULL AND NEW.idVM IS NULL THEN
                -- Query for datacenter
                SELECT dc.idDataCenter INTO idDataCenterObj
                FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, datacenter dc
                WHERE ipm.vlan_network_id = vn.vlan_network_id
                AND vn.network_configuration_id = nc.network_configuration_id
                AND vn.network_id = dc.network_id
        AND vn.networktype = 'PUBLIC'
                AND NEW.idManagement = ipm.idManagement;
                -- Datacenter found ---> Not PublicIPUsed
                IF idDataCenterObj IS NOT NULL THEN
                    -- Query for enterprise 
                    SELECT vdc.idEnterprise INTO idEnterpriseObj
                    FROM virtualdatacenter vdc
                    WHERE vdc.idVirtualDataCenter = NEW.idVirtualDataCenter;
                    -- 
                    -- UPDATE IGNORE cloud_usage_stats SET publicIPsUsed = publicIPsUsed-1 WHERE idDataCenter = idDataCenterObj;
                    UPDATE IGNORE enterprise_resources_stats 
                        SET     publicIPsUsed = publicIPsUsed - 1
                        WHERE idEnterprise = idEnterpriseObj;
                    UPDATE IGNORE dc_enterprise_stats 
                        SET     publicIPsUsed = publicIPsUsed - 1
                        WHERE idDataCenter = idDataCenterObj AND idEnterprise = idEnterpriseObj;
                    UPDATE IGNORE vdc_enterprise_stats 
                        SET     publicIPsUsed = publicIPsUsed - 1
                    WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
                END IF;
            END IF;
            -- Checks for unreserved IPs
            IF OLD.idVirtualDataCenter IS NOT NULL AND NEW.idVirtualDataCenter IS NULL THEN
                -- Query for datacenter
                SELECT dc.idDataCenter, ipm.ip INTO idDataCenterObj, ipAddress
                FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, datacenter dc
                WHERE ipm.vlan_network_id = vn.vlan_network_id
                AND vn.network_configuration_id = nc.network_configuration_id
                AND vn.network_id = dc.network_id
        AND vn.networktype = 'PUBLIC'
                AND OLD.idManagement = ipm.idManagement;
                -- Datacenter found ---> Not PublicIPReserved
                IF idDataCenterObj IS NOT NULL THEN
                    UPDATE IGNORE cloud_usage_stats SET publicIPsUsed = publicIPsUsed-1 WHERE idDataCenter = idDataCenterObj;
                    -- Registers Accounting Event
                    SELECT vdc.idEnterprise INTO idEnterpriseObj
                    FROM virtualdatacenter vdc
                    WHERE vdc.idVirtualDataCenter = OLD.idVirtualDataCenter;                    
                    UPDATE IGNORE enterprise_resources_stats SET publicIPsReserved = publicIPsReserved-1 WHERE idEnterprise = idEnterpriseObj;
                    UPDATE IGNORE vdc_enterprise_stats SET publicIPsReserved = publicIPsReserved-1 WHERE idVirtualDataCenter = OLD.idVirtualDataCenter;
                    UPDATE IGNORE dc_enterprise_stats SET publicIPsReserved = publicIPsReserved-1 WHERE idDataCenter = idDataCenterObj;
                    IF EXISTS( SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingIPsRegisterEvents' ) THEN
                        CALL AccountingIPsRegisterEvents('IP_FREED',OLD.idManagement,ipAddress,OLD.idVirtualDataCenter, idEnterpriseObj);
                    END IF;                    
                END IF;
            END IF;
        END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'update_rasd_management_update_stats', '2.0.3', '3:08d5f873bfce3ea37a605eaf44e9386a', 153);

-- Changeset src/2.0ga/triggers.xml::update_rasd_update_stats::destevez::(Checksum: 3:e628beb6120851ed8d307e81f3058518)
DROP TRIGGER IF EXISTS update_rasd_update_stats;

DELIMITER |
CREATE TRIGGER update_rasd_update_stats AFTER UPDATE ON rasd
    FOR EACH ROW BEGIN
        DECLARE idDataCenterObj INTEGER;
        DECLARE idThisEnterprise INTEGER;
        DECLARE idThisVirtualDataCenter INTEGER;
        DECLARE isReserved INTEGER;
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN                                   
            --
            IF OLD.limitResource != NEW.limitResource THEN
                SELECT vdc.idDataCenter, vdc.idVirtualDataCenter, vdc.idEnterprise INTO idDataCenterObj, idThisVirtualDataCenter, idThisEnterprise
                FROM rasd_management rm, virtualdatacenter vdc
                WHERE rm.idResource = NEW.instanceID
                AND vdc.idVirtualDataCenter=rm.idVirtualDataCenter;
                -- check if this is reserved
                SELECT count(*) INTO isReserved
                FROM volume_management vm, rasd_management rm
                WHERE vm.idManagement  = rm.idManagement
                AND NEW.instanceID = rm.idResource
                AND (vm.state = 1 OR vm.state = 2);
                UPDATE IGNORE cloud_usage_stats SET storageTotal = storageTotal+ NEW.limitResource - OLD.limitResource WHERE idDataCenter = idDataCenterObj;                
                IF isReserved != 0 THEN
                -- si hay volAttached se debe actualizar el storageUsed
                    UPDATE IGNORE cloud_usage_stats SET storageUsed = storageUsed +  NEW.limitResource - OLD.limitResource WHERE idDataCenter = idDataCenterObj;                    
                    UPDATE IGNORE enterprise_resources_stats 
                    SET     extStorageUsed = extStorageUsed +  NEW.limitResource - OLD.limitResource 
                    WHERE idEnterprise = idThisEnterprise;
                    UPDATE IGNORE dc_enterprise_stats 
                    SET     extStorageUsed = extStorageUsed +  NEW.limitResource - OLD.limitResource 
                    WHERE idDataCenter = idDataCenterObj AND idEnterprise = idThisEnterprise;
                    UPDATE IGNORE vdc_enterprise_stats 
                    SET     volCreated = volCreated - 1,
                        extStorageUsed = extStorageUsed +  NEW.limitResource - OLD.limitResource 
                    WHERE idVirtualDataCenter = idThisVirtualDataCenter;
                END IF;        
                IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingStorageRegisterEvents' ) THEN
                    CALL AccountingStorageRegisterEvents('UPDATE_STORAGE', NEW.instanceID, NEW.elementName, 0, idThisVirtualDataCenter, idThisEnterprise, NEW.limitResource);
                END IF;
            END IF;
        END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'update_rasd_update_stats', '2.0.3', '3:e628beb6120851ed8d307e81f3058518', 154);

-- Changeset src/2.0ga/triggers.xml::create_ip_pool_management_update_stats::destevez::(Checksum: 3:1d97b3fafe9c0c1e9bb0bb2d8264330b)
DROP TRIGGER IF EXISTS create_ip_pool_management_update_stats;

DELIMITER |
CREATE TRIGGER create_ip_pool_management_update_stats AFTER INSERT ON ip_pool_management
  FOR EACH ROW BEGIN
    DECLARE idDataCenterObj INTEGER;
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
      SELECT dc.idDataCenter INTO idDataCenterObj
	FROM rasd_management rm, vlan_network vn, network_configuration nc, datacenter dc
	WHERE NEW.vlan_network_id = vn.vlan_network_id
	AND vn.networktype = 'PUBLIC'
	AND vn.network_configuration_id = nc.network_configuration_id
	AND dc.network_id = vn.network_id
	AND NEW.idManagement = rm.idManagement;
      IF idDataCenterObj IS NOT NULL THEN
	-- INSERT INTO debug_msg (msg) VALUES (CONCAT('create_ip_pool_management_update_stats +1 ', IFNULL(idDataCenterObj,'NULL')));
        UPDATE IGNORE cloud_usage_stats SET publicIPsTotal = publicIPsTotal+1 WHERE idDataCenter = idDataCenterObj;
      END IF;
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'create_ip_pool_management_update_stats', '2.0.3', '3:1d97b3fafe9c0c1e9bb0bb2d8264330b', 155);

-- Changeset src/2.0ga/triggers.xml::delete_ip_pool_management_update_stats::destevez::(Checksum: 3:a406f30381d7e73da783a34075152f44)
DROP TRIGGER IF EXISTS delete_ip_pool_management_update_stats;

DELIMITER |
CREATE TRIGGER delete_ip_pool_management_update_stats AFTER DELETE ON ip_pool_management
  FOR EACH ROW BEGIN
    DECLARE idDataCenterObj INTEGER;
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
      -- Query for Public Ips deleted (disabled)
      SELECT dc.idDataCenter INTO idDataCenterObj
	FROM rasd_management rm, vlan_network vn, network_configuration nc, datacenter dc
	WHERE OLD.vlan_network_id = vn.vlan_network_id
	AND vn.networktype = 'PUBLIC'
	AND vn.network_configuration_id = nc.network_configuration_id
	AND dc.network_id = vn.network_id
	AND OLD.idManagement = rm.idManagement;
      IF idDataCenterObj IS NOT NULL THEN
    -- detects IP disabled/enabled at Edit Public Ips
   	-- INSERT INTO debug_msg (msg) VALUES (CONCAT('delete_ip_pool_management_update_stats -1 ', IFNULL(idDataCenterObj,'NULL')));
        UPDATE IGNORE cloud_usage_stats SET publicIPsTotal = publicIPsTotal-1 WHERE idDataCenter = idDataCenterObj;
      END IF;
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'delete_ip_pool_management_update_stats', '2.0.3', '3:a406f30381d7e73da783a34075152f44', 156);

-- Changeset src/2.0ga/triggers.xml::create_vlan_network_update_stats::destevez::(Checksum: 3:c79a94e9399b3d273029fad4d7bc8432)
DROP TRIGGER IF EXISTS create_vlan_network_update_stats;

DELIMITER |
CREATE TRIGGER create_vlan_network_update_stats AFTER INSERT ON vlan_network
FOR EACH ROW BEGIN
    DECLARE idVirtualDataCenterObj INTEGER;
    DECLARE idDataCenterObj INTEGER;
    DECLARE idEnterpriseObj INTEGER;
    SELECT vdc.idVirtualDataCenter, e.idEnterprise INTO idVirtualDataCenterObj, idEnterpriseObj
    FROM virtualdatacenter vdc, enterprise e
    WHERE vdc.networktypeID=NEW.network_id
    AND vdc.idEnterprise=e.idEnterprise;
    -- Query for Datacenter
    SELECT dc.idDataCenter INTO idDataCenterObj
    FROM datacenter dc
    WHERE dc.network_id = NEW.network_id;
    -- INSERT INTO debug_msg (msg) VALUES (CONCAT('PROCEDURE AccountingVLANRegisterEvents Activated: ',IFNULL(NEW.vlan_network_id,'NULL'),'-',IFNULL(NEW.network_name,'NULL'),'-',IFNULL(idVirtualDataCenterObj,'NULL'),'-',idEnterpriseObj,'-','CREATE_VLAN','-',now()));
    IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVLANRegisterEvents' ) THEN
            CALL AccountingVLANRegisterEvents('CREATE_VLAN',NEW.vlan_network_id, NEW.network_name, idVirtualDataCenterObj,idEnterpriseObj);
        END IF;    
    -- Statistics
    UPDATE IGNORE cloud_usage_stats
        SET     vlanUsed = vlanUsed + 1
        WHERE idDataCenter = -1;
    UPDATE IGNORE enterprise_resources_stats 
        SET     vlanUsed = vlanUsed + 1
        WHERE idEnterprise = idEnterpriseObj;
    UPDATE IGNORE dc_enterprise_stats 
        SET     vlanUsed = vlanUsed + 1
        WHERE idDataCenter = idDataCenterObj AND idEnterprise = idEnterpriseObj;
    UPDATE IGNORE vdc_enterprise_stats 
        SET     vlanUsed = vlanUsed + 1
    WHERE idVirtualDataCenter = idVirtualDataCenterObj;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'create_vlan_network_update_stats', '2.0.3', '3:c79a94e9399b3d273029fad4d7bc8432', 157);

-- Changeset src/2.0ga/triggers.xml::delete_vlan_network_update_stats::destevez::(Checksum: 3:626e84bf949ec742c3ba79f5daadfdaa)
DROP TRIGGER IF EXISTS delete_vlan_network_update_stats;

DELIMITER |
CREATE TRIGGER delete_vlan_network_update_stats AFTER DELETE ON vlan_network
FOR EACH ROW
BEGIN
    DECLARE idVirtualDataCenterObj INTEGER;
    DECLARE idEnterpriseObj INTEGER;
    DECLARE idDataCenterObj INTEGER;
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   
            -- Query for Datacenter
            SELECT dc.idDataCenter INTO idDataCenterObj
            FROM datacenter dc
            WHERE dc.network_id = OLD.network_id;
            -- Deleted PublicIps are deteceted in network_configuration
            -- VLAN Accounting  
            SELECT vdc.idVirtualDataCenter, e.idEnterprise INTO idVirtualDataCenterObj, idEnterpriseObj
            FROM virtualdatacenter vdc, enterprise e
            WHERE vdc.networktypeID=OLD.network_id
            AND vdc.idEnterprise=e.idEnterprise;
            IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVLANRegisterEvents' ) THEN
                CALL AccountingVLANRegisterEvents('DELETE_VLAN',OLD.vlan_network_id, OLD.network_name, idVirtualDataCenterObj,idEnterpriseObj);
            END IF;
            -- Statistics
            UPDATE IGNORE cloud_usage_stats
                SET     vlanUsed = vlanUsed - 1
                WHERE idDataCenter = -1;
            UPDATE IGNORE enterprise_resources_stats 
                SET     vlanUsed = vlanUsed - 1
                WHERE idEnterprise = idEnterpriseObj;
            UPDATE IGNORE dc_enterprise_stats 
                SET     vlanUsed = vlanUsed - 1
                WHERE idDataCenter = idDataCenterObj AND idEnterprise = idEnterpriseObj;
            UPDATE IGNORE vdc_enterprise_stats 
                SET     vlanUsed = vlanUsed - 1
            WHERE idVirtualDataCenter = idVirtualDataCenterObj;
        END IF;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'delete_vlan_network_update_stats', '2.0.3', '3:626e84bf949ec742c3ba79f5daadfdaa', 158);

-- Changeset src/2.0ga/triggers.xml::update_ip_pool_management_update_stats::destevez::(Checksum: 3:9471ae96bcea8c0d126b5acc5f68db12)
DROP TRIGGER IF EXISTS update_ip_pool_management_update_stats;

DELIMITER |
CREATE TRIGGER update_ip_pool_management_update_stats AFTER UPDATE ON ip_pool_management
    FOR EACH ROW BEGIN
        DECLARE idDataCenterObj INTEGER;
        DECLARE idVirtualDataCenterObj INTEGER;
        DECLARE idEnterpriseObj INTEGER;
	   DECLARE networkTypeObj VARCHAR(15);
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   
		SELECT vn.networktype, dc.idDataCenter INTO networkTypeObj, idDataCenterObj
		FROM vlan_network vn, datacenter dc
		WHERE dc.network_id = vn.network_id
		AND OLD.vlan_network_id = vn.vlan_network_id;
		-- INSERT INTO debug_msg (msg) VALUES (CONCAT('update_ip_pool_management_update_stats', '-', OLD.ip, '-',OLD.available,'-', NEW.available,'-', IFNULL(networkTypeObj,'NULL'), '-', IFNULL(idDataCenterObj,'NULL')));
		IF networkTypeObj = 'PUBLIC' THEN		
			IF OLD.available=FALSE AND NEW.available=TRUE THEN
				UPDATE IGNORE cloud_usage_stats SET publicIPsTotal = publicIPsTotal+1 WHERE idDataCenter = idDataCenterObj;
			END IF;
			IF OLD.available=TRUE AND NEW.available=FALSE THEN
				UPDATE IGNORE cloud_usage_stats SET publicIPsTotal = publicIPsTotal-1 WHERE idDataCenter = idDataCenterObj;
			END IF;
		END IF;
	    -- Checks for public available 
            -- Checks for reserved IPs		
            IF OLD.mac IS NULL AND NEW.mac IS NOT NULL THEN
                -- Query for datacenter
                SELECT vdc.idDataCenter, vdc.idVirtualDataCenter, vdc.idEnterprise  INTO idDataCenterObj, idVirtualDataCenterObj, idEnterpriseObj
                FROM rasd_management rm, virtualdatacenter vdc, vlan_network vn
                WHERE vdc.idVirtualDataCenter = rm.idVirtualDataCenter
			AND NEW.vlan_network_id = vn.vlan_network_id
			AND vn.networktype = 'PUBLIC'
			AND NEW.idManagement = rm.idManagement;
                -- New Public IP assignment for a VDC ---> Reserved
                UPDATE IGNORE cloud_usage_stats SET publicIPsUsed = publicIPsUsed+1 WHERE idDataCenter = idDataCenterObj;
                UPDATE IGNORE enterprise_resources_stats SET publicIPsReserved = publicIPsReserved+1 WHERE idEnterprise = idEnterpriseObj;
                UPDATE IGNORE vdc_enterprise_stats SET publicIPsReserved = publicIPsReserved+1 WHERE idVirtualDataCenter = idVirtualDataCenterObj;
                UPDATE IGNORE dc_enterprise_stats SET publicIPsReserved = publicIPsReserved+1 WHERE idDataCenter = idDataCenterObj;
                IF (idDataCenterObj IS NOT NULL AND idVirtualDataCenterObj IS NOT NULL AND idEnterpriseObj IS NOT NULL) THEN
                	-- INSERT INTO debug_msg (msg) VALUES (CONCAT('Reserved IP: ',IFNULL(idEnterpriseObj,'entnull'),IFNULL(idDataCenterObj,'dcnull'),IFNULL(idVirtualDataCenterObj,'vdcnull')));
                	IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingIPsRegisterEvents' ) THEN
                    	CALL AccountingIPsRegisterEvents('IP_RESERVED',NEW.idManagement,NEW.ip,idVirtualDataCenterObj, idEnterpriseObj);
                	END IF;
                END IF;
            END IF;
        END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'update_ip_pool_management_update_stats', '2.0.3', '3:9471ae96bcea8c0d126b5acc5f68db12', 159);

-- Changeset src/2.0ga/triggers.xml::dclimit_created::destevez::(Checksum: 3:bd480e1b74b09bfd09196b9a7e0201c3)
DROP TRIGGER IF EXISTS dclimit_created;

DELIMITER |
CREATE TRIGGER dclimit_created AFTER INSERT ON enterprise_limits_by_datacenter
    FOR EACH ROW BEGIN      
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN                   
        		 IF (NEW.idEnterprise != 0 AND NEW.idDataCenter != 0) THEN
        INSERT IGNORE INTO dc_enterprise_stats 
                (idDataCenter,idEnterprise,vCpuReserved,vCpuUsed,memoryReserved,memoryUsed,localStorageReserved,localStorageUsed,
                extStorageReserved,extStorageUsed,repositoryReserved,repositoryUsed,publicIPsReserved,publicIPsUsed,vlanReserved,vlanUsed)
            VALUES 
                (NEW.idDataCenter, NEW.idEnterprise, NEW.cpuHard, 0, NEW.ramHard, 0, NEW.hdHard, 0,
                NEW.storageHard, 0, NEW.repositoryHard, 0, NEW.publicIPHard, 0, NEW.vlanHard, 0);
                END IF;
            -- cloud_usage_stats
            UPDATE IGNORE cloud_usage_stats 
                SET vCpuReserved = vCpuReserved + NEW.cpuHard,
                    vMemoryReserved = vMemoryReserved + NEW.ramHard,
                    vStorageReserved = vStorageReserved + NEW.hdHard,
                    storageReserved = storageReserved + NEW.storageHard,
                    publicIPsReserved = publicIPsReserved + NEW.publicIPHard,
                    vlanReserved = vlanReserved + NEW.vlanHard
                WHERE idDataCenter = NEW.idDataCenter;
        END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'dclimit_created', '2.0.3', '3:bd480e1b74b09bfd09196b9a7e0201c3', 160);

-- Changeset src/2.0ga/triggers.xml::dclimit_updated::destevez::(Checksum: 3:54fe5ef168bb3ca1ea0b8cd51e21ad7b)
DROP TRIGGER IF EXISTS dclimit_updated;

DELIMITER |
CREATE TRIGGER dclimit_updated AFTER UPDATE ON enterprise_limits_by_datacenter
FOR EACH ROW BEGIN     
	 IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN       
                -- Limit is not used anymore. Statistics are removed
                DELETE FROM dc_enterprise_stats WHERE idEnterprise = OLD.idEnterprise AND idDataCenter = OLD.idDataCenter;
                IF (NEW.idEnterprise != 0 AND NEW.idDataCenter != 0) THEN
                INSERT IGNORE INTO dc_enterprise_stats 
	                (idDataCenter,idEnterprise,vCpuReserved,vCpuUsed,memoryReserved,memoryUsed,localStorageReserved,localStorageUsed,
	                extStorageReserved,extStorageUsed,repositoryReserved,repositoryUsed,publicIPsReserved,publicIPsUsed,vlanReserved,vlanUsed)
	            	VALUES 
	                (NEW.idDataCenter, NEW.idEnterprise, NEW.cpuHard, 0, NEW.ramHard, 0, NEW.hdHard, 0,
	                NEW.storageHard, 0, NEW.repositoryHard, 0, NEW.publicIPHard, 0, NEW.vlanHard, 0);       
                END IF;
		-- 
                UPDATE IGNORE cloud_usage_stats 
                SET vCpuReserved = vCpuReserved - OLD.cpuHard + NEW.cpuHard,
                    vMemoryReserved = vMemoryReserved - OLD.ramHard + NEW.ramHard,
                    vStorageReserved = vStorageReserved - OLD.hdHard + NEW.hdHard,
                    storageReserved = storageReserved - OLD.storageHard + NEW.storageHard,
                    publicIPsReserved = publicIPsReserved - OLD.publicIPHard + NEW.publicIPHard,
                    vlanReserved = vlanReserved - OLD.vlanHard + NEW.vlanHard
                WHERE idDataCenter = NEW.idDataCenter;                            
        END IF;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'dclimit_updated', '2.0.3', '3:54fe5ef168bb3ca1ea0b8cd51e21ad7b', 161);

-- Changeset src/2.0ga/triggers.xml::dclimit_deleted::destevez::(Checksum: 3:e2b75fd2424213fccd78d3cee11addf2)
DROP TRIGGER IF EXISTS dclimit_deleted;

DELIMITER |
CREATE TRIGGER dclimit_deleted AFTER DELETE ON enterprise_limits_by_datacenter
    FOR EACH ROW BEGIN
        DELETE FROM dc_enterprise_stats WHERE idEnterprise = OLD.idEnterprise AND idDataCenter = OLD.idDataCenter;
        UPDATE IGNORE cloud_usage_stats 
        SET vCpuReserved = vCpuReserved - OLD.cpuHard,
            vMemoryReserved = vMemoryReserved - OLD.ramHard,
            vStorageReserved = vStorageReserved - OLD.hdHard,
            storageReserved = storageReserved - OLD.storageHard,
            -- repositoryReserved = repositoryReserved - OLD.repositoryHard + NEW.repositoryHard,
            publicIPsReserved = publicIPsReserved - OLD.publicIPHard,
            vlanReserved = vlanReserved - OLD.vlanHard
        WHERE idDataCenter = OLD.idDataCenter;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'dclimit_deleted', '2.0.3', '3:e2b75fd2424213fccd78d3cee11addf2', 162);

-- Changeset src/2.0ga/triggers.xml::update_datastore_update_stats::destevez::(Checksum: 3:b4a052860fe390ae67e5e5f417c66d7d)
DROP TRIGGER IF EXISTS update_datastore_update_stats;

DELIMITER |
CREATE TRIGGER update_datastore_update_stats AFTER UPDATE ON datastore
    FOR EACH ROW BEGIN
	DECLARE idDatacenter INT UNSIGNED;
	DECLARE machineState INT UNSIGNED;
	SELECT pm.idDatacenter, pm.idState INTO idDatacenter, machineState FROM physicalmachine pm LEFT OUTER JOIN datastore_assignment da ON pm.idPhysicalMachine = da.idPhysicalMachine
	WHERE da.idDatastore = NEW.idDatastore;
	IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
            IF (SELECT count(*) FROM datastore d LEFT OUTER JOIN datastore_assignment da ON d.idDatastore = da.idDatastore
                LEFT OUTER JOIN physicalmachine pm ON da.idPhysicalMachine = pm.idPhysicalMachine
                WHERE pm.idDatacenter = idDatacenter AND d.datastoreUUID = NEW.datastoreUUID AND d.idDatastore != NEW.idDatastore 
                AND d.enabled = 1) = 0 THEN
	        IF OLD.enabled = 1 THEN
		    IF NEW.enabled = 1 THEN
		        IF machineState IN (2, 6, 7) THEN
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal - OLD.size + NEW.size
		            WHERE cus.idDatacenter = idDatacenter;
		        ELSE
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal - OLD.size + NEW.size,
		            cus.vStorageUsed = cus.vStorageUsed - OLD.usedSize + NEW.usedSize WHERE cus.idDatacenter = idDatacenter;
		        END IF;
	            ELSEIF NEW.enabled = 0 THEN
		        IF machineState IN (2, 6, 7) THEN
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal - OLD.size
		            WHERE cus.idDatacenter = idDatacenter;
		        ELSE
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal - OLD.size,
		            cus.vStorageUsed = cus.vStorageUsed - OLD.usedSize WHERE cus.idDatacenter = idDatacenter;
		        END IF;
		    END IF;
	        ELSE
		    IF NEW.enabled = 1 THEN
		        IF machineState IN (2, 6, 7) THEN
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal + NEW.size
		            WHERE cus.idDatacenter = idDatacenter;
		        ELSE
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal + NEW.size,
		            cus.vStorageUsed = cus.vStorageUsed + NEW.usedSize WHERE cus.idDatacenter = idDatacenter;
		        END IF;
		    END IF;
	        END IF;
            ELSEIF NEW.usedSize NOT IN (SELECT d.usedSize FROM datastore d LEFT OUTER JOIN datastore_assignment da ON d.idDatastore = da.idDatastore
                LEFT OUTER JOIN physicalmachine pm ON da.idPhysicalMachine = pm.idPhysicalMachine
                WHERE pm.idDatacenter = idDatacenter AND d.datastoreUUID = NEW.datastoreUUID AND d.idDatastore != NEW.idDatastore 
                AND d.enabled = 1) THEN
                -- repeated code to update only the first shared datastore
	        IF OLD.enabled = 1 THEN
		    IF NEW.enabled = 1 THEN
		        IF machineState IN (2, 6, 7) THEN
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal - OLD.size + NEW.size
		            WHERE cus.idDatacenter = idDatacenter;
		        ELSE
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal - OLD.size + NEW.size,
		            cus.vStorageUsed = cus.vStorageUsed - OLD.usedSize + NEW.usedSize WHERE cus.idDatacenter = idDatacenter;
		        END IF;
	            ELSEIF NEW.enabled = 0 THEN
		        IF machineState IN (2, 6, 7) THEN
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal - OLD.size
		            WHERE cus.idDatacenter = idDatacenter;
		        ELSE
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal - OLD.size,
		            cus.vStorageUsed = cus.vStorageUsed - OLD.usedSize WHERE cus.idDatacenter = idDatacenter;
		        END IF;
		    END IF;
	        ELSE
		    IF NEW.enabled = 1 THEN
		        IF machineState IN (2, 6, 7) THEN
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal + NEW.size
		            WHERE cus.idDatacenter = idDatacenter;
		        ELSE
		            UPDATE IGNORE cloud_usage_stats cus SET cus.vStorageTotal = cus.vStorageTotal + NEW.size,
		            cus.vStorageUsed = cus.vStorageUsed + NEW.usedSize WHERE cus.idDatacenter = idDatacenter;
		        END IF;
		    END IF;
	        END IF;
	    END IF;
        END IF;
    END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'update_datastore_update_stats', '2.0.3', '3:b4a052860fe390ae67e5e5f417c66d7d', 163);

-- Changeset src/2.0ga/triggers.xml::cloud_usage_stats_negative_check::destevez::(Checksum: 3:9136f0051231a451110c49ef7d9ecb6b)
DROP TRIGGER IF EXISTS cloud_usage_stats_negative_check;

DELIMITER |
CREATE TRIGGER cloud_usage_stats_negative_check BEFORE UPDATE ON cloud_usage_stats
  FOR EACH ROW BEGIN
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
      IF (NEW.serversTotal > 16700000)  THEN SET NEW.serversTotal = 0; END IF;
      IF (NEW.serversRunning > 16700000)  THEN SET NEW.serversRunning = 0; END IF;
      IF (NEW.storageTotal > 18446000000000000000)  THEN SET NEW.storageTotal = 0; END IF;
      IF (NEW.storageReserved > 18446000000000000000) THEN SET NEW.storageReserved = 0; END IF;
      IF (NEW.storageUsed > 18446000000000000000)  THEN SET NEW.storageUsed = 0; END IF;
      IF (NEW.publicIPsTotal > 16700000)  THEN SET NEW.publicIPsTotal = 0; END IF;
      IF (NEW.publicIPsReserved > 16700000)  THEN SET NEW.publicIPsReserved = 0; END IF;
      IF (NEW.publicIPsUsed > 16700000)  THEN SET NEW.publicIPsUsed = 0; END IF;
      IF (NEW.vMachinesTotal > 16700000)  THEN SET NEW.vMachinesTotal = 0; END IF;
      IF (NEW.vMachinesRunning > 16700000)  THEN SET NEW.vMachinesRunning = 0; END IF;
      IF (NEW.vCpuTotal > 18446000000000000000)  THEN SET NEW.vCpuTotal = 0; END IF;
      IF (NEW.vCpuReserved > 18446000000000000000)  THEN SET NEW.vCpuReserved = 0; END IF;
      IF (NEW.vCpuUsed > 18446000000000000000)  THEN SET NEW.vCpuUsed = 0; END IF;
      IF (NEW.vMemoryTotal > 18446000000000000000)  THEN SET NEW.vMemoryTotal = 0; END IF;
      IF (NEW.vMemoryReserved > 18446000000000000000)  THEN SET NEW.vMemoryReserved = 0; END IF;
      IF (NEW.vMemoryUsed > 18446000000000000000)  THEN SET NEW.vMemoryUsed = 0; END IF;
      IF (NEW.vStorageTotal > 18446000000000000000)  THEN SET NEW.vStorageTotal = 0; END IF;
      IF (NEW.vStorageReserved > 18446000000000000000)  THEN SET NEW.vStorageReserved = 0; END IF;
      IF (NEW.vStorageUsed > 18446000000000000000)  THEN SET NEW.vStorageUsed = 0; END IF;
      IF (NEW.numUsersCreated > 16700000)  THEN SET NEW.numUsersCreated = 0; END IF;
      IF (NEW.numVDCCreated > 16700000)  THEN SET NEW.numVDCCreated = 0; END IF;
      IF (NEW.numEnterprisesCreated > 16700000)  THEN SET NEW.numEnterprisesCreated = 0; END IF;
      IF (NEW.vlanReserved > 16700000)  THEN SET NEW.vlanReserved = 0; END IF;
      IF (NEW.vlanUsed > 16700000)  THEN SET NEW.vlanUsed = 0; END IF;
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'cloud_usage_stats_negative_check', '2.0.3', '3:9136f0051231a451110c49ef7d9ecb6b', 164);

-- Changeset src/2.0ga/triggers.xml::enterprise_resources_stats_negative_check::destevez::(Checksum: 3:467f7eaf413b94462eaf534bbc669254)
DROP TRIGGER IF EXISTS enterprise_resources_stats_negative_check;

DELIMITER |
CREATE TRIGGER enterprise_resources_stats_negative_check BEFORE UPDATE ON enterprise_resources_stats
  FOR EACH ROW BEGIN
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
      IF (NEW.vCpuReserved > 18446000000000000000)  THEN SET NEW.vCpuReserved = 0; END IF;
      IF (NEW.vCpuUsed > 18446000000000000000)  THEN SET NEW.vCpuUsed = 0; END IF;
      IF (NEW.memoryReserved > 18446000000000000000)  THEN SET NEW.memoryReserved = 0; END IF;
      IF (NEW.memoryUsed > 18446000000000000000)  THEN SET NEW.memoryUsed = 0; END IF;
      IF (NEW.localStorageReserved > 18446000000000000000)  THEN SET NEW.localStorageReserved = 0; END IF;
      IF (NEW.localStorageUsed > 18446000000000000000)  THEN SET NEW.localStorageUsed = 0; END IF;
      IF (NEW.extStorageReserved > 18446000000000000000)  THEN SET NEW.extStorageReserved = 0; END IF;
      IF (NEW.extStorageUsed > 18446000000000000000)  THEN SET NEW.extStorageUsed = 0; END IF;
      IF (NEW.repositoryReserved > 18446000000000000000)  THEN SET NEW.repositoryReserved = 0; END IF;
      IF (NEW.repositoryUsed > 18446000000000000000)  THEN SET NEW.repositoryUsed = 0; END IF;
      IF (NEW.publicIPsReserved > 16700000)  THEN SET NEW.publicIPsReserved = 0; END IF;
      IF (NEW.publicIPsUsed > 16700000)  THEN SET NEW.publicIPsUsed = 0; END IF;
      IF (NEW.vlanReserved > 16700000)  THEN SET NEW.vlanReserved = 0; END IF;
      IF (NEW.vlanUsed > 16700000)  THEN SET NEW.vlanUsed = 0; END IF;
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'enterprise_resources_stats_negative_check', '2.0.3', '3:467f7eaf413b94462eaf534bbc669254', 165);

-- Changeset src/2.0ga/triggers.xml::dc_enterprise_stats_negative_check::destevez::(Checksum: 3:08b5d80293b1c07bd757f6903012b153)
DROP TRIGGER IF EXISTS dc_enterprise_stats_negative_check;

DELIMITER |
CREATE TRIGGER dc_enterprise_stats_negative_check BEFORE UPDATE ON dc_enterprise_stats
  FOR EACH ROW BEGIN
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
      IF (NEW.vCpuReserved > 18446000000000000000)  THEN SET NEW.vCpuReserved = 0; END IF;
      IF (NEW.vCpuUsed > 18446000000000000000)  THEN SET NEW.vCpuUsed = 0; END IF;
      IF (NEW.memoryReserved > 18446000000000000000)  THEN SET NEW.memoryReserved = 0; END IF;
      IF (NEW.memoryUsed > 18446000000000000000)  THEN SET NEW.memoryUsed = 0; END IF;
      IF (NEW.localStorageReserved > 18446000000000000000)  THEN SET NEW.localStorageReserved = 0; END IF;
      IF (NEW.localStorageUsed > 18446000000000000000)  THEN SET NEW.localStorageUsed = 0; END IF;
      IF (NEW.extStorageReserved > 18446000000000000000)  THEN SET NEW.extStorageReserved = 0; END IF;
      IF (NEW.extStorageUsed > 18446000000000000000)  THEN SET NEW.extStorageUsed = 0; END IF;
      IF (NEW.repositoryReserved > 18446000000000000000)  THEN SET NEW.repositoryReserved = 0; END IF;
      IF (NEW.repositoryUsed > 18446000000000000000)  THEN SET NEW.repositoryUsed = 0; END IF;
      IF (NEW.publicIPsReserved > 16700000)  THEN SET NEW.publicIPsReserved = 0; END IF;
      IF (NEW.publicIPsUsed > 16700000)  THEN SET NEW.publicIPsUsed = 0; END IF;
      IF (NEW.vlanReserved > 16700000)  THEN SET NEW.vlanReserved = 0; END IF;
      IF (NEW.vlanUsed > 16700000)  THEN SET NEW.vlanUsed = 0; END IF;
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'dc_enterprise_stats_negative_check', '2.0.3', '3:08b5d80293b1c07bd757f6903012b153', 166);

-- Changeset src/2.0ga/triggers.xml::vapp_enterprise_stats_negative_check::destevez::(Checksum: 3:970b243fa7dcd29428979925fd14efc6)
DROP TRIGGER IF EXISTS vapp_enterprise_stats_negative_check;

DELIMITER |
CREATE TRIGGER vapp_enterprise_stats_negative_check BEFORE UPDATE ON vapp_enterprise_stats
  FOR EACH ROW BEGIN
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
      IF (NEW.vmCreated > 16700000)  THEN SET NEW.vmCreated = 0; END IF;
      IF (NEW.vmActive > 16700000)  THEN SET NEW.vmActive = 0; END IF;
      IF (NEW.volAssociated > 16700000)  THEN SET NEW.volAssociated = 0; END IF;
      IF (NEW.volAttached > 16700000)  THEN SET NEW.volAttached = 0; END IF;
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'vapp_enterprise_stats_negative_check', '2.0.3', '3:970b243fa7dcd29428979925fd14efc6', 167);

-- Changeset src/2.0ga/triggers.xml::vdc_enterprise_stats_negative_check::destevez::(Checksum: 3:51ce50b5d69f33dbe62064ee7e60ec83)
DROP TRIGGER IF EXISTS vdc_enterprise_stats_negative_check;

DELIMITER |
CREATE TRIGGER vdc_enterprise_stats_negative_check BEFORE UPDATE ON vdc_enterprise_stats
  FOR EACH ROW BEGIN
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
      IF (NEW.vmCreated > 16700000)  THEN SET NEW.vmCreated = 0; END IF;
      IF (NEW.vmActive > 16700000)  THEN SET NEW.vmActive = 0; END IF;
      IF (NEW.volCreated > 16700000)  THEN SET NEW.volCreated = 0; END IF;
      IF (NEW.volAssociated > 16700000)  THEN SET NEW.volAssociated = 0; END IF;
      IF (NEW.volAttached > 16700000)  THEN SET NEW.volAttached = 0; END IF;
      IF (NEW.vCpuReserved > 18446000000000000000)  THEN SET NEW.vCpuReserved = 0; END IF;
      IF (NEW.vCpuUsed > 18446000000000000000)  THEN SET NEW.vCpuUsed = 0; END IF;
      IF (NEW.memoryReserved > 18446000000000000000)  THEN SET NEW.memoryReserved = 0; END IF;
      IF (NEW.memoryUsed > 18446000000000000000)  THEN SET NEW.memoryUsed = 0; END IF;
      IF (NEW.localStorageReserved > 18446000000000000000)  THEN SET NEW.localStorageReserved = 0; END IF;
      IF (NEW.localStorageUsed > 18446000000000000000)  THEN SET NEW.localStorageUsed = 0; END IF;                                 
      IF (NEW.extStorageReserved > 18446000000000000000)  THEN SET NEW.extStorageReserved = 0; END IF;
      IF (NEW.extStorageUsed > 18446000000000000000)  THEN SET NEW.extStorageUsed = 0; END IF;
      IF (NEW.publicIPsReserved > 16700000)  THEN SET NEW.publicIPsReserved = 0; END IF;
      IF (NEW.publicIPsUsed > 16700000)  THEN SET NEW.publicIPsUsed = 0; END IF;
      IF (NEW.vlanReserved > 16700000)  THEN SET NEW.vlanReserved = 0; END IF;
      IF (NEW.vlanUsed > 16700000)  THEN SET NEW.vlanUsed = 0; END IF;
    END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/triggers.xml', 'vdc_enterprise_stats_negative_check', '2.0.3', '3:51ce50b5d69f33dbe62064ee7e60ec83', 168);

-- Changeset src/2.0ga/procedures.xml::calculate_cloud_usage_stats::destevez::(Checksum: 3:671d82a809e1fb9d7922843013e67c1c)
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

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/procedures.xml', 'calculate_cloud_usage_stats', '2.0.3', '3:671d82a809e1fb9d7922843013e67c1c', 169);

-- Changeset src/2.0ga/procedures.xml::CalculateEnterpriseResourcesStats::destevez::(Checksum: 3:ce0db9bbe48b0e59292c3aa7ef1aae7a)
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
    WHERE vm.state IN ("ON","OFF","PAUSED")
    AND vm.idType = 1
    AND vm.idEnterprise = idEnterpriseObj;
    --
    SELECT IFNULL(SUM(limitResource),0) * 1048576  INTO extraHDUsed
	FROM rasd_management rm, rasd r, virtualmachine vm 
	WHERE rm.idResource = r.instanceID AND rm.idVM = vm.idVM AND rm.idResourceType=17
	AND vm.state IN ("ON","OFF","PAUSED")
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

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/procedures.xml', 'CalculateEnterpriseResourcesStats', '2.0.3', '3:ce0db9bbe48b0e59292c3aa7ef1aae7a', 170);

-- Changeset src/2.0ga/procedures.xml::CalculateVdcEnterpriseStats::destevez::(Checksum: 3:be509954d54d99afb53946f5dcb9a2a6)
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

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/procedures.xml', 'CalculateVdcEnterpriseStats', '2.0.3', '3:be509954d54d99afb53946f5dcb9a2a6', 171);

-- Changeset src/2.0ga/procedures.xml::CalculateVappEnterpriseStats::destevez::(Checksum: 3:937ed6beb842fc18972923d172ed79ab)
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

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/procedures.xml', 'CalculateVappEnterpriseStats', '2.0.3', '3:937ed6beb842fc18972923d172ed79ab', 172);

-- Changeset src/2.0ga/procedures.xml::get_datastore_size_by_dc::destevez::(Checksum: 3:56f165bb9a3b9e122a24bdfa33793533)
DROP PROCEDURE IF EXISTS get_datastore_size_by_dc;

DELIMITER |
CREATE PROCEDURE get_datastore_size_by_dc(IN idDC INT, OUT size BIGINT UNSIGNED)
BEGIN
    SELECT IF (SUM(ds_view.size) IS NULL,0,SUM(ds_view.size)) INTO size
    FROM (SELECT d.size as size FROM datastore d LEFT OUTER JOIN datastore_assignment da ON d.idDatastore = da.idDatastore 
    LEFT OUTER JOIN physicalmachine pm ON da.idPhysicalMachine = pm.idPhysicalMachine
    WHERE pm.idDataCenter = idDC AND d.enabled = 1 GROUP BY d.datastoreUuid) ds_view;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/procedures.xml', 'get_datastore_size_by_dc', '2.0.3', '3:56f165bb9a3b9e122a24bdfa33793533', 173);

-- Changeset src/2.0ga/procedures.xml::get_datastore_used_size_by_dc::destevez::(Checksum: 3:70b261691f20459c61cde2182940c814)
DROP PROCEDURE IF EXISTS get_datastore_used_size_by_dc;

DELIMITER |
CREATE PROCEDURE get_datastore_used_size_by_dc(IN idDC INT, OUT usedSize BIGINT UNSIGNED)
BEGIN
    SELECT IF (SUM(ds_view.usedSize) IS NULL,0,SUM(ds_view.usedSize)) INTO usedSize
    FROM (SELECT d.usedSize as usedSize FROM datastore d LEFT OUTER JOIN datastore_assignment da ON d.idDatastore = da.idDatastore
    LEFT OUTER JOIN physicalmachine pm ON da.idPhysicalMachine = pm.idPhysicalMachine
    WHERE pm.idDataCenter = idDC AND d.enabled = 1 GROUP BY d.datastoreUuid) ds_view;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/procedures.xml', 'get_datastore_used_size_by_dc', '2.0.3', '3:70b261691f20459c61cde2182940c814', 174);

-- Changeset src/2.0ga/procedures.xml::add_version_column_to_all::destevez::(Checksum: 3:28232591f7d936ca502b7f812c0eadd8)
DROP PROCEDURE IF EXISTS add_version_column_to_all;

DELIMITER |
CREATE PROCEDURE add_version_column_to_all()
BEGIN
    DECLARE currentTableName VARCHAR(64);
    DECLARE no_more_tables INTEGER;
    DECLARE curAllTables CURSOR FOR SELECT TABLE_NAME from information_schema.TABLES where TABLE_SCHEMA = "kinton" AND TABLE_TYPE="BASE TABLE";
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_tables=1;
    SET no_more_tables = 0;
    OPEN curAllTables;  
    dept_loop:WHILE(no_more_tables = 0) DO
        FETCH curAllTables INTO currentTableName;
        IF no_more_tables = 1 THEN
           LEAVE dept_loop;
        END IF;
        IF NOT EXISTS( (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA= "kinton" AND TABLE_NAME=currentTableName AND COLUMN_NAME='version_c') ) THEN
            SET @alter_sql=CONCAT('ALTER IGNORE TABLE ', currentTableName,' ADD COLUMN version_c int default 0;');
            PREPARE stmt from @alter_sql;
            EXECUTE stmt;
        END IF;
    END WHILE dept_loop;
    CLOSE curAllTables;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/procedures.xml', 'add_version_column_to_all', '2.0.3', '3:28232591f7d936ca502b7f812c0eadd8', 175);

-- Changeset src/2.0ga/procedures.xml::AccountingVMRegisterEvents::destevez::(Checksum: 3:9c6058842d972f202cec4f0eafacb4ac)
DROP PROCEDURE IF EXISTS AccountingVMRegisterEvents;

-- 
-- AccountingVMRegisterEvents: Registers Events related to DEPLOY or UNDEPLOY virtualmachines for Accounting
-- Inserts new rows with startTime=NOW() for each new DEPLOY_VM event
-- Updates existing rows with stopTime=NOW() for each new UNDEPLOY_VM event
-- 
DELIMITER |
CREATE PROCEDURE AccountingVMRegisterEvents(
    IN idVirtualMachine INT(10) UNSIGNED, 
    IN idType INT(1) UNSIGNED, 
    IN oldState VARCHAR(50), 
    IN newState VARCHAR(50), 
    IN previousState VARCHAR(50), 
    IN ramValue INT(7) unsigned,  
    IN cpuValue INT(10) unsigned,
    IN hdValue BIGINT(20) unsigned,
    IN costCode int(4))
BEGIN
    DECLARE idDummy BIGINT; # Dummy variable to stop result set generation

	-- INSERT INTO debug_msg (msg) VALUES (CONCAT('newState: ',newState, 'previousState', previousState));
    IF idType = 1 AND (oldState != newState) THEN
    	-- We state changes only deal with captured or Abiquo generated VMs
		IF previousState = "NOT_ALLOCATED" AND newState = "ON" THEN
            -- Save away the appropriate names to ensure they are available when we add rows to the ..._detail table
            SELECT  kinton_accounting.ABQ_ADD_ENT_NAME(e.idEnterprise, e.name), kinton_accounting.ABQ_ADD_VDC_NAME(vdc.idVirtualDataCenter, vdc.name),
                    kinton_accounting.ABQ_ADD_VAPP_NAME(vapp.idVirtualApp, vapp.name),
                    kinton_accounting.ABQ_ADD_VM_NAME(vm.idVM, CONCAT(IF(ISNULL(vm.description),_utf8'',substr(vm.description,1,120)), _utf8' - ', vm.name))
                    INTO idDummy, idDummy, idDummy, idDummy
            FROM    nodevirtualimage nvi, node n, virtualapp vapp, virtualmachine vm, virtualdatacenter vdc, enterprise e
		    WHERE   vm.idVM = nvi.idVM
                    AND nvi.idNode = n.idNode
                    AND vapp.idVirtualApp = n.idVirtualApp
                    AND vm.idVM = idVirtualMachine
                    AND vdc.idVirtualDataCenter=vapp.idVirtualDataCenter
                    AND e.idEnterprise=vdc.idEnterprise;
            
		--  => DEPLOY Event Detected (1st PowerON)
		    -- INSERT INTO debug_msg (msg) VALUES (CONCAT('DEPLOY event detected -> newState: ',newState, 'previousState', previousState));
		    INSERT INTO accounting_event_vm (idVM,idEnterprise,idVirtualDataCenter,idVirtualApp,cpu,ram,hd,startTime,stopTime,costCode,hypervisorType) 
		    SELECT
		        vm.idVM, vapp.idEnterprise, vapp.idVirtualDataCenter, n.idVirtualApp,
		        cpuValue,
		        ramValue,           
		        hdValue,
		        now(),
		        null,
		        costCode,
		        vdc.hypervisorType
		      FROM nodevirtualimage nvi, node n, virtualapp vapp, virtualmachine vm, virtualdatacenter vdc
		    WHERE vm.idVM = nvi.idVM
		    AND nvi.idNode = n.idNode
		    AND vapp.idVirtualApp = n.idVirtualApp
		    AND vm.idVM = idVirtualMachine
		    AND vdc.idVirtualDataCenter=vapp.idVirtualDataCenter;
		END IF;
		IF previousState = "OFF" AND newState ="ON" THEN
			-- INSERT INTO debug_msg (msg) VALUES (CONCAT('POWER_ON  event detected -> newState: ',newState, 'previousState', previousState));          
			-- Power ON detected (updating active row with data)
			UPDATE
		    	accounting_event_vm
		    SET
		    	cpu = cpuValue,
		    	ram = ramValue,
		    	hd = hdValue,
		    	costCode = costCode
		    WHERE
		      accounting_event_vm.idVM = idVirtualMachine
		      and
		      accounting_event_vm.stopTime is null;
		END IF;
		IF previousState IN  ("ON","OFF") AND newState IN ("NOT_ALLOCATED","UNKNOWN") THEN          
			-- INSERT INTO debug_msg (msg) VALUES (CONCAT('UNDEPLOY event detected -> newState: ',newState, 'previousState', previousState));          
			-- => UNDEPLOY Event Detected 
		    UPDATE
		      accounting_event_vm
		    SET
		      stopTime=now()
		    WHERE
		      accounting_event_vm.idVM = idVirtualMachine
		      and
		      accounting_event_vm.stopTime is null;
	    END IF;
    END IF;    
    --  
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/procedures.xml', 'AccountingVMRegisterEvents', '2.0.3', '3:9c6058842d972f202cec4f0eafacb4ac', 176);

-- Changeset src/2.0ga/procedures.xml::AccountingStorageRegisterEvents::destevez::(Checksum: 3:8b2edbf4e9ed685822d65f62427c3d9f)
DROP PROCEDURE IF EXISTS AccountingStorageRegisterEvents;

-- 
-- AccountingStorageRegisterEvents
--
-- Triggered when user creates, updates or deletes a volume in a VirtualDataCenter. All this events are stored in 'accounting_event_storage' with its timestamps.
-- This procedure performs different actions managed by 'action' parameter values:'CREATE_STORAGE','UPDATE_STORAGE','
-- 
DELIMITER |
CREATE PROCEDURE AccountingStorageRegisterEvents(
    IN action VARCHAR(15),
    IN idThisResource VARCHAR(50),
    IN thisResourceName VARCHAR(255),
    IN idStorageTier INT(10) UNSIGNED,
    IN idThisVirtualDataCenter INT(10) UNSIGNED,
    IN idThisEnterprise INT(10) UNSIGNED,  
    IN sizeReserved BIGINT(20))
BEGIN   
    DECLARE idDummy BIGINT; # Dummy variable to stop result set generation

    -- Storage Creation Event Detected (table rasd_management). Storage is converted to Bytes
    IF action = "CREATE_STORAGE" THEN
        SELECT  kinton_accounting.ABQ_ADD_ENT_NAME(e.idEnterprise, e.name), kinton_accounting.ABQ_ADD_VDC_NAME(vdc.idVirtualDataCenter, vdc.name)
                    INTO idDummy, idDummy
            FROM    virtualdatacenter vdc, enterprise e
            WHERE   vdc.idVirtualDataCenter=idThisVirtualDataCenter AND e.idEnterprise=vdc.idEnterprise;

        INSERT INTO accounting_event_storage (idResource, resourceName, idStorageTier, idVM,idEnterprise,idVirtualDataCenter,idVirtualApp,sizeReserved,startTime, stopTime)
        SELECT idThisResource, thisResourceName, idStorageTier, null, idThisEnterprise, idThisVirtualDataCenter, null, sizeReserved * 1048576, now(), null; 
    END IF;
    -- Storage Delete Event Detected (table rasd_management)
    IF action = "DELETE_STORAGE" THEN   
        UPDATE
          accounting_event_storage
        SET
          stopTime=now()
        WHERE
          accounting_event_storage.idResource = idThisResource
          AND
          accounting_event_storage.stopTime is null;
    END IF;
    -- Storage Update Event Detected: update and insert a new one (table rasd)
    IF action = "UPDATE_STORAGE" THEN   
        UPDATE
          accounting_event_storage
        SET
          stopTime=now()
        WHERE
          accounting_event_storage.idResource = idThisResource
          AND
          accounting_event_storage.stopTime is null;
        INSERT INTO accounting_event_storage (idResource, resourceName, idVM,idEnterprise,idVirtualDataCenter,idVirtualApp,sizeReserved,startTime, stopTime)
            SELECT idThisResource,thisResourceName, null, idThisEnterprise, idThisVirtualDataCenter, null, sizeReserved * 1048576, now(), null; 
    END IF;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/procedures.xml', 'AccountingStorageRegisterEvents', '2.0.3', '3:8b2edbf4e9ed685822d65f62427c3d9f', 177);

-- Changeset src/2.0ga/procedures.xml::AccountingIPsRegisterEvents::destevez::(Checksum: 3:e6f6edc61eb760b261e0b18621f105e8)
DROP PROCEDURE IF EXISTS AccountingIPsRegisterEvents;

-- 
-- AccountingIPsRegisterEvents
--
-- Triggered when user creates, updates or deletes a volume in a VirtualDataCenter. All this events are stored in 'accounting_event_storage' with its timestamps.
-- This procedure performs different actions managed by 'action' parameter values:'CREATE_STORAGE','UPDATE_STORAGE','
-- 
DELIMITER |
CREATE PROCEDURE AccountingIPsRegisterEvents(
    IN action VARCHAR(15),
    IN idManagement INT(10) UNSIGNED,
    IN ipAddress VARCHAR(20),
    IN idThisVirtualDataCenter INT(10) UNSIGNED,
    IN idThisEnterprise INT(10) UNSIGNED)
BEGIN   
    DECLARE idDummy BIGINT; # Dummy variable to stop result set generation

    --  
    -- IP Reserved Event Detected (table ip_pool_management)
    IF action = "IP_RESERVED" THEN
        SELECT  kinton_accounting.ABQ_ADD_ENT_NAME(e.idEnterprise, e.name), kinton_accounting.ABQ_ADD_VDC_NAME(vdc.idVirtualDataCenter, vdc.name)
                    INTO idDummy, idDummy
            FROM    virtualdatacenter vdc, enterprise e
            WHERE   vdc.idVirtualDataCenter=idThisVirtualDataCenter AND e.idEnterprise=vdc.idEnterprise;

        INSERT INTO accounting_event_ips (idManagement,idEnterprise,idVirtualDataCenter,ip,startTime,stopTime)
        SELECT idManagement, idThisEnterprise, idThisVirtualDataCenter, ipAddress, now(), null; 
    END IF;
    -- IP Freed Event Detected (table rasd_management)
    IF action = "IP_FREED" THEN 
        UPDATE
          accounting_event_ips
        SET
          stopTime=now()
        WHERE
          accounting_event_ips.idManagement = idManagement
          AND
          accounting_event_ips.stopTime is null;
    END IF; 
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/procedures.xml', 'AccountingIPsRegisterEvents', '2.0.3', '3:e6f6edc61eb760b261e0b18621f105e8', 178);

-- Changeset src/2.0ga/procedures.xml::AccountingVLANRegisterEvents::destevez::(Checksum: 3:ddf172bb852e2db7f7c022517ca99e8a)
DROP PROCEDURE IF EXISTS AccountingVLANRegisterEvents;

-- 
-- AccountingVLANRegisterEvents
--
-- Triggered when user creates or deletes a VLAN in a VirtualDataCenter. All this events are stored in 'accounting_event_vlan' with its timestamps.
-- This procedure performs different actions managed by 'action' parameter values:'CREATE_VLAN','DELETE_VLAN','
-- 
DELIMITER |
CREATE PROCEDURE AccountingVLANRegisterEvents(
    IN action VARCHAR(15),
    IN vlan_network_id INT(11) UNSIGNED,
    IN network_name VARCHAR(40),
    IN idThisVirtualDataCenter INT(10) UNSIGNED,
    IN idThisEnterprise INT(10) UNSIGNED)
BEGIN   
    DECLARE idDummy BIGINT; # Dummy variable to stop result set generation

    -- INSERT INTO debug_msg (msg) VALUES (CONCAT('PROCEDURE AccountingVLANRegisterEvents Activated: ',IFNULL(vlan_network_id,'NULL'),'-',IFNULL(network_name,'NULL'),'-',IFNULL(idThisVirtualDataCenter,'NULL'),'-',idThisEnterprise,'-',action,'-',now()));   
    --  
    -- VLAN Created Event Detected
    IF action = "CREATE_VLAN" THEN
        SELECT  kinton_accounting.ABQ_ADD_ENT_NAME(e.idEnterprise, e.name), kinton_accounting.ABQ_ADD_VDC_NAME(vdc.idVirtualDataCenter, vdc.name)
                    INTO idDummy, idDummy
            FROM    virtualdatacenter vdc, enterprise e
            WHERE   vdc.idVirtualDataCenter=idThisVirtualDataCenter AND e.idEnterprise=vdc.idEnterprise;

        INSERT INTO accounting_event_vlan (vlan_network_id,idEnterprise,idVirtualDataCenter,network_name,startTime,stopTime) 
        SELECT vlan_network_id, idThisEnterprise, idThisVirtualDataCenter, network_name, now(), null; 
    END IF;
    -- VLAN Deleted Event Detected
    IF action = "DELETE_VLAN" THEN  
        UPDATE
          accounting_event_vlan
        SET
          stopTime=now()
        WHERE
          accounting_event_vlan.vlan_network_id = vlan_network_id
          AND
          accounting_event_vlan.stopTime is null;
    END IF; 
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.0ga/procedures.xml', 'AccountingVLANRegisterEvents', '2.0.3', '3:ddf172bb852e2db7f7c022517ca99e8a', 179);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-92::destevezg (generated)::(Checksum: 3:61865568b5c369334126d98f2cbe9ca2)
ALTER TABLE `kinton`.`apps_library` ADD CONSTRAINT `fk_idEnterpriseApps` FOREIGN KEY (`idEnterprise`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-92', '2.0.3', '3:61865568b5c369334126d98f2cbe9ca2', 180);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-93::destevezg (generated)::(Checksum: 3:4a2fb0e70026d6bfe34d2eea6989c1cf)
ALTER TABLE `kinton`.`auth_serverresource` ADD CONSTRAINT `auth_serverresourceFK1` FOREIGN KEY (`idGroup`) REFERENCES `kinton`.`auth_group` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-93', '2.0.3', '3:4a2fb0e70026d6bfe34d2eea6989c1cf', 181);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-94::destevezg (generated)::(Checksum: 3:25f0b96d5511b61ebff630df02f7f80e)
ALTER TABLE `kinton`.`auth_serverresource` ADD CONSTRAINT `auth_serverresourceFK2` FOREIGN KEY (`idRole`) REFERENCES `kinton`.`role` (`idRole`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-94', '2.0.3', '3:25f0b96d5511b61ebff630df02f7f80e', 182);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-95::destevezg (generated)::(Checksum: 3:f4199d4c8ef6d658b47e268c5b179975)
ALTER TABLE `kinton`.`auth_serverresource_exception` ADD CONSTRAINT `auth_serverresource_exceptionFK1` FOREIGN KEY (`idResource`) REFERENCES `kinton`.`auth_serverresource` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-95', '2.0.3', '3:f4199d4c8ef6d658b47e268c5b179975', 183);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-96::destevezg (generated)::(Checksum: 3:c07a9802053c16ea4ff6ed536da64a49)
ALTER TABLE `kinton`.`auth_serverresource_exception` ADD CONSTRAINT `auth_serverresource_exceptionFK2` FOREIGN KEY (`idUser`) REFERENCES `kinton`.`user` (`idUser`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-96', '2.0.3', '3:c07a9802053c16ea4ff6ed536da64a49', 184);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-97::destevezg (generated)::(Checksum: 3:c1380d095c438a19d05b61b4fbcfe7fa)
ALTER TABLE `kinton`.`chef_runlist` ADD CONSTRAINT `chef_runlist_FK1` FOREIGN KEY (`idVM`) REFERENCES `kinton`.`virtualmachine` (`idVM`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-97', '2.0.3', '3:c1380d095c438a19d05b61b4fbcfe7fa', 185);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-98::destevezg (generated)::(Checksum: 3:96c71c89d367921fd04f4fed07442eac)
ALTER TABLE `kinton`.`datacenter` ADD CONSTRAINT `datacenternetwork_FK1` FOREIGN KEY (`network_id`) REFERENCES `kinton`.`network` (`network_id`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-98', '2.0.3', '3:96c71c89d367921fd04f4fed07442eac', 186);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-99::destevezg (generated)::(Checksum: 3:a6695e1d09254cd47b2bd905e433c15f)
ALTER TABLE `kinton`.`disk_management` ADD CONSTRAINT `disk_datastore_FK` FOREIGN KEY (`idDatastore`) REFERENCES `kinton`.`datastore` (`idDatastore`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-99', '2.0.3', '3:a6695e1d09254cd47b2bd905e433c15f', 187);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-100::destevezg (generated)::(Checksum: 3:162a67a515a4b894be24ea92677a4ec2)
ALTER TABLE `kinton`.`disk_management` ADD CONSTRAINT `disk_idManagement_FK` FOREIGN KEY (`idManagement`) REFERENCES `kinton`.`rasd_management` (`idManagement`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-100', '2.0.3', '3:162a67a515a4b894be24ea92677a4ec2', 188);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-102::destevezg (generated)::(Checksum: 3:9cc3b6aa2c32810c3af8841bcf75d057)
ALTER TABLE `kinton`.`enterprise` ADD CONSTRAINT `enterprise_pricing_FK` FOREIGN KEY (`idPricingTemplate`) REFERENCES `kinton`.`pricingTemplate` (`idPricingTemplate`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-102', '2.0.3', '3:9cc3b6aa2c32810c3af8841bcf75d057', 189);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-103::destevezg (generated)::(Checksum: 3:f110c901d46203476b26407f34a20553)
ALTER TABLE `kinton`.`enterprise_limits_by_datacenter` ADD CONSTRAINT `enterprise_FK7` FOREIGN KEY (`default_vlan_network_id`) REFERENCES `kinton`.`vlan_network` (`vlan_network_id`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-103', '2.0.3', '3:f110c901d46203476b26407f34a20553', 190);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-104::destevezg (generated)::(Checksum: 3:0a90424859d5c751e009a52788fbd5c7)
ALTER TABLE `kinton`.`enterprise_properties` ADD CONSTRAINT `FK_enterprise` FOREIGN KEY (`enterprise`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-104', '2.0.3', '3:0a90424859d5c751e009a52788fbd5c7', 191);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-105::destevezg (generated)::(Checksum: 3:c6f97a64d3bbaf7e4b704612fb2da6e8)
ALTER TABLE `kinton`.`enterprise_properties_map` ADD CONSTRAINT `FK2_enterprise_properties` FOREIGN KEY (`enterprise_properties`) REFERENCES `kinton`.`enterprise_properties` (`idProperties`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-105', '2.0.3', '3:c6f97a64d3bbaf7e4b704612fb2da6e8', 192);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-106::destevezg (generated)::(Checksum: 3:f12c60cd95ff11d2437444a8202c5bd4)
ALTER TABLE `kinton`.`enterprise_theme` ADD CONSTRAINT `THEME_FK1` FOREIGN KEY (`idEnterprise`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-106', '2.0.3', '3:f12c60cd95ff11d2437444a8202c5bd4', 193);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-107::destevezg (generated)::(Checksum: 3:6754b7abce5397c7844d687884732683)
ALTER TABLE `kinton`.`hypervisor` ADD CONSTRAINT `Hypervisor_FK1` FOREIGN KEY (`idPhysicalMachine`) REFERENCES `kinton`.`physicalmachine` (`idPhysicalMachine`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-107', '2.0.3', '3:6754b7abce5397c7844d687884732683', 194);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-109::destevezg (generated)::(Checksum: 3:2067c951c3aa82d24eb4324e3d90f25e)
ALTER TABLE `kinton`.`ip_pool_management` ADD CONSTRAINT `id_management_FK` FOREIGN KEY (`idManagement`) REFERENCES `kinton`.`rasd_management` (`idManagement`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-109', '2.0.3', '3:2067c951c3aa82d24eb4324e3d90f25e', 195);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-110::destevezg (generated)::(Checksum: 3:09da99c4e6e31595f34ec2be25b43dc8)
ALTER TABLE `kinton`.`ip_pool_management` ADD CONSTRAINT `ippool_vlan_network_FK` FOREIGN KEY (`vlan_network_id`) REFERENCES `kinton`.`vlan_network` (`vlan_network_id`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-110', '2.0.3', '3:09da99c4e6e31595f34ec2be25b43dc8', 196);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-111::destevezg (generated)::(Checksum: 3:e52fa216c74824b00447bb18025d3958)
ALTER TABLE `kinton`.`log` ADD CONSTRAINT `log_FK1` FOREIGN KEY (`idVirtualApp`) REFERENCES `kinton`.`virtualapp` (`idVirtualApp`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-111', '2.0.3', '3:e52fa216c74824b00447bb18025d3958', 197);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-112::destevezg (generated)::(Checksum: 3:e6034e81d4247717b894501b1e5f2077)
ALTER TABLE `kinton`.`node` ADD CONSTRAINT `node_FK2` FOREIGN KEY (`idVirtualApp`) REFERENCES `kinton`.`virtualapp` (`idVirtualApp`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-112', '2.0.3', '3:e6034e81d4247717b894501b1e5f2077', 198);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-113::destevezg (generated)::(Checksum: 3:c0ef24d86a2e36e3f18678ecf98a4fd1)
ALTER TABLE `kinton`.`node_virtual_image_stateful_conversions` ADD CONSTRAINT `idDiskStatefulConversion_FK4` FOREIGN KEY (`idDiskStatefulConversion`) REFERENCES `kinton`.`diskstateful_conversions` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-113', '2.0.3', '3:c0ef24d86a2e36e3f18678ecf98a4fd1', 199);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-116::destevezg (generated)::(Checksum: 3:87401343ba30f95853096f53f2145d4c)
ALTER TABLE `kinton`.`node_virtual_image_stateful_conversions` ADD CONSTRAINT `idTier_FK4` FOREIGN KEY (`idTier`) REFERENCES `kinton`.`tier` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-116', '2.0.3', '3:87401343ba30f95853096f53f2145d4c', 200);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-117::destevezg (generated)::(Checksum: 3:241f9a9ba6ee93b09a7bee6372e2a99f)
ALTER TABLE `kinton`.`node_virtual_image_stateful_conversions` ADD CONSTRAINT `idVirtualApplianceStatefulConversion_FK4` FOREIGN KEY (`idVirtualApplianceStatefulConversion`) REFERENCES `kinton`.`vappstateful_conversions` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-117', '2.0.3', '3:241f9a9ba6ee93b09a7bee6372e2a99f', 201);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-118::destevezg (generated)::(Checksum: 3:babee5873b113a16e3d247c4a8b7d5ae)
ALTER TABLE `kinton`.`node_virtual_image_stateful_conversions` ADD CONSTRAINT `idVirtualImageConversion_FK4` FOREIGN KEY (`idVirtualImageConversion`) REFERENCES `kinton`.`virtualimage_conversions` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-118', '2.0.3', '3:babee5873b113a16e3d247c4a8b7d5ae', 202);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-119::destevezg (generated)::(Checksum: 3:2e37837fbfb14dfc4499ce39e4e45d0f)
ALTER TABLE `kinton`.`nodenetwork` ADD CONSTRAINT `nodeNetwork_FK1` FOREIGN KEY (`idNode`) REFERENCES `kinton`.`node` (`idNode`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-119', '2.0.3', '3:2e37837fbfb14dfc4499ce39e4e45d0f', 203);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-120::destevezg (generated)::(Checksum: 3:224c98605877be44c1a4b7772f40139d)
ALTER TABLE `kinton`.`nodestorage` ADD CONSTRAINT `nodeStorage_FK1` FOREIGN KEY (`idNode`) REFERENCES `kinton`.`node` (`idNode`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-120', '2.0.3', '3:224c98605877be44c1a4b7772f40139d', 204);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-121::destevezg (generated)::(Checksum: 3:7add768133119551554b8e3fe4eabcfe)
ALTER TABLE `kinton`.`nodevirtualimage` ADD CONSTRAINT `nodevirtualImage_FK1` FOREIGN KEY (`idImage`) REFERENCES `kinton`.`virtualimage` (`idImage`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-121', '2.0.3', '3:7add768133119551554b8e3fe4eabcfe', 205);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-122::destevezg (generated)::(Checksum: 3:4c513d9af35d89264d6426523832b0bf)
ALTER TABLE `kinton`.`nodevirtualimage` ADD CONSTRAINT `nodevirtualimage_FK3` FOREIGN KEY (`idNode`) REFERENCES `kinton`.`node` (`idNode`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-122', '2.0.3', '3:4c513d9af35d89264d6426523832b0bf', 206);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-123::destevezg (generated)::(Checksum: 3:cdbd03b583ae11a990b14cee938029af)
ALTER TABLE `kinton`.`nodevirtualimage` ADD CONSTRAINT `nodevirtualImage_FK2` FOREIGN KEY (`idVM`) REFERENCES `kinton`.`virtualmachine` (`idVM`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-123', '2.0.3', '3:cdbd03b583ae11a990b14cee938029af', 207);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-124::destevezg (generated)::(Checksum: 3:e19d2a8d15b2698983ec2bd3244da199)
ALTER TABLE `kinton`.`ovf_package` ADD CONSTRAINT `fk_ovf_package_repository` FOREIGN KEY (`id_apps_library`) REFERENCES `kinton`.`apps_library` (`id_apps_library`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-124', '2.0.3', '3:e19d2a8d15b2698983ec2bd3244da199', 208);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-125::destevezg (generated)::(Checksum: 3:e7542966e2a4262fcd6d94d9eab2d31d)
ALTER TABLE `kinton`.`ovf_package` ADD CONSTRAINT `fk_ovf_package_category` FOREIGN KEY (`idCategory`) REFERENCES `kinton`.`category` (`idCategory`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-125', '2.0.3', '3:e7542966e2a4262fcd6d94d9eab2d31d', 209);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-126::destevezg (generated)::(Checksum: 3:c4d6eb8f3294ff8dc825f8dcb0694229)
ALTER TABLE `kinton`.`ovf_package_list` ADD CONSTRAINT `fk_ovf_package_list_repository` FOREIGN KEY (`id_apps_library`) REFERENCES `kinton`.`apps_library` (`id_apps_library`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-126', '2.0.3', '3:c4d6eb8f3294ff8dc825f8dcb0694229', 210);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-127::destevezg (generated)::(Checksum: 3:588d684f716fac4248a78f84b20e1848)
ALTER TABLE `kinton`.`ovf_package_list_has_ovf_package` ADD CONSTRAINT `fk_ovf_package_list_has_ovf_package_ovf_package1` FOREIGN KEY (`id_ovf_package`) REFERENCES `kinton`.`ovf_package` (`id_ovf_package`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-127', '2.0.3', '3:588d684f716fac4248a78f84b20e1848', 211);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-128::destevezg (generated)::(Checksum: 3:a6664c8e00e9f84735691bc9f65ffdae)
ALTER TABLE `kinton`.`ovf_package_list_has_ovf_package` ADD CONSTRAINT `fk_ovf_package_list_has_ovf_package_ovf_package_list1` FOREIGN KEY (`id_ovf_package_list`) REFERENCES `kinton`.`ovf_package_list` (`id_ovf_package_list`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-128', '2.0.3', '3:a6664c8e00e9f84735691bc9f65ffdae', 212);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-129::destevezg (generated)::(Checksum: 3:401d7128c9685671b8132c2be2f3b51c)
ALTER TABLE `kinton`.`physicalmachine` ADD CONSTRAINT `PhysicalMachine_FK5` FOREIGN KEY (`idDataCenter`) REFERENCES `kinton`.`datacenter` (`idDataCenter`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-129', '2.0.3', '3:401d7128c9685671b8132c2be2f3b51c', 213);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-130::destevezg (generated)::(Checksum: 3:7bd171095093a31d90a52130c93b4361)
ALTER TABLE `kinton`.`physicalmachine` ADD CONSTRAINT `PhysicalMachine_FK6` FOREIGN KEY (`idEnterprise`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-130', '2.0.3', '3:7bd171095093a31d90a52130c93b4361', 214);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-131::destevezg (generated)::(Checksum: 3:8aac24d3878f2cf143029245d36bc718)
ALTER TABLE `kinton`.`physicalmachine` ADD CONSTRAINT `PhysicalMachine_FK1` FOREIGN KEY (`idRack`) REFERENCES `kinton`.`rack` (`idRack`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-131', '2.0.3', '3:8aac24d3878f2cf143029245d36bc718', 215);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-132::destevezg (generated)::(Checksum: 3:0d408de63c791d1d72e1ca6ed5b37115)
ALTER TABLE `kinton`.`pricingTemplate` ADD CONSTRAINT `Pricing_FK2_Currency` FOREIGN KEY (`idCurrency`) REFERENCES `kinton`.`currency` (`idCurrency`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-132', '2.0.3', '3:0d408de63c791d1d72e1ca6ed5b37115', 216);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-133::destevezg (generated)::(Checksum: 3:7f40febbf510e024517380fd5e5aef48)
ALTER TABLE `kinton`.`rack` ADD CONSTRAINT `Rack_FK1` FOREIGN KEY (`idDataCenter`) REFERENCES `kinton`.`datacenter` (`idDataCenter`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-133', '2.0.3', '3:7f40febbf510e024517380fd5e5aef48', 217);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-134::destevezg (generated)::(Checksum: 3:b582521bf03ee8d5ea05c684578c7034)
ALTER TABLE `kinton`.`rasd_management` ADD CONSTRAINT `idResource_FK` FOREIGN KEY (`idResource`) REFERENCES `kinton`.`rasd` (`instanceID`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-134', '2.0.3', '3:b582521bf03ee8d5ea05c684578c7034', 218);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-135::destevezg (generated)::(Checksum: 3:aeb0ded36caf7b4870a9cbda8cb62771)
ALTER TABLE `kinton`.`rasd_management` ADD CONSTRAINT `idVirtualApp_FK` FOREIGN KEY (`idVirtualApp`) REFERENCES `kinton`.`virtualapp` (`idVirtualApp`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-135', '2.0.3', '3:aeb0ded36caf7b4870a9cbda8cb62771', 219);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-136::destevezg (generated)::(Checksum: 3:0abce3e30f01b6ddf819b8e30ee635a9)
ALTER TABLE `kinton`.`rasd_management` ADD CONSTRAINT `idVirtualDataCenter_FK` FOREIGN KEY (`idVirtualDataCenter`) REFERENCES `kinton`.`virtualdatacenter` (`idVirtualDataCenter`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-136', '2.0.3', '3:0abce3e30f01b6ddf819b8e30ee635a9', 220);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-137::destevezg (generated)::(Checksum: 3:01ea4328ecb4f1edfcffece4bd1019d1)
ALTER TABLE `kinton`.`rasd_management` ADD CONSTRAINT `idVM_FK` FOREIGN KEY (`idVM`) REFERENCES `kinton`.`virtualmachine` (`idVM`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-137', '2.0.3', '3:01ea4328ecb4f1edfcffece4bd1019d1', 221);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-138::destevezg (generated)::(Checksum: 3:79755fa4b03184aaf81ed902878886e3)
ALTER TABLE `kinton`.`remote_service` ADD CONSTRAINT `idDatecenter_FK` FOREIGN KEY (`idDataCenter`) REFERENCES `kinton`.`datacenter` (`idDataCenter`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-138', '2.0.3', '3:79755fa4b03184aaf81ed902878886e3', 222);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-139::destevezg (generated)::(Checksum: 3:3b7a36fc3de222b2827dd624bbf188df)
ALTER TABLE `kinton`.`repository` ADD CONSTRAINT `fk_idDataCenter` FOREIGN KEY (`idDataCenter`) REFERENCES `kinton`.`datacenter` (`idDataCenter`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-139', '2.0.3', '3:3b7a36fc3de222b2827dd624bbf188df', 223);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-140::destevezg (generated)::(Checksum: 3:cecf006c92ac717d6c86487c837a9718)
ALTER TABLE `kinton`.`role` ADD CONSTRAINT `fk_role_1` FOREIGN KEY (`idEnterprise`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-140', '2.0.3', '3:cecf006c92ac717d6c86487c837a9718', 224);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-141::destevezg (generated)::(Checksum: 3:afe3ffec74162088a0854a7f70d46f00)
ALTER TABLE `kinton`.`role_ldap` ADD CONSTRAINT `fk_role_ldap_role` FOREIGN KEY (`idRole`) REFERENCES `kinton`.`role` (`idRole`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-141', '2.0.3', '3:afe3ffec74162088a0854a7f70d46f00', 225);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-142::destevezg (generated)::(Checksum: 3:dc4c00c7d2f82ac51a5bd20c136d466f)
ALTER TABLE `kinton`.`roles_privileges` ADD CONSTRAINT `fk_roles_privileges_privileges` FOREIGN KEY (`idPrivilege`) REFERENCES `kinton`.`privilege` (`idPrivilege`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-142', '2.0.3', '3:dc4c00c7d2f82ac51a5bd20c136d466f', 226);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-143::destevezg (generated)::(Checksum: 3:9759ca65a44a631f100713776f858563)
ALTER TABLE `kinton`.`roles_privileges` ADD CONSTRAINT `fk_roles_privileges_role` FOREIGN KEY (`idRole`) REFERENCES `kinton`.`role` (`idRole`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-143', '2.0.3', '3:9759ca65a44a631f100713776f858563', 227);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-144::destevezg (generated)::(Checksum: 3:41352352d930fd662d1d7d363bc4f719)
ALTER TABLE `kinton`.`session` ADD CONSTRAINT `fk_session_user` FOREIGN KEY (`idUser`) REFERENCES `kinton`.`user` (`idUser`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-144', '2.0.3', '3:41352352d930fd662d1d7d363bc4f719', 228);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-145::destevezg (generated)::(Checksum: 3:45727eba271f8926bf7e2d794169d7e4)
ALTER TABLE `kinton`.`storage_device` ADD CONSTRAINT `storage_device_FK_1` FOREIGN KEY (`idDataCenter`) REFERENCES `kinton`.`datacenter` (`idDataCenter`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-145', '2.0.3', '3:45727eba271f8926bf7e2d794169d7e4', 229);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-146::destevezg (generated)::(Checksum: 3:41cc38e6af909e00988ea3e2ed9f9a11)
ALTER TABLE `kinton`.`storage_pool` ADD CONSTRAINT `storage_pool_FK1` FOREIGN KEY (`idStorageDevice`) REFERENCES `kinton`.`storage_device` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-146', '2.0.3', '3:41cc38e6af909e00988ea3e2ed9f9a11', 230);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-147::destevezg (generated)::(Checksum: 3:89446970e88861750073ca38aecd7221)
ALTER TABLE `kinton`.`storage_pool` ADD CONSTRAINT `storage_pool_FK2` FOREIGN KEY (`idTier`) REFERENCES `kinton`.`tier` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-147', '2.0.3', '3:89446970e88861750073ca38aecd7221', 231);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-148::destevezg (generated)::(Checksum: 3:4fb61370d6709dbdad6cb8912d78d147)
ALTER TABLE `kinton`.`tier` ADD CONSTRAINT `tier_FK_1` FOREIGN KEY (`idDataCenter`) REFERENCES `kinton`.`datacenter` (`idDataCenter`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-148', '2.0.3', '3:4fb61370d6709dbdad6cb8912d78d147', 232);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-149::destevezg (generated)::(Checksum: 3:ce3759c45c6e5e0957bdf286928ddfd6)
ALTER TABLE `kinton`.`ucs_rack` ADD CONSTRAINT `id_rack_FK` FOREIGN KEY (`idRack`) REFERENCES `kinton`.`rack` (`idRack`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-149', '2.0.3', '3:ce3759c45c6e5e0957bdf286928ddfd6', 233);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-150::destevezg (generated)::(Checksum: 3:6a2e1beff7657d80b3ddc590c6afb4ff)
ALTER TABLE `kinton`.`user` ADD CONSTRAINT `FK1_user` FOREIGN KEY (`idEnterprise`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-150', '2.0.3', '3:6a2e1beff7657d80b3ddc590c6afb4ff', 234);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-151::destevezg (generated)::(Checksum: 3:4c49355453f85109bc9fdaaa7d9c8f9d)
ALTER TABLE `kinton`.`user` ADD CONSTRAINT `User_FK1` FOREIGN KEY (`idRole`) REFERENCES `kinton`.`role` (`idRole`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-151', '2.0.3', '3:4c49355453f85109bc9fdaaa7d9c8f9d', 235);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-152::destevezg (generated)::(Checksum: 3:c69b44279fe35ae4d5357530fa58f98c)
ALTER TABLE `kinton`.`vappstateful_conversions` ADD CONSTRAINT `idUser_FK3` FOREIGN KEY (`idUser`) REFERENCES `kinton`.`user` (`idUser`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-152', '2.0.3', '3:c69b44279fe35ae4d5357530fa58f98c', 236);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-153::destevezg (generated)::(Checksum: 3:55d5fcfd88c84da2d8e8b047fbe4ca74)
ALTER TABLE `kinton`.`vappstateful_conversions` ADD CONSTRAINT `idVirtualApp_FK3` FOREIGN KEY (`idVirtualApp`) REFERENCES `kinton`.`virtualapp` (`idVirtualApp`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-153', '2.0.3', '3:55d5fcfd88c84da2d8e8b047fbe4ca74', 237);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-154::destevezg (generated)::(Checksum: 3:5a8a82475af9f6cd7f2dd53d712f7772)
ALTER TABLE `kinton`.`virtual_appliance_conversions` ADD CONSTRAINT `virtualimage_conversions_FK` FOREIGN KEY (`idConversion`) REFERENCES `kinton`.`virtualimage_conversions` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-154', '2.0.3', '3:5a8a82475af9f6cd7f2dd53d712f7772', 238);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-155::destevezg (generated)::(Checksum: 3:28bb4e87b926a15b198c9c3f0ed9a41e)
ALTER TABLE `kinton`.`virtual_appliance_conversions` ADD CONSTRAINT `virtual_appliance_conversions_node_FK` FOREIGN KEY (`idNode`) REFERENCES `kinton`.`nodevirtualimage` (`idNode`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-155', '2.0.3', '3:28bb4e87b926a15b198c9c3f0ed9a41e', 239);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-156::destevezg (generated)::(Checksum: 3:3338ded640346300fe6fc834f29cd573)
ALTER TABLE `kinton`.`virtual_appliance_conversions` ADD CONSTRAINT `user_FK` FOREIGN KEY (`idUser`) REFERENCES `kinton`.`user` (`idUser`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-156', '2.0.3', '3:3338ded640346300fe6fc834f29cd573', 240);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-157::destevezg (generated)::(Checksum: 3:21c1084c13f597df7b8ae0b17661bec8)
ALTER TABLE `kinton`.`virtual_appliance_conversions` ADD CONSTRAINT `virtualapp_FK` FOREIGN KEY (`idVirtualAppliance`) REFERENCES `kinton`.`virtualapp` (`idVirtualApp`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-157', '2.0.3', '3:21c1084c13f597df7b8ae0b17661bec8', 241);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-158::destevezg (generated)::(Checksum: 3:b69eabf2c2c54d2b3fca684c10307674)
ALTER TABLE `kinton`.`virtualapp` ADD CONSTRAINT `VirtualApp_FK5` FOREIGN KEY (`idEnterprise`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-158', '2.0.3', '3:b69eabf2c2c54d2b3fca684c10307674', 242);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-159::destevezg (generated)::(Checksum: 3:cc83157e9e8f124153e80effb9d51efb)
ALTER TABLE `kinton`.`virtualapp` ADD CONSTRAINT `VirtualApp_FK4` FOREIGN KEY (`idVirtualDataCenter`) REFERENCES `kinton`.`virtualdatacenter` (`idVirtualDataCenter`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-159', '2.0.3', '3:cc83157e9e8f124153e80effb9d51efb', 243);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-160::destevezg (generated)::(Checksum: 3:b16109dedffbd117d36f5b77cd4afd47)
ALTER TABLE `kinton`.`virtualdatacenter` ADD CONSTRAINT `virtualDataCenter_FK7` FOREIGN KEY (`default_vlan_network_id`) REFERENCES `kinton`.`vlan_network` (`vlan_network_id`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-160', '2.0.3', '3:b16109dedffbd117d36f5b77cd4afd47', 244);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-161::destevezg (generated)::(Checksum: 3:ada5fd43eb881ae2b2c0a4ae26e8b60b)
ALTER TABLE `kinton`.`virtualdatacenter` ADD CONSTRAINT `virtualDataCenter_FK6` FOREIGN KEY (`idDataCenter`) REFERENCES `kinton`.`datacenter` (`idDataCenter`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-161', '2.0.3', '3:ada5fd43eb881ae2b2c0a4ae26e8b60b', 245);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-162::destevezg (generated)::(Checksum: 3:c1c9a3d9a6cd5f576dba7bec3898158f)
ALTER TABLE `kinton`.`virtualdatacenter` ADD CONSTRAINT `virtualDataCenter_FK1` FOREIGN KEY (`idEnterprise`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-162', '2.0.3', '3:c1c9a3d9a6cd5f576dba7bec3898158f', 246);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-163::destevezg (generated)::(Checksum: 3:bcb0e0250107a0123f8ea29709d18132)
ALTER TABLE `kinton`.`virtualdatacenter` ADD CONSTRAINT `virtualDataCenter_FK4` FOREIGN KEY (`networktypeID`) REFERENCES `kinton`.`network` (`network_id`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-163', '2.0.3', '3:bcb0e0250107a0123f8ea29709d18132', 247);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-164::destevezg (generated)::(Checksum: 3:da457c42797f29326ae68a0f6ef932c7)
ALTER TABLE `kinton`.`virtualimage` ADD CONSTRAINT `fk_virtualimage_category` FOREIGN KEY (`idCategory`) REFERENCES `kinton`.`category` (`idCategory`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-164', '2.0.3', '3:da457c42797f29326ae68a0f6ef932c7', 248);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-165::destevezg (generated)::(Checksum: 3:66e0aecdb3e6496bd6014ddd811aedd7)
ALTER TABLE `kinton`.`virtualimage` ADD CONSTRAINT `virtualImage_FK9` FOREIGN KEY (`idEnterprise`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-165', '2.0.3', '3:66e0aecdb3e6496bd6014ddd811aedd7', 249);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-166::destevezg (generated)::(Checksum: 3:490d988acc72011b15b3cdd2c054c1d0)
ALTER TABLE `kinton`.`virtualimage` ADD CONSTRAINT `virtualImage_FK8` FOREIGN KEY (`idMaster`) REFERENCES `kinton`.`virtualimage` (`idImage`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-166', '2.0.3', '3:490d988acc72011b15b3cdd2c054c1d0', 250);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-167::destevezg (generated)::(Checksum: 3:8d0283f48802ab658df52a67d2b84168)
ALTER TABLE `kinton`.`virtualimage` ADD CONSTRAINT `virtualImage_FK3` FOREIGN KEY (`idRepository`) REFERENCES `kinton`.`repository` (`idRepository`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-167', '2.0.3', '3:8d0283f48802ab658df52a67d2b84168', 251);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-168::destevezg (generated)::(Checksum: 3:43369b643b83dbf4abc3cdd88dea9e55)
ALTER TABLE `kinton`.`virtualimage_conversions` ADD CONSTRAINT `idImage_FK` FOREIGN KEY (`idImage`) REFERENCES `kinton`.`virtualimage` (`idImage`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-168', '2.0.3', '3:43369b643b83dbf4abc3cdd88dea9e55', 252);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-169::destevezg (generated)::(Checksum: 3:0e024cd1c55e694b36db28daef7be341)
ALTER TABLE `kinton`.`virtualmachine` ADD CONSTRAINT `virtualmachine_conversion_FK` FOREIGN KEY (`idConversion`) REFERENCES `kinton`.`virtualimage_conversions` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-169', '2.0.3', '3:0e024cd1c55e694b36db28daef7be341', 253);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-170::destevezg (generated)::(Checksum: 3:448b288afac7932843f109c4c8150cf7)
ALTER TABLE `kinton`.`virtualmachine` ADD CONSTRAINT `virtualMachine_datastore_FK` FOREIGN KEY (`idDatastore`) REFERENCES `kinton`.`datastore` (`idDatastore`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-170', '2.0.3', '3:448b288afac7932843f109c4c8150cf7', 254);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-171::destevezg (generated)::(Checksum: 3:fe98b32bbffe0d24efb06fbbee891dd5)
ALTER TABLE `kinton`.`virtualmachine` ADD CONSTRAINT `virtualMachine_FK5` FOREIGN KEY (`idEnterprise`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-171', '2.0.3', '3:fe98b32bbffe0d24efb06fbbee891dd5', 255);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-172::destevezg (generated)::(Checksum: 3:039a3cb6e568637b87fa0c4d1fd751fb)
ALTER TABLE `kinton`.`virtualmachine` ADD CONSTRAINT `virtualMachine_FK1` FOREIGN KEY (`idHypervisor`) REFERENCES `kinton`.`hypervisor` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-172', '2.0.3', '3:039a3cb6e568637b87fa0c4d1fd751fb', 256);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-173::destevezg (generated)::(Checksum: 3:89b532248fcd75b771983698562696a0)
ALTER TABLE `kinton`.`virtualmachine` ADD CONSTRAINT `virtualMachine_FK3` FOREIGN KEY (`idImage`) REFERENCES `kinton`.`virtualimage` (`idImage`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-173', '2.0.3', '3:89b532248fcd75b771983698562696a0', 257);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-174::destevezg (generated)::(Checksum: 3:648895356db22362b96054e955327394)
ALTER TABLE `kinton`.`virtualmachine` ADD CONSTRAINT `virtualMachine_FK4` FOREIGN KEY (`idUser`) REFERENCES `kinton`.`user` (`idUser`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-174', '2.0.3', '3:648895356db22362b96054e955327394', 258);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-175::destevezg (generated)::(Checksum: 3:45fabe26bed9e78a381e00f57a8106fe)
ALTER TABLE `kinton`.`virtualmachine` ADD CONSTRAINT `virtualMachine_FK6` FOREIGN KEY (`network_configuration_id`) REFERENCES `kinton`.`network_configuration` (`network_configuration_id`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-175', '2.0.3', '3:45fabe26bed9e78a381e00f57a8106fe', 259);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-176::destevezg (generated)::(Checksum: 3:29df9763e7f45787933eedc0d93753a0)
ALTER TABLE `kinton`.`virtualmachinetrackedstate` ADD CONSTRAINT `VirtualMachineTrackedState_FK1` FOREIGN KEY (`idVM`) REFERENCES `kinton`.`virtualmachine` (`idVM`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-176', '2.0.3', '3:29df9763e7f45787933eedc0d93753a0', 260);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-177::destevezg (generated)::(Checksum: 3:e82153ad84d182e5f828cd744af702fd)
ALTER TABLE `kinton`.`vlan_network` ADD CONSTRAINT `vlannetwork_enterprise_FK` FOREIGN KEY (`enterprise_id`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-177', '2.0.3', '3:e82153ad84d182e5f828cd744af702fd', 261);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-178::destevezg (generated)::(Checksum: 3:8ba1097cdbd056308fd5aba20d89345e)
ALTER TABLE `kinton`.`vlan_network` ADD CONSTRAINT `vlannetwork_configuration_FK` FOREIGN KEY (`network_configuration_id`) REFERENCES `kinton`.`network_configuration` (`network_configuration_id`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-178', '2.0.3', '3:8ba1097cdbd056308fd5aba20d89345e', 262);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-179::destevezg (generated)::(Checksum: 3:b5b66d52f3615106dbf5b81be8aeead0)
ALTER TABLE `kinton`.`vlan_network` ADD CONSTRAINT `vlannetwork_network_FK` FOREIGN KEY (`network_id`) REFERENCES `kinton`.`network` (`network_id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-179', '2.0.3', '3:b5b66d52f3615106dbf5b81be8aeead0', 263);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-180::destevezg (generated)::(Checksum: 3:10999a3fbaadde9cf33ad4b3dabdad36)
ALTER TABLE `kinton`.`vlan_network_assignment` ADD CONSTRAINT `vlan_network_assignment_idRack_FK` FOREIGN KEY (`idRack`) REFERENCES `kinton`.`rack` (`idRack`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-180', '2.0.3', '3:10999a3fbaadde9cf33ad4b3dabdad36', 264);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-181::destevezg (generated)::(Checksum: 3:e0bcbb3f28283f516bd242be82ac242c)
ALTER TABLE `kinton`.`vlan_network_assignment` ADD CONSTRAINT `vlan_network_assignment_idVirtualDataCenter_FK` FOREIGN KEY (`idVirtualDataCenter`) REFERENCES `kinton`.`virtualdatacenter` (`idVirtualDataCenter`) ON UPDATE NO ACTION ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-181', '2.0.3', '3:e0bcbb3f28283f516bd242be82ac242c', 265);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-182::destevezg (generated)::(Checksum: 3:eda88ebcb0ae4b0237caab929c1aea15)
ALTER TABLE `kinton`.`vlan_network_assignment` ADD CONSTRAINT `vlan_network_assignment_networkid_FK` FOREIGN KEY (`vlan_network_id`) REFERENCES `kinton`.`vlan_network` (`vlan_network_id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-182', '2.0.3', '3:eda88ebcb0ae4b0237caab929c1aea15', 266);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-183::destevezg (generated)::(Checksum: 3:8261f126803cf01ac95fc860bf05683c)
ALTER TABLE `kinton`.`vlans_dhcpOption` ADD CONSTRAINT `fk_vlans_dhcp_dhcp` FOREIGN KEY (`idDhcpOption`) REFERENCES `kinton`.`dhcpOption` (`idDhcpOption`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-183', '2.0.3', '3:8261f126803cf01ac95fc860bf05683c', 267);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-184::destevezg (generated)::(Checksum: 3:2e17ee385fe1756792aa18f36c7cf467)
ALTER TABLE `kinton`.`vlans_dhcpOption` ADD CONSTRAINT `fk_vlans_dhcp_vlan` FOREIGN KEY (`idVlan`) REFERENCES `kinton`.`vlan_network` (`vlan_network_id`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-184', '2.0.3', '3:2e17ee385fe1756792aa18f36c7cf467', 268);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-185::destevezg (generated)::(Checksum: 3:80a62ee2317a6712e5807f3f6d0ba197)
ALTER TABLE `kinton`.`volume_management` ADD CONSTRAINT `volumemanagement_FK3` FOREIGN KEY (`idImage`) REFERENCES `kinton`.`virtualimage` (`idImage`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-185', '2.0.3', '3:80a62ee2317a6712e5807f3f6d0ba197', 269);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-186::destevezg (generated)::(Checksum: 3:7aae02e0bacd25676d9e6dd34e96732e)
ALTER TABLE `kinton`.`volume_management` ADD CONSTRAINT `idManagement_FK` FOREIGN KEY (`idManagement`) REFERENCES `kinton`.`rasd_management` (`idManagement`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-186', '2.0.3', '3:7aae02e0bacd25676d9e6dd34e96732e', 270);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-187::destevezg (generated)::(Checksum: 3:b623134004ac65bccbd18f8b166a65a3)
ALTER TABLE `kinton`.`volume_management` ADD CONSTRAINT `idStorage_FK` FOREIGN KEY (`idStorage`) REFERENCES `kinton`.`storage_pool` (`idStorage`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-187', '2.0.3', '3:b623134004ac65bccbd18f8b166a65a3', 271);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-188::destevezg (generated)::(Checksum: 3:727265749266ca7e5cd2363a313d6423)
ALTER TABLE `kinton`.`workload_enterprise_exclusion_rule` ADD CONSTRAINT `FK_eerule_enterprise_1` FOREIGN KEY (`idEnterprise1`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-188', '2.0.3', '3:727265749266ca7e5cd2363a313d6423', 272);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-189::destevezg (generated)::(Checksum: 3:6ff99a1ad8e39d4f80c918cefe816932)
ALTER TABLE `kinton`.`workload_enterprise_exclusion_rule` ADD CONSTRAINT `FK_eerule_enterprise_2` FOREIGN KEY (`idEnterprise2`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-189', '2.0.3', '3:6ff99a1ad8e39d4f80c918cefe816932', 273);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-190::destevezg (generated)::(Checksum: 3:c2b5d1e4466e21627abaa7ad015fff4e)
ALTER TABLE `kinton`.`workload_fit_policy_rule` ADD CONSTRAINT `FK_fprule_datacenter` FOREIGN KEY (`idDatacenter`) REFERENCES `kinton`.`datacenter` (`idDataCenter`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-190', '2.0.3', '3:c2b5d1e4466e21627abaa7ad015fff4e', 274);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-191::destevezg (generated)::(Checksum: 3:f6bf190b5e4a59f02bcc3db933b369ec)
ALTER TABLE `kinton`.`workload_machine_load_rule` ADD CONSTRAINT `FK_mlrule_datacenter` FOREIGN KEY (`idDatacenter`) REFERENCES `kinton`.`datacenter` (`idDataCenter`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-191', '2.0.3', '3:f6bf190b5e4a59f02bcc3db933b369ec', 275);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-192::destevezg (generated)::(Checksum: 3:19d7e4f37a06adf14f372a57f894026d)
ALTER TABLE `kinton`.`workload_machine_load_rule` ADD CONSTRAINT `FK_mlrule_machine` FOREIGN KEY (`idMachine`) REFERENCES `kinton`.`physicalmachine` (`idPhysicalMachine`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-192', '2.0.3', '3:19d7e4f37a06adf14f372a57f894026d', 276);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337848104277-193::destevezg (generated)::(Checksum: 3:98e3e9fbffc688e3cdf0a6f62cc886ab)
ALTER TABLE `kinton`.`workload_machine_load_rule` ADD CONSTRAINT `FK_mlrule_rack` FOREIGN KEY (`idRack`) REFERENCES `kinton`.`rack` (`idRack`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337848104277-193', '2.0.3', '3:98e3e9fbffc688e3cdf0a6f62cc886ab', 277);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337866919799-3::destevezg (generated)::(Checksum: 3:87349e83626f9fb90db22db902f3b164)
ALTER TABLE `kinton`.`diskstateful_conversions` ADD CONSTRAINT `idManagement_FK2` FOREIGN KEY (`idManagement`) REFERENCES `kinton`.`volume_management` (`idManagement`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337866919799-3', '2.0.3', '3:87349e83626f9fb90db22db902f3b164', 278);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337866919799-4::destevezg (generated)::(Checksum: 3:ac5709e413466a1f11ac597a7c5a585e)
ALTER TABLE `kinton`.`initiator_mapping` ADD CONSTRAINT `volume_managementFK_1` FOREIGN KEY (`idManagement`) REFERENCES `kinton`.`volume_management` (`idManagement`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337866919799-4', '2.0.3', '3:ac5709e413466a1f11ac597a7c5a585e', 279);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337866919799-5::destevezg (generated)::(Checksum: 3:258283ddc293a5413837c04174818f97)
ALTER TABLE `kinton`.`node_virtual_image_stateful_conversions` ADD CONSTRAINT `idManagement_FK4` FOREIGN KEY (`idManagement`) REFERENCES `kinton`.`volume_management` (`idManagement`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337866919799-5', '2.0.3', '3:258283ddc293a5413837c04174818f97', 280);

-- Changeset src/2.0ga/kinton-2.0ga.xml::1337866919799-6::destevezg (generated)::(Checksum: 3:4026921db5863970af971d6346b563ed)
ALTER TABLE `kinton`.`node_virtual_image_stateful_conversions` ADD CONSTRAINT `idNodeVirtualImage_FK4` FOREIGN KEY (`idNodeVirtualImage`) REFERENCES `kinton`.`nodevirtualimage` (`idNode`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0ga/kinton-2.0ga.xml', '1337866919799-6', '2.0.3', '3:4026921db5863970af971d6346b563ed', 281);

-- Changeset src/2.0.0-HF1/kinton-2.0.0-HF1.xml::1336469245439-1::destevezg (generated)::(Checksum: 3:e2dcb29ad5406df0802012ef391de0ff)
ALTER TABLE `kinton`.`category` ADD `idEnterprise` INT UNSIGNED;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Column', 'EXECUTED', 'src/2.0.0-HF1/kinton-2.0.0-HF1.xml', '1336469245439-1', '2.0.3', '3:e2dcb29ad5406df0802012ef391de0ff', 282);

-- Changeset src/2.0.0-HF1/kinton-2.0.0-HF1.xml::1336469245439-2::destevezg (generated)::(Checksum: 3:7c8e1ea0630376b5d6124083673e4b1e)
ALTER TABLE `kinton`.`category` ADD CONSTRAINT `category_enterprise_FK` FOREIGN KEY (`idEnterprise`) REFERENCES `kinton`.`enterprise` (`idEnterprise`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.0.0-HF1/kinton-2.0.0-HF1.xml', '1336469245439-2', '2.0.3', '3:7c8e1ea0630376b5d6124083673e4b1e', 283);

-- Changeset src/2.0.0-HF1/kinton-2.0.0-HF1.xml::1336469245439-3::destevezg (generated)::(Checksum: 3:9fa54ec9f24cfe1738d991eb1ba27029)
DROP INDEX `name` ON `kinton`.`category`;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Index', 'EXECUTED', 'src/2.0.0-HF1/kinton-2.0.0-HF1.xml', '1336469245439-3', '2.0.3', '3:9fa54ec9f24cfe1738d991eb1ba27029', 284);

-- Changeset src/2.0.0-HF1/kinton-2.0.0-HF1.xml::1336469245439-4::destevezg (generated)::(Checksum: 3:d395cdedeb298779d6b6ffe8227a3145)
CREATE UNIQUE INDEX `name` ON `kinton`.`category`(`name`, `idEnterprise`);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Create Index', 'EXECUTED', 'src/2.0.0-HF1/kinton-2.0.0-HF1.xml', '1336469245439-4', '2.0.3', '3:d395cdedeb298779d6b6ffe8227a3145', 285);

-- Changeset src/2.0.0-HF1/kinton-2.0.0-HF1.xml::new_roles::destevezg (generated)::(Checksum: 3:af3b0c4fbec8b55829ccb6bb719d853f)
INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (51, 'USERS_MANAGE_CHEF_ENTERPRISE', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (52, 'MANAGE_HARD_DISKS', 0);

INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (53, 'APPLIB_MANAGE_GLOBAL_CATEGORIES', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x3)', 'EXECUTED', 'src/2.0.0-HF1/kinton-2.0.0-HF1.xml', 'new_roles', '2.0.3', '3:af3b0c4fbec8b55829ccb6bb719d853f', 286);

-- Changeset src/2.0.0-HF1/kinton-2.0.0-HF1.xml::new_roles_privileges::destevezg (generated)::(Checksum: 3:47cd29b2bef41ce1030a4ff606a13247)
INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (51, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (52, 1, 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (53, 1, 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row (x3)', 'EXECUTED', 'src/2.0.0-HF1/kinton-2.0.0-HF1.xml', 'new_roles_privileges', '2.0.3', '3:47cd29b2bef41ce1030a4ff606a13247', 287);

-- Changeset src/2.0.0-HF1/kinton-2.0.0-HF1.xml::new_system_properties::destevezg (generated)::(Checksum: 3:fd220730402f42a743fb053338d61469)
INSERT INTO `kinton`.`system_properties` (`description`, `name`, `value`, `version_c`) VALUES ('Show (1) or hide (0) hard disk tab', 'client.main.showHardDisk', '1', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.0.0-HF1/kinton-2.0.0-HF1.xml', 'new_system_properties', '2.0.3', '3:fd220730402f42a743fb053338d61469', 288);

-- Changeset src/2.0.0-HF1/kinton-2.0.0-HF1.xml::fix_availableVirtualDatacenters::destevezg (generated)::(Checksum: 3:db92fadc2e165d504c60c4a50b2647ab)
-- Change to NULL to avoid an empty string for the property availableVirtualDatacenters
UPDATE IGNORE user SET availableVirtualDatacenters = NULL WHERE availableVirtualDatacenters = "";

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', 'Change to NULL to avoid an empty string for the property availableVirtualDatacenters', NOW(), 'Custom SQL', 'EXECUTED', 'src/2.0.0-HF1/kinton-2.0.0-HF1.xml', 'fix_availableVirtualDatacenters', '2.0.3', '3:db92fadc2e165d504c60c4a50b2647ab', 289);

-- Changeset src/2.0.0-HF1/kinton-2.0.0-HF1.xml::Triggerschangedfor2.0HF1::destevez::(Checksum: 3:5d23aff108d74c5aa470120df95d9ba1)
DROP TRIGGER IF EXISTS create_nodevirtualimage_update_stats;

DROP TRIGGER IF EXISTS delete_nodevirtualimage_update_stats;

DROP TRIGGER IF EXISTS update_virtualmachine_update_stats;

DROP TRIGGER IF EXISTS update_virtualapp_update_stats;

DELIMITER |
CREATE TRIGGER create_nodevirtualimage_update_stats AFTER INSERT ON nodevirtualimage
  FOR EACH ROW BEGIN
    DECLARE idDataCenterObj INTEGER;
    DECLARE idVirtualAppObj INTEGER;
    DECLARE idVirtualDataCenterObj INTEGER;
    DECLARE idEnterpriseObj INTEGER;
    DECLARE costCodeObj int(4);
    DECLARE type INTEGER;
    DECLARE state VARCHAR(50);
    DECLARE ram INTEGER;
    DECLARE cpu INTEGER;
    DECLARE hd bigint;
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
    SELECT vapp.idVirtualApp, vapp.idVirtualDataCenter, vdc.idDataCenter, vdc.idEnterprise  INTO idVirtualAppObj, idVirtualDataCenterObj, idDataCenterObj, idEnterpriseObj
      FROM node n, virtualapp vapp, virtualdatacenter vdc
      WHERE vdc.idVirtualDataCenter = vapp.idVirtualDataCenter
      AND n.idNode = NEW.idNode
      AND n.idVirtualApp = vapp.idVirtualApp;
      SELECT vm.idType, vm.state, vm.cpu, vm.ram, vm.hd INTO type, state, cpu, ram, hd
     FROM virtualmachine vm
	WHERE vm.idVM = NEW.idVM;
      --  INSERT INTO debug_msg (msg) VALUES (CONCAT('createNVI ', type, ' - ', state, ' - ', IFNULL(idDataCenterObj,'NULL'), ' - ',IFNULL(idVirtualAppObj,'NULL'), ' - ',IFNULL(idVirtualDataCenterObj,'NULL')));
    IF type=1 THEN
    	-- Imported !!!
		UPDATE IGNORE cloud_usage_stats SET vMachinesTotal = vMachinesTotal+1
                WHERE idDataCenter = idDataCenterObj;
                UPDATE IGNORE vapp_enterprise_stats SET vmCreated = vmCreated+1
                WHERE idVirtualApp = idVirtualAppObj;
                UPDATE IGNORE vdc_enterprise_stats SET vmCreated = vmCreated+1
                WHERE idVirtualDataCenter = idVirtualDataCenterObj;
          IF state = "ON" THEN 	
			UPDATE IGNORE vapp_enterprise_stats SET vmActive = vmActive+1
		        WHERE idVirtualApp = idVirtualAppObj;
		        UPDATE IGNORE vdc_enterprise_stats SET vmActive = vmActive+1
		        WHERE idVirtualDataCenter = idVirtualDataCenterObj;
		        UPDATE IGNORE cloud_usage_stats SET vMachinesRunning = vMachinesRunning+1
		        WHERE idDataCenter = idDataCenterObj;       
		        UPDATE IGNORE enterprise_resources_stats 
		            SET vCpuUsed = vCpuUsed + cpu,
		                memoryUsed = memoryUsed + ram,
		                localStorageUsed = localStorageUsed + hd
		        WHERE idEnterprise = idEnterpriseObj;
		        UPDATE IGNORE dc_enterprise_stats 
		        SET     vCpuUsed = vCpuUsed + cpu,
		            memoryUsed = memoryUsed + ram,
		            localStorageUsed = localStorageUsed + hd
		        WHERE idEnterprise = idEnterpriseObj AND idDataCenter = idDataCenterObj;
		        UPDATE IGNORE vdc_enterprise_stats 
		        SET     vCpuUsed = vCpuUsed + cpu,
		            memoryUsed = memoryUsed + ram,
		            localStorageUsed = localStorageUsed + hd
		        WHERE idVirtualDataCenter = idVirtualDataCenterObj;	
		END IF;
    END IF;    
    SELECT IF(vi.cost_code IS NULL, 0, vi.cost_code) INTO costCodeObj
        FROM virtualimage vi
        WHERE vi.idImage = NEW.idImage;
    IF EXISTS( SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVMRegisterEvents' ) THEN
       IF EXISTS(SELECT * FROM virtualimage vi WHERE vi.idImage=NEW.idImage) THEN 
	          CALL AccountingVMRegisterEvents(NEW.idVM, type, "NOT_ALLOCATED", state, "NOT_ALLOCATED", ram, cpu, hd, costCodeObj);
        END IF;              
     END IF;
    END IF;
  END;
|
DELIMITER ;

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

DELIMITER |
CREATE TRIGGER update_virtualapp_update_stats AFTER UPDATE ON virtualapp
  FOR EACH ROW BEGIN
    DECLARE numVMachinesCreated INTEGER;
    DECLARE vdcNameObj VARCHAR(45);
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
    -- V2V: Vmachines moved between VDC
  IF NEW.idVirtualDataCenter != OLD.idVirtualDataCenter THEN
	-- calculate vmachines total and running in this Vapp
	SELECT IF (COUNT(*) IS NULL, 0, COUNT(*)) INTO numVMachinesCreated
	FROM nodevirtualimage nvi, virtualmachine v, node n
	WHERE nvi.idNode IS NOT NULL
	AND v.idVM = nvi.idVM
	AND n.idNode = nvi.idNode
	AND n.idVirtualApp = NEW.idVirtualApp
	AND v.state != "NOT_ALLOCATED" AND v.state != "UNKNOWN"
	and v.idType = 1;
	UPDATE IGNORE vdc_enterprise_stats SET vmCreated = vmCreated- numVMachinesCreated WHERE idVirtualDataCenter = OLD.idVirtualDataCenter;
	UPDATE IGNORE vdc_enterprise_stats SET vmCreated = vmCreated+ numVMachinesCreated WHERE idVirtualDataCenter = NEW.idVirtualDataCenter;
	-- Changing VDC name in VAppStats
	SELECT vdc.name INTO vdcNameObj
	FROM virtualdatacenter vdc
	WHERE vdc.idVirtualDataCenter = NEW.idVirtualDataCenter;
	UPDATE IGNORE vapp_enterprise_stats SET vdcName = vdcNameObj WHERE idVirtualApp = NEW.idVirtualApp;
    END IF;
    -- Checks for changes
    IF OLD.name != NEW.name THEN
      -- Name changed !!!
      UPDATE IGNORE vapp_enterprise_stats SET vappName = NEW.name
      WHERE idVirtualApp = NEW.idVirtualApp;
    END IF;
  END IF;
  END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL (x4), SQL From File (x4)', 'EXECUTED', 'src/2.0.0-HF1/kinton-2.0.0-HF1.xml', 'Triggerschangedfor2.0HF1', '2.0.3', '3:5d23aff108d74c5aa470120df95d9ba1', 290);

-- Changeset src/2.0.0-HF3/kinton-2.0.0-HF3.xml::ABICLOUDPREMIUM-3908-calculate_cloud_usage_stats::destevez::(Checksum: 3:68385f363d412ac77ead3713a4cba021)
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

DROP PROCEDURE IF EXISTS get_datastore_size_by_dc;

DELIMITER |
CREATE PROCEDURE get_datastore_size_by_dc(IN idDC INT, OUT size BIGINT UNSIGNED)
BEGIN
    SELECT IF (SUM(ds_view.size) IS NULL,0,SUM(ds_view.size)) INTO size
    FROM (SELECT d.size as size FROM datastore d LEFT OUTER JOIN datastore_assignment da ON d.idDatastore = da.idDatastore 
    LEFT OUTER JOIN physicalmachine pm ON da.idPhysicalMachine = pm.idPhysicalMachine
    WHERE pm.idDataCenter = idDC AND d.enabled = 1 GROUP BY d.datastoreUuid) ds_view;
END;
|
DELIMITER ;

DROP PROCEDURE IF EXISTS get_datastore_used_size_by_dc;

DELIMITER |
CREATE PROCEDURE get_datastore_used_size_by_dc(IN idDC INT, OUT usedSize BIGINT UNSIGNED)
BEGIN
    SELECT IF (SUM(ds_view.usedSize) IS NULL,0,SUM(ds_view.usedSize)) INTO usedSize
    FROM (SELECT d.usedSize as usedSize FROM datastore d LEFT OUTER JOIN datastore_assignment da ON d.idDatastore = da.idDatastore
    LEFT OUTER JOIN physicalmachine pm ON da.idPhysicalMachine = pm.idPhysicalMachine
    WHERE pm.idDataCenter = idDC AND d.enabled = 1 GROUP BY d.datastoreUuid) ds_view;
END;
|
DELIMITER ;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File', 'EXECUTED', 'src/2.0.0-HF3/kinton-2.0.0-HF3.xml', 'ABICLOUDPREMIUM-3908-calculate_cloud_usage_stats', '2.0.3', '3:68385f363d412ac77ead3713a4cba021', 291);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-1::destevezg (generated)::(Checksum: 3:4441c84bd8a0fcebb40e9bb65aaf5191)
ALTER TABLE `kinton`.`pricingTemplate` ADD `memoryGB` DECIMAL(20,5) DEFAULT '0';

UPDATE pricingTemplate SET memoryGB = memoryMB/1024;

ALTER TABLE `kinton`.`pricingTemplate` DROP COLUMN `memoryMB`;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Column, Custom SQL, Drop Column', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-1', '2.0.3', '3:4441c84bd8a0fcebb40e9bb65aaf5191', 292);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-2::destevezg (generated)::(Checksum: 3:3e028861a9cd184465e4b26a3cfcb777)
ALTER TABLE `kinton`.`metering` MODIFY `user` VARCHAR(128) NOT NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Not-Null Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-2', '2.0.3', '3:3e028861a9cd184465e4b26a3cfcb777', 293);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-5::destevezg (generated)::(Checksum: 3:c79a9d931d4ba6ccb61f1169afba19a8)
ALTER TABLE `kinton`.`costCodeCurrency` ADD CONSTRAINT `idCurrency_FK` FOREIGN KEY (`idCurrency`) REFERENCES `kinton`.`currency` (`idCurrency`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-5', '2.0.3', '3:c79a9d931d4ba6ccb61f1169afba19a8', 294);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-7::destevezg (generated)::(Checksum: 3:5b51a053210935c51c948d0c7fa381dc)
ALTER TABLE `kinton`.`costCode` MODIFY `idCostCode` INT UNSIGNED AUTO_INCREMENT;

ALTER TABLE `kinton`.`pricingCostCode` ADD CONSTRAINT `pricingCostCode_FK2` FOREIGN KEY (`idPricingTemplate`) REFERENCES `kinton`.`pricingTemplate` (`idPricingTemplate`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Set Column as Auto-Increment, Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-7', '2.0.3', '3:5b51a053210935c51c948d0c7fa381dc', 295);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-8::destevezg (generated)::(Checksum: 3:18db5a13981a0ab6234d17f46e8eda05)
ALTER TABLE `kinton`.`pricingTier` ADD CONSTRAINT `pricingTier_FK2` FOREIGN KEY (`idPricingTemplate`) REFERENCES `kinton`.`pricingTemplate` (`idPricingTemplate`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-8', '2.0.3', '3:18db5a13981a0ab6234d17f46e8eda05', 296);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-9::destevezg (generated)::(Checksum: 3:51b22321576067fff7232c38f0ab65c8)
ALTER TABLE `kinton`.`pricingTier` ADD CONSTRAINT `pricingTier_FK1` FOREIGN KEY (`idTier`) REFERENCES `kinton`.`tier` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-9', '2.0.3', '3:51b22321576067fff7232c38f0ab65c8', 297);

-- Changeset src/2.2/kinton-2.2.xml::1336485500618-11::destevezg (generated)::(Checksum: 3:219c18769d18cef1d17381ba4a1bb5ce)
DROP TABLE `kinton`.`log`;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Table', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1336485500618-11', '2.0.3', '3:219c18769d18cef1d17381ba4a1bb5ce', 298);

-- Changeset src/2.2/kinton-2.2.xml::1337940808955-1::destevezg (generated)::(Checksum: 3:6f998f6f3e1878a5b204ced6fe8c34e4)
ALTER TABLE `kinton`.`metering` MODIFY `user` VARCHAR(128) NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Drop Not-Null Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1337940808955-1', '2.0.3', '3:6f998f6f3e1878a5b204ced6fe8c34e4', 299);

-- Changeset src/2.2/kinton-2.2.xml::1337940808955-5::destevezg (generated)::(Checksum: 3:6e1b2afc755e1e0933c651e6b5ee8eb7)
ALTER TABLE `kinton`.`costCodeCurrency` ADD CONSTRAINT `idCostCode_FK` FOREIGN KEY (`idCostCode`) REFERENCES `kinton`.`costCode` (`idCostCode`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1337940808955-5', '2.0.3', '3:6e1b2afc755e1e0933c651e6b5ee8eb7', 300);

-- Changeset src/2.2/kinton-2.2.xml::1337940808955-6::destevezg (generated)::(Checksum: 3:db624edc38a2e1cacb2ebe3a6156bccc)
ALTER TABLE `kinton`.`pricingCostCode` ADD CONSTRAINT `pricingCostCode_FK1` FOREIGN KEY (`idCostCode`) REFERENCES `kinton`.`costCode` (`idCostCode`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevezg (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', '1337940808955-6', '2.0.3', '3:db624edc38a2e1cacb2ebe3a6156bccc', 301);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3856::sacedo::(Checksum: 3:58ee105e73f736fa89b0804f646f73e4)
ALTER TABLE `kinton`.`virtualmachine` ADD `keymap` VARCHAR(255);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('sacedo', '', NOW(), 'Add Column', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3856', '2.0.3', '3:58ee105e73f736fa89b0804f646f73e4', 302);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698::zmalik::(Checksum: 3:ccd5c84bb742930df6ccd39f8fb552e5)
CREATE TABLE `kinton`.`scope` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `name` VARCHAR(255) DEFAULT 'auto_name' NOT NULL, `autoEnt` TINYINT(1) DEFAULT 0 NOT NULL, `autoDat` TINYINT(1) DEFAULT 0 NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_SCOPE` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

CREATE TABLE `kinton`.`scope_resource` (`id` INT UNSIGNED AUTO_INCREMENT NOT NULL, `idScope` INT UNSIGNED NOT NULL, `idResource` INT UNSIGNED NOT NULL, `resourceType` VARCHAR(64) DEFAULT 'auto_name' NOT NULL, `version_c` INT DEFAULT 0, CONSTRAINT `PK_SCOPE_RESOURCE` PRIMARY KEY (`id`)) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Create Table (x2)', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698', '2.0.3', '3:ccd5c84bb742930df6ccd39f8fb552e5', 303);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698-columns::zmalik::(Checksum: 3:0d7c4b7edc6c4c10d3f13e101d1151cf)
ALTER TABLE `kinton`.`role` ADD `idScope` INT UNSIGNED;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Add Column', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698-columns', '2.0.3', '3:0d7c4b7edc6c4c10d3f13e101d1151cf', 304);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698-constraints::zmalik::(Checksum: 3:8afd9227de5253e2a04506ad214a6931)
ALTER TABLE `kinton`.`scope_resource` ADD CONSTRAINT `fk_scope_resource_scope` FOREIGN KEY (`idScope`) REFERENCES `kinton`.`scope` (`id`) ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698-constraints', '2.0.3', '3:8afd9227de5253e2a04506ad214a6931', 305);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698-constraints1::zmalik::(Checksum: 3:bd3389b3752100eb6a4262004441e391)
ALTER TABLE `kinton`.`role` ADD CONSTRAINT `fk_role_scope` FOREIGN KEY (`idScope`) REFERENCES `kinton`.`scope` (`id`) ON DELETE SET NULL;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698-constraints1', '2.0.3', '3:bd3389b3752100eb6a4262004441e391', 306);

-- Changeset src/2.2/kinton-2.2.xml::fixWrongDBEngine::destevez::(Checksum: 3:c2313c070f2d1d0c561c27d2b46995ba)
ALTER TABLE metering ENGINE=InnoDB;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'fixWrongDBEngine', '2.0.3', '3:c2313c070f2d1d0c561c27d2b46995ba', 307);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698-update-and-inserts::zmalik::(Checksum: 3:2d4ecdd62de718f0b6f8e4b653909ebf)
INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (54, 'USERS_MANAGE_SCOPES', 0);

INSERT INTO `kinton`.`scope` (`autoDat`, `autoEnt`, `id`, `name`, `version_c`) VALUES (0, 0, 1, 'Global scope', 0);

UPDATE `kinton`.`role` SET `idScope` = '1';

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Insert Row (x2), Update Data', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698-update-and-inserts', '2.0.3', '3:2d4ecdd62de718f0b6f8e4b653909ebf', 308);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3698-admin::zmalik::(Checksum: 3:af289f7006bdc919bc053d038cbdbf25)
INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (54, 1, 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('zmalik', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3698-admin', '2.0.3', '3:af289f7006bdc919bc053d038cbdbf25', 309);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3875-0::jdevesa::(Checksum: 3:8d84d03c13f8b54bc6f46b47b3b4c6f2)
CREATE TABLE `kinton`.`dvd_management` (`idManagement` INT UNSIGNED NOT NULL, `idImage` INT UNSIGNED) engine innodb default charset=utf8;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jdevesa', '', NOW(), 'Create Table', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3875-0', '2.0.3', '3:8d84d03c13f8b54bc6f46b47b3b4c6f2', 310);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3875-1::jdevesa::(Checksum: 3:6a705cc1e1c2c2ba4a9eec6a0a430623)
ALTER TABLE `kinton`.`dvd_management` ADD CONSTRAINT `dvd_management_image_FK` FOREIGN KEY (`idImage`) REFERENCES `kinton`.`virtualimage` (`idImage`) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jdevesa', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3875-1', '2.0.3', '3:6a705cc1e1c2c2ba4a9eec6a0a430623', 311);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3875-2::jdevesa::(Checksum: 3:423310274c7be31be9d4435fca0d23f6)
ALTER TABLE `kinton`.`dvd_management` ADD CONSTRAINT `dvd_idManagement_FK` FOREIGN KEY (`idManagement`) REFERENCES `kinton`.`rasd_management` (`idManagement`) ON UPDATE NO ACTION ON DELETE CASCADE;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jdevesa', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3875-2', '2.0.3', '3:423310274c7be31be9d4435fca0d23f6', 312);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-4033::xthevenot::(Checksum: 3:ee17d425d7bbd7981fff90e0876dec5f)
INSERT INTO `kinton`.`system_properties` (`description`, `name`, `value`, `version_c`) VALUES ('Default index view (0 is the Home, 1 Infrastructure, ...)', 'client.main.defaultView', '0', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('xthevenot', '', NOW(), 'Insert Row', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-4033', '2.0.3', '3:ee17d425d7bbd7981fff90e0876dec5f', 313);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-4344::xthevenot::(Checksum: 3:413e9afa18ea719bd4c58a7c468fdd6e)
INSERT INTO `kinton`.`system_properties` (`description`, `name`, `value`, `version_c`) VALUES ('Show soft limit info (1 show, 0 hide)', 'client.main.showSoftInfo', '1', 0);

INSERT INTO `kinton`.`system_properties` (`description`, `name`, `value`, `version_c`) VALUES ('Show hard limit info (1 show, 0 hide)', 'client.main.showHardInfo', '1', 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('xthevenot', '', NOW(), 'Insert Row (x2)', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-4344', '2.0.3', '3:413e9afa18ea719bd4c58a7c468fdd6e', 314);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3910::xthevenot::(Checksum: 3:d6ef777a6b393e0a780b4a233d4c6884)
INSERT INTO `kinton`.`privilege` (`idPrivilege`, `name`, `version_c`) VALUES (55, 'USERS_MANAGE_RESERVED_MACHINES', 0);

INSERT INTO `kinton`.`roles_privileges` (`idPrivilege`, `idRole`, `version_c`) VALUES (55, 1, 0);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('xthevenot', '', NOW(), 'Insert Row (x2)', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3910', '2.0.3', '3:d6ef777a6b393e0a780b4a233d4c6884', 315);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-4407::xthevenot::(Checksum: 3:7eb210f7ec2e3d8c4db8200a88d892bd)
UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Allocation+Rules#ManageAllocationRules-DatacenterRulesManagement' WHERE name='client.wiki.allocation.datacenter' AND value='http://community.abiquo.com/display/ABI20/Manage+Allocation+Rules#ManageAllocationRules-DatacenterRulesManagement';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Allocation+Rules#ManageAllocationRules-GlobalRulesManagement' WHERE name='client.wiki.allocation.global' AND value='http://community.abiquo.com/display/ABI20/Manage+Allocation+Rules#ManageAllocationRules-GlobalRulesManagement';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Adding+VM+Templates+to+the+Appliance+Library#AddingVMTemplatestotheApplianceLibrary-UploadingfromtheLocalFilesystem' WHERE name='client.wiki.apps.uploadVM' AND value='http://community.abiquo.com/display/ABI20/Adding+VM+Templates+to+the+Appliance+Library#AddingVMTemplatestotheApplianceLibrary-UploadingfromtheLocalFilesystem';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Configuration+view' WHERE name='client.wiki.config.general' AND value='http://community.abiquo.com/display/ABI20/Configuration+view';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Configuration+view#ConfigurationView-Heartbeat' WHERE name='client.wiki.config.heartbeat' AND value='http://community.abiquo.com/display/ABI20/Configuration+view#ConfigurationView-Heartbeating';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Configuration+view#ConfigurationView-LicenseManagement' WHERE name='client.wiki.config.licence' AND value='http://community.abiquo.com/display/ABI20/Configuration+view#ConfigurationView-LicenseManagement';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI20/Configuration+view#Configurationview-ProductRegistration' WHERE name='client.wiki.config.registration' AND value='http://community.abiquo.com/display/ABI20/Configuration+view#Configurationview-ProductRegistration';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Abiquo+Documentation+Home' WHERE name='client.wiki.defaultURL' AND value='http://community.abiquo.com/display/ABI20/Abiquo+Documentation+Home';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Physical+Machines#ManagePhysicalMachines-DatastoreManagement' WHERE name='client.wiki.infra.addDatastore' AND value='http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-DatastoreManagement';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Managing+Datacenters#ManagingDatacenters-CreatingaDatacenter' WHERE name='client.wiki.infra.createDatacenter' AND value='http://community.abiquo.com/display/ABI20/Managing+Datacenters#ManagingDatacenters-CreatingaDatacenter';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Physical+Machines#ManagePhysicalMachines-CreatingMultiplePhysicalMachines' WHERE name='client.wiki.infra.createMultiplePhysicalMachine' AND value='http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-CreatingMultiplePhysicalMachines';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Physical+Machines#ManagePhysicalMachines-CreatingPhysicalMachinesonStandardRacks' WHERE name='client.wiki.infra.createPhysicalMachine' AND value='http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-CreatingPhysicalMachinesonStandardRacks';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Racks#ManageRacks-CreatingRacks' WHERE name='client.wiki.infra.createRack' AND value='http://community.abiquo.com/display/ABI20/Manage+Racks#ManageRacks-CreatingRacks';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Physical+Machines#ManagePhysicalMachines-DiscoveringBladesonManagedRacks' WHERE name='client.wiki.infra.discoverBlades' AND value='http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-DiscoveringBladesonManagedRacks';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Managing+Datacenters#ManagingDatacenters-ModifyingaDatacenter' WHERE name='client.wiki.infra.editDatacenter' AND value='http://community.abiquo.com/display/ABI20/Managing+Datacenters#ManagingDatacenters-ModifyingaDatacenter';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Managing+Datacenters#ManagingDatacenters-RemoteServices' WHERE name='client.wiki.infra.editRemoteService' AND value='http://community.abiquo.com/display/ABI20/Managing+Datacenters#ManagingDatacenters-RemoteServices';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Physical+Machines#ManagePhysicalMachines-SendingEmailNotifications' WHERE name='client.wiki.infra.mailNotification' AND value='http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-SendingEmailNotifications';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Network+Configuration#ManageNetworkConfiguration-CreateVLANsforPublicNetworks' WHERE name='client.wiki.network.publicVlan' AND value='http://community.abiquo.com/display/ABI20/Manage+Network+Configuration#ManageNetworkConfiguration-CreateVLANsforPublicNetworks';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Network+Configuration#ManageNetworkConfiguration-ConfiguringStaticRoutesUsingDHCPforPublicandExternalNetworks' WHERE name='client.wiki.network.staticRoutes' AND value='http://community.abiquo.com/display/ABI20/Manage+Network+Configuration#ManageNetworkConfiguration-ConfiguringStaticRoutesUsingDHCP';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Pricing+View#PricingView-CostCodesTab' WHERE name='client.wiki.pricing.createCostCode' AND value='http://community.abiquo.com/display/ABI20/Pricing+View#PricingView-CostCodesTab';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Pricing+View#PricingView-CurrenciesTab' WHERE name='client.wiki.pricing.createCurrency' AND value='http://community.abiquo.com/display/ABI20/Pricing+View#PricingView-CurrenciesTab';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Pricing+View#PricingView-PricingModelsTab' WHERE name='client.wiki.pricing.createTemplate' AND value='http://community.abiquo.com/display/ABI20/Pricing+View#PricingView-PricingModelsTab';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Managing+External+Storage#ManagingExternalStorage-ManagedStorage' WHERE name='client.wiki.storage.storageDevice' AND value='http://community.abiquo.com/display/ABI20/Managing+External+Storage#ManagingExternalStorage-ManagedStorage';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Managing+External+Storage#ManagingExternalStorage-StoragePools' WHERE name='client.wiki.storage.storagePool' AND value='http://community.abiquo.com/display/ABI20/Managing+External+Storage#ManagingExternalStorage-StoragePools';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Managing+External+Storage#ManagingExternalStorage-TierManagement' WHERE name='client.wiki.storage.tier' AND value='http://community.abiquo.com/display/ABI20/Managing+External+Storage#ManagingExternalStorage-TierManagement';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Enterprises#ManageEnterprises-CreatingorEditinganEnterprise' WHERE name='client.wiki.user.createEnterprise' AND value='http://community.abiquo.com/display/ABI20/Manage+Enterprises#ManageEnterprises-CreatingorEditinganEnterprise';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Roles' WHERE name='client.wiki.user.createRole' AND value='http://community.abiquo.com/display/ABI20/Manage+Roles+and+Privileges';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Users#ManageUsers-CreatingorEditingaUser' WHERE name='client.wiki.user.createUser' AND value='http://community.abiquo.com/display/ABI20/Manage+Users#ManageUsers-CreatingorEditingaUser';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Enterprises#ManageEnterprises-EdittheEnterprise%27sDatacenters' WHERE name='client.wiki.user.dataCenterLimits' AND value='http://community.abiquo.com/display/ABI20/Manage+Enterprises#ManageEnterprises-EdittheEnterprise%27sDatacenters';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Networks#ManageNetworks-CreateaPrivateVLAN' WHERE name='client.wiki.vdc.createPrivateNetwork' AND value='http://community.abiquo.com/display/ABI20/Manage+Networks#ManageNetworks-CreateaPrivateVLAN';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Networks#ManageNetworks-PublicIPReservation' WHERE name='client.wiki.vdc.createPublicNetwork' AND value='http://community.abiquo.com/display/ABI20/Manage+Networks#ManageNetworks-PublicIPReservation';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Basic+operations#BasicOperations-CreatingaNewVirtualAppliance' WHERE name='client.wiki.vdc.createVapp' AND value='http://community.abiquo.com/display/ABI20/Basic+operations#BasicOperations-CreatingaNewVirtualAppliance';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Virtual+Datacenters#ManageVirtualDatacenters-CreatingaVirtualDatacenter' WHERE name='client.wiki.vdc.createVdc' AND value='http://community.abiquo.com/display/ABI20/Manage+Virtual+Datacenters#ManageVirtualDatacenters-CreatingaVirtualDatacenter';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Virtual+Storage#ManageVirtualStorage-CreatingaVolumeofManagedStorage' WHERE name='client.wiki.vdc.createVolume' AND value='http://community.abiquo.com/display/ABI20/Manage+Virtual+Storage#ManageVirtualStorage-CreatingaVolumeofManagedStorage';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Configure+a+Virtual+Appliance#ConfigureaVirtualAppliance-CreateanInstance' WHERE name='client.wiki.vm.bundleVirtualMachine' AND value='http://community.abiquo.com/display/ABI20/Configure+a+Virtual+Appliance#ConfigureaVirtualAppliance-CreateanInstance';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Manage+Imported+Virtual+Machines' WHERE name='client.wiki.vm.captureVirtualMachine' AND value='http://community.abiquo.com/display/ABI20/Manage+Physical+Machines#ManagePhysicalMachines-WorkingwithImportedVirtualMachines';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Create+Virtual+Machine+instances' WHERE name='client.wiki.vm.createInstance' AND value='http://community.abiquo.com/display/ABI20/Create+Virtual+Machine+instances';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Configure+Virtual+Machines#ConfigureVirtualMachines-CreatingaNewNetworkInterface' WHERE name='client.wiki.vm.createNetworkInterface' AND value='http://community.abiquo.com/display/ABI20/Configure+Virtual+Machines#ConfigureVirtualMachines-CreatingaNewNetworkInterface';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Create+Persistent+Virtual+Machines' WHERE name='client.wiki.vm.createStateful' AND value='http://community.abiquo.com/display/ABI20/Create+Persistent+Virtual+Machines';

UPDATE `kinton`.`system_properties` SET `value` = 'http://community.abiquo.com/display/ABI22/Configure+Virtual+Machines' WHERE name='client.wiki.vm.editVirtualMachine' AND value='http://community.abiquo.com/display/ABI20/Configure+Virtual+Machines';

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('xthevenot', '', NOW(), 'Update Data (x40)', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-4407', '2.0.3', '3:7eb210f7ec2e3d8c4db8200a88d892bd', 316);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-3658::scastro::(Checksum: 3:76559c1d1d91c98c23197868335d8b30)
DROP TABLE `kinton`.`node_virtual_image_stateful_conversions`;

DROP TABLE `kinton`.`diskstateful_conversions`;

DROP TABLE `kinton`.`vappstateful_conversions`;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('scastro', '', NOW(), 'Drop Table (x3)', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3658', '2.0.3', '3:76559c1d1d91c98c23197868335d8b30', 317);

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

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3898', '2.0.3', '3:de10ff87abd570bc74a50ce7455b7720', 318);

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

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-3727', '2.0.3', '3:ce98b001ef068af5bcb4f1c2e37d5a28', 319);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-2435::destevez::(Checksum: 3:04d9543a931fc7e2ff308c00600f48aa)
DROP TRIGGER IF EXISTS update_ip_pool_management_update_stats;

DELIMITER |
CREATE TRIGGER update_ip_pool_management_update_stats AFTER UPDATE ON ip_pool_management
    FOR EACH ROW BEGIN
        DECLARE idDataCenterObj INTEGER;
        DECLARE idVirtualDataCenterObj INTEGER;
        DECLARE idEnterpriseObj INTEGER;
	   DECLARE networkTypeObj VARCHAR(15);
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   
		SELECT vn.networktype, dc.idDataCenter INTO networkTypeObj, idDataCenterObj
		FROM vlan_network vn, datacenter dc
		WHERE dc.network_id = vn.network_id
		AND OLD.vlan_network_id = vn.vlan_network_id;
		-- INSERT INTO debug_msg (msg) VALUES (CONCAT('update_ip_pool_management_update_stats', '-', OLD.ip, '-',OLD.available,'-', NEW.available,'-', IFNULL(networkTypeObj,'NULL'), '-', IFNULL(idDataCenterObj,'NULL')));
		IF networkTypeObj = 'PUBLIC' THEN		
			IF OLD.available=FALSE AND NEW.available=TRUE THEN
				UPDATE IGNORE cloud_usage_stats SET publicIPsTotal = publicIPsTotal+1 WHERE idDataCenter = idDataCenterObj;
			END IF;
			IF OLD.available=TRUE AND NEW.available=FALSE THEN
				UPDATE IGNORE cloud_usage_stats SET publicIPsTotal = publicIPsTotal-1 WHERE idDataCenter = idDataCenterObj;
			END IF;
		END IF;
	    -- Checks for public available 
            -- Checks for reserved IPs		
            IF OLD.mac IS NULL AND NEW.mac IS NOT NULL THEN
                -- Query for datacenter
                SELECT vdc.idDataCenter, vdc.idVirtualDataCenter, vdc.idEnterprise  INTO idDataCenterObj, idVirtualDataCenterObj, idEnterpriseObj
                FROM rasd_management rm, virtualdatacenter vdc, vlan_network vn
                WHERE vdc.idVirtualDataCenter = rm.idVirtualDataCenter
			AND NEW.vlan_network_id = vn.vlan_network_id
			AND vn.networktype = 'PUBLIC'
			AND NEW.idManagement = rm.idManagement;
                -- New Public IP assignment for a VDC ---> Reserved
                UPDATE IGNORE cloud_usage_stats SET publicIPsUsed = publicIPsUsed+1 WHERE idDataCenter = idDataCenterObj;
                UPDATE IGNORE enterprise_resources_stats SET publicIPsReserved = publicIPsReserved+1 WHERE idEnterprise = idEnterpriseObj;
                UPDATE IGNORE vdc_enterprise_stats SET publicIPsReserved = publicIPsReserved+1 WHERE idVirtualDataCenter = idVirtualDataCenterObj;
                UPDATE IGNORE dc_enterprise_stats SET publicIPsReserved = publicIPsReserved+1 WHERE idDataCenter = idDataCenterObj;
                IF (idDataCenterObj IS NOT NULL AND idVirtualDataCenterObj IS NOT NULL AND idEnterpriseObj IS NOT NULL) THEN
                	-- INSERT INTO debug_msg (msg) VALUES (CONCAT('Reserved IP: ',IFNULL(idEnterpriseObj,'entnull'),IFNULL(idDataCenterObj,'dcnull'),IFNULL(idVirtualDataCenterObj,'vdcnull')));
                	IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingIPsRegisterEvents' ) THEN
                    	CALL AccountingIPsRegisterEvents('IP_RESERVED',NEW.idManagement,NEW.ip,idVirtualDataCenterObj, idEnterpriseObj);
                	END IF;
                END IF;
            END IF;
        END IF;
    END;
|
DELIMITER ;

DELETE FROM accounting_event_ips WHERE idEnterprise=0 AND idVirtualDataCenter=0;

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File, Custom SQL', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-2435', '2.0.3', '3:04d9543a931fc7e2ff308c00600f48aa', 320);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-4059-4114-4417::destevez::(Checksum: 3:ce0db9bbe48b0e59292c3aa7ef1aae7a)
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
    WHERE vm.state IN ("ON","OFF","PAUSED")
    AND vm.idType = 1
    AND vm.idEnterprise = idEnterpriseObj;
    --
    SELECT IFNULL(SUM(limitResource),0) * 1048576  INTO extraHDUsed
	FROM rasd_management rm, rasd r, virtualmachine vm 
	WHERE rm.idResource = r.instanceID AND rm.idVM = vm.idVM AND rm.idResourceType=17
	AND vm.state IN ("ON","OFF","PAUSED")
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

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-4059-4114-4417', '2.0.3', '3:ce0db9bbe48b0e59292c3aa7ef1aae7a', 321);

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

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-4127-4114', '2.0.3', '3:be509954d54d99afb53946f5dcb9a2a6', 322);

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

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('destevez', '', NOW(), 'Custom SQL, SQL From File, Custom SQL, SQL From File', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-4114-4166', '2.0.3', '3:64ba2418c95dabffd34a95ede7aa3bf8', 323);

-- Changeset src/2.2/kinton-2.2.xml::ABICLOUDPREMIUM-4217::jdevesa::(Checksum: 3:b388a8f15cdd350e02dc8622a13bfdb9)
delete from rasd where instanceid not in (select idresource from rasd_management where idresource is not null);

INSERT INTO `kinton`.`DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jdevesa', '', NOW(), 'Custom SQL', 'EXECUTED', 'src/2.2/kinton-2.2.xml', 'ABICLOUDPREMIUM-4217', '2.0.3', '3:b388a8f15cdd350e02dc8622a13bfdb9', 324);

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
        CREATE INDEX obj_name_idx on kinton_accounting.object_name(objectName);
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
     SELECT idObject INTO id FROM kinton_accounting.object_name obj WHERE obj.objectName=objName;
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
     SELECT objectName INTO objName FROM kinton_accounting.object_name obj WHERE obj.idObject=idObj;
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
     SELECT enterpriseName INTO entName FROM kinton_accounting.ent_name ent WHERE ent.idEnterprise=id;
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
     SELECT vdcName INTO vName FROM kinton_accounting.vdc_name vdc WHERE vdc.idVirtualDataCenter=id;
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
     SELECT vappName INTO vName FROM kinton_accounting.vapp_name vapp WHERE vapp.idVirtualApp=id;
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
     SELECT vmName INTO vName FROM kinton_accounting.vm_name vm WHERE vm.idVM=id;
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
    DECLARE batch_size INT;
    DECLARE last_batch INT;
    DECLARE last_batch_size INT;
    DECLARE processed_startTime TIMESTAMP;
    DECLARE target_startTime TIMESTAMP;
    DECLARE migrationStartTime TIMESTAMP;

    DECLARE rowsToProcess BIGINT;
    DECLARE rowsProcessed BIGINT;

    IF EXISTS(SELECT * FROM information_schema.tables WHERE table_schema= 'kinton' AND table_name='accounting_event_detail' AND table_type='BASE TABLE') THEN
        SELECT CONCAT("Detected old kinton.accounting_event_detail table, will migrate data from it...") as " ";
        SELECT NOW() AS 'Migrate START';

        SELECT MAX(startTime) INTO processed_startTime FROM kinton_accounting.accounting_event_detail;
        IF (processed_startTime IS NULL) THEN
            SELECT TIMESTAMPADD(HOUR,-1,MIN(startTime)) INTO processed_startTime FROM kinton.accounting_event_detail;
        END IF;
        SELECT MAX(startTime), COUNT(*) INTO target_startTime, rowsToProcess FROM kinton.accounting_event_detail WHERE startTime > processed_startTime;
        SELECT 0 INTO rowsProcessed;

        SELECT CONCAT("Copying existing accounting data into optimized tables, migrating ", rowsToProcess, " accounting data rows from ", QUOTE(processed_startTime), " to ",  QUOTE(target_startTime)) as " ";

        # Create buffer variables and CREATE TMP table to hold intermediate data...
        SET last_batch=0;
        SELECT 100000 INTO batch_size;

        IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='tmp_accounting_event_detail') THEN
            CREATE TEMPORARY TABLE kinton_accounting.tmp_accounting_event_detail (
              `idAccountingEvent` bigint(20) NOT NULL auto_increment,
              `startTime` timestamp NOT NULL default '0000-00-00 00:00:00',
              `endTime` timestamp NOT NULL default '0000-00-00 00:00:00',
              `idAccountingResourceType` tinyint(4) NOT NULL,
              `resourceType` varchar(255) NOT NULL,
              `resourceUnits` bigint(20) NOT NULL,
              `resourceName` varchar(511) NOT NULL,
              `idEnterprise` int(11) unsigned NOT NULL,
              `idVirtualDataCenter` int(11) unsigned NOT NULL,
              `idVirtualApp` int(11) unsigned default NULL,
              `idVirtualMachine` int(11) unsigned default NULL,
              `enterpriseName` varchar(255) NOT NULL,
              `virtualDataCenter` varchar(255) NOT NULL,
              `virtualApp` varchar(255) DEFAULT NULL,
              `virtualMachine` varchar(255) DEFAULT NULL,
              `costCode` int(4) default NULL,
              `idStorageTier` int(10) default NULL,
              `version_c` int(11) default '0',
              PRIMARY KEY  (`idAccountingEvent`)
            ) ENGINE=InnoDB
            AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
        ELSE
            DELETE FROM kinton_accounting.tmp_accounting_event_detail;
        END IF;

        SELECT NOW() INTO migrationStartTime;
        WHILE (last_batch=0) DO
            SELECT CONCAT("Processing BATCH from ", QUOTE(processed_startTime), " target batch size is ",  QUOTE(batch_size)) as " ";
            
            # Read a small batch of data from the main table into a TMP table where it is easier to process
            PREPARE STMT FROM
                        "INSERT INTO kinton_accounting.tmp_accounting_event_detail
                        (   startTime, endTime,
                            idAccountingResourceType, resourceType, resourceUnits, resourceName, 
                            idEnterprise, idVirtualDataCenter, idVirtualApp, idVirtualMachine,
                            enterpriseName, virtualDataCenter, virtualApp, virtualMachine,
                            costCode, idStorageTier, version_c
                        )
                        SELECT startTime, endTime,
                            idAccountingResourceType, resourceType, resourceUnits, resourceName, 
                            idEnterprise, idVirtualDataCenter, idVirtualApp, idVirtualMachine,
                            enterpriseName, virtualDataCenter, virtualApp, virtualMachine,
                            costCode, idStorageTier, version_c
                        FROM kinton.accounting_event_detail
                        WHERE startTime > ?
                        ORDER BY startTime ASC LIMIT 0, ?";
            SET @pst = processed_startTime;
            set @bs = batch_size;
            EXECUTE STMT USING @pst, @bs;
            
            SELECT COUNT(*) INTO last_batch_size FROM kinton_accounting.tmp_accounting_event_detail;
            SELECT CONCAT("TMP table populated with a batch of ", QUOTE(last_batch_size), " rows") AS " ";

            IF (last_batch_size < batch_size) THEN
                SELECT CONCAT("Detected **LAST** BATCH to process!") AS " ";
                SELECT 1 INTO last_batch;
            ELSE
                # Remove any rows from this batch that may be in the next batch...
                SELECT MAX(startTime) INTO @batch_last_startTime FROM kinton_accounting.tmp_accounting_event_detail;
                
                SELECT CONCAT("Pruning entries with the following startTime from the batch - ", QUOTE(@batch_last_startTime)) AS " ";
                DELETE FROM kinton_accounting.tmp_accounting_event_detail WHERE startTime=@batch_last_startTime;
            END IF;

            #   Now INSERT the rows from the TMP table INTO kinton_accounting.accounting_event_detail...
            SELECT CONCAT("Inserting data from TMP table into new kinton_accounting.accounting_event_detail table...") AS " ";
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
                        `tmp_accounting_event_detail`.`startTime`  AS `startTime`,
                        `tmp_accounting_event_detail`.`endTime` AS `endTime`,
                        `tmp_accounting_event_detail`.`idAccountingResourceType` AS `idAccountingResourceType`,
                        `tmp_accounting_event_detail`.`resourceType` AS `resourceType`,
                        `tmp_accounting_event_detail`.`resourceName` AS `resourceName`,
                        MAX(`tmp_accounting_event_detail`.`resourceUnits`)  AS `resourceUnits`, # Use the max resources reported in the hour, where multiple entries exist!
                        `tmp_accounting_event_detail`.`idEnterprise` AS `idEnterprise`,
                        `tmp_accounting_event_detail`.`idVirtualDataCenter` AS `idVirtualDataCenter`,
                        `tmp_accounting_event_detail`.`idVirtualApp` AS `idVirtualApp`,
                        `tmp_accounting_event_detail`.`idVirtualMachine` AS `idVirtualMachine`,
                        `tmp_accounting_event_detail`.`enterpriseName` AS `enterpriseName`,
                        `tmp_accounting_event_detail`.`virtualDataCenter` AS `virtualDataCenter`,
                        `tmp_accounting_event_detail`.`virtualApp` AS `virtualApp`,
                        `tmp_accounting_event_detail`.`virtualMachine` AS `virtualMachine`,
                        `tmp_accounting_event_detail`.`costCode` AS `costCode`,
                        `tmp_accounting_event_detail`.`idStorageTier` AS `idStorageTier`,
                        version_c
                    FROM kinton_accounting.tmp_accounting_event_detail
                    GROUP BY 
                        `tmp_accounting_event_detail`.`startTime`,
                        `tmp_accounting_event_detail`.`endTime`,
                        `tmp_accounting_event_detail`.`idAccountingResourceType`,
                        `tmp_accounting_event_detail`.`resourceName`,
                        `tmp_accounting_event_detail`.`idEnterprise`,
                        `tmp_accounting_event_detail`.`idVirtualDataCenter`,
                        `tmp_accounting_event_detail`.`idVirtualApp`,
                        `tmp_accounting_event_detail`.`idVirtualMachine`,
                        `tmp_accounting_event_detail`.`costCode`
                ) TMP_HOURLY_USAGE_MAX_VW_EXTENDED;

            #SELECT CONCAT("Purging content of the TMP table...") AS " ";
            # Finally update the next startTime we should use for processing the next batch...
            SELECT MAX(startTime) INTO processed_startTime FROM kinton_accounting.tmp_accounting_event_detail;

            # And truncate the TMP table ready for the next batch of data...
            DELETE FROM kinton_accounting.tmp_accounting_event_detail;
            SELECT rowsProcessed + ROW_COUNT() INTO rowsProcessed;
            SELECT CONCAT("STATUS - Migration ", (rowsProcessed/rowsToProcess) * 100, "% Complete, estimated Time remaining is ",
                            ((TIMESTAMPDIFF(SECOND, migrationStartTime, NOW())/rowsProcessed) * (rowsToProcess - rowsProcessed))/60, " minutes.") AS " ";
        END WHILE;

        SELECT "Copy of existing accounting data complete!" as " ";
        SELECT NOW() AS 'Migrate STOP';
    ELSE
        SELECT "kinton_accounting.accounting_event_detail already migrated, so data migration was skipped!" as " ";
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
        `vm_name`.`vmName` AS `VIRTUAL_MACHINE`,
        `vapp_name`.`vappName` AS `VIRTUAL_APP`,
        `vdc_name`.`vdcName` AS `VIRTUAL_DATACENTER`,
        `ent_name`.`enterpriseName` AS `VIRTUAL_ENTERPRISE`
    FROM
        kinton.`accounting_event_vm`
        JOIN kinton_accounting.`vm_name` on(`accounting_event_vm`.`idVM` = kinton_accounting.`vm_name`.`idVM`)
        JOIN kinton_accounting.`vapp_name` on(`accounting_event_vm`.`idVirtualApp` = kinton_accounting.`vapp_name`.`idVirtualApp`)
        JOIN kinton_accounting.`vdc_name` on(`accounting_event_vm`.`idVirtualDataCenter` = kinton_accounting.`vdc_name`.`idVirtualDataCenter`)
        JOIN kinton_accounting.`ent_name` on(`accounting_event_vm`.`idEnterprise` = kinton_accounting.`ent_name`.`idEnterprise`)
    WHERE
        # Is currently active, and was active prior to the end of the account period
        (`accounting_event_vm`.`startTime` < period_end AND 
         (`accounting_event_vm`.stopTime IS NULL OR `accounting_event_vm`.stopTime >= period_end)) OR
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
        `vdc_name`.`vdcName` AS `VIRTUAL_DATACENTER`,
        `ent_name`.`enterpriseName` AS `VIRTUAL_ENTERPRISE` 
     FROM 
        kinton.`accounting_event_storage`
        JOIN kinton_accounting.`vdc_name` on(`accounting_event_storage`.`idVirtualDataCenter` = kinton_accounting.`vdc_name`.`idVirtualDataCenter`)
        JOIN kinton_accounting.`ent_name` on(`accounting_event_storage`.`idEnterprise` = kinton_accounting.`ent_name`.`idEnterprise`)
     WHERE 
        # Is currently active, and was active prior to the end of the account period
        (`accounting_event_storage`.`startTime` < period_end AND 
         (`accounting_event_storage`.stopTime IS NULL OR `accounting_event_storage`.stopTime >= period_end)) OR
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
        `vdc_name`.`vdcName` AS `VIRTUAL_DATACENTER`,
        `ent_name`.`enterpriseName` AS `VIRTUAL_ENTERPRISE` 
    FROM 
        kinton.`accounting_event_ips`
        JOIN kinton_accounting.`vdc_name` on(`accounting_event_ips`.`idVirtualDataCenter` = kinton_accounting.`vdc_name`.`idVirtualDataCenter`)
        JOIN kinton_accounting.`ent_name` on(`accounting_event_ips`.`idEnterprise` = kinton_accounting.`ent_name`.`idEnterprise`)
    WHERE
        # IP Is currently RESERVED, and was reserved prior to the end of the account period
        (`accounting_event_ips`.`startTime` < period_end AND 
         (`accounting_event_ips`.stopTime IS NULL OR `accounting_event_ips`.stopTime >= period_end)) OR
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
        `vdc_name`.`vdcName` AS `VIRTUAL_DATACENTER`,
        `ent_name`.`enterpriseName` AS `VIRTUAL_ENTERPRISE` 
    FROM 
        kinton.`accounting_event_vlan`
        JOIN kinton_accounting.`vdc_name` on(`accounting_event_vlan`.`idVirtualDataCenter` = kinton_accounting.`vdc_name`.`idVirtualDataCenter`)
        JOIN kinton_accounting.`ent_name` on(`accounting_event_vlan`.`idEnterprise` = kinton_accounting.`ent_name`.`idEnterprise`)
    WHERE 
        # VLAN is still Reserved
        (`accounting_event_vlan`.`startTime` < period_end AND 
         (`accounting_event_vlan`.stopTime IS NULL OR `accounting_event_vlan`.stopTime >= period_end)) OR
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
