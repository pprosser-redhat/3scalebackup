-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 172.30.140.149    Database: 
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Current Database: `root`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `root` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `root`;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `FK_FRSR5S213XCX4WNKOG82SSRFY` (`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_EXEC_REALM` (`REALM_ID`),
  KEY `FK_AUTH_EXEC_FLOW` (`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('02fddd17-b5a2-4d4a-8c4a-8bccbd8603fe',NULL,'registration-profile-action','master','5599b13a-0607-49e6-a8bf-ab21565ecf7f',0,40,_binary '\0',NULL,NULL),('0c80a101-b305-4647-9ce5-f3a0ec3b6257',NULL,'identity-provider-redirector','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','6e0ded79-d888-4227-9758-830504129faf',2,25,_binary '\0',NULL,NULL),('101156ae-c6e2-4127-9ef8-5192dc2fe317',NULL,'idp-username-password-form','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','461a3e49-20a6-4d8f-89ce-d22d4bc5da93',0,10,_binary '\0',NULL,NULL),('104732f4-6edf-4055-b13e-fef0e4e93acc',NULL,'idp-review-profile','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','a9f2feb0-4738-48f2-b086-a8ac3ce798a9',0,10,_binary '\0',NULL,'7d3a5f14-1fbe-4930-b049-9a329398e7ad'),('17783283-c4df-4b13-a48c-1d6f73fcd48b',NULL,'auth-username-password-form','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','1daa09e3-959d-49c4-a044-07bc47cb2059',0,10,_binary '\0',NULL,NULL),('1c55c92d-a777-4509-9520-9b8a14d3b271',NULL,'reset-credentials-choose-user','master','bf0c42b3-1c13-44ab-a502-c4a4f33c4aed',0,10,_binary '\0',NULL,NULL),('25eae08e-fa5d-4e0b-a344-4985663551de',NULL,'auth-otp-form','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','1daa09e3-959d-49c4-a044-07bc47cb2059',1,20,_binary '\0',NULL,NULL),('282f285d-c8c6-4c98-a2ac-ec5633b66af9',NULL,'auth-otp-form','master','882081f0-8e1b-4a51-942c-90bd6bd23743',1,20,_binary '\0',NULL,NULL),('32b29503-e579-45f5-a1f7-e2f89356b7d4',NULL,'auth-spnego','master','4f1ad7be-3063-428f-8fbc-96491a59e249',3,20,_binary '\0',NULL,NULL),('36b29f50-aac8-48d4-be51-2e7b5ee7e90e',NULL,'auth-otp-form','master','1903f114-827d-4765-be19-f86b465f5758',1,20,_binary '\0',NULL,NULL),('37d81694-b406-476b-80e1-2e749e34dc22',NULL,'reset-password','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','9b03554a-fc25-41a6-9c94-857750373435',0,30,_binary '\0',NULL,NULL),('3954e7d2-0e19-41c5-904d-35ff8dedb509',NULL,'registration-password-action','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e90862c0-ab81-4e57-bf20-a1692f603a1d',0,50,_binary '\0',NULL,NULL),('3c501a46-ce6f-44f6-abb0-9f49a0d325d0',NULL,'reset-credentials-choose-user','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','9b03554a-fc25-41a6-9c94-857750373435',0,10,_binary '\0',NULL,NULL),('42c3884b-98f2-4a7b-834d-bfa266642af5',NULL,'registration-user-creation','master','5599b13a-0607-49e6-a8bf-ab21565ecf7f',0,20,_binary '\0',NULL,NULL),('43149c1b-81b8-4d64-b188-a2ca47c57015',NULL,NULL,'master','3f7c5d6e-343a-48e2-8fe5-8020f1464eff',2,30,_binary '','1fae949b-18a5-42fc-aa1d-c63ff3dae8c2',NULL),('435bb4cf-fbdb-4e51-a59a-a97931aece7d',NULL,NULL,'3150c2d5-c682-48f3-a18a-bad19bdd8aa7','ff747e13-02c7-46d6-a7e4-03712971cf28',2,30,_binary '','461a3e49-20a6-4d8f-89ce-d22d4bc5da93',NULL),('45495555-8cee-483f-90d5-55805475a357',NULL,'reset-password','master','bf0c42b3-1c13-44ab-a502-c4a4f33c4aed',0,30,_binary '\0',NULL,NULL),('45b002c5-2bf8-41f7-a84d-2ed7a1afbda8',NULL,'auth-cookie','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','6e0ded79-d888-4227-9758-830504129faf',2,10,_binary '\0',NULL,NULL),('4796c033-3f2c-4a61-9e8b-b6d2642a7877',NULL,'reset-credential-email','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','9b03554a-fc25-41a6-9c94-857750373435',0,20,_binary '\0',NULL,NULL),('483ab248-9f70-4004-bdda-30ec3d5bd5f6',NULL,'registration-user-creation','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e90862c0-ab81-4e57-bf20-a1692f603a1d',0,20,_binary '\0',NULL,NULL),('4c34dcb1-979e-4ec6-b278-d13f926b67be',NULL,'registration-password-action','master','5599b13a-0607-49e6-a8bf-ab21565ecf7f',0,50,_binary '\0',NULL,NULL),('5223cf76-2241-438e-853f-193e248f649d',NULL,NULL,'master','1fae949b-18a5-42fc-aa1d-c63ff3dae8c2',2,30,_binary '','882081f0-8e1b-4a51-942c-90bd6bd23743',NULL),('543b1294-d334-473d-abe5-687ad50059f9',NULL,'docker-http-basic-authenticator','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','5a2d62e2-30dd-4da0-a61b-27be25f64c21',0,10,_binary '\0',NULL,NULL),('54c45f52-6233-480c-90d6-c7d059680876',NULL,'idp-confirm-link','master','1fae949b-18a5-42fc-aa1d-c63ff3dae8c2',0,10,_binary '\0',NULL,NULL),('56f812bd-89e5-4a5a-b17e-2d0f4dcc1071',NULL,'registration-page-form','master','6ea89df5-35b4-43a3-816b-df4e3e7807be',0,10,_binary '','5599b13a-0607-49e6-a8bf-ab21565ecf7f',NULL),('57075852-1912-4d6b-bd8a-6eb69affcdf5',NULL,'client-secret','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','236f2f82-7946-4b80-96de-e62d7f65b245',2,10,_binary '\0',NULL,NULL),('58cb9962-3833-4ad7-acd8-3f3248817cbd',NULL,'direct-grant-validate-username','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','f638646a-bd7c-4166-b50e-efd41746f65c',0,10,_binary '\0',NULL,NULL),('607dfb47-a751-460e-a777-ad29b0f9aaa8',NULL,'registration-page-form','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','4bddeac5-8c2e-4675-a3cb-b173788d28ad',0,10,_binary '','e90862c0-ab81-4e57-bf20-a1692f603a1d',NULL),('6347f335-7d6f-4bb3-b37f-07a7a63777aa',NULL,'idp-review-profile','master','3f7c5d6e-343a-48e2-8fe5-8020f1464eff',0,10,_binary '\0',NULL,'8de3704b-7be8-452c-a627-8dd837d2e842'),('65590761-a2fd-458d-9eb7-fce83bde6f6c',NULL,'direct-grant-validate-password','master','db2e4eba-d5a7-4523-b496-e4f77a30acea',0,20,_binary '\0',NULL,NULL),('79800baf-6309-4af5-a094-5a1ab1c347fe',NULL,'docker-http-basic-authenticator','master','e22b26df-12bd-49de-ba90-0bb07803e7c9',0,10,_binary '\0',NULL,NULL),('7adcd38e-414e-4eaa-b551-7c2bb40c48cd',NULL,'identity-provider-redirector','master','4f1ad7be-3063-428f-8fbc-96491a59e249',2,25,_binary '\0',NULL,NULL),('7c2332bf-2e7b-40fe-9e5b-24f7641c1a0f',NULL,NULL,'master','4f1ad7be-3063-428f-8fbc-96491a59e249',2,30,_binary '','1903f114-827d-4765-be19-f86b465f5758',NULL),('84fc9b42-6d1d-4e95-b6fa-acbc56427628',NULL,'idp-confirm-link','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','ff747e13-02c7-46d6-a7e4-03712971cf28',0,10,_binary '\0',NULL,NULL),('863460d1-ad6c-4aa1-80d8-0c2404d68989',NULL,'idp-email-verification','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','ff747e13-02c7-46d6-a7e4-03712971cf28',2,20,_binary '\0',NULL,NULL),('88d07585-c941-4eed-a714-1af74047bbd1',NULL,'http-basic-authenticator','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','ee413630-073e-471e-881b-1b06d0edc144',0,10,_binary '\0',NULL,NULL),('8b18223a-70e4-43a6-9b3e-d4dca48fac34',NULL,'idp-username-password-form','master','882081f0-8e1b-4a51-942c-90bd6bd23743',0,10,_binary '\0',NULL,NULL),('8c23eb5e-4490-46f7-befb-29c55546cafa',NULL,'registration-profile-action','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e90862c0-ab81-4e57-bf20-a1692f603a1d',0,40,_binary '\0',NULL,NULL),('8c705944-deb4-40aa-b3c5-a1e23daf4187',NULL,'direct-grant-validate-password','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','f638646a-bd7c-4166-b50e-efd41746f65c',0,20,_binary '\0',NULL,NULL),('8e38c430-567c-4ecf-99f0-ba947b6964ac',NULL,'direct-grant-validate-otp','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','f638646a-bd7c-4166-b50e-efd41746f65c',1,30,_binary '\0',NULL,NULL),('9398b46e-45de-4712-9a09-d7bfc6d93fdc',NULL,'reset-otp','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','9b03554a-fc25-41a6-9c94-857750373435',1,40,_binary '\0',NULL,NULL),('95b33f91-74af-4f9d-ac9f-7c673f9643df',NULL,NULL,'3150c2d5-c682-48f3-a18a-bad19bdd8aa7','a9f2feb0-4738-48f2-b086-a8ac3ce798a9',2,30,_binary '','ff747e13-02c7-46d6-a7e4-03712971cf28',NULL),('97b0ef72-e03c-4d3c-a701-63a60fce60c9',NULL,'http-basic-authenticator','master','b49d95ea-3137-4b7a-9128-13e10d43a652',0,10,_binary '\0',NULL,NULL),('9c3af02b-4e9a-4f27-8cb2-a5312cfb3325',NULL,'idp-create-user-if-unique','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','a9f2feb0-4738-48f2-b086-a8ac3ce798a9',2,20,_binary '\0',NULL,'bceaa2ab-bb25-4f61-b7a1-dedcc889318d'),('9c58f6c6-40e0-4dc0-b218-919ec487c4c3',NULL,'registration-recaptcha-action','master','5599b13a-0607-49e6-a8bf-ab21565ecf7f',3,60,_binary '\0',NULL,NULL),('a1aa5499-1923-4387-8ffc-1f5b1e128493',NULL,'auth-cookie','master','4f1ad7be-3063-428f-8fbc-96491a59e249',2,10,_binary '\0',NULL,NULL),('ac51740b-1628-4485-806e-1418fe599915',NULL,'idp-create-user-if-unique','master','3f7c5d6e-343a-48e2-8fe5-8020f1464eff',2,20,_binary '\0',NULL,'84436559-2e0b-4c71-8847-b9de3fe8cd9f'),('ae294820-0f8a-4f60-bca7-04c80f388ec5',NULL,'direct-grant-validate-otp','master','db2e4eba-d5a7-4523-b496-e4f77a30acea',1,30,_binary '\0',NULL,NULL),('affbd957-0659-4a77-9f9c-6f572a165af5',NULL,'client-jwt','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','236f2f82-7946-4b80-96de-e62d7f65b245',2,20,_binary '\0',NULL,NULL),('c00ce07c-d15e-4326-b804-4bdbc3c96944',NULL,'direct-grant-validate-username','master','db2e4eba-d5a7-4523-b496-e4f77a30acea',0,10,_binary '\0',NULL,NULL),('c4ea4649-3ec9-4a7c-b90a-5fa15445e880',NULL,NULL,'3150c2d5-c682-48f3-a18a-bad19bdd8aa7','6e0ded79-d888-4227-9758-830504129faf',2,30,_binary '','1daa09e3-959d-49c4-a044-07bc47cb2059',NULL),('c6e699e9-39b1-4fef-b426-73d98d1833ad',NULL,'registration-recaptcha-action','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e90862c0-ab81-4e57-bf20-a1692f603a1d',3,60,_binary '\0',NULL,NULL),('cbca02a7-fa72-4d9d-94aa-82f01d19ae78',NULL,'reset-otp','master','bf0c42b3-1c13-44ab-a502-c4a4f33c4aed',1,40,_binary '\0',NULL,NULL),('ce94a432-8d36-435a-9fe1-339cb5e9965f',NULL,'client-secret','master','339bb493-6e80-466c-94e4-0071bcf54807',2,10,_binary '\0',NULL,NULL),('d58d0df3-17fb-4029-9c81-d70cab72c841',NULL,'auth-spnego','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','6e0ded79-d888-4227-9758-830504129faf',3,20,_binary '\0',NULL,NULL),('e770d126-0da6-408b-93f2-b0d8906a17fc',NULL,'reset-credential-email','master','bf0c42b3-1c13-44ab-a502-c4a4f33c4aed',0,20,_binary '\0',NULL,NULL),('eb198b68-8cfc-4d44-bc6f-b44c021c5990',NULL,'idp-email-verification','master','1fae949b-18a5-42fc-aa1d-c63ff3dae8c2',2,20,_binary '\0',NULL,NULL),('ef78fadf-7fab-4c08-8900-4d72246ed085',NULL,'client-jwt','master','339bb493-6e80-466c-94e4-0071bcf54807',2,20,_binary '\0',NULL,NULL),('ef991d25-2742-447b-a907-6e87f3848319',NULL,'auth-username-password-form','master','1903f114-827d-4765-be19-f86b465f5758',0,10,_binary '\0',NULL,NULL),('f4949fdb-6c97-48b0-bd3c-7357689b4409',NULL,'auth-otp-form','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','461a3e49-20a6-4d8f-89ce-d22d4bc5da93',1,20,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_FLOW_REALM` (`REALM_ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('1903f114-827d-4765-be19-f86b465f5758','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('1daa09e3-959d-49c4-a044-07bc47cb2059','forms','Username, password, otp and other auth forms.','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','basic-flow',_binary '\0',_binary ''),('1fae949b-18a5-42fc-aa1d-c63ff3dae8c2','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('236f2f82-7946-4b80-96de-e62d7f65b245','clients','Base authentication for clients','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','client-flow',_binary '',_binary ''),('339bb493-6e80-466c-94e4-0071bcf54807','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('3f7c5d6e-343a-48e2-8fe5-8020f1464eff','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('461a3e49-20a6-4d8f-89ce-d22d4bc5da93','Verify Existing Account by Re-authentication','Reauthentication of existing account','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','basic-flow',_binary '\0',_binary ''),('4bddeac5-8c2e-4675-a3cb-b173788d28ad','registration','registration flow','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','basic-flow',_binary '',_binary ''),('4f1ad7be-3063-428f-8fbc-96491a59e249','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('5599b13a-0607-49e6-a8bf-ab21565ecf7f','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('5a2d62e2-30dd-4da0-a61b-27be25f64c21','docker auth','Used by Docker clients to authenticate against the IDP','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','basic-flow',_binary '',_binary ''),('6e0ded79-d888-4227-9758-830504129faf','browser','browser based authentication','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','basic-flow',_binary '',_binary ''),('6ea89df5-35b4-43a3-816b-df4e3e7807be','registration','registration flow','master','basic-flow',_binary '',_binary ''),('882081f0-8e1b-4a51-942c-90bd6bd23743','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('9b03554a-fc25-41a6-9c94-857750373435','reset credentials','Reset credentials for a user if they forgot their password or something','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','basic-flow',_binary '',_binary ''),('a9f2feb0-4738-48f2-b086-a8ac3ce798a9','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','basic-flow',_binary '',_binary ''),('b49d95ea-3137-4b7a-9128-13e10d43a652','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('bf0c42b3-1c13-44ab-a502-c4a4f33c4aed','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('db2e4eba-d5a7-4523-b496-e4f77a30acea','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('e22b26df-12bd-49de-ba90-0bb07803e7c9','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('e90862c0-ab81-4e57-bf20-a1692f603a1d','registration form','registration form','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','form-flow',_binary '\0',_binary ''),('ee413630-073e-471e-881b-1b06d0edc144','saml ecp','SAML ECP Profile Authentication Flow','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','basic-flow',_binary '',_binary ''),('f638646a-bd7c-4166-b50e-efd41746f65c','direct grant','OpenID Connect Resource Owner Grant','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','basic-flow',_binary '',_binary ''),('ff747e13-02c7-46d6-a7e4-03712971cf28','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_REALM` (`REALM_ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('7d3a5f14-1fbe-4930-b049-9a329398e7ad','review profile config','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('84436559-2e0b-4c71-8847-b9de3fe8cd9f','create unique user config','master'),('8de3704b-7be8-452c-a627-8dd837d2e842','review profile config','master'),('bceaa2ab-bb25-4f61-b7a1-dedcc889318d','create unique user config','3150c2d5-c682-48f3-a18a-bad19bdd8aa7');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('7d3a5f14-1fbe-4930-b049-9a329398e7ad','missing','update.profile.on.first.login'),('84436559-2e0b-4c71-8847-b9de3fe8cd9f','false','require.password.update.after.registration'),('8de3704b-7be8-452c-a627-8dd837d2e842','missing','update.profile.on.first.login'),('bceaa2ab-bb25-4f61-b7a1-dedcc889318d','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('0fb64661-7d51-4942-b23a-7fe077594197',_binary '',_binary '\0','admin-cli',0,_binary '','d1e7a06b-a1b6-41d9-9720-6ce8bd9a2ab5',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary ''),('10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '',_binary '','3Scale-realm',0,_binary '\0','409fbeb3-b10f-49b3-97b2-07fe3af63891',NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','3Scale Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0'),('25af4524-d4f1-46e7-a096-832679647136',_binary '',_binary '\0','account',0,_binary '\0','a36ad65c-3a15-4940-8d6a-00e830f346d6','/auth/realms/3Scale/account',_binary '\0',NULL,_binary '\0','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0'),('305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',_binary '',_binary '\0','account',0,_binary '\0','2b6b4f08-cdff-47d0-812a-744b97888f55','/auth/realms/master/account',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0'),('31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '',_binary '','master-realm',0,_binary '\0','44a47d0a-0340-4841-8dea-98bf856ba1f4',NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0'),('3218c624-d052-4a5a-96a9-2e870f4bd957',_binary '',_binary '','cd1a5d42',0,_binary '\0','dc1f7fd7b35259f0c13ae3b436057cf8',NULL,_binary '\0',NULL,_binary '\0','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','openid-connect',-1,_binary '\0',_binary '\0','BTMOAuthMemberService',_binary '\0','client-secret',NULL,'For extra security some of apps use OAuth','0c935b79-bdb1-4140-b141-6844676b500f',_binary '',_binary '\0',_binary '\0'),('32b129c5-7360-42e4-a167-713cd9e24300',_binary '',_binary '','3scale-admin',0,_binary '\0','4515e009-ee60-4039-8d5a-1578ecec4349',NULL,_binary '\0',NULL,_binary '\0','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0'),('3ed68957-70e3-48e5-b78b-08e15284ea38',_binary '',_binary '\0','broker',0,_binary '\0','0fd57f99-5904-4205-bdbf-b618eeccec91',NULL,_binary '\0',NULL,_binary '\0','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0'),('49cb0cad-f64e-4364-9005-58a36017b801',_binary '',_binary '\0','admin-cli',0,_binary '','03c422a7-bc77-46ee-8ed5-31485e8ca208',NULL,_binary '\0',NULL,_binary '\0','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary ''),('58d443e5-321d-483f-8e22-6db71136ebfe',_binary '',_binary '','6fbc48d0',0,_binary '\0','bb869416ad774617e10cb60174eb1773',NULL,_binary '\0',NULL,_binary '\0','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','openid-connect',-1,_binary '\0',_binary '\0','Customerservice',_binary '\0','client-secret',NULL,'test oauth','af96afd8-c72d-4738-9b14-ef6b6b0039d5',_binary '',_binary '\0',_binary '\0'),('6765010a-3cc1-4ba4-9901-ed6347e8313a',_binary '',_binary '\0','security-admin-console',0,_binary '','012441a5-5c7c-449c-aca3-bef4ed9bcadd','/auth/admin/3Scale/console/index.html',_binary '\0',NULL,_binary '\0','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0'),('86d79b32-64fd-4255-9970-cd0ad4425873',_binary '',_binary '\0','security-admin-console',0,_binary '','d440f39e-6bd4-4fde-a406-8550f36fb95a','/auth/admin/master/console/index.html',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0'),('87b9bf99-7bde-42a8-9234-04f9d6d48be7',_binary '',_binary '\0','broker',0,_binary '\0','4d647d96-61cd-4053-b531-cfe07a364071',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0'),('8d335921-e04d-4bb4-b97a-438540d94a1b',_binary '',_binary '','c72aa086',0,_binary '\0','731cf95a8822db615a26321465825fbb',NULL,_binary '\0',NULL,_binary '\0','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','openid-connect',-1,_binary '\0',_binary '\0','OAuth Demo Banking app',_binary '\0','client-secret',NULL,'Test','8fac780a-f259-4115-b601-43390b32ff4e',_binary '',_binary '\0',_binary '\0'),('beb60408-3255-42e6-bccb-67baa751d1d8',_binary '',_binary '','3scaleadminportal',0,_binary '\0','f990e31e-bf04-4b20-b673-b97fcaf6df71',NULL,_binary '\0',NULL,_binary '\0','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '\0'),('e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '',_binary '\0','realm-management',0,_binary '\0','47a3fb78-ebd8-413e-91cc-ae62dfbdf8aa',NULL,_binary '',NULL,_binary '\0','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('3218c624-d052-4a5a-96a9-2e870f4bd957','true','3scale'),('32b129c5-7360-42e4-a167-713cd9e24300','false','saml.assertion.signature'),('32b129c5-7360-42e4-a167-713cd9e24300','false','saml.authnstatement'),('32b129c5-7360-42e4-a167-713cd9e24300','false','saml.client.signature'),('32b129c5-7360-42e4-a167-713cd9e24300','false','saml.encrypt'),('32b129c5-7360-42e4-a167-713cd9e24300','false','saml.force.post.binding'),('32b129c5-7360-42e4-a167-713cd9e24300','false','saml.multivalued.roles'),('32b129c5-7360-42e4-a167-713cd9e24300','false','saml.server.signature'),('32b129c5-7360-42e4-a167-713cd9e24300','false','saml.server.signature.keyinfo.ext'),('32b129c5-7360-42e4-a167-713cd9e24300','false','saml_force_name_id_format'),('58d443e5-321d-483f-8e22-6db71136ebfe','true','3scale'),('8d335921-e04d-4bb4-b97a-438540d94a1b','true','3scale'),('beb60408-3255-42e6-bccb-67baa751d1d8','false','saml.assertion.signature'),('beb60408-3255-42e6-bccb-67baa751d1d8','false','saml.authnstatement'),('beb60408-3255-42e6-bccb-67baa751d1d8','false','saml.client.signature'),('beb60408-3255-42e6-bccb-67baa751d1d8','false','saml.encrypt'),('beb60408-3255-42e6-bccb-67baa751d1d8','false','saml.force.post.binding'),('beb60408-3255-42e6-bccb-67baa751d1d8','false','saml.multivalued.roles'),('beb60408-3255-42e6-bccb-67baa751d1d8','false','saml.server.signature'),('beb60408-3255-42e6-bccb-67baa751d1d8','false','saml.server.signature.keyinfo.ext'),('beb60408-3255-42e6-bccb-67baa751d1d8','false','saml_force_name_id_format');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `CLIENT_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `FK_NUILTS7KLWQW2H8M2B5JOYTKY` (`CLIENT_ID`),
  KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('25af4524-d4f1-46e7-a096-832679647136','199cd067-56c9-4270-9353-12c20b8cd8ce'),('25af4524-d4f1-46e7-a096-832679647136','60600fc2-151c-421b-bb81-886c1719ab6a'),('305e34dc-2137-4bf4-8b77-f6fb59cbb0f1','b3631e44-780e-4b26-9ba7-39437e9ac248'),('305e34dc-2137-4bf4-8b77-f6fb59cbb0f1','eec19a0f-40b3-4d49-8772-80ff678ad720');
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`),
  CONSTRAINT `FK_REALM_CLI_SCOPE` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('0cc1d884-3089-4db4-a944-69cb72fdb49c','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('300d871b-d5ff-4a18-a837-367c0e65639c','address','master','OpenID Connect built-in scope: address','openid-connect'),('33c85051-e62a-46a5-9a69-5c3f3563937a','phone','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','OpenID Connect built-in scope: phone','openid-connect'),('38f51ba5-8947-4d46-bfdf-2238b3e33f7e','profile','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','OpenID Connect built-in scope: profile','openid-connect'),('48893ee5-05c2-499b-b546-46b8f521878b','roles','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','OpenID Connect scope for add user roles to the access token','openid-connect'),('5adcd672-b489-4146-9f5d-173a047ad65d','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('646d23b1-9302-4ad1-bbd7-535e7723164b','offline_access','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','OpenID Connect built-in scope: offline_access','openid-connect'),('67102205-ce1b-4a05-9ab5-4f1d16d36564','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('9fb31fbd-b707-4c42-8e34-a1b7810a3c81','email','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','OpenID Connect built-in scope: email','openid-connect'),('aefee9f7-67c4-4ef6-904d-80e83c5ed5ef','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('c5733e86-b5b1-404b-90b2-ab7bd1c38a2a','role_list','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','SAML role list','saml'),('c60f0321-e099-4dfe-b9da-d8c91852f7ec','role_list','master','SAML role list','saml'),('d25c5bdf-a8e7-4849-8b4b-9cdc9c29d739','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('d6de0570-b1af-4882-a827-21246a36b2f7','email','master','OpenID Connect built-in scope: email','openid-connect'),('ea2c9558-15eb-4e7d-8345-36a2defcfef8','web-origins','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('fb6dae64-e115-43cd-b46f-74e3b6201a15','address','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','OpenID Connect built-in scope: address','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0cc1d884-3089-4db4-a944-69cb72fdb49c','','consent.screen.text'),('0cc1d884-3089-4db4-a944-69cb72fdb49c','false','display.on.consent.screen'),('0cc1d884-3089-4db4-a944-69cb72fdb49c','false','include.in.token.scope'),('300d871b-d5ff-4a18-a837-367c0e65639c','${addressScopeConsentText}','consent.screen.text'),('300d871b-d5ff-4a18-a837-367c0e65639c','true','display.on.consent.screen'),('300d871b-d5ff-4a18-a837-367c0e65639c','true','include.in.token.scope'),('33c85051-e62a-46a5-9a69-5c3f3563937a','${phoneScopeConsentText}','consent.screen.text'),('33c85051-e62a-46a5-9a69-5c3f3563937a','true','display.on.consent.screen'),('33c85051-e62a-46a5-9a69-5c3f3563937a','true','include.in.token.scope'),('38f51ba5-8947-4d46-bfdf-2238b3e33f7e','${profileScopeConsentText}','consent.screen.text'),('38f51ba5-8947-4d46-bfdf-2238b3e33f7e','true','display.on.consent.screen'),('38f51ba5-8947-4d46-bfdf-2238b3e33f7e','true','include.in.token.scope'),('48893ee5-05c2-499b-b546-46b8f521878b','${rolesScopeConsentText}','consent.screen.text'),('48893ee5-05c2-499b-b546-46b8f521878b','true','display.on.consent.screen'),('48893ee5-05c2-499b-b546-46b8f521878b','false','include.in.token.scope'),('5adcd672-b489-4146-9f5d-173a047ad65d','${profileScopeConsentText}','consent.screen.text'),('5adcd672-b489-4146-9f5d-173a047ad65d','true','display.on.consent.screen'),('5adcd672-b489-4146-9f5d-173a047ad65d','true','include.in.token.scope'),('646d23b1-9302-4ad1-bbd7-535e7723164b','${offlineAccessScopeConsentText}','consent.screen.text'),('646d23b1-9302-4ad1-bbd7-535e7723164b','true','display.on.consent.screen'),('67102205-ce1b-4a05-9ab5-4f1d16d36564','${phoneScopeConsentText}','consent.screen.text'),('67102205-ce1b-4a05-9ab5-4f1d16d36564','true','display.on.consent.screen'),('67102205-ce1b-4a05-9ab5-4f1d16d36564','true','include.in.token.scope'),('9fb31fbd-b707-4c42-8e34-a1b7810a3c81','${emailScopeConsentText}','consent.screen.text'),('9fb31fbd-b707-4c42-8e34-a1b7810a3c81','true','display.on.consent.screen'),('9fb31fbd-b707-4c42-8e34-a1b7810a3c81','true','include.in.token.scope'),('aefee9f7-67c4-4ef6-904d-80e83c5ed5ef','${rolesScopeConsentText}','consent.screen.text'),('aefee9f7-67c4-4ef6-904d-80e83c5ed5ef','true','display.on.consent.screen'),('aefee9f7-67c4-4ef6-904d-80e83c5ed5ef','false','include.in.token.scope'),('c5733e86-b5b1-404b-90b2-ab7bd1c38a2a','${samlRoleListScopeConsentText}','consent.screen.text'),('c5733e86-b5b1-404b-90b2-ab7bd1c38a2a','true','display.on.consent.screen'),('c60f0321-e099-4dfe-b9da-d8c91852f7ec','${samlRoleListScopeConsentText}','consent.screen.text'),('c60f0321-e099-4dfe-b9da-d8c91852f7ec','true','display.on.consent.screen'),('d25c5bdf-a8e7-4849-8b4b-9cdc9c29d739','${offlineAccessScopeConsentText}','consent.screen.text'),('d25c5bdf-a8e7-4849-8b4b-9cdc9c29d739','true','display.on.consent.screen'),('d6de0570-b1af-4882-a827-21246a36b2f7','${emailScopeConsentText}','consent.screen.text'),('d6de0570-b1af-4882-a827-21246a36b2f7','true','display.on.consent.screen'),('d6de0570-b1af-4882-a827-21246a36b2f7','true','include.in.token.scope'),('ea2c9558-15eb-4e7d-8345-36a2defcfef8','','consent.screen.text'),('ea2c9558-15eb-4e7d-8345-36a2defcfef8','false','display.on.consent.screen'),('ea2c9558-15eb-4e7d-8345-36a2defcfef8','false','include.in.token.scope'),('fb6dae64-e115-43cd-b46f-74e3b6201a15','${addressScopeConsentText}','consent.screen.text'),('fb6dae64-e115-43cd-b46f-74e3b6201a15','true','display.on.consent.screen'),('fb6dae64-e115-43cd-b46f-74e3b6201a15','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0fb64661-7d51-4942-b23a-7fe077594197','0cc1d884-3089-4db4-a944-69cb72fdb49c',_binary ''),('0fb64661-7d51-4942-b23a-7fe077594197','aefee9f7-67c4-4ef6-904d-80e83c5ed5ef',_binary ''),('25af4524-d4f1-46e7-a096-832679647136','48893ee5-05c2-499b-b546-46b8f521878b',_binary ''),('25af4524-d4f1-46e7-a096-832679647136','ea2c9558-15eb-4e7d-8345-36a2defcfef8',_binary ''),('305e34dc-2137-4bf4-8b77-f6fb59cbb0f1','0cc1d884-3089-4db4-a944-69cb72fdb49c',_binary ''),('305e34dc-2137-4bf4-8b77-f6fb59cbb0f1','aefee9f7-67c4-4ef6-904d-80e83c5ed5ef',_binary ''),('3218c624-d052-4a5a-96a9-2e870f4bd957','48893ee5-05c2-499b-b546-46b8f521878b',_binary ''),('3218c624-d052-4a5a-96a9-2e870f4bd957','646d23b1-9302-4ad1-bbd7-535e7723164b',_binary '\0'),('3218c624-d052-4a5a-96a9-2e870f4bd957','ea2c9558-15eb-4e7d-8345-36a2defcfef8',_binary ''),('32b129c5-7360-42e4-a167-713cd9e24300','48893ee5-05c2-499b-b546-46b8f521878b',_binary ''),('32b129c5-7360-42e4-a167-713cd9e24300','646d23b1-9302-4ad1-bbd7-535e7723164b',_binary '\0'),('32b129c5-7360-42e4-a167-713cd9e24300','ea2c9558-15eb-4e7d-8345-36a2defcfef8',_binary ''),('3ed68957-70e3-48e5-b78b-08e15284ea38','48893ee5-05c2-499b-b546-46b8f521878b',_binary ''),('3ed68957-70e3-48e5-b78b-08e15284ea38','ea2c9558-15eb-4e7d-8345-36a2defcfef8',_binary ''),('49cb0cad-f64e-4364-9005-58a36017b801','48893ee5-05c2-499b-b546-46b8f521878b',_binary ''),('49cb0cad-f64e-4364-9005-58a36017b801','ea2c9558-15eb-4e7d-8345-36a2defcfef8',_binary ''),('58d443e5-321d-483f-8e22-6db71136ebfe','48893ee5-05c2-499b-b546-46b8f521878b',_binary ''),('58d443e5-321d-483f-8e22-6db71136ebfe','646d23b1-9302-4ad1-bbd7-535e7723164b',_binary '\0'),('58d443e5-321d-483f-8e22-6db71136ebfe','ea2c9558-15eb-4e7d-8345-36a2defcfef8',_binary ''),('6765010a-3cc1-4ba4-9901-ed6347e8313a','48893ee5-05c2-499b-b546-46b8f521878b',_binary ''),('6765010a-3cc1-4ba4-9901-ed6347e8313a','ea2c9558-15eb-4e7d-8345-36a2defcfef8',_binary ''),('86d79b32-64fd-4255-9970-cd0ad4425873','0cc1d884-3089-4db4-a944-69cb72fdb49c',_binary ''),('86d79b32-64fd-4255-9970-cd0ad4425873','aefee9f7-67c4-4ef6-904d-80e83c5ed5ef',_binary ''),('87b9bf99-7bde-42a8-9234-04f9d6d48be7','0cc1d884-3089-4db4-a944-69cb72fdb49c',_binary ''),('87b9bf99-7bde-42a8-9234-04f9d6d48be7','aefee9f7-67c4-4ef6-904d-80e83c5ed5ef',_binary ''),('8d335921-e04d-4bb4-b97a-438540d94a1b','48893ee5-05c2-499b-b546-46b8f521878b',_binary ''),('8d335921-e04d-4bb4-b97a-438540d94a1b','646d23b1-9302-4ad1-bbd7-535e7723164b',_binary '\0'),('8d335921-e04d-4bb4-b97a-438540d94a1b','ea2c9558-15eb-4e7d-8345-36a2defcfef8',_binary ''),('beb60408-3255-42e6-bccb-67baa751d1d8','48893ee5-05c2-499b-b546-46b8f521878b',_binary ''),('beb60408-3255-42e6-bccb-67baa751d1d8','646d23b1-9302-4ad1-bbd7-535e7723164b',_binary '\0'),('beb60408-3255-42e6-bccb-67baa751d1d8','ea2c9558-15eb-4e7d-8345-36a2defcfef8',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `FK_TEMPL_SCOPE_ROLE` (`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('646d23b1-9302-4ad1-bbd7-535e7723164b','a943d792-f79b-4cff-83d3-bee238cc1389'),('d25c5bdf-a8e7-4849-8b4b-9cdc9c29d739','c1af3f2c-e34f-4576-a943-f2ab6dd41a30');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_B4AO2VCVAT6UKAU74WBWTFQO1` (`SESSION_ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('01699587-4a44-42b1-b242-025692a6c209','aes-generated','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','aes-generated','org.keycloak.keys.KeyProvider','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',NULL),('0e720b2a-1b94-438e-839e-a14f4532b9c3','Full Scope Disabled','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','anonymous'),('1599a4fa-aeb7-4b87-83c7-a6103a38b0c9','Allowed Client Templates','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','authenticated'),('281b05cb-96e1-4596-af22-1300cb7916a5','Allowed Client Templates','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','anonymous'),('2a89f637-4808-474d-8736-920e9714a3f5','rsa-generated','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','rsa-generated','org.keycloak.keys.KeyProvider','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',NULL),('36340870-7661-431a-b6a5-efb6ab461bbe','Consent Required','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','anonymous'),('3e5d36d0-d662-48c7-84a8-919446f001c1','Allowed Client Templates','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5978fd6f-c2d3-4620-96b2-fea86b8cdbdf','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('6009aea0-a026-4579-9bc3-e29ee12566ea','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('96d08443-c2ec-47d4-bc4d-934361a4b4c9','Allowed Client Templates','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('a37ed2dc-25de-4906-9e12-423c60c74b33','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('a47c8479-ca54-442b-a246-913fdf5e0aa4','Allowed Protocol Mapper Types','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','authenticated'),('a953fa63-3415-4fa5-b1ba-4c4ed6211ab2','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('b4ab0ae3-2c84-4d24-8a11-1f075d1abe8e','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('ccca9b99-1d10-4c60-8cf6-d100286a51f1','Trusted Hosts','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','anonymous'),('cf265027-7671-47a9-9f18-d0d8ac0af27e','Max Clients Limit','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','anonymous'),('d16c9efb-d673-48dd-8285-f607aeee5adc','Allowed Protocol Mapper Types','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','anonymous'),('e91a48b8-5721-430f-91ac-22d976cddc5b','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('f135c107-ae83-4dae-b97b-75091e9b7742','hmac-generated','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','hmac-generated','org.keycloak.keys.KeyProvider','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',NULL),('f1ea42da-37c9-4cee-992a-2e9d5fbd33da','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('f9ac01da-14f4-48a6-8f8e-f1d6fdefb9bf','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('fa68d7a9-efeb-493c-90f9-c66e5794afde','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_COMPONENT_CONFIG` (`COMPONENT_ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('030cda14-679c-435d-ace2-255bbbc7e301','01699587-4a44-42b1-b242-025692a6c209','kid','b3e03185-fba2-4e0e-b766-276e1d7ebae3'),('0410af18-da43-4c9c-a150-a6aae6f3319b','a47c8479-ca54-442b-a246-913fdf5e0aa4','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('0ad322ed-ee46-4545-b207-8aa00a7fc1b5','b4ab0ae3-2c84-4d24-8a11-1f075d1abe8e','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('0b3614ce-3edd-49e2-85d2-0b9823a126bf','d16c9efb-d673-48dd-8285-f607aeee5adc','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('0b3f94b2-e80f-4a5c-8da4-a81a66c59bed','a47c8479-ca54-442b-a246-913fdf5e0aa4','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('12b83ec3-a52c-40ca-af92-bd13b2a342eb','6009aea0-a026-4579-9bc3-e29ee12566ea','kid','af3a3bec-5cf4-4e2d-a043-73f99fc7081d'),('13722139-e700-4397-b115-fe6a369de062','2a89f637-4808-474d-8736-920e9714a3f5','certificate','MIICmzCCAYMCBgFhUOkQiDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAYzU2NhbGUwHhcNMTgwMjAxMTAyNjQ2WhcNMjgwMjAxMTAyODI2WjARMQ8wDQYDVQQDDAYzU2NhbGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCfac7sRBLFywvJMF0bsR2T6aeggZungXIphNrbNetDRghZQ1rixvk85gkwUa+0KhLu0SHIO9ef90MoO6M/r5vpjDT54yLIfnkCnPJDljwiWst1zeS0mEP9WE23NZVQprvNq4VBgHGMpzdmLcrl99jS1qV04qBk7MDTqbKI85TwIulLx8jdz5mrw/BgW4cSKEe4/JMAry5Jr+btTfmzHyDv4jwALlXXmmPhO3mkXCkuN55kUei+ghDWzI6IcK8C9idE77h7+/XqVyKvA4kDDIeiabf8AAKC1uVjiwOXb9PsTXFEBUFu3rtF1zdNhYCkNKyX4Vam0AkImCzTeegvetPLAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFNAhtEdljWQf11rq7vrjwZWxNmjZ3wtNs0tvF/JYyNEJaDarBJbjcGVVgBGhandHhTzWpJCnPlmoAmDuTTcVHFGz4VU6LkTFyYHnMGfi3omkYrRD0bFj6FEGnyI9BNIcqqDtJX6BCraH0/Ryxyj/isFJeXKFbW8HDiVpP27urBBGazDzLT1U9cb4n1Uuq4yL3SQ3m/uPrR96KzWYD6+xhg5ZwZgPoUhigjJpTK/PHv6OVOObWoa4gLFcsf6lbAwevBMgOk/eb/H1fZP3qUDhTRpZx6JdMpflWc0FV0JNq3LRVI/ldcgUjkjrIKEbFvaWMaHoBS29qlRRo/YdF+nyS0='),('24c35b93-fee0-4417-8af4-32f18484eca9','a47c8479-ca54-442b-a246-913fdf5e0aa4','allowed-protocol-mapper-types','saml-role-list-mapper'),('2b9ee19a-4263-48b7-9993-9621bbaebf54','f135c107-ae83-4dae-b97b-75091e9b7742','priority','100'),('2c1b7bad-350a-4d94-aa79-306dad89042b','d16c9efb-d673-48dd-8285-f607aeee5adc','allowed-protocol-mapper-types','oidc-full-name-mapper'),('2c3e791e-09a6-4a3b-9c96-da7a23530e40','281b05cb-96e1-4596-af22-1300cb7916a5','allow-default-scopes','true'),('2d4968f3-1d8b-4241-b540-7e9b3565b224','f135c107-ae83-4dae-b97b-75091e9b7742','secret','7wmZo1RFBLh8W-JM5fvXpLHDRl19P3myllQUTjHjRKE'),('3707830d-d3ab-419e-82e9-3b82d6508740','d16c9efb-d673-48dd-8285-f607aeee5adc','allowed-protocol-mapper-types','oidc-address-mapper'),('38098a6a-ea4d-4eed-8b03-a4c84e27e169','f1ea42da-37c9-4cee-992a-2e9d5fbd33da','certificate','MIICmzCCAYMCBgFhUOkE7jANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTgwMjAxMTAyNjQzWhcNMjgwMjAxMTAyODIzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCTohnLFk7nwOeGQoMGX4W5CF+kAfo2hmlmCOvvtMvAlv98zssiXyIow5zVUmDQAUD1xFcyqgdKuvpGoENp6Y0VZ0fTUZB6AjATR+a2JQQOsCrBpgc7eLhvhoQKYOJzT3ou68OiKL+BJjjsyJy3OBOHJlj/nND3CF621gh4/rE0P8FJ+jZ5dusJxtfsA1+kKb5uv0coe6pH5Kby7kZa4RM2+A5p4rICbIXSJaMFt7AoCApdokwJcuVr/yisOBSs/ocwTNOwl7l5FLpc1S8TgpkZnmE39f6og516ofZYGOCZTK0zTVYo2eORMo9ImWIluWeOO7QHo+Y5uSrr7FNzkUQrAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAB9HSsiBwPNq0fI9jxefC8z9vvw+auajMWU384p7e+YNYnudqSTkkkNtGCH0zJ2t0trNCffvgeXZOKCkvM8JyJhmRYQDwPvZAJC2crVr9dQY16fgFNaKAG1AbAwz8+Txcm3Y5MAVggBO/Qv5kHpUGw/AA3Zs9c3aeQSE9oIoLioIDxTr+iCs+kcAVBt2DdabytFBhzP4QnK8qJC5twVTP8qP6FWn1IQureGO8nKtT5XauI2iNQetufIkpNg8Ud1BlKvNtC3+dPb1Vr9veQfX4nKctyxGn2Ad9nTrvWr1FSXKayYJgHmTtbBOobBrLiPy8AFzw5gtZ/w8+h7pyYa41H4='),('3cbab0a5-89e9-49b3-ab2c-0dd33384094b','a37ed2dc-25de-4906-9e12-423c60c74b33','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('3f58f981-d220-4aca-a91b-e25aed6871d9','a47c8479-ca54-442b-a246-913fdf5e0aa4','allowed-protocol-mapper-types','oidc-address-mapper'),('4406d2dc-c70a-47b7-a5df-2fdb559841bf','a37ed2dc-25de-4906-9e12-423c60c74b33','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('56a65df5-bf07-4613-a10c-d5a06721c191','b4ab0ae3-2c84-4d24-8a11-1f075d1abe8e','allowed-protocol-mapper-types','saml-user-property-mapper'),('57a0bcae-c891-486e-b36e-3907b62cc3eb','a37ed2dc-25de-4906-9e12-423c60c74b33','allowed-protocol-mapper-types','oidc-address-mapper'),('5886a33a-a63f-43e3-96d9-44be48cc6dcb','fa68d7a9-efeb-493c-90f9-c66e5794afde','host-sending-registration-request-must-match','true'),('5958e9a5-1fd5-4054-8c09-5126445108d5','3e5d36d0-d662-48c7-84a8-919446f001c1','allow-default-scopes','true'),('5c1366f3-b1c1-45d7-8904-04336ff73851','b4ab0ae3-2c84-4d24-8a11-1f075d1abe8e','allowed-protocol-mapper-types','oidc-address-mapper'),('6044d384-a195-4e3c-9d55-0923cac461de','b4ab0ae3-2c84-4d24-8a11-1f075d1abe8e','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('627303d6-f809-42bc-ab07-dbd8e1116f23','96d08443-c2ec-47d4-bc4d-934361a4b4c9','allow-default-scopes','true'),('6e3e9755-27ff-4e01-8b7d-d9a85c631b15','f9ac01da-14f4-48a6-8f8e-f1d6fdefb9bf','secret','Rxq5Zg_sx0jBmipUrE0tyrr91JUZ9jniE2MEoNC8FHc'),('6e4c66e4-0855-46af-a5e2-aa4723a3eb68','f1ea42da-37c9-4cee-992a-2e9d5fbd33da','priority','100'),('6f816b61-c832-4ff4-bb0d-4a467d49bf43','d16c9efb-d673-48dd-8285-f607aeee5adc','allowed-protocol-mapper-types','saml-role-list-mapper'),('72d1238c-ad64-4461-b179-afe14f0b89f7','01699587-4a44-42b1-b242-025692a6c209','secret','xTiqqoWONzImo7NObM4Lvg'),('72e69680-2e69-4f9d-bcee-5846edd8b75a','e91a48b8-5721-430f-91ac-22d976cddc5b','max-clients','200'),('7387f2a9-812b-4db8-922e-292d654165e6','d16c9efb-d673-48dd-8285-f607aeee5adc','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('76451931-0339-4269-8bfc-27dec67e50f1','01699587-4a44-42b1-b242-025692a6c209','priority','100'),('77ea3591-24f6-4de8-8430-cadf7fab345e','a47c8479-ca54-442b-a246-913fdf5e0aa4','allowed-protocol-mapper-types','oidc-full-name-mapper'),('7e7c4b96-8e6f-4b83-a791-daf64086c4a7','6009aea0-a026-4579-9bc3-e29ee12566ea','secret','zI05fwPp3drFlVjO0TReKw'),('7f7344ce-a52c-4eec-8782-7aeefd78b650','d16c9efb-d673-48dd-8285-f607aeee5adc','consent-required-for-all-mappers','true'),('7f99e0f5-a4aa-4eab-ac6e-256959ca1154','d16c9efb-d673-48dd-8285-f607aeee5adc','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('7fd3cf29-e0b2-41c7-bb95-2a37774f2479','b4ab0ae3-2c84-4d24-8a11-1f075d1abe8e','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('8e9440c5-8b81-4a84-8db6-eee48042bf66','b4ab0ae3-2c84-4d24-8a11-1f075d1abe8e','allowed-protocol-mapper-types','oidc-full-name-mapper'),('9308441f-7027-471e-a0ad-796d25b3d3fd','6009aea0-a026-4579-9bc3-e29ee12566ea','priority','100'),('9ded6a55-257e-4df5-8807-04efd33a52a6','f1ea42da-37c9-4cee-992a-2e9d5fbd33da','privateKey','MIIEowIBAAKCAQEAk6IZyxZO58DnhkKDBl+FuQhfpAH6NoZpZgjr77TLwJb/fM7LIl8iKMOc1VJg0AFA9cRXMqoHSrr6RqBDaemNFWdH01GQegIwE0fmtiUEDrAqwaYHO3i4b4aECmDic096LuvDoii/gSY47MictzgThyZY/5zQ9whettYIeP6xND/BSfo2eXbrCcbX7ANfpCm+br9HKHuqR+Sm8u5GWuETNvgOaeKyAmyF0iWjBbewKAgKXaJMCXLla/8orDgUrP6HMEzTsJe5eRS6XNUvE4KZGZ5hN/X+qIOdeqH2WBjgmUytM01WKNnjkTKPSJliJblnjju0B6PmObkq6+xTc5FEKwIDAQABAoIBABPksPMTw3gpH0mRJtSyBHPlc/XGqm+0dvlf1GMNirMd5blsqCSuiwzRJw37tr3wnU9AsLtL/AWO4nCn4c2gwfkTXLNV91DpgI7ojmcW39AW3vwPIkRaRQgKKTq4yWreV8mAzXDJaty9SMhnU+7AaKk6ep2fBO10vEaI2sVrFHfEtvPQdxj4ZKfbSR+RS2XuhHIdDNTMKlz1Xs4j/QP8vAcj8rTtbUq5ZNYogPChye4YRHPqFw2S9l2Tm3cpW1DCc11fwGEVsETG1C/ByzAE44vqBrl46YA+f9GHfKU7uT1hKF29Cca+O/+/VvkFLAZTR+ax/NLHLjBWqXpt5kQEs6ECgYEA035O11l3hMrJbCGToVvgxH7VRwmaSmx+NO4aZSE6jPuI3BiFg5uPT/kDdgCmuxcDLBLJHYEbdnvmWqvPhk752f1Jl0qlyNwbq32v9TQGhjH2m6dmx1zcSX0SjPp7GmiOGuR7BtAL8UPrMCkkPWn8DCwkQnEbfOXb0pB7uRbXPtsCgYEAsrN7DMFVxJF+ZIw+UYKGp00C/YuHy19zq87FAQbPt4u0e/P1Tt1oiw8oozQBx6T42eF8xDYg/oD0ZMAAH+qmUH+KKCs2OixZPnRLFke54/pOuojUeJLhCv7xXBFk4mwo8FJRRBOboSI/5oxOacUuYLBV5kZSHcv4Ma75fzO8yPECgYARw91Zh4FbnTEYLSXaev5BYyoFIpBcSgq75XhAIG9rokFXw5OLf4ilPhSFV/6pXoB8tkNAgDTPWg76dM4kyQOBxR3mYHXWjm6glBkwrqMRqKa/Ymtmua0jWycwwmWOzVOKfMC8zMMEDCF4VSxfIET0vMx67EdT0XcKk+pgnMON2wKBgE1aA1lyFn4PvHYpfpApv7+LRlAZpZ4Soy8rQXtAR4lbn7RH1Vdd33LSDPUX/e09K7qkMC1+gKmpiCBUO7mVCIivrE3W5pInwDmYfSgXxA86uflkYRQP//mSgUcpAFJCHzZna2XcVvFYsfBJq2d9QqX3rjcPGVxsffKDmtvEuWMBAoGBAJl0W7BcugBZTTpt1MDyrZ/l0mNdqOo1ObskiWh3IeyPKItqAAXAhU4GVUBGitfzXUXEoeg5+ixYIbV3IHev3EZAK05iJ2LzBFafs29GOJV1YtmSj4VKaCec1bOlVYoGppdDAX+1yqvIz7GQC+zTP6dLHMLbK+L9n6lE42KzWDaG'),('a3877696-d7f2-49ba-b3cb-99af66c4527c','a37ed2dc-25de-4906-9e12-423c60c74b33','allowed-protocol-mapper-types','saml-user-property-mapper'),('a7394f04-8739-43ec-a70a-532b55380cf5','fa68d7a9-efeb-493c-90f9-c66e5794afde','client-uris-must-match','true'),('ac13da30-12ce-4247-b98f-d2b69bf50bc6','b4ab0ae3-2c84-4d24-8a11-1f075d1abe8e','allowed-protocol-mapper-types','saml-role-list-mapper'),('b0f4fbd1-21d3-45d3-bfce-188e73348887','d16c9efb-d673-48dd-8285-f607aeee5adc','allowed-protocol-mapper-types','saml-user-property-mapper'),('b3bc7f31-5b67-4ceb-8647-4da850de2633','a37ed2dc-25de-4906-9e12-423c60c74b33','allowed-protocol-mapper-types','saml-role-list-mapper'),('b87b8204-f29a-4698-8a4f-11cfaf12cc1b','2a89f637-4808-474d-8736-920e9714a3f5','priority','100'),('b9ee05eb-b7fd-49ae-9a4a-4f71bd64cbf3','b4ab0ae3-2c84-4d24-8a11-1f075d1abe8e','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('bfe49f44-889a-4833-9cc8-4f35bf4ebf6c','d16c9efb-d673-48dd-8285-f607aeee5adc','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('c2c9bdd1-86a6-4fb6-a648-d1d822efad2b','a47c8479-ca54-442b-a246-913fdf5e0aa4','allowed-protocol-mapper-types','saml-user-property-mapper'),('c3426479-5d92-424a-91ed-d36c441e1e44','ccca9b99-1d10-4c60-8cf6-d100286a51f1','host-sending-registration-request-must-match','true'),('c3bdbbdb-cee0-4acc-86f6-7788ed74c5d7','b4ab0ae3-2c84-4d24-8a11-1f075d1abe8e','consent-required-for-all-mappers','true'),('ce7c9612-9242-49e0-8e7e-bcf1488ecc53','a47c8479-ca54-442b-a246-913fdf5e0aa4','consent-required-for-all-mappers','true'),('d783bdf2-31f3-4ff5-855a-a766aacae813','a47c8479-ca54-442b-a246-913fdf5e0aa4','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('e94d94d0-4418-4d0f-be6b-e76f82895ecf','a37ed2dc-25de-4906-9e12-423c60c74b33','allowed-protocol-mapper-types','oidc-full-name-mapper'),('ea2d6aac-5949-472c-bb3b-1c2b2c0c25b9','f9ac01da-14f4-48a6-8f8e-f1d6fdefb9bf','kid','5f3dbb23-4d8a-45bb-b09f-973a4b284af9'),('ec5c85ea-0095-460d-a226-96170fe357c2','f9ac01da-14f4-48a6-8f8e-f1d6fdefb9bf','priority','100'),('ed949f0a-1a77-4afd-8f50-d3c3873779d0','a37ed2dc-25de-4906-9e12-423c60c74b33','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('f1d37539-36c1-44c9-8d7c-5dae5cc477ec','ccca9b99-1d10-4c60-8cf6-d100286a51f1','client-uris-must-match','true'),('f3958795-8d82-4356-9681-32b006f0618f','a37ed2dc-25de-4906-9e12-423c60c74b33','consent-required-for-all-mappers','true'),('f60fd9c7-0931-4259-bf08-200ccd79f127','cf265027-7671-47a9-9f18-d0d8ac0af27e','max-clients','200'),('f772aad7-46ff-4e0a-ba1e-d08165ad604f','a37ed2dc-25de-4906-9e12-423c60c74b33','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('fa16fa29-3e0c-4d25-8cf4-30d715392a96','a47c8479-ca54-442b-a246-913fdf5e0aa4','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('fb200012-0090-4fad-bb05-bcac2792b68b','f135c107-ae83-4dae-b97b-75091e9b7742','kid','31d1c0ac-8b89-4aa4-b37d-d0e8034c4c68'),('fd2a38aa-7a8b-4936-b846-fa160756011e','2a89f637-4808-474d-8736-920e9714a3f5','privateKey','MIIEowIBAAKCAQEAn2nO7EQSxcsLyTBdG7Edk+mnoIGbp4FyKYTa2zXrQ0YIWUNa4sb5POYJMFGvtCoS7tEhyDvXn/dDKDujP6+b6Yw0+eMiyH55ApzyQ5Y8IlrLdc3ktJhD/VhNtzWVUKa7zauFQYBxjKc3Zi3K5ffY0taldOKgZOzA06myiPOU8CLpS8fI3c+Zq8PwYFuHEihHuPyTAK8uSa/m7U35sx8g7+I8AC5V15pj4Tt5pFwpLjeeZFHovoIQ1syOiHCvAvYnRO+4e/v16lcirwOJAwyHomm3/AACgtblY4sDl2/T7E1xRAVBbt67Rdc3TYWApDSsl+FWptAJCJgs03noL3rTywIDAQABAoIBAQCa9GbHEoSM7wnNzs0ylb+Cf6UJR/Ldp94orZNvccH16qVC304BEhhDMffMmBqKrjspGPAVitXWEKue+Bl/VlvfcQItxLOS4B0QhS6Ys/hQDKGpKTIeucOdB7DDXbp+YxQ6n3cwbIHzjrczA2AumfSRPUQnkgMHF3t4Q4Pfy6YCpOQUlO37bJMhIqyLbW2K5pYA6BQ1Ut4QaySwzNfmintiFOEjf+XK/z1VyXuBgDiyBzmcNUDhp21SufQsCRtSw2NHcAcMgmUPxPgsyU7B0a2ghb4BSU4+hDx08Nm1DpI5kZwBtIJ127+e1pY7Aruh3PBltQ9RCmnqPGn3yPJHfKrBAoGBAMrMPLxk96WYBo/GXRhONIHE9PgCNhMUBmY++ru0EeBOZlZ9FEtCJPCEi20tuCOk2KxsSAk1eb7jG5enKFBcndnEJbQgWLbJalt/oFL4nh2RjBI0qw7Elyql9GKLlZ/EONGbrQJUt3Q4CG3EV07DXk+xOmLMMC3rXii2iVLSz4K3AoGBAMk75fR0ny9FpLJMii3bHWb0tmjSA+DpLPAoIWByMuQOb1A+hj+mUQ6WfuuYcjbob1OO+zFj5kddyOtpN+FJWA2tNJBY5jS8Y0dCKAsT2WAPDUw/mlS0ThaFNd3xvxrzkPwKI5H40osy4eU1n0Ro2y0V0xKQSirz7BpX0xAKJdONAoGABJ3ptBBIYwi2/Ybyj58YKuwk95B1UrHeA23jn2pWDdk7EzT9xUjYNnGOCwpDauxR0nsUmMES6HmbIzS3Aj1Zip+gjB1AZ8jmFvcs2za1ws6RdcilLEzldB8bFTNAUMbS1FLK+YacNpUf+//ATRa9iurp/V3Qqvr0xdCCB9SszLkCgYBvAZPAXfTR5uELWh1/XjfB64wUFoX9M6OOdxSyV0yrcSsGYPc9dUmReoNZAyc+EsoWlfELNch55cpH0ir5I7RnFvzAA8o5nRJG5L+iHLj0vFjhjtRblXreAW3NmOWKwIFiB1XH2DKMhu0Fu6a33f/JxxhATUgcmaHMhlXvqylioQKBgGvZfoOgAljgarMuICGnR5NGf3Qxrk0DNEzuRjGwomkadT+gIwp+S4Hpfk6zHeWQizyMqMilehHOfhsmXA77Gyv27Wit/A4k/u8BCj+1zV6OxzbLxjfPKYIkSdJj3TptUvDKhUGmGCIlCkXG4Mcj9TVZE9lE2hOf43xYlwmKGWGX'),('ff387aa9-d0b8-48df-b522-67e60c70bba5','1599a4fa-aeb7-4b87-83c7-a6103a38b0c9','allow-default-scopes','true');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `FK_A63WVEKFTU8JO1PNJ81E7MCE2` (`COMPOSITE`),
  KEY `FK_GR7THLLB9LU8Q4VQA4524JJY8` (`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('46330f50-df16-4866-80a8-3d2a6f182746','9b8d62a8-ec56-4417-941e-210893c4c6e2'),('533d739d-27d3-4e44-860c-626fa58d8373','05091191-cfa6-4142-bbe8-34086d454fd4'),('533d739d-27d3-4e44-860c-626fa58d8373','0c5830cc-26ab-4810-98fe-6ea1144b8358'),('533d739d-27d3-4e44-860c-626fa58d8373','3e51e8c8-b970-4788-a144-b7b8327e20a2'),('533d739d-27d3-4e44-860c-626fa58d8373','4e9741bb-f1f6-4f37-88ee-8f92c10f8081'),('533d739d-27d3-4e44-860c-626fa58d8373','8d4a9441-efcf-427f-92e0-7c9b7063c20d'),('533d739d-27d3-4e44-860c-626fa58d8373','91dcbc35-b1ce-45c7-a235-fb563dd5586d'),('533d739d-27d3-4e44-860c-626fa58d8373','937e24f1-ec21-4830-9ebf-f9a4dde1e543'),('533d739d-27d3-4e44-860c-626fa58d8373','96638d9f-d4d9-46c5-ba6a-fade92b13597'),('533d739d-27d3-4e44-860c-626fa58d8373','97585a58-acf8-49f7-935c-9b9a355a839f'),('533d739d-27d3-4e44-860c-626fa58d8373','abae3526-5bc3-4b89-8f22-6887b6b085ac'),('533d739d-27d3-4e44-860c-626fa58d8373','c7d3af7f-5618-4161-bb1d-89368e19893b'),('533d739d-27d3-4e44-860c-626fa58d8373','ceb963ed-a9ac-471b-8375-b293be3ffae3'),('533d739d-27d3-4e44-860c-626fa58d8373','d5cbbdc8-ce01-404e-ada2-675812aded87'),('533d739d-27d3-4e44-860c-626fa58d8373','e6fe5f38-98cb-4337-8495-7928deb5f9f0'),('5db90717-9846-4e70-b4f9-76e9ef190dc5','62db065c-77ef-439a-978f-b60201dcdadb'),('60600fc2-151c-421b-bb81-886c1719ab6a','6a154721-ef8a-40bf-aad6-d63fc89dabb1'),('726b1cee-e46e-408e-9ec5-07148bf4553c','0f3a53e8-3914-4aeb-821e-d68133febb61'),('726b1cee-e46e-408e-9ec5-07148bf4553c','141bed47-beab-4902-b4ad-b7f1a4d27a7d'),('726b1cee-e46e-408e-9ec5-07148bf4553c','1997b2b7-8693-403a-84cf-99e79339afb9'),('726b1cee-e46e-408e-9ec5-07148bf4553c','25aa2eb0-5564-4ee4-a81e-a90ad781dd6a'),('726b1cee-e46e-408e-9ec5-07148bf4553c','333e11a5-749d-419b-a75a-afee1af442b0'),('726b1cee-e46e-408e-9ec5-07148bf4553c','39e0e128-43e3-4e32-829c-0cc6a31955e4'),('726b1cee-e46e-408e-9ec5-07148bf4553c','412b5a72-184d-4cbd-bbc8-efc4897f23b3'),('726b1cee-e46e-408e-9ec5-07148bf4553c','46330f50-df16-4866-80a8-3d2a6f182746'),('726b1cee-e46e-408e-9ec5-07148bf4553c','518d5e24-cc5f-405a-9e49-fdcfa6e42549'),('726b1cee-e46e-408e-9ec5-07148bf4553c','5db90717-9846-4e70-b4f9-76e9ef190dc5'),('726b1cee-e46e-408e-9ec5-07148bf4553c','629e618e-bc58-404f-8214-eb72cf330269'),('726b1cee-e46e-408e-9ec5-07148bf4553c','681a41d4-6a7f-4501-a3b0-17183aab6ec9'),('726b1cee-e46e-408e-9ec5-07148bf4553c','6c39066c-420a-45c7-a2bc-a1e30ad138d7'),('726b1cee-e46e-408e-9ec5-07148bf4553c','7178b797-df91-4736-bbfc-787d2a48ef57'),('726b1cee-e46e-408e-9ec5-07148bf4553c','76202916-e902-41a1-a039-2d5f06bf7a3a'),('726b1cee-e46e-408e-9ec5-07148bf4553c','76493190-9d73-4b13-9f56-f23c8804b552'),('726b1cee-e46e-408e-9ec5-07148bf4553c','7750873d-2253-475e-be09-3787103c4984'),('726b1cee-e46e-408e-9ec5-07148bf4553c','77f30524-503d-464a-8211-8f34dac8aed8'),('726b1cee-e46e-408e-9ec5-07148bf4553c','a2961456-15ee-4d71-a396-5ea83e8c0c51'),('726b1cee-e46e-408e-9ec5-07148bf4553c','a2a3ccf4-f03b-4f4e-97f7-1d9f9212e2ab'),('726b1cee-e46e-408e-9ec5-07148bf4553c','a8fb8f61-c1ea-41a3-b83a-6c3d80e6b3f8'),('726b1cee-e46e-408e-9ec5-07148bf4553c','b00eb946-b2b0-4131-9e6b-76b95455d83c'),('726b1cee-e46e-408e-9ec5-07148bf4553c','bcb72f38-e55b-4839-aa8c-ba67d43b5c28'),('726b1cee-e46e-408e-9ec5-07148bf4553c','bd3b1162-17d8-426f-90c7-fe41abdb251b'),('726b1cee-e46e-408e-9ec5-07148bf4553c','c5ee1c4f-15ca-459a-a7a5-8d8555396ef8'),('726b1cee-e46e-408e-9ec5-07148bf4553c','d16cbf2b-faa2-45af-9aa4-7b66222fcd7b'),('726b1cee-e46e-408e-9ec5-07148bf4553c','dd532fc9-e939-431a-a558-131f3befc038'),('726b1cee-e46e-408e-9ec5-07148bf4553c','fbeff49c-29aa-4622-bf13-d0bf68e15bb3'),('726b1cee-e46e-408e-9ec5-07148bf4553c','ffd249db-dce2-48ed-86b7-2b9e9264cef6'),('97585a58-acf8-49f7-935c-9b9a355a839f','b7d5952a-c10d-4252-8229-520ddf93da45'),('97585a58-acf8-49f7-935c-9b9a355a839f','cc866aa8-4178-4fb0-9971-71a24b14f9cd'),('c5ee1c4f-15ca-459a-a7a5-8d8555396ef8','5936047c-8a31-478f-a90f-b56e69dbb2e9'),('c5ee1c4f-15ca-459a-a7a5-8d8555396ef8','ca91ee81-19a3-4ef1-855e-34ede245b320'),('c7d3af7f-5618-4161-bb1d-89368e19893b','5717babf-4dcf-42b3-a1d7-3d6ac2361b71'),('dd532fc9-e939-431a-a558-131f3befc038','09db1475-6af9-4551-bbb2-ad2eb853907e'),('dd532fc9-e939-431a-a558-131f3befc038','568206a9-b263-46b2-a909-234c8a12e98d'),('eec19a0f-40b3-4d49-8772-80ff678ad720','c8745a84-5cfd-4155-8737-8f66e461b53e');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` blob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('0247e2a0-e585-445d-9ab4-3a41c1c1fe28',NULL,20000,_binary '\Èmh¥∫|\ZWpP\Â\ËS','password','tPBhZ+LnvFplrdl1kQflZxqcPGHoaOSeCfGxIDZYk5u+V8tbJW3aQtWsZljN79/VHytNL7uuTKcw+gWc6peZQg==','1e847018-100a-46c9-8420-1a5c959b53a1',1517578295156,0,0,0,'pbkdf2'),('328feaf1-d53c-484f-b75d-38db473bae85',NULL,20000,_binary 'æ\◊wZóã∞{~ÙO\'˚ØÖ','password','MISpXH/Pdut2+1ZIQqGyji4lU0MguPX0HlmQyWR56w3y5msaZs92fsI65IHSLoLv2gwYulDEI7+IletjtIPiJw==','7955e816-4d38-4712-aa7b-f65f37c1e567',1517578685108,0,0,0,'pbkdf2'),('66f7b20c-f391-4b3b-97c5-dfb11d7c83ba',NULL,27500,_binary 'c:0»Öf\…Zß^','password','InZzWK4wDUFGKzMvoKZ6+f5zoldNZZ75RrLhTEjtg9W7dcow7YYo5hN+NOhi400r5IY9b2pW9mEe2TbtHQMtGA==','8de0c624-32a9-45f3-b38d-29825af8acf8',1517578340173,0,0,0,'pbkdf2-sha256'),('b0933096-cb5c-4714-8b95-4a9f6cde1eed',NULL,20000,_binary '\…\»ªL@∂\·\»dù4K','password','LQZHAmWQy6gjwx0NVGixuHi/1/cMswUqemeCmjmf3BBPDDXu9o+hTL1aB1KmILZjOS7sJ+/prwJ7MMnrc+tfbg==','bd4f7710-b41f-4c79-b012-6e26a7a20ca2',1519149108702,0,0,0,'pbkdf2'),('ef21dae2-adeb-44b3-b661-797f6180cf07',NULL,27500,_binary '\Z≠Û2¶Øäp\Œ.ÒÇ\«Yã','password','XNaQf+UyQ3nvU0XgQb23B+KaPDlS0noS5UQcdcz7YM7jLtfKoRCbOqsSyDN7u4ZjHE9fpYtwMm/VuufoO1jcWw==','1979013a-d0dd-42a3-8b59-f6f9885a2b8a',NULL,0,0,0,'pbkdf2-sha256');
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL_ATTRIBUTE`
--

DROP TABLE IF EXISTS `CREDENTIAL_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CRED_ATTR` (`CREDENTIAL_ID`),
  KEY `IDX_CREDENTIAL_ATTR_CRED` (`CREDENTIAL_ID`),
  CONSTRAINT `FK_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `CREDENTIAL` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL_ATTRIBUTE`
--

LOCK TABLES `CREDENTIAL_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CREDENTIAL_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2018-02-01 10:27:24',1,'EXECUTED','7:00a57f7a6fb456639b34e62972e0ec02','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x9), addForeignKeyConstraint (x32)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.0.0.Final','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2018-02-01 10:27:24',2,'MARK_RAN','7:f061c3934594ee60a9b2343f5100ae4e','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x6), addForeignKeyConstraint (x30)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2018-02-01 10:27:29',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete (x3), createTable (x3), addColumn (x5), addPrimaryKey (x3), addForeignKeyConstraint (x3), customChange','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2018-02-01 10:27:29',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2018-02-01 10:27:37',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), addUniqueConstraint, addForeignKeyConstra...','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2018-02-01 10:27:37',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), customChange, dropForeignKeyConstraint, d...','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2018-02-01 10:27:44',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, dropForeignKeyConstrai...','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2018-02-01 10:27:44',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addUniqueConstraint, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, r...','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2018-02-01 10:27:44',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update (x3)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2018-02-01 10:27:52',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete (x6), createTable (x7), addColumn, createTable, addColumn (x2), update, dropDefaultValue, dropColumn, addColumn, update (x4), addPrimaryKey (x4), dropPrimaryKey, dropColumn, addPrimaryKey (x4), addForeignKeyConstraint (x8), dropDefaultValue...','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2018-02-01 10:27:54',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete (x7), addColumn (x5), dropColumn, renameTable (x2), update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addColumn','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2018-02-01 10:27:55',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete (x7), addColumn (x5), dropColumn, renameTable, dropForeignKeyConstraint, renameTable, addForeignKeyConstraint, update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addCo...','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2018-02-01 10:27:55',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete (x7), dropDefaultValue, dropColumn, addColumn (x3)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2018-02-01 10:27:56',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn (x3), createTable (x2), addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2018-02-01 10:27:56',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete (x2)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2018-02-01 10:27:56',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey (x2), addColumn, update, dropColumn, addColumn, update, dropColumn, addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2018-02-01 10:27:56',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','Empty','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2018-02-01 10:27:59',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable (x5), addColumn (x2), dropDefaultValue, dropColumn, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint (x2), addUniqueConstrain...','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2018-02-01 10:28:03',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn, createTable (x3), dropNotNullConstraint, addColumn (x2), createTable, addPrimaryKey, addUniqueConstraint, addForeignKeyConstraint (x5), addPrimaryKey, addForeignKeyConstraint (x2), addPrimaryKey, addForeignKeyConstraint, update','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2018-02-01 10:28:03',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue, update','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2018-02-01 10:28:03',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn, createTable (x3), dropNotNullConstraint, addColumn (x2), createTable, addPrimaryKey, addUniqueConstraint, addForeignKeyConstraint (x5), addPrimaryKey, addForeignKeyConstraint (x2), addPrimaryKey, addForeignKeyConstraint, update','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2018-02-01 10:28:03',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue, update','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2018-02-01 10:28:04',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update (x9), customChange, dropForeignKeyConstraint (x2), dropUniqueConstraint, dropTable, dropForeignKeyConstraint (x2), dropTable, dropForeignKeyConstraint (x2), dropUniqueConstraint, dropTable, createIndex','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2018-02-01 10:28:04',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType (x3)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2018-02-01 10:28:04',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType (x2)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2018-02-01 10:28:05',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex (x11)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2018-02-01 10:28:10',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable, addPrimaryKey, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstraint, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstraint, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstrain...','',NULL,'3.4.1',NULL,NULL,'6695029440'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2018-02-01 10:28:10',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update','',NULL,'3.4.1',NULL,NULL,'6695029440'),('2.1.0','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2018-02-01 10:28:12',29,'EXECUTED','7:e01599a82bf8d6dc22a9da506e22e868','createTable (x11), addPrimaryKey (x11), addForeignKeyConstraint (x2)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2018-02-01 10:28:13',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn, createTable (x2), modifyDataType, addForeignKeyConstraint (x2)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2018-02-01 10:28:14',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable, addPrimaryKey, dropDefaultValue, dropColumn, addColumn (x2), customChange, dropColumn (x4), addColumn','',NULL,'3.4.1',NULL,NULL,'6695029440'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2018-02-01 10:28:14',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.4.1',NULL,NULL,'6695029440'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2018-02-01 10:28:14',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange, modifyDataType','',NULL,'3.4.1',NULL,NULL,'6695029440'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2018-02-01 10:28:14',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType (x13), addColumn, sql, dropColumn, renameColumn, modifyDataType (x2)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2018-02-01 10:28:18',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType (x5), dropUniqueConstraint, modifyDataType (x3), addUniqueConstraint, dropPrimaryKey, modifyDataType, addNotNullConstraint, addPrimaryKey, modifyDataType (x5), dropUniqueConstraint, modifyDataType, addUniqueConstraint, modifyDataType','',NULL,'3.4.1',NULL,NULL,'6695029440'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2018-02-01 10:28:18',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn','',NULL,'3.4.1',NULL,NULL,'6695029440'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2018-02-01 10:28:18',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint','',NULL,'3.4.1',NULL,NULL,'6695029440'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2018-02-01 10:28:18',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn','',NULL,'3.4.1',NULL,NULL,'6695029440'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2018-06-19 09:21:30',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn','',NULL,'3.4.1',NULL,NULL,'6695029440'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2018-06-19 09:21:30',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint','',NULL,'3.4.1',NULL,NULL,'6695029440'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2018-06-19 09:21:30',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex, addNotNullConstraint, createIndex','',NULL,'3.4.1',NULL,NULL,'6695029440'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2018-06-19 09:21:38',42,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn, dropPrimaryKey, dropColumn, addPrimaryKey, createTable, addPrimaryKey, addForeignKeyConstraint, createIndex (x45)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2018-06-19 09:21:39',43,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn','',NULL,'3.4.1',NULL,NULL,'6695029440'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2018-06-19 09:21:40',44,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn (x3)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2018-06-19 09:21:40',45,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.4.1',NULL,NULL,'6695029440'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2018-06-19 09:21:40',46,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex (x3)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2018-06-19 09:21:45',47,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint (x3), dropUniqueConstraint (x3), dropForeignKeyConstraint, dropColumn, dropForeignKeyConstraint, dropColumn, dropForeignKeyConstraint, dropColumn, dropPrimaryKey, dropUniqueConstraint, dropColumn, renameColumn (x4), addUniqueC...','',NULL,'3.4.1',NULL,NULL,'6695029440'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2018-06-19 09:21:45',48,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn','',NULL,'3.4.1',NULL,NULL,'6695029440'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2018-06-19 09:21:51',49,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey (x7), dropForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addNotNullConstraint, addPrimaryKey, addNotNullConstraint, addPrimaryKey, addNotNullConstraint, addPrimaryKey, addNotNullConstraint, addPrimaryKey, addNotNullCon...','',NULL,'3.4.1',NULL,NULL,'6695029440'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2018-06-19 09:21:52',50,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex (x11)','',NULL,'3.4.1',NULL,NULL,'6695029440'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2018-06-19 09:21:52',51,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType','',NULL,'3.4.1',NULL,NULL,'6695029440'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2018-06-19 09:21:52',52,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update','',NULL,'3.4.1',NULL,NULL,'6695029440'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2018-06-19 09:21:52',53,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update','',NULL,'3.4.1',NULL,NULL,'6695029440'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2019-12-18 18:50:32',54,'MARK_RAN','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'6695029440'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2019-12-18 18:50:32',55,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'6695029440'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2019-12-18 18:50:32',56,'MARK_RAN','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'6695029440'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2019-12-18 18:50:32',57,'MARK_RAN','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2019-12-18 18:50:32',58,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2019-12-18 18:50:32',59,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2019-12-18 18:50:32',60,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2019-12-18 18:50:36',61,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'6695029440'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2019-12-18 18:50:36',62,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'6695029440'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2019-12-18 18:50:37',63,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'6695029440'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2019-12-18 18:50:37',64,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'6695029440'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2019-12-18 18:50:37',65,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2019-12-18 18:50:37',66,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2019-12-18 18:50:37',67,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2019-12-18 18:50:37',68,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2019-12-18 18:50:37',69,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2019-12-18 18:50:37',70,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2019-12-18 18:50:37',71,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2019-12-18 18:50:37',72,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'6695029440'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2019-12-18 18:50:38',73,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6695029440');
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
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('3150c2d5-c682-48f3-a18a-bad19bdd8aa7','33c85051-e62a-46a5-9a69-5c3f3563937a',_binary '\0'),('3150c2d5-c682-48f3-a18a-bad19bdd8aa7','38f51ba5-8947-4d46-bfdf-2238b3e33f7e',_binary ''),('3150c2d5-c682-48f3-a18a-bad19bdd8aa7','48893ee5-05c2-499b-b546-46b8f521878b',_binary ''),('3150c2d5-c682-48f3-a18a-bad19bdd8aa7','646d23b1-9302-4ad1-bbd7-535e7723164b',_binary '\0'),('3150c2d5-c682-48f3-a18a-bad19bdd8aa7','9fb31fbd-b707-4c42-8e34-a1b7810a3c81',_binary ''),('3150c2d5-c682-48f3-a18a-bad19bdd8aa7','c5733e86-b5b1-404b-90b2-ab7bd1c38a2a',_binary ''),('3150c2d5-c682-48f3-a18a-bad19bdd8aa7','ea2c9558-15eb-4e7d-8345-36a2defcfef8',_binary ''),('3150c2d5-c682-48f3-a18a-bad19bdd8aa7','fb6dae64-e115-43cd-b46f-74e3b6201a15',_binary '\0'),('master','0cc1d884-3089-4db4-a944-69cb72fdb49c',_binary ''),('master','300d871b-d5ff-4a18-a837-367c0e65639c',_binary '\0'),('master','5adcd672-b489-4146-9f5d-173a047ad65d',_binary ''),('master','67102205-ce1b-4a05-9ab5-4f1d16d36564',_binary '\0'),('master','aefee9f7-67c4-4ef6-904d-80e83c5ed5ef',_binary ''),('master','c60f0321-e099-4dfe-b9da-d8c91852f7ec',_binary ''),('master','d25c5bdf-a8e7-4849-8b4b-9cdc9c29d739',_binary '\0'),('master','d6de0570-b1af-4882-a827-21246a36b2f7',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_CREDENTIAL_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_CREDENTIAL_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_CREDENTIAL_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_FED_CRED_ATTR` (`CREDENTIAL_ID`),
  KEY `IDX_FED_CRED_ATTR_CRED` (`CREDENTIAL_ID`),
  CONSTRAINT `FK_FED_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `FED_USER_CREDENTIAL` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_CREDENTIAL_ATTRIBUTE`
--

LOCK TABLES `FED_CREDENTIAL_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_CREDENTIAL_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_CREDENTIAL_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` blob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36) DEFAULT 'HmacSHA1',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_GROUP_ATTRIBUTE_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `FK_GROUP_ROLE_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `FK2B4EBC52AE5C3B34` (`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_IDPM_REALM` (`REALM_ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBossTSTxTable`
--

DROP TABLE IF EXISTS `JBossTSTxTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBossTSTxTable` (
  `StateType` int(11) NOT NULL,
  `Hidden` int(11) NOT NULL,
  `TypeName` varchar(255) NOT NULL,
  `UidString` varchar(255) NOT NULL,
  `ObjectState` blob,
  PRIMARY KEY (`UidString`,`TypeName`,`StateType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBossTSTxTable`
--

LOCK TABLES `JBossTSTxTable` WRITE;
/*!40000 ALTER TABLE `JBossTSTxTable` DISABLE KEYS */;
INSERT INTO `JBossTSTxTable` VALUES (1,0,'EISNAME','0:ffff0a800486:-2d3eb106:5a7ca49c:15',_binary '#BE @\0\0\0\0sso-5-n8hln\0\0\0\0\0\0\0\"java:jboss/datasources/KeycloakDS\0\0\0'),(1,0,'EISNAME','0:ffff0a800495:-13513e5:5a72eb73:14',_binary '#BE @\0\0\0\0sso-5-99vg7\0\0\0\0\0\0\0\"java:jboss/datasources/KeycloakDS\0\0\0'),(1,0,'EISNAME','0:ffff0a82022b:5068fbb3:5a7ae385:15',_binary '#BE @\0\0\0\0sso-5-s7jzs\0\0\0\0\0\0\0\"java:jboss/datasources/KeycloakDS\0\0\0'),(1,0,'EISNAME','0:ffff0a830238:183e5f0c:5a99660c:15',_binary '#BE @\0\0\0\0sso-5-zdj4d\0\0\0\0\0\0\0\"java:jboss/datasources/KeycloakDS\0\0\0');
/*!40000 ALTER TABLE `JBossTSTxTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PARENT_GROUP` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`),
  CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(36) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` (`REALM`),
  KEY `FK_KJHO5LE2C0RAL09FL8CM9WFW9` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('05091191-cfa6-4142-bbe8-34086d454fd4','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_manage-realm}','manage-realm','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('09db1475-6af9-4551-bbb2-ad2eb853907e','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '',NULL,'query-users','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('0c5830cc-26ab-4810-98fe-6ea1144b8358','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_view-realm}','view-realm','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('0f3a53e8-3914-4aeb-821e-d68133febb61','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_manage-authorization}','manage-authorization','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('0fec74d9-2cbd-4baf-8f4c-7fd688cfcd2d','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,'master'),('141bed47-beab-4902-b4ad-b7f1a4d27a7d','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_view-identity-providers}','view-identity-providers','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('1997b2b7-8693-403a-84cf-99e79339afb9','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_manage-realm}','manage-realm','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('199cd067-56c9-4270-9353-12c20b8cd8ce','25af4524-d4f1-46e7-a096-832679647136',_binary '','${role_view-profile}','view-profile','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','25af4524-d4f1-46e7-a096-832679647136',NULL),('25aa2eb0-5564-4ee4-a81e-a90ad781dd6a','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_view-identity-providers}','view-identity-providers','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('333e11a5-749d-419b-a75a-afee1af442b0','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,'master'),('39e0e128-43e3-4e32-829c-0cc6a31955e4','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_manage-users}','manage-users','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('3e51e8c8-b970-4788-a144-b7b8327e20a2','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_impersonation}','impersonation','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('412b5a72-184d-4cbd-bbc8-efc4897f23b3','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_manage-clients}','manage-clients','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('46330f50-df16-4866-80a8-3d2a6f182746','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_view-clients}','view-clients','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('4e9741bb-f1f6-4f37-88ee-8f92c10f8081','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_view-authorization}','view-authorization','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('518d5e24-cc5f-405a-9e49-fdcfa6e42549','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_view-authorization}','view-authorization','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('533d739d-27d3-4e44-860c-626fa58d8373','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_realm-admin}','realm-admin','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('568206a9-b263-46b2-a909-234c8a12e98d','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '',NULL,'query-groups','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('56aacc0f-0cad-4588-9cff-a690edbab071','3ed68957-70e3-48e5-b78b-08e15284ea38',_binary '','${role_read-token}','read-token','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','3ed68957-70e3-48e5-b78b-08e15284ea38',NULL),('5717babf-4dcf-42b3-a1d7-3d6ac2361b71','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '',NULL,'query-clients','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('5936047c-8a31-478f-a90f-b56e69dbb2e9','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '',NULL,'query-groups','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('5db90717-9846-4e70-b4f9-76e9ef190dc5','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_view-clients}','view-clients','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('60600fc2-151c-421b-bb81-886c1719ab6a','25af4524-d4f1-46e7-a096-832679647136',_binary '','${role_manage-account}','manage-account','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','25af4524-d4f1-46e7-a096-832679647136',NULL),('629e618e-bc58-404f-8214-eb72cf330269','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_view-realm}','view-realm','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('62db065c-77ef-439a-978f-b60201dcdadb','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '',NULL,'query-clients','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('681a41d4-6a7f-4501-a3b0-17183aab6ec9','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_create-client}','create-client','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('6a154721-ef8a-40bf-aad6-d63fc89dabb1','25af4524-d4f1-46e7-a096-832679647136',_binary '',NULL,'manage-account-links','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','25af4524-d4f1-46e7-a096-832679647136',NULL),('6c39066c-420a-45c7-a2bc-a1e30ad138d7','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_view-realm}','view-realm','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('7178b797-df91-4736-bbfc-787d2a48ef57','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_impersonation}','impersonation','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('726b1cee-e46e-408e-9ec5-07148bf4553c','master',_binary '\0','${role_admin}','admin','master',NULL,'master'),('76202916-e902-41a1-a039-2d5f06bf7a3a','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_manage-authorization}','manage-authorization','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('76493190-9d73-4b13-9f56-f23c8804b552','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_view-authorization}','view-authorization','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('7750873d-2253-475e-be09-3787103c4984','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_view-events}','view-events','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('77f30524-503d-464a-8211-8f34dac8aed8','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_create-client}','create-client','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('8d4a9441-efcf-427f-92e0-7c9b7063c20d','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_manage-identity-providers}','manage-identity-providers','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('91dcbc35-b1ce-45c7-a235-fb563dd5586d','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_view-identity-providers}','view-identity-providers','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('937e24f1-ec21-4830-9ebf-f9a4dde1e543','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_manage-events}','manage-events','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('96638d9f-d4d9-46c5-ba6a-fade92b13597','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_manage-users}','manage-users','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('97585a58-acf8-49f7-935c-9b9a355a839f','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_view-users}','view-users','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('9b8d62a8-ec56-4417-941e-210893c4c6e2','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '',NULL,'query-clients','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('a2961456-15ee-4d71-a396-5ea83e8c0c51','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_manage-events}','manage-events','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('a2a3ccf4-f03b-4f4e-97f7-1d9f9212e2ab','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_manage-users}','manage-users','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('a3299f48-3a4a-4628-ba8d-204de37085b5','87b9bf99-7bde-42a8-9234-04f9d6d48be7',_binary '','${role_read-token}','read-token','master','87b9bf99-7bde-42a8-9234-04f9d6d48be7',NULL),('a8fb8f61-c1ea-41a3-b83a-6c3d80e6b3f8','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('a943d792-f79b-4cff-83d3-bee238cc1389','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',_binary '\0','${role_offline-access}','offline_access','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',NULL,'3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('abae3526-5bc3-4b89-8f22-6887b6b085ac','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_manage-authorization}','manage-authorization','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('b00eb946-b2b0-4131-9e6b-76b95455d83c','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_impersonation}','impersonation','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('b3631e44-780e-4b26-9ba7-39437e9ac248','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',_binary '','${role_view-profile}','view-profile','master','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',NULL),('b7d5952a-c10d-4252-8229-520ddf93da45','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '',NULL,'query-users','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('bcb72f38-e55b-4839-aa8c-ba67d43b5c28','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('bd3b1162-17d8-426f-90c7-fe41abdb251b','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_manage-clients}','manage-clients','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('c1af3f2c-e34f-4576-a943-f2ab6dd41a30','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,'master'),('c5ee1c4f-15ca-459a-a7a5-8d8555396ef8','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_view-users}','view-users','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('c7d3af7f-5618-4161-bb1d-89368e19893b','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_view-clients}','view-clients','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('c8745a84-5cfd-4155-8737-8f66e461b53e','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',_binary '',NULL,'manage-account-links','master','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',NULL),('ca91ee81-19a3-4ef1-855e-34ede245b320','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '',NULL,'query-users','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('cc866aa8-4178-4fb0-9971-71a24b14f9cd','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '',NULL,'query-groups','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('ceb963ed-a9ac-471b-8375-b293be3ffae3','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_view-events}','view-events','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('d16cbf2b-faa2-45af-9aa4-7b66222fcd7b','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_manage-events}','manage-events','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('d5cbbdc8-ce01-404e-ada2-675812aded87','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_create-client}','create-client','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('d7e3472e-7839-49d9-b5fd-694d4c08809c','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',_binary '\0','${role_uma_authorization}','uma_authorization','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',NULL,'3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('dd532fc9-e939-431a-a558-131f3befc038','31a47fdf-d48d-47c5-8411-c02a95a1c066',_binary '','${role_view-users}','view-users','master','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('e6fe5f38-98cb-4337-8495-7928deb5f9f0','e28b9ff2-395e-4211-a094-ade43a5556c8',_binary '','${role_manage-clients}','manage-clients','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('eec19a0f-40b3-4d49-8772-80ff678ad720','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',_binary '','${role_manage-account}','manage-account','master','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',NULL),('fbeff49c-29aa-4622-bf13-d0bf68e15bb3','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_manage-realm}','manage-realm','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('ffd249db-dce2-48ed-86b7-2b9e9264cef6','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',_binary '','${role_view-events}','view-events','master','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('SINGLETON','4.6.0');
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PCM_REALM` (`CLIENT_ID`),
  KEY `FK_CLI_TMPLT_MAPPER` (`CLIENT_SCOPE_ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('01556ebe-b97c-417a-b5b5-faf84028a38a','full name','openid-connect','oidc-full-name-mapper','49cb0cad-f64e-4364-9005-58a36017b801',NULL),('030a91fc-44e9-4eae-93a1-8c9567f86dda','role list','saml','saml-role-list-mapper','0fb64661-7d51-4942-b23a-7fe077594197',NULL),('04999354-e9e7-48e9-9478-df6b8b55abb3','email','openid-connect','oidc-usermodel-property-mapper',NULL,'d6de0570-b1af-4882-a827-21246a36b2f7'),('0603aa2b-7a28-457b-b75c-12dc9e18d2c9','email','openid-connect','oidc-usermodel-property-mapper','8d335921-e04d-4bb4-b97a-438540d94a1b',NULL),('06193fa8-f1e6-4f5f-9379-c7e4c078c9a2','username','openid-connect','oidc-usermodel-property-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('0619f117-cf46-4f6c-8b86-df3b308b99de','username','openid-connect','oidc-usermodel-property-mapper','8d335921-e04d-4bb4-b97a-438540d94a1b',NULL),('07a7e9a4-c96d-429b-bc60-20e3033aab76','family name','openid-connect','oidc-usermodel-property-mapper','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('08fbe2fc-3b21-4690-aaba-8e296ce04a0c','family name','openid-connect','oidc-usermodel-property-mapper','58d443e5-321d-483f-8e22-6db71136ebfe',NULL),('09118f56-279e-44c7-9250-af21f2d3a0a8','full name','openid-connect','oidc-full-name-mapper','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',NULL),('0a1db766-740f-4d09-bdb0-48590fda4ceb','username','openid-connect','oidc-usermodel-property-mapper','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('0bdeae56-f5ff-4d9d-a84d-6af0b0cec18e','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'aefee9f7-67c4-4ef6-904d-80e83c5ed5ef'),('0c676465-bd02-4dc6-a239-10d2053b44a5','username','openid-connect','oidc-usermodel-property-mapper','58d443e5-321d-483f-8e22-6db71136ebfe',NULL),('0c7d4470-334a-43fb-9d71-14781a543550','role list','saml','saml-role-list-mapper',NULL,'c5733e86-b5b1-404b-90b2-ab7bd1c38a2a'),('0d3321ae-575c-44fe-8548-5ffcb9ef46de','username','openid-connect','oidc-usermodel-property-mapper','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('0e388283-4857-4761-822c-37c0cf22a92c','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('10e4406a-1832-49a7-abe1-730994d1633c','full name','openid-connect','oidc-full-name-mapper','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('1200b26e-06a4-4a86-a7bf-c88d6a243af1','role list','saml','saml-role-list-mapper','6765010a-3cc1-4ba4-9901-ed6347e8313a',NULL),('13040dc8-bc03-47e4-ae04-4a59716043fe','full name','openid-connect','oidc-full-name-mapper','32b129c5-7360-42e4-a167-713cd9e24300',NULL),('13651769-97ea-4af9-b50e-80dc6bc9a915','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('141cf907-c437-4080-b5fd-85cca73974c8','full name','openid-connect','oidc-full-name-mapper','86d79b32-64fd-4255-9970-cd0ad4425873',NULL),('15758a0d-5eba-4c40-b54c-4bddb9282223','role list','saml','saml-role-list-mapper','86d79b32-64fd-4255-9970-cd0ad4425873',NULL),('1887b579-6870-4650-9b27-756a427daa58','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('1895264d-2a9a-4ed2-8136-976b8815ac5b','family name','openid-connect','oidc-usermodel-property-mapper','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',NULL),('1a65463b-ca2d-454b-909e-90fb5b193c07','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'48893ee5-05c2-499b-b546-46b8f521878b'),('1c1e23af-ee7b-434b-9869-3757be293257','role list','saml','saml-role-list-mapper','25af4524-d4f1-46e7-a096-832679647136',NULL),('1c770362-54b0-4f74-9bd5-c3e0a2e1e5fa','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('1f8e3c23-ea8f-40e6-9fb4-8cc6318bc16f','family name','openid-connect','oidc-usermodel-property-mapper','25af4524-d4f1-46e7-a096-832679647136',NULL),('21c284d4-a28b-4a7b-9927-97bfbe443641','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('2279f4c1-d6c5-438d-a7d2-05def25498b1','email verified','openid-connect','oidc-usermodel-property-mapper','beb60408-3255-42e6-bccb-67baa751d1d8',NULL),('26a4c743-3f8f-4b8a-abe3-9113f3739509','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('26c4b44c-5594-48f2-80a1-ed24ec5a85d3','username','openid-connect','oidc-usermodel-property-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('3205e025-8407-4b14-b371-91d79d4a9aeb','full name','openid-connect','oidc-full-name-mapper','3ed68957-70e3-48e5-b78b-08e15284ea38',NULL),('3344f9b3-c114-4444-bf7f-79de018597de','family name','openid-connect','oidc-usermodel-property-mapper','6765010a-3cc1-4ba4-9901-ed6347e8313a',NULL),('336433f0-3b05-4870-be3b-7b971f5c6e9e','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'ea2c9558-15eb-4e7d-8345-36a2defcfef8'),('375839fa-c7a4-4acd-8f36-1b05b65bf045','username','openid-connect','oidc-usermodel-property-mapper','6765010a-3cc1-4ba4-9901-ed6347e8313a',NULL),('37bb00cd-a096-4065-b07a-596c900b843b','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('3b725bd2-e526-44e1-b954-1b8846768678','given name','openid-connect','oidc-usermodel-property-mapper','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('3c3d0567-596a-43c2-a6ec-e11015f47fc0','username','openid-connect','oidc-usermodel-property-mapper','32b129c5-7360-42e4-a167-713cd9e24300',NULL),('3ca399d2-e56e-49a6-92e7-44d551620c8e','username','openid-connect','oidc-usermodel-property-mapper','49cb0cad-f64e-4364-9005-58a36017b801',NULL),('3d31ad92-5645-4c1a-a501-91025964a736','username','openid-connect','oidc-usermodel-property-mapper','87b9bf99-7bde-42a8-9234-04f9d6d48be7',NULL),('3dc7c31e-f6fa-4b02-8007-eb2720272167','family name','openid-connect','oidc-usermodel-property-mapper','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('3e6610dc-e455-44e3-a31b-ce68837b40f5','email','openid-connect','oidc-usermodel-property-mapper','58d443e5-321d-483f-8e22-6db71136ebfe',NULL),('3ed5f5dd-0957-4dd6-8c5a-ba54831907e2','given name','openid-connect','oidc-usermodel-property-mapper','6765010a-3cc1-4ba4-9901-ed6347e8313a',NULL),('3f65ed80-adaf-44d6-9d67-4e6176b74ec2','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'aefee9f7-67c4-4ef6-904d-80e83c5ed5ef'),('41f7d093-d528-4382-b403-a8da95cc32de','given name','openid-connect','oidc-usermodel-property-mapper','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('45af924e-67bf-4c81-adb9-c8dfa32e59c2','given name','openid-connect','oidc-usermodel-property-mapper','3ed68957-70e3-48e5-b78b-08e15284ea38',NULL),('46bda62f-e4aa-4575-8baa-af81ae0be252','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'48893ee5-05c2-499b-b546-46b8f521878b'),('480d1a38-9a21-480a-b264-274b4e441ba9','full name','openid-connect','oidc-full-name-mapper','25af4524-d4f1-46e7-a096-832679647136',NULL),('499b7348-7a9d-4f1d-be4a-6edf38b2c601','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('4bae3443-ac24-42f2-aa00-20cd438533fa','given name','openid-connect','oidc-usermodel-property-mapper','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('4cb46b18-6b0e-46f4-b598-8c4dc850ed27','given name','openid-connect','oidc-usermodel-property-mapper','8d335921-e04d-4bb4-b97a-438540d94a1b',NULL),('4e996300-4c2e-470d-9b8a-e0743f8f0d76','given name','openid-connect','oidc-usermodel-property-mapper','32b129c5-7360-42e4-a167-713cd9e24300',NULL),('4efeeb7d-0442-4915-b7d0-0759d57726ec','family name','openid-connect','oidc-usermodel-property-mapper','beb60408-3255-42e6-bccb-67baa751d1d8',NULL),('5013daaa-e9b4-4986-93f4-655319e8e4f4','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('51ff222f-acf1-4b97-af32-04028a88d42e','family name','openid-connect','oidc-usermodel-property-mapper','3218c624-d052-4a5a-96a9-2e870f4bd957',NULL),('563eb704-a170-4e31-b959-e4e8b0d565ac','family name','openid-connect','oidc-usermodel-property-mapper','3ed68957-70e3-48e5-b78b-08e15284ea38',NULL),('5685ffa3-52f7-408e-a68e-8495b4e4e42f','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('56c80576-be4c-48c6-9104-882d95e7a9a6','full name','openid-connect','oidc-full-name-mapper','58d443e5-321d-483f-8e22-6db71136ebfe',NULL),('587eeddd-b3f7-488d-b263-0474b045f38d','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'48893ee5-05c2-499b-b546-46b8f521878b'),('58f74d8e-070f-4d22-bc32-50a094caacca','role list','saml','saml-role-list-mapper','49cb0cad-f64e-4364-9005-58a36017b801',NULL),('5a39caec-e43a-444f-9abf-58971a529286','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('5bcde673-bccd-48cb-a7cd-7b1113193271','username','openid-connect','oidc-usermodel-property-mapper','3ed68957-70e3-48e5-b78b-08e15284ea38',NULL),('640cbcf2-fafd-4b7f-b6c5-6c99f4a2f57f','given name','openid-connect','oidc-usermodel-property-mapper','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',NULL),('662edac0-80d8-441d-9795-bdc803ca5978','username','openid-connect','oidc-usermodel-property-mapper','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('6872b841-9d59-4b23-9e38-1d5954df4e7d','role list','saml','saml-role-list-mapper','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('693738c3-4f1e-476c-affd-ba9acce1ff38','role list','saml','saml-role-list-mapper',NULL,'c60f0321-e099-4dfe-b9da-d8c91852f7ec'),('6e767a0f-510f-41c4-8b7e-8c2619ad7311','username','openid-connect','oidc-usermodel-property-mapper','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',NULL),('6ec14fac-3462-42c4-9abb-5d5612f11723','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('6efe4d8c-6430-4cfa-82fa-577a07125495','given name','openid-connect','oidc-usermodel-property-mapper','beb60408-3255-42e6-bccb-67baa751d1d8',NULL),('701926ca-57be-49a8-8467-42a65263c173','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('717d3366-1b80-44d0-9954-866931cf47d3','family name','openid-connect','oidc-usermodel-property-mapper','86d79b32-64fd-4255-9970-cd0ad4425873',NULL),('72239a76-2c8a-4e70-8ff7-6275a251be1f','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'0cc1d884-3089-4db4-a944-69cb72fdb49c'),('74647cf3-a644-4514-8783-b60b1cadbac8','full name','openid-connect','oidc-full-name-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('777b8e0e-edbf-48e5-896d-29fb795c5a5c','full name','openid-connect','oidc-full-name-mapper','beb60408-3255-42e6-bccb-67baa751d1d8',NULL),('79125cad-9ca9-4cb5-b04a-b7dab154ed7e','username','openid-connect','oidc-usermodel-property-mapper','3218c624-d052-4a5a-96a9-2e870f4bd957',NULL),('799f4a7c-d1b8-41c5-9c3a-84f2c1e8af38','role list','saml','saml-role-list-mapper','3218c624-d052-4a5a-96a9-2e870f4bd957',NULL),('7cfcc3e4-44be-4c38-8b41-60cbb656be15','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('7ddc1a5d-76ef-4861-84e6-f78709d420ae','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'9fb31fbd-b707-4c42-8e34-a1b7810a3c81'),('7f621062-aea8-4b8f-9009-eba147405807','full name','openid-connect','oidc-full-name-mapper','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('80b5b54d-9086-4582-93e3-725619967bf6','full name','openid-connect','oidc-full-name-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('8183327a-bd0c-431e-b1ac-c27f0110ace9','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','32b129c5-7360-42e4-a167-713cd9e24300',NULL),('81e3ee0b-6e69-4a58-b412-e52a8d47f0d0','username','openid-connect','oidc-usermodel-property-mapper','0fb64661-7d51-4942-b23a-7fe077594197',NULL),('82063368-83ac-4ded-b5a4-1f006266b84c','full name','openid-connect','oidc-full-name-mapper','0fb64661-7d51-4942-b23a-7fe077594197',NULL),('82d0d59c-ea4b-4731-8777-a0fa362380f0','email','openid-connect','oidc-usermodel-property-mapper','3ed68957-70e3-48e5-b78b-08e15284ea38',NULL),('87283d6c-f06f-405c-b4d3-207d34a61e7c','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('87b9a317-8d1d-486f-b4b6-4643fcfd0466','email','openid-connect','oidc-usermodel-property-mapper','beb60408-3255-42e6-bccb-67baa751d1d8',NULL),('8a6513fb-b35a-4e02-a783-3c7bfb39142c','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','32b129c5-7360-42e4-a167-713cd9e24300',NULL),('8c5607ab-1f22-4139-a761-65e04c05b8ae','email','openid-connect','oidc-usermodel-property-mapper','3218c624-d052-4a5a-96a9-2e870f4bd957',NULL),('8e8a25ac-4e91-4a78-9707-8ba54e4a7b37','family name','openid-connect','oidc-usermodel-property-mapper','8d335921-e04d-4bb4-b97a-438540d94a1b',NULL),('8f728292-94a5-46cc-9238-c50ccc0c72fd','email','openid-connect','oidc-usermodel-property-mapper','25af4524-d4f1-46e7-a096-832679647136',NULL),('92ccb976-c258-4449-a0d5-19e0a5200b11','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('97c7de7a-bd16-4d49-9bb8-1676c22a1dad','family name','openid-connect','oidc-usermodel-property-mapper','32b129c5-7360-42e4-a167-713cd9e24300',NULL),('990b2c50-1012-4f4b-8dbe-3c8dcf3a3db6','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('9920546e-828f-408d-8e2f-a8f055e2692a','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'67102205-ce1b-4a05-9ab5-4f1d16d36564'),('9a3025c1-8054-47fc-b0ea-a469fb183681','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'33c85051-e62a-46a5-9a69-5c3f3563937a'),('9b435d22-5f02-4a48-9b1a-c9b574cbbffc','family name','openid-connect','oidc-usermodel-property-mapper','87b9bf99-7bde-42a8-9234-04f9d6d48be7',NULL),('9b7f8386-ae81-41d3-a3f9-70f32a607871','full name','openid-connect','oidc-full-name-mapper','87b9bf99-7bde-42a8-9234-04f9d6d48be7',NULL),('9c290acd-1505-4c7f-9a2b-646ebf564c52','given name','openid-connect','oidc-usermodel-property-mapper','49cb0cad-f64e-4364-9005-58a36017b801',NULL),('9c3cfe1d-1f7e-4d37-8af7-4bff1f06c60a','role list','saml','saml-role-list-mapper','3ed68957-70e3-48e5-b78b-08e15284ea38',NULL),('9cd2c94d-b878-49e0-8f40-ed253d090ec1','full name','openid-connect','oidc-full-name-mapper','3218c624-d052-4a5a-96a9-2e870f4bd957',NULL),('9d2bc2f8-3724-446a-8906-b1eb6baeaec5','role list','saml','saml-role-list-mapper','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('9d749ed2-03fe-4e76-ae05-1e51356ddf4c','given name','openid-connect','oidc-usermodel-property-mapper','0fb64661-7d51-4942-b23a-7fe077594197',NULL),('9e664d60-92ae-4ab9-9558-d299d5d19ec6','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'aefee9f7-67c4-4ef6-904d-80e83c5ed5ef'),('a4481041-1aca-40b3-a8ba-4c7619d0f38c','email','openid-connect','oidc-usermodel-property-mapper','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',NULL),('a79dee64-c220-4d28-9427-a4fcefd7cfe6','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('aa4a2c36-1fb6-4e37-a739-537eafbca289','email','openid-connect','oidc-usermodel-property-mapper','49cb0cad-f64e-4364-9005-58a36017b801',NULL),('aa5cd9c0-b908-4969-ae26-9ea96ea5eb7c','email','openid-connect','oidc-usermodel-property-mapper',NULL,'9fb31fbd-b707-4c42-8e34-a1b7810a3c81'),('ac8a6d7c-ba7c-45f2-816f-0998a4989eec','role list','saml','saml-role-list-mapper','87b9bf99-7bde-42a8-9234-04f9d6d48be7',NULL),('ade9933f-2f95-4523-8dab-34973a417687','given name','openid-connect','oidc-usermodel-property-mapper','58d443e5-321d-483f-8e22-6db71136ebfe',NULL),('b6148bad-3cf2-46ea-b9ce-a21b9daec4d0','username','openid-connect','oidc-usermodel-property-mapper','beb60408-3255-42e6-bccb-67baa751d1d8',NULL),('b62bf55c-430c-4130-ba15-954d6e1657db','username','openid-connect','oidc-usermodel-property-mapper','25af4524-d4f1-46e7-a096-832679647136',NULL),('b968f531-9f20-444a-8534-47c54e31e726','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'33c85051-e62a-46a5-9a69-5c3f3563937a'),('ba254af1-17f7-406b-95db-16dddaed656c','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('bb1a8104-837b-4ea0-b91f-8214dc10eed1','family name','openid-connect','oidc-usermodel-property-mapper','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('bc0bba59-e2ea-4ad4-8264-e43979ade425','email','openid-connect','oidc-usermodel-property-mapper','6765010a-3cc1-4ba4-9901-ed6347e8313a',NULL),('c032e4f0-411d-468d-80eb-5719458672e6','org_name','openid-connect','oidc-usermodel-attribute-mapper','beb60408-3255-42e6-bccb-67baa751d1d8',NULL),('c2d3bdad-b2c2-4278-8fd2-6f4444b50131','address','openid-connect','oidc-address-mapper',NULL,'fb6dae64-e115-43cd-b46f-74e3b6201a15'),('c32ea59d-bddd-449b-a6f7-890f83054429','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('c3fc3ef3-5fb2-4e61-acf3-4f62167f6404','given name','openid-connect','oidc-usermodel-property-mapper','86d79b32-64fd-4255-9970-cd0ad4425873',NULL),('c44e1401-6c33-471e-912d-f63d09c92ca5','email','openid-connect','oidc-usermodel-property-mapper','31a47fdf-d48d-47c5-8411-c02a95a1c066',NULL),('c5a24b9a-5a34-4d0c-8b84-3053851d060b','role list','saml','saml-role-list-mapper','8d335921-e04d-4bb4-b97a-438540d94a1b',NULL),('c5a692b2-329e-4358-82a5-259f9a45f2dd','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('c6d89092-0dfd-4298-b5be-1b310d204354','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'67102205-ce1b-4a05-9ab5-4f1d16d36564'),('c9c47425-585a-4d5f-ad55-39edacd1b9bb','full name','openid-connect','oidc-full-name-mapper','8d335921-e04d-4bb4-b97a-438540d94a1b',NULL),('cc34e169-a681-4819-ae42-4f29fa339ab6','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'d6de0570-b1af-4882-a827-21246a36b2f7'),('cc468be8-83da-4f1a-ae61-ec6301483bc3','locale','openid-connect','oidc-usermodel-attribute-mapper','86d79b32-64fd-4255-9970-cd0ad4425873',NULL),('ccc6c02e-1edb-4ee3-b92e-8c26b994d5d1','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'38f51ba5-8947-4d46-bfdf-2238b3e33f7e'),('ced23ade-1f20-4975-a73b-b433a5b8083c','email','openid-connect','oidc-usermodel-property-mapper','0fb64661-7d51-4942-b23a-7fe077594197',NULL),('d1ef030c-6906-4331-aca4-9a06a4cd4226','role list','saml','saml-role-list-mapper','58d443e5-321d-483f-8e22-6db71136ebfe',NULL),('d32938c6-9e35-476b-8f36-037f039deec5','email','openid-connect','oidc-usermodel-property-mapper','87b9bf99-7bde-42a8-9234-04f9d6d48be7',NULL),('d40bea40-cca8-4aa0-911a-a1c151d33723','given name','openid-connect','oidc-usermodel-property-mapper','3218c624-d052-4a5a-96a9-2e870f4bd957',NULL),('dd7e372b-4dfc-4324-aa1c-7bf359675270','family name','openid-connect','oidc-usermodel-property-mapper','49cb0cad-f64e-4364-9005-58a36017b801',NULL),('dd83e50b-2878-40cf-b8b8-3d78818dc20b','locale','openid-connect','oidc-usermodel-attribute-mapper','6765010a-3cc1-4ba4-9901-ed6347e8313a',NULL),('e374561d-8617-4102-bcbe-f744433c5c9a','email','openid-connect','oidc-usermodel-property-mapper','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('e3c96b9e-aea9-4ebd-8129-994c8efeddbe','full name','openid-connect','oidc-full-name-mapper','6765010a-3cc1-4ba4-9901-ed6347e8313a',NULL),('e8e700f1-fc56-4e0e-9f63-0773d1d55c3d','role list','saml','saml-role-list-mapper','305e34dc-2137-4bf4-8b77-f6fb59cbb0f1',NULL),('ebf3537b-781c-4c7b-a414-5a45b52b82d4','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('ee901473-4fdb-43df-be95-8179afacf05e','full name','openid-connect','oidc-full-name-mapper','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('efa22cda-0b63-4fc5-85e0-9efdaa678873','email','openid-connect','oidc-usermodel-property-mapper','32b129c5-7360-42e4-a167-713cd9e24300',NULL),('f28c6e57-47c2-4250-bb5f-e8b9b9395568','username','openid-connect','oidc-usermodel-property-mapper','86d79b32-64fd-4255-9970-cd0ad4425873',NULL),('f2ab0e9c-f4f6-41aa-8116-77608519e07b','role list','saml','saml-role-list-mapper','beb60408-3255-42e6-bccb-67baa751d1d8',NULL),('f2c4ab9a-541d-4cc3-bc9b-018b522c1b21','email','openid-connect','oidc-usermodel-property-mapper','86d79b32-64fd-4255-9970-cd0ad4425873',NULL),('f3399163-70b1-4dcc-997e-7e05eb74be10','given name','openid-connect','oidc-usermodel-property-mapper','87b9bf99-7bde-42a8-9234-04f9d6d48be7',NULL),('f40b5d05-bd15-4aaa-b8b5-f9f696e7d53b','address','openid-connect','oidc-address-mapper',NULL,'300d871b-d5ff-4a18-a837-367c0e65639c'),('f4b9738c-1fb0-4cc0-92d0-bbbe14d1f0e2','role list','saml','saml-role-list-mapper','e28b9ff2-395e-4211-a094-ade43a5556c8',NULL),('f523b631-5165-4d5a-a286-0202e56e5800','email','openid-connect','oidc-usermodel-property-mapper','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',NULL),('f87b9ed6-4a93-499b-9caf-0a37f61967be','family name','openid-connect','oidc-usermodel-property-mapper','0fb64661-7d51-4942-b23a-7fe077594197',NULL),('f9b37afc-60e9-443f-b6ac-bbc9ce64f715','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'5adcd672-b489-4146-9f5d-173a047ad65d'),('fc32b179-fccc-4ddb-8768-86d10769f2d2','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','32b129c5-7360-42e4-a167-713cd9e24300',NULL),('fcf44623-9150-4f5f-be1f-530446ab942f','role list','saml','saml-role-list-mapper','32b129c5-7360-42e4-a167-713cd9e24300',NULL),('fd6022c9-dc08-489b-836c-beb3e3ae7b97','given name','openid-connect','oidc-usermodel-property-mapper','25af4524-d4f1-46e7-a096-832679647136',NULL);
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('01556ebe-b97c-417a-b5b5-faf84028a38a','true','access.token.claim'),('01556ebe-b97c-417a-b5b5-faf84028a38a','true','id.token.claim'),('030a91fc-44e9-4eae-93a1-8c9567f86dda','Role','attribute.name'),('030a91fc-44e9-4eae-93a1-8c9567f86dda','Basic','attribute.nameformat'),('030a91fc-44e9-4eae-93a1-8c9567f86dda','false','single'),('04999354-e9e7-48e9-9478-df6b8b55abb3','true','access.token.claim'),('04999354-e9e7-48e9-9478-df6b8b55abb3','email','claim.name'),('04999354-e9e7-48e9-9478-df6b8b55abb3','true','id.token.claim'),('04999354-e9e7-48e9-9478-df6b8b55abb3','String','jsonType.label'),('04999354-e9e7-48e9-9478-df6b8b55abb3','email','user.attribute'),('04999354-e9e7-48e9-9478-df6b8b55abb3','true','userinfo.token.claim'),('0603aa2b-7a28-457b-b75c-12dc9e18d2c9','true','access.token.claim'),('0603aa2b-7a28-457b-b75c-12dc9e18d2c9','email','claim.name'),('0603aa2b-7a28-457b-b75c-12dc9e18d2c9','true','id.token.claim'),('0603aa2b-7a28-457b-b75c-12dc9e18d2c9','String','jsonType.label'),('0603aa2b-7a28-457b-b75c-12dc9e18d2c9','email','user.attribute'),('0603aa2b-7a28-457b-b75c-12dc9e18d2c9','true','userinfo.token.claim'),('06193fa8-f1e6-4f5f-9379-c7e4c078c9a2','true','access.token.claim'),('06193fa8-f1e6-4f5f-9379-c7e4c078c9a2','preferred_username','claim.name'),('06193fa8-f1e6-4f5f-9379-c7e4c078c9a2','true','id.token.claim'),('06193fa8-f1e6-4f5f-9379-c7e4c078c9a2','String','jsonType.label'),('06193fa8-f1e6-4f5f-9379-c7e4c078c9a2','username','user.attribute'),('06193fa8-f1e6-4f5f-9379-c7e4c078c9a2','true','userinfo.token.claim'),('0619f117-cf46-4f6c-8b86-df3b308b99de','true','access.token.claim'),('0619f117-cf46-4f6c-8b86-df3b308b99de','preferred_username','claim.name'),('0619f117-cf46-4f6c-8b86-df3b308b99de','true','id.token.claim'),('0619f117-cf46-4f6c-8b86-df3b308b99de','String','jsonType.label'),('0619f117-cf46-4f6c-8b86-df3b308b99de','username','user.attribute'),('0619f117-cf46-4f6c-8b86-df3b308b99de','true','userinfo.token.claim'),('07a7e9a4-c96d-429b-bc60-20e3033aab76','true','access.token.claim'),('07a7e9a4-c96d-429b-bc60-20e3033aab76','family_name','claim.name'),('07a7e9a4-c96d-429b-bc60-20e3033aab76','true','id.token.claim'),('07a7e9a4-c96d-429b-bc60-20e3033aab76','String','jsonType.label'),('07a7e9a4-c96d-429b-bc60-20e3033aab76','lastName','user.attribute'),('07a7e9a4-c96d-429b-bc60-20e3033aab76','true','userinfo.token.claim'),('08fbe2fc-3b21-4690-aaba-8e296ce04a0c','true','access.token.claim'),('08fbe2fc-3b21-4690-aaba-8e296ce04a0c','family_name','claim.name'),('08fbe2fc-3b21-4690-aaba-8e296ce04a0c','true','id.token.claim'),('08fbe2fc-3b21-4690-aaba-8e296ce04a0c','String','jsonType.label'),('08fbe2fc-3b21-4690-aaba-8e296ce04a0c','lastName','user.attribute'),('08fbe2fc-3b21-4690-aaba-8e296ce04a0c','true','userinfo.token.claim'),('09118f56-279e-44c7-9250-af21f2d3a0a8','true','access.token.claim'),('09118f56-279e-44c7-9250-af21f2d3a0a8','true','id.token.claim'),('0a1db766-740f-4d09-bdb0-48590fda4ceb','true','access.token.claim'),('0a1db766-740f-4d09-bdb0-48590fda4ceb','preferred_username','claim.name'),('0a1db766-740f-4d09-bdb0-48590fda4ceb','true','id.token.claim'),('0a1db766-740f-4d09-bdb0-48590fda4ceb','String','jsonType.label'),('0a1db766-740f-4d09-bdb0-48590fda4ceb','username','user.attribute'),('0a1db766-740f-4d09-bdb0-48590fda4ceb','true','userinfo.token.claim'),('0c676465-bd02-4dc6-a239-10d2053b44a5','true','access.token.claim'),('0c676465-bd02-4dc6-a239-10d2053b44a5','preferred_username','claim.name'),('0c676465-bd02-4dc6-a239-10d2053b44a5','true','id.token.claim'),('0c676465-bd02-4dc6-a239-10d2053b44a5','String','jsonType.label'),('0c676465-bd02-4dc6-a239-10d2053b44a5','username','user.attribute'),('0c676465-bd02-4dc6-a239-10d2053b44a5','true','userinfo.token.claim'),('0c7d4470-334a-43fb-9d71-14781a543550','Role','attribute.name'),('0c7d4470-334a-43fb-9d71-14781a543550','Basic','attribute.nameformat'),('0c7d4470-334a-43fb-9d71-14781a543550','false','single'),('0d3321ae-575c-44fe-8548-5ffcb9ef46de','true','access.token.claim'),('0d3321ae-575c-44fe-8548-5ffcb9ef46de','preferred_username','claim.name'),('0d3321ae-575c-44fe-8548-5ffcb9ef46de','true','id.token.claim'),('0d3321ae-575c-44fe-8548-5ffcb9ef46de','String','jsonType.label'),('0d3321ae-575c-44fe-8548-5ffcb9ef46de','username','user.attribute'),('0d3321ae-575c-44fe-8548-5ffcb9ef46de','true','userinfo.token.claim'),('0e388283-4857-4761-822c-37c0cf22a92c','true','access.token.claim'),('0e388283-4857-4761-822c-37c0cf22a92c','birthdate','claim.name'),('0e388283-4857-4761-822c-37c0cf22a92c','true','id.token.claim'),('0e388283-4857-4761-822c-37c0cf22a92c','String','jsonType.label'),('0e388283-4857-4761-822c-37c0cf22a92c','birthdate','user.attribute'),('0e388283-4857-4761-822c-37c0cf22a92c','true','userinfo.token.claim'),('10e4406a-1832-49a7-abe1-730994d1633c','true','access.token.claim'),('10e4406a-1832-49a7-abe1-730994d1633c','true','id.token.claim'),('1200b26e-06a4-4a86-a7bf-c88d6a243af1','Role','attribute.name'),('1200b26e-06a4-4a86-a7bf-c88d6a243af1','Basic','attribute.nameformat'),('1200b26e-06a4-4a86-a7bf-c88d6a243af1','false','single'),('13040dc8-bc03-47e4-ae04-4a59716043fe','true','access.token.claim'),('13040dc8-bc03-47e4-ae04-4a59716043fe','true','id.token.claim'),('13651769-97ea-4af9-b50e-80dc6bc9a915','true','access.token.claim'),('13651769-97ea-4af9-b50e-80dc6bc9a915','zoneinfo','claim.name'),('13651769-97ea-4af9-b50e-80dc6bc9a915','true','id.token.claim'),('13651769-97ea-4af9-b50e-80dc6bc9a915','String','jsonType.label'),('13651769-97ea-4af9-b50e-80dc6bc9a915','zoneinfo','user.attribute'),('13651769-97ea-4af9-b50e-80dc6bc9a915','true','userinfo.token.claim'),('141cf907-c437-4080-b5fd-85cca73974c8','true','access.token.claim'),('141cf907-c437-4080-b5fd-85cca73974c8','true','id.token.claim'),('15758a0d-5eba-4c40-b54c-4bddb9282223','Role','attribute.name'),('15758a0d-5eba-4c40-b54c-4bddb9282223','Basic','attribute.nameformat'),('15758a0d-5eba-4c40-b54c-4bddb9282223','false','single'),('1887b579-6870-4650-9b27-756a427daa58','true','access.token.claim'),('1887b579-6870-4650-9b27-756a427daa58','birthdate','claim.name'),('1887b579-6870-4650-9b27-756a427daa58','true','id.token.claim'),('1887b579-6870-4650-9b27-756a427daa58','String','jsonType.label'),('1887b579-6870-4650-9b27-756a427daa58','birthdate','user.attribute'),('1887b579-6870-4650-9b27-756a427daa58','true','userinfo.token.claim'),('1895264d-2a9a-4ed2-8136-976b8815ac5b','true','access.token.claim'),('1895264d-2a9a-4ed2-8136-976b8815ac5b','family_name','claim.name'),('1895264d-2a9a-4ed2-8136-976b8815ac5b','true','id.token.claim'),('1895264d-2a9a-4ed2-8136-976b8815ac5b','String','jsonType.label'),('1895264d-2a9a-4ed2-8136-976b8815ac5b','lastName','user.attribute'),('1895264d-2a9a-4ed2-8136-976b8815ac5b','true','userinfo.token.claim'),('1a65463b-ca2d-454b-909e-90fb5b193c07','true','access.token.claim'),('1a65463b-ca2d-454b-909e-90fb5b193c07','realm_access.roles','claim.name'),('1a65463b-ca2d-454b-909e-90fb5b193c07','String','jsonType.label'),('1a65463b-ca2d-454b-909e-90fb5b193c07','true','multivalued'),('1a65463b-ca2d-454b-909e-90fb5b193c07','foo','user.attribute'),('1c1e23af-ee7b-434b-9869-3757be293257','Role','attribute.name'),('1c1e23af-ee7b-434b-9869-3757be293257','Basic','attribute.nameformat'),('1c1e23af-ee7b-434b-9869-3757be293257','false','single'),('1c770362-54b0-4f74-9bd5-c3e0a2e1e5fa','true','access.token.claim'),('1c770362-54b0-4f74-9bd5-c3e0a2e1e5fa','zoneinfo','claim.name'),('1c770362-54b0-4f74-9bd5-c3e0a2e1e5fa','true','id.token.claim'),('1c770362-54b0-4f74-9bd5-c3e0a2e1e5fa','String','jsonType.label'),('1c770362-54b0-4f74-9bd5-c3e0a2e1e5fa','zoneinfo','user.attribute'),('1c770362-54b0-4f74-9bd5-c3e0a2e1e5fa','true','userinfo.token.claim'),('1f8e3c23-ea8f-40e6-9fb4-8cc6318bc16f','true','access.token.claim'),('1f8e3c23-ea8f-40e6-9fb4-8cc6318bc16f','family_name','claim.name'),('1f8e3c23-ea8f-40e6-9fb4-8cc6318bc16f','true','id.token.claim'),('1f8e3c23-ea8f-40e6-9fb4-8cc6318bc16f','String','jsonType.label'),('1f8e3c23-ea8f-40e6-9fb4-8cc6318bc16f','lastName','user.attribute'),('1f8e3c23-ea8f-40e6-9fb4-8cc6318bc16f','true','userinfo.token.claim'),('21c284d4-a28b-4a7b-9927-97bfbe443641','true','access.token.claim'),('21c284d4-a28b-4a7b-9927-97bfbe443641','profile','claim.name'),('21c284d4-a28b-4a7b-9927-97bfbe443641','true','id.token.claim'),('21c284d4-a28b-4a7b-9927-97bfbe443641','String','jsonType.label'),('21c284d4-a28b-4a7b-9927-97bfbe443641','profile','user.attribute'),('21c284d4-a28b-4a7b-9927-97bfbe443641','true','userinfo.token.claim'),('2279f4c1-d6c5-438d-a7d2-05def25498b1','true','access.token.claim'),('2279f4c1-d6c5-438d-a7d2-05def25498b1','email_verified','claim.name'),('2279f4c1-d6c5-438d-a7d2-05def25498b1','true','id.token.claim'),('2279f4c1-d6c5-438d-a7d2-05def25498b1','boolean','jsonType.label'),('2279f4c1-d6c5-438d-a7d2-05def25498b1','emailVerified','user.attribute'),('2279f4c1-d6c5-438d-a7d2-05def25498b1','true','userinfo.token.claim'),('26a4c743-3f8f-4b8a-abe3-9113f3739509','true','access.token.claim'),('26a4c743-3f8f-4b8a-abe3-9113f3739509','nickname','claim.name'),('26a4c743-3f8f-4b8a-abe3-9113f3739509','true','id.token.claim'),('26a4c743-3f8f-4b8a-abe3-9113f3739509','String','jsonType.label'),('26a4c743-3f8f-4b8a-abe3-9113f3739509','nickname','user.attribute'),('26a4c743-3f8f-4b8a-abe3-9113f3739509','true','userinfo.token.claim'),('26c4b44c-5594-48f2-80a1-ed24ec5a85d3','true','access.token.claim'),('26c4b44c-5594-48f2-80a1-ed24ec5a85d3','preferred_username','claim.name'),('26c4b44c-5594-48f2-80a1-ed24ec5a85d3','true','id.token.claim'),('26c4b44c-5594-48f2-80a1-ed24ec5a85d3','String','jsonType.label'),('26c4b44c-5594-48f2-80a1-ed24ec5a85d3','username','user.attribute'),('26c4b44c-5594-48f2-80a1-ed24ec5a85d3','true','userinfo.token.claim'),('3205e025-8407-4b14-b371-91d79d4a9aeb','true','access.token.claim'),('3205e025-8407-4b14-b371-91d79d4a9aeb','true','id.token.claim'),('3344f9b3-c114-4444-bf7f-79de018597de','true','access.token.claim'),('3344f9b3-c114-4444-bf7f-79de018597de','family_name','claim.name'),('3344f9b3-c114-4444-bf7f-79de018597de','true','id.token.claim'),('3344f9b3-c114-4444-bf7f-79de018597de','String','jsonType.label'),('3344f9b3-c114-4444-bf7f-79de018597de','lastName','user.attribute'),('3344f9b3-c114-4444-bf7f-79de018597de','true','userinfo.token.claim'),('375839fa-c7a4-4acd-8f36-1b05b65bf045','true','access.token.claim'),('375839fa-c7a4-4acd-8f36-1b05b65bf045','preferred_username','claim.name'),('375839fa-c7a4-4acd-8f36-1b05b65bf045','true','id.token.claim'),('375839fa-c7a4-4acd-8f36-1b05b65bf045','String','jsonType.label'),('375839fa-c7a4-4acd-8f36-1b05b65bf045','username','user.attribute'),('375839fa-c7a4-4acd-8f36-1b05b65bf045','true','userinfo.token.claim'),('37bb00cd-a096-4065-b07a-596c900b843b','true','access.token.claim'),('37bb00cd-a096-4065-b07a-596c900b843b','family_name','claim.name'),('37bb00cd-a096-4065-b07a-596c900b843b','true','id.token.claim'),('37bb00cd-a096-4065-b07a-596c900b843b','String','jsonType.label'),('37bb00cd-a096-4065-b07a-596c900b843b','lastName','user.attribute'),('37bb00cd-a096-4065-b07a-596c900b843b','true','userinfo.token.claim'),('3b725bd2-e526-44e1-b954-1b8846768678','true','access.token.claim'),('3b725bd2-e526-44e1-b954-1b8846768678','given_name','claim.name'),('3b725bd2-e526-44e1-b954-1b8846768678','true','id.token.claim'),('3b725bd2-e526-44e1-b954-1b8846768678','String','jsonType.label'),('3b725bd2-e526-44e1-b954-1b8846768678','firstName','user.attribute'),('3b725bd2-e526-44e1-b954-1b8846768678','true','userinfo.token.claim'),('3c3d0567-596a-43c2-a6ec-e11015f47fc0','true','access.token.claim'),('3c3d0567-596a-43c2-a6ec-e11015f47fc0','preferred_username','claim.name'),('3c3d0567-596a-43c2-a6ec-e11015f47fc0','true','id.token.claim'),('3c3d0567-596a-43c2-a6ec-e11015f47fc0','String','jsonType.label'),('3c3d0567-596a-43c2-a6ec-e11015f47fc0','username','user.attribute'),('3c3d0567-596a-43c2-a6ec-e11015f47fc0','true','userinfo.token.claim'),('3ca399d2-e56e-49a6-92e7-44d551620c8e','true','access.token.claim'),('3ca399d2-e56e-49a6-92e7-44d551620c8e','preferred_username','claim.name'),('3ca399d2-e56e-49a6-92e7-44d551620c8e','true','id.token.claim'),('3ca399d2-e56e-49a6-92e7-44d551620c8e','String','jsonType.label'),('3ca399d2-e56e-49a6-92e7-44d551620c8e','username','user.attribute'),('3ca399d2-e56e-49a6-92e7-44d551620c8e','true','userinfo.token.claim'),('3d31ad92-5645-4c1a-a501-91025964a736','true','access.token.claim'),('3d31ad92-5645-4c1a-a501-91025964a736','preferred_username','claim.name'),('3d31ad92-5645-4c1a-a501-91025964a736','true','id.token.claim'),('3d31ad92-5645-4c1a-a501-91025964a736','String','jsonType.label'),('3d31ad92-5645-4c1a-a501-91025964a736','username','user.attribute'),('3d31ad92-5645-4c1a-a501-91025964a736','true','userinfo.token.claim'),('3dc7c31e-f6fa-4b02-8007-eb2720272167','true','access.token.claim'),('3dc7c31e-f6fa-4b02-8007-eb2720272167','family_name','claim.name'),('3dc7c31e-f6fa-4b02-8007-eb2720272167','true','id.token.claim'),('3dc7c31e-f6fa-4b02-8007-eb2720272167','String','jsonType.label'),('3dc7c31e-f6fa-4b02-8007-eb2720272167','lastName','user.attribute'),('3dc7c31e-f6fa-4b02-8007-eb2720272167','true','userinfo.token.claim'),('3e6610dc-e455-44e3-a31b-ce68837b40f5','true','access.token.claim'),('3e6610dc-e455-44e3-a31b-ce68837b40f5','email','claim.name'),('3e6610dc-e455-44e3-a31b-ce68837b40f5','true','id.token.claim'),('3e6610dc-e455-44e3-a31b-ce68837b40f5','String','jsonType.label'),('3e6610dc-e455-44e3-a31b-ce68837b40f5','email','user.attribute'),('3e6610dc-e455-44e3-a31b-ce68837b40f5','true','userinfo.token.claim'),('3ed5f5dd-0957-4dd6-8c5a-ba54831907e2','true','access.token.claim'),('3ed5f5dd-0957-4dd6-8c5a-ba54831907e2','given_name','claim.name'),('3ed5f5dd-0957-4dd6-8c5a-ba54831907e2','true','id.token.claim'),('3ed5f5dd-0957-4dd6-8c5a-ba54831907e2','String','jsonType.label'),('3ed5f5dd-0957-4dd6-8c5a-ba54831907e2','firstName','user.attribute'),('3ed5f5dd-0957-4dd6-8c5a-ba54831907e2','true','userinfo.token.claim'),('3f65ed80-adaf-44d6-9d67-4e6176b74ec2','true','access.token.claim'),('3f65ed80-adaf-44d6-9d67-4e6176b74ec2','realm_access.roles','claim.name'),('3f65ed80-adaf-44d6-9d67-4e6176b74ec2','String','jsonType.label'),('3f65ed80-adaf-44d6-9d67-4e6176b74ec2','true','multivalued'),('3f65ed80-adaf-44d6-9d67-4e6176b74ec2','foo','user.attribute'),('41f7d093-d528-4382-b403-a8da95cc32de','true','access.token.claim'),('41f7d093-d528-4382-b403-a8da95cc32de','given_name','claim.name'),('41f7d093-d528-4382-b403-a8da95cc32de','true','id.token.claim'),('41f7d093-d528-4382-b403-a8da95cc32de','String','jsonType.label'),('41f7d093-d528-4382-b403-a8da95cc32de','firstName','user.attribute'),('41f7d093-d528-4382-b403-a8da95cc32de','true','userinfo.token.claim'),('45af924e-67bf-4c81-adb9-c8dfa32e59c2','true','access.token.claim'),('45af924e-67bf-4c81-adb9-c8dfa32e59c2','given_name','claim.name'),('45af924e-67bf-4c81-adb9-c8dfa32e59c2','true','id.token.claim'),('45af924e-67bf-4c81-adb9-c8dfa32e59c2','String','jsonType.label'),('45af924e-67bf-4c81-adb9-c8dfa32e59c2','firstName','user.attribute'),('45af924e-67bf-4c81-adb9-c8dfa32e59c2','true','userinfo.token.claim'),('46bda62f-e4aa-4575-8baa-af81ae0be252','true','access.token.claim'),('46bda62f-e4aa-4575-8baa-af81ae0be252','resource_access.${client_id}.roles','claim.name'),('46bda62f-e4aa-4575-8baa-af81ae0be252','String','jsonType.label'),('46bda62f-e4aa-4575-8baa-af81ae0be252','true','multivalued'),('46bda62f-e4aa-4575-8baa-af81ae0be252','foo','user.attribute'),('480d1a38-9a21-480a-b264-274b4e441ba9','true','access.token.claim'),('480d1a38-9a21-480a-b264-274b4e441ba9','true','id.token.claim'),('499b7348-7a9d-4f1d-be4a-6edf38b2c601','true','access.token.claim'),('499b7348-7a9d-4f1d-be4a-6edf38b2c601','picture','claim.name'),('499b7348-7a9d-4f1d-be4a-6edf38b2c601','true','id.token.claim'),('499b7348-7a9d-4f1d-be4a-6edf38b2c601','String','jsonType.label'),('499b7348-7a9d-4f1d-be4a-6edf38b2c601','picture','user.attribute'),('499b7348-7a9d-4f1d-be4a-6edf38b2c601','true','userinfo.token.claim'),('4bae3443-ac24-42f2-aa00-20cd438533fa','true','access.token.claim'),('4bae3443-ac24-42f2-aa00-20cd438533fa','given_name','claim.name'),('4bae3443-ac24-42f2-aa00-20cd438533fa','true','id.token.claim'),('4bae3443-ac24-42f2-aa00-20cd438533fa','String','jsonType.label'),('4bae3443-ac24-42f2-aa00-20cd438533fa','firstName','user.attribute'),('4bae3443-ac24-42f2-aa00-20cd438533fa','true','userinfo.token.claim'),('4cb46b18-6b0e-46f4-b598-8c4dc850ed27','true','access.token.claim'),('4cb46b18-6b0e-46f4-b598-8c4dc850ed27','given_name','claim.name'),('4cb46b18-6b0e-46f4-b598-8c4dc850ed27','true','id.token.claim'),('4cb46b18-6b0e-46f4-b598-8c4dc850ed27','String','jsonType.label'),('4cb46b18-6b0e-46f4-b598-8c4dc850ed27','firstName','user.attribute'),('4cb46b18-6b0e-46f4-b598-8c4dc850ed27','true','userinfo.token.claim'),('4e996300-4c2e-470d-9b8a-e0743f8f0d76','true','access.token.claim'),('4e996300-4c2e-470d-9b8a-e0743f8f0d76','given_name','claim.name'),('4e996300-4c2e-470d-9b8a-e0743f8f0d76','true','id.token.claim'),('4e996300-4c2e-470d-9b8a-e0743f8f0d76','String','jsonType.label'),('4e996300-4c2e-470d-9b8a-e0743f8f0d76','firstName','user.attribute'),('4e996300-4c2e-470d-9b8a-e0743f8f0d76','true','userinfo.token.claim'),('4efeeb7d-0442-4915-b7d0-0759d57726ec','true','access.token.claim'),('4efeeb7d-0442-4915-b7d0-0759d57726ec','family_name','claim.name'),('4efeeb7d-0442-4915-b7d0-0759d57726ec','true','id.token.claim'),('4efeeb7d-0442-4915-b7d0-0759d57726ec','String','jsonType.label'),('4efeeb7d-0442-4915-b7d0-0759d57726ec','lastName','user.attribute'),('4efeeb7d-0442-4915-b7d0-0759d57726ec','true','userinfo.token.claim'),('5013daaa-e9b4-4986-93f4-655319e8e4f4','true','access.token.claim'),('5013daaa-e9b4-4986-93f4-655319e8e4f4','given_name','claim.name'),('5013daaa-e9b4-4986-93f4-655319e8e4f4','true','id.token.claim'),('5013daaa-e9b4-4986-93f4-655319e8e4f4','String','jsonType.label'),('5013daaa-e9b4-4986-93f4-655319e8e4f4','firstName','user.attribute'),('5013daaa-e9b4-4986-93f4-655319e8e4f4','true','userinfo.token.claim'),('51ff222f-acf1-4b97-af32-04028a88d42e','true','access.token.claim'),('51ff222f-acf1-4b97-af32-04028a88d42e','family_name','claim.name'),('51ff222f-acf1-4b97-af32-04028a88d42e','true','id.token.claim'),('51ff222f-acf1-4b97-af32-04028a88d42e','String','jsonType.label'),('51ff222f-acf1-4b97-af32-04028a88d42e','lastName','user.attribute'),('51ff222f-acf1-4b97-af32-04028a88d42e','true','userinfo.token.claim'),('563eb704-a170-4e31-b959-e4e8b0d565ac','true','access.token.claim'),('563eb704-a170-4e31-b959-e4e8b0d565ac','family_name','claim.name'),('563eb704-a170-4e31-b959-e4e8b0d565ac','true','id.token.claim'),('563eb704-a170-4e31-b959-e4e8b0d565ac','String','jsonType.label'),('563eb704-a170-4e31-b959-e4e8b0d565ac','lastName','user.attribute'),('563eb704-a170-4e31-b959-e4e8b0d565ac','true','userinfo.token.claim'),('5685ffa3-52f7-408e-a68e-8495b4e4e42f','true','access.token.claim'),('5685ffa3-52f7-408e-a68e-8495b4e4e42f','gender','claim.name'),('5685ffa3-52f7-408e-a68e-8495b4e4e42f','true','id.token.claim'),('5685ffa3-52f7-408e-a68e-8495b4e4e42f','String','jsonType.label'),('5685ffa3-52f7-408e-a68e-8495b4e4e42f','gender','user.attribute'),('5685ffa3-52f7-408e-a68e-8495b4e4e42f','true','userinfo.token.claim'),('56c80576-be4c-48c6-9104-882d95e7a9a6','true','access.token.claim'),('56c80576-be4c-48c6-9104-882d95e7a9a6','true','id.token.claim'),('58f74d8e-070f-4d22-bc32-50a094caacca','Role','attribute.name'),('58f74d8e-070f-4d22-bc32-50a094caacca','Basic','attribute.nameformat'),('58f74d8e-070f-4d22-bc32-50a094caacca','false','single'),('5a39caec-e43a-444f-9abf-58971a529286','true','access.token.claim'),('5a39caec-e43a-444f-9abf-58971a529286','updated_at','claim.name'),('5a39caec-e43a-444f-9abf-58971a529286','true','id.token.claim'),('5a39caec-e43a-444f-9abf-58971a529286','String','jsonType.label'),('5a39caec-e43a-444f-9abf-58971a529286','updatedAt','user.attribute'),('5a39caec-e43a-444f-9abf-58971a529286','true','userinfo.token.claim'),('5bcde673-bccd-48cb-a7cd-7b1113193271','true','access.token.claim'),('5bcde673-bccd-48cb-a7cd-7b1113193271','preferred_username','claim.name'),('5bcde673-bccd-48cb-a7cd-7b1113193271','true','id.token.claim'),('5bcde673-bccd-48cb-a7cd-7b1113193271','String','jsonType.label'),('5bcde673-bccd-48cb-a7cd-7b1113193271','username','user.attribute'),('5bcde673-bccd-48cb-a7cd-7b1113193271','true','userinfo.token.claim'),('640cbcf2-fafd-4b7f-b6c5-6c99f4a2f57f','true','access.token.claim'),('640cbcf2-fafd-4b7f-b6c5-6c99f4a2f57f','given_name','claim.name'),('640cbcf2-fafd-4b7f-b6c5-6c99f4a2f57f','true','id.token.claim'),('640cbcf2-fafd-4b7f-b6c5-6c99f4a2f57f','String','jsonType.label'),('640cbcf2-fafd-4b7f-b6c5-6c99f4a2f57f','firstName','user.attribute'),('640cbcf2-fafd-4b7f-b6c5-6c99f4a2f57f','true','userinfo.token.claim'),('662edac0-80d8-441d-9795-bdc803ca5978','true','access.token.claim'),('662edac0-80d8-441d-9795-bdc803ca5978','preferred_username','claim.name'),('662edac0-80d8-441d-9795-bdc803ca5978','true','id.token.claim'),('662edac0-80d8-441d-9795-bdc803ca5978','String','jsonType.label'),('662edac0-80d8-441d-9795-bdc803ca5978','username','user.attribute'),('662edac0-80d8-441d-9795-bdc803ca5978','true','userinfo.token.claim'),('6872b841-9d59-4b23-9e38-1d5954df4e7d','Role','attribute.name'),('6872b841-9d59-4b23-9e38-1d5954df4e7d','Basic','attribute.nameformat'),('6872b841-9d59-4b23-9e38-1d5954df4e7d','false','single'),('693738c3-4f1e-476c-affd-ba9acce1ff38','Role','attribute.name'),('693738c3-4f1e-476c-affd-ba9acce1ff38','Basic','attribute.nameformat'),('693738c3-4f1e-476c-affd-ba9acce1ff38','false','single'),('6e767a0f-510f-41c4-8b7e-8c2619ad7311','true','access.token.claim'),('6e767a0f-510f-41c4-8b7e-8c2619ad7311','preferred_username','claim.name'),('6e767a0f-510f-41c4-8b7e-8c2619ad7311','true','id.token.claim'),('6e767a0f-510f-41c4-8b7e-8c2619ad7311','String','jsonType.label'),('6e767a0f-510f-41c4-8b7e-8c2619ad7311','username','user.attribute'),('6e767a0f-510f-41c4-8b7e-8c2619ad7311','true','userinfo.token.claim'),('6ec14fac-3462-42c4-9abb-5d5612f11723','true','access.token.claim'),('6ec14fac-3462-42c4-9abb-5d5612f11723','family_name','claim.name'),('6ec14fac-3462-42c4-9abb-5d5612f11723','true','id.token.claim'),('6ec14fac-3462-42c4-9abb-5d5612f11723','String','jsonType.label'),('6ec14fac-3462-42c4-9abb-5d5612f11723','lastName','user.attribute'),('6ec14fac-3462-42c4-9abb-5d5612f11723','true','userinfo.token.claim'),('6efe4d8c-6430-4cfa-82fa-577a07125495','true','access.token.claim'),('6efe4d8c-6430-4cfa-82fa-577a07125495','given_name','claim.name'),('6efe4d8c-6430-4cfa-82fa-577a07125495','true','id.token.claim'),('6efe4d8c-6430-4cfa-82fa-577a07125495','String','jsonType.label'),('6efe4d8c-6430-4cfa-82fa-577a07125495','firstName','user.attribute'),('6efe4d8c-6430-4cfa-82fa-577a07125495','true','userinfo.token.claim'),('701926ca-57be-49a8-8467-42a65263c173','true','access.token.claim'),('701926ca-57be-49a8-8467-42a65263c173','website','claim.name'),('701926ca-57be-49a8-8467-42a65263c173','true','id.token.claim'),('701926ca-57be-49a8-8467-42a65263c173','String','jsonType.label'),('701926ca-57be-49a8-8467-42a65263c173','website','user.attribute'),('701926ca-57be-49a8-8467-42a65263c173','true','userinfo.token.claim'),('717d3366-1b80-44d0-9954-866931cf47d3','true','access.token.claim'),('717d3366-1b80-44d0-9954-866931cf47d3','family_name','claim.name'),('717d3366-1b80-44d0-9954-866931cf47d3','true','id.token.claim'),('717d3366-1b80-44d0-9954-866931cf47d3','String','jsonType.label'),('717d3366-1b80-44d0-9954-866931cf47d3','lastName','user.attribute'),('717d3366-1b80-44d0-9954-866931cf47d3','true','userinfo.token.claim'),('74647cf3-a644-4514-8783-b60b1cadbac8','true','access.token.claim'),('74647cf3-a644-4514-8783-b60b1cadbac8','true','id.token.claim'),('74647cf3-a644-4514-8783-b60b1cadbac8','true','userinfo.token.claim'),('777b8e0e-edbf-48e5-896d-29fb795c5a5c','true','access.token.claim'),('777b8e0e-edbf-48e5-896d-29fb795c5a5c','true','id.token.claim'),('79125cad-9ca9-4cb5-b04a-b7dab154ed7e','true','access.token.claim'),('79125cad-9ca9-4cb5-b04a-b7dab154ed7e','preferred_username','claim.name'),('79125cad-9ca9-4cb5-b04a-b7dab154ed7e','true','id.token.claim'),('79125cad-9ca9-4cb5-b04a-b7dab154ed7e','String','jsonType.label'),('79125cad-9ca9-4cb5-b04a-b7dab154ed7e','username','user.attribute'),('79125cad-9ca9-4cb5-b04a-b7dab154ed7e','true','userinfo.token.claim'),('799f4a7c-d1b8-41c5-9c3a-84f2c1e8af38','Role','attribute.name'),('799f4a7c-d1b8-41c5-9c3a-84f2c1e8af38','Basic','attribute.nameformat'),('799f4a7c-d1b8-41c5-9c3a-84f2c1e8af38','false','single'),('7cfcc3e4-44be-4c38-8b41-60cbb656be15','true','access.token.claim'),('7cfcc3e4-44be-4c38-8b41-60cbb656be15','gender','claim.name'),('7cfcc3e4-44be-4c38-8b41-60cbb656be15','true','id.token.claim'),('7cfcc3e4-44be-4c38-8b41-60cbb656be15','String','jsonType.label'),('7cfcc3e4-44be-4c38-8b41-60cbb656be15','gender','user.attribute'),('7cfcc3e4-44be-4c38-8b41-60cbb656be15','true','userinfo.token.claim'),('7ddc1a5d-76ef-4861-84e6-f78709d420ae','true','access.token.claim'),('7ddc1a5d-76ef-4861-84e6-f78709d420ae','email_verified','claim.name'),('7ddc1a5d-76ef-4861-84e6-f78709d420ae','true','id.token.claim'),('7ddc1a5d-76ef-4861-84e6-f78709d420ae','boolean','jsonType.label'),('7ddc1a5d-76ef-4861-84e6-f78709d420ae','emailVerified','user.attribute'),('7ddc1a5d-76ef-4861-84e6-f78709d420ae','true','userinfo.token.claim'),('7f621062-aea8-4b8f-9009-eba147405807','true','access.token.claim'),('7f621062-aea8-4b8f-9009-eba147405807','true','id.token.claim'),('80b5b54d-9086-4582-93e3-725619967bf6','true','access.token.claim'),('80b5b54d-9086-4582-93e3-725619967bf6','true','id.token.claim'),('80b5b54d-9086-4582-93e3-725619967bf6','true','userinfo.token.claim'),('8183327a-bd0c-431e-b1ac-c27f0110ace9','true','access.token.claim'),('8183327a-bd0c-431e-b1ac-c27f0110ace9','clientAddress','claim.name'),('8183327a-bd0c-431e-b1ac-c27f0110ace9','true','id.token.claim'),('8183327a-bd0c-431e-b1ac-c27f0110ace9','String','jsonType.label'),('8183327a-bd0c-431e-b1ac-c27f0110ace9','clientAddress','user.session.note'),('81e3ee0b-6e69-4a58-b412-e52a8d47f0d0','true','access.token.claim'),('81e3ee0b-6e69-4a58-b412-e52a8d47f0d0','preferred_username','claim.name'),('81e3ee0b-6e69-4a58-b412-e52a8d47f0d0','true','id.token.claim'),('81e3ee0b-6e69-4a58-b412-e52a8d47f0d0','String','jsonType.label'),('81e3ee0b-6e69-4a58-b412-e52a8d47f0d0','username','user.attribute'),('81e3ee0b-6e69-4a58-b412-e52a8d47f0d0','true','userinfo.token.claim'),('82063368-83ac-4ded-b5a4-1f006266b84c','true','access.token.claim'),('82063368-83ac-4ded-b5a4-1f006266b84c','true','id.token.claim'),('82d0d59c-ea4b-4731-8777-a0fa362380f0','true','access.token.claim'),('82d0d59c-ea4b-4731-8777-a0fa362380f0','email','claim.name'),('82d0d59c-ea4b-4731-8777-a0fa362380f0','true','id.token.claim'),('82d0d59c-ea4b-4731-8777-a0fa362380f0','String','jsonType.label'),('82d0d59c-ea4b-4731-8777-a0fa362380f0','email','user.attribute'),('82d0d59c-ea4b-4731-8777-a0fa362380f0','true','userinfo.token.claim'),('87283d6c-f06f-405c-b4d3-207d34a61e7c','true','access.token.claim'),('87283d6c-f06f-405c-b4d3-207d34a61e7c','nickname','claim.name'),('87283d6c-f06f-405c-b4d3-207d34a61e7c','true','id.token.claim'),('87283d6c-f06f-405c-b4d3-207d34a61e7c','String','jsonType.label'),('87283d6c-f06f-405c-b4d3-207d34a61e7c','nickname','user.attribute'),('87283d6c-f06f-405c-b4d3-207d34a61e7c','true','userinfo.token.claim'),('87b9a317-8d1d-486f-b4b6-4643fcfd0466','true','access.token.claim'),('87b9a317-8d1d-486f-b4b6-4643fcfd0466','email','claim.name'),('87b9a317-8d1d-486f-b4b6-4643fcfd0466','true','id.token.claim'),('87b9a317-8d1d-486f-b4b6-4643fcfd0466','String','jsonType.label'),('87b9a317-8d1d-486f-b4b6-4643fcfd0466','email','user.attribute'),('87b9a317-8d1d-486f-b4b6-4643fcfd0466','true','userinfo.token.claim'),('8a6513fb-b35a-4e02-a783-3c7bfb39142c','true','access.token.claim'),('8a6513fb-b35a-4e02-a783-3c7bfb39142c','clientHost','claim.name'),('8a6513fb-b35a-4e02-a783-3c7bfb39142c','true','id.token.claim'),('8a6513fb-b35a-4e02-a783-3c7bfb39142c','String','jsonType.label'),('8a6513fb-b35a-4e02-a783-3c7bfb39142c','clientHost','user.session.note'),('8c5607ab-1f22-4139-a761-65e04c05b8ae','true','access.token.claim'),('8c5607ab-1f22-4139-a761-65e04c05b8ae','email','claim.name'),('8c5607ab-1f22-4139-a761-65e04c05b8ae','true','id.token.claim'),('8c5607ab-1f22-4139-a761-65e04c05b8ae','String','jsonType.label'),('8c5607ab-1f22-4139-a761-65e04c05b8ae','email','user.attribute'),('8c5607ab-1f22-4139-a761-65e04c05b8ae','true','userinfo.token.claim'),('8e8a25ac-4e91-4a78-9707-8ba54e4a7b37','true','access.token.claim'),('8e8a25ac-4e91-4a78-9707-8ba54e4a7b37','family_name','claim.name'),('8e8a25ac-4e91-4a78-9707-8ba54e4a7b37','true','id.token.claim'),('8e8a25ac-4e91-4a78-9707-8ba54e4a7b37','String','jsonType.label'),('8e8a25ac-4e91-4a78-9707-8ba54e4a7b37','lastName','user.attribute'),('8e8a25ac-4e91-4a78-9707-8ba54e4a7b37','true','userinfo.token.claim'),('8f728292-94a5-46cc-9238-c50ccc0c72fd','true','access.token.claim'),('8f728292-94a5-46cc-9238-c50ccc0c72fd','email','claim.name'),('8f728292-94a5-46cc-9238-c50ccc0c72fd','true','id.token.claim'),('8f728292-94a5-46cc-9238-c50ccc0c72fd','String','jsonType.label'),('8f728292-94a5-46cc-9238-c50ccc0c72fd','email','user.attribute'),('8f728292-94a5-46cc-9238-c50ccc0c72fd','true','userinfo.token.claim'),('92ccb976-c258-4449-a0d5-19e0a5200b11','true','access.token.claim'),('92ccb976-c258-4449-a0d5-19e0a5200b11','middle_name','claim.name'),('92ccb976-c258-4449-a0d5-19e0a5200b11','true','id.token.claim'),('92ccb976-c258-4449-a0d5-19e0a5200b11','String','jsonType.label'),('92ccb976-c258-4449-a0d5-19e0a5200b11','middleName','user.attribute'),('92ccb976-c258-4449-a0d5-19e0a5200b11','true','userinfo.token.claim'),('97c7de7a-bd16-4d49-9bb8-1676c22a1dad','true','access.token.claim'),('97c7de7a-bd16-4d49-9bb8-1676c22a1dad','family_name','claim.name'),('97c7de7a-bd16-4d49-9bb8-1676c22a1dad','true','id.token.claim'),('97c7de7a-bd16-4d49-9bb8-1676c22a1dad','String','jsonType.label'),('97c7de7a-bd16-4d49-9bb8-1676c22a1dad','lastName','user.attribute'),('97c7de7a-bd16-4d49-9bb8-1676c22a1dad','true','userinfo.token.claim'),('990b2c50-1012-4f4b-8dbe-3c8dcf3a3db6','true','access.token.claim'),('990b2c50-1012-4f4b-8dbe-3c8dcf3a3db6','middle_name','claim.name'),('990b2c50-1012-4f4b-8dbe-3c8dcf3a3db6','true','id.token.claim'),('990b2c50-1012-4f4b-8dbe-3c8dcf3a3db6','String','jsonType.label'),('990b2c50-1012-4f4b-8dbe-3c8dcf3a3db6','middleName','user.attribute'),('990b2c50-1012-4f4b-8dbe-3c8dcf3a3db6','true','userinfo.token.claim'),('9920546e-828f-408d-8e2f-a8f055e2692a','true','access.token.claim'),('9920546e-828f-408d-8e2f-a8f055e2692a','phone_number_verified','claim.name'),('9920546e-828f-408d-8e2f-a8f055e2692a','true','id.token.claim'),('9920546e-828f-408d-8e2f-a8f055e2692a','boolean','jsonType.label'),('9920546e-828f-408d-8e2f-a8f055e2692a','phoneNumberVerified','user.attribute'),('9920546e-828f-408d-8e2f-a8f055e2692a','true','userinfo.token.claim'),('9a3025c1-8054-47fc-b0ea-a469fb183681','true','access.token.claim'),('9a3025c1-8054-47fc-b0ea-a469fb183681','phone_number','claim.name'),('9a3025c1-8054-47fc-b0ea-a469fb183681','true','id.token.claim'),('9a3025c1-8054-47fc-b0ea-a469fb183681','String','jsonType.label'),('9a3025c1-8054-47fc-b0ea-a469fb183681','phoneNumber','user.attribute'),('9a3025c1-8054-47fc-b0ea-a469fb183681','true','userinfo.token.claim'),('9b435d22-5f02-4a48-9b1a-c9b574cbbffc','true','access.token.claim'),('9b435d22-5f02-4a48-9b1a-c9b574cbbffc','family_name','claim.name'),('9b435d22-5f02-4a48-9b1a-c9b574cbbffc','true','id.token.claim'),('9b435d22-5f02-4a48-9b1a-c9b574cbbffc','String','jsonType.label'),('9b435d22-5f02-4a48-9b1a-c9b574cbbffc','lastName','user.attribute'),('9b435d22-5f02-4a48-9b1a-c9b574cbbffc','true','userinfo.token.claim'),('9b7f8386-ae81-41d3-a3f9-70f32a607871','true','access.token.claim'),('9b7f8386-ae81-41d3-a3f9-70f32a607871','true','id.token.claim'),('9c290acd-1505-4c7f-9a2b-646ebf564c52','true','access.token.claim'),('9c290acd-1505-4c7f-9a2b-646ebf564c52','given_name','claim.name'),('9c290acd-1505-4c7f-9a2b-646ebf564c52','true','id.token.claim'),('9c290acd-1505-4c7f-9a2b-646ebf564c52','String','jsonType.label'),('9c290acd-1505-4c7f-9a2b-646ebf564c52','firstName','user.attribute'),('9c290acd-1505-4c7f-9a2b-646ebf564c52','true','userinfo.token.claim'),('9c3cfe1d-1f7e-4d37-8af7-4bff1f06c60a','Role','attribute.name'),('9c3cfe1d-1f7e-4d37-8af7-4bff1f06c60a','Basic','attribute.nameformat'),('9c3cfe1d-1f7e-4d37-8af7-4bff1f06c60a','false','single'),('9cd2c94d-b878-49e0-8f40-ed253d090ec1','true','access.token.claim'),('9cd2c94d-b878-49e0-8f40-ed253d090ec1','true','id.token.claim'),('9d2bc2f8-3724-446a-8906-b1eb6baeaec5','Role','attribute.name'),('9d2bc2f8-3724-446a-8906-b1eb6baeaec5','Basic','attribute.nameformat'),('9d2bc2f8-3724-446a-8906-b1eb6baeaec5','false','single'),('9d749ed2-03fe-4e76-ae05-1e51356ddf4c','true','access.token.claim'),('9d749ed2-03fe-4e76-ae05-1e51356ddf4c','given_name','claim.name'),('9d749ed2-03fe-4e76-ae05-1e51356ddf4c','true','id.token.claim'),('9d749ed2-03fe-4e76-ae05-1e51356ddf4c','String','jsonType.label'),('9d749ed2-03fe-4e76-ae05-1e51356ddf4c','firstName','user.attribute'),('9d749ed2-03fe-4e76-ae05-1e51356ddf4c','true','userinfo.token.claim'),('9e664d60-92ae-4ab9-9558-d299d5d19ec6','true','access.token.claim'),('9e664d60-92ae-4ab9-9558-d299d5d19ec6','resource_access.${client_id}.roles','claim.name'),('9e664d60-92ae-4ab9-9558-d299d5d19ec6','String','jsonType.label'),('9e664d60-92ae-4ab9-9558-d299d5d19ec6','true','multivalued'),('9e664d60-92ae-4ab9-9558-d299d5d19ec6','foo','user.attribute'),('a4481041-1aca-40b3-a8ba-4c7619d0f38c','true','access.token.claim'),('a4481041-1aca-40b3-a8ba-4c7619d0f38c','email','claim.name'),('a4481041-1aca-40b3-a8ba-4c7619d0f38c','true','id.token.claim'),('a4481041-1aca-40b3-a8ba-4c7619d0f38c','String','jsonType.label'),('a4481041-1aca-40b3-a8ba-4c7619d0f38c','email','user.attribute'),('a4481041-1aca-40b3-a8ba-4c7619d0f38c','true','userinfo.token.claim'),('a79dee64-c220-4d28-9427-a4fcefd7cfe6','true','access.token.claim'),('a79dee64-c220-4d28-9427-a4fcefd7cfe6','website','claim.name'),('a79dee64-c220-4d28-9427-a4fcefd7cfe6','true','id.token.claim'),('a79dee64-c220-4d28-9427-a4fcefd7cfe6','String','jsonType.label'),('a79dee64-c220-4d28-9427-a4fcefd7cfe6','website','user.attribute'),('a79dee64-c220-4d28-9427-a4fcefd7cfe6','true','userinfo.token.claim'),('aa4a2c36-1fb6-4e37-a739-537eafbca289','true','access.token.claim'),('aa4a2c36-1fb6-4e37-a739-537eafbca289','email','claim.name'),('aa4a2c36-1fb6-4e37-a739-537eafbca289','true','id.token.claim'),('aa4a2c36-1fb6-4e37-a739-537eafbca289','String','jsonType.label'),('aa4a2c36-1fb6-4e37-a739-537eafbca289','email','user.attribute'),('aa4a2c36-1fb6-4e37-a739-537eafbca289','true','userinfo.token.claim'),('aa5cd9c0-b908-4969-ae26-9ea96ea5eb7c','true','access.token.claim'),('aa5cd9c0-b908-4969-ae26-9ea96ea5eb7c','email','claim.name'),('aa5cd9c0-b908-4969-ae26-9ea96ea5eb7c','true','id.token.claim'),('aa5cd9c0-b908-4969-ae26-9ea96ea5eb7c','String','jsonType.label'),('aa5cd9c0-b908-4969-ae26-9ea96ea5eb7c','email','user.attribute'),('aa5cd9c0-b908-4969-ae26-9ea96ea5eb7c','true','userinfo.token.claim'),('ac8a6d7c-ba7c-45f2-816f-0998a4989eec','Role','attribute.name'),('ac8a6d7c-ba7c-45f2-816f-0998a4989eec','Basic','attribute.nameformat'),('ac8a6d7c-ba7c-45f2-816f-0998a4989eec','false','single'),('ade9933f-2f95-4523-8dab-34973a417687','true','access.token.claim'),('ade9933f-2f95-4523-8dab-34973a417687','given_name','claim.name'),('ade9933f-2f95-4523-8dab-34973a417687','true','id.token.claim'),('ade9933f-2f95-4523-8dab-34973a417687','String','jsonType.label'),('ade9933f-2f95-4523-8dab-34973a417687','firstName','user.attribute'),('ade9933f-2f95-4523-8dab-34973a417687','true','userinfo.token.claim'),('b6148bad-3cf2-46ea-b9ce-a21b9daec4d0','true','access.token.claim'),('b6148bad-3cf2-46ea-b9ce-a21b9daec4d0','preferred_username','claim.name'),('b6148bad-3cf2-46ea-b9ce-a21b9daec4d0','true','id.token.claim'),('b6148bad-3cf2-46ea-b9ce-a21b9daec4d0','String','jsonType.label'),('b6148bad-3cf2-46ea-b9ce-a21b9daec4d0','username','user.attribute'),('b6148bad-3cf2-46ea-b9ce-a21b9daec4d0','true','userinfo.token.claim'),('b62bf55c-430c-4130-ba15-954d6e1657db','true','access.token.claim'),('b62bf55c-430c-4130-ba15-954d6e1657db','preferred_username','claim.name'),('b62bf55c-430c-4130-ba15-954d6e1657db','true','id.token.claim'),('b62bf55c-430c-4130-ba15-954d6e1657db','String','jsonType.label'),('b62bf55c-430c-4130-ba15-954d6e1657db','username','user.attribute'),('b62bf55c-430c-4130-ba15-954d6e1657db','true','userinfo.token.claim'),('b968f531-9f20-444a-8534-47c54e31e726','true','access.token.claim'),('b968f531-9f20-444a-8534-47c54e31e726','phone_number_verified','claim.name'),('b968f531-9f20-444a-8534-47c54e31e726','true','id.token.claim'),('b968f531-9f20-444a-8534-47c54e31e726','boolean','jsonType.label'),('b968f531-9f20-444a-8534-47c54e31e726','phoneNumberVerified','user.attribute'),('b968f531-9f20-444a-8534-47c54e31e726','true','userinfo.token.claim'),('ba254af1-17f7-406b-95db-16dddaed656c','true','access.token.claim'),('ba254af1-17f7-406b-95db-16dddaed656c','locale','claim.name'),('ba254af1-17f7-406b-95db-16dddaed656c','true','id.token.claim'),('ba254af1-17f7-406b-95db-16dddaed656c','String','jsonType.label'),('ba254af1-17f7-406b-95db-16dddaed656c','locale','user.attribute'),('ba254af1-17f7-406b-95db-16dddaed656c','true','userinfo.token.claim'),('bb1a8104-837b-4ea0-b91f-8214dc10eed1','true','access.token.claim'),('bb1a8104-837b-4ea0-b91f-8214dc10eed1','family_name','claim.name'),('bb1a8104-837b-4ea0-b91f-8214dc10eed1','true','id.token.claim'),('bb1a8104-837b-4ea0-b91f-8214dc10eed1','String','jsonType.label'),('bb1a8104-837b-4ea0-b91f-8214dc10eed1','lastName','user.attribute'),('bb1a8104-837b-4ea0-b91f-8214dc10eed1','true','userinfo.token.claim'),('bc0bba59-e2ea-4ad4-8264-e43979ade425','true','access.token.claim'),('bc0bba59-e2ea-4ad4-8264-e43979ade425','email','claim.name'),('bc0bba59-e2ea-4ad4-8264-e43979ade425','true','id.token.claim'),('bc0bba59-e2ea-4ad4-8264-e43979ade425','String','jsonType.label'),('bc0bba59-e2ea-4ad4-8264-e43979ade425','email','user.attribute'),('bc0bba59-e2ea-4ad4-8264-e43979ade425','true','userinfo.token.claim'),('c032e4f0-411d-468d-80eb-5719458672e6','true','access.token.claim'),('c032e4f0-411d-468d-80eb-5719458672e6','org_name','claim.name'),('c032e4f0-411d-468d-80eb-5719458672e6','true','id.token.claim'),('c032e4f0-411d-468d-80eb-5719458672e6','String','jsonType.label'),('c032e4f0-411d-468d-80eb-5719458672e6','org_name','user.attribute'),('c032e4f0-411d-468d-80eb-5719458672e6','true','userinfo.token.claim'),('c2d3bdad-b2c2-4278-8fd2-6f4444b50131','true','access.token.claim'),('c2d3bdad-b2c2-4278-8fd2-6f4444b50131','true','id.token.claim'),('c2d3bdad-b2c2-4278-8fd2-6f4444b50131','country','user.attribute.country'),('c2d3bdad-b2c2-4278-8fd2-6f4444b50131','formatted','user.attribute.formatted'),('c2d3bdad-b2c2-4278-8fd2-6f4444b50131','locality','user.attribute.locality'),('c2d3bdad-b2c2-4278-8fd2-6f4444b50131','postal_code','user.attribute.postal_code'),('c2d3bdad-b2c2-4278-8fd2-6f4444b50131','region','user.attribute.region'),('c2d3bdad-b2c2-4278-8fd2-6f4444b50131','street','user.attribute.street'),('c2d3bdad-b2c2-4278-8fd2-6f4444b50131','true','userinfo.token.claim'),('c32ea59d-bddd-449b-a6f7-890f83054429','true','access.token.claim'),('c32ea59d-bddd-449b-a6f7-890f83054429','picture','claim.name'),('c32ea59d-bddd-449b-a6f7-890f83054429','true','id.token.claim'),('c32ea59d-bddd-449b-a6f7-890f83054429','String','jsonType.label'),('c32ea59d-bddd-449b-a6f7-890f83054429','picture','user.attribute'),('c32ea59d-bddd-449b-a6f7-890f83054429','true','userinfo.token.claim'),('c3fc3ef3-5fb2-4e61-acf3-4f62167f6404','true','access.token.claim'),('c3fc3ef3-5fb2-4e61-acf3-4f62167f6404','given_name','claim.name'),('c3fc3ef3-5fb2-4e61-acf3-4f62167f6404','true','id.token.claim'),('c3fc3ef3-5fb2-4e61-acf3-4f62167f6404','String','jsonType.label'),('c3fc3ef3-5fb2-4e61-acf3-4f62167f6404','firstName','user.attribute'),('c3fc3ef3-5fb2-4e61-acf3-4f62167f6404','true','userinfo.token.claim'),('c44e1401-6c33-471e-912d-f63d09c92ca5','true','access.token.claim'),('c44e1401-6c33-471e-912d-f63d09c92ca5','email','claim.name'),('c44e1401-6c33-471e-912d-f63d09c92ca5','true','id.token.claim'),('c44e1401-6c33-471e-912d-f63d09c92ca5','String','jsonType.label'),('c44e1401-6c33-471e-912d-f63d09c92ca5','email','user.attribute'),('c44e1401-6c33-471e-912d-f63d09c92ca5','true','userinfo.token.claim'),('c5a24b9a-5a34-4d0c-8b84-3053851d060b','Role','attribute.name'),('c5a24b9a-5a34-4d0c-8b84-3053851d060b','Basic','attribute.nameformat'),('c5a24b9a-5a34-4d0c-8b84-3053851d060b','false','single'),('c5a692b2-329e-4358-82a5-259f9a45f2dd','true','access.token.claim'),('c5a692b2-329e-4358-82a5-259f9a45f2dd','updated_at','claim.name'),('c5a692b2-329e-4358-82a5-259f9a45f2dd','true','id.token.claim'),('c5a692b2-329e-4358-82a5-259f9a45f2dd','String','jsonType.label'),('c5a692b2-329e-4358-82a5-259f9a45f2dd','updatedAt','user.attribute'),('c5a692b2-329e-4358-82a5-259f9a45f2dd','true','userinfo.token.claim'),('c6d89092-0dfd-4298-b5be-1b310d204354','true','access.token.claim'),('c6d89092-0dfd-4298-b5be-1b310d204354','phone_number','claim.name'),('c6d89092-0dfd-4298-b5be-1b310d204354','true','id.token.claim'),('c6d89092-0dfd-4298-b5be-1b310d204354','String','jsonType.label'),('c6d89092-0dfd-4298-b5be-1b310d204354','phoneNumber','user.attribute'),('c6d89092-0dfd-4298-b5be-1b310d204354','true','userinfo.token.claim'),('c9c47425-585a-4d5f-ad55-39edacd1b9bb','true','access.token.claim'),('c9c47425-585a-4d5f-ad55-39edacd1b9bb','true','id.token.claim'),('cc34e169-a681-4819-ae42-4f29fa339ab6','true','access.token.claim'),('cc34e169-a681-4819-ae42-4f29fa339ab6','email_verified','claim.name'),('cc34e169-a681-4819-ae42-4f29fa339ab6','true','id.token.claim'),('cc34e169-a681-4819-ae42-4f29fa339ab6','boolean','jsonType.label'),('cc34e169-a681-4819-ae42-4f29fa339ab6','emailVerified','user.attribute'),('cc34e169-a681-4819-ae42-4f29fa339ab6','true','userinfo.token.claim'),('cc468be8-83da-4f1a-ae61-ec6301483bc3','true','access.token.claim'),('cc468be8-83da-4f1a-ae61-ec6301483bc3','locale','claim.name'),('cc468be8-83da-4f1a-ae61-ec6301483bc3','true','id.token.claim'),('cc468be8-83da-4f1a-ae61-ec6301483bc3','String','jsonType.label'),('cc468be8-83da-4f1a-ae61-ec6301483bc3','locale','user.attribute'),('cc468be8-83da-4f1a-ae61-ec6301483bc3','true','userinfo.token.claim'),('ccc6c02e-1edb-4ee3-b92e-8c26b994d5d1','true','access.token.claim'),('ccc6c02e-1edb-4ee3-b92e-8c26b994d5d1','locale','claim.name'),('ccc6c02e-1edb-4ee3-b92e-8c26b994d5d1','true','id.token.claim'),('ccc6c02e-1edb-4ee3-b92e-8c26b994d5d1','String','jsonType.label'),('ccc6c02e-1edb-4ee3-b92e-8c26b994d5d1','locale','user.attribute'),('ccc6c02e-1edb-4ee3-b92e-8c26b994d5d1','true','userinfo.token.claim'),('ced23ade-1f20-4975-a73b-b433a5b8083c','true','access.token.claim'),('ced23ade-1f20-4975-a73b-b433a5b8083c','email','claim.name'),('ced23ade-1f20-4975-a73b-b433a5b8083c','true','id.token.claim'),('ced23ade-1f20-4975-a73b-b433a5b8083c','String','jsonType.label'),('ced23ade-1f20-4975-a73b-b433a5b8083c','email','user.attribute'),('ced23ade-1f20-4975-a73b-b433a5b8083c','true','userinfo.token.claim'),('d1ef030c-6906-4331-aca4-9a06a4cd4226','Role','attribute.name'),('d1ef030c-6906-4331-aca4-9a06a4cd4226','Basic','attribute.nameformat'),('d1ef030c-6906-4331-aca4-9a06a4cd4226','false','single'),('d32938c6-9e35-476b-8f36-037f039deec5','true','access.token.claim'),('d32938c6-9e35-476b-8f36-037f039deec5','email','claim.name'),('d32938c6-9e35-476b-8f36-037f039deec5','true','id.token.claim'),('d32938c6-9e35-476b-8f36-037f039deec5','String','jsonType.label'),('d32938c6-9e35-476b-8f36-037f039deec5','email','user.attribute'),('d32938c6-9e35-476b-8f36-037f039deec5','true','userinfo.token.claim'),('d40bea40-cca8-4aa0-911a-a1c151d33723','true','access.token.claim'),('d40bea40-cca8-4aa0-911a-a1c151d33723','given_name','claim.name'),('d40bea40-cca8-4aa0-911a-a1c151d33723','true','id.token.claim'),('d40bea40-cca8-4aa0-911a-a1c151d33723','String','jsonType.label'),('d40bea40-cca8-4aa0-911a-a1c151d33723','firstName','user.attribute'),('d40bea40-cca8-4aa0-911a-a1c151d33723','true','userinfo.token.claim'),('dd7e372b-4dfc-4324-aa1c-7bf359675270','true','access.token.claim'),('dd7e372b-4dfc-4324-aa1c-7bf359675270','family_name','claim.name'),('dd7e372b-4dfc-4324-aa1c-7bf359675270','true','id.token.claim'),('dd7e372b-4dfc-4324-aa1c-7bf359675270','String','jsonType.label'),('dd7e372b-4dfc-4324-aa1c-7bf359675270','lastName','user.attribute'),('dd7e372b-4dfc-4324-aa1c-7bf359675270','true','userinfo.token.claim'),('dd83e50b-2878-40cf-b8b8-3d78818dc20b','true','access.token.claim'),('dd83e50b-2878-40cf-b8b8-3d78818dc20b','locale','claim.name'),('dd83e50b-2878-40cf-b8b8-3d78818dc20b','true','id.token.claim'),('dd83e50b-2878-40cf-b8b8-3d78818dc20b','String','jsonType.label'),('dd83e50b-2878-40cf-b8b8-3d78818dc20b','locale','user.attribute'),('dd83e50b-2878-40cf-b8b8-3d78818dc20b','true','userinfo.token.claim'),('e374561d-8617-4102-bcbe-f744433c5c9a','true','access.token.claim'),('e374561d-8617-4102-bcbe-f744433c5c9a','email','claim.name'),('e374561d-8617-4102-bcbe-f744433c5c9a','true','id.token.claim'),('e374561d-8617-4102-bcbe-f744433c5c9a','String','jsonType.label'),('e374561d-8617-4102-bcbe-f744433c5c9a','email','user.attribute'),('e374561d-8617-4102-bcbe-f744433c5c9a','true','userinfo.token.claim'),('e3c96b9e-aea9-4ebd-8129-994c8efeddbe','true','access.token.claim'),('e3c96b9e-aea9-4ebd-8129-994c8efeddbe','true','id.token.claim'),('e8e700f1-fc56-4e0e-9f63-0773d1d55c3d','Role','attribute.name'),('e8e700f1-fc56-4e0e-9f63-0773d1d55c3d','Basic','attribute.nameformat'),('e8e700f1-fc56-4e0e-9f63-0773d1d55c3d','false','single'),('ebf3537b-781c-4c7b-a414-5a45b52b82d4','true','access.token.claim'),('ebf3537b-781c-4c7b-a414-5a45b52b82d4','profile','claim.name'),('ebf3537b-781c-4c7b-a414-5a45b52b82d4','true','id.token.claim'),('ebf3537b-781c-4c7b-a414-5a45b52b82d4','String','jsonType.label'),('ebf3537b-781c-4c7b-a414-5a45b52b82d4','profile','user.attribute'),('ebf3537b-781c-4c7b-a414-5a45b52b82d4','true','userinfo.token.claim'),('ee901473-4fdb-43df-be95-8179afacf05e','true','access.token.claim'),('ee901473-4fdb-43df-be95-8179afacf05e','true','id.token.claim'),('efa22cda-0b63-4fc5-85e0-9efdaa678873','true','access.token.claim'),('efa22cda-0b63-4fc5-85e0-9efdaa678873','email','claim.name'),('efa22cda-0b63-4fc5-85e0-9efdaa678873','true','id.token.claim'),('efa22cda-0b63-4fc5-85e0-9efdaa678873','String','jsonType.label'),('efa22cda-0b63-4fc5-85e0-9efdaa678873','email','user.attribute'),('efa22cda-0b63-4fc5-85e0-9efdaa678873','true','userinfo.token.claim'),('f28c6e57-47c2-4250-bb5f-e8b9b9395568','true','access.token.claim'),('f28c6e57-47c2-4250-bb5f-e8b9b9395568','preferred_username','claim.name'),('f28c6e57-47c2-4250-bb5f-e8b9b9395568','true','id.token.claim'),('f28c6e57-47c2-4250-bb5f-e8b9b9395568','String','jsonType.label'),('f28c6e57-47c2-4250-bb5f-e8b9b9395568','username','user.attribute'),('f28c6e57-47c2-4250-bb5f-e8b9b9395568','true','userinfo.token.claim'),('f2ab0e9c-f4f6-41aa-8116-77608519e07b','Role','attribute.name'),('f2ab0e9c-f4f6-41aa-8116-77608519e07b','Basic','attribute.nameformat'),('f2ab0e9c-f4f6-41aa-8116-77608519e07b','false','single'),('f2c4ab9a-541d-4cc3-bc9b-018b522c1b21','true','access.token.claim'),('f2c4ab9a-541d-4cc3-bc9b-018b522c1b21','email','claim.name'),('f2c4ab9a-541d-4cc3-bc9b-018b522c1b21','true','id.token.claim'),('f2c4ab9a-541d-4cc3-bc9b-018b522c1b21','String','jsonType.label'),('f2c4ab9a-541d-4cc3-bc9b-018b522c1b21','email','user.attribute'),('f2c4ab9a-541d-4cc3-bc9b-018b522c1b21','true','userinfo.token.claim'),('f3399163-70b1-4dcc-997e-7e05eb74be10','true','access.token.claim'),('f3399163-70b1-4dcc-997e-7e05eb74be10','given_name','claim.name'),('f3399163-70b1-4dcc-997e-7e05eb74be10','true','id.token.claim'),('f3399163-70b1-4dcc-997e-7e05eb74be10','String','jsonType.label'),('f3399163-70b1-4dcc-997e-7e05eb74be10','firstName','user.attribute'),('f3399163-70b1-4dcc-997e-7e05eb74be10','true','userinfo.token.claim'),('f40b5d05-bd15-4aaa-b8b5-f9f696e7d53b','true','access.token.claim'),('f40b5d05-bd15-4aaa-b8b5-f9f696e7d53b','true','id.token.claim'),('f40b5d05-bd15-4aaa-b8b5-f9f696e7d53b','country','user.attribute.country'),('f40b5d05-bd15-4aaa-b8b5-f9f696e7d53b','formatted','user.attribute.formatted'),('f40b5d05-bd15-4aaa-b8b5-f9f696e7d53b','locality','user.attribute.locality'),('f40b5d05-bd15-4aaa-b8b5-f9f696e7d53b','postal_code','user.attribute.postal_code'),('f40b5d05-bd15-4aaa-b8b5-f9f696e7d53b','region','user.attribute.region'),('f40b5d05-bd15-4aaa-b8b5-f9f696e7d53b','street','user.attribute.street'),('f40b5d05-bd15-4aaa-b8b5-f9f696e7d53b','true','userinfo.token.claim'),('f4b9738c-1fb0-4cc0-92d0-bbbe14d1f0e2','Role','attribute.name'),('f4b9738c-1fb0-4cc0-92d0-bbbe14d1f0e2','Basic','attribute.nameformat'),('f4b9738c-1fb0-4cc0-92d0-bbbe14d1f0e2','false','single'),('f523b631-5165-4d5a-a286-0202e56e5800','true','access.token.claim'),('f523b631-5165-4d5a-a286-0202e56e5800','email','claim.name'),('f523b631-5165-4d5a-a286-0202e56e5800','true','id.token.claim'),('f523b631-5165-4d5a-a286-0202e56e5800','String','jsonType.label'),('f523b631-5165-4d5a-a286-0202e56e5800','email','user.attribute'),('f523b631-5165-4d5a-a286-0202e56e5800','true','userinfo.token.claim'),('f87b9ed6-4a93-499b-9caf-0a37f61967be','true','access.token.claim'),('f87b9ed6-4a93-499b-9caf-0a37f61967be','family_name','claim.name'),('f87b9ed6-4a93-499b-9caf-0a37f61967be','true','id.token.claim'),('f87b9ed6-4a93-499b-9caf-0a37f61967be','String','jsonType.label'),('f87b9ed6-4a93-499b-9caf-0a37f61967be','lastName','user.attribute'),('f87b9ed6-4a93-499b-9caf-0a37f61967be','true','userinfo.token.claim'),('f9b37afc-60e9-443f-b6ac-bbc9ce64f715','true','access.token.claim'),('f9b37afc-60e9-443f-b6ac-bbc9ce64f715','given_name','claim.name'),('f9b37afc-60e9-443f-b6ac-bbc9ce64f715','true','id.token.claim'),('f9b37afc-60e9-443f-b6ac-bbc9ce64f715','String','jsonType.label'),('f9b37afc-60e9-443f-b6ac-bbc9ce64f715','firstName','user.attribute'),('f9b37afc-60e9-443f-b6ac-bbc9ce64f715','true','userinfo.token.claim'),('fc32b179-fccc-4ddb-8768-86d10769f2d2','true','access.token.claim'),('fc32b179-fccc-4ddb-8768-86d10769f2d2','clientId','claim.name'),('fc32b179-fccc-4ddb-8768-86d10769f2d2','true','id.token.claim'),('fc32b179-fccc-4ddb-8768-86d10769f2d2','String','jsonType.label'),('fc32b179-fccc-4ddb-8768-86d10769f2d2','clientId','user.session.note'),('fcf44623-9150-4f5f-be1f-530446ab942f','Role','attribute.name'),('fcf44623-9150-4f5f-be1f-530446ab942f','Basic','attribute.nameformat'),('fcf44623-9150-4f5f-be1f-530446ab942f','false','single'),('fd6022c9-dc08-489b-836c-beb3e3ae7b97','true','access.token.claim'),('fd6022c9-dc08-489b-836c-beb3e3ae7b97','given_name','claim.name'),('fd6022c9-dc08-489b-836c-beb3e3ae7b97','true','id.token.claim'),('fd6022c9-dc08-489b-836c-beb3e3ae7b97','String','jsonType.label'),('fd6022c9-dc08-489b-836c-beb3e3ae7b97','firstName','user.attribute'),('fd6022c9-dc08-489b-836c-beb3e3ae7b97','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `FK_TRAF444KK6QRKMS7N56AIWQ5Y` (`MASTER_ADMIN_CLIENT`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`),
  CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('3150c2d5-c682-48f3-a18a-bad19bdd8aa7',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'3Scale',1519745741,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','NONE',1800,36000,_binary '\0',_binary '\0','10b3e194-e8d0-4d00-8d65-6f0d8fb1538a',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','6e0ded79-d888-4227-9758-830504129faf','4bddeac5-8c2e-4675-a3cb-b173788d28ad','f638646a-bd7c-4166-b50e-efd41746f65c','9b03554a-fc25-41a6-9c94-857750373435','236f2f82-7946-4b80-96de-e62d7f65b245',2592000,_binary '\0',900,_binary '',_binary '\0','5a2d62e2-30dd-4da0-a61b-27be25f64c21',0,_binary '\0',0,0),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','31a47fdf-d48d-47c5-8411-c02a95a1c066',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','4f1ad7be-3063-428f-8fbc-96491a59e249','6ea89df5-35b4-43a3-816b-df4e3e7807be','db2e4eba-d5a7-4523-b496-e4f77a30acea','bf0c42b3-1c13-44ab-a502-c4a4f33c4aed','339bb493-6e80-466c-94e4-0071bcf54807',2592000,_binary '\0',900,_binary '',_binary '\0','e22b26df-12bd-49de-ba90-0bb07803e7c9',0,_binary '\0',0,0);
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `FK_8SHXD6L3E9ATQUKACXGPFFPTW` (`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('bruteForceProtected','false','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('bruteForceProtected','false','master'),('displayName','rh-sso','master'),('displayNameHtml','<strong>Red Hat</strong><sup>¬Æ</sup> Single Sign On','master'),('failureFactor','30','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('failureFactor','30','master'),('maxDeltaTimeSeconds','43200','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('maxDeltaTimeSeconds','43200','master'),('maxFailureWaitSeconds','900','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('maxFailureWaitSeconds','900','master'),('minimumQuickLoginWaitSeconds','60','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('minimumQuickLoginWaitSeconds','60','master'),('quickLoginCheckMilliSeconds','1000','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('quickLoginCheckMilliSeconds','1000','master'),('waitIncrementSeconds','60','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('waitIncrementSeconds','60','master'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','master'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','master'),('_browser_header.xContentTypeOptions','nosniff','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('_browser_header.xContentTypeOptions','nosniff','master'),('_browser_header.xFrameOptions','SAMEORIGIN','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('_browser_header.xFrameOptions','SAMEORIGIN','master'),('_browser_header.xRobotsTag','none','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('_browser_header.xRobotsTag','none','master'),('_browser_header.xXSSProtection','1; mode=block','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('_browser_header.xXSSProtection','1; mode=block','master');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `FK_DEF_GROUPS_REALM` (`REALM_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `FK_EVUDB1PPW84OXFAX2DRS03ICC` (`REALM_ID`),
  KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('master','0fec74d9-2cbd-4baf-8f4c-7fd688cfcd2d'),('3150c2d5-c682-48f3-a18a-bad19bdd8aa7','a943d792-f79b-4cff-83d3-bee238cc1389'),('master','c1af3f2c-e34f-4576-a943-f2ab6dd41a30'),('3150c2d5-c682-48f3-a18a-bad19bdd8aa7','d7e3472e-7839-49d9-b5fd-694d4c08809c');
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `FK_H846O4H0W8EPX5NWEDRF5Y69J` (`REALM_ID`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `FK_H846O4H0W8EPX5NXEV9F5Y69J` (`REALM_ID`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('3150c2d5-c682-48f3-a18a-bad19bdd8aa7','jboss-logging'),('master','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','3150c2d5-c682-48f3-a18a-bad19bdd8aa7'),('password','password',_binary '',_binary '','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `FK_SUPPORTED_LOCALES_REALM` (`REALM_ID`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `FK_1BURS8PB4OUJ97H5WUPPAHV9F` (`CLIENT_ID`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('25af4524-d4f1-46e7-a096-832679647136','/auth/realms/3Scale/account/*'),('305e34dc-2137-4bf4-8b77-f6fb59cbb0f1','/auth/realms/master/account/*'),('3218c624-d052-4a5a-96a9-2e870f4bd957','https://www.getpostman.com/oauth2/callback'),('58d443e5-321d-483f-8e22-6db71136ebfe','https://www.getpostman.com/oauth2/callback'),('6765010a-3cc1-4ba4-9901-ed6347e8313a','/auth/admin/3Scale/console/*'),('86d79b32-64fd-4255-9970-cd0ad4425873','/auth/admin/master/console/*'),('8d335921-e04d-4bb4-b97a-438540d94a1b','https://www.getpostman.com/oauth2/callback'),('beb60408-3255-42e6-bccb-67baa751d1d8','https://3scale-admin.apps.demolab.local/*'),('beb60408-3255-42e6-bccb-67baa751d1d8','https://3scale.apps.demolab.local/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_REQ_ACT_REALM` (`REALM_ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('31b191cf-08c5-467c-9594-856431bcbdc1','UPDATE_PASSWORD','Update Password','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',_binary '',_binary '\0','UPDATE_PASSWORD',30),('4d87ad6a-204f-4935-86f9-02e9bf7daa55','VERIFY_EMAIL','Verify Email','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',_binary '',_binary '\0','VERIFY_EMAIL',50),('5ff8bbf1-a491-4765-8b2d-665e117ee32a','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('9053da0e-a79f-4405-8160-915d22d7dcf2','UPDATE_PROFILE','Update Profile','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',_binary '',_binary '\0','UPDATE_PROFILE',40),('9193cc71-a67a-47be-846b-594c9e093fc4','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('a00aabe0-5462-4935-b0fd-a766bbd14bfa','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('ad19d9e1-b3bd-4a8f-8e0c-2102627dacda','CONFIGURE_TOTP','Configure OTP','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',_binary '',_binary '\0','CONFIGURE_TOTP',10),('cd572365-497e-4c90-a122-d425d7ba6e0c','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('d8548999-1dfc-47d2-a137-c5ddd399d940','terms_and_conditions','Terms and Conditions','3150c2d5-c682-48f3-a18a-bad19bdd8aa7',_binary '\0',_binary '\0','terms_and_conditions',20),('f1e558f9-cbe3-43fe-aa81-73c5962349f4','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `FK_FRSRPP213XCX4WNKOG82SSRFY` (`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRPS213XCX4WNKOG82SSRFY` (`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(36) NOT NULL,
  `REQUESTER` varchar(36) NOT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(36) NOT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` (`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `FK_FRSRASP13XCX4WNKOG82SSRFY` (`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES ('org_name','test org','1e847018-100a-46c9-8420-1a5c959b53a1','17146739-337b-4601-973d-47396bcd3991'),('org_name','Marts Famous Toys','bd4f7710-b41f-4c79-b012-6e26a7a20ca2','5cdb7416-5908-4bea-b838-7765190d5de6'),('org_name','BumbleBee Phones','7955e816-4d38-4712-aa7b-f65f37c1e567','8009debe-9005-4c25-a0ce-15d12dffc7f5'),('org_name','Don Council','8de0c624-32a9-45f3-b38d-29825af8acf8','82ccc429-0ca6-432e-a481-e6e52e9bec67');
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(36) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('1979013a-d0dd-42a3-8b59-f6f9885a2b8a',NULL,'2777912c-32b1-4167-ab8e-f284a205779a',_binary '\0',_binary '',NULL,NULL,NULL,'master','admin',1517480908042,NULL,0),('1e847018-100a-46c9-8420-1a5c959b53a1','test@test.com','test@test.com',_binary '',_binary '',NULL,'test','test','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','test',1517577068459,NULL,0),('7955e816-4d38-4712-aa7b-f65f37c1e567','jake@jake.com','jake@jake.com',_binary '',_binary '',NULL,'Jake','Smith','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','jake',1517577010805,NULL,0),('8de0c624-32a9-45f3-b38d-29825af8acf8','phil@phil.com','phil@phil.com',_binary '',_binary '',NULL,'Phil','Prosser','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','phil',1517576848150,NULL,0),('9e7c6e0f-9fdd-4ece-824f-23d8fc0b16ee','service-account-3scale-admin@placeholder.org','service-account-3scale-admin@placeholder.org',_binary '\0',_binary '',NULL,NULL,NULL,'3150c2d5-c682-48f3-a18a-bad19bdd8aa7','service-account-3scale-admin',1517579628772,'32b129c5-7360-42e4-a167-713cd9e24300',0),('bd4f7710-b41f-4c79-b012-6e26a7a20ca2','mart@mart.com','mart@mart.com',_binary '\0',_binary '',NULL,'Mart','Smith','3150c2d5-c682-48f3-a18a-bad19bdd8aa7','mart',1519148998435,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_FEDMAPPERPM_REALM` (`REALM_ID`),
  KEY `FK_FEDMAPPERPM_FEDPRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_1FJ32F6PTOLW2QY60CD8N01E8` (`REALM_ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('0fec74d9-2cbd-4baf-8f4c-7fd688cfcd2d','1979013a-d0dd-42a3-8b59-f6f9885a2b8a'),('726b1cee-e46e-408e-9ec5-07148bf4553c','1979013a-d0dd-42a3-8b59-f6f9885a2b8a'),('b3631e44-780e-4b26-9ba7-39437e9ac248','1979013a-d0dd-42a3-8b59-f6f9885a2b8a'),('c1af3f2c-e34f-4576-a943-f2ab6dd41a30','1979013a-d0dd-42a3-8b59-f6f9885a2b8a'),('eec19a0f-40b3-4d49-8772-80ff678ad720','1979013a-d0dd-42a3-8b59-f6f9885a2b8a'),('199cd067-56c9-4270-9353-12c20b8cd8ce','1e847018-100a-46c9-8420-1a5c959b53a1'),('60600fc2-151c-421b-bb81-886c1719ab6a','1e847018-100a-46c9-8420-1a5c959b53a1'),('a943d792-f79b-4cff-83d3-bee238cc1389','1e847018-100a-46c9-8420-1a5c959b53a1'),('d7e3472e-7839-49d9-b5fd-694d4c08809c','1e847018-100a-46c9-8420-1a5c959b53a1'),('199cd067-56c9-4270-9353-12c20b8cd8ce','7955e816-4d38-4712-aa7b-f65f37c1e567'),('60600fc2-151c-421b-bb81-886c1719ab6a','7955e816-4d38-4712-aa7b-f65f37c1e567'),('a943d792-f79b-4cff-83d3-bee238cc1389','7955e816-4d38-4712-aa7b-f65f37c1e567'),('d7e3472e-7839-49d9-b5fd-694d4c08809c','7955e816-4d38-4712-aa7b-f65f37c1e567'),('199cd067-56c9-4270-9353-12c20b8cd8ce','8de0c624-32a9-45f3-b38d-29825af8acf8'),('60600fc2-151c-421b-bb81-886c1719ab6a','8de0c624-32a9-45f3-b38d-29825af8acf8'),('a943d792-f79b-4cff-83d3-bee238cc1389','8de0c624-32a9-45f3-b38d-29825af8acf8'),('d7e3472e-7839-49d9-b5fd-694d4c08809c','8de0c624-32a9-45f3-b38d-29825af8acf8'),('199cd067-56c9-4270-9353-12c20b8cd8ce','9e7c6e0f-9fdd-4ece-824f-23d8fc0b16ee'),('60600fc2-151c-421b-bb81-886c1719ab6a','9e7c6e0f-9fdd-4ece-824f-23d8fc0b16ee'),('a943d792-f79b-4cff-83d3-bee238cc1389','9e7c6e0f-9fdd-4ece-824f-23d8fc0b16ee'),('d7e3472e-7839-49d9-b5fd-694d4c08809c','9e7c6e0f-9fdd-4ece-824f-23d8fc0b16ee'),('e6fe5f38-98cb-4337-8495-7928deb5f9f0','9e7c6e0f-9fdd-4ece-824f-23d8fc0b16ee'),('199cd067-56c9-4270-9353-12c20b8cd8ce','bd4f7710-b41f-4c79-b012-6e26a7a20ca2'),('60600fc2-151c-421b-bb81-886c1719ab6a','bd4f7710-b41f-4c79-b012-6e26a7a20ca2'),('a943d792-f79b-4cff-83d3-bee238cc1389','bd4f7710-b41f-4c79-b012-6e26a7a20ca2'),('d7e3472e-7839-49d9-b5fd-694d4c08809c','bd4f7710-b41f-4c79-b012-6e26a7a20ca2');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `FK_LOJPHO213XCX4WNKOG82SSRFY` (`CLIENT_ID`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ossso1fmrf7JBossTSTxTable`
--

DROP TABLE IF EXISTS `ossso1fmrf7JBossTSTxTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ossso1fmrf7JBossTSTxTable` (
  `StateType` int(11) NOT NULL,
  `Hidden` int(11) NOT NULL,
  `TypeName` varchar(255) NOT NULL,
  `UidString` varchar(255) NOT NULL,
  `ObjectState` blob,
  PRIMARY KEY (`UidString`,`TypeName`,`StateType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ossso1fmrf7JBossTSTxTable`
--

LOCK TABLES `ossso1fmrf7JBossTSTxTable` WRITE;
/*!40000 ALTER TABLE `ossso1fmrf7JBossTSTxTable` DISABLE KEYS */;
INSERT INTO `ossso1fmrf7JBossTSTxTable` VALUES (1,0,'EISNAME','0:ffffac110012:80d4658:5b28c9b1:14',_binary '#BE @\0\0\0\0sso-1-fmrf7\0\0\0\0\0\0\0\"java:jboss/datasources/KeycloakDS\0\0\0');
/*!40000 ALTER TABLE `ossso1fmrf7JBossTSTxTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ossso1nxm5fJBossTSTxTable`
--

DROP TABLE IF EXISTS `ossso1nxm5fJBossTSTxTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ossso1nxm5fJBossTSTxTable` (
  `StateType` int(11) NOT NULL,
  `Hidden` int(11) NOT NULL,
  `TypeName` varchar(255) NOT NULL,
  `UidString` varchar(255) NOT NULL,
  `ObjectState` blob,
  PRIMARY KEY (`UidString`,`TypeName`,`StateType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ossso1nxm5fJBossTSTxTable`
--

LOCK TABLES `ossso1nxm5fJBossTSTxTable` WRITE;
/*!40000 ALTER TABLE `ossso1nxm5fJBossTSTxTable` DISABLE KEYS */;
INSERT INTO `ossso1nxm5fJBossTSTxTable` VALUES (1,0,'EISNAME','0:ffffac110004:-77a6388a:5b276f92:14',_binary '#BE @\0\0\0\0sso-1-nxm5f\0\0\0\0\0\0\0\"java:jboss/datasources/KeycloakDS\0\0\0');
/*!40000 ALTER TABLE `ossso1nxm5fJBossTSTxTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ossso22p28qJBossTSTxTable`
--

DROP TABLE IF EXISTS `ossso22p28qJBossTSTxTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ossso22p28qJBossTSTxTable` (
  `StateType` int(11) NOT NULL,
  `Hidden` int(11) NOT NULL,
  `TypeName` varchar(255) NOT NULL,
  `UidString` varchar(255) NOT NULL,
  `ObjectState` blob,
  PRIMARY KEY (`UidString`,`TypeName`,`StateType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ossso22p28qJBossTSTxTable`
--

LOCK TABLES `ossso22p28qJBossTSTxTable` WRITE;
/*!40000 ALTER TABLE `ossso22p28qJBossTSTxTable` DISABLE KEYS */;
INSERT INTO `ossso22p28qJBossTSTxTable` VALUES (1,0,'EISNAME','0:ffff0a01067d:728e15b2:5dfa73d7:1a',_binary '#BE @\0\0\0\0sso-2-2p28q\0\0\0\0\0\0\0\"java:jboss/datasources/KeycloakDS\0\0\0');
/*!40000 ALTER TABLE `ossso22p28qJBossTSTxTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ossso27qsttJBossTSTxTable`
--

DROP TABLE IF EXISTS `ossso27qsttJBossTSTxTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ossso27qsttJBossTSTxTable` (
  `StateType` int(11) NOT NULL,
  `Hidden` int(11) NOT NULL,
  `TypeName` varchar(255) NOT NULL,
  `UidString` varchar(255) NOT NULL,
  `ObjectState` blob,
  PRIMARY KEY (`UidString`,`TypeName`,`StateType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ossso27qsttJBossTSTxTable`
--

LOCK TABLES `ossso27qsttJBossTSTxTable` WRITE;
/*!40000 ALTER TABLE `ossso27qsttJBossTSTxTable` DISABLE KEYS */;
INSERT INTO `ossso27qsttJBossTSTxTable` VALUES (1,0,'EISNAME','0:ffffac110012:121a05a:5b28caff:1a',_binary '#BE @\0\0\0\0sso-2-7qstt\0\0\0\0\0\0\0\"java:jboss/datasources/KeycloakDS\0\0\0');
/*!40000 ALTER TABLE `ossso27qsttJBossTSTxTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ossso48pdjnJBossTSTxTable`
--

DROP TABLE IF EXISTS `ossso48pdjnJBossTSTxTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ossso48pdjnJBossTSTxTable` (
  `StateType` int(11) NOT NULL,
  `Hidden` int(11) NOT NULL,
  `TypeName` varchar(255) NOT NULL,
  `UidString` varchar(255) NOT NULL,
  `ObjectState` blob,
  PRIMARY KEY (`UidString`,`TypeName`,`StateType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ossso48pdjnJBossTSTxTable`
--

LOCK TABLES `ossso48pdjnJBossTSTxTable` WRITE;
/*!40000 ALTER TABLE `ossso48pdjnJBossTSTxTable` DISABLE KEYS */;
INSERT INTO `ossso48pdjnJBossTSTxTable` VALUES (1,0,'EISNAME','0:ffff0a010294:8f192ce:5dfa74d6:1c',_binary '#BE @\0\0\0\0sso-4-8pdjn\0\0\0\0\0\0\0\"java:jboss/datasources/KeycloakDS\0\0\0');
/*!40000 ALTER TABLE `ossso48pdjnJBossTSTxTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-19 11:00:12
