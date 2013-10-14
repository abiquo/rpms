DROP DATABASE IF EXISTS kinton;
CREATE DATABASE IF NOT EXISTS kinton;
USE kinton;-- MySQL dump 10.14  Distrib 5.5.32-MariaDB, for Linux (x86_64)
--
-- Host: 10.60.20.42    Database: kinton
-- ------------------------------------------------------
-- Server version	5.5.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `CLOUD_STAT_DC_LIST`
--

DROP TABLE IF EXISTS `CLOUD_STAT_DC_LIST`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_LIST`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_DC_LIST` (
  `idDataCenter` tinyint NOT NULL,
  `uuid` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `situation` tinyint NOT NULL,
  `network_id` tinyint NOT NULL,
  `version_c` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_DC_PUBLIC_IP_STATS`
--

DROP TABLE IF EXISTS `CLOUD_STAT_DC_PUBLIC_IP_STATS`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_PUBLIC_IP_STATS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_DC_PUBLIC_IP_STATS` (
  `idDataCenter` tinyint NOT NULL,
  `publicIPsTotal` tinyint NOT NULL,
  `publicIPsReserved` tinyint NOT NULL,
  `publicIPsUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_DC_SERVER_STATS`
--

DROP TABLE IF EXISTS `CLOUD_STAT_DC_SERVER_STATS`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_SERVER_STATS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_DC_SERVER_STATS` (
  `idDatacenter` tinyint NOT NULL,
  `serversTotal` tinyint NOT NULL,
  `serversRunning` tinyint NOT NULL,
  `vCpuTotal` tinyint NOT NULL,
  `vMemoryTotal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_DC_STOARGE`
--

DROP TABLE IF EXISTS `CLOUD_STAT_DC_STOARGE`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_STOARGE`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_DC_STOARGE` (
  `idDataCenter` tinyint NOT NULL,
  `vStorageTotal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_DC_STOARGE_INNER`
--

DROP TABLE IF EXISTS `CLOUD_STAT_DC_STOARGE_INNER`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_STOARGE_INNER`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_DC_STOARGE_INNER` (
  `idDataCenter` tinyint NOT NULL,
  `datastoreUuid` tinyint NOT NULL,
  `size` tinyint NOT NULL,
  `datastoreUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_DC_STORAGE_TOTAL`
--

DROP TABLE IF EXISTS `CLOUD_STAT_DC_STORAGE_TOTAL`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_STORAGE_TOTAL`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_DC_STORAGE_TOTAL` (
  `idDataCenter` tinyint NOT NULL,
  `storageTotal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_DC_STORAGE_USED`
--

DROP TABLE IF EXISTS `CLOUD_STAT_DC_STORAGE_USED`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_STORAGE_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_DC_STORAGE_USED` (
  `idDataCenter` tinyint NOT NULL,
  `storageUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_DC_VLAN_RES`
--

DROP TABLE IF EXISTS `CLOUD_STAT_DC_VLAN_RES`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_VLAN_RES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_DC_VLAN_RES` (
  `idDataCenter` tinyint NOT NULL,
  `vlanReserved` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_DC_VM_STATS`
--

DROP TABLE IF EXISTS `CLOUD_STAT_DC_VM_STATS`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_VM_STATS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_DC_VM_STATS` (
  `idDataCenter` tinyint NOT NULL,
  `vMachinesRunning` tinyint NOT NULL,
  `vMachinesTotal` tinyint NOT NULL,
  `vCpuUsed` tinyint NOT NULL,
  `vMemoryUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_ENT_COUNT`
--

DROP TABLE IF EXISTS `CLOUD_STAT_ENT_COUNT`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_ENT_COUNT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_ENT_COUNT` (
  `idDataCenter` tinyint NOT NULL,
  `numEnterprisesCreated` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_EXTRA_HD_USED`
--

DROP TABLE IF EXISTS `CLOUD_STAT_EXTRA_HD_USED`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_EXTRA_HD_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_EXTRA_HD_USED` (
  `idDatacenter` tinyint NOT NULL,
  `extraHDUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_RESERVED`
--

DROP TABLE IF EXISTS `CLOUD_STAT_RESERVED`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_RESERVED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_RESERVED` (
  `idDataCenter` tinyint NOT NULL,
  `vCpuReserved` tinyint NOT NULL,
  `vMemoryReserved` tinyint NOT NULL,
  `vStorageReserved` tinyint NOT NULL,
  `storageReserved` tinyint NOT NULL,
  `repositoryReserved` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_SERV_WKLOAD_TOTALS`
--

DROP TABLE IF EXISTS `CLOUD_STAT_SERV_WKLOAD_TOTALS`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_SERV_WKLOAD_TOTALS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_SERV_WKLOAD_TOTALS` (
  `idDatacenter` tinyint NOT NULL,
  `vCPUTotal` tinyint NOT NULL,
  `vMemoryTotal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_SERV_WKLOAD_TOTALS_INNER`
--

DROP TABLE IF EXISTS `CLOUD_STAT_SERV_WKLOAD_TOTALS_INNER`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_SERV_WKLOAD_TOTALS_INNER`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_SERV_WKLOAD_TOTALS_INNER` (
  `idDatacenter` tinyint NOT NULL,
  `idPhysicalMachine` tinyint NOT NULL,
  `load_rule` tinyint NOT NULL,
  `cpu` tinyint NOT NULL,
  `ram` tinyint NOT NULL,
  `cpuLoadPercentage` tinyint NOT NULL,
  `ramLoadPercentage` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_USER_COUNT`
--

DROP TABLE IF EXISTS `CLOUD_STAT_USER_COUNT`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_USER_COUNT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_USER_COUNT` (
  `idDataCenter` tinyint NOT NULL,
  `numUsersCreated` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_VDC_COUNT`
--

DROP TABLE IF EXISTS `CLOUD_STAT_VDC_COUNT`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_VDC_COUNT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_VDC_COUNT` (
  `idDataCenter` tinyint NOT NULL,
  `numVDCCreated` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CLOUD_STAT_VLAN_USAGE`
--

DROP TABLE IF EXISTS `CLOUD_STAT_VLAN_USAGE`;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_VLAN_USAGE`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CLOUD_STAT_VLAN_USAGE` (
  `idDataCenter` tinyint NOT NULL,
  `vlanUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1335522742615-196','destevezg (generated)','src/2.0ga/views.xml','2013-09-20 13:34:27',103,'EXECUTED','3:9869fe725c330aa37e6e07da68d16c25','Create View','',NULL,'2.0.3'),('1335522742615-197','destevezg (generated)','src/2.0ga/views.xml','2013-09-20 13:34:27',102,'EXECUTED','3:19045b95150d1691be2db56be4b2a037','Create View','',NULL,'2.0.3'),('1335522742615-198','destevezg (generated)','src/2.0ga/views.xml','2013-09-20 13:34:28',104,'EXECUTED','3:c09f0be5aab0442e34c330d4cbc466f6','Create View','',NULL,'2.0.3'),('1335522742615-199','destevezg (generated)','src/2.0ga/views.xml','2013-09-20 13:34:28',105,'EXECUTED','3:d8e3551adcbbdbf1d7f4b285400ab942','Create View','',NULL,'2.0.3'),('1335522742615-200','destevezg (generated)','src/2.0ga/views.xml','2013-09-20 13:34:28',106,'EXECUTED','3:0dcf936b3a90f923643fa62ab50905d4','Create View','',NULL,'2.0.3'),('1335522742615-201','destevezg (generated)','src/2.0ga/views.xml','2013-09-20 13:34:28',107,'EXECUTED','3:fba05e70c0fb9525cb0e32d895418d15','Create View','',NULL,'2.0.3'),('1335522742615-202','destevezg (generated)','src/2.0ga/views.xml','2013-09-20 13:34:28',108,'EXECUTED','3:7d1bf8364c8de37fe3e228b6ea35d56a','Create View','',NULL,'2.0.3'),('1335522742615-203','destevezg (generated)','src/2.0ga/views.xml','2013-09-20 13:34:28',109,'EXECUTED','3:3525d4780909590966ee84aa2034fbe7','Create View','',NULL,'2.0.3'),('1335522749701-1','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',111,'EXECUTED','3:de8cf3a70531e851e5914cc06037b9b4','Insert Row','',NULL,'2.0.3'),('1335522749701-10','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',118,'EXECUTED','3:01a0899358975c7e845845aaf5fb68c0','Insert Row','',NULL,'2.0.3'),('1335522749701-11','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',119,'EXECUTED','3:4e1226a6a36ae74e4ed982725b2d4c54','Insert Row (x83)','',NULL,'2.0.3'),('1335522749701-12','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',120,'EXECUTED','3:038b8f4afc535e869fd3474162ffdb8b','Insert Row (x3)','',NULL,'2.0.3'),('1335522749701-13','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',121,'EXECUTED','3:089c056314989f6686309ead50938bcb','Insert Row','',NULL,'2.0.3'),('1335522749701-14','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',122,'EXECUTED','3:488515bb737e87d54efc39654c6bc22a','Insert Row (x4)','',NULL,'2.0.3'),('1335522749701-15','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:31',123,'EXECUTED','3:f01c1cb4f6bf52b684078287b4b72312','Insert Row','',NULL,'2.0.3'),('1335522749701-16','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:31',124,'EXECUTED','3:82bf294985b44cab8f8c9ce2114366c7','Insert Row (x2)','',NULL,'2.0.3'),('1335522749701-17','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:31',125,'EXECUTED','3:1671992947b92f05f598e92f29b3de10','Insert Row (x2)','',NULL,'2.0.3'),('1335522749701-18','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:32',126,'EXECUTED','3:2b477b3eddc17cd40dc60c24f7c11e64','Insert Row (x84)','',NULL,'2.0.3'),('1335522749701-19','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:32',127,'EXECUTED','3:b03d4b735795188e0cc3a94276a7f3da','Insert Row (x3)','',NULL,'2.0.3'),('1335522749701-2','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',112,'EXECUTED','3:6ee2a7bfbc6e05a148230fba90faca87','Insert Row','',NULL,'2.0.3'),('1335522749701-3','destevezg (generated)','src/kinton-license.xml','2013-09-20 13:34:54',373,'EXECUTED','3:efd9e092e3f80ed174330e7acb9fa1dc','Insert Row','',NULL,'2.0.3'),('1335522749701-4','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',113,'EXECUTED','3:1b6e28cec49ba1fe6aa832e958625b61','Insert Row (x50)','',NULL,'2.0.3'),('1335522749701-5','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',110,'EXECUTED','3:b3f0c67b2f6f4cac3086fefc627fe152','Insert Row','',NULL,'2.0.3'),('1335522749701-6','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',114,'EXECUTED','3:d8fe6ecf9187dc7c3fb35d05bdb8ef4b','Insert Row','',NULL,'2.0.3'),('1335522749701-7','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',115,'EXECUTED','3:6bee14978f59c4c0246e57db5acd1f54','Insert Row','',NULL,'2.0.3'),('1335522749701-8','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',116,'EXECUTED','3:cd8857111c2fccaff489ea361fc63b31','Insert Row (x4)','',NULL,'2.0.3'),('1335522749701-9','destevezg (generated)','src/2.0ga/data.xml','2013-09-20 13:34:28',117,'EXECUTED','3:fb31e2ba074d9a7bc9ba7688e9706dc8','Insert Row (x5)','',NULL,'2.0.3'),('1336469245439-1','destevezg (generated)','src/2.0.0-HF1/kinton-2.0.0-HF1.xml','2013-09-20 13:34:42',235,'EXECUTED','3:e2dcb29ad5406df0802012ef391de0ff','Add Column','',NULL,'2.0.3'),('1336469245439-2','destevezg (generated)','src/2.0.0-HF1/kinton-2.0.0-HF1.xml','2013-09-20 13:34:42',236,'EXECUTED','3:7c8e1ea0630376b5d6124083673e4b1e','Add Foreign Key Constraint','',NULL,'2.0.3'),('1336469245439-3','destevezg (generated)','src/2.0.0-HF1/kinton-2.0.0-HF1.xml','2013-09-20 13:34:42',237,'EXECUTED','3:9fa54ec9f24cfe1738d991eb1ba27029','Drop Index','',NULL,'2.0.3'),('1336469245439-4','destevezg (generated)','src/2.0.0-HF1/kinton-2.0.0-HF1.xml','2013-09-20 13:34:42',238,'EXECUTED','3:d395cdedeb298779d6b6ffe8227a3145','Create Index','',NULL,'2.0.3'),('1336485500618-1','destevezg (generated)','src/2.2/kinton-2.2.xml','2013-09-20 13:34:42',244,'EXECUTED','3:4441c84bd8a0fcebb40e9bb65aaf5191','Add Column, Custom SQL, Drop Column','',NULL,'2.0.3'),('1336485500618-11','destevezg (generated)','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',250,'EXECUTED','3:219c18769d18cef1d17381ba4a1bb5ce','Drop Table','',NULL,'2.0.3'),('1336485500618-2','destevezg (generated)','src/2.2/kinton-2.2.xml','2013-09-20 13:34:42',245,'EXECUTED','3:3e028861a9cd184465e4b26a3cfcb777','Add Not-Null Constraint','',NULL,'2.0.3'),('1336485500618-5','destevezg (generated)','src/2.2/kinton-2.2.xml','2013-09-20 13:34:42',246,'EXECUTED','3:c79a9d931d4ba6ccb61f1169afba19a8','Add Foreign Key Constraint','',NULL,'2.0.3'),('1336485500618-7','destevezg (generated)','src/2.2/kinton-2.2.xml','2013-09-20 13:34:42',247,'EXECUTED','3:5b51a053210935c51c948d0c7fa381dc','Set Column as Auto-Increment, Add Foreign Key Constraint','',NULL,'2.0.3'),('1336485500618-8','destevezg (generated)','src/2.2/kinton-2.2.xml','2013-09-20 13:34:42',248,'EXECUTED','3:18db5a13981a0ab6234d17f46e8eda05','Add Foreign Key Constraint','',NULL,'2.0.3'),('1336485500618-9','destevezg (generated)','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',249,'EXECUTED','3:51b22321576067fff7232c38f0ab65c8','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-1','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',2,'EXECUTED','3:1fa499c79ccc8dd6441f5be160a8a20a','Create Table','',NULL,'2.0.3'),('1337848104277-10','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',11,'EXECUTED','3:1b46903b83f80f738d133f73f614035e','Create Table','',NULL,'2.0.3'),('1337848104277-100','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:33',141,'EXECUTED','3:162a67a515a4b894be24ea92677a4ec2','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-102','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:33',142,'EXECUTED','3:9cc3b6aa2c32810c3af8841bcf75d057','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-103','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:33',143,'EXECUTED','3:f110c901d46203476b26407f34a20553','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-104','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:33',144,'EXECUTED','3:0a90424859d5c751e009a52788fbd5c7','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-105','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:33',145,'EXECUTED','3:c6f97a64d3bbaf7e4b704612fb2da6e8','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-106','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:33',146,'EXECUTED','3:f12c60cd95ff11d2437444a8202c5bd4','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-107','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:33',147,'EXECUTED','3:6754b7abce5397c7844d687884732683','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-109','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:33',148,'EXECUTED','3:2067c951c3aa82d24eb4324e3d90f25e','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-11','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',12,'EXECUTED','3:a18dcd1a1be857c76cd9eea2a9884cd2','Create Table','',NULL,'2.0.3'),('1337848104277-110','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:33',149,'EXECUTED','3:09da99c4e6e31595f34ec2be25b43dc8','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-111','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',150,'EXECUTED','3:e52fa216c74824b00447bb18025d3958','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-112','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',151,'EXECUTED','3:e6034e81d4247717b894501b1e5f2077','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-113','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',152,'EXECUTED','3:c0ef24d86a2e36e3f18678ecf98a4fd1','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-116','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',153,'EXECUTED','3:87401343ba30f95853096f53f2145d4c','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-117','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',154,'EXECUTED','3:241f9a9ba6ee93b09a7bee6372e2a99f','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-118','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',155,'EXECUTED','3:babee5873b113a16e3d247c4a8b7d5ae','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-119','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',156,'EXECUTED','3:2e37837fbfb14dfc4499ce39e4e45d0f','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-12','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',13,'EXECUTED','3:479e5e3af9e6a44f4fc9dbed80e6a997','Create Table','',NULL,'2.0.3'),('1337848104277-120','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',157,'EXECUTED','3:224c98605877be44c1a4b7772f40139d','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-121','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',158,'EXECUTED','3:7add768133119551554b8e3fe4eabcfe','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-122','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',159,'EXECUTED','3:4c513d9af35d89264d6426523832b0bf','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-123','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',160,'EXECUTED','3:cdbd03b583ae11a990b14cee938029af','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-124','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',161,'EXECUTED','3:e19d2a8d15b2698983ec2bd3244da199','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-125','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',162,'EXECUTED','3:e7542966e2a4262fcd6d94d9eab2d31d','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-126','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',163,'EXECUTED','3:c4d6eb8f3294ff8dc825f8dcb0694229','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-127','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:34',164,'EXECUTED','3:588d684f716fac4248a78f84b20e1848','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-128','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',165,'EXECUTED','3:a6664c8e00e9f84735691bc9f65ffdae','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-129','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',166,'EXECUTED','3:401d7128c9685671b8132c2be2f3b51c','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-13','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',14,'EXECUTED','3:d6d05a87d471ea3396b72755a678b96f','Create Table','',NULL,'2.0.3'),('1337848104277-130','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',167,'EXECUTED','3:7bd171095093a31d90a52130c93b4361','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-131','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',168,'EXECUTED','3:8aac24d3878f2cf143029245d36bc718','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-132','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',169,'EXECUTED','3:0d408de63c791d1d72e1ca6ed5b37115','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-133','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',170,'EXECUTED','3:7f40febbf510e024517380fd5e5aef48','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-134','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',171,'EXECUTED','3:b582521bf03ee8d5ea05c684578c7034','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-135','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',172,'EXECUTED','3:aeb0ded36caf7b4870a9cbda8cb62771','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-136','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',173,'EXECUTED','3:0abce3e30f01b6ddf819b8e30ee635a9','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-137','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',174,'EXECUTED','3:01ea4328ecb4f1edfcffece4bd1019d1','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-138','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',175,'EXECUTED','3:79755fa4b03184aaf81ed902878886e3','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-139','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',176,'EXECUTED','3:3b7a36fc3de222b2827dd624bbf188df','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-14','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',15,'EXECUTED','3:96dd6e407f119eb964fe42c62c2ca79e','Create Table','',NULL,'2.0.3'),('1337848104277-140','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',177,'EXECUTED','3:cecf006c92ac717d6c86487c837a9718','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-141','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',178,'EXECUTED','3:afe3ffec74162088a0854a7f70d46f00','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-142','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:35',179,'EXECUTED','3:dc4c00c7d2f82ac51a5bd20c136d466f','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-143','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:36',180,'EXECUTED','3:9759ca65a44a631f100713776f858563','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-144','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:36',181,'EXECUTED','3:41352352d930fd662d1d7d363bc4f719','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-145','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:36',182,'EXECUTED','3:45727eba271f8926bf7e2d794169d7e4','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-146','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:36',183,'EXECUTED','3:41cc38e6af909e00988ea3e2ed9f9a11','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-147','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:36',184,'EXECUTED','3:89446970e88861750073ca38aecd7221','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-148','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:36',185,'EXECUTED','3:4fb61370d6709dbdad6cb8912d78d147','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-149','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:36',186,'EXECUTED','3:ce3759c45c6e5e0957bdf286928ddfd6','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-15','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',16,'EXECUTED','3:760ab69dd396ccb94f6918d55a485cca','Create Table','',NULL,'2.0.3'),('1337848104277-150','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:36',187,'EXECUTED','3:6a2e1beff7657d80b3ddc590c6afb4ff','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-151','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',188,'EXECUTED','3:4c49355453f85109bc9fdaaa7d9c8f9d','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-152','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',189,'EXECUTED','3:c69b44279fe35ae4d5357530fa58f98c','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-153','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',190,'EXECUTED','3:55d5fcfd88c84da2d8e8b047fbe4ca74','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-154','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',191,'EXECUTED','3:5a8a82475af9f6cd7f2dd53d712f7772','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-155','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',192,'EXECUTED','3:28bb4e87b926a15b198c9c3f0ed9a41e','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-156','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',193,'EXECUTED','3:3338ded640346300fe6fc834f29cd573','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-157','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',194,'EXECUTED','3:21c1084c13f597df7b8ae0b17661bec8','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-158','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',195,'EXECUTED','3:b69eabf2c2c54d2b3fca684c10307674','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-159','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',196,'EXECUTED','3:cc83157e9e8f124153e80effb9d51efb','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-16','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',17,'EXECUTED','3:350a5d3c65c40a8fd81b1130a9114c49','Create Table','',NULL,'2.0.3'),('1337848104277-160','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',197,'EXECUTED','3:b16109dedffbd117d36f5b77cd4afd47','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-161','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',198,'EXECUTED','3:ada5fd43eb881ae2b2c0a4ae26e8b60b','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-162','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',199,'EXECUTED','3:c1c9a3d9a6cd5f576dba7bec3898158f','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-163','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',200,'EXECUTED','3:bcb0e0250107a0123f8ea29709d18132','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-164','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',201,'EXECUTED','3:da457c42797f29326ae68a0f6ef932c7','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-165','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:37',202,'EXECUTED','3:66e0aecdb3e6496bd6014ddd811aedd7','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-166','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:38',203,'EXECUTED','3:490d988acc72011b15b3cdd2c054c1d0','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-167','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:38',204,'EXECUTED','3:8d0283f48802ab658df52a67d2b84168','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-168','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:38',205,'EXECUTED','3:43369b643b83dbf4abc3cdd88dea9e55','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-169','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:38',206,'EXECUTED','3:0e024cd1c55e694b36db28daef7be341','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-17','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',18,'EXECUTED','3:52e834853212606010797cd36204c702','Create Table','',NULL,'2.0.3'),('1337848104277-170','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:38',207,'EXECUTED','3:448b288afac7932843f109c4c8150cf7','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-171','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:38',208,'EXECUTED','3:fe98b32bbffe0d24efb06fbbee891dd5','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-172','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:38',209,'EXECUTED','3:039a3cb6e568637b87fa0c4d1fd751fb','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-173','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:38',210,'EXECUTED','3:89b532248fcd75b771983698562696a0','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-174','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:39',211,'EXECUTED','3:648895356db22362b96054e955327394','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-175','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:39',212,'EXECUTED','3:45fabe26bed9e78a381e00f57a8106fe','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-176','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:39',213,'EXECUTED','3:29df9763e7f45787933eedc0d93753a0','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-177','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:39',214,'EXECUTED','3:e82153ad84d182e5f828cd744af702fd','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-178','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:39',215,'EXECUTED','3:8ba1097cdbd056308fd5aba20d89345e','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-179','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:39',216,'EXECUTED','3:b5b66d52f3615106dbf5b81be8aeead0','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-18','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',19,'EXECUTED','3:777e471b83d5a83febb9f9808983a265','Create Table','',NULL,'2.0.3'),('1337848104277-180','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:39',217,'EXECUTED','3:10999a3fbaadde9cf33ad4b3dabdad36','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-181','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:40',218,'EXECUTED','3:e0bcbb3f28283f516bd242be82ac242c','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-182','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:40',219,'EXECUTED','3:eda88ebcb0ae4b0237caab929c1aea15','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-183','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:40',220,'EXECUTED','3:8261f126803cf01ac95fc860bf05683c','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-184','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:40',221,'EXECUTED','3:2e17ee385fe1756792aa18f36c7cf467','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-185','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:40',222,'EXECUTED','3:80a62ee2317a6712e5807f3f6d0ba197','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-186','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:40',223,'EXECUTED','3:7aae02e0bacd25676d9e6dd34e96732e','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-187','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:40',224,'EXECUTED','3:b623134004ac65bccbd18f8b166a65a3','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-188','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:40',225,'EXECUTED','3:727265749266ca7e5cd2363a313d6423','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-189','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:40',226,'EXECUTED','3:6ff99a1ad8e39d4f80c918cefe816932','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-19','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',20,'EXECUTED','3:d68cedf4ba1325816fbcdb17e78f4bb4','Create Table','',NULL,'2.0.3'),('1337848104277-190','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:40',227,'EXECUTED','3:c2b5d1e4466e21627abaa7ad015fff4e','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-191','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:41',228,'EXECUTED','3:f6bf190b5e4a59f02bcc3db933b369ec','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-192','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:41',229,'EXECUTED','3:19d7e4f37a06adf14f372a57f894026d','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-193','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:41',230,'EXECUTED','3:98e3e9fbffc688e3cdf0a6f62cc886ab','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-194','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',92,'EXECUTED','3:a380c7f9fc0bc3ea9fe1e4be4d4fcd2c','Create Index','',NULL,'2.0.3'),('1337848104277-195','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',93,'EXECUTED','3:4eff3205127c7bc1a520db1b06261792','Create Index','',NULL,'2.0.3'),('1337848104277-2','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',3,'EXECUTED','3:a5b0a4d26eaffc3be0bb048d99cf20d1','Create Table','',NULL,'2.0.3'),('1337848104277-20','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',21,'EXECUTED','3:53a123366dce86c925fde8ee9bbf5cfb','Create Table','',NULL,'2.0.3'),('1337848104277-21','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',22,'EXECUTED','3:d2145318a654660d2fbaf801a8359041','Create Table','',NULL,'2.0.3'),('1337848104277-22','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',23,'EXECUTED','3:9e463f91eba996f9ffea2d3d0d60c578','Create Table','',NULL,'2.0.3'),('1337848104277-23','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',24,'EXECUTED','3:d988c667cb5fb43d55ceea415d9d5205','Create Table','',NULL,'2.0.3'),('1337848104277-24','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',25,'EXECUTED','3:0f2fd84257dfbe356711b4ca8cd305a7','Create Table','',NULL,'2.0.3'),('1337848104277-25','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',26,'EXECUTED','3:130b6dc57dfad1397c35625d5d1463c2','Create Table','',NULL,'2.0.3'),('1337848104277-26','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',27,'EXECUTED','3:69bfe558818115ac4b4dfa84d3d8de1e','Create Table','',NULL,'2.0.3'),('1337848104277-27','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',28,'EXECUTED','3:81c8e8fb31d3d86128542bfe21e002a9','Create Table','',NULL,'2.0.3'),('1337848104277-28','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',29,'EXECUTED','3:5e0b809fab55e8118cc216e1d306bf3a','Create Table','',NULL,'2.0.3'),('1337848104277-29','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',30,'EXECUTED','3:3efb70d74c36d5683996dfd24c8ddf12','Create Table','',NULL,'2.0.3'),('1337848104277-3','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',4,'EXECUTED','3:4e9ef329616b20821f92e3b940adbc15','Create Table','',NULL,'2.0.3'),('1337848104277-30','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',31,'EXECUTED','3:59245dc17805f9917702e777dece5d96','Create Table','',NULL,'2.0.3'),('1337848104277-31','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',32,'EXECUTED','3:cb53ef7e84b6a2edd5eb4c691b082e2e','Create Table','',NULL,'2.0.3'),('1337848104277-32','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',33,'EXECUTED','3:a54346d08d039caf856158c98342047a','Create Table','',NULL,'2.0.3'),('1337848104277-33','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',34,'EXECUTED','3:4553169cea18f126cd0add78eac0a8a7','Create Table','',NULL,'2.0.3'),('1337848104277-34','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',35,'EXECUTED','3:b2a4028100a7a39f1d1020a793a2bd9f','Create Table','',NULL,'2.0.3'),('1337848104277-35','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',36,'EXECUTED','3:114b963b04c30bcc8c4d309ae5680cc3','Create Table','',NULL,'2.0.3'),('1337848104277-36','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:22',37,'EXECUTED','3:ee7e8564f9a6f927ba5cd46c21a88d36','Create Table','',NULL,'2.0.3'),('1337848104277-37','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:23',38,'EXECUTED','3:2afd5ca9c33785df19d5bb7d1ea1c7e8','Create Table','',NULL,'2.0.3'),('1337848104277-38','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:23',39,'EXECUTED','3:2b979f45c26c5d78a80ceeab7e7f109b','Create Table','',NULL,'2.0.3'),('1337848104277-39','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:23',40,'EXECUTED','3:bc49a7c19baf45004bf6519288bbfa37','Create Table','',NULL,'2.0.3'),('1337848104277-4','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',5,'EXECUTED','3:a033f02497669d24b6ed860cb02c221c','Create Table','',NULL,'2.0.3'),('1337848104277-40','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:23',41,'EXECUTED','3:6b91194ab89222dcf4e42dcf86a9b16c','Create Table','',NULL,'2.0.3'),('1337848104277-41','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:23',42,'EXECUTED','3:5649c82dca080d57f5e9f1ded0f7fa8a','Create Table','',NULL,'2.0.3'),('1337848104277-42','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:23',43,'EXECUTED','3:1be16468c3ddde51bd8426c9aeb9b373','Create Table','',NULL,'2.0.3'),('1337848104277-43','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:23',44,'EXECUTED','3:d45df511418af4a35e7902e37d7109b8','Create Table','',NULL,'2.0.3'),('1337848104277-44','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:23',45,'EXECUTED','3:bcf1d9ce455ec5a034d49f8cdc77bbae','Create Table','',NULL,'2.0.3'),('1337848104277-45','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:23',46,'EXECUTED','3:4299e545c98449bcf16aaba9d3dd5af8','Create Table','',NULL,'2.0.3'),('1337848104277-46','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:23',47,'EXECUTED','3:0905951d123429ef1a7b0017106c8ee9','Create Table','',NULL,'2.0.3'),('1337848104277-47','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:24',48,'EXECUTED','3:de0b803f07cd4aa3007ffbf9668a63ea','Create Table','',NULL,'2.0.3'),('1337848104277-48','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:24',49,'EXECUTED','3:0b09400a24f84219969aad8045a2a18e','Create Table','',NULL,'2.0.3'),('1337848104277-49','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:24',50,'EXECUTED','3:5f1327b65c8ac5737d7b7c3e1081b8ee','Create Table','',NULL,'2.0.3'),('1337848104277-5','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',6,'EXECUTED','3:47f51627ad81dc49264f67b42f543ba2','Create Table','',NULL,'2.0.3'),('1337848104277-50','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:24',51,'EXECUTED','3:024157dffa5204f1647087501ae70c0e','Create Table','',NULL,'2.0.3'),('1337848104277-51','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:24',52,'EXECUTED','3:806f7e446f68098dd0d41c0105a24438','Create Table','',NULL,'2.0.3'),('1337848104277-52','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:24',53,'EXECUTED','3:56295e26860afbba5936ef2dc472e0a0','Create Table','',NULL,'2.0.3'),('1337848104277-53','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:24',54,'EXECUTED','3:047c5fbafa97112cfa815ca57b7d9136','Create Table','',NULL,'2.0.3'),('1337848104277-54','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:24',55,'EXECUTED','3:4796cbed4e74dd02dcc2f68df1794d79','Create Table','',NULL,'2.0.3'),('1337848104277-55','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:24',56,'EXECUTED','3:f196649f225ac654a9587ceb1878b586','Create Table','',NULL,'2.0.3'),('1337848104277-56','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',57,'EXECUTED','3:253740b8f537edc756c126a302f88433','Create Table','',NULL,'2.0.3'),('1337848104277-57','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',58,'EXECUTED','3:73427f139a1db872852342e290eef17f','Create Table','',NULL,'2.0.3'),('1337848104277-58','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',59,'EXECUTED','3:e458e4c5fa8663a002b73404936feaac','Create Table','',NULL,'2.0.3'),('1337848104277-59','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',60,'EXECUTED','3:4290f1bf5e82a9c984a4c2f45aa39289','Create Table','',NULL,'2.0.3'),('1337848104277-6','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',7,'EXECUTED','3:8c73779c204ec6278df878eddd80b77f','Create Table','',NULL,'2.0.3'),('1337848104277-60','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',61,'EXECUTED','3:106c340f4a0e9c1c846366d46ead4b3f','Create Table','',NULL,'2.0.3'),('1337848104277-61','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',62,'EXECUTED','3:7c35032bce567fc743c7560c27367c0f','Create Table','',NULL,'2.0.3'),('1337848104277-62','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',63,'EXECUTED','3:42731c72cb6d0e17604237240fc0562e','Create Table','',NULL,'2.0.3'),('1337848104277-63','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',64,'EXECUTED','3:e0e26dde37f9d7d63c09fd55968c0977','Create Table','',NULL,'2.0.3'),('1337848104277-64','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',65,'EXECUTED','3:0d056c8aecd4026dcda8627ad06d634c','Create Table','',NULL,'2.0.3'),('1337848104277-65','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',66,'EXECUTED','3:86505391e8081fdbbef2365031e93a74','Create Table','',NULL,'2.0.3'),('1337848104277-66','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',67,'EXECUTED','3:32239c8a6898e6748abd20b04a51e0a1','Create Table','',NULL,'2.0.3'),('1337848104277-67','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',68,'EXECUTED','3:6f8230da5dbd7b92cce93f40529c836e','Create Table','',NULL,'2.0.3'),('1337848104277-68','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',69,'EXECUTED','3:ae0cb00375718d9e76a33ef29b7bf6be','Create Table','',NULL,'2.0.3'),('1337848104277-69','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',70,'EXECUTED','3:062eb2720262e56cfe8c260344e5de20','Create Table','',NULL,'2.0.3'),('1337848104277-7','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',8,'EXECUTED','3:787fd9772c35d842e8fd632d6268028b','Create Table','',NULL,'2.0.3'),('1337848104277-70','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',71,'EXECUTED','3:59dc8765f11cc6fde61d76ad1654aafb','Create Table','',NULL,'2.0.3'),('1337848104277-71','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',72,'EXECUTED','3:27d3915c699b72899dd8d35e3de536f3','Create Table','',NULL,'2.0.3'),('1337848104277-72','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',73,'EXECUTED','3:580ee3ec6feb35780f7165b1b284eaa7','Create Table','',NULL,'2.0.3'),('1337848104277-73','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:25',74,'EXECUTED','3:0b96fb1106b6a6757d5536412fa985e5','Create Table','',NULL,'2.0.3'),('1337848104277-74','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',75,'EXECUTED','3:08886937fc7101c1a6cee4d8c80ed3fa','Create Table','',NULL,'2.0.3'),('1337848104277-75','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',76,'EXECUTED','3:063283fb7dbf433f93070fe153c9a135','Create Table','',NULL,'2.0.3'),('1337848104277-76','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',77,'EXECUTED','3:22888bcaa7edf918356316881c639995','Create Table','',NULL,'2.0.3'),('1337848104277-77','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',78,'EXECUTED','3:5115c624b35d8bb58fc4b20ccc127e13','Create Table','',NULL,'2.0.3'),('1337848104277-78','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',79,'EXECUTED','3:4bf4da8397db1467955f7367abc244d0','Create Table','',NULL,'2.0.3'),('1337848104277-79','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',80,'EXECUTED','3:a4f5454fefbf871ee9892ce6776f2078','Create Table','',NULL,'2.0.3'),('1337848104277-8','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',9,'EXECUTED','3:2f2cf3e39a6718ebebb7479456783cec','Create Table','',NULL,'2.0.3'),('1337848104277-80','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',81,'EXECUTED','3:03eb1ec9b1cea36680f39207ec0cb265','Create Table','',NULL,'2.0.3'),('1337848104277-81','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',82,'EXECUTED','3:aaeeca88536c792823792daff78fc302','Create Table','',NULL,'2.0.3'),('1337848104277-82','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',83,'EXECUTED','3:26947b00d958299de2b04874501cb62d','Create Table','',NULL,'2.0.3'),('1337848104277-83','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',84,'EXECUTED','3:7e17f77ecfd27b92c4f31099bab23263','Create Table','',NULL,'2.0.3'),('1337848104277-84','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',85,'EXECUTED','3:ad296e1cb54e03f2bca4d616edbad6cd','Create Table','',NULL,'2.0.3'),('1337848104277-85','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',86,'EXECUTED','3:0c21699680283121de7813315629e44f','Create Table','',NULL,'2.0.3'),('1337848104277-86','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:26',87,'EXECUTED','3:7a8b4908fb9d95a66944fee41a1203c6','Create Table','',NULL,'2.0.3'),('1337848104277-87','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',88,'EXECUTED','3:a92b34c47f2346398f5b8b119fc7e530','Create Table','',NULL,'2.0.3'),('1337848104277-88','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',89,'EXECUTED','3:1730d1e6ce407813be6ceb6d424317f6','Create Table','',NULL,'2.0.3'),('1337848104277-89','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',90,'EXECUTED','3:aa74d712d9cfccf4c578872a99fa0e59','Add Primary Key','',NULL,'2.0.3'),('1337848104277-9','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:21',10,'EXECUTED','3:c061c7bf09669bd5f7beaa3673089e9c','Create Table','',NULL,'2.0.3'),('1337848104277-90','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',91,'EXECUTED','3:22e25d11ab6124ead2cbb6fde07eeb66','Add Primary Key','',NULL,'2.0.3'),('1337848104277-92','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:32',133,'EXECUTED','3:61865568b5c369334126d98f2cbe9ca2','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-93','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:32',134,'EXECUTED','3:4a2fb0e70026d6bfe34d2eea6989c1cf','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-94','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:32',135,'EXECUTED','3:25f0b96d5511b61ebff630df02f7f80e','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-95','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:32',136,'EXECUTED','3:f4199d4c8ef6d658b47e268c5b179975','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-96','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:32',137,'EXECUTED','3:c07a9802053c16ea4ff6ed536da64a49','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-97','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:32',138,'EXECUTED','3:c1380d095c438a19d05b61b4fbcfe7fa','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-98','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:32',139,'EXECUTED','3:96c71c89d367921fd04f4fed07442eac','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337848104277-99','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:33',140,'EXECUTED','3:a6695e1d09254cd47b2bd905e433c15f','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337865595474-1','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',94,'EXECUTED','3:465179a94d1a28d6942f8bb44a9beceb','Drop Not-Null Constraint','',NULL,'2.0.3'),('1337865595474-2','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',95,'EXECUTED','3:9fcade3f621d8902edd5fe7e0cd7c864','Drop Not-Null Constraint','',NULL,'2.0.3'),('1337865595474-3','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',96,'EXECUTED','3:e863feedebe5753f3d3c3f6bf637ee52','Drop Not-Null Constraint','',NULL,'2.0.3'),('1337865595474-4','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',97,'EXECUTED','3:eca37028c90adad85e58e56a696eef03','Drop Not-Null Constraint','',NULL,'2.0.3'),('1337865595474-5','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',98,'EXECUTED','3:04401822cd01707f6c95c5e8385714ab','Drop Not-Null Constraint','',NULL,'2.0.3'),('1337865595474-6','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',99,'EXECUTED','3:9ec41f0bf6e618839b6b3b24e0073770','Drop Not-Null Constraint','',NULL,'2.0.3'),('1337865595474-7','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',100,'EXECUTED','3:2481e182d0b6ad7dfcdaadf1d3e0b3fb','Drop Not-Null Constraint','',NULL,'2.0.3'),('1337865595474-8','destevezg (generated)','src/2.0ga/schema.xml','2013-09-20 13:34:27',101,'EXECUTED','3:c9ea354150730436040615b45ad45cbf','Drop Not-Null Constraint','',NULL,'2.0.3'),('1337866919799-3','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:41',231,'EXECUTED','3:87349e83626f9fb90db22db902f3b164','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337866919799-4','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:41',232,'EXECUTED','3:ac5709e413466a1f11ac597a7c5a585e','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337866919799-5','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:41',233,'EXECUTED','3:258283ddc293a5413837c04174818f97','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337866919799-6','destevezg (generated)','src/2.0ga/kinton-2.0ga.xml','2013-09-20 13:34:41',234,'EXECUTED','3:4026921db5863970af971d6346b563ed','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337940808955-1','destevezg (generated)','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',251,'EXECUTED','3:6f998f6f3e1878a5b204ced6fe8c34e4','Drop Not-Null Constraint','',NULL,'2.0.3'),('1337940808955-5','destevezg (generated)','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',252,'EXECUTED','3:6e1b2afc755e1e0933c651e6b5ee8eb7','Add Foreign Key Constraint','',NULL,'2.0.3'),('1337940808955-6','destevezg (generated)','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',253,'EXECUTED','3:db624edc38a2e1cacb2ebe3a6156bccc','Add Foreign Key Constraint','',NULL,'2.0.3'),('ABICLOUDPREMIUM-2028','destevezg','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:48',314,'EXECUTED','3:daf61bc5190601039ac50aad6afc05e4','Add Not-Null Constraint','',NULL,'2.0.3'),('ABICLOUDPREMIUM-2435','destevez','src/2.2/kinton-2.2.xml','2013-09-20 13:34:44',271,'EXECUTED','3:5d70797c0bd2660c67b85c205e9cf413','Custom SQL, SQL From File, Custom SQL','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3658','scastro','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',269,'EXECUTED','3:76559c1d1d91c98c23197868335d8b30','Drop Table (x3)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3698','zmalik','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',255,'EXECUTED','3:ccd5c84bb742930df6ccd39f8fb552e5','Create Table (x2)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3698-admin','zmalik','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',261,'EXECUTED','3:af289f7006bdc919bc053d038cbdbf25','Insert Row','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3698-columns','zmalik','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',256,'EXECUTED','3:0d7c4b7edc6c4c10d3f13e101d1151cf','Add Column','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3698-constraints','zmalik','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',257,'EXECUTED','3:8afd9227de5253e2a04506ad214a6931','Add Foreign Key Constraint','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3698-constraints1','zmalik','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',258,'EXECUTED','3:bd3389b3752100eb6a4262004441e391','Add Foreign Key Constraint','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3698-update-and-inserts','zmalik','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',260,'EXECUTED','3:2d4ecdd62de718f0b6f8e4b653909ebf','Insert Row (x2), Update Data','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3856','sacedo','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',254,'EXECUTED','3:58ee105e73f736fa89b0804f646f73e4','Add Column','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3875-0','jdevesa','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',262,'EXECUTED','3:8d84d03c13f8b54bc6f46b47b3b4c6f2','Create Table','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3875-1','jdevesa','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',263,'EXECUTED','3:6a705cc1e1c2c2ba4a9eec6a0a430623','Add Foreign Key Constraint','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3875-2','jdevesa','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',264,'EXECUTED','3:423310274c7be31be9d4435fca0d23f6','Add Foreign Key Constraint','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3898','destevez','src/2.2/kinton-2.2.xml','2013-09-20 13:34:44',270,'EXECUTED','3:2a28c423f881e89f996514c5b4188adf','Custom SQL, SQL From File','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3908-calculate_cloud_usage_stats','destevez','src/2.0.0-HF3/kinton-2.0.0-HF3.xml','2013-09-20 13:34:42',243,'EXECUTED','3:3a6c4542d482125622a634a6172462b4','Custom SQL, SQL From File, Custom SQL, SQL From File','',NULL,'2.0.3'),('ABICLOUDPREMIUM-3910','xthevenot','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',267,'EXECUTED','3:d6ef777a6b393e0a780b4a233d4c6884','Insert Row (x2)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4033','xthevenot','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',265,'EXECUTED','3:ee17d425d7bbd7981fff90e0876dec5f','Insert Row','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4068-layer','sacedo','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',295,'EXECUTED','3:f4416156b1f57fc50f01767a18093741','Add Column','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4068-pricingTemplate','sacedo','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',296,'EXECUTED','3:a66751e95fe5ef2c119c9b5039fd0748','Add Column','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4075-credentials','zmalik','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',340,'EXECUTED','3:8524491514a92e39b0cd33a666036cef','Create Table','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4075-credentials-constraint','zmalik','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',343,'EXECUTED','3:6c63b2612276555c01fab277ac6bfd11','Add Foreign Key Constraint (x2)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4075-datacenterlimits-CredentialsColumn','zmalik','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',342,'EXECUTED','3:8c592c5f2551b8eac427d5d0f1b73782','Add Column','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4075-HardwareProfile','zmalik','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',344,'EXECUTED','3:c2b734e1c0e03a6985dd80877138e404','Create Table','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4075-HardwareProfile-VirtualMachine','zmalik','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',346,'EXECUTED','3:1725f6e79c55e44ac59d4c8bbc414bb6','Add Foreign Key Constraint (x2)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4075-HardwareProfile-VirtualMachineColumn','zmalik','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',345,'EXECUTED','3:43addd6ad32ea89c5079d819917f3fef','Add Column','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4075-keypair','ibarrera','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',341,'EXECUTED','3:9d87889be0b6799d9cfc87c1f63891ac','Add Column','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4075-publicDatacenter','zmalik','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',338,'EXECUTED','3:2f9ad1a524add1644302891480c377f7','Create Table','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4075-publicDatacenter-constraint','zmalik','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',339,'EXECUTED','3:b72790d42f9c555d984e4c6d6e84f71c','Add Foreign Key Constraint','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4076-data2','jdevesa','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',286,'EXECUTED','3:d3c62dd7caf83c907c41c3c0ede9f7cf','Custom SQL','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4076-vlan_networkServiceType-data_1','jdevesa','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',281,'EXECUTED','3:3bfcc8601cc16cccc093369cabb5195e','Custom SQL','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4076-vlan_networkServiceType-data_2','jdevesa','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',282,'EXECUTED','3:ef889a00f39be7ea88b9883504343068','Custom SQL','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4076_constraint1','jdevesa','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',276,'EXECUTED','3:dc7739bc0462d274b73cdfe8cb8b1d40','Add Foreign Key Constraint','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4076_constraint2','jdevesa','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',285,'EXECUTED','3:a513efcff90639090bc48c7491e9e425','Add Foreign Key Constraint (x2)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4076_data1','jdevesa','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',279,'EXECUTED','3:8b7edd2b2388227b6353709aaf863119','Custom SQL','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4076_table1','jdevesa','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',275,'EXECUTED','3:f8806ce2349f6238e81baef8b3fed45b','Create Table','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4076_table2','jdevesa','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',284,'EXECUTED','3:eea01dac847e771083746fee7fc59c6e','Create Table','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4076_table3','jdevesa','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',287,'EXECUTED','3:9502de062240993ec13a507734733e76','Drop Column','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4076_vlan_networkServiceType-column','zmalik','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',280,'EXECUTED','3:02f513250ebcf01b8239b705fc4b6396','Add Column','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4076_vlan_networkServiceType-fk','zmalik','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',283,'EXECUTED','3:4918df9ffbb96386a3f55f0013782051','Add Foreign Key Constraint','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4206','destevezg','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:48',315,'EXECUTED','3:a12203c803c6846e8a44f88655dc7d4e','Update Data (x2)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4217','jdevesa','src/2.2/kinton-2.2.xml','2013-09-20 13:34:44',272,'EXECUTED','3:b388a8f15cdd350e02dc8622a13bfdb9','Custom SQL','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4344','xthevenot','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',266,'EXECUTED','3:413e9afa18ea719bd4c58a7c468fdd6e','Insert Row (x2)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4407','xthevenot','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',268,'EXECUTED','3:7eb210f7ec2e3d8c4db8200a88d892bd','Update Data (x40)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4457_scopeWikiLink','xthevenot','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',274,'EXECUTED','3:0ce2ae36cfd7ae00c397eca6f54b1c42','Insert Row','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4496_dvdmagementPurge','scastro','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',288,'EXECUTED','3:4151b298ce9d4a28d5a454effc182bba','Custom SQL','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4502_compatibility_table_link','xthevenot','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',273,'EXECUTED','3:f5c5781f062fcb8e962abd34da8f199a','Update Data','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4602_2.3_wiki_links','xthevenot','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',289,'EXECUTED','3:117298167e6a3dbb9cf88700120aefdc','Update Data (x40)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4631','scastro','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:47',310,'EXECUTED','3:e57dd0a061c3b9c1770e0ee22cc4b803','Create Table','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4631-constraints','scastro','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:48',311,'EXECUTED','3:bd9cfdf298060536ff5a98ad06155d22','Add Foreign Key Constraint (x2), Add Unique Constraint','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4631-tier-column','scastro','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:48',312,'EXECUTED','3:9a2284a2331699024cee559381ffc426','Add Column','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4631-upgrade-enterprises','scastro','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:48',313,'EXECUTED','3:760ad000a62aca92d43f0fab5ee2c48a','Custom SQL','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4683_2.4_wiki_links','xthevenot','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',303,'EXECUTED','3:ad033e2443199f4413b97fe094b26a7e','Update Data (x39), Custom SQL (x2)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4760','aprete','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',301,'EXECUTED','3:08f65eeeb43c0e0adfcd992c9263961a','Insert Row (x3)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4760-Privilege related to the Anti Affinity fea','aprete','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',300,'EXECUTED','3:dba2262e856c8d5eee41a3fd0dc1723d','Insert Row','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4869','zmalik','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',278,'EXECUTED','3:660f4cf314d2dedc2746b4e36dd3314b','Insert Row (x3)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4869-Privilege related to the viewing enterpris','zmalik','src/2.3/kinton-2.3.xml','2013-09-20 13:34:44',277,'EXECUTED','3:c2b5b10d83decc37659b4f558839d70d','Insert Row','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4956 -Delete privileges to assign volume/nic to','aprete','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',302,'EXECUTED','3:32b2c9c42350d5e8a82c148f7eb2fd6f','Custom SQL (x2)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4973_wikilink_layer','xthevenot','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',299,'EXECUTED','3:d8390a9f3e5f3d1e7de2e5d0fb773f78','Insert Row','',NULL,'2.0.3'),('ABICLOUDPREMIUM-4986_disable_wizard','xthevenot','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',304,'EXECUTED','3:7b86dc315355b626d8a741bdd6b427c5','Update Data','',NULL,'2.0.3'),('ABICLOUDPREMIUM-5308','apuig','src/2.4.1/kinton-2.4.1.xml','2013-09-20 13:34:49',318,'EXECUTED','3:da5446367114a8600486c51a728a79b6','Custom SQL (x2)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-5321','acooper','src/2.4.1/kinton-2.4.1.xml','2013-09-20 13:34:49',319,'EXECUTED','3:2a28c423f881e89f996514c5b4188adf','Custom SQL, SQL From File','',NULL,'2.0.3'),('ABICLOUDPREMIUM-5435 - Adding a privilege to display DC capacit','xthevenot','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',353,'EXECUTED','3:a1fda7fd00dcfb5b548c4fc1ee9355a1','Insert Row','',NULL,'2.0.3'),('ABICLOUDPREMIUM-5435 - Adding the privilege to Admin role','xthevenot','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',354,'EXECUTED','3:0bb8c4958013450f03cc21114c64ecdb','Insert Row','',NULL,'2.0.3'),('ABICLOUDPREMIUM-5463','destevez','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:54',364,'EXECUTED','3:7ea90fb882b93e990458b9e2d9d4ee16','SQL From File (x2)','',NULL,'2.0.3'),('ABICLOUDPREMIUM-5509_2.6_wiki_links','xthevenot','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',362,'EXECUTED','3:23082c4b69b07cea71f26c5fbcda2417','Update Data (x42), Custom SQL','',NULL,'2.0.3'),('ABICLOUDPREMIUM-5741 - Adding a privilege to delete VM in UNKNO','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',360,'EXECUTED','3:37f4936597fa81cd462a38015ee8a0e3','Insert Row','',NULL,'2.0.3'),('ABICLOUDPREMIUM-5741 - Adding the privilege to Admin role','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',361,'EXECUTED','3:2c694f087abffa2d9dabfa11a2bb9b27','Insert Row','',NULL,'2.0.3'),('ABICLOUDPREMIUM-5899','destevez','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:54',371,'EXECUTED','3:d3910508d1eecf0abd60710da9d30b4f','Custom SQL, SQL From File, Custom SQL, SQL From File','',NULL,'2.0.3'),('AccunoteTask-2658 Extend accounting resources','acooper','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:46',306,'EXECUTED','3:a11bdd62505f64ed9d9318703f48dc41','Custom SQL (x7), SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File','',NULL,'2.0.3'),('Acunote Task 2836(archive table)','acooper','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:46',307,'EXECUTED','3:68606d93699ae27b63d263a774e807cb','Create Table','',NULL,'2.0.3'),('Acunote Task 2836(new indexes)','acooper','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:47',308,'EXECUTED','3:95d2fc3559d2ed1076473616218121d7','Create Index (x6)','',NULL,'2.0.3'),('Acunote Task 2836(new views and SPs)','acooper','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:47',309,'EXECUTED','3:e120aeae3ea2dab22c3c3a3d84139d21','Custom SQL, SQL From File (x2)','',NULL,'2.0.3'),('add_version_column_to_all','destevez','src/2.0ga/procedures.xml','2013-09-20 13:34:32',132,'EXECUTED','3:28232591f7d936ca502b7f812c0eadd8','Custom SQL, SQL From File','',NULL,'2.0.3'),('backupAttribute','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:49',324,'EXECUTED','3:25bca74ec70b2157c6dc218bc26c1651','Create Table','',NULL,'2.0.3'),('backupAttributeData','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:49',326,'EXECUTED','3:9bf6d6bd55caf9d88b974d497c335c0f','Insert Row (x15)','',NULL,'2.0.3'),('backupAttribute_constraints','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:49',325,'EXECUTED','3:7a3ad497bfe7233402153b989c62d003','Add Foreign Key Constraint','',NULL,'2.0.3'),('backupType','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:49',322,'EXECUTED','3:2e63adeba03e5dfab60a883f75853dae','Create Table','',NULL,'2.0.3'),('backupTypeData','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:49',323,'EXECUTED','3:cec8befbed7915168b8070186948bb41','Insert Row (x3)','',NULL,'2.0.3'),('backup_datacenter','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:49',327,'EXECUTED','3:f80393a440ba97c53efa1175dd34143f','Create Table','',NULL,'2.0.3'),('backup_datacenter_attribute','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:49',329,'EXECUTED','3:2401f32236fe49a03a5e90c9dd2a9bb1','Create Table','',NULL,'2.0.3'),('backup_datacenter_attr_constraints','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:50',330,'EXECUTED','3:2ddd13a9432945c9ebdb27450a38bb81','Add Foreign Key Constraint (x2), Add Unique Constraint','',NULL,'2.0.3'),('backup_datacenter_constraints','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:49',328,'EXECUTED','3:42a5540b79c8fb95c8f8cd163bfaf445','Add Foreign Key Constraint (x2), Add Unique Constraint','',NULL,'2.0.3'),('bug 5179','acooper','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:54',369,'EXECUTED','3:7932d6aee148eafa26a96274b08c1fec','Custom SQL, SQL From File','',NULL,'2.0.3'),('bug 5465','acooper','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:54',368,'EXECUTED','3:d651fcb7443e08f2499a65bce890c43b','Custom SQL, SQL From File','',NULL,'2.0.3'),('bug 5856','acooper','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:54',370,'EXECUTED','3:102b7939ef2242b735e870fddaacafd1','Custom SQL, SQL From File','',NULL,'2.0.3'),('bug5134_5820','acooper','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:54',366,'EXECUTED','3:8f0cbf4f565b7b04f0973542cc3175b1','Custom SQL, SQL From File','',NULL,'2.0.3'),('coresPerSocket','apuig','src/2.4.2/kinton-2.4.2.xml','2013-09-20 13:34:49',320,'EXECUTED','3:9e49eadf3c7665c7223f9e89ec2cc700','Add Column (x2)','',NULL,'2.0.3'),('create primary disk','dlopez','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:54',372,'EXECUTED','3:b967b0c70601fe12ceb707ef5ed6246a','Custom SQL, SQL From File, Custom SQL','',NULL,'2.0.3'),('create_virtualmachine_update_stats','destevez','src/2.0ga/triggers.xml','2013-09-20 13:34:32',128,'EXECUTED','3:b4974986747712028c438c1d6396d632','Custom SQL, SQL From File','',NULL,'2.0.3'),('datacenter_universally_UNIQUE identifier','apuig','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',352,'EXECUTED','3:acdf777f83fa7452f719773148fcd514','Add Unique Constraint, Create Index','',NULL,'2.0.3'),('delete_virtualmachine_update_stats','destevez','src/2.0ga/triggers.xml','2013-09-20 13:34:32',129,'EXECUTED','3:5120ec32cead387a721e49d2046ebbfa','Custom SQL, SQL From File','',NULL,'2.0.3'),('deleting_repository','apuig','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',350,'EXECUTED','3:d241cf6be6930213831a176a2573070e','Drop Foreign Key Constraint, Add Foreign Key Constraint','',NULL,'2.0.3'),('deprecateStatsTriggers','destevezg','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:46',305,'EXECUTED','3:f9fa395af80f6a81885f760c64c85abf','Custom SQL (x29), SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File, Custom SQL, SQL From File, Cus...','',NULL,'2.0.3'),('device-iscsi','ibarrera','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',357,'EXECUTED','3:b31d85f2f09c4f7ff299be6faa9d1b00','Rename Column (x2)','',NULL,'2.0.3'),('ereased-templates','apuig','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',337,'EXECUTED','3:bda07d4ca2f42a6a9d6228287cb16849','Add Column','',NULL,'2.0.3'),('fixWrongDBEngine','destevez','src/2.2/kinton-2.2.xml','2013-09-20 13:34:43',259,'EXECUTED','3:c2313c070f2d1d0c561c27d2b46995ba','Custom SQL','',NULL,'2.0.3'),('fix_availableVirtualDatacenters','destevezg (generated)','src/2.0.0-HF1/kinton-2.0.0-HF1.xml','2013-09-20 13:34:42',242,'EXECUTED','3:db92fadc2e165d504c60c4a50b2647ab','Custom SQL','Change to NULL to avoid an empty string for the property availableVirtualDatacenters',NULL,'2.0.3'),('get_datastore_size_by_dc','destevez','src/2.0ga/procedures.xml','2013-09-20 13:34:32',130,'EXECUTED','3:56f165bb9a3b9e122a24bdfa33793533','Custom SQL, SQL From File','',NULL,'2.0.3'),('get_datastore_used_size_by_dc','destevez','src/2.0ga/procedures.xml','2013-09-20 13:34:32',131,'EXECUTED','3:70b261691f20459c61cde2182940c814','Custom SQL, SQL From File','',NULL,'2.0.3'),('hypervisor_connections','eruiz','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',336,'EXECUTED','3:61eedd103dd6fb22ff5a8f8ff96bf8ff','Add Column (x8)','',NULL,'2.0.3'),('hypervisor_nullables','ssedano','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:50',335,'EXECUTED','3:72213369d6a0e69824d4cd099570c747','Modify data type (x5)','',NULL,'2.0.3'),('instances_not_use_ovfid','apuig','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',351,'EXECUTED','3:6d2515f1c00006f7649a6aed882e60c6','Custom SQL','',NULL,'2.0.3'),('jira5153_5154','acooper','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:54',367,'EXECUTED','3:82167c9d557ae3ae67fa96fd13ad4ae3','Custom SQL, SQL From File','',NULL,'2.0.3'),('new_roles','destevezg (generated)','src/2.0.0-HF1/kinton-2.0.0-HF1.xml','2013-09-20 13:34:42',239,'EXECUTED','3:af3b0c4fbec8b55829ccb6bb719d853f','Insert Row (x3)','',NULL,'2.0.3'),('new_roles_privileges','destevezg (generated)','src/2.0.0-HF1/kinton-2.0.0-HF1.xml','2013-09-20 13:34:42',240,'EXECUTED','3:47cd29b2bef41ce1030a4ff606a13247','Insert Row (x3)','',NULL,'2.0.3'),('new_system_properties','destevezg (generated)','src/2.0.0-HF1/kinton-2.0.0-HF1.xml','2013-09-20 13:34:42',241,'EXECUTED','3:fd220730402f42a743fb053338d61469','Insert Row','',NULL,'2.0.3'),('nfslimits','aprete','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:53',363,'EXECUTED','3:0b58c493753aeea75868a9b04229e4ef','SQL From File (x3)','',NULL,'2.0.3'),('pool-maxvolumes-usablepercent','aserralle','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',359,'EXECUTED','3:981f43f560b3c9c522c9d1df75542fe5','Add Column (x2), Custom SQL','',NULL,'2.0.3'),('Privileges related with backup','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:50',332,'EXECUTED','3:8e4df4d031eb9220efc89f4203bb5936','Insert Row (x3)','',NULL,'2.0.3'),('repository-pricing-1','aprete','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:49',321,'EXECUTED','3:ad51969e9724a095b620593b212a2ada','Add Column','',NULL,'2.0.3'),('RolesPrivileges backup','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:50',333,'EXECUTED','3:eaecedfa835e9790debb2fabad8e59b0','Insert Row (x3)','',NULL,'2.0.3'),('scheduledResources','destevezg','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:44',290,'EXECUTED','3:06a0784940e437127f55e3705336624c','Create Table','',NULL,'2.0.3'),('scheduledResourcesIndex','ssedano','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:44',291,'EXECUTED','3:5a816764e753eecd08ef863537443a71','Create Index','',NULL,'2.0.3'),('scheduledResources_drops','destevezg','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',293,'EXECUTED','3:54a8be962c7963b6f8437ba05d202ea1','Drop Column (x3), Drop Table','',NULL,'2.0.3'),('scheduledResources_migration','destevez','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:44',292,'EXECUTED','3:2a987ca881187d8a12206e15a5183f14','Custom SQL, SQL From File, Custom SQL','',NULL,'2.0.3'),('sql_mode','destevez','src/kinton_master_changelog.xml','2013-09-20 13:34:20',1,'EXECUTED','3:825e3d2ad2e776f91586d6a0f1f70155','Custom SQL','',NULL,'2.0.3'),('statisticsViews','destevezg','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',294,'EXECUTED','3:9bd906689864d2f9c14dc4740f5054a3','SQL From File, Drop Table (x4), Custom SQL (x4)','',NULL,'2.0.3'),('storagepool-type','ibarrera','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',355,'EXECUTED','3:d5eca71de4b76557125328886745891c','Add Column, Custom SQL','',NULL,'2.0.3'),('strong-license','ibarrera','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:49',317,'EXECUTED','3:3e124237b1bc1d18e015cbedaf90d3df','Delete Data, Modify data type','',NULL,'2.0.3'),('templates-need-more-info','apuig','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:49',316,'EXECUTED','3:de8c3978e55279dc2f6c5d0611c61ba0','Drop Column, Add Column (x2)','',NULL,'2.0.3'),('tier-storageallocation','aserralle','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',358,'EXECUTED','3:3eec6771d581b7df9ff78e23c0e05961','Add Column, Custom SQL','',NULL,'2.0.3'),('user_user_index','ssedano','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:54',365,'EXECUTED','3:e571bcabc84e97a67a287a1ef9418953','Create Index','',NULL,'2.0.3'),('vm_metadata','sacedo','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:50',331,'EXECUTED','3:b6f28f26f3c05504be22fb8a33d6fe0a','Add Column','',NULL,'2.0.3'),('vnc_enabled_1','jdevesa','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:50',334,'EXECUTED','3:29d68ee306eabd925b5b8dfa7e6ce8ec','Add Column','',NULL,'2.0.3'),('vnc_enabled_2','jdevesa','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',347,'EXECUTED','3:8315f43a402544a4948a9c63e8b442c5','Custom SQL (x2)','',NULL,'2.0.3'),('volume-idscsi','ibarrera','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:52',356,'EXECUTED','3:e5f0d1d592f6c94857c788ab824d5df6','Custom SQL, Drop Column','',NULL,'2.0.3'),('wizardNewWikiLinks','xthevenot','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',298,'EXECUTED','3:3f987075bb9ef0b0c7de3282eac66a00','Insert Row (x3)','',NULL,'2.0.3'),('wizard_license_url','xthevenot','src/2.4.0/kinton-2.4.0.xml','2013-09-20 13:34:45',297,'EXECUTED','3:d224d80d933c8fd89fc1bc938c80fcce','Insert Row','',NULL,'2.0.3'),('workflow_privs','ssedano','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',348,'EXECUTED','3:86de08d8a9996f0c5e5117dec9dc6a07','Insert Row, Custom SQL (x2)','',NULL,'2.0.3'),('workflow_prop','ssedano','src/2.6.0/kinton-2.6.0.xml','2013-09-20 13:34:51',349,'EXECUTED','3:862710ff76cb85bc2a12867b8bf84a5c','Custom SQL (x2)','',NULL,'2.0.3');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `DC_STAT_REPO_USED`
--

DROP TABLE IF EXISTS `DC_STAT_REPO_USED`;
/*!50001 DROP VIEW IF EXISTS `DC_STAT_REPO_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `DC_STAT_REPO_USED` (
  `idDataCenter` tinyint NOT NULL,
  `repositoryUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENTDC_STAT_EXTRA_HD_USED`
--

DROP TABLE IF EXISTS `ENTDC_STAT_EXTRA_HD_USED`;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_EXTRA_HD_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENTDC_STAT_EXTRA_HD_USED` (
  `idDataCenter` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `extraHDUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENTDC_STAT_PUBLIC_IP_STATS`
--

DROP TABLE IF EXISTS `ENTDC_STAT_PUBLIC_IP_STATS`;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_PUBLIC_IP_STATS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENTDC_STAT_PUBLIC_IP_STATS` (
  `idDataCenter` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `publicIPsReserved` tinyint NOT NULL,
  `publicIPsUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENTDC_STAT_REPO_USED`
--

DROP TABLE IF EXISTS `ENTDC_STAT_REPO_USED`;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_REPO_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENTDC_STAT_REPO_USED` (
  `idDataCenter` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `repositoryUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENTDC_STAT_STORAGE_USED`
--

DROP TABLE IF EXISTS `ENTDC_STAT_STORAGE_USED`;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_STORAGE_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENTDC_STAT_STORAGE_USED` (
  `idDataCenter` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `extStorageUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENTDC_STAT_VLANS_USED`
--

DROP TABLE IF EXISTS `ENTDC_STAT_VLANS_USED`;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_VLANS_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENTDC_STAT_VLANS_USED` (
  `idDataCenter` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `vlanUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENTDC_STAT_VM_RESOURCES`
--

DROP TABLE IF EXISTS `ENTDC_STAT_VM_RESOURCES`;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_VM_RESOURCES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENTDC_STAT_VM_RESOURCES` (
  `idDataCenter` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `vCpuUsed` tinyint NOT NULL,
  `memoryUsed` tinyint NOT NULL,
  `localStorageUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENT_STAT_EXTRA_HD_USED`
--

DROP TABLE IF EXISTS `ENT_STAT_EXTRA_HD_USED`;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_EXTRA_HD_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENT_STAT_EXTRA_HD_USED` (
  `idEnterprise` tinyint NOT NULL,
  `extraHDUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENT_STAT_PUBLIC_IP_STATS`
--

DROP TABLE IF EXISTS `ENT_STAT_PUBLIC_IP_STATS`;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_PUBLIC_IP_STATS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENT_STAT_PUBLIC_IP_STATS` (
  `idEnterprise` tinyint NOT NULL,
  `publicIPsReserved` tinyint NOT NULL,
  `publicIPsUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENT_STAT_REPO_USED`
--

DROP TABLE IF EXISTS `ENT_STAT_REPO_USED`;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_REPO_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENT_STAT_REPO_USED` (
  `idEnterprise` tinyint NOT NULL,
  `repositoryUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENT_STAT_STORAGE_USED`
--

DROP TABLE IF EXISTS `ENT_STAT_STORAGE_USED`;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_STORAGE_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENT_STAT_STORAGE_USED` (
  `idEnterprise` tinyint NOT NULL,
  `extStorageUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENT_STAT_VLANS_USED`
--

DROP TABLE IF EXISTS `ENT_STAT_VLANS_USED`;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_VLANS_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENT_STAT_VLANS_USED` (
  `idEnterprise` tinyint NOT NULL,
  `vlanUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ENT_STAT_VM_RESOURCES`
--

DROP TABLE IF EXISTS `ENT_STAT_VM_RESOURCES`;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_VM_RESOURCES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ENT_STAT_VM_RESOURCES` (
  `idEnterprise` tinyint NOT NULL,
  `vCpuUsed` tinyint NOT NULL,
  `memoryUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `METERING_ALL_VW`
--

DROP TABLE IF EXISTS `METERING_ALL_VW`;
/*!50001 DROP VIEW IF EXISTS `METERING_ALL_VW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `METERING_ALL_VW` (
  `idMeter` tinyint NOT NULL,
  `idDatacenter` tinyint NOT NULL,
  `datacenter` tinyint NOT NULL,
  `idRack` tinyint NOT NULL,
  `rack` tinyint NOT NULL,
  `idPhysicalMachine` tinyint NOT NULL,
  `physicalmachine` tinyint NOT NULL,
  `idStorageSystem` tinyint NOT NULL,
  `storageSystem` tinyint NOT NULL,
  `idStoragePool` tinyint NOT NULL,
  `storagePool` tinyint NOT NULL,
  `idVolume` tinyint NOT NULL,
  `volume` tinyint NOT NULL,
  `idNetwork` tinyint NOT NULL,
  `network` tinyint NOT NULL,
  `idSubnet` tinyint NOT NULL,
  `subnet` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `enterprise` tinyint NOT NULL,
  `idUser` tinyint NOT NULL,
  `user` tinyint NOT NULL,
  `idVirtualDataCenter` tinyint NOT NULL,
  `virtualDataCenter` tinyint NOT NULL,
  `idVirtualApp` tinyint NOT NULL,
  `virtualApp` tinyint NOT NULL,
  `idVirtualMachine` tinyint NOT NULL,
  `virtualmachine` tinyint NOT NULL,
  `severity` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `performedby` tinyint NOT NULL,
  `actionperformed` tinyint NOT NULL,
  `component` tinyint NOT NULL,
  `stacktrace` tinyint NOT NULL,
  `version_c` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VAPP_STAT_ASSOC_VOLUMES`
--

DROP TABLE IF EXISTS `VAPP_STAT_ASSOC_VOLUMES`;
/*!50001 DROP VIEW IF EXISTS `VAPP_STAT_ASSOC_VOLUMES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VAPP_STAT_ASSOC_VOLUMES` (
  `idVirtualApp` tinyint NOT NULL,
  `volAssociated` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VAPP_STAT_ATTACH_VOLUMES`
--

DROP TABLE IF EXISTS `VAPP_STAT_ATTACH_VOLUMES`;
/*!50001 DROP VIEW IF EXISTS `VAPP_STAT_ATTACH_VOLUMES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VAPP_STAT_ATTACH_VOLUMES` (
  `idVirtualApp` tinyint NOT NULL,
  `volAttached` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VAPP_STAT_VM_COUNTS`
--

DROP TABLE IF EXISTS `VAPP_STAT_VM_COUNTS`;
/*!50001 DROP VIEW IF EXISTS `VAPP_STAT_VM_COUNTS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VAPP_STAT_VM_COUNTS` (
  `idVirtualApp` tinyint NOT NULL,
  `vmCreated` tinyint NOT NULL,
  `vmActive` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VDC_STAT_ASSOC_VOLUMES`
--

DROP TABLE IF EXISTS `VDC_STAT_ASSOC_VOLUMES`;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_ASSOC_VOLUMES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VDC_STAT_ASSOC_VOLUMES` (
  `idVirtualDataCenter` tinyint NOT NULL,
  `volCreated` tinyint NOT NULL,
  `volAssociated` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VDC_STAT_ATTACH_VOLUMES`
--

DROP TABLE IF EXISTS `VDC_STAT_ATTACH_VOLUMES`;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_ATTACH_VOLUMES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VDC_STAT_ATTACH_VOLUMES` (
  `idVirtualDataCenter` tinyint NOT NULL,
  `volAttached` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VDC_STAT_EXTRA_HD_USED`
--

DROP TABLE IF EXISTS `VDC_STAT_EXTRA_HD_USED`;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_EXTRA_HD_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VDC_STAT_EXTRA_HD_USED` (
  `idVirtualDataCenter` tinyint NOT NULL,
  `extraHDUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VDC_STAT_PUBLIC_IP_STATS`
--

DROP TABLE IF EXISTS `VDC_STAT_PUBLIC_IP_STATS`;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_PUBLIC_IP_STATS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VDC_STAT_PUBLIC_IP_STATS` (
  `idVirtualDataCenter` tinyint NOT NULL,
  `publicIPsReserved` tinyint NOT NULL,
  `publicIPsUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VDC_STAT_STORAGE_USED`
--

DROP TABLE IF EXISTS `VDC_STAT_STORAGE_USED`;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_STORAGE_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VDC_STAT_STORAGE_USED` (
  `idVirtualDataCenter` tinyint NOT NULL,
  `extStorageUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VDC_STAT_VLANS_USED`
--

DROP TABLE IF EXISTS `VDC_STAT_VLANS_USED`;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_VLANS_USED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VDC_STAT_VLANS_USED` (
  `idVirtualDataCenter` tinyint NOT NULL,
  `vlanUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VDC_STAT_VM_COUNTS`
--

DROP TABLE IF EXISTS `VDC_STAT_VM_COUNTS`;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_VM_COUNTS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VDC_STAT_VM_COUNTS` (
  `idVirtualDataCenter` tinyint NOT NULL,
  `vmCreated` tinyint NOT NULL,
  `vmActive` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VDC_STAT_VM_RESOURCES`
--

DROP TABLE IF EXISTS `VDC_STAT_VM_RESOURCES`;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_VM_RESOURCES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VDC_STAT_VM_RESOURCES` (
  `idVirtualDataCenter` tinyint NOT NULL,
  `vCpuUsed` tinyint NOT NULL,
  `memoryUsed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `accounting_event_detail_deprecated`
--

DROP TABLE IF EXISTS `accounting_event_detail_deprecated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_detail_deprecated` (
  `idAccountingEvent` bigint(20) NOT NULL AUTO_INCREMENT,
  `startTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `idAccountingResourceType` tinyint(4) NOT NULL,
  `resourceType` varchar(255) NOT NULL,
  `resourceUnits` bigint(20) NOT NULL,
  `resourceName` varchar(511) NOT NULL,
  `idEnterprise` int(10) unsigned NOT NULL,
  `idVirtualDataCenter` int(10) unsigned NOT NULL,
  `idVirtualApp` int(10) unsigned DEFAULT NULL,
  `idVirtualMachine` int(10) unsigned DEFAULT NULL,
  `enterpriseName` varchar(255) NOT NULL,
  `virtualDataCenter` varchar(255) NOT NULL,
  `virtualApp` varchar(255) DEFAULT NULL,
  `virtualMachine` varchar(255) DEFAULT NULL,
  `costCode` int(11) DEFAULT NULL,
  `idStorageTier` int(11) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_detail_deprecated`
--

LOCK TABLES `accounting_event_detail_deprecated` WRITE;
/*!40000 ALTER TABLE `accounting_event_detail_deprecated` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_detail_deprecated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_event_ips_deprecated`
--

DROP TABLE IF EXISTS `accounting_event_ips_deprecated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_ips_deprecated` (
  `idIPsAccountingEvent` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idManagement` int(10) unsigned NOT NULL,
  `idEnterprise` int(10) unsigned NOT NULL,
  `idVirtualDataCenter` int(10) unsigned NOT NULL,
  `ip` varchar(20) NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `stopTime` timestamp NULL DEFAULT NULL,
  `consolidated` tinyint(1) NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idIPsAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_ips_deprecated`
--

LOCK TABLES `accounting_event_ips_deprecated` WRITE;
/*!40000 ALTER TABLE `accounting_event_ips_deprecated` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_ips_deprecated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_event_storage_deprecated`
--

DROP TABLE IF EXISTS `accounting_event_storage_deprecated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_storage_deprecated` (
  `idStorageAccountingEvent` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idResource` varchar(50) DEFAULT NULL,
  `resourceName` varchar(511) DEFAULT NULL,
  `idVM` int(10) unsigned DEFAULT NULL,
  `idStorageTier` int(10) unsigned DEFAULT NULL,
  `idEnterprise` int(10) unsigned NOT NULL,
  `idVirtualDataCenter` int(10) unsigned NOT NULL,
  `idVirtualApp` int(10) unsigned DEFAULT NULL,
  `sizeReserved` bigint(20) unsigned NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `stopTime` timestamp NULL DEFAULT NULL,
  `consolidated` tinyint(1) NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idStorageAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_storage_deprecated`
--

LOCK TABLES `accounting_event_storage_deprecated` WRITE;
/*!40000 ALTER TABLE `accounting_event_storage_deprecated` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_storage_deprecated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_event_vlan_deprecated`
--

DROP TABLE IF EXISTS `accounting_event_vlan_deprecated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_vlan_deprecated` (
  `idVLANAccountingEvent` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vlan_network_id` int(10) unsigned NOT NULL,
  `idEnterprise` int(10) unsigned NOT NULL,
  `idVirtualDataCenter` int(10) unsigned NOT NULL,
  `network_name` varchar(40) NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `stopTime` timestamp NULL DEFAULT NULL,
  `consolidated` tinyint(1) NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idVLANAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_vlan_deprecated`
--

LOCK TABLES `accounting_event_vlan_deprecated` WRITE;
/*!40000 ALTER TABLE `accounting_event_vlan_deprecated` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_vlan_deprecated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_event_vm_deprecated`
--

DROP TABLE IF EXISTS `accounting_event_vm_deprecated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_vm_deprecated` (
  `idVMAccountingEvent` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idVM` int(10) unsigned NOT NULL,
  `idEnterprise` int(10) unsigned NOT NULL,
  `idVirtualDataCenter` int(10) unsigned NOT NULL,
  `idVirtualApp` int(10) unsigned NOT NULL,
  `cpu` int(10) unsigned NOT NULL,
  `ram` int(10) unsigned NOT NULL,
  `hd` bigint(20) unsigned NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `stopTime` timestamp NULL DEFAULT NULL,
  `consolidated` tinyint(1) NOT NULL DEFAULT '0',
  `costCode` int(11) DEFAULT NULL,
  `hypervisorType` varchar(255) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idVMAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_vm_deprecated`
--

LOCK TABLES `accounting_event_vm_deprecated` WRITE;
/*!40000 ALTER TABLE `accounting_event_vm_deprecated` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_vm_deprecated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` char(36) NOT NULL,
  `type` varchar(60) NOT NULL,
  `value` varchar(60) NOT NULL,
  `description` varchar(240) DEFAULT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES ('1','REGISTER','LATER',NULL,'2012-04-23 08:25:41',0),('2','HEARTBEAT','YES',NULL,'2012-04-23 08:25:41',0);
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allowed_tier_by_enterprise`
--

DROP TABLE IF EXISTS `allowed_tier_by_enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowed_tier_by_enterprise` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idDatacenterLimit` int(10) unsigned NOT NULL,
  `idTier` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_allowed_tier` (`idDatacenterLimit`,`idTier`),
  KEY `FK_allowed_tier_by_enterprise_tier` (`idTier`),
  CONSTRAINT `FK_allowed_tier_by_enterprise_tier` FOREIGN KEY (`idTier`) REFERENCES `tier` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_allowed_tier_by_enterprise_datacenter_limit` FOREIGN KEY (`idDatacenterLimit`) REFERENCES `enterprise_limits_by_datacenter` (`idDatacenterLimit`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowed_tier_by_enterprise`
--

LOCK TABLES `allowed_tier_by_enterprise` WRITE;
/*!40000 ALTER TABLE `allowed_tier_by_enterprise` DISABLE KEYS */;
/*!40000 ALTER TABLE `allowed_tier_by_enterprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apps_library`
--

DROP TABLE IF EXISTS `apps_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apps_library` (
  `id_apps_library` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEnterprise` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id_apps_library`),
  KEY `fk_idEnterpriseApps` (`idEnterprise`),
  CONSTRAINT `fk_idEnterpriseApps` FOREIGN KEY (`idEnterprise`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apps_library`
--

LOCK TABLES `apps_library` WRITE;
/*!40000 ALTER TABLE `apps_library` DISABLE KEYS */;
INSERT INTO `apps_library` VALUES (1,1,0);
/*!40000 ALTER TABLE `apps_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'GENERIC','Generic',0),(2,'MAIN','Flex client main menu group',0),(3,'USER','Flex and server Users Management',0),(4,'APPLIANCE_LIBRARY','Flex and server Appliance Library Management',0);
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_serverresource`
--

DROP TABLE IF EXISTS `auth_serverresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_serverresource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `idGroup` int(10) unsigned DEFAULT NULL,
  `idRole` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `auth_serverresourceFK1` (`idGroup`),
  KEY `auth_serverresourceFK2` (`idRole`),
  CONSTRAINT `auth_serverresourceFK2` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `auth_serverresourceFK1` FOREIGN KEY (`idGroup`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_serverresource`
--

LOCK TABLES `auth_serverresource` WRITE;
/*!40000 ALTER TABLE `auth_serverresource` DISABLE KEYS */;
INSERT INTO `auth_serverresource` VALUES (1,'LOGIN','Login Service',1,2,0),(2,'ENTERPRISE_GET_ALL_ENTERPRISES','Security to retrieve the whole list of enterprises',3,1,0),(3,'ENTERPRISE_GET_ENTERPRISES','Security to call method getEnterprises in UserCommand',3,3,0),(4,'USER_GETUSERS','Security to call method getUsers in UserCommand',3,3,0),(5,'USER_GET_ALL_USERS','Security to retrieve the whole list of users',3,1,0);
/*!40000 ALTER TABLE `auth_serverresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_serverresource_exception`
--

DROP TABLE IF EXISTS `auth_serverresource_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_serverresource_exception` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idResource` int(10) unsigned NOT NULL,
  `idUser` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `auth_serverresource_exceptionFK1` (`idResource`),
  KEY `auth_serverresource_exceptionFK2` (`idUser`),
  CONSTRAINT `auth_serverresource_exceptionFK2` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `auth_serverresource_exceptionFK1` FOREIGN KEY (`idResource`) REFERENCES `auth_serverresource` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_serverresource_exception`
--

LOCK TABLES `auth_serverresource_exception` WRITE;
/*!40000 ALTER TABLE `auth_serverresource_exception` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_serverresource_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_attribute`
--

DROP TABLE IF EXISTS `backup_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_attribute` (
  `idBackupAttribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idBackupType` int(10) unsigned NOT NULL,
  `period` varchar(20) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idBackupAttribute`),
  KEY `backupType_FK1` (`idBackupType`),
  CONSTRAINT `backupType_FK1` FOREIGN KEY (`idBackupType`) REFERENCES `backup_type` (`idBackupType`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_attribute`
--

LOCK TABLES `backup_attribute` WRITE;
/*!40000 ALTER TABLE `backup_attribute` DISABLE KEYS */;
INSERT INTO `backup_attribute` VALUES (1,1,'defined_hour',0),(2,1,'hourly',0),(3,1,'daily',0),(5,1,'weekly_planned',0),(6,1,'monthly',0),(7,2,'defined_hour',0),(8,2,'hourly',0),(9,2,'daily',0),(10,2,'weekly_planned',0),(11,2,'monthly',0),(12,3,'defined_hour',0),(13,3,'hourly',0),(14,3,'daily',0),(15,3,'weekly_planned',0),(16,3,'monthly',0);
/*!40000 ALTER TABLE `backup_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_datacenter`
--

DROP TABLE IF EXISTS `backup_datacenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_datacenter` (
  `idBackupDatacenter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idBackupType` int(10) unsigned NOT NULL,
  `idDatacenter` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idBackupDatacenter`),
  UNIQUE KEY `backupDatacenter_FK3` (`idBackupType`,`idDatacenter`),
  KEY `backupDatacenter_FK2` (`idDatacenter`),
  CONSTRAINT `backupDatacenter_FK2` FOREIGN KEY (`idDatacenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `backupDatacenter_FK1` FOREIGN KEY (`idBackupType`) REFERENCES `backup_type` (`idBackupType`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_datacenter`
--

LOCK TABLES `backup_datacenter` WRITE;
/*!40000 ALTER TABLE `backup_datacenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_datacenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_datacenter_attribute`
--

DROP TABLE IF EXISTS `backup_datacenter_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_datacenter_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idBackupAttribute` int(10) unsigned NOT NULL,
  `idBackupDatacenter` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_backup_datacenter_attribute` (`idBackupAttribute`,`idBackupDatacenter`),
  KEY `backupDcAttr_FK2` (`idBackupDatacenter`),
  CONSTRAINT `backupDcAttr_FK2` FOREIGN KEY (`idBackupDatacenter`) REFERENCES `backup_datacenter` (`idBackupDatacenter`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `backupDcAttr_FK1` FOREIGN KEY (`idBackupAttribute`) REFERENCES `backup_attribute` (`idBackupAttribute`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_datacenter_attribute`
--

LOCK TABLES `backup_datacenter_attribute` WRITE;
/*!40000 ALTER TABLE `backup_datacenter_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_datacenter_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_type`
--

DROP TABLE IF EXISTS `backup_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_type` (
  `idBackupType` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idBackupType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_type`
--

LOCK TABLES `backup_type` WRITE;
/*!40000 ALTER TABLE `backup_type` DISABLE KEYS */;
INSERT INTO `backup_type` VALUES (1,'snapshot',0),(2,'filesystem',0),(3,'complete',0);
/*!40000 ALTER TABLE `backup_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `idCategory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `isErasable` int(10) unsigned NOT NULL DEFAULT '1',
  `isDefault` int(10) unsigned NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  `idEnterprise` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idCategory`),
  UNIQUE KEY `name` (`name`,`idEnterprise`),
  KEY `category_enterprise_FK` (`idEnterprise`),
  CONSTRAINT `category_enterprise_FK` FOREIGN KEY (`idEnterprise`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Others',0,1,0,NULL),(2,'Database servers',1,0,0,NULL),(4,'Applications servers',1,0,0,NULL),(5,'Web servers',1,0,0,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chargeback_simple`
--

DROP TABLE IF EXISTS `chargeback_simple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chargeback_simple` (
  `idAccountingResourceType` tinyint(4) NOT NULL,
  `resourceType` varchar(20) NOT NULL,
  `costPerHour` decimal(15,12) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idAccountingResourceType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chargeback_simple`
--

LOCK TABLES `chargeback_simple` WRITE;
/*!40000 ALTER TABLE `chargeback_simple` DISABLE KEYS */;
/*!40000 ALTER TABLE `chargeback_simple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chef_runlist`
--

DROP TABLE IF EXISTS `chef_runlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chef_runlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idVM` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chef_runlist_FK1` (`idVM`),
  CONSTRAINT `chef_runlist_FK1` FOREIGN KEY (`idVM`) REFERENCES `virtualmachine` (`idVM`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef_runlist`
--

LOCK TABLES `chef_runlist` WRITE;
/*!40000 ALTER TABLE `chef_runlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `chef_runlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `cloud_usage_stats_vw`
--

DROP TABLE IF EXISTS `cloud_usage_stats_vw`;
/*!50001 DROP VIEW IF EXISTS `cloud_usage_stats_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `cloud_usage_stats_vw` (
  `idDataCenter` tinyint NOT NULL,
  `serversTotal` tinyint NOT NULL,
  `serversRunning` tinyint NOT NULL,
  `storageTotal` tinyint NOT NULL,
  `storageReserved` tinyint NOT NULL,
  `storageUsed` tinyint NOT NULL,
  `publicIPsTotal` tinyint NOT NULL,
  `publicIPsReserved` tinyint NOT NULL,
  `publicIPsUsed` tinyint NOT NULL,
  `vlanReserved` tinyint NOT NULL,
  `vlanUsed` tinyint NOT NULL,
  `vMachinesTotal` tinyint NOT NULL,
  `vMachinesRunning` tinyint NOT NULL,
  `vCpuTotal` tinyint NOT NULL,
  `vCpuReserved` tinyint NOT NULL,
  `vCpuUsed` tinyint NOT NULL,
  `vMemoryTotal` tinyint NOT NULL,
  `vMemoryReserved` tinyint NOT NULL,
  `vMemoryUsed` tinyint NOT NULL,
  `vStorageReserved` tinyint NOT NULL,
  `vStorageUsed` tinyint NOT NULL,
  `vStorageTotal` tinyint NOT NULL,
  `numUsersCreated` tinyint NOT NULL,
  `numVDCCreated` tinyint NOT NULL,
  `numEnterprisesCreated` tinyint NOT NULL,
  `repositoryReserved` tinyint NOT NULL,
  `repositoryUsed` tinyint NOT NULL,
  `version_c` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `costCode`
--

DROP TABLE IF EXISTS `costCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costCode` (
  `idCostCode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idCostCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costCode`
--

LOCK TABLES `costCode` WRITE;
/*!40000 ALTER TABLE `costCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `costCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costCodeCurrency`
--

DROP TABLE IF EXISTS `costCodeCurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costCodeCurrency` (
  `idCostCodeCurrency` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idCostCode` int(10) unsigned DEFAULT NULL,
  `idCurrency` int(10) unsigned DEFAULT NULL,
  `price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idCostCodeCurrency`),
  KEY `idCurrency_FK` (`idCurrency`),
  KEY `idCostCode_FK` (`idCostCode`),
  CONSTRAINT `idCostCode_FK` FOREIGN KEY (`idCostCode`) REFERENCES `costCode` (`idCostCode`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `idCurrency_FK` FOREIGN KEY (`idCurrency`) REFERENCES `currency` (`idCurrency`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costCodeCurrency`
--

LOCK TABLES `costCodeCurrency` WRITE;
/*!40000 ALTER TABLE `costCodeCurrency` DISABLE KEYS */;
/*!40000 ALTER TABLE `costCodeCurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credentials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `access` varchar(255) NOT NULL DEFAULT 'auto_name',
  `key` varchar(255) NOT NULL DEFAULT 'auto_name',
  `idPhysicalMachine` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_credentials_machine` (`idPhysicalMachine`),
  CONSTRAINT `fk_credentials_machine` FOREIGN KEY (`idPhysicalMachine`) REFERENCES `physicalmachine` (`idPhysicalMachine`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `idCurrency` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `digits` int(11) NOT NULL DEFAULT '2',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idCurrency`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'USD','Dollar - $',2,0),(2,'EUR','Euro - €',2,0),(3,'JPY','Yen - ¥',0,0);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datacenter`
--

DROP TABLE IF EXISTS `datacenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datacenter` (
  `idDataCenter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `situation` varchar(100) DEFAULT NULL,
  `network_id` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idDataCenter`),
  UNIQUE KEY `UQ_UUID` (`uuid`),
  KEY `datacenternetwork_FK1` (`network_id`),
  KEY `IX_DATACENTER_UUID` (`uuid`),
  CONSTRAINT `datacenternetwork_FK1` FOREIGN KEY (`network_id`) REFERENCES `network` (`network_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter`
--

LOCK TABLES `datacenter` WRITE;
/*!40000 ALTER TABLE `datacenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `datacenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datastore`
--

DROP TABLE IF EXISTS `datastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datastore` (
  `idDatastore` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rootPath` varchar(42) NOT NULL,
  `directory` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `size` bigint(20) unsigned NOT NULL,
  `datastoreUuid` varchar(255) DEFAULT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idDatastore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datastore`
--

LOCK TABLES `datastore` WRITE;
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_enterprise_stats`
--

DROP TABLE IF EXISTS `dc_enterprise_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_enterprise_stats` (
  `idDCEnterpriseStats` int(11) NOT NULL AUTO_INCREMENT,
  `idDataCenter` int(11) NOT NULL,
  `idEnterprise` int(11) NOT NULL,
  `vCpuReserved` bigint(20) unsigned DEFAULT '0',
  `vCpuUsed` bigint(20) unsigned DEFAULT '0',
  `memoryReserved` bigint(20) unsigned DEFAULT '0',
  `memoryUsed` bigint(20) unsigned DEFAULT '0',
  `localStorageReserved` bigint(20) unsigned DEFAULT '0',
  `localStorageUsed` bigint(20) unsigned DEFAULT '0',
  `extStorageReserved` bigint(20) unsigned DEFAULT '0',
  `extStorageUsed` bigint(20) unsigned DEFAULT '0',
  `repositoryReserved` bigint(20) unsigned DEFAULT '0',
  `repositoryUsed` bigint(20) unsigned DEFAULT '0',
  `publicIPsReserved` bigint(20) unsigned NOT NULL DEFAULT '0',
  `publicIPsUsed` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vlanReserved` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vlanUsed` bigint(20) unsigned NOT NULL DEFAULT '0',
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idDCEnterpriseStats`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_enterprise_stats`
--

LOCK TABLES `dc_enterprise_stats` WRITE;
/*!40000 ALTER TABLE `dc_enterprise_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_enterprise_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `dc_enterprise_stats_vw`
--

DROP TABLE IF EXISTS `dc_enterprise_stats_vw`;
/*!50001 DROP VIEW IF EXISTS `dc_enterprise_stats_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `dc_enterprise_stats_vw` (
  `idDCEnterpriseStats` tinyint NOT NULL,
  `idDataCenter` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `vCpuReserved` tinyint NOT NULL,
  `vCpuUsed` tinyint NOT NULL,
  `memoryReserved` tinyint NOT NULL,
  `memoryUsed` tinyint NOT NULL,
  `localStorageReserved` tinyint NOT NULL,
  `localStorageUsed` tinyint NOT NULL,
  `extStorageReserved` tinyint NOT NULL,
  `extStorageUsed` tinyint NOT NULL,
  `repositoryReserved` tinyint NOT NULL,
  `repositoryUsed` tinyint NOT NULL,
  `publicIPsReserved` tinyint NOT NULL,
  `publicIPsUsed` tinyint NOT NULL,
  `vlanReserved` tinyint NOT NULL,
  `vlanUsed` tinyint NOT NULL,
  `version_c` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dhcpOption`
--

DROP TABLE IF EXISTS `dhcpOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dhcpOption` (
  `idDhcpOption` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dhcp_opt` int(11) NOT NULL,
  `gateway` varchar(40) DEFAULT NULL,
  `network_address` varchar(40) NOT NULL,
  `mask` int(11) NOT NULL,
  `netmask` varchar(20) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idDhcpOption`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhcpOption`
--

LOCK TABLES `dhcpOption` WRITE;
/*!40000 ALTER TABLE `dhcpOption` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhcpOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disk_management`
--

DROP TABLE IF EXISTS `disk_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disk_management` (
  `idManagement` int(10) unsigned NOT NULL,
  `idDatastore` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  KEY `disk_datastore_FK` (`idDatastore`),
  KEY `disk_idManagement_FK` (`idManagement`),
  CONSTRAINT `disk_idManagement_FK` FOREIGN KEY (`idManagement`) REFERENCES `rasd_management` (`idManagement`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `disk_datastore_FK` FOREIGN KEY (`idDatastore`) REFERENCES `datastore` (`idDatastore`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_management`
--

LOCK TABLES `disk_management` WRITE;
/*!40000 ALTER TABLE `disk_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `disk_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvd_management`
--

DROP TABLE IF EXISTS `dvd_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dvd_management` (
  `idManagement` int(10) unsigned NOT NULL,
  `idImage` int(10) unsigned DEFAULT NULL,
  KEY `dvd_management_image_FK` (`idImage`),
  KEY `dvd_idManagement_FK` (`idManagement`),
  CONSTRAINT `dvd_idManagement_FK` FOREIGN KEY (`idManagement`) REFERENCES `rasd_management` (`idManagement`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `dvd_management_image_FK` FOREIGN KEY (`idImage`) REFERENCES `virtualimage` (`idImage`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvd_management`
--

LOCK TABLES `dvd_management` WRITE;
/*!40000 ALTER TABLE `dvd_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `dvd_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise`
--

DROP TABLE IF EXISTS `enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise` (
  `idEnterprise` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `ramSoft` bigint(20) NOT NULL DEFAULT '0',
  `cpuSoft` bigint(20) NOT NULL DEFAULT '0',
  `hdSoft` bigint(20) NOT NULL DEFAULT '0',
  `storageSoft` bigint(20) NOT NULL DEFAULT '0',
  `repositorySoft` bigint(20) NOT NULL DEFAULT '0',
  `vlanSoft` bigint(20) NOT NULL DEFAULT '0',
  `publicIPSoft` bigint(20) NOT NULL DEFAULT '0',
  `ramHard` bigint(20) NOT NULL DEFAULT '0',
  `cpuHard` bigint(20) NOT NULL DEFAULT '0',
  `hdHard` bigint(20) NOT NULL DEFAULT '0',
  `storageHard` bigint(20) NOT NULL DEFAULT '0',
  `repositoryHard` bigint(20) NOT NULL DEFAULT '0',
  `vlanHard` bigint(20) NOT NULL DEFAULT '0',
  `publicIPHard` bigint(20) NOT NULL DEFAULT '0',
  `chef_url` varchar(255) DEFAULT NULL,
  `chef_client` varchar(50) DEFAULT NULL,
  `chef_validator` varchar(50) DEFAULT NULL,
  `chef_client_certificate` text,
  `chef_validator_certificate` text,
  `isReservationRestricted` tinyint(1) DEFAULT '0',
  `version_c` int(11) NOT NULL DEFAULT '1',
  `idPricingTemplate` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idEnterprise`),
  KEY `enterprise_pricing_FK` (`idPricingTemplate`),
  CONSTRAINT `enterprise_pricing_FK` FOREIGN KEY (`idPricingTemplate`) REFERENCES `pricingTemplate` (`idPricingTemplate`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise`
--

LOCK TABLES `enterprise` WRITE;
/*!40000 ALTER TABLE `enterprise` DISABLE KEYS */;
INSERT INTO `enterprise` VALUES (1,'Abiquo',0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,1,NULL);
/*!40000 ALTER TABLE `enterprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_limits_by_datacenter`
--

DROP TABLE IF EXISTS `enterprise_limits_by_datacenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_limits_by_datacenter` (
  `idDatacenterLimit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEnterprise` int(10) unsigned DEFAULT NULL,
  `idDataCenter` int(10) unsigned DEFAULT NULL,
  `ramSoft` bigint(20) NOT NULL,
  `cpuSoft` bigint(20) NOT NULL,
  `hdSoft` bigint(20) NOT NULL,
  `storageSoft` bigint(20) NOT NULL,
  `repositorySoft` bigint(20) NOT NULL,
  `vlanSoft` bigint(20) NOT NULL,
  `publicIPSoft` bigint(20) NOT NULL,
  `ramHard` bigint(20) NOT NULL,
  `cpuHard` bigint(20) NOT NULL,
  `hdHard` bigint(20) NOT NULL,
  `storageHard` bigint(20) NOT NULL,
  `repositoryHard` bigint(20) NOT NULL,
  `vlanHard` bigint(20) NOT NULL,
  `publicIPHard` bigint(20) NOT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  `default_vlan_network_id` int(10) unsigned DEFAULT NULL,
  `idCredentials` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idDatacenterLimit`),
  KEY `enterprise_FK7` (`default_vlan_network_id`),
  KEY `fk_enterprise_limits_by_datacenter_credentials` (`idCredentials`),
  CONSTRAINT `fk_enterprise_limits_by_datacenter_credentials` FOREIGN KEY (`idCredentials`) REFERENCES `credentials` (`id`) ON DELETE SET NULL,
  CONSTRAINT `enterprise_FK7` FOREIGN KEY (`default_vlan_network_id`) REFERENCES `vlan_network` (`vlan_network_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_limits_by_datacenter`
--

LOCK TABLES `enterprise_limits_by_datacenter` WRITE;
/*!40000 ALTER TABLE `enterprise_limits_by_datacenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_limits_by_datacenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_properties`
--

DROP TABLE IF EXISTS `enterprise_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_properties` (
  `idProperties` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enterprise` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idProperties`),
  KEY `FK_enterprise` (`enterprise`),
  CONSTRAINT `FK_enterprise` FOREIGN KEY (`enterprise`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_properties`
--

LOCK TABLES `enterprise_properties` WRITE;
/*!40000 ALTER TABLE `enterprise_properties` DISABLE KEYS */;
INSERT INTO `enterprise_properties` VALUES (1,1,0);
/*!40000 ALTER TABLE `enterprise_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_properties_map`
--

DROP TABLE IF EXISTS `enterprise_properties_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_properties_map` (
  `enterprise_properties` int(10) unsigned NOT NULL,
  `map_key` varchar(30) NOT NULL,
  `value` varchar(50) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  KEY `FK2_enterprise_properties` (`enterprise_properties`),
  CONSTRAINT `FK2_enterprise_properties` FOREIGN KEY (`enterprise_properties`) REFERENCES `enterprise_properties` (`idProperties`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_properties_map`
--

LOCK TABLES `enterprise_properties_map` WRITE;
/*!40000 ALTER TABLE `enterprise_properties_map` DISABLE KEYS */;
INSERT INTO `enterprise_properties_map` VALUES (1,'Support e-mail','support@abiquo.com',0);
/*!40000 ALTER TABLE `enterprise_properties_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `enterprise_resources_stats_vw`
--

DROP TABLE IF EXISTS `enterprise_resources_stats_vw`;
/*!50001 DROP VIEW IF EXISTS `enterprise_resources_stats_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `enterprise_resources_stats_vw` (
  `idEnterprise` tinyint NOT NULL,
  `vCpuReserved` tinyint NOT NULL,
  `vCpuUsed` tinyint NOT NULL,
  `memoryReserved` tinyint NOT NULL,
  `memoryUsed` tinyint NOT NULL,
  `localStorageReserved` tinyint NOT NULL,
  `localStorageUsed` tinyint NOT NULL,
  `extStorageReserved` tinyint NOT NULL,
  `extStorageUsed` tinyint NOT NULL,
  `repositoryReserved` tinyint NOT NULL,
  `repositoryUsed` tinyint NOT NULL,
  `publicIPsReserved` tinyint NOT NULL,
  `publicIPsUsed` tinyint NOT NULL,
  `vlanReserved` tinyint NOT NULL,
  `vlanUsed` tinyint NOT NULL,
  `version_c` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `enterprise_theme`
--

DROP TABLE IF EXISTS `enterprise_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_theme` (
  `idEnterprise` int(10) unsigned NOT NULL,
  `company_logo_path` text,
  `theme` text,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idEnterprise`),
  CONSTRAINT `THEME_FK1` FOREIGN KEY (`idEnterprise`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_theme`
--

LOCK TABLES `enterprise_theme` WRITE;
/*!40000 ALTER TABLE `enterprise_theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardware_profile`
--

DROP TABLE IF EXISTS `hardware_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'auto_name',
  `cpu` int(11) NOT NULL DEFAULT '0',
  `ram` int(11) NOT NULL DEFAULT '0',
  `hd` int(11) NOT NULL DEFAULT '0',
  `idDatacenter` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_hardware_profile_datacenter` (`idDatacenter`),
  CONSTRAINT `fk_hardware_profile_datacenter` FOREIGN KEY (`idDatacenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware_profile`
--

LOCK TABLES `hardware_profile` WRITE;
/*!40000 ALTER TABLE `hardware_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `hardware_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heartbeatlog`
--

DROP TABLE IF EXISTS `heartbeatlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heartbeatlog` (
  `id` char(36) NOT NULL,
  `abicloud_id` varchar(60) DEFAULT NULL,
  `client_ip` varchar(16) NOT NULL,
  `physical_servers` int(11) NOT NULL,
  `virtual_machines` int(11) NOT NULL,
  `volumes` int(11) NOT NULL,
  `virtual_datacenters` int(11) NOT NULL,
  `virtual_appliances` int(11) NOT NULL,
  `organizations` int(11) NOT NULL,
  `total_virtual_cores_allocated` bigint(20) NOT NULL,
  `total_virtual_cores_used` bigint(20) NOT NULL,
  `total_virtual_cores` bigint(20) NOT NULL DEFAULT '0',
  `total_virtual_memory_allocated` bigint(20) NOT NULL,
  `total_virtual_memory_used` bigint(20) NOT NULL,
  `total_virtual_memory` bigint(20) NOT NULL DEFAULT '0',
  `total_volume_space_allocated` bigint(20) NOT NULL,
  `total_volume_space_used` bigint(20) NOT NULL,
  `total_volume_space` bigint(20) NOT NULL DEFAULT '0',
  `virtual_images` bigint(20) NOT NULL,
  `operating_system_name` varchar(60) NOT NULL,
  `operating_system_version` varchar(60) NOT NULL,
  `database_name` varchar(60) NOT NULL,
  `database_version` varchar(60) NOT NULL,
  `application_server_name` varchar(60) NOT NULL,
  `application_server_version` varchar(60) NOT NULL,
  `java_version` varchar(60) NOT NULL,
  `abicloud_version` varchar(60) NOT NULL,
  `abicloud_distribution` varchar(60) NOT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heartbeatlog`
--

LOCK TABLES `heartbeatlog` WRITE;
/*!40000 ALTER TABLE `heartbeatlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `heartbeatlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hypervisor`
--

DROP TABLE IF EXISTS `hypervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hypervisor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPhysicalMachine` int(10) unsigned NOT NULL,
  `ip` varchar(39) DEFAULT NULL,
  `ipService` varchar(39) DEFAULT NULL,
  `port` int(5) unsigned DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `managerIp` varchar(15) DEFAULT NULL,
  `managerPort` int(5) unsigned DEFAULT NULL,
  `managerUser` varchar(255) DEFAULT NULL,
  `managerPassword` varchar(255) DEFAULT NULL,
  `agentIp` varchar(15) DEFAULT NULL,
  `agentPort` int(5) unsigned DEFAULT NULL,
  `agentUser` varchar(255) DEFAULT NULL,
  `agentPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Hypervisor_FK1` (`idPhysicalMachine`),
  CONSTRAINT `Hypervisor_FK1` FOREIGN KEY (`idPhysicalMachine`) REFERENCES `physicalmachine` (`idPhysicalMachine`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hypervisor`
--

LOCK TABLES `hypervisor` WRITE;
/*!40000 ALTER TABLE `hypervisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `hypervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `initiator_mapping`
--

DROP TABLE IF EXISTS `initiator_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `initiator_mapping` (
  `idInitiatorMapping` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idManagement` int(10) unsigned NOT NULL,
  `initiatorIqn` varchar(256) NOT NULL,
  `targetIqn` varchar(256) NOT NULL,
  `targetLun` int(11) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idInitiatorMapping`),
  KEY `volume_managementFK_1` (`idManagement`),
  CONSTRAINT `volume_managementFK_1` FOREIGN KEY (`idManagement`) REFERENCES `volume_management` (`idManagement`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `initiator_mapping`
--

LOCK TABLES `initiator_mapping` WRITE;
/*!40000 ALTER TABLE `initiator_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `initiator_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_pool_management`
--

DROP TABLE IF EXISTS `ip_pool_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_pool_management` (
  `idManagement` int(10) unsigned NOT NULL,
  `mac` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `ip` varchar(20) NOT NULL,
  `vlan_network_name` varchar(40) DEFAULT NULL,
  `vlan_network_id` int(10) unsigned DEFAULT NULL,
  `quarantine` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `version_c` int(11) NOT NULL DEFAULT '1',
  KEY `id_management_FK` (`idManagement`),
  KEY `ippool_vlan_network_FK` (`vlan_network_id`),
  CONSTRAINT `ippool_vlan_network_FK` FOREIGN KEY (`vlan_network_id`) REFERENCES `vlan_network` (`vlan_network_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_management_FK` FOREIGN KEY (`idManagement`) REFERENCES `rasd_management` (`idManagement`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_pool_management`
--

LOCK TABLES `ip_pool_management` WRITE;
/*!40000 ALTER TABLE `ip_pool_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_pool_management` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER update_ip_pool_management_update_stats AFTER UPDATE ON ip_pool_management
    FOR EACH ROW BEGIN
        DECLARE idVirtualDataCenterObj INTEGER;
        DECLARE idEnterpriseObj INTEGER;
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   
	    -- Checks for public available 
            -- Checks for reserved IPs		
            IF OLD.mac IS NULL AND NEW.mac IS NOT NULL THEN
                -- Query for datacenter
                SELECT vdc.idVirtualDataCenter, vdc.idEnterprise  INTO idVirtualDataCenterObj, idEnterpriseObj
                FROM rasd_management rm, virtualdatacenter vdc, vlan_network vn
                WHERE vdc.idVirtualDataCenter = rm.idVirtualDataCenter
                    AND NEW.vlan_network_id = vn.vlan_network_id
                    AND vn.networktype = 'PUBLIC'
                    AND NEW.idManagement = rm.idManagement;
                -- New Public IP assignment for a VDC ---> Reserved
                IF (idVirtualDataCenterObj IS NOT NULL AND idEnterpriseObj IS NOT NULL) THEN
                    -- INSERT INTO debug_msg (msg) VALUES (CONCAT('Reserved IP: ',IFNULL(idEnterpriseObj,'entnull'),IFNULL(idDataCenterObj,'dcnull'),IFNULL(idVirtualDataCenterObj,'vdcnull')));
                    IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingIPsRegisterEvents' ) THEN
                      CALL kinton_accounting.AccountingIPsRegisterEvents('IP_RESERVED',NEW.idManagement,NEW.ip,idVirtualDataCenterObj, idEnterpriseObj);
                    END IF;
                END IF;
            END IF;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `idLicense` int(11) NOT NULL AUTO_INCREMENT,
  `data` text,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idLicense`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metering`
--

DROP TABLE IF EXISTS `metering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metering` (
  `idMeter` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idDatacenter` int(10) unsigned DEFAULT NULL,
  `datacenter` varchar(20) DEFAULT NULL,
  `idRack` int(10) unsigned DEFAULT NULL,
  `rack` varchar(20) DEFAULT NULL,
  `idPhysicalMachine` int(10) unsigned DEFAULT NULL,
  `physicalmachine` varchar(256) DEFAULT NULL,
  `idStorageSystem` int(10) unsigned DEFAULT NULL,
  `storageSystem` varchar(256) DEFAULT NULL,
  `idStoragePool` varchar(40) DEFAULT NULL,
  `storagePool` varchar(256) DEFAULT NULL,
  `idVolume` varchar(50) DEFAULT NULL,
  `volume` varchar(256) DEFAULT NULL,
  `idNetwork` int(10) unsigned DEFAULT NULL,
  `network` varchar(256) DEFAULT NULL,
  `idSubnet` int(10) unsigned DEFAULT NULL,
  `subnet` varchar(256) DEFAULT NULL,
  `idEnterprise` int(10) unsigned DEFAULT NULL,
  `enterprise` varchar(40) DEFAULT NULL,
  `idUser` int(10) unsigned DEFAULT NULL,
  `user` varchar(128) DEFAULT NULL,
  `idVirtualDataCenter` int(10) unsigned DEFAULT NULL,
  `virtualDataCenter` varchar(40) DEFAULT NULL,
  `idVirtualApp` int(10) unsigned DEFAULT NULL,
  `virtualApp` varchar(30) DEFAULT NULL,
  `idVirtualMachine` int(10) unsigned DEFAULT NULL,
  `virtualmachine` varchar(256) DEFAULT NULL,
  `severity` varchar(100) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `performedby` varchar(255) NOT NULL,
  `actionperformed` varchar(100) NOT NULL,
  `component` varchar(255) DEFAULT NULL,
  `stacktrace` text,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idMeter`),
  KEY `idx_metering_timestamp` (`timestamp`),
  KEY `idx_metering_enterprise` (`enterprise`),
  KEY `idx_metering_idEnterprise` (`idEnterprise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metering`
--

LOCK TABLES `metering` WRITE;
/*!40000 ALTER TABLE `metering` DISABLE KEYS */;
/*!40000 ALTER TABLE `metering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metering_archive`
--

DROP TABLE IF EXISTS `metering_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metering_archive` (
  `idMeter` bigint(20) unsigned NOT NULL,
  `idDatacenter` int(10) unsigned DEFAULT NULL,
  `datacenter` varchar(20) DEFAULT NULL,
  `idRack` int(10) unsigned DEFAULT NULL,
  `rack` varchar(20) DEFAULT NULL,
  `idPhysicalMachine` int(10) unsigned DEFAULT NULL,
  `physicalmachine` varchar(256) DEFAULT NULL,
  `idStorageSystem` int(10) unsigned DEFAULT NULL,
  `storageSystem` varchar(256) DEFAULT NULL,
  `idStoragePool` varchar(40) DEFAULT NULL,
  `storagePool` varchar(256) DEFAULT NULL,
  `idVolume` varchar(50) DEFAULT NULL,
  `volume` varchar(256) DEFAULT NULL,
  `idNetwork` int(10) unsigned DEFAULT NULL,
  `network` varchar(256) DEFAULT NULL,
  `idSubnet` int(10) unsigned DEFAULT NULL,
  `subnet` varchar(256) DEFAULT NULL,
  `idEnterprise` int(10) unsigned DEFAULT NULL,
  `enterprise` varchar(40) DEFAULT NULL,
  `idUser` int(10) unsigned DEFAULT NULL,
  `user` varchar(128) DEFAULT NULL,
  `idVirtualDataCenter` int(10) unsigned DEFAULT NULL,
  `virtualDataCenter` varchar(40) DEFAULT NULL,
  `idVirtualApp` int(10) unsigned DEFAULT NULL,
  `virtualApp` varchar(30) DEFAULT NULL,
  `idVirtualMachine` int(10) unsigned DEFAULT NULL,
  `virtualmachine` varchar(256) DEFAULT NULL,
  `severity` varchar(100) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `performedby` varchar(255) NOT NULL,
  `actionperformed` varchar(100) NOT NULL,
  `component` varchar(255) DEFAULT NULL,
  `stacktrace` text,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idMeter`),
  KEY `idx_metering_archive_timestamp` (`timestamp`),
  KEY `idx_metering_archive_enterprise` (`enterprise`),
  KEY `idx_metering_archive_idEnterprise` (`idEnterprise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metering_archive`
--

LOCK TABLES `metering_archive` WRITE;
/*!40000 ALTER TABLE `metering_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `metering_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network`
--

DROP TABLE IF EXISTS `network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network` (
  `network_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) NOT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`network_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network`
--

LOCK TABLES `network` WRITE;
/*!40000 ALTER TABLE `network` DISABLE KEYS */;
INSERT INTO `network` VALUES (1,'6cd20366-72e5-11df-8f9d-002564aeca80',1);
/*!40000 ALTER TABLE `network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_configuration`
--

DROP TABLE IF EXISTS `network_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_configuration` (
  `network_configuration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gateway` varchar(40) DEFAULT NULL,
  `network_address` varchar(40) NOT NULL,
  `mask` int(11) NOT NULL,
  `netmask` varchar(20) NOT NULL,
  `primary_dns` varchar(20) DEFAULT NULL,
  `secondary_dns` varchar(20) DEFAULT NULL,
  `sufix_dns` varchar(40) DEFAULT NULL,
  `fence_mode` varchar(20) NOT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`network_configuration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_configuration`
--

LOCK TABLES `network_configuration` WRITE;
/*!40000 ALTER TABLE `network_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_interface`
--

DROP TABLE IF EXISTS `network_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_interface` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `mac` varchar(25) DEFAULT NULL,
  `network_service_type_id` int(10) unsigned DEFAULT NULL,
  `physicalmachine_id` int(10) unsigned NOT NULL,
  `shared_ip` varchar(25) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `network_interface_FK1` (`network_service_type_id`),
  KEY `network_interface_FK2` (`physicalmachine_id`),
  CONSTRAINT `network_interface_FK2` FOREIGN KEY (`physicalmachine_id`) REFERENCES `physicalmachine` (`idPhysicalMachine`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `network_interface_FK1` FOREIGN KEY (`network_service_type_id`) REFERENCES `network_service_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_interface`
--

LOCK TABLES `network_interface` WRITE;
/*!40000 ALTER TABLE `network_interface` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_service_type`
--

DROP TABLE IF EXISTS `network_service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_service_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datacenter_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `default_nst` tinyint(1) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `network_service_type_FK1` (`datacenter_id`),
  CONSTRAINT `network_service_type_FK1` FOREIGN KEY (`datacenter_id`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_service_type`
--

LOCK TABLES `network_service_type` WRITE;
/*!40000 ALTER TABLE `network_service_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_service_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `idVirtualApp` int(10) unsigned NOT NULL,
  `idNode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modified` int(11) NOT NULL,
  `posX` int(11) NOT NULL DEFAULT '0',
  `posY` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `mac` varchar(17) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idNode`),
  KEY `node_FK2` (`idVirtualApp`),
  CONSTRAINT `node_FK2` FOREIGN KEY (`idVirtualApp`) REFERENCES `virtualapp` (`idVirtualApp`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodenetwork`
--

DROP TABLE IF EXISTS `nodenetwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodenetwork` (
  `idNode` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idNode`),
  CONSTRAINT `nodeNetwork_FK1` FOREIGN KEY (`idNode`) REFERENCES `node` (`idNode`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodenetwork`
--

LOCK TABLES `nodenetwork` WRITE;
/*!40000 ALTER TABLE `nodenetwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodenetwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noderelationtype`
--

DROP TABLE IF EXISTS `noderelationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noderelationtype` (
  `idNodeRelationType` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idNodeRelationType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noderelationtype`
--

LOCK TABLES `noderelationtype` WRITE;
/*!40000 ALTER TABLE `noderelationtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `noderelationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodestorage`
--

DROP TABLE IF EXISTS `nodestorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodestorage` (
  `idNode` int(10) unsigned NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idNode`),
  CONSTRAINT `nodeStorage_FK1` FOREIGN KEY (`idNode`) REFERENCES `node` (`idNode`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodestorage`
--

LOCK TABLES `nodestorage` WRITE;
/*!40000 ALTER TABLE `nodestorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodestorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodevirtualimage`
--

DROP TABLE IF EXISTS `nodevirtualimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodevirtualimage` (
  `idNode` int(10) unsigned NOT NULL,
  `idVM` int(10) unsigned DEFAULT NULL,
  `idImage` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  KEY `nodevirtualImage_FK1` (`idImage`),
  KEY `nodevirtualimage_FK3` (`idNode`),
  KEY `nodevirtualImage_FK2` (`idVM`),
  CONSTRAINT `nodevirtualImage_FK2` FOREIGN KEY (`idVM`) REFERENCES `virtualmachine` (`idVM`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `nodevirtualImage_FK1` FOREIGN KEY (`idImage`) REFERENCES `virtualimage` (`idImage`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nodevirtualimage_FK3` FOREIGN KEY (`idNode`) REFERENCES `node` (`idNode`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodevirtualimage`
--

LOCK TABLES `nodevirtualimage` WRITE;
/*!40000 ALTER TABLE `nodevirtualimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodevirtualimage` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER create_nodevirtualimage_update_stats AFTER INSERT ON nodevirtualimage
  FOR EACH ROW BEGIN
    DECLARE costCodeObj int(4);
    DECLARE type INTEGER;
    DECLARE state VARCHAR(50);
    DECLARE ram INTEGER;
    DECLARE cpu INTEGER;
    DECLARE hd bigint;
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN    
		SELECT vm.idType, vm.state, vm.cpu, vm.ram, vm.hd INTO type, state, cpu, ram, hd
		FROM virtualmachine vm
		WHERE vm.idVM = NEW.idVM;
		--
	    SELECT IF(vi.cost_code IS NULL, 0, vi.cost_code) INTO costCodeObj
        FROM virtualimage vi
        WHERE vi.idImage = NEW.idImage;
        --
    	IF EXISTS( SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVMRegisterEvents' ) THEN
       		IF EXISTS(SELECT * FROM virtualimage vi WHERE vi.idImage=NEW.idImage) THEN 
	        	CALL kinton_accounting.AccountingVMRegisterEvents(NEW.idVM, type, "NOT_ALLOCATED", state, "NOT_ALLOCATED", ram, cpu, hd, costCodeObj);
        	END IF;              
     	END IF;
    END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER delete_nodevirtualimage_update_stats AFTER DELETE ON nodevirtualimage
  FOR EACH ROW BEGIN
    DECLARE costCodeObj int(4); 
    DECLARE previousState VARCHAR(50);
    DECLARE state VARCHAR(50);
    DECLARE ram INTEGER;
    DECLARE cpu INTEGER;
    DECLARE hd bigint;
    DECLARE type INTEGER;
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
		SELECT vm.idType, vm.cpu, vm.ram, vm.hd, vm.state INTO type, cpu, ram, hd, state
		FROM virtualmachine vm
		WHERE vm.idVM = OLD.idVM;
		--
		SELECT vmts.previousState INTO previousState
		 FROM virtualmachinetrackedstate vmts
		WHERE vmts.idVM = OLD.idVM;
        	-- 5321 - Captured VMs may not have a previous state
        	IF (previousState IS NULL OR previousState='') THEN SELECT state INTO previousState; END IF;
	    	--
		SELECT IF(vi.cost_code IS NULL, 0, vi.cost_code) INTO costCodeObj
		FROM virtualimage vi
		WHERE vi.idImage = OLD.idImage;
		--
		IF EXISTS( SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVMRegisterEvents' ) THEN
			IF EXISTS(SELECT * FROM virtualimage vi WHERE vi.idImage=OLD.idImage) THEN 
				  CALL kinton_accounting.AccountingVMRegisterEvents(OLD.idVM, type, "-", "NOT_ALLOCATED", previousState, ram, cpu, hd, costCodeObj);
			END IF;              
     	END IF;
 	END IF;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `one_time_token`
--

DROP TABLE IF EXISTS `one_time_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `one_time_token` (
  `idOneTimeTokenSession` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idOneTimeTokenSession`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `one_time_token`
--

LOCK TABLES `one_time_token` WRITE;
/*!40000 ALTER TABLE `one_time_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `one_time_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovf_package`
--

DROP TABLE IF EXISTS `ovf_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovf_package` (
  `id_ovf_package` int(11) NOT NULL AUTO_INCREMENT,
  `id_apps_library` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `iconUrl` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productUrl` varchar(45) DEFAULT NULL,
  `productVersion` varchar(45) DEFAULT NULL,
  `productVendor` varchar(45) DEFAULT NULL,
  `idCategory` int(10) unsigned DEFAULT NULL,
  `diskSizeMb` bigint(20) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  `type` varchar(50) NOT NULL,
  `loginUser` varchar(45) DEFAULT NULL,
  `loginPassword` varchar(90) DEFAULT NULL,
  `osType` varchar(50) NOT NULL DEFAULT 'UNRECOGNIZED',
  `osVersion` varchar(64) DEFAULT NULL,
  `ethDriverType` varchar(16) DEFAULT NULL,
  `diskCntrlType` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id_ovf_package`),
  KEY `fk_ovf_package_repository` (`id_apps_library`),
  KEY `fk_ovf_package_category` (`idCategory`),
  CONSTRAINT `fk_ovf_package_category` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_ovf_package_repository` FOREIGN KEY (`id_apps_library`) REFERENCES `apps_library` (`id_apps_library`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovf_package`
--

LOCK TABLES `ovf_package` WRITE;
/*!40000 ALTER TABLE `ovf_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `ovf_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovf_package_list`
--

DROP TABLE IF EXISTS `ovf_package_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovf_package_list` (
  `id_ovf_package_list` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `id_apps_library` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id_ovf_package_list`),
  KEY `fk_ovf_package_list_repository` (`id_apps_library`),
  CONSTRAINT `fk_ovf_package_list_repository` FOREIGN KEY (`id_apps_library`) REFERENCES `apps_library` (`id_apps_library`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovf_package_list`
--

LOCK TABLES `ovf_package_list` WRITE;
/*!40000 ALTER TABLE `ovf_package_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `ovf_package_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovf_package_list_has_ovf_package`
--

DROP TABLE IF EXISTS `ovf_package_list_has_ovf_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovf_package_list_has_ovf_package` (
  `id_ovf_package_list` int(11) NOT NULL,
  `id_ovf_package` int(11) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id_ovf_package_list`,`id_ovf_package`),
  KEY `fk_ovf_package_list_has_ovf_package_ovf_package1` (`id_ovf_package`),
  CONSTRAINT `fk_ovf_package_list_has_ovf_package_ovf_package_list1` FOREIGN KEY (`id_ovf_package_list`) REFERENCES `ovf_package_list` (`id_ovf_package_list`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ovf_package_list_has_ovf_package_ovf_package1` FOREIGN KEY (`id_ovf_package`) REFERENCES `ovf_package` (`id_ovf_package`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovf_package_list_has_ovf_package`
--

LOCK TABLES `ovf_package_list_has_ovf_package` WRITE;
/*!40000 ALTER TABLE `ovf_package_list_has_ovf_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `ovf_package_list_has_ovf_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physicalmachine`
--

DROP TABLE IF EXISTS `physicalmachine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physicalmachine` (
  `idPhysicalMachine` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idRack` int(10) unsigned DEFAULT NULL,
  `idDataCenter` int(10) unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `ram` int(11) NOT NULL,
  `cpu` int(11) NOT NULL,
  `idState` int(10) unsigned NOT NULL DEFAULT '0',
  `idEnterprise` int(10) unsigned DEFAULT NULL,
  `initiatorIQN` varchar(256) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  `ipmiIP` varchar(39) DEFAULT NULL,
  `ipmiPort` int(10) unsigned DEFAULT NULL,
  `ipmiUser` varchar(255) DEFAULT NULL,
  `ipmiPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPhysicalMachine`),
  KEY `PhysicalMachine_FK5` (`idDataCenter`),
  KEY `PhysicalMachine_FK6` (`idEnterprise`),
  KEY `PhysicalMachine_FK1` (`idRack`),
  CONSTRAINT `PhysicalMachine_FK1` FOREIGN KEY (`idRack`) REFERENCES `rack` (`idRack`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `PhysicalMachine_FK5` FOREIGN KEY (`idDataCenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `PhysicalMachine_FK6` FOREIGN KEY (`idEnterprise`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicalmachine`
--

LOCK TABLES `physicalmachine` WRITE;
/*!40000 ALTER TABLE `physicalmachine` DISABLE KEYS */;
/*!40000 ALTER TABLE `physicalmachine` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER physicalmachine_insert AFTER INSERT ON physicalmachine
    FOR EACH ROW BEGIN
		-- For debugging purposes only        
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   

            -- TODO - Only add the reservation if the physical machine is in a good state...
            IF (NEW.idEnterprise > 0) AND
                EXISTS( SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingPMRegisterEvents' ) THEN
                
                CALL kinton_accounting.AccountingPMRegisterEvents('RESERVE_PM', NEW.idPhysicalMachine, NEW.idDataCenter, NEW.name, NEW.cpu, NEW.ram, NEW.idEnterprise);
            END IF;
      	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER physicalmachine_update AFTER UPDATE ON physicalmachine
    FOR EACH ROW BEGIN
		-- For debugging purposes only        
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   

            -- TODO - Add physical machine state change handling, so we can reserve/unreserve according to the PM state as well as changes of enterprise...
            IF ((NEW.idEnterprise IS NOT NULL AND OLD.idEnterprise IS NULL) OR (NEW.idEnterprise IS NULL AND OLD.idEnterprise IS NOT NULL) OR
                (NEW.idEnterprise != OLD.idEnterprise)) AND
                EXISTS( SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingPMRegisterEvents' ) THEN
                
                -- The enterprise reservation has changed, so we need to UNRESERVE any previous records for the physical machine...
                IF (OLD.idEnterprise > 0) THEN
                    CALL kinton_accounting.AccountingPMRegisterEvents('UNRESERVE_PM', OLD.idPhysicalMachine, OLD.idDataCenter, OLD.name, OLD.cpu, OLD.ram, OLD.idEnterprise);
                END IF;

                -- And then register a new enterprise, if required...
                IF (NEW.idEnterprise > 0) THEN
                    CALL kinton_accounting.AccountingPMRegisterEvents('RESERVE_PM', NEW.idPhysicalMachine, NEW.idDataCenter, NEW.name, NEW.cpu, NEW.ram, NEW.idEnterprise);
                END IF;
            END IF;
      	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER physicalmachine_delete AFTER DELETE ON physicalmachine
    FOR EACH ROW BEGIN
		-- For debugging purposes only        
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   

            IF (OLD.idEnterprise > 0) AND
                EXISTS( SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingPMRegisterEvents' ) THEN
                
                -- The machine deleted, so we need to UNRESERVE any existing records for the physical machine...
                CALL kinton_accounting.AccountingPMRegisterEvents('UNRESERVE_PM', OLD.idPhysicalMachine, OLD.idDataCenter, OLD.name, OLD.cpu, OLD.ram, OLD.idEnterprise);
            END IF;
      	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pricingCostCode`
--

DROP TABLE IF EXISTS `pricingCostCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricingCostCode` (
  `idPricingCostCode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPricingTemplate` int(10) unsigned NOT NULL,
  `idCostCode` int(10) unsigned NOT NULL,
  `price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idPricingCostCode`),
  KEY `pricingCostCode_FK2` (`idPricingTemplate`),
  KEY `pricingCostCode_FK1` (`idCostCode`),
  CONSTRAINT `pricingCostCode_FK1` FOREIGN KEY (`idCostCode`) REFERENCES `costCode` (`idCostCode`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pricingCostCode_FK2` FOREIGN KEY (`idPricingTemplate`) REFERENCES `pricingTemplate` (`idPricingTemplate`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricingCostCode`
--

LOCK TABLES `pricingCostCode` WRITE;
/*!40000 ALTER TABLE `pricingCostCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricingCostCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricingTemplate`
--

DROP TABLE IF EXISTS `pricingTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricingTemplate` (
  `idPricingTemplate` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idCurrency` int(10) unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  `chargingPeriod` int(10) unsigned NOT NULL,
  `minimumCharge` int(10) unsigned NOT NULL,
  `showChangesBefore` tinyint(1) NOT NULL DEFAULT '0',
  `standingChargePeriod` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `minimumChargePeriod` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `vcpu` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `hdGB` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `vlan` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `publicIp` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `defaultTemplate` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(1000) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version_c` int(11) DEFAULT '0',
  `memoryGB` decimal(20,5) DEFAULT '0.00000',
  `layer` decimal(20,5) DEFAULT '0.00000',
  `repositoryGB` decimal(20,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`idPricingTemplate`),
  KEY `Pricing_FK2_Currency` (`idCurrency`),
  CONSTRAINT `Pricing_FK2_Currency` FOREIGN KEY (`idCurrency`) REFERENCES `currency` (`idCurrency`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricingTemplate`
--

LOCK TABLES `pricingTemplate` WRITE;
/*!40000 ALTER TABLE `pricingTemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricingTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricingTier`
--

DROP TABLE IF EXISTS `pricingTier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricingTier` (
  `idPricingTier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPricingTemplate` int(10) unsigned NOT NULL,
  `idTier` int(10) unsigned NOT NULL,
  `price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idPricingTier`),
  KEY `pricingTier_FK2` (`idPricingTemplate`),
  KEY `pricingTier_FK1` (`idTier`),
  CONSTRAINT `pricingTier_FK1` FOREIGN KEY (`idTier`) REFERENCES `tier` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pricingTier_FK2` FOREIGN KEY (`idPricingTemplate`) REFERENCES `pricingTemplate` (`idPricingTemplate`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricingTier`
--

LOCK TABLES `pricingTier` WRITE;
/*!40000 ALTER TABLE `pricingTier` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricingTier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `idPrivilege` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idPrivilege`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES (1,'ENTERPRISE_ENUMERATE',0),(2,'ENTERPRISE_ADMINISTER_ALL',0),(3,'ENTERPRISE_RESOURCE_SUMMARY_ENT',0),(4,'PHYS_DC_ENUMERATE',0),(5,'PHYS_DC_RETRIEVE_RESOURCE_USAGE',0),(6,'PHYS_DC_MANAGE',0),(7,'PHYS_DC_RETRIEVE_DETAILS',0),(8,'PHYS_DC_ALLOW_MODIFY_SERVERS',0),(9,'PHYS_DC_ALLOW_MODIFY_NETWORK',0),(10,'PHYS_DC_ALLOW_MODIFY_STORAGE',0),(11,'PHYS_DC_ALLOW_MODIFY_ALLOCATION',0),(12,'VDC_ENUMERATE',0),(13,'VDC_MANAGE',0),(14,'VDC_MANAGE_VAPP',0),(15,'VDC_MANAGE_NETWORK',0),(16,'VDC_MANAGE_STORAGE',0),(17,'VAPP_CUSTOMISE_SETTINGS',0),(18,'VAPP_DEPLOY_UNDEPLOY',0),(21,'VAPP_PERFORM_ACTIONS',0),(22,'VAPP_CREATE_STATEFUL',0),(23,'VAPP_CREATE_INSTANCE',0),(24,'APPLIB_VIEW',0),(25,'APPLIB_ALLOW_MODIFY',0),(26,'APPLIB_UPLOAD_IMAGE',0),(27,'APPLIB_MANAGE_REPOSITORY',0),(28,'APPLIB_DOWNLOAD_IMAGE',0),(29,'APPLIB_MANAGE_CATEGORIES',0),(30,'USERS_VIEW',0),(31,'USERS_MANAGE_ENTERPRISE',0),(32,'USERS_MANAGE_USERS',0),(33,'USERS_MANAGE_OTHER_ENTERPRISES',0),(34,'USERS_PROHIBIT_VDC_RESTRICTION',0),(35,'USERS_VIEW_PRIVILEGES',0),(36,'USERS_MANAGE_ROLES',0),(37,'USERS_MANAGE_ROLES_OTHER_ENTERPRISES',0),(38,'USERS_MANAGE_SYSTEM_ROLES',0),(39,'USERS_MANAGE_LDAP_GROUP',0),(40,'USERS_ENUMERATE_CONNECTED',0),(41,'SYSCONFIG_VIEW',0),(42,'SYSCONFIG_ALLOW_MODIFY',0),(43,'EVENTLOG_VIEW_ENTERPRISE',0),(44,'EVENTLOG_VIEW_ALL',0),(45,'APPLIB_VM_COST_CODE',0),(46,'USERS_MANAGE_ENTERPRISE_BRANDING',0),(47,'SYSCONFIG_SHOW_REPORTS',0),(48,'USERS_DEFINE_AS_MANAGER',0),(49,'PRICING_VIEW',0),(50,'PRICING_MANAGE',0),(51,'USERS_MANAGE_CHEF_ENTERPRISE',0),(52,'MANAGE_HARD_DISKS',0),(53,'APPLIB_MANAGE_GLOBAL_CATEGORIES',0),(54,'USERS_MANAGE_SCOPES',0),(55,'USERS_MANAGE_RESERVED_MACHINES',0),(56,'VAPP_MANAGE_LAYERS',0),(57,'ENTERPRISE_SHOW_STATS_LIMITS',0),(58,'PHYS_DC_ALLOW_BACKUP_CONFIG',0),(59,'VAPP_MANAGE_BACKUP',0),(60,'VAPP_DEFINE_BACKUP_INFO',0),(61,'WORKFLOW_OVERRIDE',0),(62,'APPLIB_SHOW_DC_CAPACITY',0),(63,'VAPP_DELETE_UNKNOWN_VM',0);
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_datacenter`
--

DROP TABLE IF EXISTS `public_datacenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_datacenter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(255) NOT NULL DEFAULT 'auto_name',
  `endpoint` varchar(255) NOT NULL DEFAULT 'auto_name',
  `provider` varchar(255) NOT NULL DEFAULT 'auto_name',
  `idDatacenter` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_public_datacenter_datacenter` (`idDatacenter`),
  CONSTRAINT `fk_public_datacenter_datacenter` FOREIGN KEY (`idDatacenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_datacenter`
--

LOCK TABLES `public_datacenter` WRITE;
/*!40000 ALTER TABLE `public_datacenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_datacenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rack`
--

DROP TABLE IF EXISTS `rack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rack` (
  `idRack` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idDataCenter` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `shortDescription` varchar(30) DEFAULT NULL,
  `largeDescription` varchar(100) DEFAULT NULL,
  `vlan_id_min` int(10) unsigned DEFAULT '2',
  `vlan_id_max` int(10) unsigned DEFAULT '4094',
  `vlans_id_avoided` varchar(255) DEFAULT '',
  `vlan_per_vdc_expected` int(10) unsigned DEFAULT '8',
  `nrsq` int(10) unsigned DEFAULT '10',
  `haEnabled` tinyint(1) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idRack`),
  KEY `Rack_FK1` (`idDataCenter`),
  CONSTRAINT `Rack_FK1` FOREIGN KEY (`idDataCenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack`
--

LOCK TABLES `rack` WRITE;
/*!40000 ALTER TABLE `rack` DISABLE KEYS */;
/*!40000 ALTER TABLE `rack` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER rack_update AFTER UPDATE ON rack
    FOR EACH ROW BEGIN
		-- For debugging purposes only        
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   

            -- check if ha flag has changes and accounting is enabled...
            IF (NEW.haEnabled != OLD.haEnabled) AND
                EXISTS( SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVMRegisterEvents' ) THEN
            BEGIN
                DECLARE v_idVM INTEGER UNSIGNED;
                DECLARE v_cpu INTEGER UNSIGNED;
                DECLARE v_ram INTEGER UNSIGNED;
                DECLARE v_hd BIGINT UNSIGNED;
                DECLARE v_cc INTEGER UNSIGNED;
                DECLARE done INT DEFAULT FALSE;
                DECLARE cur1 CURSOR FOR SELECT vma.idVM, vma.cpu, vma.ram, vma.hd, vma.costCode
                                        FROM kinton_accounting.accounting_event_vm vma, virtualmachine vm, hypervisor h, physicalmachine pm
                                        WHERE   vm.idHypervisor=h.id AND h.idPhysicalMachine=pm.idPhysicalMachine AND pm.idRack=NEW.idRack AND
                                                vma.idVM=vm.idVM AND vma.stopTime IS NULL;
                DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

                OPEN cur1;
                read_loop: LOOP
                    FETCH cur1 INTO v_idVM, v_cpu, v_ram, v_hd, v_cc;
                    IF done THEN
                      LEAVE read_loop;
                    END IF;

                    CALL kinton_accounting.AccountingVMRegisterEvents(v_idVM, 1, "N/A", "HA_UPDATE", "N/A", v_ram, v_cpu, v_hd, v_cc);
                END LOOP;
                CLOSE cur1;
            END ;
            END IF;
      	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rasd`
--

DROP TABLE IF EXISTS `rasd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rasd` (
  `address` varchar(256) DEFAULT NULL,
  `addressOnParent` varchar(25) DEFAULT NULL,
  `allocationUnits` varchar(15) DEFAULT NULL,
  `automaticAllocation` int(11) DEFAULT NULL,
  `automaticDeallocation` int(11) DEFAULT NULL,
  `caption` varchar(15) DEFAULT NULL,
  `changeableType` int(11) DEFAULT NULL,
  `configurationName` varchar(15) DEFAULT NULL,
  `connectionResource` varchar(256) DEFAULT NULL,
  `consumerVisibility` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `elementName` varchar(255) NOT NULL,
  `generation` bigint(20) DEFAULT NULL,
  `hostResource` varchar(256) DEFAULT NULL,
  `instanceID` varchar(50) NOT NULL,
  `limitResource` bigint(20) DEFAULT NULL,
  `mappingBehaviour` int(11) DEFAULT NULL,
  `otherResourceType` varchar(50) DEFAULT NULL,
  `parent` varchar(50) DEFAULT NULL,
  `poolID` varchar(50) DEFAULT NULL,
  `reservation` bigint(20) DEFAULT NULL,
  `resourceSubType` varchar(15) DEFAULT NULL,
  `resourceType` int(11) NOT NULL,
  `virtualQuantity` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`instanceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rasd`
--

LOCK TABLES `rasd` WRITE;
/*!40000 ALTER TABLE `rasd` DISABLE KEYS */;
/*!40000 ALTER TABLE `rasd` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER update_rasd_update_stats AFTER UPDATE ON rasd
    FOR EACH ROW BEGIN
        DECLARE idThisEnterprise INTEGER;
        DECLARE idThisVirtualDataCenter INTEGER;
        DECLARE temporal INTEGER;
        DECLARE v_idTier INTEGER;
        
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN                                   
            --
            IF OLD.limitResource != NEW.limitResource THEN
                SELECT vdc.idVirtualDataCenter, vdc.idEnterprise, rm.temporal INTO idThisVirtualDataCenter, idThisEnterprise, temporal
                FROM rasd_management rm, virtualdatacenter vdc
                WHERE rm.idResource = NEW.instanceID
                AND vdc.idVirtualDataCenter=rm.idVirtualDataCenter;
                
                -- check if this is reserved
                IF temporal IS NULL AND NEW.resourceType=8 AND
                   EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingStorageRegisterEvents' ) THEN
                    SELECT sp.idTier INTO v_idTier
                        FROM kinton.rasd r, kinton.rasd_management rm, kinton.volume_management volMgmt,
                             kinton.storage_pool sp
                        WHERE rm.idResource = r.instanceID AND resourcetype=8 AND
                             volMgmt.idManagement=rm.idManagement AND
                             volMgmt.idStorage=sp.idStorage AND
                             r.instanceID=NEW.instanceID;
                    CALL kinton_accounting.AccountingStorageRegisterEvents('UPDATE_STORAGE', NEW.instanceID, NEW.elementName, v_idTier, idThisVirtualDataCenter, idThisEnterprise, NEW.limitResource);
                END IF;
            END IF;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rasd_management`
--

DROP TABLE IF EXISTS `rasd_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rasd_management` (
  `idManagement` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idResourceType` varchar(5) NOT NULL,
  `idVirtualDataCenter` int(10) unsigned DEFAULT NULL,
  `idVM` int(10) unsigned DEFAULT NULL,
  `idResource` varchar(50) DEFAULT NULL,
  `idVirtualApp` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  `temporal` int(10) unsigned DEFAULT NULL,
  `sequence` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idManagement`),
  KEY `idResource_FK` (`idResource`),
  KEY `idVirtualApp_FK` (`idVirtualApp`),
  KEY `idVirtualDataCenter_FK` (`idVirtualDataCenter`),
  KEY `idVM_FK` (`idVM`),
  CONSTRAINT `idVM_FK` FOREIGN KEY (`idVM`) REFERENCES `virtualmachine` (`idVM`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `idResource_FK` FOREIGN KEY (`idResource`) REFERENCES `rasd` (`instanceID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `idVirtualApp_FK` FOREIGN KEY (`idVirtualApp`) REFERENCES `virtualapp` (`idVirtualApp`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `idVirtualDataCenter_FK` FOREIGN KEY (`idVirtualDataCenter`) REFERENCES `virtualdatacenter` (`idVirtualDataCenter`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rasd_management`
--

LOCK TABLES `rasd_management` WRITE;
/*!40000 ALTER TABLE `rasd_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `rasd_management` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER update_rasd_management_update_stats AFTER UPDATE ON rasd_management
    FOR EACH ROW BEGIN
        DECLARE idDataCenterObj INTEGER;
        DECLARE idEnterpriseObj INTEGER;
        DECLARE ipAddress VARCHAR(20) CHARACTER SET utf8;
        DECLARE v_idTier INTEGER;
        DECLARE v_elementName VARCHAR(256) CHARACTER SET utf8;
        DECLARE v_limitResource BIGINT(20);

        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN                                         
            -- Checks for unreserved IPs
            IF OLD.idResourceType = 10 AND OLD.idVirtualDataCenter IS NOT NULL AND NEW.idVirtualDataCenter IS NULL THEN
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
                    -- Registers Accounting Event
                    SELECT vdc.idEnterprise INTO idEnterpriseObj
                    FROM virtualdatacenter vdc
                    WHERE vdc.idVirtualDataCenter = OLD.idVirtualDataCenter;                    
                    IF EXISTS( SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingIPsRegisterEvents' ) THEN
                        CALL kinton_accounting.AccountingIPsRegisterEvents('IP_FREED',OLD.idManagement,ipAddress,OLD.idVirtualDataCenter, idEnterpriseObj);
                    END IF;                    
                END IF;
            END IF;

            -- Check to see if the Storage VDC has changed for a volume, and if so update the accounting tables to reflect the new owner�
            IF (OLD.idResourceType = 8) AND
               (OLD.idVirtualDataCenter IS NOT NULL) AND (NEW.idVirtualDataCenter != OLD.idVirtualDataCenter) THEN

                SELECT vdc.idEnterprise INTO idEnterpriseObj
                    FROM virtualdatacenter vdc
                    WHERE vdc.idVirtualDataCenter = NEW.idVirtualDataCenter;

                SELECT r.elementName, r.limitResource INTO v_elementName, v_limitResource
                    FROM rasd r
                    WHERE r.instanceID=OLD.idResource;
 
                SELECT sp.idTier INTO v_idTier
                FROM kinton.rasd r, kinton.rasd_management rm, kinton.volume_management volMgmt,
                    kinton.storage_pool sp
                WHERE rm.idResource = OLD.idResource AND 
                    r.instanceID=rm.idResource AND r.resourcetype=8 AND
                    volMgmt.idManagement=rm.idManagement AND
                    volMgmt.idStorage=sp.idStorage;

                CALL kinton_accounting.AccountingStorageRegisterEvents('UPDATE_STORAGE', OLD.idResource, v_elementName, v_idTier, NEW.idVirtualDataCenter, idEnterpriseObj, v_limitResource);
            END IF;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER delete_rasd_management_update_stats AFTER DELETE ON rasd_management
    FOR EACH ROW BEGIN
	DECLARE idThisEnterprise INTEGER;
	DECLARE limitResourceObj BIGINT;    
	DECLARE resourceName VARCHAR(255);  
	--
	SELECT vdc.idEnterprise INTO idThisEnterprise
    FROM virtualdatacenter vdc
    WHERE vdc.idVirtualDataCenter = OLD.idVirtualDataCenter;
    -- 
	SELECT elementName, limitResource INTO resourceName, limitResourceObj
	FROM rasd r
	WHERE r.instanceID = OLD.idResource;
	--
    IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN           
        IF (OLD.idResourceType='8')  AND (OLD.temporal IS NULL) THEN 
            IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingStorageRegisterEvents' ) THEN
                CALL kinton_accounting.AccountingStorageRegisterEvents('DELETE_STORAGE', OLD.idResource, resourceName, 0, OLD.idVirtualDataCenter, idThisEnterprise, limitResourceObj);
            END IF;                  
        END IF;
    END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register` (
  `id` char(36) NOT NULL,
  `company_name` varchar(60) NOT NULL,
  `company_address` varchar(240) NOT NULL,
  `company_state` varchar(60) NOT NULL,
  `company_country_code` varchar(2) NOT NULL,
  `company_industry` varchar(255) DEFAULT NULL,
  `contact_title` varchar(60) NOT NULL,
  `contact_name` varchar(60) NOT NULL,
  `contact_email` varchar(60) NOT NULL,
  `contact_phone` varchar(60) NOT NULL,
  `company_size_revenue` varchar(60) NOT NULL,
  `company_size_employees` varchar(60) NOT NULL,
  `subscribe_development_news` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe_commercial_news` tinyint(1) NOT NULL DEFAULT '0',
  `allow_commercial_contact` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remote_service`
--

DROP TABLE IF EXISTS `remote_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remote_service` (
  `idRemoteService` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `idDataCenter` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `remoteServiceType` varchar(255) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idRemoteService`),
  KEY `idDatecenter_FK` (`idDataCenter`),
  CONSTRAINT `idDatecenter_FK` FOREIGN KEY (`idDataCenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remote_service`
--

LOCK TABLES `remote_service` WRITE;
/*!40000 ALTER TABLE `remote_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `remote_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository`
--

DROP TABLE IF EXISTS `repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository` (
  `idRepository` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idDataCenter` int(10) unsigned NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `URL` varchar(255) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idRepository`),
  KEY `fk_idDataCenter` (`idDataCenter`),
  CONSTRAINT `fk_idDataCenter` FOREIGN KEY (`idDataCenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository`
--

LOCK TABLES `repository` WRITE;
/*!40000 ALTER TABLE `repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `idRole` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT 'auto_name',
  `idEnterprise` int(10) unsigned DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  `idScope` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idRole`),
  KEY `fk_role_1` (`idEnterprise`),
  KEY `fk_role_scope` (`idScope`),
  CONSTRAINT `fk_role_scope` FOREIGN KEY (`idScope`) REFERENCES `scope` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_role_1` FOREIGN KEY (`idEnterprise`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'CLOUD_ADMIN',NULL,1,0,1),(2,'USER',NULL,0,0,1),(3,'ENTERPRISE_ADMIN',NULL,0,0,1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_ldap`
--

DROP TABLE IF EXISTS `role_ldap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_ldap` (
  `idRole_ldap` int(11) NOT NULL AUTO_INCREMENT,
  `idRole` int(10) unsigned NOT NULL,
  `role_ldap` varchar(128) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idRole_ldap`),
  KEY `fk_role_ldap_role` (`idRole`),
  CONSTRAINT `fk_role_ldap_role` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_ldap`
--

LOCK TABLES `role_ldap` WRITE;
/*!40000 ALTER TABLE `role_ldap` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_ldap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_privileges`
--

DROP TABLE IF EXISTS `roles_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_privileges` (
  `idRole` int(10) unsigned NOT NULL,
  `idPrivilege` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  KEY `fk_roles_privileges_privileges` (`idPrivilege`),
  KEY `fk_roles_privileges_role` (`idRole`),
  CONSTRAINT `fk_roles_privileges_role` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_roles_privileges_privileges` FOREIGN KEY (`idPrivilege`) REFERENCES `privilege` (`idPrivilege`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_privileges`
--

LOCK TABLES `roles_privileges` WRITE;
/*!40000 ALTER TABLE `roles_privileges` DISABLE KEYS */;
INSERT INTO `roles_privileges` VALUES (1,1,0),(1,2,0),(1,3,0),(1,4,0),(1,5,0),(1,6,0),(1,7,0),(1,8,0),(1,9,0),(1,10,0),(1,11,0),(1,12,0),(1,13,0),(1,14,0),(1,15,0),(1,16,0),(1,17,0),(1,18,0),(1,21,0),(1,22,0),(1,23,0),(1,24,0),(1,25,0),(1,26,0),(1,27,0),(1,28,0),(1,29,0),(1,30,0),(1,31,0),(1,32,0),(1,33,0),(1,34,0),(1,35,0),(1,36,0),(1,37,0),(1,38,0),(1,39,0),(1,40,0),(1,41,0),(1,42,0),(1,43,0),(1,44,0),(1,45,0),(1,47,0),(1,48,0),(1,49,0),(1,50,0),(3,3,0),(3,12,0),(3,13,0),(3,14,0),(3,15,0),(3,16,0),(3,17,0),(3,18,0),(3,21,0),(3,22,0),(3,23,0),(3,24,0),(3,25,0),(3,26,0),(3,27,0),(3,28,0),(3,29,0),(3,30,0),(3,32,0),(3,34,0),(3,43,0),(3,48,0),(2,12,0),(2,14,0),(2,17,0),(2,18,0),(2,21,0),(2,22,0),(2,23,0),(2,43,0),(1,51,0),(1,52,0),(1,53,0),(1,54,0),(1,55,0),(1,57,0),(2,57,0),(3,57,0),(1,56,0),(2,56,0),(3,56,0),(1,58,0),(1,59,0),(1,60,0),(1,61,0),(3,61,0),(1,62,0),(1,63,0);
/*!40000 ALTER TABLE `roles_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_resources`
--

DROP TABLE IF EXISTS `scheduled_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_resources` (
  `idPhysicalMachine` int(10) unsigned NOT NULL DEFAULT '0',
  `idDatastore` int(10) unsigned NOT NULL DEFAULT '0',
  `cpuUsed` int(10) unsigned NOT NULL DEFAULT '0',
  `ramUsed` int(10) unsigned NOT NULL DEFAULT '0',
  `datastoreUsed` bigint(20) unsigned NOT NULL DEFAULT '0',
  KEY `SCH_PM_DATASTORE_IDX` (`idPhysicalMachine`,`idDatastore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_resources`
--

LOCK TABLES `scheduled_resources` WRITE;
/*!40000 ALTER TABLE `scheduled_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduled_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scope`
--

DROP TABLE IF EXISTS `scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'auto_name',
  `autoEnt` tinyint(1) NOT NULL DEFAULT '0',
  `autoDat` tinyint(1) NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scope`
--

LOCK TABLES `scope` WRITE;
/*!40000 ALTER TABLE `scope` DISABLE KEYS */;
INSERT INTO `scope` VALUES (1,'Global scope',0,0,0);
/*!40000 ALTER TABLE `scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scope_resource`
--

DROP TABLE IF EXISTS `scope_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope_resource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idScope` int(10) unsigned NOT NULL,
  `idResource` int(10) unsigned NOT NULL,
  `resourceType` varchar(64) NOT NULL DEFAULT 'auto_name',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_scope_resource_scope` (`idScope`),
  CONSTRAINT `fk_scope_resource_scope` FOREIGN KEY (`idScope`) REFERENCES `scope` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scope_resource`
--

LOCK TABLES `scope_resource` WRITE;
/*!40000 ALTER TABLE `scope_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `scope_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(128) NOT NULL,
  `key` varchar(100) NOT NULL,
  `expireDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUser` int(10) unsigned DEFAULT NULL,
  `authType` varchar(20) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_session_user` (`idUser`),
  CONSTRAINT `fk_session_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_device`
--

DROP TABLE IF EXISTS `storage_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `idDataCenter` int(10) unsigned NOT NULL,
  `management_ip` varchar(256) NOT NULL,
  `management_port` int(10) unsigned NOT NULL DEFAULT '0',
  `service_ip` varchar(256) DEFAULT NULL,
  `service_port` int(10) unsigned DEFAULT NULL,
  `storage_technology` varchar(256) DEFAULT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `storage_device_FK_1` (`idDataCenter`),
  CONSTRAINT `storage_device_FK_1` FOREIGN KEY (`idDataCenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_device`
--

LOCK TABLES `storage_device` WRITE;
/*!40000 ALTER TABLE `storage_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_pool`
--

DROP TABLE IF EXISTS `storage_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_pool` (
  `idStorage` varchar(40) NOT NULL,
  `idStorageDevice` int(10) unsigned NOT NULL,
  `idTier` int(10) unsigned NOT NULL,
  `isEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `version_c` int(11) NOT NULL DEFAULT '1',
  `totalSizeInMb` bigint(20) unsigned NOT NULL DEFAULT '0',
  `usedSizeInMb` bigint(20) unsigned NOT NULL DEFAULT '0',
  `availableSizeInMb` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(256) DEFAULT NULL,
  `type` varchar(40) NOT NULL,
  `maxVolumes` int(10) unsigned NOT NULL,
  `usablePercent` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idStorage`),
  KEY `storage_pool_FK1` (`idStorageDevice`),
  KEY `storage_pool_FK2` (`idTier`),
  CONSTRAINT `storage_pool_FK1` FOREIGN KEY (`idStorageDevice`) REFERENCES `storage_device` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `storage_pool_FK2` FOREIGN KEY (`idTier`) REFERENCES `tier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_pool`
--

LOCK TABLES `storage_pool` WRITE;
/*!40000 ALTER TABLE `storage_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_properties`
--

DROP TABLE IF EXISTS `system_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_properties` (
  `systemPropertyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version_c` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`systemPropertyId`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_properties`
--

LOCK TABLES `system_properties` WRITE;
/*!40000 ALTER TABLE `system_properties` DISABLE KEYS */;
INSERT INTO `system_properties` VALUES (1,0,'client.applibrary.ovfpackagesDownloadingProgressUpdateInterval','10','Time interval in seconds'),(2,0,'client.applibrary.virtualimageUploadProgressUpdateInterval','10','Time interval in seconds'),(3,0,'client.dashboard.abiquoURL','http://www.abiquo.org','URL of Abiquo web page'),(4,0,'client.dashboard.allowUsersAccess','1','Allow (1) or deny (0) access to the \'Users\' section'),(5,0,'client.dashboard.showStartUpAlert','1','Set to 1 to enable wizard feature'),(6,0,'client.infra.googleMapsDefaultLatitude','41.3825','Google Maps will be centered by default at this longitude value'),(7,0,'client.infra.googleMapsDefaultLongitude','2.176944','Google Maps will be centered by default at this latitude value'),(8,0,'client.infra.googleMapsDefaultZoom','4','Google Maps will be centered by default with this zoom level value'),(9,0,'client.infra.googleMapskey','0','The map\'s Google key used in infrastructure section'),(10,0,'client.infra.googleMapsLadTimeOut','10','Time, in seconds, that applications waits Google Maps to load. After that, application considers that Google Maps service is temporarily unavailable, and is not used'),(11,0,'client.infra.InfrastructureUpdateInterval','30','Time interval in seconds'),(12,0,'client.infra.ucsManagerLink','/ucsm/ucsm.jnlp','URL to display UCS Manager Interface'),(13,0,'client.metering.meteringUpdateInterval','10','Time interval in seconds'),(14,0,'client.network.numberIpAdressesPerPage','25','Number entries that will appear when listing IP addresses in different parts of the application'),(15,0,'client.theme.defaultEnterpriseLogoPath','themes/abicloudDefault/logo.png','This is the path to the Enterprise logo used in the app'),(16,0,'client.user.numberEnterprisesPerPage','25','Number of enterprises per page that will appear in User Management'),(17,0,'client.user.numberUsersPerPage','25','Number of users per page that will appear in User Management'),(18,0,'client.virtual.allowVMRemoteAccess','1','Allow (1) or deny (0) virtual machine remote access'),(19,0,'client.virtual.virtualApplianceDeployingUpdateInterval','5','Time interval in seconds'),(20,0,'client.virtual.virtualAppliancesUpdateInterval','30','Time interval in seconds'),(21,0,'client.virtual.moreInfoAboutUploadLimitations','http://wiki.abiquo.com/display/ABI20/Adding+VM+Templates+to+the+Appliance+Library#AddingVMTemplatestotheApplianceLibrary-UploadingfromtheLocalFilesystem','URL of Abiquo virtual image upload limitations web page'),(22,0,'client.infra.vlanIdMin','2','Minimum value for vlan ID'),(23,0,'client.infra.vlanIdMax','4094','Maximum value for vlan ID'),(24,0,'client.dashboard.dashboardUpdateInterval','30','Time interval in seconds'),(25,0,'client.infra.defaultHypervisorPassword','temporal','Default Hypervisor password used when creating Physical Machines'),(26,0,'client.infra.defaultHypervisorPort','8889','Default Hypervisor port used when creating Physical Machines'),(27,0,'client.infra.defaultHypervisorUser','root','Default Hypervisor user used when creating Physical Machines'),(28,0,'client.storage.volumeMaxSizeValues','1,2,4,8,16,32,64,128,256','Comma separated values, with the allowed sizes when creating or editing a VolumeManagement'),(29,0,'client.virtual.virtualImagesRefreshConversionsInterval','5','Time interval in seconds to refresh missing virtual image conversions'),(30,0,'client.main.enterpriseLogoURL','http://www.abiquo.com','URL displayed when the header enterprise logo is clicked'),(31,0,'client.main.billingUrl','','URL displayed when the report header logo is clicked, if empty the report button will not be displayed'),(32,0,'client.main.disableChangePassword','1','Allow (1) or deny (0) user to change their password'),(33,0,'client.logout.url','','Redirect to this URL after logout (empty -> login screen)'),(34,0,'client.main.allowLogout','1','Allow (1) or deny (0) user to logout'),(35,0,'client.wiki.showHelp','1','Show (1) or hide (0) the help icon within the plateform'),(36,0,'client.wiki.showDefaultHelp','0','Use (1) or not (0) the default help URL within the plateform'),(37,0,'client.wiki.defaultURL','http://wiki.abiquo.com/display/ABI26/Abiquo+Documentation+Home','The default URL opened when not specific help URL is specified'),(38,0,'client.wiki.infra.createDatacenter','http://wiki.abiquo.com/display/ABI26/Manage+Datacenters#ManageDatacenters-CreateaDatacenterorPublicDatacenter','datacenter creation wiki'),(39,0,'client.wiki.infra.editDatacenter','http://wiki.abiquo.com/display/ABI26/Manage+Datacenters#ManageDatacenters-ModifyaDatacenter','datacenter edition wiki'),(40,0,'client.wiki.infra.editRemoteService','http://wiki.abiquo.com/display/ABI26/Manage+Datacenters#ManageDatacenters-ModifyRemoteServices','remote service edition wiki'),(41,0,'client.wiki.infra.createPhysicalMachine','http://wiki.abiquo.com/display/ABI26/Compute+Resources+on+Standard+Racks#ComputeResourcesonStandardRacks-CreateaMachine','physical machine creation wiki'),(42,0,'client.wiki.infra.mailNotification','http://wiki.abiquo.com/display/ABI26/Compute+Resources+in+Datacenters#ComputeResourcesinDatacenters-SendingEmailNotifications','mail notification wiki'),(43,0,'client.wiki.infra.addDatastore','http://wiki.abiquo.com/display/ABI26/Compute+Resources+on+Standard+Racks#ComputeResourcesonStandardRacks-ManageDatastores','Datastore manager wiki'),(44,0,'client.wiki.infra.createRack','http://wiki.abiquo.com/display/ABI26/Compute+Resources+on+Standard+Racks#ComputeResourcesonStandardRacks-CreateStandardRacks','rack creation wiki'),(46,0,'client.wiki.network.publicVlan','http://wiki.abiquo.com/display/ABI26/Manage+Public+Networks','public vlan creation wiki'),(47,0,'client.wiki.network.staticRoutes','http://wiki.abiquo.com/display/ABI26/Manage+Public+Networks#ManagePublicNetworks-ConfigureStaticRoutesUsingDHCP','static routes wiki'),(48,0,'client.wiki.storage.storageDevice','http://wiki.abiquo.com/display/ABI26/Manage+External+Storage#ManageExternalStorage-ManagedStorage','storage device creation wiki'),(49,0,'client.wiki.storage.storagePool','http://wiki.abiquo.com/display/ABI26/Manage+External+Storage#ManageExternalStorage-StoragePools','storage pool creation wiki'),(50,0,'client.wiki.storage.tier','http://wiki.abiquo.com/display/ABI26/Manage+External+Storage#ManageExternalStorage-ManageStorageServiceLevelswithTiers','tier edition wiki'),(51,0,'client.wiki.allocation.global','http://wiki.abiquo.com/display/ABI26/Manage+Allocation+Rules#ManageAllocationRules-GlobalRulesManagement','global rules wiki'),(52,0,'client.wiki.allocation.datacenter','http://wiki.abiquo.com/display/ABI26/Manage+Allocation+Rules#ManageAllocationRules-DatacenterRulesManagement','datacenter rules wiki'),(53,0,'client.wiki.vdc.createVdc','http://wiki.abiquo.com/display/ABI26/Manage+Virtual+Datacenters#ManageVirtualDatacenters-CreateaVirtualDatacenter','virtual datacenter creation wiki'),(54,0,'client.wiki.vdc.createVapp','http://wiki.abiquo.com/display/ABI26/Basic+Operations#BasicOperations-CreatingaNewVirtualAppliance','virtual app creation wiki'),(55,0,'client.wiki.vdc.createPrivateNetwork','http://wiki.abiquo.com/display/ABI26/Manage+Networks#ManageNetworks-CreateaPrivateVLAN','VDC private network creation wiki'),(56,0,'client.wiki.vdc.createPublicNetwork','http://wiki.abiquo.com/display/ABI26/Manage+Networks#ManageNetworks-ReservePublicIPAddresses','VDC public network creation wiki'),(57,0,'client.wiki.vdc.createVolume','http://wiki.abiquo.com/display/ABI26/Manage+Virtual+Storage#ManageVirtualStorage-CreatingaVolumeofManagedStorage','VDC virtual volume creation wiki'),(58,0,'client.wiki.vm.editVirtualMachine','http://wiki.abiquo.com/display/ABI26/Configure+Virtual+Machines','Virtual Machine edition wiki'),(59,0,'client.wiki.vm.bundleVirtualMachine','http://wiki.abiquo.com/display/ABI26/Configure+a+Virtual+Appliance#ConfigureaVirtualAppliance-AddInstancesofVirtualMachines','Bundles VM wiki'),(60,0,'client.wiki.vm.createNetworkInterface','http://wiki.abiquo.com/display/ABI26/Configure+Virtual+Machines#ConfigureVirtualMachines-CreateaNewNetworkInterface','Network Interface creation wiki'),(61,0,'client.wiki.vm.createInstance','http://wiki.abiquo.com/display/ABI26/Create+Virtual+Machine+Instances','Virtual Machine instance creation wiki'),(62,0,'client.wiki.vm.createStateful','http://wiki.abiquo.com/display/ABI26/Create+Persistent+Virtual+Machines','Virtual Machine stateful creation wiki'),(63,0,'client.wiki.vm.captureVirtualMachine','http://wiki.abiquo.com/display/ABI26/Import+and+Capture+Virtual+Machines#ImportandCaptureVirtualMachines-CaptureVirtualMachines','Capture Virtual Machine wiki'),(64,0,'client.wiki.vm.deployInfo','','Show more info when deploying'),(65,0,'client.wiki.apps.uploadVM','http://wiki.abiquo.com/display/ABI26/Add+a+VM+Template+to+the+Appliance+Library#AddaVMTemplatetotheApplianceLibrary-UploadfromtheLocalFilesystem','Virtual Image upload wiki'),(66,0,'client.wiki.user.createEnterprise','http://wiki.abiquo.com/display/ABI26/Manage+Enterprises#ManageEnterprises-CreatinganEnterprise','Enterprise creation wiki'),(67,0,'client.wiki.user.dataCenterLimits','http://wiki.abiquo.com/display/ABI26/Manage+Enterprises#ManageEnterprises-EdittheDatacentersanEnterpriseisAllowedtoUse','Datacenter Limits wiki'),(68,0,'client.wiki.user.createUser','http://wiki.abiquo.com/display/ABI26/Manage+Users#ManageUsers-CreatingorEditingaUser','User creation wiki'),(69,0,'client.wiki.user.createRole','http://wiki.abiquo.com/display/ABI26/Manage+Roles','Role creation wiki'),(70,0,'client.wiki.pricing.createCurrency','http://wiki.abiquo.com/display/ABI26/Pricing+View#PricingView-ManageCurrencies','Currency creation wiki'),(71,0,'client.wiki.pricing.createTemplate','http://wiki.abiquo.com/display/ABI26/Pricing+View#PricingView-ManagePricingModels','create pricing template wiki'),(72,0,'client.wiki.pricing.createCostCode','http://wiki.abiquo.com/display/ABI26/Pricing+View#PricingView-ManageCostCodes','create pricing cost code wiki'),(73,0,'client.wiki.config.general','http://wiki.abiquo.com/display/ABI26/Configuration+view','Configuration wiki'),(75,0,'client.wiki.config.licence','http://wiki.abiquo.com/display/ABI26/Configuration+view#ConfigurationView-LicenseManagement','Licence configuration wiki'),(77,0,'client.wiki.infra.discoverBlades','http://wiki.abiquo.com/display/ABI26/Compute+Resources+on+Managed+Racks#ComputeResourcesonManagedRacks-DiscoverBladesonManagedRacks','discover UCS blades wiki'),(78,0,'client.network.defaultName','default_private_network','default private vlan name'),(79,0,'client.network.defaultNetmask','2','index of available netmask'),(80,0,'client.network.defaultAddress','192.168.0.0','default private vlan address'),(81,0,'client.network.defaultGateway','192.168.0.1','default private vlan gateway'),(82,0,'client.network.defaultPrimaryDNS','','default primary DNS'),(83,0,'client.network.defaultSecondaryDNS','','default secondary DNS'),(84,0,'client.network.defaultSufixDNS','','default sufix DNS'),(85,0,'client.main.showHardDisk','1','Show (1) or hide (0) hard disk tab'),(86,0,'client.main.defaultView','0','Default index view (0 is the Home, 1 Infrastructure, ...)'),(87,0,'client.main.showSoftInfo','1','Show soft limit info (1 show, 0 hide)'),(88,0,'client.main.showHardInfo','1','Show hard limit info (1 show, 0 hide)'),(89,0,'client.wiki.user.createScope','http://wiki.abiquo.com/display/ABI26/Manage+Scopes','Wiki link for scope management'),(90,0,'client.dashboard.licenseUrl','http://www.abiquo.com/license','Url to purchase licenses (empty->disable link)'),(91,0,'client.wiki.infra.main','http://wiki.abiquo.com/display/ABI26/Infrastructure+View','Wiki link for infrastructure management'),(92,0,'client.wiki.virtualinfra.main','http://wiki.abiquo.com/display/ABI26/Virtual+Datacenters+View','Wiki link for virtual infrastructure management'),(93,0,'client.wiki.apps.main','http://wiki.abiquo.com/display/ABI26/Appliance+Library+View','Wiki link for apps library management'),(94,0,'client.wiki.vm.createLayer','http://wiki.abiquo.com/display/ABI26/Configure+VM+High+Availability#ConfigureVMHighAvailability-CreateanAnti-affinityLayer','Wiki link for layer management'),(95,0,'client.main.workflowEnabled','0',NULL),(96,0,'client.main.workflowEndPoint','',NULL);
/*!40000 ALTER TABLE `system_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `component` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tier`
--

DROP TABLE IF EXISTS `tier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `isEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `idDataCenter` int(10) unsigned NOT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  `isDefaultAllowed` tinyint(1) NOT NULL DEFAULT '1',
  `storageAllocationPolicy` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tier_FK_1` (`idDataCenter`),
  CONSTRAINT `tier_FK_1` FOREIGN KEY (`idDataCenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tier`
--

LOCK TABLES `tier` WRITE;
/*!40000 ALTER TABLE `tier` DISABLE KEYS */;
/*!40000 ALTER TABLE `tier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucs_rack`
--

DROP TABLE IF EXISTS `ucs_rack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ucs_rack` (
  `idRack` int(10) unsigned NOT NULL,
  `ip` varchar(20) NOT NULL,
  `port` int(11) NOT NULL,
  `user_rack` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `defaultTemplate` varchar(200) DEFAULT NULL,
  `maxMachinesOn` int(11) DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  KEY `id_rack_FK` (`idRack`),
  CONSTRAINT `id_rack_FK` FOREIGN KEY (`idRack`) REFERENCES `rack` (`idRack`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucs_rack`
--

LOCK TABLES `ucs_rack` WRITE;
/*!40000 ALTER TABLE `ucs_rack` DISABLE KEYS */;
/*!40000 ALTER TABLE `ucs_rack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idUser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idRole` int(10) unsigned NOT NULL,
  `idEnterprise` int(10) unsigned DEFAULT NULL,
  `user` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `locale` varchar(10) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `availableVirtualDatacenters` varchar(255) DEFAULT NULL,
  `active` int(10) unsigned NOT NULL DEFAULT '0',
  `authType` varchar(20) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version_c` int(11) DEFAULT '0',
  `publicSshKey` text,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `user_auth_idx` (`user`,`authType`),
  KEY `FK1_user` (`idEnterprise`),
  KEY `User_FK1` (`idRole`),
  KEY `IKC_user_authtype` (`user`,`authType`),
  CONSTRAINT `FK1_user` FOREIGN KEY (`idEnterprise`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `User_FK1` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,1,'admin','Cloud','Administrator','Main administrator','','en_US','c69a39bd64ffb77ea7ee3369dce742f3',NULL,1,'ABIQUO','2012-04-27 08:25:34',0,NULL),(2,2,1,'user','Standard','User','Standard user','','en_US','c69a39bd64ffb77ea7ee3369dce742f3',NULL,1,'ABIQUO','2012-04-27 08:25:34',0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vapp_enterprise_stats_vw`
--

DROP TABLE IF EXISTS `vapp_enterprise_stats_vw`;
/*!50001 DROP VIEW IF EXISTS `vapp_enterprise_stats_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vapp_enterprise_stats_vw` (
  `idVirtualApp` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `idVirtualDataCenter` tinyint NOT NULL,
  `vappName` tinyint NOT NULL,
  `vdcName` tinyint NOT NULL,
  `vmCreated` tinyint NOT NULL,
  `vmActive` tinyint NOT NULL,
  `volAssociated` tinyint NOT NULL,
  `volAttached` tinyint NOT NULL,
  `version_c` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vdc_enterprise_stats_vw`
--

DROP TABLE IF EXISTS `vdc_enterprise_stats_vw`;
/*!50001 DROP VIEW IF EXISTS `vdc_enterprise_stats_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vdc_enterprise_stats_vw` (
  `idVirtualDataCenter` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `vdcName` tinyint NOT NULL,
  `vmCreated` tinyint NOT NULL,
  `vmActive` tinyint NOT NULL,
  `volCreated` tinyint NOT NULL,
  `volAssociated` tinyint NOT NULL,
  `volAttached` tinyint NOT NULL,
  `vCpuReserved` tinyint NOT NULL,
  `vCpuUsed` tinyint NOT NULL,
  `memoryReserved` tinyint NOT NULL,
  `memoryUsed` tinyint NOT NULL,
  `localStorageReserved` tinyint NOT NULL,
  `localStorageUsed` tinyint NOT NULL,
  `extStorageReserved` tinyint NOT NULL,
  `extStorageUsed` tinyint NOT NULL,
  `publicIPsReserved` tinyint NOT NULL,
  `publicIPsUsed` tinyint NOT NULL,
  `vlanReserved` tinyint NOT NULL,
  `vlanUsed` tinyint NOT NULL,
  `version_c` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `virtual_appliance_conversions`
--

DROP TABLE IF EXISTS `virtual_appliance_conversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_appliance_conversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idConversion` int(10) unsigned NOT NULL,
  `idVirtualAppliance` int(10) unsigned NOT NULL,
  `idUser` int(10) unsigned DEFAULT NULL,
  `forceLimits` tinyint(1) DEFAULT NULL,
  `idNode` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `virtualimage_conversions_FK` (`idConversion`),
  KEY `virtual_appliance_conversions_node_FK` (`idNode`),
  KEY `user_FK` (`idUser`),
  KEY `virtualapp_FK` (`idVirtualAppliance`),
  CONSTRAINT `virtualapp_FK` FOREIGN KEY (`idVirtualAppliance`) REFERENCES `virtualapp` (`idVirtualApp`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user_FK` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `virtualimage_conversions_FK` FOREIGN KEY (`idConversion`) REFERENCES `virtualimage_conversions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `virtual_appliance_conversions_node_FK` FOREIGN KEY (`idNode`) REFERENCES `nodevirtualimage` (`idNode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_appliance_conversions`
--

LOCK TABLES `virtual_appliance_conversions` WRITE;
/*!40000 ALTER TABLE `virtual_appliance_conversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_appliance_conversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualapp`
--

DROP TABLE IF EXISTS `virtualapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualapp` (
  `idVirtualApp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idVirtualDataCenter` int(10) unsigned NOT NULL,
  `idEnterprise` int(10) unsigned DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `public` int(10) unsigned NOT NULL,
  `high_disponibility` int(10) unsigned NOT NULL,
  `error` int(10) unsigned NOT NULL,
  `nodeconnections` text,
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idVirtualApp`),
  KEY `VirtualApp_FK5` (`idEnterprise`),
  KEY `VirtualApp_FK4` (`idVirtualDataCenter`),
  CONSTRAINT `VirtualApp_FK4` FOREIGN KEY (`idVirtualDataCenter`) REFERENCES `virtualdatacenter` (`idVirtualDataCenter`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `VirtualApp_FK5` FOREIGN KEY (`idEnterprise`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualapp`
--

LOCK TABLES `virtualapp` WRITE;
/*!40000 ALTER TABLE `virtualapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualdatacenter`
--

DROP TABLE IF EXISTS `virtualdatacenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualdatacenter` (
  `idVirtualDataCenter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEnterprise` int(10) unsigned NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `idDataCenter` int(10) unsigned NOT NULL,
  `networktypeID` int(10) unsigned DEFAULT NULL,
  `hypervisorType` varchar(255) NOT NULL,
  `ramSoft` bigint(20) NOT NULL DEFAULT '0',
  `cpuSoft` bigint(20) NOT NULL DEFAULT '0',
  `hdSoft` bigint(20) NOT NULL DEFAULT '0',
  `storageSoft` bigint(20) NOT NULL DEFAULT '0',
  `vlanSoft` bigint(20) NOT NULL DEFAULT '0',
  `publicIPSoft` bigint(20) NOT NULL DEFAULT '0',
  `ramHard` bigint(20) NOT NULL DEFAULT '0',
  `cpuHard` bigint(20) NOT NULL DEFAULT '0',
  `hdHard` bigint(20) NOT NULL DEFAULT '0',
  `storageHard` bigint(20) NOT NULL DEFAULT '0',
  `vlanHard` bigint(20) NOT NULL DEFAULT '0',
  `publicIPHard` bigint(20) NOT NULL DEFAULT '0',
  `default_vlan_network_id` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idVirtualDataCenter`),
  KEY `virtualDataCenter_FK7` (`default_vlan_network_id`),
  KEY `virtualDataCenter_FK6` (`idDataCenter`),
  KEY `virtualDataCenter_FK1` (`idEnterprise`),
  KEY `virtualDataCenter_FK4` (`networktypeID`),
  CONSTRAINT `virtualDataCenter_FK4` FOREIGN KEY (`networktypeID`) REFERENCES `network` (`network_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `virtualDataCenter_FK1` FOREIGN KEY (`idEnterprise`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `virtualDataCenter_FK6` FOREIGN KEY (`idDataCenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `virtualDataCenter_FK7` FOREIGN KEY (`default_vlan_network_id`) REFERENCES `vlan_network` (`vlan_network_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualdatacenter`
--

LOCK TABLES `virtualdatacenter` WRITE;
/*!40000 ALTER TABLE `virtualdatacenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualdatacenter` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER virtualdatacenter_updated AFTER UPDATE ON virtualdatacenter
    FOR EACH ROW BEGIN
		DECLARE vlanNetworkIdObj INTEGER;    
		DECLARE networkNameObj VARCHAR(40);
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN           
		    IF OLD.networktypeID IS NOT NULL AND NEW.networktypeID IS NULL THEN
		    -- Accounting events registered for VLAN deletion as a result from this VDC cascade deletion
			BEGIN
				DECLARE done INTEGER DEFAULT 0;
				DECLARE cursorVlan CURSOR FOR SELECT DISTINCT vn.vlan_network_id, vn.network_name FROM vlan_network vn WHERE vn.network_id = OLD.networktypeID;
				DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;				
				OPEN cursorVlan;				
				REPEAT
					FETCH cursorVlan into vlanNetworkIdObj, networkNameObj;
				   	IF NOT done THEN
						IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVLANRegisterEvents' ) THEN							
							CALL kinton_accounting.AccountingVLANRegisterEvents('DELETE_VLAN',vlanNetworkIdObj, networkNameObj, OLD.idVirtualDataCenter,OLD.idEnterprise);
					   	END IF;    
					END IF;
					UNTIL done END REPEAT;
					CLOSE cursorVlan;				 	
			END ;
		    END IF;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER virtualdatacenter_deleted BEFORE DELETE ON virtualdatacenter
    FOR EACH ROW BEGIN
    DECLARE currentIdManagement INTEGER DEFAULT -1;
    DECLARE currentIpAddress VARCHAR(20) DEFAULT '';
    DECLARE no_more_ipsfreed INT;
    DECLARE curIpFreed CURSOR FOR SELECT ipm.ip, ra.idManagement   
       FROM ip_pool_management ipm, network_configuration nc, vlan_network vn, rasd_management ra
       WHERE ipm.vlan_network_id = vn.vlan_network_id
       AND vn.network_configuration_id = nc.network_configuration_id
       AND vn.networktype = 'PUBLIC'
       AND ra.idManagement = ipm.idManagement
       AND ra.idVirtualDataCenter = OLD.idVirtualDataCenter;
       --
       DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_ipsfreed = 1;   
       IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
			SET no_more_ipsfreed = 0;       
		    OPEN curIpFreed;            
		    my_loop:WHILE(no_more_ipsfreed=0) DO 
				FETCH curIpFreed INTO currentIpAddress, currentIdManagement;
				IF no_more_ipsfreed=1 THEN
				            LEAVE my_loop;
				     END IF;
				-- We reset MAC and NAME for the reserved IPs. Java code should do this!
				UPDATE ip_pool_management set mac=NULL, name=NULL WHERE idManagement = currentIdManagement;
				IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingIPsRegisterEvents' ) THEN
					CALL kinton_accounting.AccountingIPsRegisterEvents('IP_FREED',currentIdManagement,currentIpAddress,OLD.idVirtualDataCenter, OLD.idEnterprise);
				END IF;                    
        	END WHILE my_loop;         
        CLOSE curIpFreed;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `virtualimage`
--

DROP TABLE IF EXISTS `virtualimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualimage` (
  `idImage` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pathName` varchar(255) NOT NULL,
  `hd_required` bigint(20) DEFAULT NULL,
  `ram_required` int(10) unsigned DEFAULT NULL,
  `cpu_required` int(11) DEFAULT NULL,
  `iconUrl` varchar(255) DEFAULT NULL,
  `idCategory` int(10) unsigned NOT NULL,
  `idRepository` int(10) unsigned DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `ethDriverType` varchar(16) DEFAULT NULL,
  `idMaster` int(10) unsigned DEFAULT NULL,
  `idEnterprise` int(10) unsigned DEFAULT NULL,
  `shared` int(10) unsigned NOT NULL DEFAULT '0',
  `ovfid` varchar(255) DEFAULT NULL,
  `stateful` int(10) unsigned NOT NULL,
  `diskFileSize` bigint(20) unsigned NOT NULL,
  `chefEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `cost_code` int(11) DEFAULT '0',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creation_user` varchar(128) NOT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  `loginUser` varchar(45) DEFAULT NULL,
  `loginPassword` varchar(90) DEFAULT NULL,
  `osType` varchar(50) NOT NULL DEFAULT 'UNRECOGNIZED',
  `osVersion` varchar(64) DEFAULT NULL,
  `diskCntrlType` varchar(16) DEFAULT NULL,
  `coresPerSocket` int(10) unsigned DEFAULT NULL,
  `available` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`idImage`),
  KEY `fk_virtualimage_category` (`idCategory`),
  KEY `virtualImage_FK9` (`idEnterprise`),
  KEY `virtualImage_FK8` (`idMaster`),
  KEY `virtualImage_FK3` (`idRepository`),
  CONSTRAINT `virtualImage_FK3` FOREIGN KEY (`idRepository`) REFERENCES `repository` (`idRepository`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_virtualimage_category` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `virtualImage_FK8` FOREIGN KEY (`idMaster`) REFERENCES `virtualimage` (`idImage`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `virtualImage_FK9` FOREIGN KEY (`idEnterprise`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualimage`
--

LOCK TABLES `virtualimage` WRITE;
/*!40000 ALTER TABLE `virtualimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualimage` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER virtualimage_insert AFTER INSERT ON virtualimage
    FOR EACH ROW BEGIN
		-- For debugging purposes only        
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   

            # Only include non-persistent images associated with an enterprise
            # (persistent images are hosted on 'external' storage so are already charged for!)
            IF ((NEW.idEnterprise > 0) AND (NEW.stateful=0)) AND
                EXISTS( SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingRepositoryRegisterEvents' ) THEN
                
                CALL kinton_accounting.AccountingRepositoryRegisterEvents('ADD_IMAGE',
                                                        NEW.idImage, NEW.idRepository, NEW.name, NEW.type,
                                                        IF(NEW.idMaster IS NULL,'TEMPLATE','INSTANCE'), NEW.diskFileSize, NEW.idEnterprise);
            END IF;
      	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER virtualimage_update AFTER UPDATE ON virtualimage
    FOR EACH ROW BEGIN
    	DECLARE idDummy BIGINT; # Dummy variable to stop result set generation

		-- For debugging purposes only        
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   

            # Only include non-persistent images associated with an enterprise
            # (persistent images are hosted on 'external' storage so are already charged for!)
            IF ((NEW.idEnterprise > 0) AND (NEW.stateful=0)) AND
                EXISTS( SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingRepositoryRegisterEvents' ) THEN
                
                IF (NEW.name != OLD.name) THEN
                    # Image name has changed, update the accounting image name...
                    CALL kinton_accounting.AccountingRepositoryRegisterEvents('UPDATE_IMAGE',
                                                            NEW.idImage, NEW.idRepository, NEW.name, NEW.type,
                                                            IF(NEW.idMaster IS NULL,'TEMPLATE','INSTANCE'), NEW.diskFileSize, NEW.idEnterprise);
                END IF;

                IF (NEW.available != OLD.available) THEN
                BEGIN
                    IF (NEW.available=0) THEN
                        # Image name has changed, update the accounting image name...
                        CALL kinton_accounting.AccountingRepositoryRegisterEvents('DELETE_IMAGE',
                                                            NEW.idImage, NEW.idRepository, NEW.name, NEW.type,
                                                            IF(NEW.idMaster IS NULL,'TEMPLATE','INSTANCE'), NEW.diskFileSize, NEW.idEnterprise);
                    ELSE
                        # The image has been re-initialised from an unavailable state, so add it again!
                        CALL kinton_accounting.AccountingRepositoryRegisterEvents('ADD_IMAGE',
                                                            NEW.idImage, NEW.idRepository, NEW.name, NEW.type,
                                                            IF(NEW.idMaster IS NULL,'TEMPLATE','INSTANCE'), NEW.diskFileSize, NEW.idEnterprise);
                    END IF;
                END;
                END IF;
                
                IF (NEW.cost_code != OLD.cost_code) THEN
                    # The image Cost Code has changed, update any image cost codes in the current running VMs. We do it here (in line) for efficiency
                    # reasons, rather than forcing though inefficient calls to the AccountingVMRegisterEvents SP
                BEGIN
                    DECLARE v_idVM INTEGER UNSIGNED;
                    DECLARE v_cpu INTEGER UNSIGNED;
                    DECLARE v_ram INTEGER UNSIGNED;
                    DECLARE v_hd BIGINT UNSIGNED;
                    DECLARE done INT DEFAULT FALSE;
                    DECLARE cur1 CURSOR FOR SELECT vma.idVM, vma.cpu, vma.ram, vma.hd
                                            FROM kinton_accounting.accounting_event_vm vma, virtualmachine vm
                                            WHERE   vm.idImage=NEW.idImage AND
                                                    vma.idVM=vm.idVM AND vma.stopTime IS NULL;
                    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

                    OPEN cur1;
                    read_loop: LOOP
                        FETCH cur1 INTO v_idVM, v_cpu, v_ram, v_hd;
                        IF done THEN
                          LEAVE read_loop;
                        END IF;

                        CALL kinton_accounting.AccountingVMRegisterEvents(v_idVM, 1, "N/A", "COST_CODE_UPDATE", "N/A", v_ram, v_cpu, v_hd, NEW.cost_code);
                    END LOOP;
                    CLOSE cur1;
                END ;
                END IF;
            END IF;
      	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER virtualimage_delete AFTER DELETE ON virtualimage
    FOR EACH ROW BEGIN
		-- For debugging purposes only        
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   

            IF ((OLD.idEnterprise > 0) AND (OLD.stateful=0)) AND
                EXISTS( SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingRepositoryRegisterEvents' ) THEN
                
                CALL kinton_accounting.AccountingRepositoryRegisterEvents('DELETE_IMAGE',
                                                        OLD.idImage, OLD.idRepository, OLD.name, OLD.type,
                                                        IF(OLD.idMaster IS NULL,'TEMPLATE','INSTANCE'), OLD.diskFileSize, OLD.idEnterprise);
            END IF;
      	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `virtualimage_conversions`
--

DROP TABLE IF EXISTS `virtualimage_conversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualimage_conversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idImage` int(10) unsigned NOT NULL,
  `sourceType` varchar(50) DEFAULT NULL,
  `targetType` varchar(50) NOT NULL,
  `sourcePath` varchar(255) DEFAULT NULL,
  `targetPath` varchar(255) NOT NULL,
  `state` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `size` bigint(20) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idImage_FK` (`idImage`),
  CONSTRAINT `idImage_FK` FOREIGN KEY (`idImage`) REFERENCES `virtualimage` (`idImage`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualimage_conversions`
--

LOCK TABLES `virtualimage_conversions` WRITE;
/*!40000 ALTER TABLE `virtualimage_conversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualimage_conversions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER virtualimage_conversions_insert AFTER INSERT ON virtualimage_conversions
    FOR EACH ROW BEGIN
        DECLARE v_idEnterprise INT;
        DECLARE v_idRepository INT;
        DECLARE v_idMaster INT;
        DECLARE v_name VARCHAR(255);
        DECLARE v_stateful INT;

		-- For debugging purposes only        
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   

            # For most cases, we use the UPDATE rather than INSERT trigger to account for image conversions
            #    - This is because we only start accounting for image conversions when they complete, and they not normally INSERTed with a FINISHED state
            #    - There are exceptions though (promoted instance conversions, and repository refreshes of existing conversions). This trigger
            #      handles these cases only…
            IF (NEW.state = 'FINISHED') AND
                EXISTS( SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingRepositoryRegisterEvents' ) THEN

                # READ the relevant image information from the related virtualimage record
                SELECT      idEnterprise, idRepository, idMaster, name, stateful
                    INTO    v_idEnterprise, v_idRepository, v_idMaster, v_name, v_stateful
                FROM virtualimage vi
                WHERE vi.idImage=NEW.idImage;

                IF (v_stateful = 0) THEN 
                    # Create a new row for the image conversion...
                    CALL kinton_accounting.AccountingRepositoryRegisterEvents('ADD_IMAGE',
                                                            NEW.idImage, v_idRepository, v_name, NEW.targetType,
                                                            IF(v_idMaster IS NULL,'TEMPLATE-CONVERSION','INSTANCE-CONVERSION'), NEW.size, v_idEnterprise);
                END IF;
            END IF;
      	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER virtualimage_conversions_update AFTER UPDATE ON virtualimage_conversions
    FOR EACH ROW BEGIN
        DECLARE v_idEnterprise INT;
        DECLARE v_idRepository INT;
        DECLARE v_idMaster INT;
        DECLARE v_name VARCHAR(255);
        DECLARE v_stateful INT;

		-- For debugging purposes only        
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   

            # We only have an UPDATE trigger to map the image conversions - this is because we only start accounting for
            # image conversions when they complete, and they are never INSERTed with a FINISHED state.
            # Similarly, the 
            IF ((NEW.state = 'FINISHED') AND (OLD.state != 'FINISHED')) AND
                EXISTS( SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingRepositoryRegisterEvents' ) THEN

                # READ the relevant image information from the related virtualimage record
                SELECT      idEnterprise, idRepository, idMaster, name, stateful
                    INTO    v_idEnterprise, v_idRepository, v_idMaster, v_name, v_stateful
                FROM virtualimage vi
                WHERE vi.idImage=NEW.idImage;

                IF (v_stateful = 0) THEN 
                    # Create a new row for the imsage conversion...
                    CALL kinton_accounting.AccountingRepositoryRegisterEvents('ADD_IMAGE',
                                                            NEW.idImage, v_idRepository, v_name, NEW.targetType,
                                                            IF(v_idMaster IS NULL,'TEMPLATE-CONVERSION','INSTANCE-CONVERSION'), NEW.size, v_idEnterprise);
                END IF;
            END IF;
      	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `virtualmachine`
--

DROP TABLE IF EXISTS `virtualmachine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualmachine` (
  `idVM` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idHypervisor` int(10) unsigned DEFAULT NULL,
  `idImage` int(10) unsigned DEFAULT NULL,
  `UUID` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ram` int(10) unsigned DEFAULT NULL,
  `cpu` int(10) unsigned DEFAULT NULL,
  `hd` bigint(20) unsigned DEFAULT NULL,
  `vdrpPort` int(10) unsigned DEFAULT NULL,
  `vdrpIP` varchar(39) DEFAULT NULL,
  `state` varchar(50) NOT NULL,
  `subState` varchar(50) DEFAULT NULL,
  `high_disponibility` int(10) unsigned NOT NULL,
  `idConversion` int(10) unsigned DEFAULT NULL,
  `idType` int(10) unsigned NOT NULL DEFAULT '0',
  `idUser` int(10) unsigned DEFAULT NULL,
  `idEnterprise` int(10) unsigned DEFAULT NULL,
  `idDatastore` int(10) unsigned DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `network_configuration_id` int(10) unsigned DEFAULT NULL,
  `temporal` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  `keymap` varchar(255) DEFAULT NULL,
  `layer` varchar(256) DEFAULT NULL,
  `coresPerSocket` int(10) unsigned DEFAULT NULL,
  `metadata` text,
  `vdrp_enabled` tinyint(1) NOT NULL,
  `idHardwareProfile` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idVM`),
  KEY `virtualmachine_conversion_FK` (`idConversion`),
  KEY `virtualMachine_datastore_FK` (`idDatastore`),
  KEY `virtualMachine_FK5` (`idEnterprise`),
  KEY `virtualMachine_FK1` (`idHypervisor`),
  KEY `virtualMachine_FK3` (`idImage`),
  KEY `virtualMachine_FK4` (`idUser`),
  KEY `virtualMachine_FK6` (`network_configuration_id`),
  KEY `fk_virtualmachine_hardware_profile` (`idHardwareProfile`),
  CONSTRAINT `fk_virtualmachine_hardware_profile` FOREIGN KEY (`idHardwareProfile`) REFERENCES `hardware_profile` (`id`) ON DELETE CASCADE,
  CONSTRAINT `virtualmachine_conversion_FK` FOREIGN KEY (`idConversion`) REFERENCES `virtualimage_conversions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `virtualMachine_datastore_FK` FOREIGN KEY (`idDatastore`) REFERENCES `datastore` (`idDatastore`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `virtualMachine_FK1` FOREIGN KEY (`idHypervisor`) REFERENCES `hypervisor` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `virtualMachine_FK3` FOREIGN KEY (`idImage`) REFERENCES `virtualimage` (`idImage`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `virtualMachine_FK4` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `virtualMachine_FK5` FOREIGN KEY (`idEnterprise`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `virtualMachine_FK6` FOREIGN KEY (`network_configuration_id`) REFERENCES `network_configuration` (`network_configuration_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualmachine`
--

LOCK TABLES `virtualmachine` WRITE;
/*!40000 ALTER TABLE `virtualmachine` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualmachine` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER create_virtualmachine_update_stats AFTER INSERT ON virtualmachine
    FOR EACH ROW BEGIN
	IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
		INSERT INTO virtualmachinetrackedstate (idVM) VALUES (NEW.idVM);
	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER update_virtualmachine_update_stats AFTER UPDATE ON virtualmachine
    FOR EACH ROW BEGIN
        DECLARE costCodeObj int(4);
		DECLARE previousState VARCHAR(50);
		DECLARE totalHDSizeInBytes BIGINT DEFAULT 0;
		-- For debugging purposes only        
		-- INSERT INTO debug_msg (msg) VALUES (CONCAT('Changing from : ',OLD.state, ' to ', NEW.state));
        IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   
			-- We always store previous state when starting a transaction
			IF NEW.state != OLD.state AND OLD.state != 'LOCKED' THEN
				UPDATE virtualmachinetrackedstate SET previousState=OLD.state WHERE idVM=NEW.idVM;
			END IF;
			--
			SELECT vmts.previousState INTO previousState
				FROM virtualmachinetrackedstate vmts
			WHERE vmts.idVM = NEW.idVM;
			--
			IF  NEW.idType = 1 AND (NEW.state != OLD.state OR 
				(NEW.layer IS NULL AND OLD.layer IS NOT NULL) OR (NEW.layer IS NOT NULL AND OLD.layer IS NULL) OR NEW.layer != OLD.layer) THEN           
				SELECT IFNULL(SUM(limitResource),0) * 1048576 INTO totalHDSizeInBytes 
				FROM rasd_management rm, rasd r 
				WHERE rm.idResource = r.instanceID AND rm.idVM = NEW.idVM AND rm.idResourceType=17;    
				--
				SELECT IF(vi.cost_code IS NULL, 0, vi.cost_code) INTO costCodeObj
				FROM virtualimage vi
				WHERE vi.idImage = NEW.idImage;
				-- Register Accounting Events
				IF EXISTS( SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVMRegisterEvents' ) THEN
			   		 IF EXISTS(SELECT * FROM virtualimage vi WHERE vi.idImage=NEW.idImage) THEN 
					 	CALL kinton_accounting.AccountingVMRegisterEvents(NEW.idVM, NEW.idType, OLD.state, NEW.state, previousState, NEW.ram, NEW.cpu, totalHDSizeInBytes, costCodeObj);
			   		 END IF;              
				END IF;
			END IF;			
      	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER delete_virtualmachine_update_stats AFTER DELETE ON virtualmachine
    FOR EACH ROW BEGIN
	IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN
		DELETE FROM virtualmachinetrackedstate WHERE idVM = OLD.idVM;
	END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `virtualmachinetrackedstate`
--

DROP TABLE IF EXISTS `virtualmachinetrackedstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualmachinetrackedstate` (
  `idVM` int(10) unsigned NOT NULL,
  `previousState` varchar(50) NOT NULL,
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idVM`),
  CONSTRAINT `VirtualMachineTrackedState_FK1` FOREIGN KEY (`idVM`) REFERENCES `virtualmachine` (`idVM`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualmachinetrackedstate`
--

LOCK TABLES `virtualmachinetrackedstate` WRITE;
/*!40000 ALTER TABLE `virtualmachinetrackedstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualmachinetrackedstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vlan_network`
--

DROP TABLE IF EXISTS `vlan_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vlan_network` (
  `vlan_network_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `network_id` int(10) unsigned NOT NULL,
  `network_configuration_id` int(10) unsigned NOT NULL,
  `network_name` varchar(40) NOT NULL,
  `vlan_tag` int(10) unsigned DEFAULT NULL,
  `networktype` varchar(15) NOT NULL DEFAULT 'INTERNAL',
  `version_c` int(11) NOT NULL DEFAULT '1',
  `enterprise_id` int(10) unsigned DEFAULT NULL,
  `network_service_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`vlan_network_id`),
  KEY `vlannetwork_enterprise_FK` (`enterprise_id`),
  KEY `vlannetwork_configuration_FK` (`network_configuration_id`),
  KEY `vlannetwork_network_FK` (`network_id`),
  KEY `vlannetwork_nst_FK` (`network_service_type_id`),
  CONSTRAINT `vlannetwork_nst_FK` FOREIGN KEY (`network_service_type_id`) REFERENCES `network_service_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vlannetwork_configuration_FK` FOREIGN KEY (`network_configuration_id`) REFERENCES `network_configuration` (`network_configuration_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vlannetwork_enterprise_FK` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vlannetwork_network_FK` FOREIGN KEY (`network_id`) REFERENCES `network` (`network_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vlan_network`
--

LOCK TABLES `vlan_network` WRITE;
/*!40000 ALTER TABLE `vlan_network` DISABLE KEYS */;
/*!40000 ALTER TABLE `vlan_network` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER create_vlan_network_update_stats AFTER INSERT ON vlan_network
FOR EACH ROW BEGIN
    DECLARE idVirtualDataCenterObj INTEGER;
    DECLARE idEnterpriseObj INTEGER;
    SELECT vdc.idVirtualDataCenter, e.idEnterprise INTO idVirtualDataCenterObj, idEnterpriseObj
    FROM virtualdatacenter vdc, enterprise e
    WHERE vdc.networktypeID=NEW.network_id
    AND vdc.idEnterprise=e.idEnterprise;
    IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVLANRegisterEvents' ) THEN
    	IF  NEW.networktype IN ('INTERNAL') THEN
			CALL kinton_accounting.AccountingVLANRegisterEvents('CREATE_VLAN',NEW.vlan_network_id, NEW.network_name, idVirtualDataCenterObj, idEnterpriseObj);
		END IF;
    END IF;    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER delete_vlan_network_update_stats AFTER DELETE ON vlan_network
	FOR EACH ROW
	BEGIN
		DECLARE idVirtualDataCenterObj INTEGER;
		DECLARE idEnterpriseObj INTEGER;
		IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN   
		        -- Accounting event registered ONLY for VLAN deletion as a standalone operation
		        SELECT vdc.idVirtualDataCenter, e.idEnterprise INTO idVirtualDataCenterObj, idEnterpriseObj
		        FROM virtualdatacenter vdc, enterprise e
		        WHERE vdc.networktypeID=OLD.network_id
		        AND vdc.idEnterprise=e.idEnterprise;
		        IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingVLANRegisterEvents' ) THEN		        	
		            CALL kinton_accounting.AccountingVLANRegisterEvents('DELETE_VLAN',OLD.vlan_network_id, OLD.network_name, idVirtualDataCenterObj, idEnterpriseObj);
		        END IF;
		    END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vlan_network_assignment`
--

DROP TABLE IF EXISTS `vlan_network_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vlan_network_assignment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vlan_network_id` int(10) unsigned NOT NULL,
  `idRack` int(10) unsigned NOT NULL,
  `idVirtualDataCenter` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `vlan_network_assignment_idRack_FK` (`idRack`),
  KEY `vlan_network_assignment_idVirtualDataCenter_FK` (`idVirtualDataCenter`),
  KEY `vlan_network_assignment_networkid_FK` (`vlan_network_id`),
  CONSTRAINT `vlan_network_assignment_networkid_FK` FOREIGN KEY (`vlan_network_id`) REFERENCES `vlan_network` (`vlan_network_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `vlan_network_assignment_idRack_FK` FOREIGN KEY (`idRack`) REFERENCES `rack` (`idRack`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `vlan_network_assignment_idVirtualDataCenter_FK` FOREIGN KEY (`idVirtualDataCenter`) REFERENCES `virtualdatacenter` (`idVirtualDataCenter`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vlan_network_assignment`
--

LOCK TABLES `vlan_network_assignment` WRITE;
/*!40000 ALTER TABLE `vlan_network_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vlan_network_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vlans_dhcpOption`
--

DROP TABLE IF EXISTS `vlans_dhcpOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vlans_dhcpOption` (
  `idVlan` int(10) unsigned NOT NULL,
  `idDhcpOption` int(10) unsigned NOT NULL,
  `version_c` int(11) DEFAULT '0',
  KEY `fk_vlans_dhcp_dhcp` (`idDhcpOption`),
  KEY `fk_vlans_dhcp_vlan` (`idVlan`),
  CONSTRAINT `fk_vlans_dhcp_vlan` FOREIGN KEY (`idVlan`) REFERENCES `vlan_network` (`vlan_network_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vlans_dhcp_dhcp` FOREIGN KEY (`idDhcpOption`) REFERENCES `dhcpOption` (`idDhcpOption`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vlans_dhcpOption`
--

LOCK TABLES `vlans_dhcpOption` WRITE;
/*!40000 ALTER TABLE `vlans_dhcpOption` DISABLE KEYS */;
/*!40000 ALTER TABLE `vlans_dhcpOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_management`
--

DROP TABLE IF EXISTS `volume_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_management` (
  `idManagement` int(10) unsigned NOT NULL,
  `usedSize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL,
  `idStorage` varchar(40) NOT NULL,
  `idImage` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  KEY `volumemanagement_FK3` (`idImage`),
  KEY `idManagement_FK` (`idManagement`),
  KEY `idStorage_FK` (`idStorage`),
  CONSTRAINT `idManagement_FK` FOREIGN KEY (`idManagement`) REFERENCES `rasd_management` (`idManagement`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `idStorage_FK` FOREIGN KEY (`idStorage`) REFERENCES `storage_pool` (`idStorage`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `volumemanagement_FK3` FOREIGN KEY (`idImage`) REFERENCES `virtualimage` (`idImage`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_management`
--

LOCK TABLES `volume_management` WRITE;
/*!40000 ALTER TABLE `volume_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_management` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER create_volume_management_update_stats AFTER INSERT ON volume_management
    FOR EACH ROW BEGIN
        DECLARE idVirtualDataCenterObj INTEGER;
        DECLARE idThisEnterprise INTEGER;
        DECLARE limitResourceObj BIGINT;
        DECLARE idResourceObj VARCHAR(50);
        DECLARE idResourceTypeObj VARCHAR(5);
        DECLARE idStorageTier INTEGER;
        DECLARE resourceName VARCHAR(255);
        DECLARE temporal INTEGER;

        SELECT vdc.idEnterprise, vdc.idVirtualDataCenter, rm.temporal INTO idThisEnterprise, idVirtualDataCenterObj, temporal
        FROM virtualdatacenter vdc, rasd_management rm
        WHERE vdc.idVirtualDataCenter = rm.idVirtualDataCenter
        AND NEW.idManagement = rm.idManagement;
        --
        IF temporal IS NULL THEN 
            SELECT r.elementName, r.limitResource, rm.idResource, rm.idResourceType INTO resourceName, limitResourceObj, idResourceObj, idResourceTypeObj
            FROM rasd r, rasd_management rm
            WHERE r.instanceID = rm.idResource
            AND NEW.idManagement = rm.idManagement;
            --
            SELECT sp.idTier INTO idStorageTier
            FROM storage_pool sp
            WHERE sp.idStorage = NEW.idStorage;
            IF (@DISABLE_STATS_TRIGGERS IS NULL) THEN           
                IF idResourceTypeObj='8' THEN 
                    IF EXISTS( SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='AccountingStorageRegisterEvents' ) THEN
                        CALL kinton_accounting.AccountingStorageRegisterEvents('CREATE_STORAGE', idResourceObj, resourceName, idStorageTier, idVirtualDataCenterObj, idThisEnterprise, limitResourceObj);
                    END IF;               
                END IF;
            END IF;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `workload_enterprise_exclusion_rule`
--

DROP TABLE IF EXISTS `workload_enterprise_exclusion_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workload_enterprise_exclusion_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEnterprise1` int(10) unsigned NOT NULL,
  `idEnterprise2` int(10) unsigned NOT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_eerule_enterprise_1` (`idEnterprise1`),
  KEY `FK_eerule_enterprise_2` (`idEnterprise2`),
  CONSTRAINT `FK_eerule_enterprise_2` FOREIGN KEY (`idEnterprise2`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_eerule_enterprise_1` FOREIGN KEY (`idEnterprise1`) REFERENCES `enterprise` (`idEnterprise`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workload_enterprise_exclusion_rule`
--

LOCK TABLES `workload_enterprise_exclusion_rule` WRITE;
/*!40000 ALTER TABLE `workload_enterprise_exclusion_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `workload_enterprise_exclusion_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workload_fit_policy_rule`
--

DROP TABLE IF EXISTS `workload_fit_policy_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workload_fit_policy_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fitPolicy` varchar(20) NOT NULL,
  `idDatacenter` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_fprule_datacenter` (`idDatacenter`),
  CONSTRAINT `FK_fprule_datacenter` FOREIGN KEY (`idDatacenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workload_fit_policy_rule`
--

LOCK TABLES `workload_fit_policy_rule` WRITE;
/*!40000 ALTER TABLE `workload_fit_policy_rule` DISABLE KEYS */;
INSERT INTO `workload_fit_policy_rule` VALUES (1,'PROGRESSIVE',NULL,1);
/*!40000 ALTER TABLE `workload_fit_policy_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workload_machine_load_rule`
--

DROP TABLE IF EXISTS `workload_machine_load_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workload_machine_load_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ramLoadPercentage` int(10) unsigned NOT NULL,
  `cpuLoadPercentage` int(10) unsigned NOT NULL,
  `idDatacenter` int(10) unsigned DEFAULT NULL,
  `idRack` int(10) unsigned DEFAULT NULL,
  `idMachine` int(10) unsigned DEFAULT NULL,
  `version_c` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_mlrule_datacenter` (`idDatacenter`),
  KEY `FK_mlrule_machine` (`idMachine`),
  KEY `FK_mlrule_rack` (`idRack`),
  CONSTRAINT `FK_mlrule_rack` FOREIGN KEY (`idRack`) REFERENCES `rack` (`idRack`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mlrule_datacenter` FOREIGN KEY (`idDatacenter`) REFERENCES `datacenter` (`idDataCenter`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mlrule_machine` FOREIGN KEY (`idMachine`) REFERENCES `physicalmachine` (`idPhysicalMachine`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workload_machine_load_rule`
--

LOCK TABLES `workload_machine_load_rule` WRITE;
/*!40000 ALTER TABLE `workload_machine_load_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `workload_machine_load_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'kinton'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_version_column_to_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `add_version_column_to_all`()
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ArchiveMeteringData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `ArchiveMeteringData`(daysOldToArchive INT)
BEGIN
    ##########################################################################################
    #
    # ArchiveMeteringData
    # Procedure used to archive data in the metering table.   Data older than the supplied
    # number of days is automatically moved from the 'metering' table into the
    # 'metering_archive' table.
    #
    ##########################################################################################
    DECLARE archive_ts TIMESTAMP;

    SELECT TIMESTAMPADD(DAY,-daysOldToArchive, CURRENT_DATE()) INTO archive_ts;

    # Copy data into the archive table
    INSERT INTO metering_archive
        SELECT *
        FROM
            metering
        WHERE
            timestamp < archive_ts;

    # And then remove it from the current table...
    DELETE FROM metering
        WHERE
            timestamp < archive_ts;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteOldRegisteredEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `DeleteOldRegisteredEvents`(    
IN hours INT(2) UNSIGNED)
BEGIN   
    DECLARE sp_param_enabled INT(1);
    DECLARE param_hours INT(8);

	IF EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='accounting_parameters') THEN
        
        SELECT paramValue INTO sp_param_enabled FROM kinton_accounting.accounting_parameters WHERE paramName='DeleteRegEventsUseSPParam';
        SELECT paramValue INTO param_hours FROM kinton_accounting.accounting_parameters WHERE paramName='DeleteRegEventsDeleteHours';
    ELSE
        
        SELECT 1 INTO sp_param_enabled;
    END IF;

    IF (sp_param_enabled = 0) THEN
        
        SELECT param_hours INTO hours;
    END IF;

    DELETE FROM kinton_accounting.accounting_event_vm  WHERE stopTime < date_sub(NOW(), INTERVAL hours HOUR);
    DELETE FROM kinton_accounting.accounting_event_storage  WHERE stopTime < date_sub(NOW(), INTERVAL hours HOUR);
    DELETE FROM kinton_accounting.accounting_event_ips  WHERE stopTime < date_sub(NOW(), INTERVAL hours HOUR);
    DELETE FROM kinton_accounting.accounting_event_vlan  WHERE stopTime < date_sub(NOW(), INTERVAL hours HOUR);
    DELETE FROM kinton_accounting.accounting_event_pm  WHERE stopTime < date_sub(NOW(), INTERVAL hours HOUR);
    DELETE FROM kinton_accounting.accounting_event_repository  WHERE stopTime < date_sub(NOW(), INTERVAL hours HOUR);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_datastore_size_by_dc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `get_datastore_size_by_dc`(IN idDC INT, OUT size BIGINT UNSIGNED)
BEGIN
    SELECT IF (SUM(ds_view.size) IS NULL,0,SUM(ds_view.size)) INTO size
    FROM (SELECT d.size as size FROM datastore d LEFT OUTER JOIN datastore_assignment da ON d.idDatastore = da.idDatastore 
    LEFT OUTER JOIN physicalmachine pm ON da.idPhysicalMachine = pm.idPhysicalMachine
    WHERE pm.idDataCenter = idDC AND d.enabled = 1 GROUP BY d.datastoreUuid) ds_view;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_datastore_used_size_by_dc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `get_datastore_used_size_by_dc`(IN idDC INT, OUT usedSize BIGINT UNSIGNED)
BEGIN
    SELECT IF (SUM(ds_view.usedSize) IS NULL,0,SUM(ds_view.usedSize)) INTO usedSize
    FROM (SELECT d.usedSize as usedSize FROM datastore d LEFT OUTER JOIN datastore_assignment da ON d.idDatastore = da.idDatastore
    LEFT OUTER JOIN physicalmachine pm ON da.idPhysicalMachine = pm.idPhysicalMachine
    WHERE pm.idDataCenter = idDC AND d.enabled = 1 GROUP BY d.datastoreUuid) ds_view;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migrate_used_resources` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `migrate_used_resources`()
BEGIN		
	DECLARE idPhysicalMachineObj INTEGER;
	DECLARE idDatastoreObj INTEGER;
	DECLARE cpuUsedObj INTEGER;
	DECLARE ramUsedObj INTEGER;
	DECLARE usedSizeObj BIGINT;
	DECLARE no_more_ds INTEGER;
	-- 
	DECLARE curDS CURSOR FOR SELECT pm.idPhysicalMachine, ds.idDatastore, pm.cpuUsed, pm.ramUsed, ds.usedSize from physicalmachine pm, datastore ds, datastore_assignment dsa where ds.idDatastore = dsa.idDatastore and pm.idPhysicalMachine = dsa.idPhysicalMachine;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_ds=1;	 -- Shouldn't this be = 0?
	SET no_more_ds=0;
	OPEN curDS;
	SELECT "Migrating scheduled resources..." as " ";
	dept_loop:WHILE(no_more_ds=0) DO
		FETCH curDS INTO idPhysicalMachineObj ,idDatastoreObj, cpuUsedObj, ramUsedObj, usedSizeObj;
	     IF no_more_ds=1 THEN
	     	LEAVE dept_loop;
	     END IF;	     
	     SELECT CONCAT("Migrating resources usage data from Machine ", idPhysicalMachineObj, " and Datastore ", idDatastoreObj, "...") as " ";	     
	     INSERT INTO scheduled_resources (idPhysicalMachine ,idDatastore, cpuUsed, ramUsed, datastoreUsed) VALUES (idPhysicalMachineObj ,idDatastoreObj, cpuUsedObj, ramUsedObj, usedSizeObj);
	   END WHILE dept_loop;	   
  	CLOSE curDS;      
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `primaryDisk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `primaryDisk`()
BEGIN    
  DECLARE done INT DEFAULT FALSE;
  DECLARE idVM, idResourceType,idVdc,idVapp, numSeq, idImage, limitResource  INT;
  DECLARE idResource VARCHAR(50);
  DECLARE cur1 CURSOR FOR 
    SELECT v.idVm, vapp.idVirtualDataCenter, vapp.idVirtualApp, nvi.idImage, vi.hd_required >> 20 as limitResource
        FROM kinton.nodevirtualimage nvi, kinton.virtualmachine v, kinton.virtualimage vi, kinton.node n, kinton.virtualapp vapp
        WHERE nvi.idNode IS NOT NULL
        AND v.idVM = nvi.idVM
        AND n.idNode = nvi.idNode
        AND nvi.idImage = vi.idImage
        AND n.idVirtualApp = vapp.idVirtualApp
        and v.idType = 1;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
  /* Set null sequence all vol/hd with vm = null */  
  
  UPDATE kinton.rasd_management SET sequence = NULL WHERE idVM IS NULL AND idResourceType IN (8, 17);
 
  /***********************************************/
 
  SET idResourceType = 17;
  SET numSeq = 0;
  
  OPEN cur1;  
 
  read_loop: LOOP
    FETCH cur1 INTO idVM, idVdc, idVapp, idImage, limitResource;
    SET idResource = concat('delta-26-addedPrimaryDiskForVM-',idVM,'-',idImage);
    IF done THEN
      LEAVE read_loop;
    END IF;
 
      /* Increment sequence of all hd from VM=idVM */  
      
      UPDATE kinton.rasd_management AS rm SET rm.sequence = rm.sequence + 1 WHERE rm.idVM = idVM AND rm.idResourceType = 17;
 
      /***********************************************/
 
      /* Increment sequence of  volumes with ''idImage'' == null 
        (non persistent volumes -> persistent volumes should have sequence 0 (this is fine!))*/
      
      UPDATE kinton.rasd_management rm, kinton.volume_management volm
        SET rm.sequence = rm.sequence + 1
        WHERE rm.idManagement = volm.idManagement
        AND rm.idVM = idVM
        AND rm.idResourceType = 8
        AND volm.idImage IS NULL;
 
      /***********************************************/
 
      /* Creating Primary Disk if vm is not persistent*/  
 
        IF ((SELECT COUNT(*) FROM kinton.rasd_management rm, kinton.volume_management volm
        WHERE rm.idManagement = volm.idManagement
        AND rm.idVM = idVM
        AND rm.idResourceType = 8
        AND volm.idImage IS NOT NULL) = 0) THEN
            INSERT INTO kinton.rasd (allocationUnits, automaticAllocation, automaticDeallocation, elementName, instanceID, limitResource, resourceType, version_c) 
                VALUES ('MegaBytes', 0, 0, 'Disk Device', idResource, limitResource, idResourceType, numSeq);
            INSERT INTO kinton.rasd_management (idResourceType, idVirtualDataCenter, idVirtualApp, idVM, idResource, version_c, sequence) 
                VALUES (idResourceType, idVdc, idVapp, idVM, idResource, 1, numSeq);
            INSERT INTO kinton.disk_management (idManagement, version_c)
                VALUES (LAST_INSERT_ID(), 0);
        END IF;
  END LOOP;
 
  CLOSE cur1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateAccounting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `UpdateAccounting`()
BEGIN
    DECLARE accounting_enabled INT(1);
    DECLARE maxPeriodsToProcess INT(6);
    DECLARE maxPeriodsToInit INT(6);
    DECLARE currentAccountingPeriod TIMESTAMP;
    DECLARE nextAccountingPeriod TIMESTAMP;
    DECLARE accountingPeriodSize VARCHAR(10);
    DECLARE accountingPeriodGranularity VARCHAR(10);
    DECLARE periodCount INT(6);
    DECLARE logLevelStr VARCHAR(10);

	IF EXISTS (SELECT * FROM information_schema.columns WHERE table_schema= 'kinton_accounting' AND table_name='accounting_parameters') THEN
        SELECT kinton_accounting.LOAD_CURRENT_LOG_LEVEL() INTO logLevelStr;

        
        SELECT kinton_accounting.ABQ_GET_PARAMETER('AccountingEnabled') INTO accounting_enabled;
        IF (accounting_enabled IS NULL)  THEN
            CALL kinton_accounting.Log(logLevelStr, 'WARN', NULL, 'Missing AccountingEnabled parameter, accounting will be disabled.');
            SET accounting_enabled=0;
        END IF;
        
        SELECT kinton_accounting.ABQ_GET_PARAMETER('MaximumPeriodsToProcess') INTO maxPeriodsToProcess;
        IF (maxPeriodsToProcess IS NULL) OR (maxPeriodsToProcess < 1) OR (maxPeriodsToProcess > 720) THEN
            
            CALL kinton_accounting.Log(logLevelStr, 'WARN', NULL, CONCAT('Bad value ', QUOTE(maxPeriodsToProcess),' detected for MaximumPeriodsToProcess parameter, will use default of 24.'));
            SET maxPeriodsToProcess=24;
        END IF;

        SELECT kinton_accounting.ABQ_GET_PARAMETER('MaximumPeriodsToFirstInit') INTO maxPeriodsToInit;
        IF (maxPeriodsToInit IS NULL) OR (maxPeriodsToInit < 1) OR (maxPeriodsToInit > 720) THEN
            
            CALL kinton_accounting.Log(logLevelStr, 'WARN', NULL, CONCAT('Bad value ', QUOTE(maxPeriodsToInit),' detected for MaximumPeriodsToFirstInit parameter, will use default of 1.'));
            SET maxPeriodsToInit=1;
        END IF;

        SELECT UPPER(kinton_accounting.ABQ_GET_PARAMETER('AccountPeriodSize')) INTO accountingPeriodSize;
        IF (accountingPeriodSize IS NULL) OR
            ((accountingPeriodSize <> 'HOUR') AND (accountingPeriodSize <> 'DAY') AND (accountingPeriodSize <> 'WEEK') AND (accountingPeriodSize <> 'MONTH')) THEN
            
            CALL kinton_accounting.Log(logLevelStr, 'WARN', NULL, CONCAT('Bad value ', QUOTE(accountingPeriodSize),' detected for AccountPeriodSize parameter, will use default of HOUR.'));
            SET accountingPeriodSize='HOUR';
        END IF;

        SELECT UPPER(kinton_accounting.ABQ_GET_PARAMETER('AccountPeriodGranularity')) INTO accountingPeriodGranularity;
        IF (accountingPeriodGranularity IS NULL) OR
            ((accountingPeriodGranularity <> 'HOUR') AND (accountingPeriodGranularity <> 'DAY') AND 
             (accountingPeriodGranularity <> 'WEEK') AND (accountingPeriodGranularity <> 'MONTH')) THEN
            
            CALL kinton_accounting.Log(logLevelStr, 'WARN', NULL, CONCAT('Bad value ', QUOTE(accountingPeriodGranularity),' detected for AccountPeriodGranularity parameter, will use default of HOUR.'));
            SET accountingPeriodGranularity='HOUR';
        END IF;

        
        IF ((accountingPeriodSize='HOUR') AND ((accountingPeriodGranularity='DAY') OR (accountingPeriodGranularity='WEEK') OR (accountingPeriodGranularity='MONTH')) OR
            (accountingPeriodSize='DAY') AND ((accountingPeriodGranularity='WEEK') OR (accountingPeriodGranularity='MONTH')) OR
            (accountingPeriodSize='WEEK') AND (accountingPeriodGranularity='MONTH') OR
            (accountingPeriodSize='MONTH') AND (accountingPeriodGranularity='WEEK'))
        THEN
            
            CALL kinton_accounting.Log(logLevelStr, 'WARN', NULL, CONCAT('Granularity ', QUOTE(accountingPeriodGranularity),' is not compatible with account period ', QUOTE(accountingPeriodSize),', so resetting the Granularity to ', QUOTE(accountingPeriodSize)));
            SET accountingPeriodGranularity=accountingPeriodSize;
        END IF;

        
    ELSE
        
        SELECT 0 INTO accounting_enabled;
    END IF;

    IF (accounting_enabled <> 0) THEN
        SET periodCount=0;

        
        SELECT MAX(endTime) INTO nextAccountingPeriod FROM kinton_accounting.accounting_event_detail;
        IF (nextAccountingPeriod IS NULL) THEN
            
            
            
            SELECT TIMESTAMP(CURDATE()) INTO currentAccountingPeriod;
            SELECT  CASE accountingPeriodSize
                        WHEN 'HOUR' THEN TIMESTAMPADD(HOUR, HOUR(NOW()), currentAccountingPeriod)
                        WHEN 'DAY' THEN currentAccountingPeriod 
                        WHEN 'WEEK' THEN TIMESTAMPADD(DAY, -(DAYOFWEEK(NOW())-1), currentAccountingPeriod) 
                        WHEN 'MONTH' THEN TIMESTAMPADD(DAY, -(DAYOFMONTH(NOW())-1), currentAccountingPeriod) 
                    END
                    INTO currentAccountingPeriod;            

            SELECT  CASE accountingPeriodSize
                        WHEN 'HOUR' THEN TIMESTAMPADD(HOUR, -maxPeriodsToInit, currentAccountingPeriod)
                        WHEN 'DAY' THEN TIMESTAMPADD(DAY, -maxPeriodsToInit, currentAccountingPeriod)
                        WHEN 'WEEK' THEN TIMESTAMPADD(WEEK, -maxPeriodsToInit, currentAccountingPeriod) 
                        WHEN 'MONTH' THEN TIMESTAMPADD(MONTH, -maxPeriodsToInit, currentAccountingPeriod) 
                    END
                    INTO nextAccountingPeriod;

            CALL kinton_accounting.Log( logLevelStr, 'INFO', NULL,
                                        CONCAT('Accounting table is empty, will start accounting data from ', QUOTE(nextAccountingPeriod)));        
        END IF;

        WHILE ((periodCount < maxPeriodsToProcess) AND (nextAccountingPeriod < NOW())) DO 

            
            CALL kinton_accounting.GenerateAccountingPeriodDataExt(
                        nextAccountingPeriod,       
                        accountingPeriodSize,       
                        accountingPeriodGranularity 
                        );
            

            
            SELECT  CASE accountingPeriodSize
                        WHEN 'HOUR' THEN TIMESTAMPADD(HOUR, 1, nextAccountingPeriod)
                        WHEN 'DAY' THEN TIMESTAMPADD(DAY, 1, nextAccountingPeriod) 
                        WHEN 'WEEK' THEN TIMESTAMPADD(WEEK, 1, nextAccountingPeriod) 
                        WHEN 'MONTH' THEN TIMESTAMPADD(MONTH, 1, nextAccountingPeriod) 
                    END
                    INTO nextAccountingPeriod;

            SET periodCount = periodCount+1;
        END WHILE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `CLOUD_STAT_DC_LIST`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_DC_LIST`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_LIST`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_DC_LIST` AS select `datacenter`.`idDataCenter` AS `idDataCenter`,`datacenter`.`uuid` AS `uuid`,`datacenter`.`name` AS `name`,`datacenter`.`situation` AS `situation`,`datacenter`.`network_id` AS `network_id`,`datacenter`.`version_c` AS `version_c` from `datacenter` union (select 0 AS `0`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_DC_PUBLIC_IP_STATS`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_DC_PUBLIC_IP_STATS`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_PUBLIC_IP_STATS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_DC_PUBLIC_IP_STATS` AS select `dc`.`idDataCenter` AS `idDataCenter`,if(isnull(count(0)),0,count(0)) AS `publicIPsTotal`,sum(if((`ipm`.`mac` is not null),1,0)) AS `publicIPsReserved`,sum(if(((`ipm`.`mac` is not null) and (`rm`.`idVM` is not null)),1,0)) AS `publicIPsUsed` from ((((`ip_pool_management` `ipm` join `network_configuration` `nc`) join `vlan_network` `vn`) join (`datacenter` `dc` left join `public_datacenter` `pdc` on((`pdc`.`idDatacenter` <> 0)))) join `rasd_management` `rm`) where ((`ipm`.`vlan_network_id` = `vn`.`vlan_network_id`) and (`vn`.`network_configuration_id` = `nc`.`network_configuration_id`) and (`vn`.`network_id` = `dc`.`network_id`) and ((`vn`.`networktype` = 'PUBLIC') or ((`dc`.`idDataCenter` = `pdc`.`idDatacenter`) and (`vn`.`networktype` = 'UNMANAGED'))) and (`rm`.`idManagement` = `ipm`.`idManagement`)) group by `dc`.`idDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_DC_SERVER_STATS`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_DC_SERVER_STATS`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_SERVER_STATS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_DC_SERVER_STATS` AS select `pm`.`idDataCenter` AS `idDatacenter`,sum(if((`pm`.`idState` <> 2),1,0)) AS `serversTotal`,sum(if((`pm`.`idState` = 3),1,0)) AS `serversRunning`,if((`pm`.`idState` = 3),sum(`pm`.`cpu`),0) AS `vCpuTotal`,if((`pm`.`idState` = 3),sum(`pm`.`ram`),0) AS `vMemoryTotal` from `physicalmachine` `pm` group by `pm`.`idDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_DC_STOARGE`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_DC_STOARGE`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_STOARGE`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_DC_STOARGE` AS select `uuidgrp`.`idDataCenter` AS `idDataCenter`,if(isnull(sum(`uuidgrp`.`size`)),0,sum(`uuidgrp`.`size`)) AS `vStorageTotal` from `CLOUD_STAT_DC_STOARGE_INNER` `uuidgrp` group by `uuidgrp`.`idDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_DC_STOARGE_INNER`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_DC_STOARGE_INNER`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_STOARGE_INNER`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_DC_STOARGE_INNER` AS select `pm`.`idDataCenter` AS `idDataCenter`,`d`.`datastoreUuid` AS `datastoreUuid`,`d`.`size` AS `size`,`sr`.`datastoreUsed` AS `datastoreUsed` from ((`datastore` `d` left join `scheduled_resources` `sr` on((`d`.`idDatastore` = `sr`.`idDatastore`))) left join `physicalmachine` `pm` on((`sr`.`idPhysicalMachine` = `pm`.`idPhysicalMachine`))) where (`d`.`enabled` = 1) group by `d`.`datastoreUuid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_DC_STORAGE_TOTAL`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_DC_STORAGE_TOTAL`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_STORAGE_TOTAL`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_DC_STORAGE_TOTAL` AS select `vdc`.`idDataCenter` AS `idDataCenter`,if(isnull(sum(`r`.`limitResource`)),0,sum(`r`.`limitResource`)) AS `storageTotal` from ((`rasd` `r` join `rasd_management` `rm`) join `virtualdatacenter` `vdc`) where ((`rm`.`idResource` = `r`.`instanceID`) and (`vdc`.`idVirtualDataCenter` = `rm`.`idVirtualDataCenter`) and (`rm`.`idResourceType` = 8)) group by `vdc`.`idDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_DC_STORAGE_USED`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_DC_STORAGE_USED`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_STORAGE_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_DC_STORAGE_USED` AS select `sd`.`idDataCenter` AS `idDataCenter`,if(isnull(sum(`r`.`limitResource`)),0,sum(`r`.`limitResource`)) AS `storageUsed` from ((((`storage_pool` `sp` join `storage_device` `sd`) join `volume_management` `vm`) join `rasd_management` `rm`) join `rasd` `r`) where ((`vm`.`idStorage` = `sp`.`idStorage`) and (`sp`.`idStorageDevice` = `sd`.`id`) and (`vm`.`idManagement` = `rm`.`idManagement`) and (`r`.`instanceID` = `rm`.`idResource`) and (`rm`.`idResourceType` = 8) and (`vm`.`state` = 1)) group by `sd`.`idDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_DC_VLAN_RES`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_DC_VLAN_RES`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_VLAN_RES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_DC_VLAN_RES` AS select `enterprise_limits_by_datacenter`.`idDataCenter` AS `idDataCenter`,if(isnull(sum(`enterprise_limits_by_datacenter`.`vlanHard`)),0,sum(`enterprise_limits_by_datacenter`.`vlanHard`)) AS `vlanReserved` from `enterprise_limits_by_datacenter` where (`enterprise_limits_by_datacenter`.`idEnterprise` is not null) group by `enterprise_limits_by_datacenter`.`idDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_DC_VM_STATS`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_DC_VM_STATS`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_DC_VM_STATS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_DC_VM_STATS` AS select `vdc`.`idDataCenter` AS `idDataCenter`,sum(if((`v`.`state` = 'ON'),1,0)) AS `vMachinesRunning`,sum(if(((`v`.`state` <> 'NOT_ALLOCATED') and (`v`.`state` <> 'UNKNOWN')),1,0)) AS `vMachinesTotal`,sum(if((`v`.`state` in ('ON','OFF','PAUSED')),`v`.`cpu`,0)) AS `vCpuUsed`,sum(if((`v`.`state` in ('ON','OFF','PAUSED')),`v`.`ram`,0)) AS `vMemoryUsed` from ((((`nodevirtualimage` `nvi` join `virtualmachine` `v`) join `node` `n`) join `virtualapp` `vapp`) join `virtualdatacenter` `vdc`) where ((`v`.`idVM` = `nvi`.`idVM`) and (`n`.`idNode` = `nvi`.`idNode`) and (`vapp`.`idVirtualApp` = `n`.`idVirtualApp`) and (`vdc`.`idVirtualDataCenter` = `vapp`.`idVirtualDataCenter`)) group by `vdc`.`idDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_ENT_COUNT`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_ENT_COUNT`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_ENT_COUNT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_ENT_COUNT` AS select 0 AS `idDataCenter`,if(isnull(count(0)),0,count(0)) AS `numEnterprisesCreated` from `enterprise` `e` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_EXTRA_HD_USED`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_EXTRA_HD_USED`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_EXTRA_HD_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_EXTRA_HD_USED` AS select `pm`.`idDataCenter` AS `idDatacenter`,(ifnull(sum(`r`.`limitResource`),0) * 1048576) AS `extraHDUsed` from ((((`rasd_management` `rm` join `rasd` `r`) join `virtualmachine` `vm`) join `hypervisor` `h`) join `physicalmachine` `pm`) where ((`rm`.`idResource` = `r`.`instanceID`) and (`rm`.`idVM` = `vm`.`idVM`) and (`rm`.`idResourceType` = 17) and (`vm`.`idHypervisor` = `h`.`id`) and (`h`.`idPhysicalMachine` = `pm`.`idPhysicalMachine`) and (`vm`.`state` in ('ON','OFF','PAUSED'))) group by `pm`.`idDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_RESERVED`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_RESERVED`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_RESERVED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_RESERVED` AS select 0 AS `idDataCenter`,if(isnull(sum(`e`.`cpuHard`)),0,sum(`e`.`cpuHard`)) AS `vCpuReserved`,if(isnull(sum(`e`.`ramHard`)),0,sum(`e`.`ramHard`)) AS `vMemoryReserved`,if(isnull(sum(`e`.`hdHard`)),0,sum(`e`.`hdHard`)) AS `vStorageReserved`,if(isnull(sum(`e`.`storageHard`)),0,sum(`e`.`storageHard`)) AS `storageReserved`,if(isnull(sum(`e`.`repositoryHard`)),0,sum(`e`.`repositoryHard`)) AS `repositoryReserved` from `enterprise` `e` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_SERV_WKLOAD_TOTALS`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_SERV_WKLOAD_TOTALS`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_SERV_WKLOAD_TOTALS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_SERV_WKLOAD_TOTALS` AS select `mm`.`idDataCenter` AS `idDatacenter`,sum((`mm`.`cpu` * coalesce((`mchRules`.`cpuLoadPercentage` / 100),1))) AS `vCPUTotal`,sum((`mm`.`ram` * coalesce((`mchRules`.`ramLoadPercentage` / 100),1))) AS `vMemoryTotal` from (`physicalmachine` `mm` left join `CLOUD_STAT_SERV_WKLOAD_TOTALS_INNER` `mchRules` on((`mm`.`idPhysicalMachine` = `mchRules`.`idPhysicalMachine`))) group by `mm`.`idDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_SERV_WKLOAD_TOTALS_INNER`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_SERV_WKLOAD_TOTALS_INNER`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_SERV_WKLOAD_TOTALS_INNER`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_SERV_WKLOAD_TOTALS_INNER` AS select `m`.`idDataCenter` AS `idDatacenter`,`m`.`idPhysicalMachine` AS `idPhysicalMachine`,`l`.`id` AS `load_rule`,`m`.`cpu` AS `cpu`,`m`.`ram` AS `ram`,`l`.`cpuLoadPercentage` AS `cpuLoadPercentage`,`l`.`ramLoadPercentage` AS `ramLoadPercentage` from (`physicalmachine` `m` join `workload_machine_load_rule` `l` on((`m`.`idPhysicalMachine` = `l`.`idMachine`))) union all select `m`.`idDataCenter` AS `idDatacenter`,`m`.`idPhysicalMachine` AS `idPhysicalMachine`,`l`.`id` AS `id`,`m`.`cpu` AS `cpu`,`m`.`ram` AS `ram`,`l`.`cpuLoadPercentage` AS `cpuLoadPercentage`,`l`.`ramLoadPercentage` AS `ramLoadPercentage` from ((`rack` `r` join `workload_machine_load_rule` `l` on(((`r`.`idRack` = `l`.`idRack`) and isnull(`l`.`idMachine`)))) join `physicalmachine` `m` on((`r`.`idRack` = `m`.`idRack`))) where (not(`m`.`idPhysicalMachine` in (select `ll`.`idMachine` from `workload_machine_load_rule` `ll` where (`ll`.`idMachine` is not null)))) union all select `m`.`idDataCenter` AS `idDatacenter`,`m`.`idPhysicalMachine` AS `idPhysicalMachine`,`l`.`id` AS `id`,`m`.`cpu` AS `cpu`,`m`.`ram` AS `ram`,`l`.`cpuLoadPercentage` AS `cpuLoadPercentage`,`l`.`ramLoadPercentage` AS `ramLoadPercentage` from ((`datacenter` `d` join `workload_machine_load_rule` `l` on(((`d`.`idDataCenter` = `l`.`idDatacenter`) and isnull(`l`.`idMachine`) and isnull(`l`.`idRack`)))) join `physicalmachine` `m` on((`d`.`idDataCenter` = `m`.`idDataCenter`))) where ((not(`m`.`idPhysicalMachine` in (select `ll`.`idMachine` from `workload_machine_load_rule` `ll` where (`ll`.`idMachine` is not null)))) and (not(`m`.`idRack` in (select `ll`.`idRack` from `workload_machine_load_rule` `ll` where (`ll`.`idRack` is not null))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_USER_COUNT`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_USER_COUNT`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_USER_COUNT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_USER_COUNT` AS select 0 AS `idDataCenter`,if(isnull(count(0)),0,count(0)) AS `numUsersCreated` from `user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_VDC_COUNT`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_VDC_COUNT`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_VDC_COUNT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_VDC_COUNT` AS select 0 AS `idDataCenter`,if(isnull(count(0)),0,count(0)) AS `numVDCCreated` from `virtualdatacenter` `vdc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CLOUD_STAT_VLAN_USAGE`
--

/*!50001 DROP TABLE IF EXISTS `CLOUD_STAT_VLAN_USAGE`*/;
/*!50001 DROP VIEW IF EXISTS `CLOUD_STAT_VLAN_USAGE`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `CLOUD_STAT_VLAN_USAGE` AS select 0 AS `idDataCenter`,if(isnull(count(0)),0,count(0)) AS `vlanUsed` from `vlan_network` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DC_STAT_REPO_USED`
--

/*!50001 DROP TABLE IF EXISTS `DC_STAT_REPO_USED`*/;
/*!50001 DROP VIEW IF EXISTS `DC_STAT_REPO_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `DC_STAT_REPO_USED` AS select `r`.`idDataCenter` AS `idDataCenter`,sum(`vi`.`diskFileSize`) AS `repositoryUsed` from (`virtualimage` `vi` join `repository` `r` on((`r`.`idRepository` = `vi`.`idRepository`))) where ((`vi`.`available` = 1) and (`vi`.`stateful` = 0)) group by `r`.`idDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENTDC_STAT_EXTRA_HD_USED`
--

/*!50001 DROP TABLE IF EXISTS `ENTDC_STAT_EXTRA_HD_USED`*/;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_EXTRA_HD_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENTDC_STAT_EXTRA_HD_USED` AS select `pm`.`idDataCenter` AS `idDataCenter`,`vm`.`idEnterprise` AS `idEnterprise`,(ifnull(sum(`r`.`limitResource`),0) * 1048576) AS `extraHDUsed` from ((((`rasd_management` `rm` join `rasd` `r`) join `virtualmachine` `vm`) join `hypervisor` `h`) join `physicalmachine` `pm`) where ((`rm`.`idResource` = `r`.`instanceID`) and (`rm`.`idVM` = `vm`.`idVM`) and (`rm`.`idResourceType` = 17) and (`vm`.`idHypervisor` = `h`.`id`) and (`pm`.`idPhysicalMachine` = `h`.`idPhysicalMachine`) and (`vm`.`state` = 'ON') and (`vm`.`idType` = 1)) group by `pm`.`idDataCenter`,`vm`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENTDC_STAT_PUBLIC_IP_STATS`
--

/*!50001 DROP TABLE IF EXISTS `ENTDC_STAT_PUBLIC_IP_STATS`*/;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_PUBLIC_IP_STATS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENTDC_STAT_PUBLIC_IP_STATS` AS select `vdc`.`idDataCenter` AS `idDataCenter`,`vdc`.`idEnterprise` AS `idEnterprise`,sum(if((`ipm`.`mac` is not null),1,0)) AS `publicIPsReserved`,sum(if(((`ipm`.`mac` is not null) and (`rm`.`idVM` is not null)),1,0)) AS `publicIPsUsed` from (((((`ip_pool_management` `ipm` join `network_configuration` `nc`) join `vlan_network` `vn`) join (`datacenter` `dc` left join `public_datacenter` `pdc` on((`pdc`.`idDatacenter` <> 0)))) join `rasd_management` `rm`) join `virtualdatacenter` `vdc`) where ((`ipm`.`vlan_network_id` = `vn`.`vlan_network_id`) and (`vn`.`network_configuration_id` = `nc`.`network_configuration_id`) and (`vn`.`network_id` = `dc`.`network_id`) and ((`vn`.`networktype` = 'PUBLIC') or ((`vdc`.`idDataCenter` = `pdc`.`idDatacenter`) and (`vn`.`networktype` = 'UNMANAGED'))) and (`rm`.`idManagement` = `ipm`.`idManagement`) and (`vdc`.`idVirtualDataCenter` = `rm`.`idVirtualDataCenter`)) group by `vdc`.`idDataCenter`,`vdc`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENTDC_STAT_REPO_USED`
--

/*!50001 DROP TABLE IF EXISTS `ENTDC_STAT_REPO_USED`*/;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_REPO_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENTDC_STAT_REPO_USED` AS select `r`.`idDataCenter` AS `idDataCenter`,`e`.`idEnterprise` AS `idEnterprise`,sum(`vi`.`diskFileSize`) AS `repositoryUsed` from ((`enterprise` `e` join `virtualimage` `vi` on((`e`.`idEnterprise` = `vi`.`idEnterprise`))) join `repository` `r` on((`r`.`idRepository` = `vi`.`idRepository`))) where ((`vi`.`stateful` = 0) and (`vi`.`available` = 1)) group by `r`.`idDataCenter`,`e`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENTDC_STAT_STORAGE_USED`
--

/*!50001 DROP TABLE IF EXISTS `ENTDC_STAT_STORAGE_USED`*/;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_STORAGE_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENTDC_STAT_STORAGE_USED` AS select `vdc`.`idDataCenter` AS `idDataCenter`,`vdc`.`idEnterprise` AS `idEnterprise`,if(isnull(sum(`r`.`limitResource`)),0,sum(`r`.`limitResource`)) AS `extStorageUsed` from (((`rasd_management` `rm` join `rasd` `r`) join `volume_management` `vm`) join `virtualdatacenter` `vdc`) where ((`rm`.`idManagement` = `vm`.`idManagement`) and (`vdc`.`idVirtualDataCenter` = `rm`.`idVirtualDataCenter`) and (`r`.`instanceID` = `rm`.`idResource`) and ((`vm`.`state` = 1) or (`vm`.`state` = 2)) and (`rm`.`idResource` is not null)) group by `vdc`.`idDataCenter`,`vdc`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENTDC_STAT_VLANS_USED`
--

/*!50001 DROP TABLE IF EXISTS `ENTDC_STAT_VLANS_USED`*/;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_VLANS_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENTDC_STAT_VLANS_USED` AS select `vdc`.`idDataCenter` AS `idDataCenter`,`vdc`.`idEnterprise` AS `idEnterprise`,if(isnull(count(0)),0,count(0)) AS `vlanUsed` from (`virtualdatacenter` `vdc` join `vlan_network` `vn`) where (`vdc`.`networktypeID` = `vn`.`network_id`) group by `vdc`.`idDataCenter`,`vdc`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENTDC_STAT_VM_RESOURCES`
--

/*!50001 DROP TABLE IF EXISTS `ENTDC_STAT_VM_RESOURCES`*/;
/*!50001 DROP VIEW IF EXISTS `ENTDC_STAT_VM_RESOURCES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENTDC_STAT_VM_RESOURCES` AS select `pm`.`idDataCenter` AS `idDataCenter`,`vm`.`idEnterprise` AS `idEnterprise`,if(isnull(sum(`vm`.`cpu`)),0,sum(`vm`.`cpu`)) AS `vCpuUsed`,if(isnull(sum(`vm`.`ram`)),0,sum(`vm`.`ram`)) AS `memoryUsed`,if(isnull(sum(`vm`.`hd`)),0,sum(`vm`.`hd`)) AS `localStorageUsed` from ((`virtualmachine` `vm` join `hypervisor` `h` on((`vm`.`idHypervisor` = `h`.`id`))) join `physicalmachine` `pm` on((`h`.`idPhysicalMachine` = `pm`.`idPhysicalMachine`))) where ((`vm`.`state` = 'ON') and (`vm`.`idType` = 1)) group by `pm`.`idDataCenter`,`vm`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENT_STAT_EXTRA_HD_USED`
--

/*!50001 DROP TABLE IF EXISTS `ENT_STAT_EXTRA_HD_USED`*/;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_EXTRA_HD_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENT_STAT_EXTRA_HD_USED` AS select `vm`.`idEnterprise` AS `idEnterprise`,(ifnull(sum(`r`.`limitResource`),0) * 1048576) AS `extraHDUsed` from ((`rasd_management` `rm` join `rasd` `r`) join `virtualmachine` `vm`) where ((`rm`.`idResource` = `r`.`instanceID`) and (`rm`.`idVM` = `vm`.`idVM`) and (`rm`.`idResourceType` = 17) and (`vm`.`state` in ('ON','OFF','PAUSED')) and (`vm`.`idType` = 1)) group by `vm`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENT_STAT_PUBLIC_IP_STATS`
--

/*!50001 DROP TABLE IF EXISTS `ENT_STAT_PUBLIC_IP_STATS`*/;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_PUBLIC_IP_STATS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENT_STAT_PUBLIC_IP_STATS` AS select `vdc`.`idEnterprise` AS `idEnterprise`,sum(if((`ipm`.`mac` is not null),1,0)) AS `publicIPsReserved`,sum(if(((`ipm`.`mac` is not null) and (`rm`.`idVM` is not null)),1,0)) AS `publicIPsUsed` from (((((`ip_pool_management` `ipm` join `network_configuration` `nc`) join `vlan_network` `vn`) join (`datacenter` `dc` left join `public_datacenter` `pdc` on((`pdc`.`idDatacenter` <> 0)))) join `rasd_management` `rm`) join `virtualdatacenter` `vdc`) where ((`ipm`.`vlan_network_id` = `vn`.`vlan_network_id`) and (`vn`.`network_configuration_id` = `nc`.`network_configuration_id`) and (`vn`.`network_id` = `dc`.`network_id`) and ((`vn`.`networktype` = 'PUBLIC') or ((`vdc`.`idDataCenter` = `pdc`.`idDatacenter`) and (`vn`.`networktype` = 'UNMANAGED'))) and (`rm`.`idManagement` = `ipm`.`idManagement`) and (`vdc`.`idVirtualDataCenter` = `rm`.`idVirtualDataCenter`)) group by `vdc`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENT_STAT_REPO_USED`
--

/*!50001 DROP TABLE IF EXISTS `ENT_STAT_REPO_USED`*/;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_REPO_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENT_STAT_REPO_USED` AS select `vi`.`idEnterprise` AS `idEnterprise`,ifnull(sum(`vi`.`diskFileSize`),0) AS `repositoryUsed` from ((((`enterprise` `e` join `virtualimage` `vi` on((`e`.`idEnterprise` = `vi`.`idEnterprise`))) join `repository` `r` on((`r`.`idRepository` = `vi`.`idRepository`))) join `datacenter` `d` on((`r`.`idDataCenter` = `d`.`idDataCenter`))) left join `public_datacenter` `pd` on((`pd`.`idDatacenter` = `d`.`idDataCenter`))) where ((`vi`.`available` = 1) and (`vi`.`stateful` = 0) and (`vi`.`idRepository` is not null) and isnull(`pd`.`idDatacenter`)) group by `e`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENT_STAT_STORAGE_USED`
--

/*!50001 DROP TABLE IF EXISTS `ENT_STAT_STORAGE_USED`*/;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_STORAGE_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENT_STAT_STORAGE_USED` AS select `vdc`.`idEnterprise` AS `idEnterprise`,if(isnull(sum(`r`.`limitResource`)),0,sum(`r`.`limitResource`)) AS `extStorageUsed` from (((`rasd_management` `rm` join `rasd` `r`) join `volume_management` `vm`) join `virtualdatacenter` `vdc`) where ((`rm`.`idManagement` = `vm`.`idManagement`) and (`vdc`.`idVirtualDataCenter` = `rm`.`idVirtualDataCenter`) and (`r`.`instanceID` = `rm`.`idResource`) and (`rm`.`idResource` is not null)) group by `vdc`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENT_STAT_VLANS_USED`
--

/*!50001 DROP TABLE IF EXISTS `ENT_STAT_VLANS_USED`*/;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_VLANS_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENT_STAT_VLANS_USED` AS select `vdc`.`idEnterprise` AS `idEnterprise`,if(isnull(count(0)),0,count(0)) AS `vlanUsed` from (`virtualdatacenter` `vdc` join `vlan_network` `vn`) where (`vdc`.`networktypeID` = `vn`.`network_id`) group by `vdc`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ENT_STAT_VM_RESOURCES`
--

/*!50001 DROP TABLE IF EXISTS `ENT_STAT_VM_RESOURCES`*/;
/*!50001 DROP VIEW IF EXISTS `ENT_STAT_VM_RESOURCES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ENT_STAT_VM_RESOURCES` AS select `vm`.`idEnterprise` AS `idEnterprise`,if(isnull(sum(`vm`.`cpu`)),0,sum(`vm`.`cpu`)) AS `vCpuUsed`,if(isnull(sum(`vm`.`ram`)),0,sum(`vm`.`ram`)) AS `memoryUsed` from `virtualmachine` `vm` where ((`vm`.`state` in ('ON','OFF','PAUSED')) and (`vm`.`idType` = 1)) group by `vm`.`idEnterprise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `METERING_ALL_VW`
--

/*!50001 DROP TABLE IF EXISTS `METERING_ALL_VW`*/;
/*!50001 DROP VIEW IF EXISTS `METERING_ALL_VW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `METERING_ALL_VW` AS select `metering_archive`.`idMeter` AS `idMeter`,`metering_archive`.`idDatacenter` AS `idDatacenter`,`metering_archive`.`datacenter` AS `datacenter`,`metering_archive`.`idRack` AS `idRack`,`metering_archive`.`rack` AS `rack`,`metering_archive`.`idPhysicalMachine` AS `idPhysicalMachine`,`metering_archive`.`physicalmachine` AS `physicalmachine`,`metering_archive`.`idStorageSystem` AS `idStorageSystem`,`metering_archive`.`storageSystem` AS `storageSystem`,`metering_archive`.`idStoragePool` AS `idStoragePool`,`metering_archive`.`storagePool` AS `storagePool`,`metering_archive`.`idVolume` AS `idVolume`,`metering_archive`.`volume` AS `volume`,`metering_archive`.`idNetwork` AS `idNetwork`,`metering_archive`.`network` AS `network`,`metering_archive`.`idSubnet` AS `idSubnet`,`metering_archive`.`subnet` AS `subnet`,`metering_archive`.`idEnterprise` AS `idEnterprise`,`metering_archive`.`enterprise` AS `enterprise`,`metering_archive`.`idUser` AS `idUser`,`metering_archive`.`user` AS `user`,`metering_archive`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`metering_archive`.`virtualDataCenter` AS `virtualDataCenter`,`metering_archive`.`idVirtualApp` AS `idVirtualApp`,`metering_archive`.`virtualApp` AS `virtualApp`,`metering_archive`.`idVirtualMachine` AS `idVirtualMachine`,`metering_archive`.`virtualmachine` AS `virtualmachine`,`metering_archive`.`severity` AS `severity`,`metering_archive`.`timestamp` AS `timestamp`,`metering_archive`.`performedby` AS `performedby`,`metering_archive`.`actionperformed` AS `actionperformed`,`metering_archive`.`component` AS `component`,`metering_archive`.`stacktrace` AS `stacktrace`,`metering_archive`.`version_c` AS `version_c` from `metering_archive` union all select `metering`.`idMeter` AS `idMeter`,`metering`.`idDatacenter` AS `idDatacenter`,`metering`.`datacenter` AS `datacenter`,`metering`.`idRack` AS `idRack`,`metering`.`rack` AS `rack`,`metering`.`idPhysicalMachine` AS `idPhysicalMachine`,`metering`.`physicalmachine` AS `physicalmachine`,`metering`.`idStorageSystem` AS `idStorageSystem`,`metering`.`storageSystem` AS `storageSystem`,`metering`.`idStoragePool` AS `idStoragePool`,`metering`.`storagePool` AS `storagePool`,`metering`.`idVolume` AS `idVolume`,`metering`.`volume` AS `volume`,`metering`.`idNetwork` AS `idNetwork`,`metering`.`network` AS `network`,`metering`.`idSubnet` AS `idSubnet`,`metering`.`subnet` AS `subnet`,`metering`.`idEnterprise` AS `idEnterprise`,`metering`.`enterprise` AS `enterprise`,`metering`.`idUser` AS `idUser`,`metering`.`user` AS `user`,`metering`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`metering`.`virtualDataCenter` AS `virtualDataCenter`,`metering`.`idVirtualApp` AS `idVirtualApp`,`metering`.`virtualApp` AS `virtualApp`,`metering`.`idVirtualMachine` AS `idVirtualMachine`,`metering`.`virtualmachine` AS `virtualmachine`,`metering`.`severity` AS `severity`,`metering`.`timestamp` AS `timestamp`,`metering`.`performedby` AS `performedby`,`metering`.`actionperformed` AS `actionperformed`,`metering`.`component` AS `component`,`metering`.`stacktrace` AS `stacktrace`,`metering`.`version_c` AS `version_c` from `metering` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VAPP_STAT_ASSOC_VOLUMES`
--

/*!50001 DROP TABLE IF EXISTS `VAPP_STAT_ASSOC_VOLUMES`*/;
/*!50001 DROP VIEW IF EXISTS `VAPP_STAT_ASSOC_VOLUMES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `VAPP_STAT_ASSOC_VOLUMES` AS select `rm`.`idVirtualApp` AS `idVirtualApp`,if(isnull(count(0)),0,count(0)) AS `volAssociated` from `rasd_management` `rm` where ((`rm`.`idResource` is not null) and (`rm`.`idResourceType` = 8)) group by `rm`.`idVirtualApp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VAPP_STAT_ATTACH_VOLUMES`
--

/*!50001 DROP TABLE IF EXISTS `VAPP_STAT_ATTACH_VOLUMES`*/;
/*!50001 DROP VIEW IF EXISTS `VAPP_STAT_ATTACH_VOLUMES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `VAPP_STAT_ATTACH_VOLUMES` AS select `rm`.`idVirtualApp` AS `idVirtualApp`,sum(if((`rm`.`idVM` is not null),1,0)) AS `volAttached` from `rasd_management` `rm` where ((`rm`.`idResource` is not null) and (`rm`.`idResourceType` = 8)) group by `rm`.`idVirtualApp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VAPP_STAT_VM_COUNTS`
--

/*!50001 DROP TABLE IF EXISTS `VAPP_STAT_VM_COUNTS`*/;
/*!50001 DROP VIEW IF EXISTS `VAPP_STAT_VM_COUNTS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `VAPP_STAT_VM_COUNTS` AS select `vapp`.`idVirtualApp` AS `idVirtualApp`,sum(if(((`v`.`state` <> 'NOT_ALLOCATED') and (`v`.`state` <> 'UNKNOWN')),1,0)) AS `vmCreated`,sum(if((`v`.`state` = 'ON'),1,0)) AS `vmActive` from (((`nodevirtualimage` `nvi` join `virtualmachine` `v`) join `node` `n`) join `virtualapp` `vapp`) where ((`nvi`.`idNode` is not null) and (`v`.`idVM` = `nvi`.`idVM`) and (`n`.`idNode` = `nvi`.`idNode`) and (`n`.`idVirtualApp` = `vapp`.`idVirtualApp`) and (`v`.`idType` = 1)) group by `vapp`.`idVirtualApp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VDC_STAT_ASSOC_VOLUMES`
--

/*!50001 DROP TABLE IF EXISTS `VDC_STAT_ASSOC_VOLUMES`*/;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_ASSOC_VOLUMES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `VDC_STAT_ASSOC_VOLUMES` AS select `rm`.`idVirtualDataCenter` AS `idVirtualDataCenter`,if(isnull(count(0)),0,count(0)) AS `volCreated`,sum(if((`rm`.`idVirtualApp` is not null),1,0)) AS `volAssociated` from `rasd_management` `rm` where ((`rm`.`idResource` is not null) and (`rm`.`idResourceType` = 8)) group by `rm`.`idVirtualDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VDC_STAT_ATTACH_VOLUMES`
--

/*!50001 DROP TABLE IF EXISTS `VDC_STAT_ATTACH_VOLUMES`*/;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_ATTACH_VOLUMES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `VDC_STAT_ATTACH_VOLUMES` AS select `rm`.`idVirtualDataCenter` AS `idVirtualDataCenter`,sum(if((`rm`.`idVM` is not null),1,0)) AS `volAttached` from `rasd_management` `rm` where ((`rm`.`idResource` is not null) and (`rm`.`idResourceType` = 8)) group by `rm`.`idVirtualDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VDC_STAT_EXTRA_HD_USED`
--

/*!50001 DROP TABLE IF EXISTS `VDC_STAT_EXTRA_HD_USED`*/;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_EXTRA_HD_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `VDC_STAT_EXTRA_HD_USED` AS select `rm`.`idVirtualDataCenter` AS `idVirtualDataCenter`,(ifnull(sum(`r`.`limitResource`),0) * 1048576) AS `extraHDUsed` from ((`rasd_management` `rm` join `rasd` `r`) join `virtualmachine` `vm`) where ((`rm`.`idResource` = `r`.`instanceID`) and (`rm`.`idVM` = `vm`.`idVM`) and (`rm`.`idResourceType` = 17) and (`vm`.`state` in ('ON','OFF','PAUSED')) and (`vm`.`idType` = 1)) group by `rm`.`idVirtualDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VDC_STAT_PUBLIC_IP_STATS`
--

/*!50001 DROP TABLE IF EXISTS `VDC_STAT_PUBLIC_IP_STATS`*/;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_PUBLIC_IP_STATS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `VDC_STAT_PUBLIC_IP_STATS` AS select `vdc`.`idVirtualDataCenter` AS `idVirtualDataCenter`,sum(if((`ipm`.`mac` is not null),1,0)) AS `publicIPsReserved`,sum(if(((`ipm`.`mac` is not null) and (`rm`.`idVM` is not null)),1,0)) AS `publicIPsUsed` from (((((`ip_pool_management` `ipm` join `network_configuration` `nc`) join `vlan_network` `vn`) join (`datacenter` `dc` left join `public_datacenter` `pdc` on((`pdc`.`idDatacenter` <> 0)))) join `rasd_management` `rm`) join `virtualdatacenter` `vdc`) where ((`ipm`.`vlan_network_id` = `vn`.`vlan_network_id`) and (`vn`.`network_configuration_id` = `nc`.`network_configuration_id`) and (`vn`.`network_id` = `dc`.`network_id`) and ((`vn`.`networktype` = 'PUBLIC') or ((`vdc`.`idDataCenter` = `pdc`.`idDatacenter`) and (`vn`.`networktype` = 'UNMANAGED'))) and (`rm`.`idManagement` = `ipm`.`idManagement`) and (`vdc`.`idVirtualDataCenter` = `rm`.`idVirtualDataCenter`)) group by `vdc`.`idVirtualDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VDC_STAT_STORAGE_USED`
--

/*!50001 DROP TABLE IF EXISTS `VDC_STAT_STORAGE_USED`*/;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_STORAGE_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `VDC_STAT_STORAGE_USED` AS select `rm`.`idVirtualDataCenter` AS `idVirtualDataCenter`,if(isnull(sum(`r`.`limitResource`)),0,sum(`r`.`limitResource`)) AS `extStorageUsed` from ((`rasd_management` `rm` join `rasd` `r`) join `volume_management` `vm`) where ((`rm`.`idManagement` = `vm`.`idManagement`) and (`r`.`instanceID` = `rm`.`idResource`)) group by `rm`.`idVirtualDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VDC_STAT_VLANS_USED`
--

/*!50001 DROP TABLE IF EXISTS `VDC_STAT_VLANS_USED`*/;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_VLANS_USED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `VDC_STAT_VLANS_USED` AS select `vdc`.`idVirtualDataCenter` AS `idVirtualDataCenter`,if(isnull(count(0)),0,count(0)) AS `vlanUsed` from (`virtualdatacenter` `vdc` join `vlan_network` `vn`) where (`vdc`.`networktypeID` = `vn`.`network_id`) group by `vdc`.`idVirtualDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VDC_STAT_VM_COUNTS`
--

/*!50001 DROP TABLE IF EXISTS `VDC_STAT_VM_COUNTS`*/;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_VM_COUNTS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `VDC_STAT_VM_COUNTS` AS select `vapp`.`idVirtualDataCenter` AS `idVirtualDataCenter`,sum(if(((`v`.`state` <> 'NOT_ALLOCATED') and (`v`.`state` <> 'UNKNOWN')),1,0)) AS `vmCreated`,sum(if((`v`.`state` = 'ON'),1,0)) AS `vmActive` from (((`nodevirtualimage` `nvi` join `virtualmachine` `v`) join `node` `n`) join `virtualapp` `vapp`) where ((`nvi`.`idNode` is not null) and (`v`.`idVM` = `nvi`.`idVM`) and (`n`.`idNode` = `nvi`.`idNode`) and (`n`.`idVirtualApp` = `vapp`.`idVirtualApp`) and (`v`.`idType` = 1)) group by `vapp`.`idVirtualDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VDC_STAT_VM_RESOURCES`
--

/*!50001 DROP TABLE IF EXISTS `VDC_STAT_VM_RESOURCES`*/;
/*!50001 DROP VIEW IF EXISTS `VDC_STAT_VM_RESOURCES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `VDC_STAT_VM_RESOURCES` AS select `vapp`.`idVirtualDataCenter` AS `idVirtualDataCenter`,if(isnull(sum(`vm`.`cpu`)),0,sum(`vm`.`cpu`)) AS `vCpuUsed`,if(isnull(sum(`vm`.`ram`)),0,sum(`vm`.`ram`)) AS `memoryUsed` from (((`virtualmachine` `vm` join `nodevirtualimage` `nvi`) join `node` `n`) join `virtualapp` `vapp`) where ((`vm`.`idVM` = `nvi`.`idVM`) and (`nvi`.`idNode` = `n`.`idNode`) and (`vapp`.`idVirtualApp` = `n`.`idVirtualApp`) and (`vm`.`state` in ('ON','OFF','PAUSED')) and (`vm`.`idType` = 1)) group by `vapp`.`idVirtualDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cloud_usage_stats_vw`
--

/*!50001 DROP TABLE IF EXISTS `cloud_usage_stats_vw`*/;
/*!50001 DROP VIEW IF EXISTS `cloud_usage_stats_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `cloud_usage_stats_vw` AS select cast(if((`dc`.`idDataCenter` = 0),-(1),`dc`.`idDataCenter`) as decimal(20,0)) AS `idDataCenter`,cast(coalesce(`st`.`serversTotal`,0) as unsigned) AS `serversTotal`,cast(coalesce(`st`.`serversRunning`,0) as unsigned) AS `serversRunning`,cast(coalesce(`storT`.`storageTotal`,0) as unsigned) AS `storageTotal`,cast(coalesce(`cloudRes`.`storageReserved`,0) as unsigned) AS `storageReserved`,cast(coalesce(`storU`.`storageUsed`,0) as unsigned) AS `storageUsed`,cast(coalesce(`ipt`.`publicIPsTotal`,0) as unsigned) AS `publicIPsTotal`,cast(coalesce(`ipt`.`publicIPsReserved`,0) as unsigned) AS `publicIPsReserved`,cast(coalesce(`ipt`.`publicIPsUsed`,0) as unsigned) AS `publicIPsUsed`,cast(coalesce(`vlr`.`vlanReserved`,0) as unsigned) AS `vlanReserved`,cast(coalesce(`vlc`.`vlanUsed`,0) as unsigned) AS `vlanUsed`,cast(coalesce(`vmt`.`vMachinesTotal`,0) as unsigned) AS `vMachinesTotal`,cast(coalesce(`vmt`.`vMachinesRunning`,0) as unsigned) AS `vMachinesRunning`,cast(coalesce(`wkload`.`vCPUTotal`,0) as unsigned) AS `vCpuTotal`,cast(coalesce(`cloudRes`.`vCpuReserved`,0) as unsigned) AS `vCpuReserved`,cast(coalesce(`vmt`.`vCpuUsed`,0) as unsigned) AS `vCpuUsed`,cast(coalesce(`wkload`.`vMemoryTotal`,0) as unsigned) AS `vMemoryTotal`,cast(coalesce(`cloudRes`.`vMemoryReserved`,0) as unsigned) AS `vMemoryReserved`,cast(coalesce(`vmt`.`vMemoryUsed`,0) as unsigned) AS `vMemoryUsed`,cast(coalesce(`cloudRes`.`vStorageReserved`,0) as unsigned) AS `vStorageReserved`,cast(coalesce(`ehd`.`extraHDUsed`,0) as unsigned) AS `vStorageUsed`,cast(coalesce(`vst`.`vStorageTotal`,0) as unsigned) AS `vStorageTotal`,cast(coalesce(`uc`.`numUsersCreated`,0) as unsigned) AS `numUsersCreated`,cast(coalesce(`vdcc`.`numVDCCreated`,0) as unsigned) AS `numVDCCreated`,cast(coalesce(`ec`.`numEnterprisesCreated`,0) as unsigned) AS `numEnterprisesCreated`,cast(coalesce(`cloudRes`.`repositoryReserved`,0) as unsigned) AS `repositoryReserved`,cast(coalesce(`rep`.`repositoryUsed`,0) as unsigned) AS `repositoryUsed`,1 AS `version_c` from (((((((((((((((`CLOUD_STAT_DC_LIST` `dc` left join `CLOUD_STAT_DC_SERVER_STATS` `st` on((`dc`.`idDataCenter` = `st`.`idDatacenter`))) left join `CLOUD_STAT_DC_STORAGE_TOTAL` `storT` on((`dc`.`idDataCenter` = `storT`.`idDataCenter`))) left join `CLOUD_STAT_DC_STORAGE_USED` `storU` on((`dc`.`idDataCenter` = `storU`.`idDataCenter`))) left join `CLOUD_STAT_DC_PUBLIC_IP_STATS` `ipt` on((`dc`.`idDataCenter` = `ipt`.`idDataCenter`))) left join `CLOUD_STAT_DC_VM_STATS` `vmt` on((`dc`.`idDataCenter` = `vmt`.`idDataCenter`))) left join `CLOUD_STAT_DC_VLAN_RES` `vlr` on((`dc`.`idDataCenter` = `vlr`.`idDataCenter`))) left join `CLOUD_STAT_DC_STOARGE` `vst` on((`dc`.`idDataCenter` = `vst`.`idDataCenter`))) left join `CLOUD_STAT_SERV_WKLOAD_TOTALS` `wkload` on((`dc`.`idDataCenter` = `wkload`.`idDatacenter`))) left join `CLOUD_STAT_EXTRA_HD_USED` `ehd` on((`dc`.`idDataCenter` = `ehd`.`idDatacenter`))) left join `CLOUD_STAT_RESERVED` `cloudRes` on((`dc`.`idDataCenter` = `cloudRes`.`idDataCenter`))) left join `CLOUD_STAT_USER_COUNT` `uc` on((`dc`.`idDataCenter` = `uc`.`idDataCenter`))) left join `CLOUD_STAT_VDC_COUNT` `vdcc` on((`dc`.`idDataCenter` = `vdcc`.`idDataCenter`))) left join `CLOUD_STAT_ENT_COUNT` `ec` on((`dc`.`idDataCenter` = `ec`.`idDataCenter`))) left join `CLOUD_STAT_VLAN_USAGE` `vlc` on((`dc`.`idDataCenter` = `vlc`.`idDataCenter`))) left join `DC_STAT_REPO_USED` `rep` on((`dc`.`idDataCenter` = `rep`.`idDataCenter`))) order by `dc`.`idDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dc_enterprise_stats_vw`
--

/*!50001 DROP TABLE IF EXISTS `dc_enterprise_stats_vw`*/;
/*!50001 DROP VIEW IF EXISTS `dc_enterprise_stats_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `dc_enterprise_stats_vw` AS select NULL AS `idDCEnterpriseStats`,`dc`.`idDataCenter` AS `idDataCenter`,`eldc`.`idEnterprise` AS `idEnterprise`,cast(`eldc`.`cpuHard` as unsigned) AS `vCpuReserved`,cast(coalesce(`vms`.`vCpuUsed`,0) as unsigned) AS `vCpuUsed`,cast(`eldc`.`ramHard` as unsigned) AS `memoryReserved`,cast(coalesce(`vms`.`memoryUsed`,0) as unsigned) AS `memoryUsed`,cast(`eldc`.`hdHard` as unsigned) AS `localStorageReserved`,cast((coalesce(`vms`.`localStorageUsed`,0) + coalesce(`ehd`.`extraHDUsed`,0)) as unsigned) AS `localStorageUsed`,cast(`eldc`.`storageHard` as unsigned) AS `extStorageReserved`,cast(coalesce(`es`.`extStorageUsed`,0) as unsigned) AS `extStorageUsed`,cast(`eldc`.`repositoryHard` as unsigned) AS `repositoryReserved`,cast(coalesce(`rep`.`repositoryUsed`,0) as unsigned) AS `repositoryUsed`,cast(`eldc`.`publicIPHard` as unsigned) AS `publicIPsReserved`,cast(coalesce(`ips`.`publicIPsUsed`,0) as unsigned) AS `publicIPsUsed`,cast(`eldc`.`vlanHard` as unsigned) AS `vlanReserved`,cast(coalesce(`vls`.`vlanUsed`,0) as unsigned) AS `vlanUsed`,1 AS `version_c` from (((((((`datacenter` `dc` left join `enterprise_limits_by_datacenter` `eldc` on((`dc`.`idDataCenter` = `eldc`.`idDataCenter`))) left join `ENTDC_STAT_VM_RESOURCES` `vms` on(((`dc`.`idDataCenter` = `vms`.`idDataCenter`) and (`eldc`.`idEnterprise` = `vms`.`idEnterprise`)))) left join `ENTDC_STAT_PUBLIC_IP_STATS` `ips` on(((`dc`.`idDataCenter` = `ips`.`idDataCenter`) and (`eldc`.`idEnterprise` = `ips`.`idEnterprise`)))) left join `ENTDC_STAT_STORAGE_USED` `es` on(((`dc`.`idDataCenter` = `es`.`idDataCenter`) and (`eldc`.`idEnterprise` = `es`.`idEnterprise`)))) left join `ENTDC_STAT_VLANS_USED` `vls` on(((`dc`.`idDataCenter` = `vls`.`idDataCenter`) and (`eldc`.`idEnterprise` = `vls`.`idEnterprise`)))) left join `ENTDC_STAT_EXTRA_HD_USED` `ehd` on(((`dc`.`idDataCenter` = `ehd`.`idDataCenter`) and (`eldc`.`idEnterprise` = `ehd`.`idEnterprise`)))) left join `ENTDC_STAT_REPO_USED` `rep` on(((`dc`.`idDataCenter` = `rep`.`idDataCenter`) and (`eldc`.`idEnterprise` = `rep`.`idEnterprise`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `enterprise_resources_stats_vw`
--

/*!50001 DROP TABLE IF EXISTS `enterprise_resources_stats_vw`*/;
/*!50001 DROP VIEW IF EXISTS `enterprise_resources_stats_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `enterprise_resources_stats_vw` AS select `e`.`idEnterprise` AS `idEnterprise`,cast(`e`.`cpuHard` as unsigned) AS `vCpuReserved`,cast(coalesce(`evm`.`vCpuUsed`,0) as unsigned) AS `vCpuUsed`,cast(`e`.`ramHard` as unsigned) AS `memoryReserved`,cast(coalesce(`evm`.`memoryUsed`,0) as unsigned) AS `memoryUsed`,cast(`e`.`hdHard` as unsigned) AS `localStorageReserved`,cast(coalesce(`ehd`.`extraHDUsed`,0) as unsigned) AS `localStorageUsed`,cast(`e`.`storageHard` as unsigned) AS `extStorageReserved`,cast(coalesce(`su`.`extStorageUsed`,0) as unsigned) AS `extStorageUsed`,cast(`e`.`repositoryHard` as unsigned) AS `repositoryReserved`,cast(coalesce(`rep`.`repositoryUsed`,0) as unsigned) AS `repositoryUsed`,cast(coalesce(`ips`.`publicIPsReserved`,0) as unsigned) AS `publicIPsReserved`,cast(coalesce(`ips`.`publicIPsUsed`,0) as unsigned) AS `publicIPsUsed`,cast(`e`.`vlanHard` as unsigned) AS `vlanReserved`,cast(coalesce(`vlu`.`vlanUsed`,0) as unsigned) AS `vlanUsed`,1 AS `version_c` from ((((((`enterprise` `e` left join `ENT_STAT_VM_RESOURCES` `evm` on((`e`.`idEnterprise` = `evm`.`idEnterprise`))) left join `ENT_STAT_VLANS_USED` `vlu` on((`e`.`idEnterprise` = `vlu`.`idEnterprise`))) left join `ENT_STAT_STORAGE_USED` `su` on((`e`.`idEnterprise` = `su`.`idEnterprise`))) left join `ENT_STAT_PUBLIC_IP_STATS` `ips` on((`e`.`idEnterprise` = `ips`.`idEnterprise`))) left join `ENT_STAT_EXTRA_HD_USED` `ehd` on((`e`.`idEnterprise` = `ehd`.`idEnterprise`))) left join `ENT_STAT_REPO_USED` `rep` on((`e`.`idEnterprise` = `rep`.`idEnterprise`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vapp_enterprise_stats_vw`
--

/*!50001 DROP TABLE IF EXISTS `vapp_enterprise_stats_vw`*/;
/*!50001 DROP VIEW IF EXISTS `vapp_enterprise_stats_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `vapp_enterprise_stats_vw` AS select `vapp`.`idVirtualApp` AS `idVirtualApp`,`vapp`.`idEnterprise` AS `idEnterprise`,`vapp`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`vapp`.`name` AS `vappName`,`vdc`.`name` AS `vdcName`,cast(coalesce(`vvm`.`vmCreated`,0) as decimal(12,0)) AS `vmCreated`,cast(coalesce(`vvm`.`vmActive`,0) as decimal(12,0)) AS `vmActive`,cast(coalesce(`vass`.`volAssociated`,0) as decimal(12,0)) AS `volAssociated`,cast(coalesce(`vatt`.`volAttached`,0) as decimal(12,0)) AS `volAttached`,1 AS `version_c` from ((((`virtualapp` `vapp` join `virtualdatacenter` `vdc` on((`vdc`.`idVirtualDataCenter` = `vapp`.`idVirtualDataCenter`))) left join `VAPP_STAT_VM_COUNTS` `vvm` on((`vapp`.`idVirtualApp` = `vvm`.`idVirtualApp`))) left join `VAPP_STAT_ASSOC_VOLUMES` `vass` on((`vapp`.`idVirtualApp` = `vass`.`idVirtualApp`))) left join `VAPP_STAT_ATTACH_VOLUMES` `vatt` on((`vapp`.`idVirtualApp` = `vatt`.`idVirtualApp`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vdc_enterprise_stats_vw`
--

/*!50001 DROP TABLE IF EXISTS `vdc_enterprise_stats_vw`*/;
/*!50001 DROP VIEW IF EXISTS `vdc_enterprise_stats_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `vdc_enterprise_stats_vw` AS select `vdc`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`vdc`.`idEnterprise` AS `idEnterprise`,`vdc`.`name` AS `vdcName`,cast(coalesce(`vvm`.`vmCreated`,0) as decimal(12,0)) AS `vmCreated`,cast(coalesce(`vvm`.`vmActive`,0) as decimal(12,0)) AS `vmActive`,cast(coalesce(`vass`.`volCreated`,0) as decimal(12,0)) AS `volCreated`,cast(coalesce(`vass`.`volAssociated`,0) as decimal(12,0)) AS `volAssociated`,cast(coalesce(`vatt`.`volAttached`,0) as decimal(12,0)) AS `volAttached`,cast(`vdc`.`cpuHard` as unsigned) AS `vCpuReserved`,cast(coalesce(`vm`.`vCpuUsed`,0) as unsigned) AS `vCpuUsed`,cast(`vdc`.`ramHard` as unsigned) AS `memoryReserved`,cast(coalesce(`vm`.`memoryUsed`,0) as unsigned) AS `memoryUsed`,cast(`vdc`.`hdHard` as unsigned) AS `localStorageReserved`,cast(coalesce(`vehd`.`extraHDUsed`,0) as unsigned) AS `localStorageUsed`,cast(`vdc`.`storageHard` as unsigned) AS `extStorageReserved`,cast(coalesce(`vs`.`extStorageUsed`,0) as unsigned) AS `extStorageUsed`,cast(coalesce(`vip`.`publicIPsReserved`,0) as decimal(12,0)) AS `publicIPsReserved`,cast(coalesce(`vip`.`publicIPsUsed`,0) as decimal(12,0)) AS `publicIPsUsed`,cast(`vdc`.`vlanHard` as decimal(12,0)) AS `vlanReserved`,cast(coalesce(`vlu`.`vlanUsed`,0) as decimal(12,0)) AS `vlanUsed`,1 AS `version_c` from ((((((((`virtualdatacenter` `vdc` left join `VDC_STAT_VM_COUNTS` `vvm` on((`vdc`.`idVirtualDataCenter` = `vvm`.`idVirtualDataCenter`))) left join `VDC_STAT_ASSOC_VOLUMES` `vass` on((`vdc`.`idVirtualDataCenter` = `vass`.`idVirtualDataCenter`))) left join `VDC_STAT_ATTACH_VOLUMES` `vatt` on((`vdc`.`idVirtualDataCenter` = `vatt`.`idVirtualDataCenter`))) left join `VDC_STAT_VM_RESOURCES` `vm` on((`vdc`.`idVirtualDataCenter` = `vm`.`idVirtualDataCenter`))) left join `VDC_STAT_PUBLIC_IP_STATS` `vip` on((`vdc`.`idVirtualDataCenter` = `vip`.`idVirtualDataCenter`))) left join `VDC_STAT_STORAGE_USED` `vs` on((`vdc`.`idVirtualDataCenter` = `vs`.`idVirtualDataCenter`))) left join `VDC_STAT_EXTRA_HD_USED` `vehd` on((`vdc`.`idVirtualDataCenter` = `vehd`.`idVirtualDataCenter`))) left join `VDC_STAT_VLANS_USED` `vlu` on((`vdc`.`idVirtualDataCenter` = `vlu`.`idVirtualDataCenter`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-20 13:34:56
DROP DATABASE IF EXISTS kinton_accounting;
CREATE DATABASE IF NOT EXISTS kinton_accounting;
USE kinton_accounting;-- MySQL dump 10.14  Distrib 5.5.32-MariaDB, for Linux (x86_64)
--
-- Host: 10.60.20.42    Database: kinton_accounting
-- ------------------------------------------------------
-- Server version	5.5.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `ACCOUNTING_CONFIG_VW`
--

DROP TABLE IF EXISTS `ACCOUNTING_CONFIG_VW`;
/*!50001 DROP VIEW IF EXISTS `ACCOUNTING_CONFIG_VW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ACCOUNTING_CONFIG_VW` (
  `ACCOUNTING_ENABLED` tinyint NOT NULL,
  `PERIOD_SIZE` tinyint NOT NULL,
  `PERIOD_GRANULARITY` tinyint NOT NULL,
  `DELETE_HOURS` tinyint NOT NULL,
  `MAX_PERIODS_PER_RUN` tinyint NOT NULL,
  `MAX_INIT_PERIODS` tinyint NOT NULL,
  `VM_CPU_ENABLED` tinyint NOT NULL,
  `VM_RAM_ENABLED` tinyint NOT NULL,
  `VM_HD_ENABLED` tinyint NOT NULL,
  `TIER_STORAGE_ENABLED` tinyint NOT NULL,
  `IP_ENABLED` tinyint NOT NULL,
  `VLAN_ENABLED` tinyint NOT NULL,
  `HYP_TYPE_ENABLED` tinyint NOT NULL,
  `VM_HA_ENABLED` tinyint NOT NULL,
  `PM_CPU_ENABLED` tinyint NOT NULL,
  `PM_RAM_ENABLED` tinyint NOT NULL,
  `REPO_ENABLED` tinyint NOT NULL,
  `ANTI_AFFINITY_ENABLED` tinyint NOT NULL,
  `LOG_LEVEL` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ACCOUNT_PERIOD_USAGE_VW`
--

DROP TABLE IF EXISTS `ACCOUNT_PERIOD_USAGE_VW`;
/*!50001 DROP VIEW IF EXISTS `ACCOUNT_PERIOD_USAGE_VW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ACCOUNT_PERIOD_USAGE_VW` (
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `idAccountingResourceType` tinyint NOT NULL,
  `resourceType` tinyint NOT NULL,
  `resourceName` tinyint NOT NULL,
  `resourceUnits` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `idVirtualDataCenter` tinyint NOT NULL,
  `idVirtualApp` tinyint NOT NULL,
  `idVirtualMachine` tinyint NOT NULL,
  `enterpriseName` tinyint NOT NULL,
  `virtualDataCenter` tinyint NOT NULL,
  `virtualApp` tinyint NOT NULL,
  `virtualMachine` tinyint NOT NULL,
  `costCode` tinyint NOT NULL,
  `idStorageTier` tinyint NOT NULL,
  `costCodeName` tinyint NOT NULL,
  `storageTierName` tinyint NOT NULL,
  `idDataCenter` tinyint NOT NULL,
  `dataCenterName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `DAILY_USAGE_SUM_VW`
--

DROP TABLE IF EXISTS `DAILY_USAGE_SUM_VW`;
/*!50001 DROP VIEW IF EXISTS `DAILY_USAGE_SUM_VW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `DAILY_USAGE_SUM_VW` (
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `idAccountingResourceType` tinyint NOT NULL,
  `resourceType` tinyint NOT NULL,
  `resourceUnits` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `idVirtualDataCenter` tinyint NOT NULL,
  `enterpriseName` tinyint NOT NULL,
  `virtualDataCenter` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `HOURLY_USAGE_MAX_2_VW`
--

DROP TABLE IF EXISTS `HOURLY_USAGE_MAX_2_VW`;
/*!50001 DROP VIEW IF EXISTS `HOURLY_USAGE_MAX_2_VW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `HOURLY_USAGE_MAX_2_VW` (
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `idAccountingResourceType` tinyint NOT NULL,
  `resourceType` tinyint NOT NULL,
  `resourceName` tinyint NOT NULL,
  `resourceUnits` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `idVirtualDataCenter` tinyint NOT NULL,
  `idVirtualApp` tinyint NOT NULL,
  `idVirtualMachine` tinyint NOT NULL,
  `enterpriseName` tinyint NOT NULL,
  `virtualDataCenter` tinyint NOT NULL,
  `virtualApp` tinyint NOT NULL,
  `virtualMachine` tinyint NOT NULL,
  `costCode` tinyint NOT NULL,
  `idStorageTier` tinyint NOT NULL,
  `costCodeName` tinyint NOT NULL,
  `storageTierName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `HOURLY_USAGE_MAX_VW`
--

DROP TABLE IF EXISTS `HOURLY_USAGE_MAX_VW`;
/*!50001 DROP VIEW IF EXISTS `HOURLY_USAGE_MAX_VW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `HOURLY_USAGE_MAX_VW` (
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `idAccountingResourceType` tinyint NOT NULL,
  `resourceType` tinyint NOT NULL,
  `resourceName` tinyint NOT NULL,
  `resourceUnits` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `idVirtualDataCenter` tinyint NOT NULL,
  `idVirtualApp` tinyint NOT NULL,
  `idVirtualMachine` tinyint NOT NULL,
  `enterpriseName` tinyint NOT NULL,
  `virtualDataCenter` tinyint NOT NULL,
  `virtualApp` tinyint NOT NULL,
  `virtualMachine` tinyint NOT NULL,
  `costCode` tinyint NOT NULL,
  `idStorageTier` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `HOURLY_USAGE_SUM_VW`
--

DROP TABLE IF EXISTS `HOURLY_USAGE_SUM_VW`;
/*!50001 DROP VIEW IF EXISTS `HOURLY_USAGE_SUM_VW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `HOURLY_USAGE_SUM_VW` (
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `idAccountingResourceType` tinyint NOT NULL,
  `resourceType` tinyint NOT NULL,
  `resourceUnits` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `idVirtualDataCenter` tinyint NOT NULL,
  `enterpriseName` tinyint NOT NULL,
  `virtualDataCenter` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `LOG_ERRORS_VW`
--

DROP TABLE IF EXISTS `LOG_ERRORS_VW`;
/*!50001 DROP VIEW IF EXISTS `LOG_ERRORS_VW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `LOG_ERRORS_VW` (
  `LOG_TIME` tinyint NOT NULL,
  `SEVERITY` tinyint NOT NULL,
  `MESSAGE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `LOG_VW`
--

DROP TABLE IF EXISTS `LOG_VW`;
/*!50001 DROP VIEW IF EXISTS `LOG_VW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `LOG_VW` (
  `LOG_TIME` tinyint NOT NULL,
  `SEVERITY` tinyint NOT NULL,
  `MESSAGE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `LOG_WARNINGS_VW`
--

DROP TABLE IF EXISTS `LOG_WARNINGS_VW`;
/*!50001 DROP VIEW IF EXISTS `LOG_WARNINGS_VW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `LOG_WARNINGS_VW` (
  `LOG_TIME` tinyint NOT NULL,
  `SEVERITY` tinyint NOT NULL,
  `MESSAGE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `MONTHLY_USAGE_SUM_VW`
--

DROP TABLE IF EXISTS `MONTHLY_USAGE_SUM_VW`;
/*!50001 DROP VIEW IF EXISTS `MONTHLY_USAGE_SUM_VW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MONTHLY_USAGE_SUM_VW` (
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `idAccountingResourceType` tinyint NOT NULL,
  `resourceType` tinyint NOT NULL,
  `resourceUnits` tinyint NOT NULL,
  `idEnterprise` tinyint NOT NULL,
  `idVirtualDataCenter` tinyint NOT NULL,
  `enterpriseName` tinyint NOT NULL,
  `virtualDataCenter` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `accounting_event_detail`
--

DROP TABLE IF EXISTS `accounting_event_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_detail` (
  `idAccountingEvent` bigint(20) NOT NULL AUTO_INCREMENT,
  `startTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `idAccountingResourceType` tinyint(4) NOT NULL,
  `resourceType` int(20) NOT NULL,
  `resourceUnits` bigint(20) NOT NULL,
  `resourceName` int(20) NOT NULL,
  `idEnterprise` int(11) unsigned NOT NULL,
  `idVirtualDataCenter` int(11) unsigned DEFAULT NULL,
  `idVirtualApp` int(11) unsigned DEFAULT NULL,
  `idVirtualMachine` int(11) unsigned DEFAULT NULL,
  `costCode` int(4) DEFAULT NULL,
  `idStorageTier` int(10) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  `idDataCenter` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_detail`
--

LOCK TABLES `accounting_event_detail` WRITE;
/*!40000 ALTER TABLE `accounting_event_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_event_ips`
--

DROP TABLE IF EXISTS `accounting_event_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_ips` (
  `idIPsAccountingEvent` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idManagement` int(10) unsigned NOT NULL,
  `idEnterprise` int(10) unsigned NOT NULL,
  `idVirtualDataCenter` int(10) unsigned NOT NULL,
  `ip` varchar(20) NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `stopTime` timestamp NULL DEFAULT NULL,
  `consolidated` tinyint(1) NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  `idDataCenter` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idIPsAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_ips`
--

LOCK TABLES `accounting_event_ips` WRITE;
/*!40000 ALTER TABLE `accounting_event_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_event_pm`
--

DROP TABLE IF EXISTS `accounting_event_pm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_pm` (
  `idPMAccountingEvent` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPhysicalMachine` int(10) unsigned NOT NULL,
  `idEnterprise` int(10) unsigned NOT NULL,
  `cpu` int(10) unsigned NOT NULL,
  `ram` int(10) unsigned NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `stopTime` timestamp NULL DEFAULT NULL,
  `idDataCenter` int(10) unsigned DEFAULT NULL,
  `consolidated` tinyint(1) NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idPMAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_pm`
--

LOCK TABLES `accounting_event_pm` WRITE;
/*!40000 ALTER TABLE `accounting_event_pm` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_pm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_event_repository`
--

DROP TABLE IF EXISTS `accounting_event_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_repository` (
  `idRepoAccountingEvent` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `idImage` int(10) unsigned NOT NULL,
  `idEnterprise` int(10) unsigned NOT NULL,
  `idImageTypeName` int(10) unsigned NOT NULL,
  `idImageFormatName` int(10) unsigned NOT NULL,
  `imageSize` bigint(20) unsigned NOT NULL,
  `idRepository` int(10) unsigned NOT NULL,
  `idRepositoryName` int(10) unsigned NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `stopTime` timestamp NULL DEFAULT NULL,
  `idDataCenter` int(10) unsigned DEFAULT NULL,
  `consolidated` tinyint(1) NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  PRIMARY KEY (`idRepoAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_repository`
--

LOCK TABLES `accounting_event_repository` WRITE;
/*!40000 ALTER TABLE `accounting_event_repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_event_storage`
--

DROP TABLE IF EXISTS `accounting_event_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_storage` (
  `idStorageAccountingEvent` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idResource` varchar(50) DEFAULT NULL,
  `resourceName` varchar(511) DEFAULT NULL,
  `idVM` int(10) unsigned DEFAULT NULL,
  `idStorageTier` int(10) unsigned DEFAULT NULL,
  `idEnterprise` int(10) unsigned NOT NULL,
  `idVirtualDataCenter` int(10) unsigned NOT NULL,
  `idVirtualApp` int(10) unsigned DEFAULT NULL,
  `sizeReserved` bigint(20) unsigned NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `stopTime` timestamp NULL DEFAULT NULL,
  `consolidated` tinyint(1) NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  `idDataCenter` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idStorageAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_storage`
--

LOCK TABLES `accounting_event_storage` WRITE;
/*!40000 ALTER TABLE `accounting_event_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_event_vlan`
--

DROP TABLE IF EXISTS `accounting_event_vlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_vlan` (
  `idVLANAccountingEvent` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vlan_network_id` int(10) unsigned NOT NULL,
  `idEnterprise` int(10) unsigned NOT NULL,
  `idVirtualDataCenter` int(10) unsigned NOT NULL,
  `network_name` varchar(40) NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `stopTime` timestamp NULL DEFAULT NULL,
  `consolidated` tinyint(1) NOT NULL DEFAULT '0',
  `version_c` int(11) DEFAULT '0',
  `idDataCenter` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idVLANAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_vlan`
--

LOCK TABLES `accounting_event_vlan` WRITE;
/*!40000 ALTER TABLE `accounting_event_vlan` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_vlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_event_vm`
--

DROP TABLE IF EXISTS `accounting_event_vm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_event_vm` (
  `idVMAccountingEvent` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idVM` int(10) unsigned NOT NULL,
  `idEnterprise` int(10) unsigned NOT NULL,
  `idVirtualDataCenter` int(10) unsigned NOT NULL,
  `idVirtualApp` int(10) unsigned NOT NULL,
  `cpu` int(10) unsigned NOT NULL,
  `ram` int(10) unsigned NOT NULL,
  `hd` bigint(20) unsigned NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `stopTime` timestamp NULL DEFAULT NULL,
  `consolidated` tinyint(1) NOT NULL DEFAULT '0',
  `costCode` int(11) DEFAULT NULL,
  `hypervisorType` varchar(255) DEFAULT NULL,
  `version_c` int(11) DEFAULT '0',
  `idDataCenter` int(10) unsigned DEFAULT NULL,
  `haEnabled` tinyint(1) unsigned DEFAULT NULL,
  `antiAffinity` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`idVMAccountingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_event_vm`
--

LOCK TABLES `accounting_event_vm` WRITE;
/*!40000 ALTER TABLE `accounting_event_vm` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_event_vm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_parameters`
--

DROP TABLE IF EXISTS `accounting_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_parameters` (
  `idParam` int(5) NOT NULL AUTO_INCREMENT,
  `paramName` varchar(64) NOT NULL,
  `paramValue` varchar(511) NOT NULL,
  PRIMARY KEY (`idParam`),
  UNIQUE KEY `unique_param` (`paramName`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_parameters`
--

LOCK TABLES `accounting_parameters` WRITE;
/*!40000 ALTER TABLE `accounting_parameters` DISABLE KEYS */;
INSERT INTO `accounting_parameters` VALUES (1,'AccountingEnabled','1'),(2,'DeleteRegEventsUseSPParam','0'),(3,'DeleteRegEventsDeleteHours','26280'),(4,'MaximumPeriodsToFirstInit','1'),(5,'MaximumPeriodsToProcess','24'),(6,'AccountPeriodSize','HOUR'),(7,'AccountPeriodGranularity','HOUR'),(8,'LoggingLevel','INFO'),(9,'VirtualMachine-vcpu','1'),(10,'VirtualMachine-vram','1'),(11,'VirtualMachine-vhd','1'),(12,'ExternalStorage','1'),(13,'IPAddress','1'),(14,'VLAN','1'),(15,'VirtualMachine-hypervisorType','1'),(16,'VirtualMachine-haHosted','0'),(17,'ReservedPhysicalMachine-cpu','0'),(18,'ReservedPhysicalMachine-ram','0'),(19,'RepositoryStorage','0'),(20,'VirtualMachine-antiAffinity','0');
/*!40000 ALTER TABLE `accounting_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `idLog` int(16) NOT NULL AUTO_INCREMENT,
  `logTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logLevel` int(11) NOT NULL,
  `messageNum` int(11) DEFAULT NULL,
  `message` varchar(1024) NOT NULL,
  PRIMARY KEY (`idLog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cc_name`
--

DROP TABLE IF EXISTS `cc_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc_name` (
  `idCostCode` bigint(20) NOT NULL,
  `ccName` varchar(255) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idCostCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cc_name`
--

LOCK TABLES `cc_name` WRITE;
/*!40000 ALTER TABLE `cc_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc_name`
--

DROP TABLE IF EXISTS `dc_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc_name` (
  `idDataCenter` bigint(20) NOT NULL,
  `dcName` varchar(255) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idDataCenter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc_name`
--

LOCK TABLES `dc_name` WRITE;
/*!40000 ALTER TABLE `dc_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `dc_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ent_name`
--

DROP TABLE IF EXISTS `ent_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_name` (
  `idEnterprise` int(10) NOT NULL,
  `enterpriseName` varchar(40) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idEnterprise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_name`
--

LOCK TABLES `ent_name` WRITE;
/*!40000 ALTER TABLE `ent_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `ent_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img_name`
--

DROP TABLE IF EXISTS `img_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img_name` (
  `idImg` bigint(20) NOT NULL,
  `imgName` varchar(255) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idImg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img_name`
--

LOCK TABLES `img_name` WRITE;
/*!40000 ALTER TABLE `img_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `img_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_name`
--

DROP TABLE IF EXISTS `object_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_name` (
  `idObject` int(16) NOT NULL AUTO_INCREMENT,
  `objectName` varchar(511) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idObject`),
  KEY `obj_name_idx` (`objectName`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_name`
--

LOCK TABLES `object_name` WRITE;
/*!40000 ALTER TABLE `object_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_name`
--

DROP TABLE IF EXISTS `pm_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_name` (
  `idPM` bigint(20) NOT NULL,
  `pmName` varchar(255) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idPM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_name`
--

LOCK TABLES `pm_name` WRITE;
/*!40000 ALTER TABLE `pm_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vapp_name`
--

DROP TABLE IF EXISTS `vapp_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vapp_name` (
  `idVirtualApp` int(10) NOT NULL,
  `vappName` varchar(40) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idVirtualApp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vapp_name`
--

LOCK TABLES `vapp_name` WRITE;
/*!40000 ALTER TABLE `vapp_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `vapp_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vdc_name`
--

DROP TABLE IF EXISTS `vdc_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vdc_name` (
  `idVirtualDataCenter` int(10) NOT NULL,
  `vdcName` varchar(40) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idVirtualDataCenter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vdc_name`
--

LOCK TABLES `vdc_name` WRITE;
/*!40000 ALTER TABLE `vdc_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `vdc_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vm_name`
--

DROP TABLE IF EXISTS `vm_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vm_name` (
  `idVM` bigint(20) NOT NULL,
  `vmName` varchar(255) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idVM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_name`
--

LOCK TABLES `vm_name` WRITE;
/*!40000 ALTER TABLE `vm_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `vm_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'kinton_accounting'
--
/*!50003 DROP FUNCTION IF EXISTS `ABQ_ADD_COSTCODE_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_ADD_COSTCODE_NAME`(id INT(10), iName VARCHAR(255)) RETURNS int(11)
    DETERMINISTIC
BEGIN
        DECLARE nameInDB VARCHAR(255);
        IF id IS NOT NULL THEN
            SELECT ccName INTO nameInDB FROM kinton_accounting.cc_name WHERE idCostCode=id;
            IF nameInDB IS NULL THEN
                INSERT INTO kinton_accounting.cc_name (idCostCode, ccName, startTime) VALUES (id, iName, now());
            END IF;
        END IF;
        IF nameInDB <> iName THEN
            UPDATE kinton_accounting.cc_name SET ccName=iName WHERE idCostCode=id;
        END IF;
        RETURN id;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_ADD_DC_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_ADD_DC_NAME`(id INT(10), vName VARCHAR(40)) RETURNS int(11)
    DETERMINISTIC
BEGIN
        DECLARE nameInDB VARCHAR(40);
        IF id IS NOT NULL THEN
            SELECT dcName INTO nameInDB FROM kinton_accounting.dc_name WHERE idDataCenter=id;
            IF nameInDB IS NULL THEN
                INSERT INTO kinton_accounting.dc_name (idDataCenter, dcName, startTime) VALUES (id, vName, now());
            END IF;
        END IF;
        IF nameInDB <> vName THEN
            UPDATE kinton_accounting.dc_name SET dcName=vName WHERE idDataCenter=id;
        END IF;
        RETURN id;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_ADD_ENT_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_ADD_ENT_NAME`(id INT(10), eName VARCHAR(40)) RETURNS int(11)
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_ADD_IMG_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_ADD_IMG_NAME`(id INT(10), iName VARCHAR(255)) RETURNS int(11)
    DETERMINISTIC
BEGIN
        DECLARE nameInDB VARCHAR(255);
        IF id IS NOT NULL THEN
            SELECT imgName INTO nameInDB FROM kinton_accounting.img_name WHERE idImg=id;
            IF nameInDB IS NULL THEN
                INSERT INTO kinton_accounting.img_name (idImg, imgName, startTime) VALUES (id, iName, now());
            END IF;
        END IF;
        IF nameInDB <> iName THEN
            UPDATE kinton_accounting.img_name SET imgName=iName WHERE idImg=id;
        END IF;
        RETURN id;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_ADD_PM_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_ADD_PM_NAME`(id INT(10), pName VARCHAR(255)) RETURNS int(11)
    DETERMINISTIC
BEGIN
        DECLARE nameInDB VARCHAR(255);
        IF id IS NOT NULL THEN
            SELECT pmName INTO nameInDB FROM kinton_accounting.pm_name WHERE idPM=id;
            IF nameInDB IS NULL THEN
                INSERT INTO kinton_accounting.pm_name (idPM, pmName, startTime) VALUES (id, pName, now());
            END IF;
        END IF;
        IF nameInDB <> pName THEN
            UPDATE kinton_accounting.pm_name SET pmName=pName WHERE idPM=id;
        END IF;
        RETURN id;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_ADD_VAPP_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_ADD_VAPP_NAME`(id INT(10), vName VARCHAR(40)) RETURNS int(11)
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_ADD_VDC_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_ADD_VDC_NAME`(id INT(10), vName VARCHAR(40)) RETURNS int(11)
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_ADD_VM_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_ADD_VM_NAME`(id INT(10), vName VARCHAR(255)) RETURNS int(11)
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_COSTCODE_ID_TO_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_COSTCODE_ID_TO_NAME`(id INT) RETURNS varchar(255) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE iName VARCHAR(255);
     SELECT ccName INTO iName FROM kinton_accounting.cc_name cc WHERE cc.idCostCode=id;
     RETURN iName;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_DC_ID_TO_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_DC_ID_TO_NAME`(id INT) RETURNS varchar(40) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE vName VARCHAR(40);
     SELECT dcName INTO vName FROM kinton_accounting.dc_name v WHERE v.idDataCenter=id;
     RETURN vName;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_ENT_ID_TO_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_ENT_ID_TO_NAME`(id INT) RETURNS varchar(40) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE entName VARCHAR(40);
     SELECT enterpriseName INTO entName FROM kinton_accounting.ent_name ent WHERE ent.idEnterprise=id;
     RETURN entName;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_GET_PARAMETER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_GET_PARAMETER`(pName VARCHAR(64)) RETURNS varchar(511) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE pValue VARCHAR(511);
     SELECT paramValue INTO pValue FROM kinton_accounting.accounting_parameters ap WHERE ap.paramName=pName;
     RETURN pValue;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_IMG_ID_TO_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_IMG_ID_TO_NAME`(id INT) RETURNS varchar(255) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE iName VARCHAR(255);
     SELECT imgName INTO iName FROM kinton_accounting.img_name im WHERE im.idImg=id;
     RETURN iName;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_OBJECT_ID_TO_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_OBJECT_ID_TO_NAME`(idObj INT) RETURNS varchar(511) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE objName VARCHAR(511);
     SELECT objectName INTO objName FROM kinton_accounting.object_name obj WHERE obj.idObject=idObj;
     RETURN objName;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_OBJECT_NAME_TO_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_OBJECT_NAME_TO_ID`(objName VARCHAR(511)) RETURNS int(11)
    DETERMINISTIC
BEGIN
     DECLARE id INT;
     SELECT idObject INTO id FROM kinton_accounting.object_name obj WHERE obj.objectName=objName;
     IF id IS NULL THEN
        INSERT INTO kinton_accounting.object_name (objectName, startTime) VALUES (objName, now());
        SELECT LAST_INSERT_ID() INTO id;
     END IF;
     RETURN id;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_PM_ID_TO_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_PM_ID_TO_NAME`(id INT) RETURNS varchar(255) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE pName VARCHAR(255);
     SELECT pmName INTO pName FROM kinton_accounting.pm_name pm WHERE pm.idPM=id;
     RETURN pName;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_VAPP_ID_TO_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_VAPP_ID_TO_NAME`(id INT) RETURNS varchar(40) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE vName VARCHAR(40);
     SELECT vappName INTO vName FROM kinton_accounting.vapp_name vapp WHERE vapp.idVirtualApp=id;
     RETURN vName;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_VDC_ID_TO_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_VDC_ID_TO_NAME`(id INT) RETURNS varchar(40) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE vName VARCHAR(40);
     SELECT vdcName INTO vName FROM kinton_accounting.vdc_name vdc WHERE vdc.idVirtualDataCenter=id;
     RETURN vName;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ABQ_VM_ID_TO_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `ABQ_VM_ID_TO_NAME`(id INT) RETURNS varchar(255) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE vName VARCHAR(255);
     SELECT vmName INTO vName FROM kinton_accounting.vm_name vm WHERE vm.idVM=id;
     RETURN vName;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `LOAD_CURRENT_LOG_LEVEL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `LOAD_CURRENT_LOG_LEVEL`() RETURNS varchar(10) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE currentLogLevelStr VARCHAR(10);
        SELECT UPPER(paramValue) INTO currentLogLevelStr FROM kinton_accounting.accounting_parameters WHERE paramName='LoggingLevel';
        IF (currentLogLevelStr IS NULL) OR
            ((currentLogLevelStr <> 'ERROR') AND (currentLogLevelStr <> 'WARN') AND 
             (currentLogLevelStr <> 'INFO') AND (currentLogLevelStr <> 'DETAIL') AND (currentLogLevelStr <> 'DEBUG')) THEN
            
            SET currentLogLevelStr='INFO';
        END IF;
     RETURN currentLogLevelStr;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `LOG_LEVEL_NUM_TO_STR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `LOG_LEVEL_NUM_TO_STR`(logLevelNum INT) RETURNS varchar(10) CHARSET utf8
    DETERMINISTIC
BEGIN
     DECLARE logLevelStr VARCHAR(10);
     SELECT CASE logLevelNum
                        WHEN 1 THEN 'ERROR'
                        WHEN 2 THEN 'WARN'
                        WHEN 3 THEN 'INFO' 
                        WHEN 4 THEN 'DETAIL' 
                        WHEN 5 THEN 'DEBUG'
                    END
        INTO logLevelStr;
     RETURN logLevelStr;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `LOG_LEVEL_STR_TO_NUM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `LOG_LEVEL_STR_TO_NUM`(logLevelStr VARCHAR(10)) RETURNS int(11)
    DETERMINISTIC
BEGIN
     DECLARE logLevel INT;
     SELECT CASE logLevelStr
                        WHEN 'ERROR' THEN   1
                        WHEN 'WARN' THEN    2
                        WHEN 'INFO' THEN    3 
                        WHEN 'DETAIL' THEN  4 
                        WHEN 'DEBUG' THEN   5
                    END
        INTO logLevel;
     RETURN logLevel;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ABQ_SET_PARAMETER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `ABQ_SET_PARAMETER`(IN pName VARCHAR(64), IN pValue VARCHAR(511))
BEGIN
     IF EXISTS(SELECT 1 FROM kinton_accounting.accounting_parameters ap WHERE ap.paramName=pName) THEN
        UPDATE kinton_accounting.accounting_parameters SET paramValue=pValue WHERE paramName=pName;
     ELSE
        INSERT INTO kinton_accounting.accounting_parameters (paramName,paramValue) VALUES(pName, pValue);
     END IF;
     CALL kinton_accounting.Log( LOAD_CURRENT_LOG_LEVEL(), 'INFO', NULL,
           CONCAT('Accounting parameter ', QUOTE(pName), ' has been assigned the value ', QUOTE(pValue)));      
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CUSTOM_GENERATE_ACCOUNTING_DATA_TEMPLATE_V1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `CUSTOM_GENERATE_ACCOUNTING_DATA_TEMPLATE_V1`(IN period_start TIMESTAMP, IN period_end TIMESTAMP, IN period_hours INTEGER, IN granularity_hours INTEGER)
BEGIN
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    CALL FLUSH_TMP_ACCOUNTING_EVENT_DETAIL();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DropTMPEventTables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `DropTMPEventTables`()
BEGIN
    DROP TEMPORARY TABLE kinton_accounting.tmp_vm_events_period;
    DROP TEMPORARY TABLE kinton_accounting.tmp_storage_events_period;
    DROP TEMPORARY TABLE kinton_accounting.tmp_ips_events_period;
    DROP TEMPORARY TABLE kinton_accounting.tmp_vlan_events_period;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AccountingIPsRegisterEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `AccountingIPsRegisterEvents`(
    IN action VARCHAR(15),
    IN idManagement INT(10) UNSIGNED,
    IN ipAddress VARCHAR(20),
    IN idThisVirtualDataCenter INT(10) UNSIGNED,
    IN idThisEnterprise INT(10) UNSIGNED)
BEGIN   
    DECLARE v_idDataCenter INT(10) UNSIGNED;
    DECLARE idDummy BIGINT; 

    
    
    IF action = "IP_RESERVED" THEN
        SELECT  dc.idDataCenter, ABQ_ADD_DC_NAME(dc.idDataCenter, dc.name)
                INTO v_idDataCenter , idDummy
        FROM    kinton.virtualdatacenter vdc, kinton.datacenter dc
        WHERE   vdc.idVirtualDataCenter=idThisVirtualDataCenter AND
                vdc.idDataCenter=dc.idDataCenter;

        SELECT  ABQ_ADD_ENT_NAME(e.idEnterprise, e.name), ABQ_ADD_VDC_NAME(vdc.idVirtualDataCenter, vdc.name)
                    INTO idDummy, idDummy
            FROM    kinton.virtualdatacenter vdc, kinton.enterprise e
            WHERE   vdc.idVirtualDataCenter=idThisVirtualDataCenter AND e.idEnterprise=vdc.idEnterprise;

        INSERT INTO accounting_event_ips (idManagement,idEnterprise,idVirtualDataCenter,ip,startTime,stopTime,idDataCenter)
            SELECT idManagement, idThisEnterprise, idThisVirtualDataCenter, ipAddress, now(), null, v_idDataCenter; 
    END IF;

    
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AccountingPMRegisterEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `AccountingPMRegisterEvents`(
    IN p_action VARCHAR(15),
    IN p_idPhysicalMachine INT(11) UNSIGNED,
    IN p_idDataCenter INT(10) UNSIGNED,
    IN p_name VARCHAR(256),
    IN p_cpu INT(11) UNSIGNED,
    IN p_ram INT(11) UNSIGNED,
    IN p_idEnterprise INT(10) UNSIGNED)
BEGIN   
    DECLARE idDummy BIGINT; 
 
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION CALL kinton_accounting.Log( LOAD_CURRENT_LOG_LEVEL(), 'ERROR', NULL,
                                    CONCAT('AccountingPMRegisterEvents() EXCEPTION during action ', QUOTE(p_action), ' for IMAGE ',QUOTE(p_name), ' id=', QUOTE(p_idPhysicalMachine)));

    
    
    
    IF p_action = "RESERVE_PM" THEN
        SELECT  ABQ_ADD_DC_NAME(dc.idDataCenter, dc.name), ABQ_ADD_PM_NAME(p_idPhysicalMachine, p_name)
                INTO idDummy, idDummy
            FROM    kinton.datacenter dc
            WHERE   dc.idDataCenter=p_idDataCenter;

        SELECT  ABQ_ADD_ENT_NAME(e.idEnterprise, e.name) INTO idDummy
            FROM    kinton.enterprise e
            WHERE   e.idEnterprise=p_idEnterprise;

        INSERT INTO accounting_event_pm (idPhysicalMachine, idEnterprise, cpu, ram, startTime, stopTime, idDataCenter) 
            SELECT p_idPhysicalMachine, p_idEnterprise, p_cpu, p_ram, NOW(), NULL, p_idDataCenter; 
    END IF;

    
    IF p_action = "UNRESERVE_PM" THEN  
        UPDATE accounting_event_pm SET stopTime=NOW()
            WHERE   accounting_event_pm.idPhysicalMachine = p_idPhysicalMachine AND
                    accounting_event_pm.stopTime IS NULL;
    END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerateAccountingPeriodData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `GenerateAccountingPeriodData`(IN period_start TIMESTAMP, IN period_secs INT(8) UNSIGNED)
BEGIN
    CALL GenerateAccountingPeriodDataExt(period_start,'HOUR','HOUR');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerateAccountingPeriodDataExt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `GenerateAccountingPeriodDataExt`(IN period_start TIMESTAMP, IN period_size VARCHAR(10), IN granularity VARCHAR(10))
BEGIN
    
    
    DECLARE period_end TIMESTAMP;
    DECLARE period_hours INTEGER;
    DECLARE granularity_hours INTEGER;
    DECLARE logLevelStr VARCHAR(10);
    DECLARE resourceEnabled TINYINT;

    SELECT kinton_accounting.LOAD_CURRENT_LOG_LEVEL() INTO logLevelStr;

    SELECT  CASE period_size
            WHEN 'HOUR' THEN TIMESTAMPADD(HOUR, 1, period_start)
            WHEN 'DAY' THEN TIMESTAMPADD(DAY, 1, period_start) 
            WHEN 'WEEK' THEN TIMESTAMPADD(WEEK, 1, period_start) 
            WHEN 'MONTH' THEN TIMESTAMPADD(MONTH, 1, period_start)
            ELSE  TIMESTAMPADD(HOUR, 1, period_start)
        END
        INTO period_end;

    SELECT  CASE period_size
            WHEN 'HOUR' THEN 1
            WHEN 'DAY' THEN 24 
            WHEN 'WEEK' THEN 168 
            WHEN 'MONTH' THEN (DAYOFMONTH(LAST_DAY(period_start)) * 24)
            ELSE  1
        END
        INTO period_hours;
    
    SELECT  CASE granularity
            WHEN 'HOUR' THEN 1
            WHEN 'DAY' THEN 24 
            WHEN 'WEEK' THEN 168 
            WHEN 'MONTH' THEN (DAYOFMONTH(LAST_DAY(period_start)) * 24)
            ELSE  1
        END
        INTO granularity_hours;

    SELECT COUNT(*) INTO @periodDataCount
        FROM `kinton_accounting`.`accounting_event_detail` 
        WHERE startTime=period_start AND endTime=period_end;

    IF ((@periodDataCount = 0) AND (NOW() > period_end)) THEN
        CALL kinton_accounting.Log( logLevelStr, 'INFO', NULL,
                CONCAT('Accounting about to start for period ', QUOTE(period_start), ', AccountPeriodSize=', QUOTE(period_size), ', AccountPeriodGranularity=', QUOTE(granularity)));      

        
        
        CREATE TEMPORARY TABLE kinton_accounting.tmp_accounting_event_detail (
          `idAccountingEvent` bigint(20) NOT NULL auto_increment,
          `startTime` timestamp NOT NULL default '0000-00-00 00:00:00',
          `endTime` timestamp NOT NULL default '0000-00-00 00:00:00',
          `idAccountingResourceType` tinyint(4) NOT NULL,
          `resourceType` int(20) NOT NULL,
          `resourceUnits` bigint(20) NOT NULL,
          `resourceName` int(20) NOT NULL,
          `idEnterprise` int(11) unsigned NOT NULL,
          `idVirtualDataCenter` int(11) unsigned NULL,
          `idVirtualApp` int(11) unsigned default NULL,
          `idVirtualMachine` int(11) unsigned default NULL,
          `costCode` int(4) default NULL,
          `idStorageTier` int(10) default NULL,
          `version_c` int(11) default '0',
          `idDataCenter` int(11) default NULL,
          PRIMARY KEY  (`idAccountingEvent`)
        ) ENGINE=InnoDB
        AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

        
        
        CALL kinton_accounting.CreateTMPEventTables();
        CALL kinton_accounting.PopulateTMPEventTables(period_start, period_end);

        SELECT ABQ_GET_PARAMETER('VirtualMachine-vcpu') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
            
            
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
              `idStorageTier`,
              `idDataCenter`)
            SELECT DISTINCT
                  T.`PERIOD_START`,
                  T.`PERIOD_END`,
                  1,
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID('VirtualMachine-vcpu'),
                  T.cpu * (period_hours/granularity_hours),
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.`VIRTUAL_MACHINE`),
                  kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
                  kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
                  kinton_accounting.ABQ_ADD_VAPP_NAME(T.`idVirtualApp`, T.`VIRTUAL_APP`),
                  kinton_accounting.ABQ_ADD_VM_NAME(T.`idVM`, T.`VIRTUAL_MACHINE`),
                  T.`costCode`,
                  NULL,
                  T.`idDataCenter`
            FROM kinton_accounting.tmp_vm_events_period T;
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''VirtualMachine-vcpu'' resources is disabled');
        END IF;

        SELECT ABQ_GET_PARAMETER('VirtualMachine-vram') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
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
              `idStorageTier`,
              `idDataCenter`)
            SELECT DISTINCT
                  T.`PERIOD_START`,
                  T.`PERIOD_END`,
                  2,
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID('VirtualMachine-vram'),
                  T.`ram` * (period_hours/granularity_hours),
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.`VIRTUAL_MACHINE`),
                  kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
                  kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
                  kinton_accounting.ABQ_ADD_VAPP_NAME(T.`idVirtualApp`, T.`VIRTUAL_APP`),
                  kinton_accounting.ABQ_ADD_VM_NAME(T.`idVM`, T.`VIRTUAL_MACHINE`),
                  NULL,
                  NULL,
                  T.`idDataCenter`
            FROM kinton_accounting.tmp_vm_events_period T;
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''VirtualMachine-vram'' resources is disabled');
        END IF;

        SELECT ABQ_GET_PARAMETER('VirtualMachine-vhd') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
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
              `idStorageTier`,
              `idDataCenter`)
            SELECT DISTINCT
                  T.`PERIOD_START`,
                  T.`PERIOD_END`,
                  3,
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID('VirtualMachine-vhd'),
                  T.`hd` * (period_hours/granularity_hours),
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.`VIRTUAL_MACHINE`),
                  kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
                  kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
                  kinton_accounting.ABQ_ADD_VAPP_NAME(T.`idVirtualApp`, T.`VIRTUAL_APP`),
                  kinton_accounting.ABQ_ADD_VM_NAME(T.`idVM`, T.`VIRTUAL_MACHINE`),
                  NULL,
                  NULL,
                  T.`idDataCenter`
            FROM kinton_accounting.tmp_vm_events_period T;
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''VirtualMachine-vhd'' resources is disabled');
        END IF;

        
        SELECT ABQ_GET_PARAMETER('ExternalStorage') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
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
              `idStorageTier`,
              `idDataCenter`)
            SELECT DISTINCT
                  T.`PERIOD_START`,
                  T.`PERIOD_END`,
                  4,
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID('ExternalStorage'),
                  T.`sizeReserved` * (period_hours/granularity_hours),
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID(CONCAT(IF (T.`resourceName` IS NULL, '', T.`resourceName`), ' - ', T.`idResource`)),
                  kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
                  kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
                  NULL,
                  NULL, 
                  NULL,
                  T.`idStorageTier`,
                  T.`idDataCenter`
            FROM kinton_accounting.tmp_storage_events_period T;
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''ExternalStorage'' resources is disabled');
        END IF;

        
        SELECT ABQ_GET_PARAMETER('IPAddress') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
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
              `idStorageTier`,
              `idDataCenter`)
            SELECT DISTINCT
                  T.`PERIOD_START`,
                  T.`PERIOD_END`,
                  5,
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID('IPAddress'),
                  1 * (period_hours/granularity_hours),
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.`ip`),
                  kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
                  kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
                  NULL,
                  NULL, 
                  NULL,
                  NULL,
                  T.`idDataCenter`
            FROM kinton_accounting.tmp_ips_events_period T;
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''IPAddress'' resources is disabled');
        END IF;

        
        SELECT ABQ_GET_PARAMETER('VLAN') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
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
              `idStorageTier`,
              `idDataCenter`)
            SELECT DISTINCT
                  T.`PERIOD_START`,
                  T.`PERIOD_END`,
                  6,
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID('VLAN'),
                  1 * (period_hours/granularity_hours),
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.`networkName`),
                  kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
                  kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
                  NULL,
                  NULL, 
                  NULL,
                  NULL,
                  T.`idDataCenter`
            FROM kinton_accounting.tmp_vlan_events_period T;
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''VLAN'' resources is disabled');
        END IF;

        
        SELECT ABQ_GET_PARAMETER('VirtualMachine-hypervisorType') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
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
              `idStorageTier`,
              `idDataCenter`)
            SELECT DISTINCT
                  T.`PERIOD_START`,
                  T.`PERIOD_END`,
                  7,
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID('VirtualMachine-hypervisorType'),
                  1 * (period_hours/granularity_hours),
                  kinton_accounting.ABQ_OBJECT_NAME_TO_ID(T.hypervisorType),
                  kinton_accounting.ABQ_ADD_ENT_NAME(T.`idEnterprise`, T.`VIRTUAL_ENTERPRISE`),
                  kinton_accounting.ABQ_ADD_VDC_NAME(T.`idVirtualDataCenter`, T.`VIRTUAL_DATACENTER`),
                  kinton_accounting.ABQ_ADD_VAPP_NAME(T.`idVirtualApp`, T.`VIRTUAL_APP`),
                  kinton_accounting.ABQ_ADD_VM_NAME(T.`idVM`, T.`VIRTUAL_MACHINE`),
                  NULL,
                  NULL,
                  T.`idDataCenter`
            FROM kinton_accounting.tmp_vm_events_period T;
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''VirtualMachine-hypervisorType'' resources is disabled');
        END IF;

        
        SELECT ABQ_GET_PARAMETER('VirtualMachine-haHosted') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
            INSERT INTO kinton_accounting.tmp_accounting_event_detail(
            startTime,
            endTime, 
            idAccountingResourceType,
            resourceType,
            resourceUnits,
            resourceName, 
            idEnterprise, 
            idVirtualDataCenter, 
            idVirtualApp, 
            idVirtualMachine, 
            costCode,
            idStorageTier,
            idDataCenter)
            SELECT DISTINCT
                period_start,
                period_end,
                8,
                ABQ_OBJECT_NAME_TO_ID('VirtualMachine-haHosted'),
                1 * (period_hours/granularity_hours),
                ABQ_OBJECT_NAME_TO_ID(ABQ_VM_ID_TO_NAME(acc_vm.idVM)),
                acc_vm.idEnterprise,
                acc_vm.idVirtualDataCenter, 
                acc_vm.idVirtualApp, 
                acc_vm.idVM,
                NULL,
                NULL,
                acc_vm.idDataCenter
            FROM accounting_event_vm acc_vm
            WHERE
                
                ((acc_vm.startTime <= period_end AND 
                 (acc_vm.stopTime IS NULL OR acc_vm.stopTime >= period_end)) OR
                
                ((acc_vm.stopTime >= period_start) AND (acc_vm.stopTime < period_end))) AND
                acc_vm.haEnabled=1;
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''VirtualMachine-haHosted'' resources is disabled');
        END IF;

        SELECT ABQ_GET_PARAMETER('ReservedPhysicalMachine-cpu') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
            
            INSERT INTO kinton_accounting.tmp_accounting_event_detail(
            startTime,
            endTime, 
            idAccountingResourceType,
            resourceType,
            resourceUnits,
            resourceName, 
            idEnterprise, 
            idVirtualDataCenter, 
            idVirtualApp, 
            idVirtualMachine, 
            costCode,
            idStorageTier,
            idDataCenter)
            SELECT DISTINCT
                period_start,
                period_end,
                9,
                ABQ_OBJECT_NAME_TO_ID('ReservedPhysicalMachine-cpu'),
                acc_pm.cpu * (period_hours/granularity_hours),
                ABQ_OBJECT_NAME_TO_ID(ABQ_PM_ID_TO_NAME(acc_pm.idPhysicalMachine)),
                acc_pm.idEnterprise,
                NULL, 
                NULL, 
                NULL,
                NULL,
                NULL,
                acc_pm.idDataCenter
            FROM accounting_event_pm acc_pm
            WHERE
                
                ((acc_pm.startTime <= period_end AND 
                 (acc_pm.stopTime IS NULL OR acc_pm.stopTime >= period_end)) OR
                
                ((acc_pm.stopTime >= period_start) AND (acc_pm.stopTime < period_end)));
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''ReservedPhysicalMachine-cpu'' resources is disabled');
        END IF;

        
        SELECT ABQ_GET_PARAMETER('ReservedPhysicalMachine-ram') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
            INSERT INTO kinton_accounting.tmp_accounting_event_detail(
            startTime,
            endTime, 
            idAccountingResourceType,
            resourceType,
            resourceUnits,
            resourceName, 
            idEnterprise, 
            idVirtualDataCenter, 
            idVirtualApp, 
            idVirtualMachine, 
            costCode,
            idStorageTier,
            idDataCenter)
            SELECT DISTINCT
                period_start,
                period_end,
                10,
                ABQ_OBJECT_NAME_TO_ID('ReservedPhysicalMachine-ram'),
                acc_pm.ram * (period_hours/granularity_hours),
                ABQ_OBJECT_NAME_TO_ID(ABQ_PM_ID_TO_NAME(acc_pm.idPhysicalMachine)),
                acc_pm.idEnterprise,
                NULL, 
                NULL, 
                NULL,
                NULL,
                NULL,
                acc_pm.idDataCenter
            FROM accounting_event_pm acc_pm
            WHERE
                
                ((acc_pm.startTime <= period_end AND 
                 (acc_pm.stopTime IS NULL OR acc_pm.stopTime >= period_end)) OR
                
                ((acc_pm.stopTime >= period_start) AND (acc_pm.stopTime < period_end)));
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''ReservedPhysicalMachine-ram'' resources is disabled');
        END IF;

        
        SELECT ABQ_GET_PARAMETER('RepositoryStorage') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
            INSERT INTO kinton_accounting.tmp_accounting_event_detail(
            startTime,
            endTime, 
            idAccountingResourceType,
            resourceType,
            resourceUnits,
            resourceName, 
            idEnterprise, 
            idVirtualDataCenter, 
            idVirtualApp, 
            idVirtualMachine, 
            costCode,
            idStorageTier,
            idDataCenter)
            SELECT DISTINCT
                period_start,
                period_end,
                11,
                ABQ_OBJECT_NAME_TO_ID('RepositoryStorage'),
                acc_rep.imageSize * (period_hours/granularity_hours),
                ABQ_OBJECT_NAME_TO_ID(CONCAT(ABQ_IMG_ID_TO_NAME(acc_rep.idImage),'-', acc_rep.idImage, '-', ABQ_OBJECT_ID_TO_NAME(acc_rep.idImageTypeName),
                                                '(', ABQ_OBJECT_ID_TO_NAME(acc_rep.idImageFormatName), ')')),
                acc_rep.idEnterprise,
                NULL, 
                NULL, 
                NULL,
                NULL,
                NULL,
                acc_rep.idDataCenter
            FROM accounting_event_repository acc_rep
            WHERE
                
                ((acc_rep.startTime <= period_end AND 
                 (acc_rep.stopTime IS NULL OR acc_rep.stopTime >= period_end)) OR
                
                ((acc_rep.stopTime >= period_start) AND (acc_rep.stopTime < period_end)))
                AND idImageTypeName IN (ABQ_OBJECT_NAME_TO_ID('TEMPLATE'),
                                        ABQ_OBJECT_NAME_TO_ID('INSTANCE')
                                        
                                        
                                        
                                        );
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''RepositoryStorage'' resources is disabled');
        END IF;

        
        SELECT ABQ_GET_PARAMETER('VirtualMachine-antiAffinity') INTO resourceEnabled;
        IF (resourceEnabled IS NOT NULL) AND (resourceEnabled <> 0) THEN 
            INSERT INTO kinton_accounting.tmp_accounting_event_detail(
            startTime,
            endTime, 
            idAccountingResourceType,
            resourceType,
            resourceUnits,
            resourceName, 
            idEnterprise, 
            idVirtualDataCenter, 
            idVirtualApp, 
            idVirtualMachine, 
            costCode,
            idStorageTier,
            idDataCenter)
            SELECT DISTINCT
                period_start,
                period_end,
                12,
                ABQ_OBJECT_NAME_TO_ID('VirtualMachine-antiAffinity'),
                1 * (period_hours/granularity_hours),
                ABQ_OBJECT_NAME_TO_ID(ABQ_VM_ID_TO_NAME(acc_vm.idVM)),
                acc_vm.idEnterprise,
                acc_vm.idVirtualDataCenter, 
                acc_vm.idVirtualApp, 
                acc_vm.idVM,
                NULL,
                NULL,
                acc_vm.idDataCenter
            FROM accounting_event_vm acc_vm
            WHERE
                
                ((acc_vm.startTime <= period_end AND 
                 (acc_vm.stopTime IS NULL OR acc_vm.stopTime >= period_end)) OR
                
                ((acc_vm.stopTime >= period_start) AND (acc_vm.stopTime < period_end))) AND
                acc_vm.antiAffinity=1;
        ELSE
            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'Accounting of ''VirtualMachine-antiAffinity'' resources is disabled');
        END IF;

        
        
        CALL FLUSH_TMP_ACCOUNTING_EVENT_DETAIL();

        CALL kinton_accounting.Log( logLevelStr, 'INFO', NULL,
                CONCAT('Completed core processing accounting period ', QUOTE(period_start), ', rows added: ', ROW_COUNT()));      

        
        IF EXISTS(SELECT * FROM `information_schema`.ROUTINES WHERE ROUTINE_SCHEMA='kinton_accounting' AND ROUTINE_TYPE='PROCEDURE' AND ROUTINE_NAME='CUSTOM_GENERATE_ACCOUNTING_DATA_V1') THEN
        BEGIN
            DECLARE CONTINUE HANDLER FOR SQLEXCEPTION CALL kinton_accounting.Log( logLevelStr, 'ERROR', NULL, CONCAT('Exception detected generating CUSTOM accounting data'));

            CALL kinton_accounting.Log( logLevelStr, 'DETAIL', NULL, 'About to call the configured CUSTOM account data procedure'); 
            
            DELETE FROM kinton_accounting.tmp_accounting_event_detail;

            CALL CUSTOM_GENERATE_ACCOUNTING_DATA_V1(period_start, period_end, period_hours, granularity_hours);
            CALL kinton_accounting.Log( logLevelStr, 'INFO', NULL, CONCAT('CUSTOM accounting processing completed for period ', QUOTE(period_start), ', rows added: ', ROW_COUNT()));
        END;
        END IF;

        
        CALL kinton_accounting.DropTMPEventTables();
        DROP TEMPORARY TABLE kinton_accounting.`tmp_accounting_event_detail`;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `Log`(IN currentLogLevelStr VARCHAR(10), IN logMsgLevelStr VARCHAR(10), IN msgNum INT, IN msg VARCHAR(1024))
BEGIN
    DECLARE currentLogLevel INTEGER;
    DECLARE logMsgLevel INTEGER;

    IF (currentLogLevelStr IS NULL) THEN
        
        SELECT LOAD_CURRENT_LOG_LEVEL() INTO currentLogLevelStr;
    END IF;

    
    SELECT LOG_LEVEL_STR_TO_NUM(currentLogLevelSTR) INTO currentLogLevel;
    SELECT LOG_LEVEL_STR_TO_NUM(logMsgLevelStr) INTO logMsgLevel;

    
    IF (logMsgLevel <= currentLogLevel) THEN
        
        INSERT IGNORE INTO kinton_accounting.activity_log (logLevel, messageNum, message) VALUES(logMsgLevel, msgNum, msg);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AccountingRepositoryRegisterEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `AccountingRepositoryRegisterEvents`(
    IN p_action VARCHAR(15),
    IN p_idImage INT(11) UNSIGNED,
    IN p_idRepository INT(11) UNSIGNED,
    IN p_imageName VARCHAR(255),
    IN p_imageFormat VARCHAR(50),
    IN p_imageType VARCHAR(50),
    IN p_imageSize BIGINT UNSIGNED,
    IN p_idEnterprise INT(10) UNSIGNED)
BEGIN   
    DECLARE idDummy BIGINT; 
    DECLARE v_idImageFormatName INT; 
    DECLARE v_idImageTypeName INT; 
    DECLARE v_idRepoName INT; 
    DECLARE v_idDataCenter INT; 

    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION CALL kinton_accounting.Log( LOAD_CURRENT_LOG_LEVEL(), 'ERROR', NULL,
                                    CONCAT('AccountingRepositoryRegisterEvents() EXCEPTION during action ', QUOTE(p_action), ' for IMAGE ',QUOTE(p_imageName), ' id=', QUOTE(p_idImage)));

    
    
    
    IF p_action = "ADD_IMAGE" THEN
        
        SELECT  ABQ_ADD_ENT_NAME(e.idEnterprise, e.name),
                ABQ_ADD_DC_NAME(dc.idDataCenter, dc.name),
                ABQ_ADD_IMG_NAME(p_idImage, p_imageName),
                ABQ_OBJECT_NAME_TO_ID(p_imageFormat),
                ABQ_OBJECT_NAME_TO_ID(p_imageType),
                ABQ_OBJECT_NAME_TO_ID(r.name),
                dc.idDataCenter
            INTO    idDummy, idDummy, idDummy,
                    v_idImageFormatName, v_idImageTypeName, v_idRepoName, v_idDataCenter
            FROM    kinton.datacenter dc,
                    kinton.repository r,
                    kinton.virtualimage vi,
                    kinton.enterprise e
            WHERE   dc.idDataCenter=r.idDataCenter AND
                    r.idRepository=vi.idRepository AND
                    vi.idEnterprise=e.idEnterprise AND
                    vi.idImage=p_idImage;

        INSERT INTO accounting_event_repository(idImage, idEnterprise, idImageTypeName, idImageFormatName, idRepository, idRepositoryName, imageSize, startTime, stopTime, idDataCenter) 
            SELECT p_idImage, p_idEnterprise, v_idImageTypeName, v_idImageFormatName, p_idRepository, v_idRepoName, p_imageSize, NOW(), NULL, v_idDataCenter; 
    END IF;

    
    IF p_action = "UPDATE_IMAGE" THEN
        
        SELECT ABQ_ADD_IMG_NAME(p_idImage, p_imageName) INTO idDummy;
    END IF; 

    
    
    IF p_action = "DELETE_IMAGE" THEN  
        UPDATE accounting_event_repository SET stopTime=NOW()
            WHERE   accounting_event_repository.idImage = p_idImage AND
                    accounting_event_repository.stopTime IS NULL;
    END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AccountingStorageRegisterEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `AccountingStorageRegisterEvents`(
    IN action VARCHAR(15),
    IN idThisResource VARCHAR(50),
    IN thisResourceName VARCHAR(255),
    IN idStorageTier INT(10) UNSIGNED,
    IN idThisVirtualDataCenter INT(10) UNSIGNED,
    IN idThisEnterprise INT(10) UNSIGNED,  
    IN sizeReserved BIGINT(20))
BEGIN   
    DECLARE v_idDataCenter INT(10) UNSIGNED;
    DECLARE idDummy BIGINT; 

    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION CALL kinton_accounting.Log( LOAD_CURRENT_LOG_LEVEL(), 'ERROR', NULL,
                                    CONCAT('AccountingStorageRegisterEvents() EXCEPTION during action ', QUOTE(action), ' for resource ',QUOTE(thisResourceName), ' id=', QUOTE(idThisResource)));

    
    IF action = "CREATE_STORAGE" THEN
        SELECT  dc.idDataCenter, ABQ_ADD_DC_NAME(dc.idDataCenter, dc.name)
                INTO v_idDataCenter, idDummy
        FROM    kinton.virtualdatacenter vdc, kinton.datacenter dc
        WHERE   vdc.idVirtualDataCenter=idThisVirtualDataCenter AND
                vdc.idDataCenter=dc.idDataCenter;

        SELECT  ABQ_ADD_ENT_NAME(e.idEnterprise, e.name), ABQ_ADD_VDC_NAME(vdc.idVirtualDataCenter, vdc.name)
                    INTO idDummy, idDummy
            FROM    kinton.virtualdatacenter vdc, kinton.enterprise e
            WHERE   vdc.idVirtualDataCenter=idThisVirtualDataCenter AND e.idEnterprise=vdc.idEnterprise;

        INSERT INTO accounting_event_storage (idResource, resourceName, idStorageTier, idVM,idEnterprise,idVirtualDataCenter,idVirtualApp,sizeReserved,startTime, stopTime,idDataCenter)
            SELECT idThisResource, thisResourceName, idStorageTier, null, idThisEnterprise, idThisVirtualDataCenter, null, sizeReserved * 1048576, now(), null, v_idDataCenter; 
    END IF;

    
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

    
    IF action = "UPDATE_STORAGE" THEN   
        UPDATE
          accounting_event_storage
        SET
          stopTime=now()
        WHERE
          accounting_event_storage.idResource = idThisResource
          AND
          accounting_event_storage.stopTime is null;

        SELECT  dc.idDataCenter
                INTO v_idDataCenter
        FROM    kinton.virtualdatacenter vdc, kinton.datacenter dc
        WHERE   vdc.idVirtualDataCenter=idThisVirtualDataCenter AND
                vdc.idDataCenter=dc.idDataCenter;

        INSERT INTO accounting_event_storage (idResource, resourceName, idStorageTier, idVM,idEnterprise,idVirtualDataCenter,idVirtualApp,sizeReserved,startTime, stopTime, idDataCenter)
            SELECT idThisResource,thisResourceName, idStorageTier, null, idThisEnterprise, idThisVirtualDataCenter, null, sizeReserved * 1048576, now(), null, v_idDataCenter; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AccountingUsageLogReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `AccountingUsageLogReport`(  IN period_start TIMESTAMP, IN period_end TIMESTAMP,
                                                                IN idEnterprise INTEGER)
BEGIN
        
        
        CALL kinton_accounting.CreateTMPEventTables();
        CALL kinton_accounting.PopulateTMPEventTables(period_start, period_end);

        SELECT * FROM

        (SELECT  VIRTUAL_ENTERPRISE,
                VIRTUAL_DATACENTER,
                VIRTUAL_APP,
                vm.startTime, vm.stopTime,
                CONCAT( 'VM(CPU=', QUOTE(cpu), 'RAM=',QUOTE(ram), 'MB, STORAGE=',QUOTE(hd/(1048574*1024)), 
                        'GB, CostCode=', QUOTE(cc.ccName), ', Hypervisor=', QUOTE(hypervisorType),  ', HA=',QUOTE(haEnabled), ')') AS ACCOUNTING_RESOURCE,
                VIRTUAL_MACHINE AS RESOURCE_NAME
        FROM tmp_vm_events_period vm
             LEFT JOIN kinton_accounting.cc_name cc ON (cc.idCostCode=vm.costCode)
        WHERE vm.idEnterprise=idEnterprise) aa
        
        UNION ALL
        
        (SELECT VIRTUAL_ENTERPRISE,
                VIRTUAL_DATACENTER,
                NULL AS VIRTUAL_APP,
                startTime, stopTime,
                CONCAT( 'STORAGE(Tier=', QUOTE(st.name), ', Size=', QUOTE(stor.sizeReserved/(1048576*1024)), 'GB)') AS ACCOUNTING_RESOURCE,
                stor.resourceName AS RESOURCE_NAME
        FROM tmp_storage_events_period stor
             LEFT JOIN kinton.tier st ON (st.id=stor.idStorageTier)
        WHERE stor.idEnterprise=idEnterprise) 
        
        UNION ALL

        (SELECT VIRTUAL_ENTERPRISE,
                VIRTUAL_DATACENTER,
                NULL AS VIRTUAL_APP,
                startTime, stopTime,
                CONCAT( 'VLAN') AS ACCOUNTING_RESOURCE,
                vl.networkName AS RESOURCE_NAME
        FROM tmp_vlan_events_period vl
        WHERE vl.idEnterprise=idEnterprise)

        UNION ALL
        
        (SELECT VIRTUAL_ENTERPRISE,
                VIRTUAL_DATACENTER,
                NULL AS VIRTUAL_APP,
                startTime, stopTime,
                CONCAT('IP') AS ACCOUNTING_RESOURCE,
                ip.ip AS RESOURCE_NAME
        FROM tmp_ips_events_period ip
        WHERE ip.idEnterprise=idEnterprise)

        UNION ALL 

        (SELECT DISTINCT
                ABQ_ENT_ID_TO_NAME(acc_pm.idEnterprise) AS VIRTUAL_ENTERPRISE,
                NULL AS VIRTUAL_APP,
                NULL AS VIRTUAL_DATACENTER,
                startTime,
                stopTime,
                CONCAT('RESERVED_SRV(CPU=', acc_pm.cpu,', RAM=', acc_pm.ram, 'MB)') AS ACCOUNTING_RESOURCE,
                ABQ_PM_ID_TO_NAME(acc_pm.idPhysicalMachine) AS RESOURCE_NAME
            FROM accounting_event_pm acc_pm
            WHERE
                acc_pm.idEnterprise=idEnterprise AND
                
                ((acc_pm.startTime <= period_end AND 
                 (acc_pm.stopTime IS NULL OR acc_pm.stopTime >= period_end)) OR
                
                ((acc_pm.stopTime >= period_start) AND (acc_pm.stopTime < period_end))))
        UNION ALL 

        (SELECT DISTINCT
                ABQ_ENT_ID_TO_NAME(acc_rep.idEnterprise) AS VIRTUAL_ENTERPRISE,
                NULL AS VIRTUAL_APP,
                NULL AS VIRTUAL_DATACENTER,
                startTime,
                stopTime,
                CONCAT('REPOSITORY(', ABQ_OBJECT_ID_TO_NAME(acc_rep.idImageTypeName), '-', ABQ_OBJECT_ID_TO_NAME(acc_rep.idImageFormatName), 
                        ' Size=', QUOTE(acc_rep.imageSize/(1048576*1024)), 'GB)') AS ACCOUNTING_RESOURCE,
                CONCAT(QUOTE(ABQ_IMG_ID_TO_NAME(acc_rep.idImage)),'(', ABQ_DC_ID_TO_NAME(acc_rep.idDataCenter), ')' ) AS RESOURCE_NAME
            FROM accounting_event_repository acc_rep
            WHERE
                acc_rep.idEnterprise=idEnterprise AND
                
                ((acc_rep.startTime <= period_end AND 
                 (acc_rep.stopTime IS NULL OR acc_rep.stopTime >= period_end)) OR
                
                ((acc_rep.stopTime >= period_start) AND (acc_rep.stopTime < period_end))))

        ORDER BY VIRTUAL_ENTERPRISE, VIRTUAL_DATACENTER, VIRTUAL_APP, startTime;

        
        CALL kinton_accounting.DropTMPEventTables();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AccountingVLANRegisterEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `AccountingVLANRegisterEvents`(
    IN action VARCHAR(15),
    IN vlan_network_id INT(11) UNSIGNED,
    IN network_name VARCHAR(40),
    IN idThisVirtualDataCenter INT(10) UNSIGNED,
    IN idThisEnterprise INT(10) UNSIGNED)
BEGIN   
    DECLARE v_idDataCenter INT(10) UNSIGNED;
    DECLARE idDummy BIGINT; 

    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION CALL kinton_accounting.Log( LOAD_CURRENT_LOG_LEVEL(), 'ERROR', NULL,
                                    CONCAT('AccountingVLANRegisterEvents() EXCEPTION during action ', QUOTE(action), ' for vlan_network_id=', QUOTE(vlan_network_id)));

    
    
    
    IF action = "CREATE_VLAN" THEN
        SELECT  dc.idDataCenter, ABQ_ADD_DC_NAME(dc.idDataCenter, dc.name)
                INTO v_idDataCenter, idDummy
        FROM    kinton.virtualdatacenter vdc, kinton.datacenter dc
        WHERE   vdc.idVirtualDataCenter=idThisVirtualDataCenter AND
                vdc.idDataCenter=dc.idDataCenter;

        SELECT  ABQ_ADD_ENT_NAME(e.idEnterprise, e.name), ABQ_ADD_VDC_NAME(vdc.idVirtualDataCenter, vdc.name)
                    INTO idDummy, idDummy
            FROM    kinton.virtualdatacenter vdc, kinton.enterprise e
            WHERE   vdc.idVirtualDataCenter=idThisVirtualDataCenter AND e.idEnterprise=vdc.idEnterprise;

        INSERT INTO accounting_event_vlan (vlan_network_id,idEnterprise,idVirtualDataCenter,network_name,startTime,stopTime,idDataCenter) 
            SELECT vlan_network_id, idThisEnterprise, idThisVirtualDataCenter, network_name, now(), null, v_idDataCenter; 
    END IF;

    
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AccountingVMRegisterEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `AccountingVMRegisterEvents`(
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
    DECLARE v_idDataCenter INT(10) UNSIGNED;
    DECLARE v_haEnabled TINYINT(1);
    DECLARE v_antiAffinity TINYINT(1);
    DECLARE checkIfUpdated TINYINT(1);
    DECLARE idDummy BIGINT; 

    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION CALL kinton_accounting.Log( LOAD_CURRENT_LOG_LEVEL(), 'ERROR', NULL,
                                    CONCAT('AccountingVMRegisterEvents() EXCEPTION during state ', QUOTE(newState), ' for idVM=', QUOTE(idVirtualMachine)));

    SELECT 1 INTO checkIfUpdated; 

	
    IF idType = 1 AND (oldState != newState) THEN
    	
		IF (previousState = "NOT_ALLOCATED" AND newState IN ("ON","OFF","PAUSED")) OR
            (previousState = "UNKNOWN" AND newState IN ("ON","OFF","PAUSED")) THEN

            
            SELECT  pm.idDataCenter, r.haEnabled, ABQ_ADD_DC_NAME(d.idDataCenter, d.name), IF(vm.layer IS NULL, 0, 1)
                    INTO v_idDataCenter, v_haEnabled, idDummy, v_antiAffinity
            FROM    kinton.virtualmachine vm, kinton.hypervisor h, kinton.physicalmachine pm, kinton.rack r, kinton.datacenter d
            WHERE   vm.idVM=idVirtualMachine AND
                    vm.idHypervisor=h.id AND
                    h.idPhysicalMachine=pm.idPhysicalmachine AND
                    pm.idRack=r.idRack AND
                    pm.idDataCenter=d.idDataCenter;
            
            
            SELECT  ABQ_ADD_ENT_NAME(e.idEnterprise, e.name), ABQ_ADD_VDC_NAME(vdc.idVirtualDataCenter, vdc.name),
                    ABQ_ADD_VAPP_NAME(vapp.idVirtualApp, vapp.name),
                    ABQ_ADD_VM_NAME(vm.idVM, CONCAT(IF(ISNULL(vm.description),_utf8'',substr(vm.description,1,120)), _utf8' - ', vm.name))
                    INTO idDummy, idDummy, idDummy, idDummy
            FROM    kinton.nodevirtualimage nvi, kinton.node n, kinton.virtualapp vapp, kinton.virtualmachine vm, kinton.virtualdatacenter vdc, kinton.enterprise e
            WHERE   vm.idVM = nvi.idVM
                    AND nvi.idNode = n.idNode
                    AND vapp.idVirtualApp = n.idVirtualApp
                    AND vm.idVM = idVirtualMachine
                    AND vdc.idVirtualDataCenter=vapp.idVirtualDataCenter
                    AND e.idEnterprise=vdc.idEnterprise;

            SELECT  ABQ_ADD_COSTCODE_NAME(cc.idCostCode, cc.name) INTO idDummy FROM kinton.costCode cc WHERE cc.idCostCode=costCode;
            
            
            UPDATE accounting_event_vm SET stopTime=NOW()
                WHERE accounting_event_vm.idVM = idVirtualMachine AND accounting_event_vm.stopTime IS NULL;

		
		    
		    INSERT INTO accounting_event_vm (idVM,idEnterprise,idVirtualDataCenter,idVirtualApp,cpu,ram,hd,startTime,stopTime,costCode,hypervisorType,idDataCenter,haEnabled,antiAffinity) 
		    SELECT
		        vm.idVM, vapp.idEnterprise, vapp.idVirtualDataCenter, n.idVirtualApp,
		        cpuValue,
		        ramValue,           
		        hdValue,
		        now(),
		        null,
		        costCode,
		        vdc.hypervisorType,
                v_idDataCenter,
                v_haEnabled,
                v_antiAffinity
		      FROM kinton.nodevirtualimage nvi, kinton.node n, kinton.virtualapp vapp, kinton.virtualmachine vm, kinton.virtualdatacenter vdc
		    WHERE vm.idVM = nvi.idVM
		    AND nvi.idNode = n.idNode
		    AND vapp.idVirtualApp = n.idVirtualApp
		    AND vm.idVM = idVirtualMachine
		    AND vdc.idVirtualDataCenter=vapp.idVirtualDataCenter;
            
            SELECT 0 INTO checkIfUpdated; 
		END IF;

		IF previousState IN ("ON","OFF","PAUSED") AND newState IN ("NOT_ALLOCATED","UNKNOWN") THEN          
			
			
		    UPDATE accounting_event_vm SET stopTime=NOW()
                WHERE accounting_event_vm.idVM = idVirtualMachine AND accounting_event_vm.stopTime IS NULL;
            
            SELECT 0 INTO checkIfUpdated; 
	    END IF;
    END IF;    
    

    
    IF (checkIfUpdated > 0) THEN
    BEGIN
        DECLARE cur_cpu INTEGER UNSIGNED;
        DECLARE cur_ram INTEGER UNSIGNED;
        DECLARE cur_hd BIGINT UNSIGNED;
        DECLARE cur_cc INTEGER;
        DECLARE cur_aa TINYINT;
        DECLARE cur_ha TINYINT;

        
        SELECT cpu, ram, hd, accounting_event_vm.costCode, antiAffinity, haEnabled INTO 
               cur_cpu, cur_ram, cur_hd, cur_cc, cur_aa, cur_ha
            FROM accounting_event_vm WHERE idVM = idVirtualMachine AND stopTime IS NULL;

        SELECT  pm.idDataCenter, r.haEnabled, IF(vm.layer IS NULL, 0, 1)
                INTO v_idDataCenter, v_haEnabled, v_antiAffinity
        FROM    kinton.virtualmachine vm, kinton.hypervisor h, kinton.physicalmachine pm, kinton.rack r
        WHERE   vm.idVM=idVirtualMachine AND
                vm.idHypervisor=h.id AND
                h.idPhysicalMachine=pm.idPhysicalmachine AND
                pm.idRack=r.idRack;

        
        SELECT ABQ_ADD_COSTCODE_NAME(cc.idCostCode, cc.name) INTO idDummy FROM kinton.costCode cc WHERE cc.idCostCode=costCode;
        
        
        IF  (cur_cpu != cpuValue) OR (cur_ram != ramValue) OR (cur_hd != hdValue) OR 
            (cur_cc != costCode) OR (cur_aa != v_antiAffinity) OR (cur_ha != v_haEnabled) THEN

            
		    UPDATE accounting_event_vm SET stopTime=NOW()
                WHERE accounting_event_vm.idVM = idVirtualMachine AND accounting_event_vm.stopTime IS NULL;

            
		    INSERT INTO accounting_event_vm (idVM, idEnterprise, idVirtualDataCenter, idVirtualApp,
                                             cpu, ram, hd, startTime, stopTime, costCode,
                                             hypervisorType, idDataCenter, haEnabled, antiAffinity) 
		    (SELECT
		        vm.idVM, vapp.idEnterprise, vapp.idVirtualDataCenter, n.idVirtualApp,
		        cpuValue, ramValue, hdValue, NOW(), NULL, costCode,
		        vdc.hypervisorType, v_idDataCenter, v_haEnabled, v_antiAffinity
		     FROM kinton.nodevirtualimage nvi, kinton.node n, kinton.virtualapp vapp, kinton.virtualmachine vm, kinton.virtualdatacenter vdc
		     WHERE vm.idVM = nvi.idVM
                AND nvi.idNode = n.idNode
                AND vapp.idVirtualApp = n.idVirtualApp
                AND vm.idVM = idVirtualMachine
                AND vdc.idVirtualDataCenter=vapp.idVirtualDataCenter);
        END IF;
    END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateTMPEventTables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `CreateTMPEventTables`()
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
        `haEnabled`             TINYINT                 DEFAULT NULL,
        `idDataCenter`          INTEGER(11)             DEFAULT NULL,
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
        `sizeReserved`              BIGINT UNSIGNED         NOT NULL, 
        `idDataCenter`              INTEGER(11)             DEFAULT NULL,
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
        `idDataCenter`              INTEGER(11)             DEFAULT NULL,
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
        `idDataCenter`              INTEGER(11)             DEFAULT NULL,
        `startTime`                 TIMESTAMP               NULL,
        `stopTime`                  TIMESTAMP               NULL,
        `DELTA_TIME`                INTEGER(10)             NULL,
        `PERIOD_START`              TIMESTAMP               NOT NULL,
        `PERIOD_END`                TIMESTAMP               NOT NULL,
        `VIRTUAL_DATACENTER`        VARCHAR(255),
        `VIRTUAL_ENTERPRISE`        VARCHAR(255),
        PRIMARY KEY (`idVLANAccountingEvent`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FLUSH_TMP_ACCOUNTING_EVENT_DETAIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `FLUSH_TMP_ACCOUNTING_EVENT_DETAIL`()
BEGIN
    INSERT INTO `kinton_accounting`.`accounting_event_detail` 
        (startTime, endTime, idAccountingResourceType, resourceType, resourceUnits, resourceName,
         idEnterprise, idVirtualDataCenter, idVirtualApp, idVirtualMachine,
         costCode, idStorageTier, idDataCenter)
    SELECT
        startTime, endTime, idAccountingResourceType, resourceType, resourceUnits, resourceName,
        idEnterprise, idVirtualDataCenter, idVirtualApp, idVirtualMachine,
        costCode, idStorageTier, idDataCenter
    FROM 
    (SELECT 
        acc.startTime  AS `startTime`,
        acc.endTime AS `endTime`,
        acc.idAccountingResourceType AS `idAccountingResourceType`,
        acc.resourceType AS `resourceType`,
        acc.resourceName AS `resourceName`,
        MAX(acc.resourceUnits)  AS `resourceUnits`,
        acc.idEnterprise AS `idEnterprise`,
        acc.idVirtualDataCenter AS `idVirtualDataCenter`,
        acc.idVirtualApp AS `idVirtualApp`,
        acc.idVirtualMachine AS `idVirtualMachine`,
        acc.costCode AS `costCode`,
        acc.idStorageTier AS `idStorageTier`,
        acc.idDataCenter AS `idDataCenter`
        FROM kinton_accounting.tmp_accounting_event_detail acc
        GROUP BY 
            acc.startTime,
            acc.idAccountingResourceType,
            acc.resourceName,
            acc.idEnterprise,
            acc.idVirtualDataCenter,
            acc.idVirtualApp,
            acc.idVirtualMachine,
            acc.costCode
    ) tmp_data;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PopulateTMPEventTables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `PopulateTMPEventTables`(IN period_start TIMESTAMP, IN period_end TIMESTAMP)
BEGIN
    
    INSERT INTO tmp_vm_events_period (  idVMAccountingEvent, idVM, idEnterprise, idVirtualDataCenter, idVirtualApp,
                                        cpu, ram, hd, startTime, stopTime, costCode, hypervisorType, haEnabled, idDataCenter,
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
        `accounting_event_vm`.`haEnabled` AS `haEnabled`,
        `accounting_event_vm`.`idDataCenter` AS `idDataCenter`,
        (UNIX_TIMESTAMP(`accounting_event_vm`.`stopTime`) - UNIX_TIMESTAMP(`accounting_event_vm`.`startTime`)) AS `DELTA_TIME`,
        period_start AS `PERIOD_START`, 
        period_end AS `PERIOD_END`,
        `vm_name`.`vmName` AS `VIRTUAL_MACHINE`,
        `vapp_name`.`vappName` AS `VIRTUAL_APP`,
        `vdc_name`.`vdcName` AS `VIRTUAL_DATACENTER`,
        `ent_name`.`enterpriseName` AS `VIRTUAL_ENTERPRISE`
    FROM
        `accounting_event_vm`
        JOIN `vm_name` on(`accounting_event_vm`.`idVM` = `vm_name`.`idVM`)
        JOIN `vapp_name` on(`accounting_event_vm`.`idVirtualApp` = `vapp_name`.`idVirtualApp`)
        JOIN `vdc_name` on(`accounting_event_vm`.`idVirtualDataCenter` = `vdc_name`.`idVirtualDataCenter`)
        JOIN `ent_name` on(`accounting_event_vm`.`idEnterprise` = `ent_name`.`idEnterprise`)
    WHERE
        
        (`accounting_event_vm`.`startTime` < period_end AND 
         (`accounting_event_vm`.stopTime IS NULL OR `accounting_event_vm`.stopTime >= period_end)) OR
        
        ((`accounting_event_vm`.stopTime >= period_start) AND (`accounting_event_vm`.stopTime < period_end));

    
    INSERT INTO tmp_storage_events_period ( idStorageAccountingEvent, idResource, resourceName, idVM, idStorageTier,
                                            idEnterprise, idVirtualDataCenter, idVirtualApp, sizeReserved, idDataCenter,
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
        `accounting_event_storage`.idDataCenter AS idDataCenter,
        `accounting_event_storage`.startTime AS startTime,
        `accounting_event_storage`.stopTime AS stopTime,
        (UNIX_TIMESTAMP(`accounting_event_storage`.stopTime) - UNIX_TIMESTAMP(`accounting_event_storage`.startTime)) AS `DELTA_TIME`,
        period_start AS `PERIOD_START`, 
        period_end AS `PERIOD_END`,
        `vdc_name`.`vdcName` AS `VIRTUAL_DATACENTER`,
        `ent_name`.`enterpriseName` AS `VIRTUAL_ENTERPRISE` 
     FROM 
        `accounting_event_storage`
        JOIN `vdc_name` on(`accounting_event_storage`.`idVirtualDataCenter` = `vdc_name`.`idVirtualDataCenter`)
        JOIN `ent_name` on(`accounting_event_storage`.`idEnterprise` = `ent_name`.`idEnterprise`)
     WHERE 
        
        (`accounting_event_storage`.`startTime` < period_end AND 
         (`accounting_event_storage`.stopTime IS NULL OR `accounting_event_storage`.stopTime >= period_end)) OR
        
        ((`accounting_event_storage`.stopTime >= period_start) AND (`accounting_event_storage`.stopTime < period_end));


    
    INSERT INTO tmp_ips_events_period ( idIPsAccountingEvent, idEnterprise, idVirtualDataCenter,
                                        ip, idDataCenter, startTime, stopTime, 
                                        DELTA_TIME, PERIOD_START, PERIOD_END, VIRTUAL_DATACENTER, VIRTUAL_ENTERPRISE)
    SELECT 
        `accounting_event_ips`.idIPsAccountingEvent AS idIPsAccountingEvent,
        `accounting_event_ips`.idEnterprise AS idEnterprise,
        `accounting_event_ips`.idVirtualDataCenter AS idVirtualDataCenter,
        `accounting_event_ips`.ip AS ip,
        `accounting_event_ips`.idDataCenter AS idDataCenter,
        `accounting_event_ips`.startTime AS startTime,
        `accounting_event_ips`.stopTime AS stopTime,
        (unix_timestamp(`accounting_event_ips`.stopTime) - unix_timestamp(`accounting_event_ips`.startTime)) AS `DELTA_TIME`,
        period_start AS `PERIOD_START`, 
        period_end AS `PERIOD_END`,
        `vdc_name`.`vdcName` AS `VIRTUAL_DATACENTER`,
        `ent_name`.`enterpriseName` AS `VIRTUAL_ENTERPRISE` 
    FROM 
        `accounting_event_ips`
        JOIN `vdc_name` on(`accounting_event_ips`.`idVirtualDataCenter` = `vdc_name`.`idVirtualDataCenter`)
        JOIN `ent_name` on(`accounting_event_ips`.`idEnterprise` = `ent_name`.`idEnterprise`)
    WHERE
        
        (`accounting_event_ips`.`startTime` < period_end AND 
         (`accounting_event_ips`.stopTime IS NULL OR `accounting_event_ips`.stopTime >= period_end)) OR
        
        ((`accounting_event_ips`.stopTime >= period_start) AND (`accounting_event_ips`.stopTime < period_end));


    
    INSERT INTO tmp_vlan_events_period ( idVLANAccountingEvent, idEnterprise, idVirtualDataCenter,
                                        networkName, idDataCenter, startTime, stopTime, 
                                        DELTA_TIME, PERIOD_START, PERIOD_END, VIRTUAL_DATACENTER, VIRTUAL_ENTERPRISE)
    SELECT 
        `accounting_event_vlan`.idVLANAccountingEvent AS idVLANAccountingEvent,
        `accounting_event_vlan`.idEnterprise AS idEnterprise,
        `accounting_event_vlan`.idVirtualDataCenter AS idVirtualDataCenter,
        `accounting_event_vlan`.network_name AS networkName,    
        `accounting_event_vlan`.idDataCenter AS idDataCenter,
        `accounting_event_vlan`.startTime AS startTime,
        `accounting_event_vlan`.stopTime AS stopTime,
        (unix_timestamp(`accounting_event_vlan`.stopTime) - unix_timestamp(`accounting_event_vlan`.startTime)) AS `DELTA_TIME`,
        period_start AS `PERIOD_START`, 
        period_end AS `PERIOD_END`,
        `vdc_name`.`vdcName` AS `VIRTUAL_DATACENTER`,
        `ent_name`.`enterpriseName` AS `VIRTUAL_ENTERPRISE` 
    FROM 
        `accounting_event_vlan`
        JOIN `vdc_name` on(`accounting_event_vlan`.`idVirtualDataCenter` = `vdc_name`.`idVirtualDataCenter`)
        JOIN `ent_name` on(`accounting_event_vlan`.`idEnterprise` = `ent_name`.`idEnterprise`)
    WHERE 
        
        (`accounting_event_vlan`.`startTime` < period_end AND 
         (`accounting_event_vlan`.stopTime IS NULL OR `accounting_event_vlan`.stopTime >= period_end)) OR
        
        ((`accounting_event_vlan`.stopTime >= period_start) AND (`accounting_event_vlan`.stopTime < period_end));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ACCOUNTING_CONFIG_VW`
--

/*!50001 DROP TABLE IF EXISTS `ACCOUNTING_CONFIG_VW`*/;
/*!50001 DROP VIEW IF EXISTS `ACCOUNTING_CONFIG_VW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ACCOUNTING_CONFIG_VW` AS select cast(max(if((`accounting_parameters`.`paramName` = 'AccountingEnabled'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `ACCOUNTING_ENABLED`,max(if((`accounting_parameters`.`paramName` = 'AccountPeriodSize'),`accounting_parameters`.`paramValue`,NULL)) AS `PERIOD_SIZE`,max(if((`accounting_parameters`.`paramName` = 'AccountPeriodGranularity'),`accounting_parameters`.`paramValue`,NULL)) AS `PERIOD_GRANULARITY`,cast(max(if((`accounting_parameters`.`paramName` = 'DeleteRegEventsDeleteHours'),`accounting_parameters`.`paramValue`,NULL)) as decimal(6,0)) AS `DELETE_HOURS`,cast(max(if((`accounting_parameters`.`paramName` = 'MaximumPeriodsToProcess'),`accounting_parameters`.`paramValue`,NULL)) as decimal(5,0)) AS `MAX_PERIODS_PER_RUN`,cast(max(if((`accounting_parameters`.`paramName` = 'MaximumPeriodsToFirstInit'),`accounting_parameters`.`paramValue`,NULL)) as decimal(5,0)) AS `MAX_INIT_PERIODS`,cast(max(if((`accounting_parameters`.`paramName` = 'VirtualMachine-vcpu'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `VM_CPU_ENABLED`,cast(max(if((`accounting_parameters`.`paramName` = 'VirtualMachine-vram'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `VM_RAM_ENABLED`,cast(max(if((`accounting_parameters`.`paramName` = 'VirtualMachine-vhd'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `VM_HD_ENABLED`,cast(max(if((`accounting_parameters`.`paramName` = 'ExternalStorage'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `TIER_STORAGE_ENABLED`,cast(max(if((`accounting_parameters`.`paramName` = 'IPAddress'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `IP_ENABLED`,cast(max(if((`accounting_parameters`.`paramName` = 'VLAN'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `VLAN_ENABLED`,cast(max(if((`accounting_parameters`.`paramName` = 'VirtualMachine-hypervisorType'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `HYP_TYPE_ENABLED`,cast(max(if((`accounting_parameters`.`paramName` = 'VirtualMachine-haHosted'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `VM_HA_ENABLED`,cast(max(if((`accounting_parameters`.`paramName` = 'ReservedPhysicalMachine-cpu'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `PM_CPU_ENABLED`,cast(max(if((`accounting_parameters`.`paramName` = 'ReservedPhysicalMachine-ram'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `PM_RAM_ENABLED`,cast(max(if((`accounting_parameters`.`paramName` = 'RepositoryStorage'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `REPO_ENABLED`,cast(max(if((`accounting_parameters`.`paramName` = 'VirtualMachine-antiAffinity'),`accounting_parameters`.`paramValue`,NULL)) as decimal(1,0)) AS `ANTI_AFFINITY_ENABLED`,max(if((`accounting_parameters`.`paramName` = 'LoggingLevel'),`accounting_parameters`.`paramValue`,NULL)) AS `LOG_LEVEL` from `accounting_parameters` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ACCOUNT_PERIOD_USAGE_VW`
--

/*!50001 DROP TABLE IF EXISTS `ACCOUNT_PERIOD_USAGE_VW`*/;
/*!50001 DROP VIEW IF EXISTS `ACCOUNT_PERIOD_USAGE_VW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ACCOUNT_PERIOD_USAGE_VW` AS select `a`.`startTime` AS `startTime`,`a`.`endTime` AS `endTime`,`a`.`idAccountingResourceType` AS `idAccountingResourceType`,`kinton_accounting`.`ABQ_OBJECT_ID_TO_NAME`(`a`.`resourceType`) AS `resourceType`,`kinton_accounting`.`ABQ_OBJECT_ID_TO_NAME`(`a`.`resourceName`) AS `resourceName`,`a`.`resourceUnits` AS `resourceUnits`,`a`.`idEnterprise` AS `idEnterprise`,`a`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`a`.`idVirtualApp` AS `idVirtualApp`,`a`.`idVirtualMachine` AS `idVirtualMachine`,`en`.`enterpriseName` AS `enterpriseName`,`vdcn`.`vdcName` AS `virtualDataCenter`,`vappn`.`vappName` AS `virtualApp`,`vmn`.`vmName` AS `virtualMachine`,`a`.`costCode` AS `costCode`,`a`.`idStorageTier` AS `idStorageTier`,`cc`.`ccName` AS `costCodeName`,`t`.`name` AS `storageTierName`,`a`.`idDataCenter` AS `idDataCenter`,`dcn`.`dcName` AS `dataCenterName` from (((((((`kinton_accounting`.`accounting_event_detail` `a` left join `kinton_accounting`.`ent_name` `en` on((`a`.`idEnterprise` = `en`.`idEnterprise`))) left join `kinton_accounting`.`vdc_name` `vdcn` on((`a`.`idVirtualDataCenter` = `vdcn`.`idVirtualDataCenter`))) left join `kinton_accounting`.`vapp_name` `vappn` on((`a`.`idVirtualApp` = `vappn`.`idVirtualApp`))) left join `kinton_accounting`.`vm_name` `vmn` on((`a`.`idVirtualMachine` = `vmn`.`idVM`))) left join `kinton_accounting`.`cc_name` `cc` on((`a`.`costCode` = `cc`.`idCostCode`))) left join `kinton`.`tier` `t` on((`a`.`idStorageTier` = `t`.`id`))) left join `kinton_accounting`.`dc_name` `dcn` on((`a`.`idDataCenter` = `dcn`.`idDataCenter`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DAILY_USAGE_SUM_VW`
--

/*!50001 DROP TABLE IF EXISTS `DAILY_USAGE_SUM_VW`*/;
/*!50001 DROP VIEW IF EXISTS `DAILY_USAGE_SUM_VW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `DAILY_USAGE_SUM_VW` AS select cast(`a`.`startTime` as date) AS `startTime`,cast(`a`.`startTime` as date) AS `endTime`,`a`.`idAccountingResourceType` AS `idAccountingResourceType`,`kinton_accounting`.`ABQ_OBJECT_ID_TO_NAME`(`a`.`resourceType`) AS `resourceType`,sum(`a`.`resourceUnits`) AS `resourceUnits`,`a`.`idEnterprise` AS `idEnterprise`,`a`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`en`.`enterpriseName` AS `enterpriseName`,`vdcn`.`vdcName` AS `virtualDataCenter` from (((`accounting_event_detail` `a` left join `ent_name` `en` on((`a`.`idEnterprise` = `en`.`idEnterprise`))) left join `vdc_name` `vdcn` on((`a`.`idVirtualDataCenter` = `vdcn`.`idVirtualDataCenter`))) join `accounting_parameters` `param`) where ((`param`.`paramName` = 'AccountPeriodSize') and ((ucase(`param`.`paramValue`) = 'HOUR') or (ucase(`param`.`paramValue`) = 'DAY'))) group by cast(`a`.`startTime` as date),`a`.`idAccountingResourceType`,`a`.`idEnterprise`,`a`.`idVirtualDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HOURLY_USAGE_MAX_2_VW`
--

/*!50001 DROP TABLE IF EXISTS `HOURLY_USAGE_MAX_2_VW`*/;
/*!50001 DROP VIEW IF EXISTS `HOURLY_USAGE_MAX_2_VW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `HOURLY_USAGE_MAX_2_VW` AS select `a`.`startTime` AS `startTime`,`a`.`endTime` AS `endTime`,`a`.`idAccountingResourceType` AS `idAccountingResourceType`,`kinton_accounting`.`ABQ_OBJECT_ID_TO_NAME`(`a`.`resourceType`) AS `resourceType`,`kinton_accounting`.`ABQ_OBJECT_ID_TO_NAME`(`a`.`resourceName`) AS `resourceName`,`a`.`resourceUnits` AS `resourceUnits`,`a`.`idEnterprise` AS `idEnterprise`,`a`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`a`.`idVirtualApp` AS `idVirtualApp`,`a`.`idVirtualMachine` AS `idVirtualMachine`,`en`.`enterpriseName` AS `enterpriseName`,`vdcn`.`vdcName` AS `virtualDataCenter`,`vappn`.`vappName` AS `virtualApp`,`vmn`.`vmName` AS `virtualMachine`,`a`.`costCode` AS `costCode`,`a`.`idStorageTier` AS `idStorageTier`,`cc`.`ccName` AS `costCodeName`,`t`.`name` AS `storageTierName` from (((((((`kinton_accounting`.`accounting_event_detail` `a` left join `kinton_accounting`.`ent_name` `en` on((`a`.`idEnterprise` = `en`.`idEnterprise`))) left join `kinton_accounting`.`vdc_name` `vdcn` on((`a`.`idVirtualDataCenter` = `vdcn`.`idVirtualDataCenter`))) left join `kinton_accounting`.`vapp_name` `vappn` on((`a`.`idVirtualApp` = `vappn`.`idVirtualApp`))) left join `kinton_accounting`.`vm_name` `vmn` on((`a`.`idVirtualMachine` = `vmn`.`idVM`))) left join `kinton_accounting`.`cc_name` `cc` on((`a`.`costCode` = `cc`.`idCostCode`))) left join `kinton`.`tier` `t` on((`a`.`idStorageTier` = `t`.`id`))) join `kinton_accounting`.`accounting_parameters` `param`) where ((`param`.`paramName` = 'AccountPeriodSize') and (ucase(`param`.`paramValue`) = 'HOUR')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HOURLY_USAGE_MAX_VW`
--

/*!50001 DROP TABLE IF EXISTS `HOURLY_USAGE_MAX_VW`*/;
/*!50001 DROP VIEW IF EXISTS `HOURLY_USAGE_MAX_VW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `HOURLY_USAGE_MAX_VW` AS select `a`.`startTime` AS `startTime`,`a`.`endTime` AS `endTime`,`a`.`idAccountingResourceType` AS `idAccountingResourceType`,`kinton_accounting`.`ABQ_OBJECT_ID_TO_NAME`(`a`.`resourceType`) AS `resourceType`,`kinton_accounting`.`ABQ_OBJECT_ID_TO_NAME`(`a`.`resourceName`) AS `resourceName`,`a`.`resourceUnits` AS `resourceUnits`,`a`.`idEnterprise` AS `idEnterprise`,`a`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`a`.`idVirtualApp` AS `idVirtualApp`,`a`.`idVirtualMachine` AS `idVirtualMachine`,`en`.`enterpriseName` AS `enterpriseName`,`vdcn`.`vdcName` AS `virtualDataCenter`,`vappn`.`vappName` AS `virtualApp`,`vmn`.`vmName` AS `virtualMachine`,`a`.`costCode` AS `costCode`,`a`.`idStorageTier` AS `idStorageTier` from (((((`accounting_event_detail` `a` left join `ent_name` `en` on((`a`.`idEnterprise` = `en`.`idEnterprise`))) left join `vdc_name` `vdcn` on((`a`.`idVirtualDataCenter` = `vdcn`.`idVirtualDataCenter`))) left join `vapp_name` `vappn` on((`a`.`idVirtualApp` = `vappn`.`idVirtualApp`))) left join `vm_name` `vmn` on((`a`.`idVirtualMachine` = `vmn`.`idVM`))) join `accounting_parameters` `param`) where ((`param`.`paramName` = 'AccountPeriodSize') and (ucase(`param`.`paramValue`) = 'HOUR')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HOURLY_USAGE_SUM_VW`
--

/*!50001 DROP TABLE IF EXISTS `HOURLY_USAGE_SUM_VW`*/;
/*!50001 DROP VIEW IF EXISTS `HOURLY_USAGE_SUM_VW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `HOURLY_USAGE_SUM_VW` AS select `a`.`startTime` AS `startTime`,`a`.`endTime` AS `endTime`,`a`.`idAccountingResourceType` AS `idAccountingResourceType`,`kinton_accounting`.`ABQ_OBJECT_ID_TO_NAME`(`a`.`resourceType`) AS `resourceType`,sum(`a`.`resourceUnits`) AS `resourceUnits`,`a`.`idEnterprise` AS `idEnterprise`,`a`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`en`.`enterpriseName` AS `enterpriseName`,`vdcn`.`vdcName` AS `virtualDataCenter` from (((`accounting_event_detail` `a` left join `ent_name` `en` on((`a`.`idEnterprise` = `en`.`idEnterprise`))) left join `vdc_name` `vdcn` on((`a`.`idVirtualDataCenter` = `vdcn`.`idVirtualDataCenter`))) join `accounting_parameters` `param`) where ((`param`.`paramName` = 'AccountPeriodSize') and (ucase(`param`.`paramValue`) = 'HOUR')) group by `a`.`startTime`,`a`.`idAccountingResourceType`,`a`.`idEnterprise`,`a`.`idVirtualDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LOG_ERRORS_VW`
--

/*!50001 DROP TABLE IF EXISTS `LOG_ERRORS_VW`*/;
/*!50001 DROP VIEW IF EXISTS `LOG_ERRORS_VW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `LOG_ERRORS_VW` AS select `activity_log`.`logTime` AS `LOG_TIME`,`kinton_accounting`.`LOG_LEVEL_NUM_TO_STR`(`activity_log`.`logLevel`) AS `SEVERITY`,`activity_log`.`message` AS `MESSAGE` from `activity_log` where (`activity_log`.`logLevel` < 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LOG_VW`
--

/*!50001 DROP TABLE IF EXISTS `LOG_VW`*/;
/*!50001 DROP VIEW IF EXISTS `LOG_VW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `LOG_VW` AS select `activity_log`.`logTime` AS `LOG_TIME`,`kinton_accounting`.`LOG_LEVEL_NUM_TO_STR`(`activity_log`.`logLevel`) AS `SEVERITY`,`activity_log`.`message` AS `MESSAGE` from `activity_log` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LOG_WARNINGS_VW`
--

/*!50001 DROP TABLE IF EXISTS `LOG_WARNINGS_VW`*/;
/*!50001 DROP VIEW IF EXISTS `LOG_WARNINGS_VW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `LOG_WARNINGS_VW` AS select `activity_log`.`logTime` AS `LOG_TIME`,`kinton_accounting`.`LOG_LEVEL_NUM_TO_STR`(`activity_log`.`logLevel`) AS `SEVERITY`,`activity_log`.`message` AS `MESSAGE` from `activity_log` where (`activity_log`.`logLevel` < 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MONTHLY_USAGE_SUM_VW`
--

/*!50001 DROP TABLE IF EXISTS `MONTHLY_USAGE_SUM_VW`*/;
/*!50001 DROP VIEW IF EXISTS `MONTHLY_USAGE_SUM_VW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `MONTHLY_USAGE_SUM_VW` AS select cast((`a`.`startTime` - interval (dayofmonth(`a`.`startTime`) - 1) day) as date) AS `startTime`,last_day(`a`.`startTime`) AS `endTime`,`a`.`idAccountingResourceType` AS `idAccountingResourceType`,`kinton_accounting`.`ABQ_OBJECT_ID_TO_NAME`(`a`.`resourceType`) AS `resourceType`,sum(`a`.`resourceUnits`) AS `resourceUnits`,`a`.`idEnterprise` AS `idEnterprise`,`a`.`idVirtualDataCenter` AS `idVirtualDataCenter`,`en`.`enterpriseName` AS `enterpriseName`,`vdcn`.`vdcName` AS `virtualDataCenter` from ((`accounting_event_detail` `a` left join `ent_name` `en` on((`a`.`idEnterprise` = `en`.`idEnterprise`))) left join `vdc_name` `vdcn` on((`a`.`idVirtualDataCenter` = `vdcn`.`idVirtualDataCenter`))) group by cast((`a`.`startTime` - interval (dayofmonth(`a`.`startTime`) - 1) day) as date),`a`.`idAccountingResourceType`,`a`.`idEnterprise`,`a`.`idVirtualDataCenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-20 13:34:57
