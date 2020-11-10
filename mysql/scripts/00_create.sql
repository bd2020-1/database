-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: vodan_br_bd_fiocruz
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_assessmentquestionnaire`
--

DROP TABLE IF EXISTS `tb_assessmentquestionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_assessmentquestionnaire` (
  `participantID` int(10) NOT NULL COMMENT '(pt-br)  Chave estrangeira para a tabela tb_Patient.\r\n(en) Foreign key to the tb_Patient table.',
  `hospitalUnitID` int(10) NOT NULL COMMENT '(pt-br) Chave estrangeira para tabela tb_HospitalUnit.\r\n(en) Foreign key for the tp_HospitalUnit table.',
  `questionnaireID` int(10) NOT NULL,
  PRIMARY KEY (`participantID`,`hospitalUnitID`,`questionnaireID`),
  KEY `FKtb_Assessm665217` (`hospitalUnitID`),
  KEY `FKtb_Assessm419169` (`questionnaireID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_assessmentquestionnaire`
--

LOCK TABLES `tb_assessmentquestionnaire` WRITE;
/*!40000 ALTER TABLE `tb_assessmentquestionnaire` DISABLE KEYS */;
INSERT into tb_assessmentquestionnaire
VALUES(20201, '20191',1), (20202, '20192',1), (20203, '20193',1), (20204, '20194',1),
(20205, '20194',1), (20206, '20194',1), (20207, '20192',1), (20208, '20192',1),
(20209, '20194',1), (202010, '20193',1);
/*!40000 ALTER TABLE `tb_assessmentquestionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_crfforms`
--

DROP TABLE IF EXISTS `tb_crfforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_crfforms` (
  `crfFormsID` int(10) NOT NULL,
  `questionnaireID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição .\r\n(en) description.',
  PRIMARY KEY (`crfFormsID`),
  KEY `FKtb_CRFForm860269` (`questionnaireID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='(pt-br)\r\ntb_CRFForms identifica o tipo do formulario refere-se ao Questionnaire Subsection da Ontologia:\r\nAdmissão - Modulo 1\r\nAcompanhamento - Modulo 2\r\nDesfecho - Modulo 3\r\n(en)\r\ntb_CRFForms identifies the type of the form refers to the Questionnaire Subsection of Ontology: Admission - Module 1 Monitoring - Module 2 Outcome - Module 3';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_crfforms`
--

LOCK TABLES `tb_crfforms` WRITE;
/*!40000 ALTER TABLE `tb_crfforms` DISABLE KEYS */;
INSERT INTO `tb_crfforms` VALUES (1,1,'Admission form'),(2,1,'Follow-up'),(3,1,'Discharge/death form');
/*!40000 ALTER TABLE `tb_crfforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_formrecord`
--

DROP TABLE IF EXISTS `tb_formrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_formrecord` (
  `formRecordID` int(10) NOT NULL,
  `participantID` int(10) NOT NULL,
  `hospitalUnitID` int(10) NOT NULL,
  `questionnaireID` int(10) NOT NULL,
  `crfFormsID` int(10) NOT NULL,
  `dtRegistroForm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`formRecordID`),
  KEY `FKtb_FormRec2192` (`crfFormsID`),
  KEY `FKtb_FormRec984256` (`participantID`,`hospitalUnitID`,`questionnaireID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_formrecord`
--

LOCK TABLES `tb_formrecord` WRITE;
/*!40000 ALTER TABLE `tb_formrecord` DISABLE KEYS */;
INSERT into tb_formrecord
VALUES
(20151,20201, 20191,1,1,'2020-10-19 03:14:07'),
(20152, 20202, 20192,1,2,'2020-10-11 10:14:07'),
(20153, 20203, 20193,1,3,'2020-10-13 11:14:07'),
(20154, 20204, 20194,1,2,'2020-10-17 16:14:07'),
(20155,20205, 20194,1,1,'2020-10-21 10:17:07'),
(20156,20206, 20194,1,2,'2020-10-01 18:14:07'),
(20157,20207, 20192,1,3,'2020-10-07 15:14:07'),
(20158,20208, 20192,1,2,'2020-10-24 07:14:07'),
(20159, 20209, 20194,1,1,'2020-10-30 05:14:07'),
(201510, 202010, 20193,1,2,'2020-10-19 11:14:26'),
(1, 116, 1, 1, 1, '2020-11-01 13:38:16'),
(2, 116, 1, 1, 2, '2020-11-01 13:38:16'),
(3, 116, 1, 1, 3, '2020-11-01 13:38:16'),
(4, 98, 1, 1, 1, '2020-11-01 13:38:16'),
(5, 98, 1, 1, 2, '2020-11-01 13:38:16'),
(6, 98, 1, 1, 3, '2020-11-01 13:38:16'),
(7, 120, 1, 1, 1, '2020-11-01 13:38:16'),
(8, 120, 1, 1, 2, '2020-11-01 13:38:16'),
(9, 120, 1, 1, 3, '2020-11-01 13:38:16'),
(10, 93, 1, 1, 1, '2020-11-01 13:38:16'),
(11, 93, 1, 1, 2, '2020-11-01 13:38:16'),
(12, 93, 1, 1, 3, '2020-11-01 13:38:16'),
(13, 122, 1, 1, 1, '2020-11-01 13:38:16'),
(14, 122, 1, 1, 2, '2020-11-01 13:38:16'),
(15, 122, 1, 1, 3, '2020-11-01 13:38:16'),
(16, 123, 1, 1, 1, '2020-11-01 13:38:16'),
(17, 123, 1, 1, 2, '2020-11-01 13:38:16'),
(18, 123, 1, 1, 3, '2020-11-01 13:38:16'),
(19, 105, 1, 1, 1, '2020-11-01 13:38:16'),
(20, 105, 1, 1, 2, '2020-11-01 13:38:16'),
(21, 105, 1, 1, 3, '2020-11-01 13:38:16'),
(22, 113, 1, 1, 1, '2020-11-01 13:38:16'),
(23, 113, 1, 1, 2, '2020-11-01 13:38:16'),
(24, 113, 1, 1, 3, '2020-11-01 13:38:16'),
(25, 104, 1, 1, 1, '2020-11-01 13:38:16'),
(26, 104, 1, 1, 2, '2020-11-01 13:38:16'),
(27, 104, 1, 1, 3, '2020-11-01 13:38:16'),
(28, 124, 1, 1, 1, '2020-11-01 13:38:16'),
(29, 124, 1, 1, 2, '2020-11-01 13:38:16'),
(30, 124, 1, 1, 3, '2020-11-01 13:38:16'),
(31, 125, 1, 1, 1, '2020-11-01 13:38:16'),
(32, 125, 1, 1, 2, '2020-11-01 13:38:16'),
(33, 125, 1, 1, 3, '2020-11-01 13:38:16'),
(34, 126, 1, 1, 1, '2020-11-01 13:38:16'),
(35, 126, 1, 1, 2, '2020-11-01 13:38:16'),
(36, 126, 1, 1, 3, '2020-11-01 13:38:16'),
(37, 127, 1, 1, 1, '2020-11-01 13:38:16'),
(38, 127, 1, 1, 2, '2020-11-01 13:38:16'),
(39, 127, 1, 1, 3, '2020-11-01 13:38:16'),
(40, 99, 1, 1, 1, '2020-11-01 13:38:16'),
(41, 99, 1, 1, 2, '2020-11-01 13:38:16'),
(42, 99, 1, 1, 3, '2020-11-01 13:38:16'),
(43, 128, 1, 1, 1, '2020-11-01 13:38:16'),
(44, 128, 1, 1, 2, '2020-11-01 13:38:16'),
(45, 128, 1, 1, 3, '2020-11-01 13:38:16'),
(46, 129, 1, 1, 1, '2020-11-01 13:38:16'),
(47, 129, 1, 1, 2, '2020-11-01 13:38:16'),
(48, 129, 1, 1, 3, '2020-11-01 13:38:16'),
(49, 130, 1, 1, 1, '2020-11-01 13:38:16'),
(50, 130, 1, 1, 2, '2020-11-01 13:38:16'),
(51, 130, 1, 1, 3, '2020-11-01 13:38:16'),
(52, 131, 1, 1, 1, '2020-11-01 13:38:16'),
(53, 131, 1, 1, 2, '2020-11-01 13:38:16'),
(54, 131, 1, 1, 3, '2020-11-01 13:38:16'),
(55, 95, 1, 1, 1, '2020-11-01 13:38:16'),
(56, 95, 1, 1, 2, '2020-11-01 13:38:16'),
(57, 95, 1, 1, 3, '2020-11-01 13:38:16'),
(58, 132, 1, 1, 1, '2020-11-01 13:38:16'),
(59, 132, 1, 1, 2, '2020-11-01 13:38:16'),
(60, 132, 1, 1, 3, '2020-11-01 13:38:16'),
(61, 133, 1, 1, 1, '2020-11-01 13:38:16'),
(62, 133, 1, 1, 2, '2020-11-01 13:38:16'),
(63, 133, 1, 1, 3, '2020-11-01 13:38:16'),
(64, 94, 1, 1, 1, '2020-11-01 13:38:16'),
(65, 94, 1, 1, 2, '2020-11-01 13:38:16'),
(66, 94, 1, 1, 3, '2020-11-01 13:38:16'),
(67, 101, 1, 1, 1, '2020-11-01 13:38:16'),
(68, 101, 1, 1, 2, '2020-11-01 13:38:16'),
(69, 101, 1, 1, 3, '2020-11-01 13:38:16'),
(70, 134, 1, 1, 1, '2020-11-01 13:38:16'),
(71, 134, 1, 1, 2, '2020-11-01 13:38:16'),
(72, 134, 1, 1, 3, '2020-11-01 13:38:16'),
(73, 135, 1, 1, 1, '2020-11-01 13:38:16'),
(74, 135, 1, 1, 2, '2020-11-01 13:38:16'),
(75, 135, 1, 1, 3, '2020-11-01 13:38:16'),
(76, 136, 1, 1, 1, '2020-11-01 13:38:16'),
(77, 136, 1, 1, 2, '2020-11-01 13:38:16'),
(78, 136, 1, 1, 3, '2020-11-01 13:38:16'),
(79, 119, 1, 1, 1, '2020-11-01 13:38:16'),
(80, 119, 1, 1, 2, '2020-11-01 13:38:16'),
(81, 119, 1, 1, 3, '2020-11-01 13:38:16'),
(82, 88, 1, 1, 1, '2020-11-01 13:38:16'),
(83, 88, 1, 1, 2, '2020-11-01 13:38:16'),
(84, 88, 1, 1, 3, '2020-11-01 13:38:16'),
(85, 137, 1, 1, 1, '2020-11-01 13:38:16'),
(86, 137, 1, 1, 2, '2020-11-01 13:38:16'),
(87, 137, 1, 1, 3, '2020-11-01 13:38:16'),
(88, 138, 1, 1, 1, '2020-11-01 13:38:16'),
(89, 138, 1, 1, 2, '2020-11-01 13:38:16'),
(90, 138, 1, 1, 3, '2020-11-01 13:38:16'),
(91, 139, 1, 1, 1, '2020-11-01 13:38:16'),
(92, 139, 1, 1, 2, '2020-11-01 13:38:16'),
(93, 139, 1, 1, 3, '2020-11-01 13:38:16'),
(94, 97, 1, 1, 1, '2020-11-01 13:38:16'),
(95, 97, 1, 1, 2, '2020-11-01 13:38:16'),
(96, 97, 1, 1, 3, '2020-11-01 13:38:16'),
(97, 96, 1, 1, 1, '2020-11-01 13:38:16'),
(98, 96, 1, 1, 2, '2020-11-01 13:38:16'),
(99, 96, 1, 1, 3, '2020-11-01 13:38:16'),
(100, 140, 1, 1, 1, '2020-11-01 13:38:16'),
(101, 140, 1, 1, 2, '2020-11-01 13:38:16'),
(102, 140, 1, 1, 3, '2020-11-01 13:38:16'),
(103, 102, 1, 1, 1, '2020-11-01 13:38:16'),
(104, 102, 1, 1, 2, '2020-11-01 13:38:16'),
(105, 102, 1, 1, 3, '2020-11-01 13:38:16'),
(106, 141, 1, 1, 1, '2020-11-01 13:38:16'),
(107, 141, 1, 1, 2, '2020-11-01 13:38:16'),
(108, 141, 1, 1, 3, '2020-11-01 13:38:16'),
(109, 111, 1, 1, 1, '2020-11-01 13:38:16'),
(110, 111, 1, 1, 2, '2020-11-01 13:38:16'),
(111, 111, 1, 1, 3, '2020-11-01 13:38:16'),
(112, 117, 1, 1, 1, '2020-11-01 13:38:16'),
(113, 117, 1, 1, 2, '2020-11-01 13:38:16'),
(114, 117, 1, 1, 3, '2020-11-01 13:38:16'),
(115, 118, 1, 1, 1, '2020-11-01 13:38:16'),
(116, 118, 1, 1, 2, '2020-11-01 13:38:16'),
(117, 118, 1, 1, 3, '2020-11-01 13:38:16'),
(118, 110, 1, 1, 1, '2020-11-01 13:38:16'),
(119, 110, 1, 1, 2, '2020-11-01 13:38:16'),
(120, 110, 1, 1, 3, '2020-11-01 13:38:16'),
(121, 143, 1, 1, 1, '2020-11-01 13:38:16'),
(122, 143, 1, 1, 2, '2020-11-01 13:38:16'),
(123, 143, 1, 1, 3, '2020-11-01 13:38:16'),
(124, 142, 1, 1, 1, '2020-11-01 13:38:16'),
(125, 142, 1, 1, 2, '2020-11-01 13:38:16'),
(126, 142, 1, 1, 3, '2020-11-01 13:38:16'),
(127, 144, 1, 1, 1, '2020-11-01 13:38:16'),
(128, 144, 1, 1, 2, '2020-11-01 13:38:16'),
(129, 144, 1, 1, 3, '2020-11-01 13:38:16'),
(130, 145, 1, 1, 1, '2020-11-01 13:38:16'),
(131, 145, 1, 1, 2, '2020-11-01 13:38:16'),
(132, 145, 1, 1, 3, '2020-11-01 13:38:16'),
(133, 146, 1, 1, 1, '2020-11-01 13:38:16'),
(134, 146, 1, 1, 2, '2020-11-01 13:38:16'),
(135, 146, 1, 1, 3, '2020-11-01 13:38:16'),
(136, 147, 1, 1, 1, '2020-11-01 13:38:16'),
(137, 147, 1, 1, 2, '2020-11-01 13:38:16'),
(138, 147, 1, 1, 3, '2020-11-01 13:38:16'),
(139, 148, 1, 1, 1, '2020-11-01 13:38:16'),
(140, 148, 1, 1, 2, '2020-11-01 13:38:16'),
(141, 148, 1, 1, 3, '2020-11-01 13:38:16'),
(142, 112, 1, 1, 1, '2020-11-01 13:38:16'),
(143, 112, 1, 1, 2, '2020-11-01 13:38:16'),
(144, 112, 1, 1, 3, '2020-11-01 13:38:16'),
(145, 90, 1, 1, 1, '2020-11-01 13:38:16'),
(146, 90, 1, 1, 2, '2020-11-01 13:38:16'),
(147, 90, 1, 1, 3, '2020-11-01 13:38:16'),
(148, 92, 1, 1, 1, '2020-11-01 13:38:16'),
(149, 92, 1, 1, 2, '2020-11-01 13:38:16'),
(150, 92, 1, 1, 3, '2020-11-01 13:38:16'),
(151, 107, 1, 1, 1, '2020-11-01 13:38:16'),
(152, 107, 1, 1, 2, '2020-11-01 13:38:16'),
(153, 107, 1, 1, 3, '2020-11-01 13:38:16'),
(154, 115, 1, 1, 1, '2020-11-01 13:38:16'),
(155, 115, 1, 1, 2, '2020-11-01 13:38:16'),
(156, 115, 1, 1, 3, '2020-11-01 13:38:16'),
(157, 150, 1, 1, 1, '2020-11-01 13:38:16'),
(158, 150, 1, 1, 2, '2020-11-01 13:38:16'),
(159, 150, 1, 1, 3, '2020-11-01 13:38:16'),
(160, 149, 1, 1, 1, '2020-11-01 13:38:16'),
(161, 149, 1, 1, 2, '2020-11-01 13:38:16'),
(162, 149, 1, 1, 3, '2020-11-01 13:38:16'),
(163, 152, 1, 1, 1, '2020-11-01 13:38:16'),
(164, 152, 1, 1, 2, '2020-11-01 13:38:16'),
(165, 152, 1, 1, 3, '2020-11-01 13:38:16'),
(166, 151, 1, 1, 1, '2020-11-01 13:38:16'),
(167, 151, 1, 1, 2, '2020-11-01 13:38:16'),
(168, 151, 1, 1, 3, '2020-11-01 13:38:16'),
(169, 109, 1, 1, 1, '2020-11-01 13:38:16'),
(170, 109, 1, 1, 2, '2020-11-01 13:38:16'),
(171, 109, 1, 1, 3, '2020-11-01 13:38:16'),
(172, 153, 1, 1, 1, '2020-11-01 13:38:16'),
(173, 153, 1, 1, 2, '2020-11-01 13:38:16'),
(174, 153, 1, 1, 3, '2020-11-01 13:38:16'),
(175, 154, 1, 1, 1, '2020-11-01 13:38:16'),
(176, 154, 1, 1, 2, '2020-11-01 13:38:16'),
(177, 154, 1, 1, 3, '2020-11-01 13:38:16'),
(178, 156, 1, 1, 1, '2020-11-01 13:38:16'),
(179, 156, 1, 1, 2, '2020-11-01 13:38:16'),
(180, 156, 1, 1, 3, '2020-11-01 13:38:16'),
(181, 157, 1, 1, 1, '2020-11-01 13:38:16'),
(182, 157, 1, 1, 2, '2020-11-01 13:38:16'),
(183, 157, 1, 1, 3, '2020-11-01 13:38:16'),
(184, 103, 1, 1, 1, '2020-11-01 13:38:16'),
(185, 103, 1, 1, 2, '2020-11-01 13:38:16'),
(186, 103, 1, 1, 3, '2020-11-01 13:38:16'),
(187, 155, 1, 1, 1, '2020-11-01 13:38:16'),
(188, 155, 1, 1, 2, '2020-11-01 13:38:16'),
(189, 155, 1, 1, 3, '2020-11-01 13:38:16'),
(190, 158, 1, 1, 1, '2020-11-01 13:38:16'),
(191, 158, 1, 1, 2, '2020-11-01 13:38:16'),
(192, 158, 1, 1, 3, '2020-11-01 13:38:16'),
(193, 91, 1, 1, 1, '2020-11-01 13:38:16'),
(194, 91, 1, 1, 2, '2020-11-01 13:38:16'),
(195, 91, 1, 1, 3, '2020-11-01 13:38:16'),
(196, 106, 1, 1, 1, '2020-11-01 13:38:16'),
(197, 106, 1, 1, 2, '2020-11-01 13:38:16'),
(198, 106, 1, 1, 3, '2020-11-01 13:38:16'),
(199, 159, 1, 1, 1, '2020-11-01 13:38:16'),
(200, 159, 1, 1, 2, '2020-11-01 13:38:16'),
(201, 159, 1, 1, 3, '2020-11-01 13:38:16'),
(202, 100, 1, 1, 1, '2020-11-01 13:38:16'),
(203, 100, 1, 1, 2, '2020-11-01 13:38:16'),
(204, 100, 1, 1, 3, '2020-11-01 13:38:16'),
(205, 160, 1, 1, 1, '2020-11-01 13:38:16'),
(206, 160, 1, 1, 2, '2020-11-01 13:38:16'),
(207, 160, 1, 1, 3, '2020-11-01 13:38:16'),
(208, 161, 1, 1, 1, '2020-11-01 13:38:16'),
(209, 161, 1, 1, 2, '2020-11-01 13:38:16'),
(210, 161, 1, 1, 3, '2020-11-01 13:38:16'),
(211, 162, 1, 1, 1, '2020-11-01 13:38:16'),
(212, 162, 1, 1, 2, '2020-11-01 13:38:16'),
(213, 162, 1, 1, 3, '2020-11-01 13:38:16'),
(214, 108, 1, 1, 1, '2020-11-01 13:38:16'),
(215, 108, 1, 1, 2, '2020-11-01 13:38:16'),
(216, 108, 1, 1, 3, '2020-11-01 13:38:16'),
(217, 114, 1, 1, 1, '2020-11-01 13:38:16'),
(218, 114, 1, 1, 2, '2020-11-01 13:38:16'),
(219, 114, 1, 1, 3, '2020-11-01 13:38:16'),
(220, 89, 1, 1, 1, '2020-11-01 13:38:16'),
(221, 89, 1, 1, 2, '2020-11-01 13:38:16'),
(222, 89, 1, 1, 3, '2020-11-01 13:38:16'),
(223, 121, 1, 1, 1, '2020-11-01 13:38:16'),
(224, 121, 1, 1, 2, '2020-11-01 13:38:16'),
(225, 121, 1, 1, 3, '2020-11-01 13:38:16'),
(226, 163, 1, 1, 1, '2020-11-01 13:38:16'),
(227, 163, 1, 1, 2, '2020-11-01 13:38:16'),
(228, 163, 1, 1, 3, '2020-11-01 13:38:16'),
(229, 164, 1, 1, 1, '2020-11-01 13:38:16'),
(230, 164, 1, 1, 2, '2020-11-01 13:38:16'),
(231, 164, 1, 1, 3, '2020-11-01 13:38:16'),
(232, 165, 1, 1, 1, '2020-11-01 13:38:16'),
(233, 165, 1, 1, 2, '2020-11-01 13:38:16'),
(234, 165, 1, 1, 3, '2020-11-01 13:38:16'),
(235, 166, 1, 1, 1, '2020-11-01 13:38:16'),
(236, 166, 1, 1, 2, '2020-11-01 13:38:16'),
(237, 166, 1, 1, 3, '2020-11-01 13:38:16');

/*!40000 ALTER TABLE `tb_formrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_grouprole`
--

DROP TABLE IF EXISTS `tb_grouprole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_grouprole` (
  `groupRoleID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`groupRoleID`),
  UNIQUE KEY `groupRoleID` (`groupRoleID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grouprole`
--

LOCK TABLES `tb_grouprole` WRITE;
/*!40000 ALTER TABLE `tb_grouprole` DISABLE KEYS */;
INSERT INTO `tb_grouprole` VALUES (1,'Administrador'),(2,'ETL - Arquivos'),(3,'ETL - BD a BD'),(4,'Gestor de Ontologia'),(5,'Gestor de Repositório'),(6,'Notificador Médico'),(7,'Notificador Profissional de Saúde');
/*!40000 ALTER TABLE `tb_grouprole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_grouprolepermission`
--

DROP TABLE IF EXISTS `tb_grouprolepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_grouprolepermission` (
  `groupRoleID` int(11) NOT NULL,
  `permissionID` int(11) NOT NULL,
  PRIMARY KEY (`groupRoleID`,`permissionID`),
  KEY `FKtb_GroupRo893005` (`permissionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grouprolepermission`
--

LOCK TABLES `tb_grouprolepermission` WRITE;
/*!40000 ALTER TABLE `tb_grouprolepermission` DISABLE KEYS */;
INSERT INTO `tb_grouprolepermission` VALUES (1,4),(2,1),(3,1),(4,4),(5,4),(6,4),(7,1),(7,2);
/*!40000 ALTER TABLE `tb_grouprolepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hospitalunit`
--

DROP TABLE IF EXISTS `tb_hospitalunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_hospitalunit` (
  `hospitalUnitID` int(10) NOT NULL,
  `hospitalUnitName` varchar(500) NOT NULL COMMENT '(pt-br) Nome da unidade hospitalar.\r\n(en) Name of the hospital unit.',
  PRIMARY KEY (`hospitalUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='(pt-br) Tabela para identificação de unidades hospitalares.\r\n(en) Table for hospital units identification.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hospitalunit`
--

LOCK TABLES `tb_hospitalunit` WRITE;
/*!40000 ALTER TABLE `tb_hospitalunit` DISABLE KEYS */;
INSERT into tb_hospitalunit
VALUES(20191, 'Jose da Silveira'), (20192, 'Manoel Simoes'), (20193, 'Fernando Da Silva'),
(20194, 'Giuseppe Meazza');
/*!40000 ALTER TABLE `tb_hospitalunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_language`
--

DROP TABLE IF EXISTS `tb_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_language` (
  `languageID` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`languageID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_language`
--

LOCK TABLES `tb_language` WRITE;
/*!40000 ALTER TABLE `tb_language` DISABLE KEYS */;
INSERT INTO `tb_language` VALUES (1,'pt-br');
/*!40000 ALTER TABLE `tb_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_listofvalues`
--

DROP TABLE IF EXISTS `tb_listofvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_listofvalues` (
  `listOfValuesID` int(10) NOT NULL,
  `listTypeID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição.\r\n(en) description.',
  PRIMARY KEY (`listOfValuesID`),
  KEY `FKtb_ListOfV184108` (`listTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='(pt-br) Representa todos os valores padronizados do formulário.\r\n(en) Represents all standard values on the form.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_listofvalues`
--

LOCK TABLES `tb_listofvalues` WRITE;
/*!40000 ALTER TABLE `tb_listofvalues` DISABLE KEYS */;
INSERT INTO `tb_listofvalues` VALUES (1,1,'Interferon alpha'),(2,1,'Interferon beta'),(3,1,'Lopinavir/Ritonavir'),(4,1,'Neuraminidase inhibitor'),(5,1,'Ribavirin'),(6,2,'Alert'),(7,2,'Pain'),(8,2,'Unresponsive'),(9,2,'Verbal'),(10,3,'MERS-CoV'),(11,3,'SARS-CoV-2'),(12,4,'Inhaled'),(13,4,'Intravenous'),(14,4,'Oral'),(15,5,'Afghanistan'),(16,5,'Aland Islands'),(17,5,'Albania'),(18,5,'Algeria'),(19,5,'American Samoa'),(20,5,'Andorra'),(21,5,'Angola'),(22,5,'Anguilla'),(23,5,'Antarctica'),(24,5,'Antigua and Barbuda'),(25,5,'Argentina'),(26,5,'Armenia'),(27,5,'Aruba'),(28,5,'Australia'),(29,5,'Austria'),(30,5,'Azerbaijan'),(31,5,'Bahamas'),(32,5,'Bahrain'),(33,5,'Bangladesh'),(34,5,'Barbados'),(35,5,'Belarus'),(36,5,'Belgium'),(37,5,'Belize'),(38,5,'Benin'),(39,5,'Bermuda'),(40,5,'Bhutan'),(41,5,'Bolivia, Plurinational State of'),(42,5,'Bosnia and Herzegovina'),(43,5,'Botswana'),(44,5,'Bouvet Island'),(45,5,'Brazil'),(46,5,'British Indian Ocean Territory'),(47,5,'Brunei Darussalam'),(48,5,'Bulgaria'),(49,5,'Burkina Faso'),(50,5,'Burundi'),(51,5,'Cambodia'),(52,5,'Cameroon'),(53,5,'Canada'),(54,5,'Cape Verde'),(55,5,'Cayman Islands'),(56,5,'Central African Republic'),(57,5,'Chad'),(58,5,'Chile'),(59,5,'China'),(60,5,'Christmas Island'),(61,5,'Cocos (Keeling) Islands'),(62,5,'Colombia'),(63,5,'Comoros'),(64,5,'Congo'),(65,5,'Congo, the Democratic Republic of the'),(66,5,'Cook Islands'),(67,5,'Costa Rica'),(68,5,'Cote d\'Ivoire'),(69,5,'Croatia'),(70,5,'Cuba'),(71,5,'Cyprus'),(72,5,'Czech Republic'),(73,5,'Denmark'),(74,5,'Djibouti'),(75,5,'Dominica'),(76,5,'Dominican Republic'),(77,5,'Ecuador'),(78,5,'Egypt'),(79,5,'El Salvador'),(80,5,'Equatorial Guinea'),(81,5,'Eritrea'),(82,5,'Estonia'),(83,5,'Ethiopia'),(84,5,'Falkland Islands (Malvinas)'),(85,5,'Faroe Islands'),(86,5,'Fiji'),(87,5,'Finland'),(88,5,'France'),(89,5,'French Guiana'),(90,5,'French Polynesia'),(91,5,'French Southern Territories'),(92,5,'Gabon'),(93,5,'Gambia'),(94,5,'Georgia'),(95,5,'Germany'),(96,5,'Ghana'),(97,5,'Gibraltar'),(98,5,'Greece'),(99,5,'Greenland'),(100,5,'Grenada'),(101,5,'Guadeloupe'),(102,5,'Guam'),(103,5,'Guatemala'),(104,5,'Guernsey'),(105,5,'Guinea'),(106,5,'Guinea-Bissau'),(107,5,'Guyana'),(108,5,'Haiti'),(109,5,'Heard Island and McDonald Islands'),(110,5,'Holy See (Vatican City State)'),(111,5,'Honduras'),(112,5,'Hong Kong'),(113,5,'Hungary'),(114,5,'Iceland'),(115,5,'India'),(116,5,'Indonesia'),(117,5,'Iran, Islamic Republic of'),(118,5,'Iraq'),(119,5,'Ireland'),(120,5,'Isle of Man'),(121,5,'Israel'),(122,5,'Italy'),(123,5,'Jamaica'),(124,5,'Japan'),(125,5,'Jersey'),(126,5,'Jordan'),(127,5,'Kazakhstan'),(128,5,'Kenya'),(129,5,'Kiribati'),(130,5,'Korea, Democratic People\'\'s Republic of'),(131,5,'Korea, Republic of'),(132,5,'Kuwait'),(133,5,'Kyrgyzstan'),(134,5,'Lao People\'s Democratic Republic'),(135,5,'Latvia'),(136,5,'Lebanon'),(137,5,'Lesotho'),(138,5,'Liberia'),(139,5,'Libyan Arab Jamahiriya'),(140,5,'Liechtenstein'),(141,5,'Lithuania'),(142,5,'Luxembourg'),(143,5,'Macao'),(144,5,'Macedonia, the former Yugoslav Republic of'),(145,5,'Madagascar'),(146,5,'Malawi'),(147,5,'Malaysia'),(148,5,'Maldives'),(149,5,'Mali'),(150,5,'Malta'),(151,5,'Marshall Islands'),(152,5,'Martinique'),(153,5,'Mauritania'),(154,5,'Mauritius'),(155,5,'Mayotte'),(156,5,'Mexico'),(157,5,'Micronesia, Federated States of'),(158,5,'Moldova, Republic of'),(159,5,'Monaco'),(160,5,'Mongolia'),(161,5,'Montenegro'),(162,5,'Montserrat'),(163,5,'Morocco'),(164,5,'Mozambique'),(165,5,'Myanmar'),(166,5,'Namibia'),(167,5,'Nauru'),(168,5,'Nepal'),(169,5,'Netherlands'),(170,5,'Netherlands Antilles'),(171,5,'New Caledonia'),(172,5,'New Zealand'),(173,5,'Nicaragua'),(174,5,'Niger'),(175,5,'Nigeria'),(176,5,'Niue'),(177,5,'Norfolk Island'),(178,5,'Northern Mariana Islands'),(179,5,'Norway'),(180,5,'Oman'),(181,5,'Pakistan'),(182,5,'Palau'),(183,5,'Palestinian Territory, Occupied'),(184,5,'Panama'),(185,5,'Papua New Guinea'),(186,5,'Paraguay'),(187,5,'Peru'),(188,5,'Philippines'),(189,5,'Pitcairn'),(190,5,'Poland'),(191,5,'Portugal'),(192,5,'Puerto Rico'),(193,5,'Qatar'),(194,5,'Reunion ﻿ Réunion'),(195,5,'Romania'),(196,5,'Russian Federation'),(197,5,'Rwanda'),(198,5,'Saint Barthélemy'),(199,5,'Saint Helena'),(200,5,'Saint Kitts and Nevis'),(201,5,'Saint Lucia'),(202,5,'Saint Martin (French part)'),(203,5,'Saint Pierre and Miquelon'),(204,5,'Saint Vincent and the Grenadines'),(205,5,'Samoa'),(206,5,'San Marino'),(207,5,'Sao Tome and Principe'),(208,5,'Saudi Arabia'),(209,5,'Senegal'),(210,5,'Serbia'),(211,5,'Seychelles'),(212,5,'Sierra Leone'),(213,5,'Singapore'),(214,5,'Slovakia'),(215,5,'Slovenia'),(216,5,'Solomon Islands'),(217,5,'Somalia'),(218,5,'South Africa'),(219,5,'South Georgia and the South Sandwich Islands'),(220,5,'Spain'),(221,5,'Sri Lanka'),(222,5,'Sudan'),(223,5,'Suriname'),(224,5,'Svalbard and Jan Mayen'),(225,5,'Swaziland'),(226,5,'Sweden'),(227,5,'Switzerland'),(228,5,'Syrian Arab Republic'),(229,5,'Taiwan, Province of China'),(230,5,'Tajikistan'),(231,5,'Tanzania, United Republic of'),(232,5,'Thailand'),(233,5,'Timor-Leste'),(234,5,'Togo'),(235,5,'Tokelau'),(236,5,'Tonga'),(237,5,'Trinidad and Tobago'),(238,5,'Tunisia'),(239,5,'Turkey'),(240,5,'Turkmenistan'),(241,5,'Turks and Caicos Islands'),(242,5,'Tuvalu'),(243,5,'Uganda'),(244,5,'Ukraine'),(245,5,'United Arab Emirates'),(246,5,'United Kingdom'),(247,5,'United States'),(248,5,'United States Minor Outlying Islands'),(249,5,'Uruguay'),(250,5,'Uzbekistan'),(251,5,'Vanuatu'),(252,5,'Venezuela, Bolivarian Republic of'),(253,5,'Viet Nam'),(254,5,'Virgin Islands, British'),(255,5,'Virgin Islands, U.S.'),(256,5,'Wallis and Futuna'),(257,5,'Western Sahara'),(258,5,'Yemen'),(259,5,'Zambia'),(260,5,'Zimbabwe'),(261,6,'No'),(262,6,'Unknown'),(263,6,'Yes-not on ART'),(264,6,'Yes-on ART'),(265,7,'CPAP/NIV mask'),(266,7,'HF nasal cannula'),(267,7,'Mask'),(268,7,'Mask with reservoir'),(269,7,'Unknown'),(270,8,'>15 L/min'),(271,8,'1-5 L/min'),(272,8,'11-15 L/min'),(273,8,'6-10 L/min'),(274,8,'Unknown'),(275,9,'Death'),(276,9,'Discharged alive'),(277,9,'Hospitalized'),(278,9,'Palliative discharge'),(279,9,'Transfer to other facility'),(280,9,'Unknown'),(281,10,'Oxygen therapy'),(282,10,'Room air'),(283,10,'Unknown'),(284,13,'Female'),(285,13,'Male'),(286,13,'Not Specified'),(287,14,'Concentrator'),(288,14,'Cylinder'),(289,14,'Piped'),(290,14,'Unknown'),(291,11,'Not done'),(292,12,'Better'),(293,12,'Same as before illness'),(294,12,'Unknown'),(295,12,'Worse'),(296,15,'No'),(297,15,'Unknown'),(298,15,'Yes'),(299,16,'N/A'),(300,16,'No'),(301,16,'Unknown'),(302,16,'Yes'),(303,11,'Negative'),(304,11,'Positive'),(305,1,'Azithromycin'),(306,1,'Chloroquine/hydroxychloroquine'),(307,1,'Favipiravir');
/*!40000 ALTER TABLE `tb_listofvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_listtype`
--

DROP TABLE IF EXISTS `tb_listtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_listtype` (
  `listTypeID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição.\r\n(en) description.',
  PRIMARY KEY (`listTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_listtype`
--

LOCK TABLES `tb_listtype` WRITE;
/*!40000 ALTER TABLE `tb_listtype` DISABLE KEYS */;
INSERT INTO `tb_listtype` VALUES (1,'Antiviral list'),(2,'AVPU list'),(3,'Coronavirus list'),(4,'Corticosteroid list'),(5,'Country list'),(6,'HIV list'),(7,'Interface list'),(8,'O2 flow list'),(9,'Outcome list'),(10,'Outcome saturation list'),(11,'pnnotdone_list'),(12,'self_care_list'),(13,'sex at birth list'),(14,'Source of oxygen list'),(15,'ynu_list'),(16,'ynun_list');
/*!40000 ALTER TABLE `tb_listtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_multilanguage`
--

DROP TABLE IF EXISTS `tb_multilanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_multilanguage` (
  `languageID` int(11) NOT NULL,
  `description` varchar(300) NOT NULL,
  `descriptionLang` varchar(500) NOT NULL,
  PRIMARY KEY (`languageID`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_multilanguage`
--

LOCK TABLES `tb_multilanguage` WRITE;
/*!40000 ALTER TABLE `tb_multilanguage` DISABLE KEYS */;
INSERT INTO `tb_multilanguage` VALUES (1,'>15 L/min','> 15 L/min'),(1,'1-5 L/min','1-5 L/min'),(1,'11-15 L/min','11-15 L/min'),(1,'6-10 L/min','6-10 L/min'),(1,'A class of questions with date answers.','Uma classe de perguntas com respostas na forma de data.'),(1,'A history of self-reported feverishness or measured fever of ≥ 38 degrees Celsius','Um histórico de febre autorelatado ou febre medida de ≥ 38oC'),(1,'A question where the possible answers are: Yes, No or Unknown.','Uma pergunta onde a resposta pode ser: Sim, Não ou Desconhecido'),(1,'A single question of a questionaire. The rdfs:label of the sub-classes reflect the exact questions text from the WHO CRF.','Uma pergunta de um questionário. As propriedades rdfs:label das sub-classes refletem exatamente as perguntas definidas no FRC da OMS.'),(1,'A term used to indicate that information on a specific question or subject can not be provided because there is no relevance.','Termo usado para indicar que a resposta a uma pergunta ou a informação sobre um assunto não pode ser dada porque não é aplicável.'),(1,'Abdominal pain','Dor abdominal'),(1,'Ability to self-care at discharge versus before illness','Habilidade de autocuidado na alta em comparação com antes da doença'),(1,'Acute renal injury','Lesão renal aguda'),(1,'Acute Respiratory Distress Syndrome','Síndrome Respiratória Aguda'),(1,'Admission date at this facility','Data de admissão nesta unidade'),(1,'Admission form','Formulário de Admissão'),(1,'Afghanistan','Afghanistan'),(1,'Age','Idade'),(1,'Age (months)','Idade (meses)'),(1,'Age (years)','Idade (anos)'),(1,'Aland Islands','Aland Islands'),(1,'Albania','Albania'),(1,'Alert','Alerta'),(1,'Algeria','Algeria'),(1,'ALT/SGPT measurement','ALT/TGP'),(1,'Altered consciousness/confusion','Consciência alterada/confusão'),(1,'American Samoa','American Samoa'),(1,'Anaemia','Anemia'),(1,'Andorra','Andorra'),(1,'Angiotensin converting enzyme inhibitors (ACE inhibitors)','Inibidores da enzima de conversão da angiotensina (inibidores da ECA)'),(1,'Angiotensin II receptor blockers (ARBs)','Bloqueadores dos receptores de angiotensina II (BRAs)'),(1,'Angola','Angola'),(1,'Anguilla','Anguilla'),(1,'Antarctica','Antarctica'),(1,'Antibiotic','Antibiótico'),(1,'Antifungal agent','Agente antifungal'),(1,'Antigua and Barbuda','Antigua and Barbuda'),(1,'Antimalarial agent','Agente antimalárico'),(1,'Antiviral','Antiviral'),(1,'Antiviral list','Lista Antiviral'),(1,'APTT/APTR measurement','TTPA/APTR'),(1,'Argentina','Argentina'),(1,'Armenia','Armenia'),(1,'Aruba','Aruba'),(1,'Ashtma','Asma'),(1,'Asplenia','Asplenia'),(1,'AST/SGOT measurement','AST/TGO'),(1,'Australia','Australia'),(1,'Austria','Austria'),(1,'AVPU list','Lista AVDI'),(1,'AVPU scale','Escala A V D I'),(1,'Azerbaijan','Azerbaijan'),(1,'Azithromycin','Azitromicina'),(1,'Bacteraemia','Bacteremia'),(1,'Bahamas','Bahamas'),(1,'Bahrain','Bahrain'),(1,'Bangladesh','Bangladesh'),(1,'Barbados','Barbados'),(1,'Belarus','Belarus'),(1,'Belgium','Belgium'),(1,'Belize','Belize'),(1,'Benin','Benin'),(1,'Bermuda','Bermuda'),(1,'Better','Melhor'),(1,'Bhutan','Bhutan'),(1,'Bleeding','Sangramento (hemorragia)'),(1,'Bleeding (Haemorrhage)','Sangramento (hemorragia)'),(1,'Bolivia, Plurinational State of','Bolivia, Plurinational State of'),(1,'Boolean_Question','Questão booleana'),(1,'Bosnia and Herzegovina','Bosnia and Herzegovina'),(1,'Botswana','Botswana'),(1,'Bouvet Island','Bouvet Island'),(1,'BP (diastolic)','Pressão arterial (diastólica)'),(1,'BP (systolic)','Pressão arterial (sistólica)'),(1,'Brazil','Brazil'),(1,'British Indian Ocean Territory','British Indian Ocean Territory'),(1,'Bronchiolitis','Bronquiolite'),(1,'Brunei Darussalam','Brunei Darussalam'),(1,'Bulgaria','Bulgaria'),(1,'Burkina Faso','Burkina Faso'),(1,'Burundi','Burundi'),(1,'Cambodia','Cambodia'),(1,'Cameroon','Cameroon'),(1,'Canada','Canada'),(1,'Cape Verde','Cape Verde'),(1,'Cardiac arrest','Parada cardíaca'),(1,'Cardiac arrhythmia','Arritmia cardíaca'),(1,'Cardiomyopathy','Cardiomiopatia'),(1,'Cayman Islands','Cayman Islands'),(1,'Central African Republic','Central African Republic'),(1,'Chad','Chad'),(1,'Chest pain','Dor no peito'),(1,'Chest X-Ray /CT performed','Radiografia/tomografia computadorizada do tórax feita'),(1,'Chile','Chile'),(1,'China','China'),(1,'Chloroquine/hydroxychloroquine','Cloroquina / hidroxicloroquina'),(1,'Christmas Island','Christmas Island'),(1,'Chronic cardiac disease (not hypertension)','Doença cardíaca crônica (não hipertensão)'),(1,'Chronic kidney disease','Doença renal crônica'),(1,'Chronic liver disease','Doença hepática crônica'),(1,'Chronic neurological disorder','Doença neurológica crônica'),(1,'Chronic pulmonary disease','Doença pulmonar crônica'),(1,'Clinical inclusion criteria','Critérios Clínicos para Inclusão'),(1,'Clinical suspicion of ARI despite not meeting criteria above','Suspeita clínica de IRA apesar de não apresentar os sintomas acima'),(1,'Co-morbidities','Comorbidades'),(1,'Cocos (Keeling) Islands','Cocos (Keeling) Islands'),(1,'Colombia','Colombia'),(1,'Comoros','Comoros'),(1,'Complications','Complicações'),(1,'Concentrator','Concentrador'),(1,'Confusion','Confusão'),(1,'Congo','Congo'),(1,'Congo, the Democratic Republic of the','Congo, the Democratic Republic of the'),(1,'Conjunctivitis','Conjuntivite'),(1,'Cook Islands','Cook Islands'),(1,'Coronavirus','Coronavírus'),(1,'Coronavirus list','Lista Coronavirus'),(1,'Corticosteroid','Corticosteroide'),(1,'Corticosteroid list','Lista Corticosteroid'),(1,'Costa Rica','Costa Rica'),(1,'Cote d\'Ivoire','Cote d\'Ivoire'),(1,'Cough','Tosse'),(1,'Cough with haemoptysis','Tosse com hemóptise'),(1,'Cough with sputum','Tosse com expectoração'),(1,'Cough with sputum production','Tosse com expectoração'),(1,'Country','País'),(1,'Country list','Lista Paises'),(1,'CPAP/NIV mask','Máscara CPAP/VNI'),(1,'Creatine kinase measurement','Creatina quinase'),(1,'Creatinine measurement','Creatinina'),(1,'CRF section grouping questions about clinical inclusion criteria.','Parte do FRC que agrupa perguntas sobre os critérios clínicos para inclusão.'),(1,'Croatia','Croatia'),(1,'CRP measurement','PCR'),(1,'Cuba','Cuba'),(1,'Current smoking','Fumante'),(1,'Cylinder','Cilindro'),(1,'Cyprus','Cyprus'),(1,'Czech Republic','Czech Republic'),(1,'D-dimer measurement','Dimero D'),(1,'Daily clinical features','Sintomas diários'),(1,'Date of Birth','Data de nascimento'),(1,'Date of enrolment','Data de inscrição'),(1,'Date of follow up','Data do acompanhamento'),(1,'Date of ICU/HDU admission','Data de Admissão no CTI/UTI'),(1,'Date of onset and admission vital signs','Início da doença e sinais vitais na admissão'),(1,'Date question','Pergunta sobre data'),(1,'Death','Óbito'),(1,'Demographics','Dados demográficos'),(1,'Denmark','Denmark'),(1,'Diabetes','Diabete'),(1,'Diagnostic/pathogen testing','DIagnóstico/teste de patógenos'),(1,'Diarrhoea','Diarréia'),(1,'Discharge sub-section of the WHO COVID-19 CRF. This sub-section is provided when the patient is discharged from the health center or in the case of death.','Sub-seção de alta do FRC para o COVID-19 da OMS. Essa sub-seção é fornecida quando o paciente recebe alta do centro médica or em caso de óbito.'),(1,'Discharge/death form','Formulário de alta/óbito'),(1,'Discharged alive','Alta'),(1,'Djibouti','Djibouti'),(1,'Dominica','Dominica'),(1,'Dominican Republic','Dominican Republic'),(1,'duration in days','duração em dias'),(1,'duration in weeks','duração em semanas'),(1,'Dyspnoea (shortness of breath) OR Tachypnoea','Dispneia (falta de ar) ou Taquipneia'),(1,'e.g.BIPAP/CPAP','p.ex. BIPAP, CPAP'),(1,'Ecuador','Ecuador'),(1,'Egypt','Egypt'),(1,'El Salvador','El Salvador'),(1,'Endocarditis','Endocardite'),(1,'Equatorial Guinea','Equatorial Guinea'),(1,'Eritrea','Eritrea'),(1,'ESR measurement','VHS'),(1,'Estonia','Estonia'),(1,'Ethiopia','Ethiopia'),(1,'Existing conditions prior to admission.','Comorbidades existentes antes da admissão.'),(1,'Experimental agent','Agente experimental'),(1,'Extracorporeal (ECMO) support','Suporte extracorpóreo (ECMO)'),(1,'Facility name','Nome da Instalação'),(1,'Falciparum malaria','Malária Falciparum'),(1,'Falkland Islands (Malvinas)','Falkland Islands (Malvinas)'),(1,'Faroe Islands','Faroe Islands'),(1,'Fatigue/Malaise','Fadiga/mal estar'),(1,'Favipiravir','Favipiravir'),(1,'Female','Feminino'),(1,'Ferritin measurement','Ferritina'),(1,'Fiji','Fiji'),(1,'Finland','Finland'),(1,'FiO2 value','Fração de oxigênio inspirado'),(1,'first available data at presentation/admission','primeiros dados disponíveis na admissão'),(1,'Follow-up','Acompanhamento'),(1,'Follow-up sub-section of the WHO COVID-19 CRF. The completion frequency of this sub-section is determined by available resources.','Sub-seção do FRC para o COVID-19 da OMS. A frequência de preenchimento dessa sub-seção é determinada pelos recursos disponíveis.'),(1,'France','France'),(1,'French Guiana','French Guiana'),(1,'French Polynesia','French Polynesia'),(1,'French Southern Territories','French Southern Territories'),(1,'Gabon','Gabon'),(1,'Gambia','Gambia'),(1,'Georgia','Georgia'),(1,'Germany','Germany'),(1,'Gestational weeks assessment','Tempo de gravidez'),(1,'Ghana','Ghana'),(1,'Gibraltar','Gibraltar'),(1,'Glasgow Coma Score (GCS /15)','Escala de Coma de Glasgow (GCS /15)'),(1,'Greece','Greece'),(1,'Greenland','Greenland'),(1,'Grenada','Grenada'),(1,'Guadeloupe','Guadeloupe'),(1,'Guam','Guam'),(1,'Guatemala','Guatemala'),(1,'Guernsey','Guernsey'),(1,'Guinea','Guinea'),(1,'Guinea-Bissau','Guinea-Bissau'),(1,'Guyana','Guyana'),(1,'Haematocrit measurement','Hematócrito'),(1,'Haemoglobin measurement','Hemoglobina'),(1,'Haiti','Haiti'),(1,'Headache','Dor de cabeça'),(1,'Healthcare worker','Profissional de Saúde'),(1,'Heard Island and McDonald Islands','Heard Island and McDonald Islands'),(1,'Heart rate','Frequência cardíaca'),(1,'Height','Altura'),(1,'HF nasal cannula','Cânula nasal de alto fluxo'),(1,'History of fever','Histórico de febre'),(1,'HIV','HIV'),(1,'HIV list','Lista HIV'),(1,'Holy See (Vatican City State)','Holy See (Vatican City State)'),(1,'Honduras','Honduras'),(1,'Hong Kong','Hong Kong'),(1,'Hospitalized','Internado'),(1,'Hungary','Hungary'),(1,'Hypertension','Hipertensão'),(1,'Iceland','Iceland'),(1,'ICU or High Dependency Unit admission','UTI ou UCE'),(1,'ICU/HDU discharge date','Data de Alta do CTI/UTI'),(1,'If bleeding: specify site(s)','Caso afirmativo: especifique o(s) local(is)'),(1,'If yes, specify','Caso afirmativo, especifique'),(1,'IL-6 measurement','IL-6'),(1,'Inability to walk','Incapaz de andar'),(1,'India','India'),(1,'Indonesia','Indonesia'),(1,'Infiltrates present','Presença de infiltrados'),(1,'Influenza virus','Vírus influenza'),(1,'Influenza virus type','tipo de vírus influenza'),(1,'Inhaled','Inalatória'),(1,'Inotropes/vasopressors','Inotrópicos/vasopressores'),(1,'INR measurement','INR'),(1,'Interface list','Lista Interface de O2'),(1,'Interferon alpha','Interferon alfa'),(1,'Interferon beta','Interferon beta'),(1,'Intravenous','Intravenosa'),(1,'Intravenous fluids','Hidratação venosa'),(1,'Invasive ventilation','Ventilação invasiva'),(1,'Iran, Islamic Republic of','Iran, Islamic Republic of'),(1,'Iraq','Iraq'),(1,'Ireland','Ireland'),(1,'Is the patient CURRENTLY receiving any of the following?','O paciente esta recebendo algum dos seguintes ATUALMENTE?'),(1,'Isle of Man','Isle of Man'),(1,'Israel','Israel'),(1,'Italy','Italy'),(1,'Jamaica','Jamaica'),(1,'Japan','Japan'),(1,'Jersey','Jersey'),(1,'Joint pain (arthralgia)','Dor articular (artralgia)'),(1,'Jordan','Jordan'),(1,'Kazakhstan','Kazakhstan'),(1,'Kenya','Kenya'),(1,'Kiribati','Kiribati'),(1,'Korea, Democratic People\'s Republic of','Korea, Democratic People\'s Republic of'),(1,'Korea, Republic of','Korea, Republic of'),(1,'Kuwait','Kuwait'),(1,'Kyrgyzstan','Kyrgyzstan'),(1,'Laboratory question','Pergunta laboratorial'),(1,'Laboratory results','Resultados laboratoriais'),(1,'Laboratory Worker','Profissional de Laboratório'),(1,'Lactate measurement','Lactose'),(1,'Lao People\'s Democratic Republic','Lao People\'s Democratic Republic'),(1,'Latvia','Latvia'),(1,'LDH measurement','LDH'),(1,'Lebanon','Lebanon'),(1,'Lesotho','Lesotho'),(1,'Liberia','Liberia'),(1,'Libyan Arab Jamahiriya','Libyan Arab Jamahiriya'),(1,'Liechtenstein','Liechtenstein'),(1,'List of instances of the answers for the \'Sex at Birth\' question. In the WHO CRF, the three possible answers are: male, female or not specified.','Lista de instâncias das possíveis respostas para a pergunta \'Sexo as nascer\'. No FRC da OMS as três possíveis respostas são: masculino, feminino ou não especificado.'),(1,'List question','Questão com respostas em lista padronizada'),(1,'Lithuania','Lithuania'),(1,'Liver dysfunction','Disfunção hepática'),(1,'Lopinavir/Ritonavir','Lopinavir/Ritonavir'),(1,'Loss of smell','Perda do Olfato'),(1,'Loss of smell daily','Perda do Olfato'),(1,'Loss of smell signs','Perda do Olfato'),(1,'Loss of taste','Perda do paladar'),(1,'Loss of taste daily','Perda do paladar'),(1,'Loss of taste signs','Perda do paladar'),(1,'Lower chest wall indrawing','Retração toráxica'),(1,'Luxembourg','Luxembourg'),(1,'Lymphadenopathy','Linfadenopatia'),(1,'Macao','Macao'),(1,'Macedonia, the former Yugoslav Republic of','Macedonia, the former Yugoslav Republic of'),(1,'Madagascar','Madagascar'),(1,'Malawi','Malawi'),(1,'Malaysia','Malaysia'),(1,'Maldives','Maldives'),(1,'Male','Masculino'),(1,'Mali','Mali'),(1,'Malignant neoplasm','Neoplasma maligno'),(1,'Malnutrition','Desnutrição'),(1,'Malta','Malta'),(1,'Marshall Islands','Marshall Islands'),(1,'Martinique','Martinique'),(1,'Mask','Máscara'),(1,'Mask with reservoir','Máscara com reservatório'),(1,'Mauritania','Mauritania'),(1,'Mauritius','Mauritius'),(1,'Maximum daily corticosteroid dose','Dose diária máxima de corticosteroide'),(1,'Mayotte','Mayotte'),(1,'Medication','Medicação'),(1,'Meningitis/Encephalitis','Meningite/encefalite'),(1,'MERS-CoV','MERS-CoV'),(1,'Mexico','Mexico'),(1,'Micronesia, Federated States of','Micronesia, Federated States of'),(1,'Mid-upper arm circumference','Circunferência braquial'),(1,'Moldova, Republic of','Moldova, Republic of'),(1,'Monaco','Monaco'),(1,'Mongolia','Mongolia'),(1,'Montenegro','Montenegro'),(1,'Montserrat','Montserrat'),(1,'Morocco','Morocco'),(1,'Mozambique','Mozambique'),(1,'Muscle aches (myalgia)','Dor muscular (mialgia)'),(1,'Myanmar','Myanmar'),(1,'Myocarditis/Pericarditis','Miocardite/Pericardite'),(1,'N/A','Não informado'),(1,'Namibia','Namibia'),(1,'Nauru','Nauru'),(1,'Negative','Negativo'),(1,'Nepal','Nepal'),(1,'Netherlands','Netherlands'),(1,'Netherlands Antilles','Netherlands Antilles'),(1,'Neuraminidase inhibitor','Inibidor de neuraminidase'),(1,'New Caledonia','New Caledonia'),(1,'New Zealand','New Zealand'),(1,'Nicaragua','Nicaragua'),(1,'Niger','Niger'),(1,'Nigeria','Nigeria'),(1,'Niue','Niue'),(1,'No','Não'),(1,'Non-Falciparum malaria','Malária Não Falciparum'),(1,'Non-invasive ventilation','Ventilação não-invasiva'),(1,'Non-steroidal anti-inflammatory (NSAID)','Antiinflamatório não esteroide (AINE)'),(1,'Norfolk Island','Norfolk Island'),(1,'Northern Mariana Islands','Northern Mariana Islands'),(1,'Norway','Norway'),(1,'Not done','Não realizado'),(1,'Not known, not observed, not recorded, or refused.','Desconhecido, não observado, não registrato or recusado.'),(1,'Not Specified','Não especificado'),(1,'Number question','Pergunta numérica'),(1,'O2 flow','Vazão de O2'),(1,'O2 flow list','Lista fluxo de O2'),(1,'Oman','Oman'),(1,'Oral','Oral'),(1,'Oral/orogastric fluids','Hidratação oral/orogástrica'),(1,'Other co-morbidities','Outras comorbidades'),(1,'Other complication','Outra complicação'),(1,'Other corona virus','Outro coronavírus'),(1,'Other respiratory pathogen','Outro patógeno respiratório'),(1,'Other signs or symptoms','Outros'),(1,'Outcome','Desfecho'),(1,'Outcome date','Data do desfecho'),(1,'Outcome list','Lista de desfecho'),(1,'Outcome saturation list','Lista de Saturação de desfecho'),(1,'Oxygen interface','Interface de oxigenoterapia'),(1,'Oxygen saturation','Saturação de oxigênio'),(1,'Oxygen saturation expl','em'),(1,'Oxygen therapy','Oxigenoterapia'),(1,'PaCO2 value','Pressão parcial do CO2'),(1,'Pain','Dor'),(1,'Pakistan','Pakistan'),(1,'Palau','Palau'),(1,'Palestinian Territory, Occupied','Palestinian Territory, Occupied'),(1,'Palliative discharge','Alta paliativa'),(1,'Panama','Panama'),(1,'Pancreatitis','Pancreatite'),(1,'PaO2 value','Pressão parcial do O2'),(1,'Papua New Guinea','Papua New Guinea'),(1,'Paraguay','Paraguay'),(1,'PEEP value','Pressão expiratória final positiva'),(1,'Peru','Peru'),(1,'Philippines','Philippines'),(1,'Piped','Canalizado'),(1,'Pitcairn','Pitcairn'),(1,'Plateau pressure value','Pressão do plato'),(1,'Platelets measurement','Plaquetas'),(1,'Pneumonia','Pneumonia'),(1,'PNNot_done_Question','Questão com resposta Positivo Negativo ou não realizada'),(1,'pnnotdone_list','Lista PNNotDone'),(1,'Poland','Poland'),(1,'Portugal','Portugal'),(1,'Positive','Positivo'),(1,'Potassium measurement','Potássio'),(1,'Pre-admission & chronic medication','Pré-admissão e medicamentos de uso contínuo'),(1,'Pregnant','Grávida'),(1,'Procalcitonin measurement','Procalcitonina'),(1,'Prone position','Posição prona'),(1,'Proven or suspected infection with pathogen of Public Health Interest','Quadro de infecção comprovada ou suspeita com patógeno de interesse para a Saúde Pública'),(1,'PT measurement','TP'),(1,'Puerto Rico','Puerto Rico'),(1,'Qatar','Qatar'),(1,'Renal replacement therapy (RRT) or dialysis','Terapia de substituição renal ou diálise'),(1,'Respiratory rate','Frequência respiratória'),(1,'Reunion ﻿ Réunion','Reunion ﻿ Réunion'),(1,'Ribavirin','Ribavirina'),(1,'Romania','Romania'),(1,'Room air','ar ambiente'),(1,'Runny nose (rhinorrhoea)','Coriza (rinorréia)'),(1,'Russian Federation','Russian Federation'),(1,'Rwanda','Rwanda'),(1,'Saint Barthélemy','Saint Barthélemy'),(1,'Saint Helena','Saint Helena'),(1,'Saint Kitts and Nevis','Saint Kitts and Nevis'),(1,'Saint Lucia','Saint Lucia'),(1,'Saint Martin (French part)','Saint Martin (French part)'),(1,'Saint Pierre and Miquelon','Saint Pierre and Miquelon'),(1,'Saint Vincent and the Grenadines','Saint Vincent and the Grenadines'),(1,'Same as before illness','Como antes da doença'),(1,'Samoa','Samoa'),(1,'San Marino','San Marino'),(1,'Sao Tome and Principe','Sao Tome and Principe'),(1,'SARS-CoV-2','SARS-CoV-2'),(1,'Saudi Arabia','Saudi Arabia'),(1,'Seizures','Convulsões'),(1,'self_care_list','Lista cuidados'),(1,'Senegal','Senegal'),(1,'Serbia','Serbia'),(1,'Severe dehydration','Desidratação severa'),(1,'Sex at Birth','Sexo ao Nascer'),(1,'sex at birth list','Lista de sexo'),(1,'Seychelles','Seychelles'),(1,'Shock','Choque'),(1,'Shortness of breath','Falta de ar'),(1,'Sierra Leone','Sierra Leone'),(1,'Signs and symptoms on admission','Sinais e sintomas na hora da admissão'),(1,'Singapore','Singapore'),(1,'Site name','Localidade'),(1,'Skin rash','Erupções cutâneas'),(1,'Skin ulcers','Úlceras cutâneas'),(1,'Slovakia','Slovakia'),(1,'Slovenia','Slovenia'),(1,'Sodium measurement','Sódio'),(1,'Solomon Islands','Solomon Islands'),(1,'Somalia','Somalia'),(1,'Sore throat','Dor de garganta'),(1,'Source of oxygen','Fonte de Oxigênio'),(1,'Source of oxygen list','lista de fonte de O2'),(1,'South Africa','South Africa'),(1,'South Georgia and the South Sandwich Islands','South Georgia and the South Sandwich Islands'),(1,'Spain','Spain'),(1,'specific response','resposta específica'),(1,'Sri Lanka','Sri Lanka'),(1,'Sternal capillary refill time >2seconds','Tempo de enchimento capilar >2 segundos'),(1,'Sudan','Sudan'),(1,'Supportive care','Cuidados'),(1,'Suriname','Suriname'),(1,'Svalbard and Jan Mayen','Svalbard and Jan Mayen'),(1,'Swaziland','Swaziland'),(1,'Sweden','Sweden'),(1,'Switzerland','Switzerland'),(1,'Symptom onset (date of first/earliest symptom)','Início de Sintomas (data do primeiro sintoma)'),(1,'Syrian Arab Republic','Syrian Arab Republic'),(1,'Systemic anticoagulation','Anticoagulação sistêmica'),(1,'Taiwan, Province of China','Taiwan, Province of China'),(1,'Tajikistan','Tajikistan'),(1,'Tanzania, United Republic of','Tanzania, United Republic of'),(1,'Temperature','Temperatura'),(1,'Text_Question','Questão com resposta textual'),(1,'Thailand','Thailand'),(1,'The affirmative response to a question.','A resposta afirmativa à uma pergunta.'),(1,'The country where the medical center is located.','O país onde o centro médico está localizado.'),(1,'The name of the health center in which the participant is being treated.','O centro médico onde o participante está sendo tratado.'),(1,'The non-affirmative response to a question.','A resposta negativa à uma pergunta.'),(1,'The number of breaths (inhalation and exhalation) taken per minute time.','O número de respirações medidos a cada minuto.'),(1,'The number of heartbeats measured per minute time.','O número de batimentos cardíacos medidos a cada minuto.'),(1,'The Person that is the case subject of the WHO CRF.','A Pessoa que é o objeto do caso relatado pelo FRC da OMS.'),(1,'This class represents the Rapid version of the World Health Organisation\'s (WHO) Case Record Form (CRF) for the COVID-19 outbreak.','Esta classe representa a versão Rapid do Formulário de Relato de Caso (FRC) para a epidemia COVID-19, criada pela Organização Mundial de Saúde.'),(1,'time in weeks','tempo em semanas'),(1,'Timor-Leste','Timor-Leste'),(1,'Togo','Togo'),(1,'Tokelau','Tokelau'),(1,'Tonga','Tonga'),(1,'Total bilirubin measurement','Bilirrubina total'),(1,'Total duration ECMO','duração em dias'),(1,'Total duration ICU/HCU','duração em dias'),(1,'Total duration Inotropes/vasopressors','duração em dias'),(1,'Total duration Invasive ventilation','duração em dias'),(1,'Total duration Non-invasive ventilation','duração em dias'),(1,'Total duration Oxygen Therapy','duração em dias'),(1,'Total duration Prone position','duração em dias'),(1,'Total duration RRT or dyalysis','duração em dias'),(1,'Transfer to other facility','Transferência para outra unidade'),(1,'Trinidad and Tobago','Trinidad and Tobago'),(1,'Troponin measurement','Troponina'),(1,'Tuberculosis','Tuberculose'),(1,'Tunisia','Tunisia'),(1,'Turkey','Turkey'),(1,'Turkmenistan','Turkmenistan'),(1,'Turks and Caicos Islands','Turks and Caicos Islands'),(1,'Tuvalu','Tuvalu'),(1,'Uganda','Uganda'),(1,'Ukraine','Ukraine'),(1,'United Arab Emirates','United Arab Emirates'),(1,'United Kingdom','United Kingdom'),(1,'United States','United States'),(1,'United States Minor Outlying Islands','United States Minor Outlying Islands'),(1,'Unknown','Desconhecido'),(1,'Unresponsive','Indiferente'),(1,'Urea (BUN) measurement','Uréia (BUN)'),(1,'Uruguay','Uruguay'),(1,'Uzbekistan','Uzbekistan'),(1,'Vanuatu','Vanuatu'),(1,'Venezuela, Bolivarian Republic of','Venezuela, Bolivarian Republic of'),(1,'Ventilation question','Questão sobre Ventilação'),(1,'Verbal','Verbal'),(1,'Viet Nam','Viet Nam'),(1,'Viral haemorrhagic fever','Febre viral hemorrágica'),(1,'Virgin Islands, British','Virgin Islands, British'),(1,'Virgin Islands, U.S.','Virgin Islands, U.S.'),(1,'Vital signs','Sinais Vitais'),(1,'Vomiting/Nausea','Vômito/náusea'),(1,'Wallis and Futuna','Wallis and Futuna'),(1,'Was pathogen testing done during this illness episode','Esse teste foi realizado durante este episódio da doença'),(1,'WBC count measurement','Leucócitos'),(1,'Weight','Peso'),(1,'Were any of the following taken within 14 days of admission?','Marque os usados nos 14 dias antes da admissão'),(1,'Western Sahara','Western Sahara'),(1,'Wheezing','Respiração sibilante'),(1,'Which antibiotic','Antibiótico'),(1,'Which antifungal agent','Qual agente antifungal'),(1,'Which antimalarial agent','Qual agente antimalárico'),(1,'Which antiviral','Qual antiviral'),(1,'Which complication','Qual complicação'),(1,'Which coronavirus','Qual coronavírus'),(1,'Which corticosteroid route','Qual via do corticosteroide'),(1,'Which experimental agent','Qual agente experimental'),(1,'Which NSAID','Qual AINE'),(1,'Which other antiviral','Qual outro antiviral'),(1,'Which other co-morbidities','Outras comorbidades'),(1,'Which other pathogen of public health interest detected','Qual outro patógeno'),(1,'Which respiratory pathogen','Qual patógeno respiratório'),(1,'Which sign or symptom','Qual sinal ou sintoma'),(1,'Which virus','Qual vírus'),(1,'WHO COVID-19 Rapid Version CRF','OMS-COVID-19-Rapid-FRC'),(1,'Worse','Pior'),(1,'Yemen','Yemen'),(1,'Yes','Sim'),(1,'Yes-not on ART','Sim-não toma antivirais'),(1,'Yes-on ART','Sim-toma antivirais'),(1,'ynu_list','Lista YNU'),(1,'YNU_Question','Questão com resposta Sim Não Desconhecido'),(1,'ynun_list','Lista YNUN'),(1,'YNUN_Question','Questão com resposta Sim Não Desconhecido Não Informado'),(1,'Zambia','Zambia'),(1,'Zimbabwe','Zimbabwe');
/*!40000 ALTER TABLE `tb_multilanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_notificationrecord`
--

DROP TABLE IF EXISTS `tb_notificationrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_notificationrecord` (
  `userID` int(11) NOT NULL,
  `profileID` int(11) NOT NULL,
  `hospitalUnitID` int(11) NOT NULL,
  `tableName` varchar(255) NOT NULL,
  `rowdID` int(11) NOT NULL,
  `changedOn` timestamp NOT NULL,
  `operation` varchar(1) NOT NULL,
  `log` text,
  PRIMARY KEY (`userID`,`profileID`,`hospitalUnitID`,`tableName`,`rowdID`,`changedOn`,`operation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_notificationrecord`
--

LOCK TABLES `tb_notificationrecord` WRITE;
/*!40000 ALTER TABLE `tb_notificationrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_notificationrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ontology`
--

DROP TABLE IF EXISTS `tb_ontology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ontology` (
  `ontologyID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `dtRelease` timestamp NULL DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ontologyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ontology`
--

LOCK TABLES `tb_ontology` WRITE;
/*!40000 ALTER TABLE `tb_ontology` DISABLE KEYS */;
INSERT INTO `tb_ontology` VALUES (1,'WHO COVID-19 Rapid Version CRF Semantic Data Model','1.0.0','2020-05-07 03:00:00','https://creativecommons.org/licenses/by/4.0/legalcode','COVIDCRFRAPID');
/*!40000 ALTER TABLE `tb_ontology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ontologyterms`
--

DROP TABLE IF EXISTS `tb_ontologyterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ontologyterms` (
  `ontologyID` int(10) NOT NULL,
  `ontologyURI` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ontologyterms`
--

LOCK TABLES `tb_ontologyterms` WRITE;
/*!40000 ALTER TABLE `tb_ontologyterms` DISABLE KEYS */;
INSERT INTO `tb_ontologyterms` VALUES (1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ad','Andorra'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ae','United Arab Emirates'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#af','Afghanistan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ag','Antigua and Barbuda'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ai','Anguilla'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#al','Albania'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#am','Armenia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#an','Netherlands Antilles'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ao','Angola'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#aq','Antarctica'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ar','Argentina'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#as','American Samoa'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#at','Austria'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#au','Australia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#aw','Aruba'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ax','Aland Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#az','Azerbaijan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ba','Bosnia and Herzegovina'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bb','Barbados'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bd','Bangladesh'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#be','Belgium'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bf','Burkina Faso'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bg','Bulgaria'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bh','Bahrain'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bi','Burundi'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bj','Benin'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bl','Saint Barthélemy'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bm','Bermuda'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bn','Brunei Darussalam'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bo','Bolivia, Plurinational State of'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#br','Brazil'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bs','Bahamas'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bt','Bhutan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bv','Bouvet Island'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bw','Botswana'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#by','Belarus'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bz','Belize'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ca','Canada'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cc','Cocos (Keeling) Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cd','Congo, the Democratic Republic of the'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cf','Central African Republic'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cg','Congo'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ch','Switzerland'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ci','Cote d\'Ivoire'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ck','Cook Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cl','Chile'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cm','Cameroon'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cn','China'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#co','Colombia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cr','Costa Rica'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cu','Cuba'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cv','Cape Verde'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cx','Christmas Island'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cy','Cyprus'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cz','Czech Republic'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#de','Germany'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#dj','Djibouti'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#dk','Denmark'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#dm','Dominica'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#do','Dominican Republic'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#dz','Algeria'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ec','Ecuador'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ee','Estonia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#eg','Egypt'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#eh','Western Sahara'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#er','Eritrea'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#es','Spain'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#et','Ethiopia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fi','Finland'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fj','Fiji'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fk','Falkland Islands (Malvinas)'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fm','Micronesia, Federated States of'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fo','Faroe Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fr','France'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ga','Gabon'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gb','United Kingdom'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gd','Grenada'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ge','Georgia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gf','French Guiana'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gg','Guernsey'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gh','Ghana'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gi','Gibraltar'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gl','Greenland'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gm','Gambia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gn','Guinea'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gp','Guadeloupe'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gq','Equatorial Guinea'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gr','Greece'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gs','South Georgia and the South Sandwich Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gt','Guatemala'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gu','Guam'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gw','Guinea-Bissau'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gy','Guyana'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#hk','Hong Kong'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#hm','Heard Island and McDonald Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#hn','Honduras'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#hr','Croatia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ht','Haiti'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#hu','Hungary'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#id','Indonesia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ie','Ireland'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#il','Israel'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#im','Isle of Man'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#in','India'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#io','British Indian Ocean Territory'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#iq','Iraq'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ir','Iran, Islamic Republic of'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#is','Iceland'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#it','Italy'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#je','Jersey'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#jm','Jamaica'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#jo','Jordan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#jp','Japan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ke','Kenya'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kg','Kyrgyzstan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kh','Cambodia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ki','Kiribati'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#km','Comoros'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kn','Saint Kitts and Nevis'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kp','Korea, Democratic People\'\'s Republic of'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kr','Korea, Republic of'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kw','Kuwait'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ky','Cayman Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kz','Kazakhstan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#la','Lao People\'s Democratic Republic'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lb','Lebanon'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lc','Saint Lucia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#li','Liechtenstein'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lk','Sri Lanka'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lr','Liberia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ls','Lesotho'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lt','Lithuania'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lu','Luxembourg'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lv','Latvia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ly','Libyan Arab Jamahiriya'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ma','Morocco'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mc','Monaco'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#md','Moldova, Republic of'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#me','Montenegro'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mf','Saint Martin (French part)'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mg','Madagascar'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mh','Marshall Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mk','Macedonia, the former Yugoslav Republic of'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ml','Mali'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mm','Myanmar'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mn','Mongolia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mo','Macao'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mp','Northern Mariana Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mq','Martinique'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mr','Mauritania'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ms','Montserrat'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mt','Malta'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mu','Mauritius'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mv','Maldives'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mw','Malawi'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mx','Mexico'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#my','Malaysia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mz','Mozambique'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#na','Namibia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nc','New Caledonia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ne','Niger'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nf','Norfolk Island'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ng','Nigeria'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ni','Nicaragua'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nl','Netherlands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#no','Norway'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#np','Nepal'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nr','Nauru'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nu','Niue'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nz','New Zealand'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#om','Oman'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pa','Panama'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pe','Peru'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pf','French Polynesia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pg','Papua New Guinea'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ph','Philippines'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pk','Pakistan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pl','Poland'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pm','Saint Pierre and Miquelon'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pn','Pitcairn'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pr','Puerto Rico'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ps','Palestinian Territory, Occupied'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pt','Portugal'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pw','Palau'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#py','Paraguay'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#qa','Qatar'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#re','Reunion ﻿ Réunion'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ro','Romania'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#rs','Serbia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ru','Russian Federation'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#rw','Rwanda'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sa','Saudi Arabia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sb','Solomon Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sc','Seychelles'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sd','Sudan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#se','Sweden'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sg','Singapore'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sh','Saint Helena'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#si','Slovenia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sj','Svalbard and Jan Mayen'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sk','Slovakia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sl','Sierra Leone'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sm','San Marino'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sn','Senegal'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#so','Somalia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sr','Suriname'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#st','Sao Tome and Principe'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sv','El Salvador'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sy','Syrian Arab Republic'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sz','Swaziland'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tc','Turks and Caicos Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#td','Chad'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tf','French Southern Territories'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tg','Togo'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#th','Thailand'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tj','Tajikistan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tk','Tokelau'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tl','Timor-Leste'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tm','Turkmenistan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tn','Tunisia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#to','Tonga'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tr','Turkey'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tt','Trinidad and Tobago'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tv','Tuvalu'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tw','Taiwan, Province of China'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tz','Tanzania, United Republic of'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ua','Ukraine'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ug','Uganda'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#um','United States Minor Outlying Islands'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#us','United States'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#uy','Uruguay'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#uz','Uzbekistan'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#va','Holy See (Vatican City State)'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#vc','Saint Vincent and the Grenadines'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ve','Venezuela, Bolivarian Republic of'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#vg','Virgin Islands, British'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#vi','Virgin Islands, U.S.'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#vn','Viet Nam'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#vu','Vanuatu'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#wf','Wallis and Futuna'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ws','Samoa'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ye','Yemen'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#yt','Mayotte'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#za','South Africa'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#zm','Zambia'),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#zw','Zimbabwe'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/1-5_L_per_min','1-5 L/min'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/11-15_L_per_min','11-15 L/min'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/306f9490_ad16_4530_880b_c4d0dd5332dd','duration in weeks'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/6-10_L_per_min','6-10 L/min'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/89fc2ab5_2f09_4c61_ba83_68112c54ac11','duration in days'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Abdominal_pain','Abdominal pain'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Ability_self_care','Ability to self-care at discharge versus before illness'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ACE_inhibitors','Angiotensin converting enzyme inhibitors (ACE inhibitors)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ACE_inhibitors_medication',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ACE_inhibitors_pre_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Acute_renal_injury','Acute renal injury'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Acute_Respiratory_Distress_Syndrome','Acute Respiratory Distress Syndrome'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/admission','Admission date at this facility'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Age','Age'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Age_months',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Age_years',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Altered_consciousness','Altered consciousness/confusion'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Altered_consciousness_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Altered_consciousness_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ALT_SGPT','Question about ALT/SGPT measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Anaemia','Anaemia'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Antibiotic','Antibiotic'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Antifungal_agent','Antifungal agent'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Antimalarial','Antimalarial agent'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Antiviral','Antiviral'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/antiviral_list','Antiviral list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/APTT_APTR','Question about APTT/APTR measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ARBs','Angiotensin II receptor blockers (ARBs)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ARBs_medication',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ARBs_pre_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Arm','Mid-upper arm circumference'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Arthralgia','Joint pain (arthralgia)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Asplenia','Asplenia'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Asthma','Ashtma'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/AST_SGOT','Question about AST/SGOT measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/AVPU_list','AVPU list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/AVPU_scale','AVPU scale'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/AVPU_scale_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/AVPU_scale_vital',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Azithromycin','Azithromycin'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Bacteraemia','Bacteraemia'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Birth','Date of Birth'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Bleeding','Bleeding'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Boolean_Question','Boolean_Question'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_diastolic','BP (diastolic)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_diastolic_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_diastolic_vital',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_systolic','BP (systolic)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_systolic_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_systolic_vital',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Bronchiolitis','Bronchiolitis'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Capillary_refill','Sternal capillary refill time >2seconds'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Capillary_refill_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Capillary_refill_vital',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cardiac_arrest','Cardiac arrest'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cardiac_arrhythmia','Cardiac arrhythmia'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cardiac_disease','Chronic cardiac disease (not hypertension)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cardiomyopathy','Cardiomyopathy'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Chest_imaging','Chest X-Ray /CT performed'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Chest_pain','Chest pain'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Chest_pain_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Chest_pain_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Chloroquine/hydroxychloroquine','Chloroquine/hydroxychloroquine'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Co-morbidities','Co-morbidities'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Complications','Complications'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Concentrator','Concentrator'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Confusion','Confusion'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Conjunctivitis','Conjunctivitis'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Conjunctivitis_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Conjunctivitis_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Coronavirus','Coronavirus'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/corona_virus_list','Coronavirus list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Corticosteroid','Corticosteroid'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/corticosteroid_list','Corticosteroid list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough','Cough'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_maemoptysis','Cough with haemoptysis'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_sputum','Cough with sputum'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_sputum_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_sputum_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Country','Country'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/CPAP/NIV_Mask','CPAP/NIV mask'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Creatine_kinase','Question about Creatine kinase measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Creatinine','Question about Creatinine measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/CRP','Question about CRP measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cylinder','Cylinder'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/D-dimer','Question about D-dimer measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Daily_clinical_features','Daily clinical features'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Daily_vital_signs','Vital signs'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Date_of_ICU_admission','Date of ICU admission'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Date_of_ICU_discharge','Date of ICU discharge'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Date_Question','Date question'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Demographics','Demographics'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Diabetes','Diabetes'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Diarrhoea','Diarrhoea'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Diarrhoea_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Diarrhoea_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ECMO_support','Extracorporeal (ECMO) support'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Endocarditis','Endocarditis'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Enrolment','Date of enrolment'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ESR','Question about ESR measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Experimental_agent','Experimental agent'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Facility_name','Facility name'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Falciparum_malaria','Falciparum malaria'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Fatigue','Fatigue/Malaise'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Favipiravir','Favipiravir'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Ferritin','Question about Ferritin measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Fever','History of fever'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/FiO2_value','FiO2 value'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Follow-up_date','Date of follow up'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/GCS','Glasgow Coma Score (GCS /15)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/GCS_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/GCS_vital',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Gestational_weeks','Question about gestational weeks assessment'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Haematocrit','Question about Haematocrit measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Haemoglobin','Question about Haemoglobin measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Haemorrhage','Bleeding (Haemorrhage)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Headache','Headache'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Healtcare_worker','Healthcare worker'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Heart_rate','Heart rate'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Heart_rate_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Heart_rate_vital',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Height','Height'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/HF_nasal_cannula','HF nasal cannula'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/HIV','HIV'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/hiv_list','HIV list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/HIV_test','HIV'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Hypertension','Hypertension'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ICU_admission','ICU or High Dependency Unit admission'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/IL-6','Question about IL-6 measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inability_to_walk','Inability to walk'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion','Clinical inclusion criteria'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion_ARI','Clinical suspicion of ARI despite not meeting criteria above'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion_cough','Question about presence of cough'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion_dyspnoea','Question about presence of dyspnoea (shortness of breath) OR Tachypnoea'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion_feverishness','A history of self-reported feverishness or measured fever of ≥ 38 degrees Celsius'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion_pathogen','Proven or suspected infection with pathogen of Public Health Interest'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Infiltrates_present','Infiltrates present'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Influenza_virus','Influenza virus'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Influenza_virus_type','Influenza virus type'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inhaled','Inhaled'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inotropes_vasopressors','Inotropes/vasopressors'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/INR','Question about INR measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/avpu-list/A','Alert'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/avpu-list/P','Pain'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/avpu-list/U','Unresponsive'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/avpu-list/V','Verbal'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Better','Better'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C17998','Unknown'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C18902','N/A'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C25311','Oral'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C38046','Not Specified'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C46109','Male'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C46110','Female'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C49487','No'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C49488','Yes'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Death','Death'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Discharged_alive','Discharged alive'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Hospitalized','Hospitalized'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/MERS-CoV','MERS-CoV'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Negative','Negative'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Not_done','Not done'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Palliative_discharge','Palliative discharge'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Positive','Positive'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Same_as_before','Same as before illness'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/SARS-CoV-2','SARS-CoV-2'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Worse','Worse'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Interferon_alpha','Interferon alpha'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Interferon_beta','Interferon beta'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Intravenous','Intravenous'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Intravenous_fluids','Intravenous fluids'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Invasive_ventilation','Invasive ventilation'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Kidney_disease','Chronic kidney disease'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Laboratory_question','Laboratory question'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Laboratory_results','Laboratory results'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Laboratory_Worker','Laboratory Worker'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Lactate','Question about Lactate measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/LDH','Question about LDH measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/List_Question','List question'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Liver_disease','Chronic liver disease'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Liver_dysfunction','Liver dysfunction'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Lopinavir_Ritonavir','Lopinavir/Ritonavir'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_smell','Loss of smell'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_smell_daily','Loss of smell daily'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_smell_signs','Loss of smell signs'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_taste','Loss of taste'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_taste_daily','Loss of taste daily'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_taste_signs','Loss of taste signs'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Lower_chest_wall_indrawing','Lower chest wall indrawing'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Lymphadenopathy','Lymphadenopathy'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Malignant_neoplasm','Malignant neoplasm'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Malnutrition','Malnutrition'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Mask','Mask'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Mask_with_reservoir','Mask with reservoir'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Maximum_daily_corticosteroid_dose','Maximum daily corticosteroid dose'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Medication','Medication'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Meningitis_Encephalitis','Meningitis/Encephalitis'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Module_1','Admission form'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Module_2','Follow-up'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Module_3','Discharge/death form'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Myalgia','Muscle aches (myalgia)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Myalgia_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Myalgia_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Myocarditis_Pericarditis','Myocarditis/Pericarditis'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Neuraminidase_inhibitor','Neuraminidase inhibitor'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Neurological_disorder','Chronic neurological disorder'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Non-Falciparum_malaria','Non-Falciparum malaria'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Non-invasive_ventilation','Non-invasive ventilation'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/NSAID','Non-steroidal anti-inflammatory (NSAID)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/NSAID_medication',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/NSAID_pre_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Number_question','Number question'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/O2_flow','O2 flow'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/o2_flow_list','O2 flow'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/oral_orgastric_fluids','Oral/orogastric fluids'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_comorbidity','Other co-morbidities'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_complication','Other complication'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/other_corona_virus','Other corona virus'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_respiratory_pathogen','Other respiratory pathogen'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_signs','Other signs or symptoms'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_signs_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_signs_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Outcome','Outcome'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/outcome_date','Outcome date'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/outcome_list','Outcome list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/outcome_question','Outcome'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/over_15_L_per_min','>15 L/min'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_interface','Oxygen interface'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/oxygen_interface_list','Interface'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation','Oxygen saturation'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation_expl',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation_expl_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation_expl_vital',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/oxygen_saturation_list','Outcome saturation list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation_vital',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_therapy','Oxygen therapy'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/PaCO2_value','PaCO2 value'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Pancreatitis','Pancreatitis'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/PaO2_value','PaO2 value'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/pathogen_testing','Diagnostic/pathogen testing'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/PEEP_value','PEEP value'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Piped','Piped'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Plateau_pressure_value','Plateau pressure value'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Platelets','Question about Platelets measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Pneumonia','Pneumonia'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/pnnotdone_list','pnnotdone_list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/PNNot_done_Question','PNNot_done_Question'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Potassium','Question about Potassium measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/pre-admission','Pre-admission & chronic medication'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Pregnant','Pregnant'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Procalcitonin','Question about Procalcitonin measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Prone_position','Prone position'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/PT','Question about PT measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Pulmonary_disease','Chronic pulmonary disease'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Respiratory_rate','Respiratory rate'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Respiratory_rate_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Respiratory_rate_vital',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Rhinorrhoea','Runny nose (rhinorrhoea)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Ribavirin','Ribavirin'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/room_air','Room air'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/RRT_or_dialysis','Renal replacement therapy (RRT) or dialysis'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Seizures','Seizures'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Seizures_complications',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Seizures_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Seizures_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/self_care_list','self_care_list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Severe_dehydration','Severe dehydration'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Severe_dehydration_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Severe_dehydration_vital',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Sex','Sex at Birth'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/sex_list','sex at birth list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Shock','Shock'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Shortnesss_of_breath','Shortness of breath'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Shortnesss_of_breath_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Shortnesss_of_breath_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/signs_and_symptoms','Signs and symptoms on admission'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Site_name','Site name'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Skin_rash','Skin rash'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Skin_ulcers','Skin ulcers'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Smoking','Current smoking'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Sodium','Question about Sodium measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Sore_throat','Sore throat'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Sore_throat_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Sore_throat_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Source_of_oxygen','Source of oxygen'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/source_of_oxygen_list','Source of oxygen'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Specific_response','specific response'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Supportive_care','Supportive care'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Symptom_onset','Symptom onset (date of first/earliest symptom)'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Systemic_anticoagulation','Systemic anticoagulation'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Temperature','Temperature'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Temperature_admission',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Temperature_vital',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Text_Question','Text_Question'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Total_bilirubin','Question about Total bilirubin measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Transfered','Transfer to other facility'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Troponin','Question about Troponin measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Tuberculosis','Tuberculosis'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Urea_(BUN)','Question about Urea (BUN) measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Ventilation_question','Ventilation question'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Viral_haemorrhagic_fever','Viral haemorrhagic fever'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Vital_signs','Date of onset and admission vital signs'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Vomiting','Vomiting/Nausea'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Vomiting_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Vomiting_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/WBC_count','Question about WBC count measurement'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Weight','Weight'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Wheezing','Wheezing'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_antifungal_agent','Which antifungal agent'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_antimalarial_agent','Which antimalarial agent'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_antiviral','Which antiviral'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_complication','Which complication'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_coronavirus','Which coronavirus'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_corticosteroid_route','Which corticosteroid route'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_experimental_agent','Which experimental agent'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_NSAID','Which NSAID'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_other_antiviral','Which other antiviral'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_other_pathogen','Which other pathogen'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_respiratory_pathogen','Which respiratory pathogen'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_sign_or_symptom','Which sign or symptom'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_sign_or_symptom_daily',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_sign_or_symptom_signs',''),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_virus','Which virus'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/who-covid-19-rapid-crf','WHO-COVID-19-Rapid-CRF'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Yes-not_on_ART','Yes-not on ART'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Yes-on_ART','Yes-on ART'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ynun_list','ynun_list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/YNUN_Question','YNUN_Question'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ynu_list','ynu_list'),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/YNU_Question','YNU_Question'),(1,'http://sweet.jpl.nasa.gov/2.3/humanJurisdiction.owl#Country','Country');
/*!40000 ALTER TABLE `tb_ontologyterms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_participant`
--

DROP TABLE IF EXISTS `tb_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_participant` (
  `participantID` int(10) NOT NULL,
  `medicalRecord` varchar(500) DEFAULT NULL COMMENT '(pt-br) prontuário do paciente. \r\n(en) patient medical record.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='(pt-br) Tabela para registros de pacientes.\r\n(en) Table for patient records.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_participant`
--

LOCK TABLES `tb_participant` WRITE;
/*!40000 ALTER TABLE `tb_participant` DISABLE KEYS */;
INSERT into tb_participant
VALUES(20201, '20201101'), (20202, '20201102'), (20203, '20201103'), (20204, '20201104'),
(20205, '20201105'), (20206, '20201106'), (20207, '20201107'), (20208, '20201108'),
(20209, '20201109'), (202010, '20201110');
/*!40000 ALTER TABLE `tb_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_permission`
--

DROP TABLE IF EXISTS `tb_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_permission` (
  `permissionID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`permissionID`),
  UNIQUE KEY `permissionID` (`permissionID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permission`
--

LOCK TABLES `tb_permission` WRITE;
/*!40000 ALTER TABLE `tb_permission` DISABLE KEYS */;
INSERT INTO `tb_permission` VALUES (1,'Insert'),(2,'Update'),(3,'Delete'),(4,'ALL');
/*!40000 ALTER TABLE `tb_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_questiongroup`
--

DROP TABLE IF EXISTS `tb_questiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_questiongroup` (
  `questionGroupID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição.\r\n(en) description.',
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Relacionado ao Question Group da ontologia relaciona as diversas sessoes existentes nos formularios do CRF COVID-19';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_questiongroup`
--

LOCK TABLES `tb_questiongroup` WRITE;
/*!40000 ALTER TABLE `tb_questiongroup` DISABLE KEYS */;
INSERT INTO `tb_questiongroup` VALUES (1,'Clinical inclusion criteria',''),(2,'Co-morbidities','Existing conditions prior to admission.'),(3,'Complications',''),(4,'Daily clinical features',''),(5,'Date of onset and admission vital signs','first available data at presentation/admission'),(6,'Demographics',''),(7,'Diagnostic/pathogen testing',''),(8,'Laboratory results',''),(9,'Medication','Is the patient CURRENTLY receiving any of the following?'),(10,'Outcome',''),(11,'Pre-admission & chronic medication','Were any of the following taken within 14 days of admission?'),(12,'Signs and symptoms on admission',''),(13,'Supportive care','Is the patient CURRENTLY receiving any of the following?'),(14,'Vital signs','');
/*!40000 ALTER TABLE `tb_questiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_questiongroupform`
--

DROP TABLE IF EXISTS `tb_questiongroupform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_questiongroupform` (
  `crfFormsID` int(10) NOT NULL,
  `questionID` int(10) NOT NULL,
  `questionOrder` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_questiongroupform`
--

LOCK TABLES `tb_questiongroupform` WRITE;
/*!40000 ALTER TABLE `tb_questiongroupform` DISABLE KEYS */;
INSERT INTO `tb_questiongroupform` VALUES (1,29,10629),(1,33,10710),(1,34,10711),(1,35,10703),(1,36,10706),(1,37,10713),(1,38,10627),(1,39,10802),(1,40,10310),(1,47,10102),(1,48,10105),(1,49,10101),(1,50,10404),(1,51,10412),(1,52,10401),(1,53,10405),(1,54,10406),(1,55,10407),(1,56,10403),(1,57,10410),(1,58,10409),(1,59,10408),(1,60,10402),(1,61,10413),(1,62,10414),(1,63,10104),(1,64,10103),(1,65,10411),(1,82,10707),(1,87,10708),(1,89,10803),(1,90,10805),(1,91,10628),(1,92,10804),(1,93,10302),(1,94,10316),(1,95,10314),(1,96,10315),(1,97,10301),(1,98,10317),(1,100,10712),(1,101,10704),(1,103,10714),(1,104,10705),(1,107,10202),(1,108,10205),(1,109,10206),(1,110,10207),(1,111,10201),(1,113,10208),(1,114,10908),(1,115,10905),(1,116,10910),(1,117,10709),(1,118,10921),(1,119,10702),(1,120,10701),(1,127,10619),(1,128,10604),(1,129,10611),(1,130,10616),(1,132,10601),(1,133,10626),(1,134,10610),(1,135,10615),(1,136,10625),(1,137,10606),(1,138,10623),(1,139,10624),(1,140,10607),(1,141,10311),(1,143,10630),(1,144,10204),(1,145,10919),(1,146,10913),(1,147,10917),(1,148,10922),(1,149,10815),(1,150,10801),(1,151,10814),(1,152,10808),(1,153,10806),(1,154,10807),(1,155,10816),(1,156,10923),(1,157,10903),(1,158,10901),(1,159,10924),(1,160,10907),(1,161,10912),(1,162,10918),(1,163,10904),(1,164,10915),(1,165,10916),(1,166,10003),(1,167,10004),(1,169,10906),(1,170,10914),(1,171,10909),(1,172,10920),(1,174,10911),(1,189,10308),(1,190,10312),(1,191,10304),(1,192,10307),(1,193,10313),(1,194,10305),(1,195,10306),(1,196,10309),(1,198,10303),(1,199,10715),(1,200,10716),(1,201,10717),(1,202,10501),(1,203,10502),(1,204,10503),(1,205,10614),(1,206,10620),(1,207,10617),(1,208,10621),(1,209,10609),(1,210,10602),(1,211,10618),(1,212,10203),(1,213,10622),(1,214,10608),(1,215,10605),(1,225,10603),(1,226,10902),(1,227,10415),(1,241,10718),(1,242,10002),(1,245,10810),(1,246,10813),(1,247,10812),(1,248,10811),(1,249,10809),(1,252,10613),(1,253,10612),(1,254,10504),(1,255,10505),(2,28,20214),(2,33,20410),(2,34,20411),(2,35,20403),(2,36,20406),(2,37,20413),(2,39,20504),(2,41,20109),(2,82,20407),(2,83,20208),(2,87,20408),(2,89,20505),(2,90,20507),(2,92,20506),(2,100,20412),(2,101,20404),(2,103,20414),(2,104,20405),(2,112,20110),(2,114,20308),(2,115,20305),(2,116,20310),(2,117,20409),(2,118,20321),(2,119,20402),(2,120,20401),(2,142,20215),(2,145,20319),(2,146,20313),(2,147,20317),(2,148,20322),(2,149,20516),(2,150,20501),(2,151,20517),(2,152,20510),(2,153,20508),(2,154,20509),(2,155,20518),(2,156,20323),(2,157,20303),(2,158,20301),(2,159,20324),(2,160,20307),(2,161,20312),(2,162,20318),(2,163,20304),(2,164,20315),(2,165,20316),(2,168,20002),(2,169,20306),(2,170,20314),(2,171,20309),(2,172,20320),(2,174,20311),(2,177,20204),(2,178,20209),(2,182,20210),(2,183,20201),(2,184,20203),(2,185,20205),(2,186,20211),(2,187,20213),(2,188,20212),(2,197,20202),(2,199,20415),(2,200,20416),(2,201,20417),(2,216,20111),(2,217,20101),(2,218,20107),(2,219,20105),(2,220,20106),(2,221,20102),(2,222,20104),(2,223,20108),(2,224,20103),(2,226,20302),(2,228,20502),(2,229,20503),(2,241,20418),(2,245,20512),(2,246,20515),(2,247,20514),(2,248,20513),(2,249,20511),(2,250,20206),(2,251,20207),(3,30,30218),(3,31,30101),(3,32,30103),(3,33,30311),(3,34,30313),(3,35,30303),(3,36,30308),(3,37,30315),(3,39,30404),(3,42,30109),(3,43,30111),(3,44,30106),(3,45,30107),(3,46,30104),(3,66,30214),(3,67,30209),(3,68,30204),(3,69,30210),(3,70,30211),(3,71,30208),(3,72,30206),(3,73,30205),(3,74,30217),(3,75,30212),(3,76,30216),(3,77,30203),(3,78,30213),(3,79,30215),(3,80,30207),(3,81,30201),(3,82,30309),(3,84,30114),(3,85,30116),(3,86,30102),(3,87,30310),(3,88,30115),(3,89,30406),(3,90,30408),(3,92,30407),(3,99,30312),(3,100,30314),(3,101,30304),(3,102,30219),(3,103,30316),(3,104,30305),(3,105,30113),(3,106,30108),(3,117,30306),(3,119,30302),(3,120,30301),(3,121,30105),(3,122,30503),(3,123,30501),(3,124,30502),(3,125,30110),(3,126,30112),(3,149,30413),(3,150,30401),(3,151,30418),(3,152,30411),(3,153,30409),(3,154,30415),(3,155,30417),(3,176,30202),(3,180,30318),(3,199,30317),(3,228,30403),(3,232,30307),(3,233,30402),(3,234,30405),(3,235,30410),(3,236,30412),(3,237,30414),(3,238,30416),(3,240,30419);
/*!40000 ALTER TABLE `tb_questiongroupform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_questiongroupformrecord`
--

DROP TABLE IF EXISTS `tb_questiongroupformrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_questiongroupformrecord` (
  `questionGroupFormRecordID` int(10) NOT NULL,
  `formRecordID` int(10) NOT NULL,
  `crfFormsID` int(10) NOT NULL,
  `questionID` int(10) NOT NULL,
  `listOfValuesID` int(10) DEFAULT NULL,
  `answer` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='(pt-br) Tabela para registro da resposta associada a uma questão de um agrupamento de um formulário referente a um questionario de avaliação.\r\n(en) Form record table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_questiongroupformrecord`
--

LOCK TABLES `tb_questiongroupformrecord` WRITE;
/*!40000 ALTER TABLE `tb_questiongroupformrecord` DISABLE KEYS */;

INSERT INTO `tb_questiongroupformrecord` VALUES
(1, 82, 1, 107, NULL, '18/11/1936'),
(2, 82, 1, 111, 284, NULL),
(3, 82, 1, 144, NULL, '83'),
(4, 82, 1, 166, 45, NULL),
(5, 82, 1, 167, NULL, '2020-04-30'),
(7, 83, 2, 35, 298, NULL),
(8, 83, 2, 101, 306, NULL),
(9, 83, 2, 101, 305, NULL),
(10, 83, 2, 150, 300, NULL),
(11, 83, 2, 168, NULL, '2020-04-30'),
(12, 84, 3, 35, 298, NULL),
(13, 84, 3, 101, 305, NULL),
(14, 84, 3, 101, 306, NULL),
(15, 84, 3, 123, 276, NULL),
(16, 84, 3, 124, NULL, '2020-05-13'),
(17, 220, 1, 107, NULL, '30/10/1926'),
(18, 220, 1, 111, 284, NULL),
(19, 220, 1, 144, NULL, '93'),
(20, 220, 1, 166, 45, NULL),
(21, 220, 1, 167, NULL, '2020-03-06'),
(23, 221, 2, 35, 298, NULL),
(24, 221, 2, 101, 305, NULL),
(25, 221, 2, 150, 298, NULL),
(26, 221, 2, 168, NULL, '2020-03-06'),
(27, 221, 2, 228, NULL, '2020-03-06'),
(28, 222, 3, 35, 298, NULL),
(29, 222, 3, 101, 305, NULL),
(30, 222, 3, 123, 275, NULL),
(31, 222, 3, 124, NULL, '2020-06-13'),
(32, 145, 1, 107, NULL, '29/07/1961'),
(33, 145, 1, 111, 285, NULL),
(34, 145, 1, 144, NULL, '58'),
(35, 145, 1, 166, 45, NULL),
(36, 145, 1, 167, NULL, '2020-05-13'),
(38, 146, 2, 35, 298, NULL),
(39, 146, 2, 101, 305, NULL),
(40, 146, 2, 150, 300, NULL),
(41, 146, 2, 168, NULL, '2020-05-13'),
(42, 147, 3, 35, 298, NULL),
(43, 147, 3, 101, 305, NULL),
(44, 147, 3, 123, 276, NULL),
(45, 147, 3, 124, NULL, '2020-05-19'),
(46, 193, 1, 107, NULL, '22/05/1989'),
(47, 193, 1, 111, 284, NULL),
(48, 193, 1, 144, NULL, '31'),
(49, 193, 1, 166, 45, NULL),
(50, 193, 1, 167, NULL, '2020-05-22'),
(52, 194, 2, 35, 298, NULL),
(53, 194, 2, 101, 305, NULL),
(54, 194, 2, 150, 300, NULL),
(55, 194, 2, 168, NULL, '2020-05-22'),
(56, 195, 3, 35, 298, NULL),
(57, 195, 3, 101, 305, NULL),
(58, 195, 3, 123, 276, NULL),
(59, 195, 3, 124, NULL, '2020-05-23'),
(60, 148, 1, 107, NULL, '26/04/1980'),
(61, 148, 1, 111, 285, NULL),
(62, 148, 1, 144, NULL, '40'),
(63, 148, 1, 166, 45, NULL),
(64, 148, 1, 167, NULL, '2020-05-13'),
(66, 149, 2, 35, 298, NULL),
(67, 149, 2, 101, 305, NULL),
(68, 149, 2, 101, 306, NULL),
(69, 149, 2, 150, 300, NULL),
(70, 149, 2, 168, NULL, '2020-05-13'),
(71, 150, 3, 35, 298, NULL),
(72, 150, 3, 101, 305, NULL),
(73, 150, 3, 101, 306, NULL),
(74, 150, 3, 123, 276, NULL),
(75, 150, 3, 124, NULL, '2020-05-14'),
(76, 10, 1, 107, NULL, '18/01/1955'),
(77, 10, 1, 111, 285, NULL),
(78, 10, 1, 144, NULL, '65'),
(79, 10, 1, 166, 45, NULL),
(80, 10, 1, 167, NULL, '2020-04-13'),
(82, 11, 2, 35, 298, NULL),
(83, 11, 2, 101, 306, NULL),
(84, 11, 2, 101, 305, NULL),
(85, 11, 2, 150, 298, NULL),
(86, 11, 2, 168, NULL, '2020-04-13'),
(87, 11, 2, 228, NULL, '2020-04-13'),
(88, 12, 3, 35, 298, NULL),
(89, 12, 3, 101, 305, NULL),
(90, 12, 3, 101, 306, NULL),
(91, 12, 3, 123, 275, NULL),
(92, 12, 3, 124, NULL, '2020-05-13'),
(93, 64, 1, 107, NULL, '24/01/1975'),
(94, 64, 1, 111, 284, NULL),
(95, 64, 1, 144, NULL, '45'),
(96, 64, 1, 166, 45, NULL),
(97, 64, 1, 167, NULL, '2020-04-26'),
(99, 65, 2, 35, 298, NULL),
(100, 65, 2, 101, 305, NULL),
(101, 65, 2, 101, 306, NULL),
(102, 65, 2, 150, 300, NULL),
(103, 65, 2, 168, NULL, '2020-04-26'),
(104, 66, 3, 35, 298, NULL),
(105, 66, 3, 101, 306, NULL),
(106, 66, 3, 101, 305, NULL),
(107, 66, 3, 123, 276, NULL),
(108, 66, 3, 124, NULL, '2020-04-29'),
(109, 55, 1, 107, NULL, '23/02/1949'),
(110, 55, 1, 111, 285, NULL),
(111, 55, 1, 144, NULL, '71'),
(112, 55, 1, 166, 45, NULL),
(113, 55, 1, 167, NULL, '2020-04-24'),
(115, 56, 2, 35, 298, NULL),
(116, 56, 2, 101, 305, NULL),
(117, 56, 2, 101, 306, NULL),
(118, 56, 2, 150, 300, NULL),
(119, 56, 2, 168, NULL, '2020-04-24'),
(120, 57, 3, 35, 298, NULL),
(121, 57, 3, 101, 305, NULL),
(122, 57, 3, 101, 306, NULL),
(123, 57, 3, 123, 276, NULL),
(124, 57, 3, 124, NULL, '2020-05-12'),
(125, 97, 1, 107, NULL, '03/01/1964'),
(126, 97, 1, 111, 285, NULL),
(127, 97, 1, 144, NULL, '56'),
(128, 97, 1, 166, 45, NULL),
(129, 97, 1, 167, NULL, '2020-04-05'),
(131, 98, 2, 35, 298, NULL),
(132, 98, 2, 101, 306, NULL),
(133, 98, 2, 101, 305, NULL),
(134, 98, 2, 150, 300, NULL),
(135, 98, 2, 168, NULL, '2020-04-05'),
(136, 99, 3, 35, 298, NULL),
(137, 99, 3, 101, 306, NULL),
(138, 99, 3, 101, 305, NULL),
(139, 99, 3, 123, 276, NULL),
(140, 99, 3, 124, NULL, '2020-05-07'),
(141, 94, 1, 107, NULL, '29/06/1974'),
(142, 94, 1, 111, 284, NULL),
(143, 94, 1, 144, NULL, '45'),
(144, 94, 1, 166, 45, NULL),
(145, 94, 1, 167, NULL, '2020-03-05'),
(147, 95, 2, 35, 298, NULL),
(148, 95, 2, 101, 305, NULL),
(149, 95, 2, 101, 306, NULL),
(150, 95, 2, 150, 300, NULL),
(151, 95, 2, 168, NULL, '2020-03-05'),
(152, 96, 3, 35, 298, NULL),
(153, 96, 3, 101, 305, NULL),
(154, 96, 3, 101, 306, NULL),
(155, 96, 3, 123, 276, NULL),
(156, 96, 3, 124, NULL, '2020-05-07'),
(157, 4, 1, 167, NULL, '2020-03-05'),
(158, 5, 2, 35, 298, NULL),
(159, 5, 2, 101, 305, NULL),
(160, 5, 2, 168, NULL, '2020-03-05'),
(161, 5, 2, 228, NULL, '2020-03-05'),
(162, 6, 3, 35, 298, NULL),
(163, 6, 3, 101, 305, NULL),
(164, 6, 3, 123, 275, NULL),
(165, 6, 3, 124, NULL, '2020-04-27'),
(166, 40, 1, 107, NULL, '25/05/1960'),
(167, 40, 1, 111, 285, NULL),
(168, 40, 1, 144, NULL, '60'),
(169, 40, 1, 166, 45, NULL),
(170, 40, 1, 167, NULL, '2020-04-22'),
(172, 41, 2, 35, 298, NULL),
(173, 41, 2, 101, 305, NULL),
(174, 41, 2, 101, 306, NULL),
(175, 41, 2, 150, 300, NULL),
(176, 41, 2, 168, NULL, '2020-04-22'),
(177, 42, 3, 35, 298, NULL),
(178, 42, 3, 101, 305, NULL),
(179, 42, 3, 101, 306, NULL),
(180, 42, 3, 123, 276, NULL),
(181, 42, 3, 124, NULL, '2020-02-05'),
(182, 202, 1, 107, NULL, '21/12/1951'),
(183, 202, 1, 111, 285, NULL),
(184, 202, 1, 144, NULL, '68'),
(185, 202, 1, 166, 45, NULL),
(186, 202, 1, 167, NULL, '2020-05-25'),
(188, 203, 2, 35, 298, NULL),
(189, 203, 2, 101, 305, NULL),
(190, 203, 2, 150, 300, NULL),
(191, 203, 2, 168, NULL, '2020-05-25'),
(192, 204, 3, 35, 298, NULL),
(193, 204, 3, 101, 305, NULL),
(194, 204, 3, 123, 276, NULL),
(195, 204, 3, 124, NULL, '2020-01-06'),
(196, 67, 1, 107, NULL, '30/08/1972'),
(197, 67, 1, 111, 284, NULL),
(198, 67, 1, 144, NULL, '47'),
(199, 67, 1, 166, 45, NULL),
(200, 67, 1, 167, NULL, '2020-04-27'),
(202, 68, 2, 35, 298, NULL),
(203, 68, 2, 101, 306, NULL),
(204, 68, 2, 101, 305, NULL),
(205, 68, 2, 150, 300, NULL),
(206, 68, 2, 168, NULL, '2020-04-27'),
(207, 69, 3, 35, 298, NULL),
(208, 69, 3, 101, 306, NULL),
(209, 69, 3, 101, 305, NULL),
(210, 69, 3, 123, 276, NULL),
(211, 69, 3, 124, NULL, '2020-05-06'),
(212, 103, 1, 107, NULL, '14/09/1959'),
(213, 103, 1, 111, 284, NULL),
(214, 103, 1, 144, NULL, '60'),
(215, 103, 1, 166, 45, NULL),
(216, 103, 1, 167, NULL, '2020-05-05'),
(218, 104, 2, 150, 300, NULL),
(219, 104, 2, 168, NULL, '2020-05-05'),
(220, 105, 3, 123, 276, NULL),
(221, 105, 3, 124, NULL, '2020-05-12'),
(222, 184, 1, 107, NULL, '10/11/1934'),
(223, 184, 1, 111, 285, NULL),
(224, 184, 1, 144, NULL, '85'),
(225, 184, 1, 166, 45, NULL),
(226, 184, 1, 167, NULL, '2020-05-21'),
(228, 185, 2, 150, 300, NULL),
(229, 185, 2, 168, NULL, '2020-05-21'),
(230, 186, 3, 123, 276, NULL),
(231, 186, 3, 124, NULL, '2020-06-13'),
(232, 25, 1, 107, NULL, '02/08/1974'),
(233, 25, 1, 111, 285, NULL),
(234, 25, 1, 144, NULL, '45'),
(235, 25, 1, 166, 45, NULL),
(236, 25, 1, 167, NULL, '2020-04-19'),
(238, 26, 2, 35, 298, NULL),
(239, 26, 2, 101, 306, NULL),
(240, 26, 2, 101, 305, NULL),
(241, 26, 2, 150, 300, NULL),
(242, 26, 2, 168, NULL, '2020-04-19'),
(243, 27, 3, 35, 298, NULL),
(244, 27, 3, 101, 305, NULL),
(245, 27, 3, 101, 306, NULL),
(246, 27, 3, 123, 276, NULL),
(247, 27, 3, 124, NULL, '2020-05-24'),
(248, 19, 1, 107, NULL, '18/01/1965'),
(249, 19, 1, 111, 285, NULL),
(250, 19, 1, 144, NULL, '55'),
(251, 19, 1, 166, 45, NULL),
(252, 19, 1, 167, NULL, '2020-04-15'),
(254, 20, 2, 35, 298, NULL),
(255, 20, 2, 101, 305, NULL),
(256, 20, 2, 101, 3, NULL),
(257, 20, 2, 101, 306, NULL),
(258, 20, 2, 150, 300, NULL),
(259, 20, 2, 168, NULL, '2020-04-15'),
(260, 21, 3, 35, 298, NULL),
(261, 21, 3, 101, 3, NULL),
(262, 21, 3, 101, 305, NULL),
(263, 21, 3, 101, 306, NULL),
(264, 21, 3, 123, 276, NULL),
(265, 21, 3, 124, NULL, '2020-04-20'),
(266, 196, 1, 107, NULL, '17/07/1962'),
(267, 196, 1, 111, 285, NULL),
(268, 196, 1, 144, NULL, '57'),
(269, 196, 1, 166, 45, NULL),
(270, 196, 1, 167, NULL, '2020-05-23'),
(272, 197, 2, 35, 298, NULL),
(273, 197, 2, 101, 305, NULL),
(274, 197, 2, 150, 300, NULL),
(275, 197, 2, 168, NULL, '2020-05-23'),
(276, 198, 3, 35, 298, NULL),
(277, 198, 3, 101, 305, NULL),
(278, 198, 3, 123, 276, NULL),
(279, 198, 3, 124, NULL, '2020-02-06'),
(280, 151, 1, 107, NULL, '25/12/1982'),
(281, 151, 1, 111, 284, NULL),
(282, 151, 1, 144, NULL, '37'),
(283, 151, 1, 166, 45, NULL),
(284, 151, 1, 167, NULL, '2020-05-14'),
(286, 152, 2, 35, 298, NULL),
(287, 152, 2, 101, 305, NULL),
(288, 152, 2, 150, 300, NULL),
(289, 152, 2, 168, NULL, '2020-05-14'),
(290, 153, 3, 35, 298, NULL),
(291, 153, 3, 101, 305, NULL),
(292, 153, 3, 123, 276, NULL),
(293, 153, 3, 124, NULL, '2020-05-16'),
(294, 214, 1, 107, NULL, '19/10/1961'),
(295, 214, 1, 111, 285, NULL),
(296, 214, 1, 144, NULL, '58'),
(297, 214, 1, 166, 45, NULL),
(298, 214, 1, 167, NULL, '2020-05-31'),
(300, 215, 2, 35, 298, NULL),
(301, 215, 2, 101, 305, NULL),
(302, 215, 2, 150, 300, NULL),
(303, 215, 2, 168, NULL, '2020-05-31'),
(304, 216, 3, 35, 298, NULL),
(305, 216, 3, 101, 305, NULL),
(306, 216, 3, 123, 276, NULL),
(307, 216, 3, 124, NULL, '2020-04-06'),
(308, 169, 1, 107, NULL, '18/06/1959'),
(309, 169, 1, 111, 285, NULL),
(310, 169, 1, 144, NULL, '61'),
(311, 169, 1, 166, 45, NULL),
(312, 169, 1, 167, NULL, '2020-05-18'),
(314, 170, 2, 35, 298, NULL),
(315, 170, 2, 101, 305, NULL),
(316, 170, 2, 150, 300, NULL),
(317, 170, 2, 168, NULL, '2020-05-18'),
(318, 171, 3, 35, 298, NULL),
(319, 171, 3, 101, 305, NULL),
(320, 171, 3, 123, 276, NULL),
(321, 171, 3, 124, NULL, '2020-05-26'),
(322, 118, 1, 107, NULL, '13/06/1936'),
(323, 118, 1, 111, 285, NULL),
(324, 118, 1, 144, NULL, '84'),
(325, 118, 1, 166, 45, NULL),
(326, 118, 1, 167, NULL, '2020-05-07'),
(328, 119, 2, 35, 298, NULL),
(329, 119, 2, 101, 306, NULL),
(330, 119, 2, 101, 305, NULL),
(331, 119, 2, 150, 300, NULL),
(332, 119, 2, 168, NULL, '2020-05-07'),
(333, 120, 3, 35, 298, NULL),
(334, 120, 3, 101, 305, NULL),
(335, 120, 3, 101, 306, NULL),
(336, 120, 3, 123, 276, NULL),
(337, 120, 3, 124, NULL, '2020-05-21'),
(338, 109, 1, 107, NULL, '10/08/1938'),
(339, 109, 1, 111, 284, NULL),
(340, 109, 1, 144, NULL, '81'),
(341, 109, 1, 166, 45, NULL),
(342, 109, 1, 167, NULL, '2020-05-06'),
(344, 110, 2, 35, 298, NULL),
(345, 110, 2, 101, 305, NULL),
(346, 110, 2, 101, 306, NULL),
(347, 110, 2, 150, 298, NULL),
(348, 110, 2, 168, NULL, '2020-05-06'),
(349, 110, 2, 228, NULL, '2020-05-06'),
(350, 111, 3, 35, 298, NULL),
(351, 111, 3, 101, 306, NULL),
(352, 111, 3, 101, 305, NULL),
(353, 111, 3, 123, 275, NULL),
(354, 111, 3, 124, NULL, '2020-05-13'),
(355, 142, 1, 107, NULL, '27/01/1957'),
(356, 142, 1, 111, 285, NULL),
(357, 142, 1, 144, NULL, '63'),
(358, 142, 1, 166, 45, NULL),
(359, 142, 1, 167, NULL, '2020-05-13'),
(361, 143, 2, 35, 298, NULL),
(362, 143, 2, 101, 305, NULL),
(363, 143, 2, 150, 300, NULL),
(364, 143, 2, 168, NULL, '2020-05-13'),
(365, 144, 3, 35, 298, NULL),
(366, 144, 3, 101, 305, NULL),
(367, 144, 3, 123, 276, NULL),
(368, 144, 3, 124, NULL, '2020-05-21'),
(369, 22, 1, 107, NULL, '21/12/1963'),
(370, 22, 1, 111, 285, NULL),
(371, 22, 1, 144, NULL, '56'),
(372, 22, 1, 166, 45, NULL),
(373, 22, 1, 167, NULL, '2020-04-17'),
(375, 23, 2, 35, 298, NULL),
(376, 23, 2, 101, 305, NULL),
(377, 23, 2, 101, 306, NULL),
(378, 23, 2, 150, 300, NULL),
(379, 23, 2, 168, NULL, '2020-04-17'),
(380, 24, 3, 35, 298, NULL),
(381, 24, 3, 101, 306, NULL),
(382, 24, 3, 101, 305, NULL),
(383, 24, 3, 123, 276, NULL),
(384, 24, 3, 124, NULL, '2020-04-29'),
(385, 217, 1, 107, NULL, '14/09/1938'),
(386, 217, 1, 111, 285, NULL),
(387, 217, 1, 144, NULL, '81'),
(388, 217, 1, 166, 45, NULL),
(389, 217, 1, 167, NULL, '2020-01-06'),
(391, 218, 2, 35, 298, NULL),
(392, 218, 2, 101, 305, NULL),
(393, 218, 2, 150, 300, NULL),
(394, 218, 2, 168, NULL, '2020-01-06'),
(395, 219, 3, 35, 298, NULL),
(396, 219, 3, 101, 305, NULL),
(397, 219, 3, 123, 276, NULL),
(398, 219, 3, 124, NULL, '2020-06-09'),
(399, 154, 1, 107, NULL, '13/01/1998'),
(400, 154, 1, 111, 285, NULL),
(401, 154, 1, 144, NULL, '22'),
(402, 154, 1, 166, 45, NULL),
(403, 154, 1, 167, NULL, '2020-05-14'),
(405, 155, 2, 35, 298, NULL),
(406, 155, 2, 101, 305, NULL),
(407, 155, 2, 150, 300, NULL),
(408, 155, 2, 168, NULL, '2020-05-14'),
(409, 156, 3, 35, 298, NULL),
(410, 156, 3, 101, 305, NULL),
(411, 156, 3, 123, 276, NULL),
(412, 156, 3, 124, NULL, '2020-05-22'),
(413, 1, 1, 167, NULL, '2020-01-24'),
(414, 2, 2, 35, 298, NULL),
(415, 2, 2, 101, 306, NULL),
(416, 2, 2, 168, NULL, '2020-01-24'),
(417, 3, 3, 35, 298, NULL),
(418, 3, 3, 101, 306, NULL),
(419, 3, 3, 123, 275, NULL),
(420, 3, 3, 124, NULL, '2020-05-12'),
(421, 112, 1, 107, NULL, '28/07/1994'),
(422, 112, 1, 111, 284, NULL),
(423, 112, 1, 144, NULL, '25'),
(424, 112, 1, 166, 45, NULL),
(425, 112, 1, 167, NULL, '2020-05-06'),
(427, 113, 2, 35, 298, NULL),
(428, 113, 2, 101, 305, NULL),
(429, 113, 2, 150, 300, NULL),
(430, 113, 2, 168, NULL, '2020-05-06'),
(431, 114, 3, 35, 298, NULL),
(432, 114, 3, 101, 305, NULL),
(433, 114, 3, 123, 276, NULL),
(434, 114, 3, 124, NULL, '2020-05-08'),
(435, 115, 1, 107, NULL, '16/09/1985'),
(436, 115, 1, 111, 285, NULL),
(437, 115, 1, 144, NULL, '34'),
(438, 115, 1, 166, 45, NULL),
(439, 115, 1, 167, NULL, '2020-05-07'),
(441, 116, 2, 35, 298, NULL),
(442, 116, 2, 101, 306, NULL),
(443, 116, 2, 150, 300, NULL),
(444, 116, 2, 168, NULL, '2020-05-07'),
(445, 117, 3, 35, 298, NULL),
(446, 117, 3, 101, 306, NULL),
(447, 117, 3, 123, 276, NULL),
(448, 117, 3, 124, NULL, '2020-05-11'),
(449, 79, 1, 107, NULL, '25/03/1952'),
(450, 79, 1, 111, 285, NULL),
(451, 79, 1, 144, NULL, '68'),
(452, 79, 1, 166, 45, NULL),
(453, 79, 1, 167, NULL, '2020-04-28'),
(455, 80, 2, 35, 298, NULL),
(456, 80, 2, 101, 306, NULL),
(457, 80, 2, 101, 305, NULL),
(458, 80, 2, 150, 300, NULL),
(459, 80, 2, 168, NULL, '2020-04-28'),
(460, 81, 3, 35, 298, NULL),
(461, 81, 3, 101, 306, NULL),
(462, 81, 3, 101, 305, NULL),
(463, 81, 3, 123, 276, NULL),
(464, 81, 3, 124, NULL, '2020-05-16'),
(465, 7, 1, 107, NULL, '18/11/1952'),
(466, 7, 1, 111, 284, NULL),
(467, 7, 1, 144, NULL, '67'),
(468, 7, 1, 166, 45, NULL),
(469, 7, 1, 167, NULL, '2020-04-10'),
(471, 8, 2, 35, 298, NULL),
(472, 8, 2, 101, 306, NULL),
(473, 8, 2, 101, 305, NULL),
(474, 8, 2, 150, 298, NULL),
(475, 8, 2, 168, NULL, '2020-04-10'),
(476, 8, 2, 228, NULL, '2020-04-10'),
(477, 9, 3, 35, 298, NULL),
(478, 9, 3, 101, 306, NULL),
(479, 9, 3, 101, 305, NULL),
(480, 9, 3, 123, 275, NULL),
(481, 9, 3, 124, NULL, '2020-05-07'),
(482, 223, 1, 107, NULL, '23/11/1989'),
(483, 223, 1, 111, 285, NULL),
(484, 223, 1, 144, NULL, '30'),
(485, 223, 1, 166, 45, NULL),
(486, 223, 1, 167, NULL, '2020-03-06'),
(488, 224, 2, 35, 298, NULL),
(489, 224, 2, 101, 305, NULL),
(490, 224, 2, 101, 3, NULL),
(491, 224, 2, 150, 298, NULL),
(492, 224, 2, 168, NULL, '2020-03-06'),
(493, 224, 2, 228, NULL, '2020-03-06'),
(494, 225, 3, 35, 298, NULL),
(495, 225, 3, 101, 3, NULL),
(496, 225, 3, 101, 305, NULL),
(497, 225, 3, 123, 275, NULL),
(498, 225, 3, 124, NULL, '2020-06-13'),
(499, 13, 1, 107, NULL, '18/11/1978'),
(500, 13, 1, 111, 285, NULL),
(501, 13, 1, 144, NULL, '41'),
(502, 13, 1, 166, 45, NULL),
(503, 13, 1, 167, NULL, '2020-04-14'),
(505, 14, 2, 35, 298, NULL),
(506, 14, 2, 101, 306, NULL),
(507, 14, 2, 101, 305, NULL),
(508, 14, 2, 150, 300, NULL),
(509, 14, 2, 168, NULL, '2020-04-14'),
(510, 15, 3, 35, 298, NULL),
(511, 15, 3, 101, 305, NULL),
(512, 15, 3, 101, 306, NULL),
(513, 15, 3, 123, 276, NULL),
(514, 15, 3, 124, NULL, '2020-04-20'),
(515, 16, 1, 107, NULL, '17/02/1976'),
(516, 16, 1, 111, 285, NULL),
(517, 16, 1, 144, NULL, '44'),
(518, 16, 1, 166, 45, NULL),
(519, 16, 1, 167, NULL, '2020-04-15'),
(521, 17, 2, 150, 300, NULL),
(522, 17, 2, 168, NULL, '2020-04-15'),
(523, 18, 3, 123, 276, NULL),
(524, 18, 3, 124, NULL, '2020-04-18'),
(525, 28, 1, 107, NULL, '14/02/1952'),
(526, 28, 1, 111, 285, NULL),
(527, 28, 1, 144, NULL, '68'),
(528, 28, 1, 166, 45, NULL),
(529, 28, 1, 167, NULL, '2020-04-19'),
(531, 29, 2, 150, 300, NULL),
(532, 29, 2, 168, NULL, '2020-04-19'),
(533, 30, 3, 123, 276, NULL),
(534, 30, 3, 124, NULL, '2020-04-20'),
(535, 31, 1, 107, NULL, '30/10/1944'),
(536, 31, 1, 111, 284, NULL),
(537, 31, 1, 144, NULL, '75'),
(538, 31, 1, 166, 45, NULL),
(539, 31, 1, 167, NULL, '2020-04-20'),
(541, 32, 2, 35, 298, NULL),
(542, 32, 2, 101, 306, NULL),
(543, 32, 2, 101, 305, NULL),
(544, 32, 2, 150, 298, NULL),
(545, 32, 2, 168, NULL, '2020-04-20'),
(546, 32, 2, 228, NULL, '2020-04-20'),
(547, 33, 3, 35, 298, NULL),
(548, 33, 3, 101, 305, NULL),
(549, 33, 3, 101, 306, NULL),
(550, 33, 3, 123, 275, NULL),
(551, 33, 3, 124, NULL, '2020-04-30'),
(552, 34, 1, 107, NULL, '04/07/1975'),
(553, 34, 1, 111, 284, NULL),
(554, 34, 1, 144, NULL, '44'),
(555, 34, 1, 166, 45, NULL),
(556, 34, 1, 167, NULL, '2020-04-20'),
(558, 35, 2, 35, 298, NULL),
(559, 35, 2, 101, 305, NULL),
(560, 35, 2, 101, 306, NULL),
(561, 35, 2, 150, 300, NULL),
(562, 35, 2, 168, NULL, '2020-04-20'),
(563, 36, 3, 35, 298, NULL),
(564, 36, 3, 101, 306, NULL),
(565, 36, 3, 101, 305, NULL),
(566, 36, 3, 123, 276, NULL),
(567, 36, 3, 124, NULL, '2020-04-28'),
(568, 37, 1, 107, NULL, '09/12/1947'),
(569, 37, 1, 111, 284, NULL),
(570, 37, 1, 144, NULL, '72'),
(571, 37, 1, 166, 45, NULL),
(572, 37, 1, 167, NULL, '2020-04-21'),
(574, 38, 2, 35, 298, NULL),
(575, 38, 2, 101, 305, NULL),
(576, 38, 2, 101, 306, NULL),
(577, 38, 2, 150, 298, NULL),
(578, 38, 2, 168, NULL, '2020-04-21'),
(579, 38, 2, 228, NULL, '2020-04-21'),
(580, 39, 3, 35, 298, NULL),
(581, 39, 3, 101, 305, NULL),
(582, 39, 3, 101, 306, NULL),
(583, 39, 3, 123, 275, NULL),
(584, 39, 3, 124, NULL, '2020-05-08'),
(585, 43, 1, 107, NULL, '28/08/1936'),
(586, 43, 1, 111, 285, NULL),
(587, 43, 1, 144, NULL, '83'),
(588, 43, 1, 166, 45, NULL),
(589, 43, 1, 167, NULL, '2020-04-22'),
(591, 44, 2, 35, 298, NULL),
(592, 44, 2, 101, 306, NULL),
(593, 44, 2, 150, 300, NULL),
(594, 44, 2, 168, NULL, '2020-04-22'),
(595, 45, 3, 35, 298, NULL),
(596, 45, 3, 101, 306, NULL),
(597, 45, 3, 123, 276, NULL),
(598, 45, 3, 124, NULL, '2020-04-28'),
(599, 46, 1, 107, NULL, '03/09/1973'),
(600, 46, 1, 111, 284, NULL),
(601, 46, 1, 144, NULL, '46'),
(602, 46, 1, 166, 45, NULL),
(603, 46, 1, 167, NULL, '2020-04-23'),
(605, 47, 2, 35, 298, NULL),
(606, 47, 2, 101, 306, NULL),
(607, 47, 2, 101, 305, NULL),
(608, 47, 2, 150, 300, NULL),
(609, 47, 2, 168, NULL, '2020-04-23'),
(610, 48, 3, 35, 298, NULL),
(611, 48, 3, 101, 306, NULL),
(612, 48, 3, 101, 305, NULL),
(613, 48, 3, 123, 276, NULL),
(614, 48, 3, 124, NULL, '2020-04-27'),
(615, 49, 1, 107, NULL, '03/01/1973'),
(616, 49, 1, 111, 285, NULL),
(617, 49, 1, 144, NULL, '47'),
(618, 49, 1, 166, 45, NULL),
(619, 49, 1, 167, NULL, '2020-04-23'),
(621, 50, 2, 35, 298, NULL),
(622, 50, 2, 101, 306, NULL),
(623, 50, 2, 150, 300, NULL),
(624, 50, 2, 168, NULL, '2020-04-23'),
(625, 51, 3, 35, 298, NULL),
(626, 51, 3, 101, 306, NULL),
(627, 51, 3, 123, 276, NULL),
(628, 51, 3, 124, NULL, '2020-04-27'),
(629, 52, 1, 107, NULL, '27/01/1974'),
(630, 52, 1, 111, 285, NULL),
(631, 52, 1, 144, NULL, '46'),
(632, 52, 1, 166, 45, NULL),
(633, 52, 1, 167, NULL, '2020-04-23'),
(635, 53, 2, 35, 298, NULL),
(636, 53, 2, 101, 305, NULL),
(637, 53, 2, 101, 306, NULL),
(638, 53, 2, 150, 300, NULL),
(639, 53, 2, 168, NULL, '2020-04-23'),
(640, 54, 3, 35, 298, NULL),
(641, 54, 3, 101, 305, NULL),
(642, 54, 3, 101, 306, NULL),
(643, 54, 3, 123, 276, NULL),
(644, 54, 3, 124, NULL, '2020-05-08'),
(645, 58, 1, 107, NULL, '01/04/1964'),
(646, 58, 1, 111, 285, NULL),
(647, 58, 1, 144, NULL, '56'),
(648, 58, 1, 166, 45, NULL),
(649, 58, 1, 167, NULL, '2020-04-24'),
(651, 59, 2, 35, 298, NULL),
(652, 59, 2, 101, 305, NULL),
(653, 59, 2, 101, 306, NULL),
(654, 59, 2, 150, 300, NULL),
(655, 59, 2, 168, NULL, '2020-04-24'),
(656, 60, 3, 35, 298, NULL),
(657, 60, 3, 101, 305, NULL),
(658, 60, 3, 101, 306, NULL),
(659, 60, 3, 123, 276, NULL),
(660, 60, 3, 124, NULL, '2020-05-05'),
(661, 61, 1, 107, NULL, '05/06/1984'),
(662, 61, 1, 111, 284, NULL),
(663, 61, 1, 144, NULL, '36'),
(664, 61, 1, 166, 45, NULL),
(665, 61, 1, 167, NULL, '2020-04-26'),
(667, 62, 2, 35, 298, NULL),
(668, 62, 2, 101, 305, NULL),
(669, 62, 2, 150, 300, NULL),
(670, 62, 2, 168, NULL, '2020-04-26'),
(671, 63, 3, 35, 298, NULL),
(672, 63, 3, 101, 305, NULL),
(673, 63, 3, 123, 276, NULL),
(674, 63, 3, 124, NULL, '2020-01-05'),
(675, 70, 1, 107, NULL, '08/02/1979'),
(676, 70, 1, 111, 285, NULL),
(677, 70, 1, 144, NULL, '41'),
(678, 70, 1, 166, 45, NULL),
(679, 70, 1, 167, NULL, '2020-04-27'),
(681, 71, 2, 35, 298, NULL),
(682, 71, 2, 101, 306, NULL),
(683, 71, 2, 101, 305, NULL),
(684, 71, 2, 150, 300, NULL),
(685, 71, 2, 168, NULL, '2020-04-27'),
(686, 72, 3, 35, 298, NULL),
(687, 72, 3, 101, 305, NULL),
(688, 72, 3, 101, 306, NULL),
(689, 72, 3, 123, 276, NULL),
(690, 72, 3, 124, NULL, '2020-05-10'),
(691, 73, 1, 107, NULL, '03/03/1988'),
(692, 73, 1, 111, 285, NULL),
(693, 73, 1, 144, NULL, '32'),
(694, 73, 1, 166, 45, NULL),
(695, 73, 1, 167, NULL, '2020-04-28'),
(697, 74, 2, 35, 298, NULL),
(698, 74, 2, 101, 305, NULL),
(699, 74, 2, 101, 306, NULL),
(700, 74, 2, 150, 300, NULL),
(701, 74, 2, 168, NULL, '2020-04-28'),
(702, 75, 3, 35, 298, NULL),
(703, 75, 3, 101, 305, NULL),
(704, 75, 3, 101, 306, NULL),
(705, 75, 3, 123, 276, NULL),
(706, 75, 3, 124, NULL, '2020-03-05'),
(707, 76, 1, 107, NULL, '22/04/1960'),
(708, 76, 1, 111, 285, NULL),
(709, 76, 1, 144, NULL, '60'),
(710, 76, 1, 166, 45, NULL),
(711, 76, 1, 167, NULL, '2020-04-28'),
(713, 77, 2, 35, 298, NULL),
(714, 77, 2, 101, 306, NULL),
(715, 77, 2, 101, 305, NULL),
(716, 77, 2, 150, 298, NULL),
(717, 77, 2, 168, NULL, '2020-04-28'),
(718, 77, 2, 228, NULL, '2020-04-28'),
(719, 78, 3, 35, 298, NULL),
(720, 78, 3, 101, 305, NULL),
(721, 78, 3, 101, 306, NULL),
(722, 78, 3, 123, 275, NULL),
(723, 78, 3, 124, NULL, '2020-05-20'),
(724, 85, 1, 107, NULL, '10/12/1955'),
(725, 85, 1, 111, 285, NULL),
(726, 85, 1, 144, NULL, '64'),
(727, 85, 1, 166, 45, NULL),
(728, 85, 1, 167, NULL, '2020-01-05'),
(730, 86, 2, 35, 298, NULL),
(731, 86, 2, 101, 306, NULL),
(732, 86, 2, 150, 298, NULL),
(733, 86, 2, 168, NULL, '2020-01-05'),
(734, 86, 2, 228, NULL, '2020-01-05'),
(735, 87, 3, 35, 298, NULL),
(736, 87, 3, 101, 306, NULL),
(737, 87, 3, 123, 275, NULL),
(738, 87, 3, 124, NULL, '2020-03-05'),
(739, 88, 1, 107, NULL, '04/07/1951'),
(740, 88, 1, 111, 285, NULL),
(741, 88, 1, 144, NULL, '68'),
(742, 88, 1, 166, 45, NULL),
(743, 88, 1, 167, NULL, '2020-02-05'),
(745, 89, 2, 35, 298, NULL),
(746, 89, 2, 101, 306, NULL),
(747, 89, 2, 101, 305, NULL),
(748, 89, 2, 150, 298, NULL),
(749, 89, 2, 168, NULL, '2020-02-05'),
(750, 89, 2, 228, NULL, '2020-02-05'),
(751, 90, 3, 35, 298, NULL),
(752, 90, 3, 101, 306, NULL),
(753, 90, 3, 101, 305, NULL),
(754, 90, 3, 123, 275, NULL),
(755, 90, 3, 124, NULL, '2020-05-11'),
(756, 91, 1, 107, NULL, '12/09/1985'),
(757, 91, 1, 111, 285, NULL),
(758, 91, 1, 144, NULL, '34'),
(759, 91, 1, 166, 45, NULL),
(760, 91, 1, 167, NULL, '2020-02-05'),
(762, 92, 2, 35, 298, NULL),
(763, 92, 2, 101, 306, NULL),
(764, 92, 2, 150, 300, NULL),
(765, 92, 2, 168, NULL, '2020-02-05'),
(766, 93, 3, 35, 298, NULL),
(767, 93, 3, 101, 306, NULL),
(768, 93, 3, 123, 276, NULL),
(769, 93, 3, 124, NULL, '2020-04-05'),
(770, 100, 1, 107, NULL, '21/11/1961'),
(771, 100, 1, 111, 284, NULL),
(772, 100, 1, 144, NULL, '58'),
(773, 100, 1, 166, 45, NULL),
(774, 100, 1, 167, NULL, '2020-05-05'),
(776, 101, 2, 35, 298, NULL),
(777, 101, 2, 101, 306, NULL),
(778, 101, 2, 101, 305, NULL),
(779, 101, 2, 150, 298, NULL),
(780, 101, 2, 168, NULL, '2020-05-05'),
(781, 101, 2, 228, NULL, '2020-05-05'),
(782, 102, 3, 35, 298, NULL),
(783, 102, 3, 101, 306, NULL),
(784, 102, 3, 101, 305, NULL),
(785, 102, 3, 123, 275, NULL),
(786, 102, 3, 124, NULL, '2020-05-20'),
(787, 106, 1, 107, NULL, '18/09/1971'),
(788, 106, 1, 111, 284, NULL),
(789, 106, 1, 144, NULL, '48'),
(790, 106, 1, 166, 45, NULL),
(791, 106, 1, 167, NULL, '2020-05-06'),
(793, 107, 2, 150, 300, NULL),
(794, 107, 2, 168, NULL, '2020-05-06'),
(795, 108, 3, 123, 276, NULL),
(796, 108, 3, 124, NULL, '2020-05-12'),
(797, 124, 1, 107, NULL, '19/09/1995'),
(798, 124, 1, 111, 284, NULL),
(799, 124, 1, 144, NULL, '24'),
(800, 124, 1, 166, 45, NULL),
(801, 124, 1, 167, NULL, '2020-05-08'),
(803, 125, 2, 35, 298, NULL),
(804, 125, 2, 101, 305, NULL),
(805, 125, 2, 150, 300, NULL),
(806, 125, 2, 168, NULL, '2020-05-08'),
(807, 126, 3, 35, 298, NULL),
(808, 126, 3, 101, 305, NULL),
(809, 126, 3, 123, 276, NULL),
(810, 126, 3, 124, NULL, '2020-05-13'),
(811, 121, 1, 107, NULL, '14/09/1943'),
(812, 121, 1, 111, 285, NULL),
(813, 121, 1, 144, NULL, '76'),
(814, 121, 1, 166, 45, NULL),
(815, 121, 1, 167, NULL, '2020-05-08'),
(817, 122, 2, 35, 298, NULL),
(818, 122, 2, 101, 305, NULL),
(819, 122, 2, 150, 300, NULL),
(820, 122, 2, 168, NULL, '2020-05-08'),
(821, 123, 3, 35, 298, NULL),
(822, 123, 3, 101, 305, NULL),
(823, 123, 3, 123, 275, NULL),
(824, 123, 3, 124, NULL, '2020-05-17'),
(825, 127, 1, 107, NULL, '05/07/1974'),
(826, 127, 1, 111, 285, NULL),
(827, 127, 1, 144, NULL, '45'),
(828, 127, 1, 166, 45, NULL),
(829, 127, 1, 167, NULL, '2020-05-11'),
(831, 128, 2, 35, 298, NULL),
(832, 128, 2, 101, 305, NULL),
(833, 128, 2, 101, 306, NULL),
(834, 128, 2, 150, 300, NULL),
(835, 128, 2, 168, NULL, '2020-05-11'),
(836, 129, 3, 35, 298, NULL),
(837, 129, 3, 101, 306, NULL),
(838, 129, 3, 101, 305, NULL),
(839, 129, 3, 123, 276, NULL),
(840, 129, 3, 124, NULL, '2020-05-19'),
(841, 130, 1, 107, NULL, '10/02/1972'),
(842, 130, 1, 111, 284, NULL),
(843, 130, 1, 144, NULL, '48'),
(844, 130, 1, 166, 45, NULL),
(845, 130, 1, 167, NULL, '2020-05-12'),
(847, 131, 2, 35, 298, NULL),
(848, 131, 2, 101, 305, NULL),
(849, 131, 2, 150, 300, NULL),
(850, 131, 2, 168, NULL, '2020-05-12'),
(851, 132, 3, 35, 298, NULL),
(852, 132, 3, 101, 305, NULL),
(853, 132, 3, 123, 276, NULL),
(854, 132, 3, 124, NULL, '2020-05-19'),
(855, 133, 1, 107, NULL, '30/09/1966'),
(856, 133, 1, 111, 285, NULL),
(857, 133, 1, 144, NULL, '53'),
(858, 133, 1, 166, 45, NULL),
(859, 133, 1, 167, NULL, '2020-05-12'),
(861, 134, 2, 35, 298, NULL),
(862, 134, 2, 101, 305, NULL),
(863, 134, 2, 150, 298, NULL),
(864, 134, 2, 168, NULL, '2020-05-12'),
(865, 134, 2, 228, NULL, '2020-05-12'),
(866, 135, 3, 35, 298, NULL),
(867, 135, 3, 101, 305, NULL),
(868, 135, 3, 123, 275, NULL),
(869, 135, 3, 124, NULL, '2020-05-13'),
(870, 136, 1, 107, NULL, '21/08/1951'),
(871, 136, 1, 111, 284, NULL),
(872, 136, 1, 144, NULL, '68'),
(873, 136, 1, 166, 45, NULL),
(874, 136, 1, 167, NULL, '2020-05-12'),
(876, 137, 2, 35, 298, NULL),
(877, 137, 2, 101, 305, NULL),
(878, 137, 2, 150, 298, NULL),
(879, 137, 2, 168, NULL, '2020-05-12'),
(880, 137, 2, 228, NULL, '2020-05-12'),
(881, 138, 3, 35, 298, NULL),
(882, 138, 3, 101, 305, NULL),
(883, 138, 3, 123, 275, NULL),
(884, 138, 3, 124, NULL, '2020-06-12'),
(885, 139, 1, 107, NULL, '06/09/1951'),
(886, 139, 1, 111, 285, NULL),
(887, 139, 1, 144, NULL, '68'),
(888, 139, 1, 166, 45, NULL),
(889, 139, 1, 167, NULL, '2020-05-13'),
(891, 140, 2, 35, 298, NULL),
(892, 140, 2, 101, 305, NULL),
(893, 140, 2, 150, 300, NULL),
(894, 140, 2, 168, NULL, '2020-05-13'),
(895, 141, 3, 35, 298, NULL),
(896, 141, 3, 101, 305, NULL),
(897, 141, 3, 123, 276, NULL),
(898, 141, 3, 124, NULL, '2020-06-10'),
(899, 160, 1, 107, NULL, '16/03/1969'),
(900, 160, 1, 111, 285, NULL),
(901, 160, 1, 144, NULL, '51'),
(902, 160, 1, 166, 45, NULL),
(903, 160, 1, 167, NULL, '2020-05-14'),
(905, 161, 2, 150, 298, NULL),
(906, 161, 2, 168, NULL, '2020-05-14'),
(907, 161, 2, 228, NULL, '2020-05-14'),
(908, 162, 3, 123, 275, NULL),
(909, 162, 3, 124, NULL, '2020-05-21'),
(910, 157, 1, 107, NULL, '27/02/1968'),
(911, 157, 1, 111, 284, NULL),
(912, 157, 1, 144, NULL, '52'),
(913, 157, 1, 166, 45, NULL),
(914, 157, 1, 167, NULL, '2020-05-14'),
(916, 158, 2, 35, 298, NULL),
(917, 158, 2, 101, 305, NULL),
(918, 158, 2, 150, 300, NULL),
(919, 158, 2, 168, NULL, '2020-05-14'),
(920, 159, 3, 35, 298, NULL),
(921, 159, 3, 101, 305, NULL),
(922, 159, 3, 123, 276, NULL),
(923, 159, 3, 124, NULL, '2020-01-06'),
(924, 166, 1, 107, NULL, '23/08/1978'),
(925, 166, 1, 111, 285, NULL),
(926, 166, 1, 144, NULL, '41'),
(927, 166, 1, 166, 45, NULL),
(928, 166, 1, 167, NULL, '2020-05-15'),
(930, 167, 2, 150, 300, NULL),
(931, 167, 2, 168, NULL, '2020-05-15'),
(932, 168, 3, 123, 276, NULL),
(933, 168, 3, 124, NULL, '2020-05-20'),
(934, 163, 1, 107, NULL, '25/12/1964'),
(935, 163, 1, 111, 285, NULL),
(936, 163, 1, 144, NULL, '55'),
(937, 163, 1, 166, 45, NULL),
(938, 163, 1, 167, NULL, '2020-05-15'),
(940, 164, 2, 150, 300, NULL),
(941, 164, 2, 168, NULL, '2020-05-15'),
(942, 165, 3, 123, 276, NULL),
(943, 165, 3, 124, NULL, '2020-05-20'),
(944, 172, 1, 107, NULL, '17/03/1935'),
(945, 172, 1, 111, 284, NULL),
(946, 172, 1, 144, NULL, '85'),
(947, 172, 1, 166, 45, NULL),
(948, 172, 1, 167, NULL, '2020-05-18'),
(950, 173, 2, 35, 298, NULL),
(951, 173, 2, 101, 305, NULL),
(952, 173, 2, 150, 300, NULL),
(953, 173, 2, 168, NULL, '2020-05-18'),
(954, 174, 3, 35, 298, NULL),
(955, 174, 3, 101, 305, NULL),
(956, 174, 3, 123, 276, NULL),
(957, 174, 3, 124, NULL, '2020-05-27'),
(958, 175, 1, 107, NULL, '17/09/1984'),
(959, 175, 1, 111, 285, NULL),
(960, 175, 1, 144, NULL, '35'),
(961, 175, 1, 166, 45, NULL),
(962, 175, 1, 167, NULL, '2020-05-20'),
(964, 176, 2, 150, 300, NULL),
(965, 176, 2, 168, NULL, '2020-05-20'),
(966, 177, 3, 123, 276, NULL),
(967, 177, 3, 124, NULL, '2020-05-21'),
(968, 187, 1, 107, NULL, '17/09/1953'),
(969, 187, 1, 111, 284, NULL),
(970, 187, 1, 144, NULL, '66'),
(971, 187, 1, 166, 45, NULL),
(972, 187, 1, 167, NULL, '2020-05-21'),
(974, 188, 2, 150, 298, NULL),
(975, 188, 2, 168, NULL, '2020-05-21'),
(976, 188, 2, 228, NULL, '2020-05-21'),
(977, 189, 3, 123, 275, NULL),
(978, 189, 3, 124, NULL, '2020-04-06'),
(979, 178, 1, 107, NULL, '16/08/1952'),
(980, 178, 1, 111, 285, NULL),
(981, 178, 1, 144, NULL, '67'),
(982, 178, 1, 166, 45, NULL),
(983, 178, 1, 167, NULL, '2020-05-20'),
(985, 179, 2, 35, 298, NULL),
(986, 179, 2, 101, 305, NULL),
(987, 179, 2, 150, 300, NULL),
(988, 179, 2, 168, NULL, '2020-05-20'),
(989, 180, 3, 35, 298, NULL),
(990, 180, 3, 101, 305, NULL),
(991, 180, 3, 123, 276, NULL),
(992, 180, 3, 124, NULL, '2020-05-26'),
(993, 181, 1, 107, NULL, '18/08/1986'),
(994, 181, 1, 111, 285, NULL),
(995, 181, 1, 144, NULL, '33'),
(996, 181, 1, 166, 45, NULL),
(997, 181, 1, 167, NULL, '2020-05-20'),
(999, 182, 2, 35, 298, NULL),
(1000, 182, 2, 101, 305, NULL),
(1001, 182, 2, 101, 306, NULL),
(1002, 182, 2, 150, 300, NULL),
(1003, 182, 2, 168, NULL, '2020-05-20'),
(1004, 183, 3, 35, 298, NULL),
(1005, 183, 3, 101, 306, NULL),
(1006, 183, 3, 101, 305, NULL),
(1007, 183, 3, 123, 276, NULL),
(1008, 183, 3, 124, NULL, '2020-05-25'),
(1009, 190, 1, 107, NULL, '04/08/1960'),
(1010, 190, 1, 111, 285, NULL),
(1011, 190, 1, 144, NULL, '59'),
(1012, 190, 1, 166, 45, NULL),
(1013, 190, 1, 167, NULL, '2020-05-21'),
(1015, 191, 2, 35, 298, NULL),
(1016, 191, 2, 101, 305, NULL),
(1017, 191, 2, 150, 300, NULL),
(1018, 191, 2, 168, NULL, '2020-05-21'),
(1019, 192, 3, 35, 298, NULL),
(1020, 192, 3, 101, 305, NULL),
(1021, 192, 3, 123, 276, NULL),
(1022, 192, 3, 124, NULL, '2020-05-25'),
(1023, 199, 1, 107, NULL, '13/05/1954'),
(1024, 199, 1, 111, 284, NULL),
(1025, 199, 1, 144, NULL, '66'),
(1026, 199, 1, 166, 45, NULL),
(1027, 199, 1, 167, NULL, '2020-05-24'),
(1029, 200, 2, 35, 298, NULL),
(1030, 200, 2, 101, 305, NULL),
(1031, 200, 2, 150, 300, NULL),
(1032, 200, 2, 168, NULL, '2020-05-24'),
(1033, 201, 3, 35, 298, NULL),
(1034, 201, 3, 101, 305, NULL),
(1035, 201, 3, 123, 276, NULL),
(1036, 201, 3, 124, NULL, '2020-06-20'),
(1037, 205, 1, 107, NULL, '10/04/1961'),
(1038, 205, 1, 111, 285, NULL),
(1039, 205, 1, 144, NULL, '59'),
(1040, 205, 1, 166, 45, NULL),
(1041, 205, 1, 167, NULL, '2020-05-25'),
(1043, 206, 2, 35, 298, NULL),
(1044, 206, 2, 101, 305, NULL),
(1045, 206, 2, 150, 298, NULL),
(1046, 206, 2, 168, NULL, '2020-05-25'),
(1047, 206, 2, 228, NULL, '2020-05-25'),
(1048, 207, 3, 35, 298, NULL),
(1049, 207, 3, 101, 305, NULL),
(1050, 207, 3, 123, 275, NULL),
(1051, 207, 3, 124, NULL, '2020-02-06'),
(1052, 208, 1, 107, NULL, '10/10/1983'),
(1053, 208, 1, 111, 285, NULL),
(1054, 208, 1, 144, NULL, '36'),
(1055, 208, 1, 166, 45, NULL),
(1056, 208, 1, 167, NULL, '2020-05-26'),
(1058, 209, 2, 35, 298, NULL),
(1059, 209, 2, 101, 305, NULL),
(1060, 209, 2, 150, 300, NULL),
(1061, 209, 2, 168, NULL, '2020-05-26'),
(1062, 210, 3, 35, 298, NULL),
(1063, 210, 3, 101, 305, NULL),
(1064, 210, 3, 123, 276, NULL),
(1065, 210, 3, 124, NULL, '2020-05-06'),
(1066, 211, 1, 107, NULL, '06/01/1965'),
(1067, 211, 1, 111, 284, NULL),
(1068, 211, 1, 144, NULL, '55'),
(1069, 211, 1, 166, 45, NULL),
(1070, 211, 1, 167, NULL, '2020-05-29'),
(1072, 212, 2, 150, 300, NULL),
(1073, 212, 2, 168, NULL, '2020-05-29'),
(1074, 213, 3, 123, 276, NULL),
(1075, 213, 3, 124, NULL, '2020-04-06'),
(1076, 226, 1, 107, NULL, '14/04/1950'),
(1077, 226, 1, 111, 284, NULL),
(1078, 226, 1, 144, NULL, '70'),
(1079, 226, 1, 166, 45, NULL),
(1080, 226, 1, 167, NULL, '2020-06-12'),
(1082, 227, 2, 35, 298, NULL),
(1083, 227, 2, 101, 305, NULL),
(1084, 227, 2, 150, 300, NULL),
(1085, 227, 2, 168, NULL, '2020-06-12'),
(1086, 228, 3, 35, 298, NULL),
(1087, 228, 3, 101, 305, NULL),
(1088, 228, 3, 123, 276, NULL),
(1089, 228, 3, 124, NULL, '2020-06-16'),
(1090, 229, 1, 107, NULL, '22/10/1972'),
(1091, 229, 1, 111, 284, NULL),
(1092, 229, 1, 144, NULL, '47'),
(1093, 229, 1, 166, 45, NULL),
(1094, 229, 1, 167, NULL, '2020-06-12'),
(1096, 230, 2, 35, 298, NULL),
(1097, 230, 2, 101, 305, NULL),
(1098, 230, 2, 150, 300, NULL),
(1099, 230, 2, 168, NULL, '2020-06-12'),
(1100, 231, 3, 35, 298, NULL),
(1101, 231, 3, 101, 305, NULL),
(1102, 231, 3, 123, 276, NULL),
(1103, 231, 3, 124, NULL, '2020-06-17'),
(1104, 232, 1, 107, NULL, '10/09/1969'),
(1105, 232, 1, 111, 285, NULL),
(1106, 232, 1, 144, NULL, '50'),
(1107, 232, 1, 166, 45, NULL),
(1108, 232, 1, 167, NULL, '2020-06-15'),
(1110, 233, 2, 150, 298, NULL),
(1111, 233, 2, 168, NULL, '2020-06-15'),
(1112, 233, 2, 228, NULL, '2020-06-15'),
(1113, 234, 3, 123, 275, NULL),
(1114, 234, 3, 124, NULL, '2020-06-26'),
(1115, 235, 1, 107, NULL, '03/03/1936'),
(1116, 235, 1, 111, 284, NULL),
(1117, 235, 1, 144, NULL, '84'),
(1118, 235, 1, 166, 45, NULL),
(1119, 235, 1, 167, NULL, '2020-06-16'),
(1121, 236, 2, 35, 298, NULL),
(1122, 236, 2, 101, 305, NULL),
(1123, 236, 2, 150, 300, NULL),
(1124, 236, 2, 168, NULL, '2020-06-16'),
(1125, 237, 3, 35, 298, NULL),
(1126, 237, 3, 101, 305, NULL),
(1127, 237, 3, 123, 276, NULL),
(1128, 237, 3, 124, NULL, '2020-06-23'),
(6, 82, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(22, 220, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(37, 145, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(51, 193, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(65, 148, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(81, 10, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(98, 64, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(114, 55, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(130, 97, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(146, 94, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(171, 40, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(187, 202, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(201, 67, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(217, 103, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(227, 184, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(237, 25, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(253, 19, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(271, 196, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(285, 151, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(299, 214, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(313, 169, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(327, 118, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(343, 109, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(360, 142, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(374, 22, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(390, 217, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(404, 154, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(426, 112, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(440, 115, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(454, 79, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(470, 7, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(487, 223, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(504, 13, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(520, 16, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(530, 28, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(540, 31, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(557, 34, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(573, 37, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(590, 43, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(604, 46, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(620, 49, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(634, 52, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(650, 58, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(666, 61, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(680, 70, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(696, 73, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(712, 76, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(729, 85, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(744, 88, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(761, 91, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(775, 100, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(792, 106, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(802, 124, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(816, 121, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(830, 127, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(846, 130, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(860, 133, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(875, 136, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(890, 139, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(904, 160, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(915, 157, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(929, 166, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(939, 163, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(949, 172, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(963, 175, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(973, 187, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(984, 178, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(998, 181, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1014, 190, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1028, 199, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1042, 205, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(1057, 208, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1071, 211, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1081, 226, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1095, 229, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1109, 232, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(1120, 235, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID');

/*!40000 ALTER TABLE `tb_questiongroupformrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_questionnaire`
--

DROP TABLE IF EXISTS `tb_questionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_questionnaire` (
  `questionnaireID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_questionnaire`
--

LOCK TABLES `tb_questionnaire` WRITE;
/*!40000 ALTER TABLE `tb_questionnaire` DISABLE KEYS */;
INSERT INTO `tb_questionnaire` VALUES (1,'WHO COVID-19 Rapid Version CRF');
/*!40000 ALTER TABLE `tb_questionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_questionnaireparts`
--

DROP TABLE IF EXISTS `tb_questionnaireparts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_questionnaireparts` (
  `questionnairePartsID` int(10) NOT NULL,
  `questionnairePartsTableID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_questionnaireparts`
--

LOCK TABLES `tb_questionnaireparts` WRITE;
/*!40000 ALTER TABLE `tb_questionnaireparts` DISABLE KEYS */;
INSERT INTO `tb_questionnaireparts` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(4,3),(4,4),(4,5),(4,6),(4,7),(5,3),(5,4),(5,5),(5,6),(5,7),(6,3),(6,4),(6,5),(6,6),(6,7),(7,3),(7,4),(7,5),(7,6),(7,7),(8,3),(8,4),(8,5),(8,6),(8,7),(9,3),(9,4),(9,5),(9,6),(9,7),(10,3),(10,4),(10,5),(10,6),(10,7),(11,3),(11,4),(11,6),(11,7),(12,3),(12,4),(12,6),(12,7),(13,3),(13,4),(13,6),(13,7),(14,3),(14,4),(14,6),(14,7),(15,3),(15,4),(15,6),(16,3),(16,4),(16,6),(17,4),(17,6),(18,4),(18,6),(19,4),(19,6),(20,4),(20,6),(21,4),(21,6),(22,4),(22,6),(23,4),(23,6),(24,4),(24,6),(25,4),(25,6),(26,4),(26,6),(27,4),(27,6),(28,4),(28,6),(29,4),(29,6),(30,4),(30,6),(31,4),(31,6),(32,4),(32,6),(33,4),(33,6),(34,4),(34,6),(35,4),(35,6),(36,4),(36,6),(37,4),(37,6),(38,4),(38,6),(39,4),(39,6),(40,4),(40,6),(41,4),(41,6),(42,4),(42,6),(43,4),(43,6),(44,4),(44,6),(45,4),(45,6),(46,4),(46,6),(47,4),(47,6),(48,4),(48,6),(49,4),(49,6),(50,4),(50,6),(51,4),(51,6),(52,4),(52,6),(53,4),(53,6),(54,4),(54,6),(55,4),(55,6),(56,4),(56,6),(57,4),(57,6),(58,4),(58,6),(59,4),(59,6),(60,4),(60,6),(61,4),(61,6),(62,4),(62,6),(63,4),(63,6),(64,4),(64,6),(65,4),(65,6),(66,4),(66,6),(67,4),(67,6),(68,4),(68,6),(69,4),(69,6),(70,4),(70,6),(71,4),(71,6),(72,4),(72,6),(73,4),(73,6),(74,4),(74,6),(75,4),(75,6),(76,4),(76,6),(77,4),(77,6),(78,4),(78,6),(79,4),(79,6),(80,4),(80,6),(81,4),(81,6),(82,4),(82,6),(83,4),(83,6),(84,4),(84,6),(85,4),(85,6),(86,4),(86,6),(87,4),(87,6),(88,4),(88,6),(89,4),(89,6),(90,4),(90,6),(91,4),(91,6),(92,4),(92,6),(93,4),(93,6),(94,4),(94,6),(95,4),(95,6),(96,4),(96,6),(97,4),(97,6),(98,4),(98,6),(99,4),(99,6),(100,4),(100,6),(101,4),(101,6),(102,4),(102,6),(103,4),(103,6),(104,4),(104,6),(105,4),(105,6),(106,4),(106,6),(107,4),(107,6),(108,4),(108,6),(109,4),(109,6),(110,4),(110,6),(111,4),(111,6),(112,4),(112,6),(113,4),(113,6),(114,4),(114,6),(115,4),(115,6),(116,4),(116,6),(117,4),(117,6),(118,4),(118,6),(119,4),(119,6),(120,4),(120,6),(121,4),(121,6),(122,4),(122,6),(123,4),(123,6),(124,4),(124,6),(125,4),(125,6),(126,4),(126,6),(127,4),(127,6),(128,4),(128,6),(129,4),(129,6),(130,4),(130,6),(131,4),(131,6),(132,4),(132,6),(133,4),(133,6),(134,4),(134,6),(135,4),(135,6),(136,4),(136,6),(137,4),(137,6),(138,4),(138,6),(139,4),(139,6),(140,4),(140,6),(141,4),(141,6),(142,4),(142,6),(143,4),(143,6),(144,4),(144,6),(145,4),(145,6),(146,4),(146,6),(147,4),(147,6),(148,4),(148,6),(149,4),(149,6),(150,4),(150,6),(151,4),(151,6),(152,4),(152,6),(153,4),(153,6),(154,4),(154,6),(155,4),(155,6),(156,4),(156,6),(157,4),(157,6),(158,4),(158,6),(159,4),(159,6),(160,4),(160,6),(161,4),(161,6),(162,4),(162,6),(163,4),(163,6),(164,4),(164,6),(165,4),(165,6),(166,4),(166,6),(167,4),(167,6),(168,4),(168,6),(169,4),(169,6),(170,4),(170,6),(171,4),(171,6),(172,4),(172,6),(173,4),(173,6),(174,4),(174,6),(175,4),(175,6),(176,4),(176,6),(177,4),(177,6),(178,4),(178,6),(179,4),(179,6),(180,4),(180,6),(181,4),(181,6),(182,4),(182,6),(183,4),(183,6),(184,4),(184,6),(185,4),(185,6),(186,4),(186,6),(187,4),(187,6),(188,4),(188,6),(189,4),(189,6),(190,4),(190,6),(191,4),(191,6),(192,4),(192,6),(193,4),(193,6),(194,4),(194,6),(195,4),(195,6),(196,4),(196,6),(197,4),(197,6),(198,4),(198,6),(199,4),(199,6),(200,4),(200,6),(201,4),(201,6),(202,4),(202,6),(203,4),(203,6),(204,4),(204,6),(205,4),(205,6),(206,4),(206,6),(207,4),(207,6),(208,4),(208,6),(209,4),(209,6),(210,4),(210,6),(211,4),(211,6),(212,4),(212,6),(213,4),(213,6),(214,4),(214,6),(215,4),(215,6),(216,4),(216,6),(217,4),(217,6),(218,4),(218,6),(219,4),(219,6),(220,4),(220,6),(221,4),(221,6),(222,4),(222,6),(223,4),(223,6),(224,4),(224,6),(225,4),(225,6),(226,4),(226,6),(227,4),(227,6),(228,4),(228,6),(229,4),(229,6),(230,4),(231,4),(232,4),(232,6),(233,4),(233,6),(234,4),(234,6),(235,4),(235,6),(236,4),(236,6),(237,4),(237,6),(238,4),(238,6),(239,4),(239,6),(240,4),(240,6),(241,4),(241,6),(242,4),(242,6),(243,4),(243,6),(244,4),(244,6),(245,4),(245,6),(246,4),(246,6),(247,4),(247,6),(248,4),(248,6),(249,4),(249,6),(250,4),(250,6),(251,4),(251,6),(252,4),(252,6),(253,4),(253,6),(254,4),(254,6),(255,4),(255,6),(256,4),(257,4),(258,4),(259,4),(260,4),(261,4),(262,4),(263,4),(264,4),(265,4),(266,4),(267,4),(268,4),(269,4),(270,4),(271,4),(272,4),(273,4),(274,4),(275,4),(276,4),(277,4),(278,4),(279,4),(280,4),(281,4),(282,4),(283,4),(284,4),(285,4),(286,4),(287,4),(288,4),(289,4),(290,4),(291,4),(292,4),(293,4),(294,4),(295,4),(296,4),(297,4),(298,4),(299,4),(300,4),(301,4),(302,4),(303,4),(304,4),(305,4),(306,4),(307,4);
/*!40000 ALTER TABLE `tb_questionnaireparts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_questionnairepartsontology`
--

DROP TABLE IF EXISTS `tb_questionnairepartsontology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_questionnairepartsontology` (
  `ontologyID` int(10) NOT NULL,
  `ontologyURI` varchar(255) NOT NULL,
  `questionnairePartsID` int(10) NOT NULL,
  `questionnairePartsTableID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_questionnairepartsontology`
--

LOCK TABLES `tb_questionnairepartsontology` WRITE;
/*!40000 ALTER TABLE `tb_questionnairepartsontology` DISABLE KEYS */;
INSERT INTO `tb_questionnairepartsontology` VALUES (1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ad',20,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ae',245,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#af',15,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ag',24,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ai',22,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#al',17,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#am',26,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#an',170,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ao',21,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#aq',23,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ar',25,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#as',19,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#at',29,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#au',28,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#aw',27,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ax',16,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#az',30,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ba',42,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bb',34,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bd',33,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#be',36,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bf',49,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bg',48,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bh',32,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bi',50,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bj',38,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bl',198,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bm',39,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bn',47,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bo',41,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#br',45,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bs',31,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bt',40,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bv',44,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bw',43,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#by',35,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#bz',37,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ca',53,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cc',61,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cd',65,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cf',56,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cg',64,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ch',227,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ci',68,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ck',66,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cl',58,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cm',52,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cn',59,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#co',62,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cr',67,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cu',70,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cv',54,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cx',60,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cy',71,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#cz',72,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#de',95,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#dj',74,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#dk',73,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#dm',75,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#do',76,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#dz',18,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ec',77,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ee',82,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#eg',78,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#eh',257,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#er',81,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#es',220,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#et',83,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fi',87,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fj',86,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fk',84,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fm',157,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fo',85,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#fr',88,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ga',92,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gb',246,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gd',100,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ge',94,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gf',89,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gg',104,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gh',96,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gi',97,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gl',99,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gm',93,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gn',105,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gp',101,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gq',80,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gr',98,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gs',219,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gt',103,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gu',102,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gw',106,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#gy',107,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#hk',112,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#hm',109,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#hn',111,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#hr',69,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ht',108,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#hu',113,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#id',116,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ie',119,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#il',121,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#im',120,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#in',115,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#io',46,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#iq',118,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ir',117,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#is',114,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#it',122,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#je',125,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#jm',123,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#jo',126,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#jp',124,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ke',128,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kg',133,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kh',51,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ki',129,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#km',63,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kn',200,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kp',130,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kr',131,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kw',132,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ky',55,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#kz',127,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#la',134,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lb',136,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lc',201,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#li',140,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lk',221,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lr',138,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ls',137,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lt',141,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lu',142,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#lv',135,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ly',139,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ma',163,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mc',159,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#md',158,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#me',161,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mf',202,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mg',145,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mh',151,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mk',144,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ml',149,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mm',165,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mn',160,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mo',143,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mp',178,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mq',152,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mr',153,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ms',162,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mt',150,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mu',154,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mv',148,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mw',146,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mx',156,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#my',147,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#mz',164,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#na',166,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nc',171,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ne',174,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nf',177,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ng',175,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ni',173,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nl',169,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#no',179,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#np',168,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nr',167,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nu',176,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#nz',172,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#om',180,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pa',184,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pe',187,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pf',90,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pg',185,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ph',188,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pk',181,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pl',190,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pm',203,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pn',189,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pr',192,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ps',183,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pt',191,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#pw',182,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#py',186,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#qa',193,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#re',194,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ro',195,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#rs',210,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ru',196,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#rw',197,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sa',208,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sb',216,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sc',211,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sd',222,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#se',226,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sg',213,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sh',199,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#si',215,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sj',224,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sk',214,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sl',212,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sm',206,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sn',209,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#so',217,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sr',223,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#st',207,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sv',79,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sy',228,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#sz',225,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tc',241,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#td',57,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tf',91,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tg',234,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#th',232,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tj',230,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tk',235,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tl',233,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tm',240,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tn',238,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#to',236,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tr',239,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tt',237,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tv',242,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tw',229,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#tz',231,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ua',244,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ug',243,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#um',248,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#us',247,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#uy',249,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#uz',250,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#va',110,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#vc',204,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ve',252,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#vg',254,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#vi',255,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#vn',253,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#vu',251,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#wf',256,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ws',205,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#ye',258,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#yt',155,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#za',218,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#zm',259,4),(1,'http://eulersharp.sourceforge.net/2003/03swap/countries#zw',260,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/1-5_L_per_min',271,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/11-15_L_per_min',272,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/306f9490_ad16_4530_880b_c4d0dd5332dd',131,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/6-10_L_per_min',273,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/89fc2ab5_2f09_4c61_ba83_68112c54ac11',173,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/89fc2ab5_2f09_4c61_ba83_68112c54ac11',233,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/89fc2ab5_2f09_4c61_ba83_68112c54ac11',234,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/89fc2ab5_2f09_4c61_ba83_68112c54ac11',235,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/89fc2ab5_2f09_4c61_ba83_68112c54ac11',236,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/89fc2ab5_2f09_4c61_ba83_68112c54ac11',237,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/89fc2ab5_2f09_4c61_ba83_68112c54ac11',238,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/89fc2ab5_2f09_4c61_ba83_68112c54ac11',239,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/89fc2ab5_2f09_4c61_ba83_68112c54ac11',240,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Abdominal_pain',127,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Ability_self_care',122,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ACE_inhibitors',3,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ACE_inhibitors_medication',200,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ACE_inhibitors_pre_admission',202,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Acute_renal_injury',66,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Acute_Respiratory_Distress_Syndrome',67,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/admission',93,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Age',1,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Age_months',212,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Age_years',144,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Altered_consciousness',2,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Altered_consciousness_daily',179,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Altered_consciousness_signs',207,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ALT_SGPT',114,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Anaemia',68,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Antibiotic',117,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Antibiotic',232,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Antifungal_agent',33,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Antimalarial',34,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Antiviral',35,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/antiviral_list',1,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/APTT_APTR',115,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ARBs',4,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ARBs_medication',201,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ARBs_pre_admission',203,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Arm',96,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Arthralgia',134,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Asplenia',51,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Asthma',50,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/AST_SGOT',116,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/AVPU_list',2,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/AVPU_scale',5,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/AVPU_scale_admission',190,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/AVPU_scale_vital',216,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Azithromycin',305,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Bacteraemia',69,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Birth',107,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Bleeding',70,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Boolean_Question',1,5),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_diastolic',6,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_diastolic_admission',192,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_diastolic_vital',219,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_systolic',7,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_systolic_admission',195,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/BP_systolic_vital',222,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Bronchiolitis',71,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Capillary_refill',24,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Capillary_refill_admission',196,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Capillary_refill_vital',218,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cardiac_arrest',72,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cardiac_arrhythmia',73,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cardiac_disease',52,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cardiomyopathy',74,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Chest_imaging',31,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Chest_pain',8,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Chest_pain_daily',177,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Chest_pain_signs',214,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Chloroquine/hydroxychloroquine',306,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Co-morbidities',2,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Complications',3,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Concentrator',287,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Confusion',83,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Conjunctivitis',9,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Conjunctivitis_daily',188,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Conjunctivitis_signs',213,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Coronavirus',44,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/corona_virus_list',3,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Corticosteroid',36,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/corticosteroid_list',4,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough',10,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_daily',183,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_maemoptysis',128,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_signs',210,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_sputum',11,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_sputum_daily',197,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cough_sputum_signs',225,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Country',166,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/CPAP/NIV_Mask',265,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Creatine_kinase',145,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Creatinine',146,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/CRP',147,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Cylinder',288,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/D-dimer',148,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Daily_clinical_features',4,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Daily_vital_signs',14,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Date_of_ICU_admission',228,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Date_of_ICU_discharge',229,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Date_Question',2,5),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Demographics',6,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Diabetes',58,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Diarrhoea',12,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Diarrhoea_daily',186,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Diarrhoea_signs',208,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ECMO_support',149,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Endocarditis',75,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Enrolment',167,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ESR',118,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Experimental_agent',37,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Facility_name',242,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Falciparum_malaria',84,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Fatigue',129,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Favipiravir',307,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Ferritin',156,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Fever',132,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/FiO2_value',245,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Follow-up_date',168,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/GCS',13,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/GCS_admission',193,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/GCS_vital',223,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Gestational_weeks',113,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Haematocrit',157,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Haemoglobin',158,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Haemorrhage',38,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Headache',130,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Healtcare_worker',108,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Heart_rate',14,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Heart_rate_admission',191,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Heart_rate_vital',221,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Height',94,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/HF_nasal_cannula',266,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/HIV',59,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/hiv_list',6,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/HIV_test',85,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Hypertension',60,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ICU_admission',150,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/IL-6',159,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inability_to_walk',133,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion',1,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion_ARI',48,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion_cough',64,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion_dyspnoea',63,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion_feverishness',47,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inclusion_pathogen',49,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Infiltrates_present',86,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Influenza_virus',46,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Influenza_virus_type',121,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inhaled',12,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Inotropes_vasopressors',151,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/INR',160,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/avpu-list/A',6,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/avpu-list/P',7,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/avpu-list/U',8,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/avpu-list/V',9,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Better',292,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C17998',262,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C17998',269,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C17998',274,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C17998',280,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C17998',283,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C17998',290,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C17998',294,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C17998',297,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C17998',301,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C18902',299,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C25311',14,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C38046',286,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C46109',285,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C46110',284,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C49487',261,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C49487',296,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C49487',300,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C49488',298,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/C49488',302,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Death',275,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Discharged_alive',276,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Hospitalized',277,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/MERS-CoV',10,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Negative',303,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Not_done',291,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Palliative_discharge',278,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Positive',304,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Same_as_before',293,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/SARS-CoV-2',11,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/instances/Worse',295,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Interferon_alpha',1,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Interferon_beta',2,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Intravenous',13,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Intravenous_fluids',119,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Invasive_ventilation',152,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Kidney_disease',53,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Laboratory_question',3,5),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Laboratory_results',8,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Laboratory_Worker',109,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Lactate',161,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/LDH',162,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/List_Question',4,5),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Liver_disease',54,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Liver_dysfunction',76,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Lopinavir_Ritonavir',3,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_smell',243,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_smell_daily',250,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_smell_signs',252,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_taste',244,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_taste_daily',251,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Loss_of_taste_signs',253,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Lower_chest_wall_indrawing',135,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Lymphadenopathy',136,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Malignant_neoplasm',61,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Malnutrition',95,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Mask',267,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Mask_with_reservoir',268,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Maximum_daily_corticosteroid_dose',87,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Medication',9,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Meningitis_Encephalitis',77,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Module_1',1,2),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Module_2',2,2),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Module_3',3,2),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Myalgia',15,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Myalgia_daily',187,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Myalgia_signs',209,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Myocarditis_Pericarditis',78,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Neuraminidase_inhibitor',4,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Neurological_disorder',55,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Non-Falciparum_malaria',88,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Non-invasive_ventilation',153,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/NSAID',16,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/NSAID_medication',199,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/NSAID_pre_admission',204,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Number_question',5,5),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/O2_flow',89,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/o2_flow_list',8,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/oral_orgastric_fluids',120,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_comorbidity',62,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_comorbidity',227,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_complication',30,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/other_corona_virus',106,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_respiratory_pathogen',42,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_signs',17,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_signs_daily',28,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Other_signs_signs',29,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Outcome',10,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/outcome_date',124,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/outcome_list',9,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/outcome_question',123,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/over_15_L_per_min',270,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_interface',90,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/oxygen_interface_list',7,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation',18,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation_admission',40,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation_expl',181,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation_expl_admission',141,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation_expl_vital',112,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/oxygen_saturation_list',10,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_saturation_vital',41,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_therapy',39,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Oxygen_therapy',281,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/PaCO2_value',247,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Pancreatitis',79,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/PaO2_value',246,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/pathogen_testing',7,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Pathogen_testing',32,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/PEEP_value',249,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Piped',289,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Plateau_pressure_value',248,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Platelets',163,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Pneumonia',80,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/pnnotdone_list',11,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/PNNot_done_Question',6,5),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Potassium',164,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/pre-admission',11,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Pregnant',110,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Procalcitonin',165,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Prone_position',154,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/PT',169,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Pulmonary_disease',56,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Respiratory_rate',19,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Respiratory_rate_admission',194,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Respiratory_rate_vital',224,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Rhinorrhoea',137,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Ribavirin',5,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/room_air',282,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/RRT_or_dialysis',155,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Seizures',20,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Seizures_complications',176,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Seizures_daily',178,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Seizures_signs',211,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/self_care_list',12,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Severe_dehydration',21,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Severe_dehydration_admission',189,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Severe_dehydration_vital',220,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Sex',111,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/sex_list',13,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Shock',81,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Shortnesss_of_breath',22,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Shortnesss_of_breath_daily',185,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Shortnesss_of_breath_signs',205,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/signs_and_symptoms',12,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Site_name',91,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Skin_rash',138,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Skin_ulcers',139,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Smoking',57,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Sodium',170,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Sore_throat',23,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Sore_throat_daily',184,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Sore_throat_signs',215,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Source_of_oxygen',92,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/source_of_oxygen_list',14,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Specific_response',175,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Supportive_care',13,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Symptom_onset',97,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Systemic_anticoagulation',241,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Temperature',25,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Temperature_admission',198,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Temperature_vital',217,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Text_Question',7,5),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Total_bilirubin',171,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Transfered',279,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Troponin',172,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Tuberculosis',65,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Urea_(BUN)',174,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Ventilation_question',10,5),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Viral_haemorrhagic_fever',43,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Vital_signs',5,7),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Vomiting',26,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Vomiting_daily',182,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Vomiting_signs',206,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/WBC_count',226,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Weight',98,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Wheezing',140,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_antifungal_agent',99,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_antimalarial_agent',100,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_antiviral',101,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_antiviral',254,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_complication',102,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_coronavirus',45,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_corticosteroid_route',82,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_experimental_agent',103,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_NSAID',180,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_other_antiviral',104,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_other_antiviral',255,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_other_pathogen',105,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_respiratory_pathogen',125,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_sign_or_symptom',27,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_sign_or_symptom_daily',142,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_sign_or_symptom_signs',143,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Which_virus',126,6),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/who-covid-19-rapid-crf',1,1),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Yes-not_on_ART',263,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/Yes-on_ART',264,4),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ynun_list',16,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/YNUN_Question',9,5),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/ynu_list',15,3),(1,'http://purl.org/vodan/whocovid19crfsemdatamodel/YNU_Question',8,5),(1,'http://sweet.jpl.nasa.gov/2.3/humanJurisdiction.owl#Country',5,3);
/*!40000 ALTER TABLE `tb_questionnairepartsontology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_questionnairepartstable`
--

DROP TABLE IF EXISTS `tb_questionnairepartstable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_questionnairepartstable` (
  `questionnairePartsTableID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_questionnairepartstable`
--

LOCK TABLES `tb_questionnairepartstable` WRITE;
/*!40000 ALTER TABLE `tb_questionnairepartstable` DISABLE KEYS */;
INSERT INTO `tb_questionnairepartstable` VALUES (1,'tb_questionnaire'),(2,'tb_crfforms'),(3,'tb_listtype'),(4,'tb_listofvalues'),(5,'tb_questiontype'),(6,'tb_questions'),(7,'tb_questiongroup');
/*!40000 ALTER TABLE `tb_questionnairepartstable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_questions`
--

DROP TABLE IF EXISTS `tb_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_questions` (
  `questionID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição.\r\n(en) description.',
  `questionTypeID` int(10) NOT NULL COMMENT '(pt-br) Chave estrangeira para tabela tb_QuestionsTypes.\r\n(en) Foreign key for the tp_QuestionsTypes table.',
  `listTypeID` int(10) DEFAULT NULL,
  `questionGroupID` int(10) DEFAULT NULL,
  `subordinateTo` int(10) DEFAULT NULL,
  `isAbout` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_questions`
--

LOCK TABLES `tb_questions` WRITE;
/*!40000 ALTER TABLE `tb_questions` DISABLE KEYS */;
INSERT INTO `tb_questions` VALUES (1,'Age',5,NULL,6,NULL,NULL),(2,'Altered consciousness/confusion',8,15,NULL,NULL,NULL),(3,'Angiotensin converting enzyme inhibitors (ACE inhibitors)',8,15,NULL,NULL,NULL),(4,'Angiotensin II receptor blockers (ARBs)',8,15,NULL,NULL,NULL),(5,'AVPU scale',4,2,NULL,NULL,NULL),(6,'BP (diastolic)',5,NULL,NULL,NULL,NULL),(7,'BP (systolic)',5,NULL,NULL,NULL,NULL),(8,'Chest pain',8,15,NULL,NULL,NULL),(9,'Conjunctivitis',8,15,NULL,NULL,NULL),(10,'Cough',8,15,NULL,NULL,NULL),(11,'Cough with sputum',8,15,NULL,NULL,NULL),(12,'Diarrhoea',8,15,NULL,NULL,NULL),(13,'Glasgow Coma Score (GCS /15)',5,NULL,NULL,NULL,NULL),(14,'Heart rate',5,NULL,NULL,NULL,NULL),(15,'Muscle aches (myalgia)',8,15,NULL,NULL,NULL),(16,'Non-steroidal anti-inflammatory (NSAID)',8,15,NULL,NULL,NULL),(17,'Other signs or symptoms',8,15,NULL,NULL,NULL),(18,'Oxygen saturation',5,NULL,NULL,NULL,NULL),(19,'Respiratory rate',5,NULL,NULL,NULL,NULL),(20,'Seizures',8,15,NULL,NULL,NULL),(21,'Severe dehydration',8,15,NULL,NULL,NULL),(22,'Shortness of breath',8,15,NULL,NULL,NULL),(23,'Sore throat',8,15,NULL,NULL,NULL),(24,'Sternal capillary refill time >2seconds',8,15,NULL,NULL,NULL),(25,'Temperature',5,NULL,NULL,NULL,NULL),(26,'Vomiting/Nausea',8,15,NULL,NULL,NULL),(27,'Which sign or symptom',7,NULL,NULL,NULL,NULL),(28,'Other signs or symptoms',8,15,4,NULL,17),(29,'Other signs or symptoms',8,15,12,NULL,17),(30,'Other complication',8,15,3,NULL,NULL),(31,'Chest X-Ray /CT performed',8,15,7,NULL,NULL),(32,'Was pathogen testing done during this illness episode',8,15,7,NULL,NULL),(33,'Antifungal agent',8,15,9,NULL,NULL),(34,'Antimalarial agent',8,15,9,NULL,NULL),(35,'Antiviral',8,15,9,NULL,NULL),(36,'Corticosteroid',8,15,9,NULL,NULL),(37,'Experimental agent',8,15,9,NULL,NULL),(38,'Bleeding (Haemorrhage)',8,15,12,NULL,NULL),(39,'Oxygen therapy',8,15,13,NULL,NULL),(40,'Oxygen saturation',5,NULL,5,NULL,18),(41,'Oxygen saturation',5,NULL,14,NULL,18),(42,'Other respiratory pathogen',6,11,7,32,NULL),(43,'Viral haemorrhagic fever',6,11,7,32,NULL),(44,'Coronavirus',6,11,7,32,NULL),(45,'Which coronavirus',4,3,7,44,NULL),(46,'Influenza virus',6,11,7,32,NULL),(47,'A history of self-reported feverishness or measured fever of ≥ 38 degrees Celsius',1,NULL,1,NULL,NULL),(48,'Clinical suspicion of ARI despite not meeting criteria above',1,NULL,1,NULL,NULL),(49,'Proven or suspected infection with pathogen of Public Health Interest',1,NULL,1,NULL,NULL),(50,'Ashtma',8,15,2,NULL,NULL),(51,'Asplenia',8,15,2,NULL,NULL),(52,'Chronic cardiac disease (not hypertension)',8,15,2,NULL,NULL),(53,'Chronic kidney disease',8,15,2,NULL,NULL),(54,'Chronic liver disease',8,15,2,NULL,NULL),(55,'Chronic neurological disorder',8,15,2,NULL,NULL),(56,'Chronic pulmonary disease',8,15,2,NULL,NULL),(57,'Current smoking',8,15,2,NULL,NULL),(58,'Diabetes',8,15,2,NULL,NULL),(59,'HIV',4,6,2,NULL,NULL),(60,'Hypertension',8,15,2,NULL,NULL),(61,'Malignant neoplasm',8,15,2,NULL,NULL),(62,'Other co-morbidities',8,15,2,NULL,NULL),(63,'Dyspnoea (shortness of breath) OR Tachypnoea',1,NULL,1,NULL,NULL),(64,'Cough',1,NULL,1,NULL,NULL),(65,'Tuberculosis',8,15,2,NULL,NULL),(66,'Acute renal injury',8,15,3,NULL,NULL),(67,'Acute Respiratory Distress Syndrome',8,15,3,NULL,NULL),(68,'Anaemia',8,15,3,NULL,NULL),(69,'Bacteraemia',8,15,3,NULL,NULL),(70,'Bleeding',8,15,3,NULL,NULL),(71,'Bronchiolitis',8,15,3,NULL,NULL),(72,'Cardiac arrest',8,15,3,NULL,NULL),(73,'Cardiac arrhythmia',8,15,3,NULL,NULL),(74,'Cardiomyopathy',8,15,3,NULL,NULL),(75,'Endocarditis',8,15,3,NULL,NULL),(76,'Liver dysfunction',8,15,3,NULL,NULL),(77,'Meningitis/Encephalitis',8,15,3,NULL,NULL),(78,'Myocarditis/Pericarditis',8,15,3,NULL,NULL),(79,'Pancreatitis',8,15,3,NULL,NULL),(80,'Pneumonia',8,15,3,NULL,NULL),(81,'Shock',8,15,3,NULL,NULL),(82,'Which corticosteroid route',4,4,9,36,NULL),(83,'Confusion',8,15,4,NULL,NULL),(84,'Falciparum malaria',6,11,7,32,NULL),(85,'HIV',6,11,7,32,NULL),(86,'Infiltrates present',8,15,7,31,NULL),(87,'Maximum daily corticosteroid dose',7,NULL,9,36,NULL),(88,'Non-Falciparum malaria',6,11,7,32,NULL),(89,'O2 flow',4,8,13,39,NULL),(90,'Oxygen interface',4,7,13,39,NULL),(91,'Site name',7,NULL,12,38,NULL),(92,'Source of oxygen',4,14,13,39,NULL),(93,'Admission date at this facility',2,NULL,5,NULL,NULL),(94,'Height',5,NULL,5,NULL,NULL),(95,'Malnutrition',8,15,5,NULL,NULL),(96,'Mid-upper arm circumference',5,NULL,5,NULL,NULL),(97,'Symptom onset (date of first/earliest symptom)',2,NULL,5,NULL,NULL),(98,'Weight',5,NULL,5,NULL,NULL),(99,'Which antifungal agent',7,NULL,9,33,NULL),(100,'Which antimalarial agent',7,NULL,9,34,NULL),(101,'Which antiviral',4,1,9,35,NULL),(102,'Which complication',7,NULL,3,30,NULL),(103,'Which experimental agent',7,NULL,9,37,NULL),(104,'Which other antiviral',7,NULL,9,35,NULL),(105,'Which other pathogen of public health interest detected',7,NULL,7,32,NULL),(106,'Other corona virus',7,NULL,7,44,NULL),(107,'Date of Birth',2,NULL,6,NULL,NULL),(108,'Healthcare worker',8,15,6,NULL,NULL),(109,'Laboratory Worker',8,15,6,NULL,NULL),(110,'Pregnant',9,16,6,NULL,NULL),(111,'Sex at Birth',4,13,6,NULL,NULL),(112,'Oxygen saturation expl',4,10,14,41,NULL),(113,'Gestational weeks assessment',5,NULL,6,110,NULL),(114,'ALT/SGPT measurement',3,NULL,8,NULL,NULL),(115,'APTT/APTR measurement',3,NULL,8,NULL,NULL),(116,'AST/SGOT measurement',3,NULL,8,NULL,NULL),(117,'Antibiotic',8,15,9,NULL,NULL),(118,'ESR measurement',3,NULL,8,NULL,NULL),(119,'Intravenous fluids',8,15,9,NULL,NULL),(120,'Oral/orogastric fluids',8,15,9,NULL,NULL),(121,'Influenza virus type',7,NULL,7,46,NULL),(122,'Ability to self-care at discharge versus before illness',4,12,10,NULL,NULL),(123,'Outcome',4,9,10,NULL,NULL),(124,'Outcome date',2,NULL,10,NULL,NULL),(125,'Which respiratory pathogen',7,NULL,7,42,NULL),(126,'Which virus',7,NULL,7,43,NULL),(127,'Abdominal pain',8,15,12,NULL,NULL),(128,'Cough with haemoptysis',8,15,12,NULL,NULL),(129,'Fatigue/Malaise',8,15,12,NULL,NULL),(130,'Headache',8,15,12,NULL,NULL),(131,'duration in weeks',5,NULL,NULL,NULL,NULL),(132,'History of fever',8,15,12,NULL,NULL),(133,'Inability to walk',8,15,12,NULL,NULL),(134,'Joint pain (arthralgia)',8,15,12,NULL,NULL),(135,'Lower chest wall indrawing',8,15,12,NULL,NULL),(136,'Lymphadenopathy',8,15,12,NULL,NULL),(137,'Runny nose (rhinorrhoea)',8,15,12,NULL,NULL),(138,'Skin rash',8,15,12,NULL,NULL),(139,'Skin ulcers',8,15,12,NULL,NULL),(140,'Wheezing',8,15,12,NULL,NULL),(141,'Oxygen saturation expl',4,10,5,40,NULL),(142,'Which sign or symptom',7,NULL,4,28,27),(143,'Which sign or symptom',7,NULL,12,29,27),(144,'Age (years)',5,NULL,6,NULL,1),(145,'Creatine kinase measurement',3,NULL,8,NULL,NULL),(146,'Creatinine measurement',3,NULL,8,NULL,NULL),(147,'CRP measurement',3,NULL,8,NULL,NULL),(148,'D-dimer measurement',3,NULL,8,NULL,NULL),(149,'Extracorporeal (ECMO) support',8,15,13,NULL,NULL),(150,'ICU or High Dependency Unit admission',8,15,13,NULL,NULL),(151,'Inotropes/vasopressors',8,15,13,NULL,NULL),(152,'Invasive ventilation',8,15,13,NULL,NULL),(153,'Non-invasive ventilation',9,16,13,NULL,NULL),(154,'Prone position',8,15,13,NULL,NULL),(155,'Renal replacement therapy (RRT) or dialysis',8,15,13,NULL,NULL),(156,'Ferritin measurement',3,NULL,8,NULL,NULL),(157,'Haematocrit measurement',3,NULL,8,NULL,NULL),(158,'Haemoglobin measurement',3,NULL,8,NULL,NULL),(159,'IL-6 measurement',3,NULL,8,NULL,NULL),(160,'INR measurement',3,NULL,8,NULL,NULL),(161,'Lactate measurement',3,NULL,8,NULL,NULL),(162,'LDH measurement',3,NULL,8,NULL,NULL),(163,'Platelets measurement',3,NULL,8,NULL,NULL),(164,'Potassium measurement',3,NULL,8,NULL,NULL),(165,'Procalcitonin measurement',3,NULL,8,NULL,NULL),(166,'Country',4,5,NULL,NULL,NULL),(167,'Date of enrolment',2,NULL,NULL,NULL,NULL),(168,'Date of follow up',2,NULL,NULL,NULL,NULL),(169,'PT measurement',3,NULL,8,NULL,NULL),(170,'Sodium measurement',3,NULL,8,NULL,NULL),(171,'Total bilirubin measurement',3,NULL,8,NULL,NULL),(172,'Troponin measurement',3,NULL,8,NULL,NULL),(173,'duration in days',5,NULL,NULL,NULL,NULL),(174,'Urea (BUN) measurement',3,NULL,8,NULL,NULL),(175,'specific response',7,NULL,NULL,NULL,NULL),(176,'Seizures',8,15,3,NULL,20),(177,'Chest pain',8,15,4,NULL,8),(178,'Seizures',8,15,4,NULL,20),(179,'Altered consciousness/confusion',8,15,4,NULL,2),(180,'Which NSAID',7,NULL,9,16,NULL),(181,'Oxygen saturation expl',4,10,NULL,NULL,NULL),(182,'Vomiting/Nausea',8,15,4,NULL,26),(183,'Cough',8,15,4,NULL,10),(184,'Sore throat',8,15,4,NULL,23),(185,'Shortness of breath',8,15,4,NULL,22),(186,'Diarrhoea',8,15,4,NULL,12),(187,'Muscle aches (myalgia)',8,15,4,NULL,15),(188,'Conjunctivitis',8,15,4,NULL,9),(189,'Severe dehydration',8,15,5,NULL,21),(190,'AVPU scale',4,2,5,NULL,5),(191,'Heart rate',5,NULL,5,NULL,14),(192,'BP (diastolic)',5,NULL,5,NULL,6),(193,'Glasgow Coma Score (GCS /15)',5,NULL,5,NULL,13),(194,'Respiratory rate',5,NULL,5,NULL,19),(195,'BP (systolic)',5,NULL,5,NULL,7),(196,'Sternal capillary refill time >2seconds',8,15,5,NULL,24),(197,'Cough with sputum production',8,15,4,NULL,11),(198,'Temperature',5,NULL,5,NULL,25),(199,'Non-steroidal anti-inflammatory (NSAID)',8,15,9,NULL,16),(200,'Angiotensin converting enzyme inhibitors (ACE inhibitors)',8,15,9,NULL,3),(201,'Angiotensin II receptor blockers (ARBs)',8,15,9,NULL,4),(202,'Angiotensin converting enzyme inhibitors (ACE inhibitors)',8,15,11,NULL,3),(203,'Angiotensin II receptor blockers (ARBs)',8,15,11,NULL,4),(204,'Non-steroidal anti-inflammatory (NSAID)',8,15,11,NULL,16),(205,'Shortness of breath',8,15,12,NULL,22),(206,'Vomiting/Nausea',8,15,12,NULL,26),(207,'Altered consciousness/confusion',8,15,12,NULL,2),(208,'Diarrhoea',8,15,12,NULL,12),(209,'Muscle aches (myalgia)',8,15,12,NULL,15),(210,'Cough',8,15,12,NULL,10),(211,'Seizures',8,15,12,NULL,20),(212,'Age (months)',5,NULL,6,NULL,1),(213,'Conjunctivitis',8,15,12,NULL,9),(214,'Chest pain',8,15,12,NULL,8),(215,'Sore throat',8,15,12,NULL,23),(216,'AVPU scale',4,2,14,NULL,5),(217,'Temperature',5,NULL,14,NULL,25),(218,'Sternal capillary refill time >2seconds',8,15,14,NULL,24),(219,'BP (diastolic)',5,NULL,14,NULL,6),(220,'Severe dehydration',8,15,14,NULL,21),(221,'Heart rate',5,NULL,14,NULL,14),(222,'BP (systolic)',5,NULL,14,NULL,7),(223,'Glasgow Coma Score (GCS /15)',5,NULL,14,NULL,13),(224,'Respiratory rate',5,NULL,14,NULL,19),(225,'Cough with sputum production',8,15,12,NULL,11),(226,'WBC count measurement',3,NULL,8,NULL,NULL),(227,'Which other co-morbidities',7,NULL,2,62,NULL),(228,'Date of ICU/HDU admission',2,NULL,13,150,NULL),(229,'ICU/HDU discharge date',2,NULL,13,150,NULL),(230,'Date of ICU/HDU admission',2,NULL,13,150,NULL),(231,'ICU/HDU discharge date',2,NULL,13,150,NULL),(232,'Which antibiotic',7,NULL,9,117,NULL),(233,'Total duration ICU/HCU',5,NULL,13,150,173),(234,'Total duration Oxygen Therapy',5,NULL,13,39,173),(235,'Total duration Non-invasive ventilation',5,NULL,13,153,173),(236,'Total duration Invasive ventilation',5,NULL,13,152,173),(237,'Total duration ECMO',5,NULL,13,149,173),(238,'Total duration Prone position',5,NULL,13,154,173),(239,'Total duration RRT or dyalysis',5,NULL,13,155,173),(240,'Total duration Inotropes/vasopressors',5,NULL,13,151,173),(241,'Systemic anticoagulation',8,15,9,NULL,NULL),(242,'Facility name',7,NULL,NULL,NULL,NULL),(243,'Loss of smell',8,15,NULL,NULL,NULL),(244,'Loss of taste',8,15,NULL,NULL,NULL),(245,'FiO2 value',10,NULL,13,152,NULL),(246,'PaO2 value',10,NULL,13,152,NULL),(247,'PaCO2 value',10,NULL,13,152,NULL),(248,'Plateau pressure value',10,NULL,13,152,NULL),(249,'PEEP value',10,NULL,13,152,NULL),(250,'Loss of smell daily',8,15,4,NULL,243),(251,'Loss of taste daily',8,15,4,NULL,244),(252,'Loss of smell signs',8,15,12,NULL,243),(253,'Loss of taste signs',8,15,12,NULL,244),(254,'Which antiviral',4,1,11,NULL,101),(255,'Which other antiviral',7,NULL,11,254,104);
/*!40000 ALTER TABLE `tb_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_questiontype`
--

DROP TABLE IF EXISTS `tb_questiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_questiontype` (
  `questionTypeID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição.\r\n(en) description.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_questiontype`
--

LOCK TABLES `tb_questiontype` WRITE;
/*!40000 ALTER TABLE `tb_questiontype` DISABLE KEYS */;
INSERT INTO `tb_questiontype` VALUES (1,'Boolean_Question'),(2,'Date question'),(3,'Laboratory question'),(4,'List question'),(5,'Number question'),(6,'PNNot_done_Question'),(7,'Text_Question'),(8,'YNU_Question'),(9,'YNUN_Question'),(10,'Ventilation question');
/*!40000 ALTER TABLE `tb_questiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `userID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `regionalCouncilCode` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `eMail` varchar(255) DEFAULT NULL,
  `foneNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID` (`userID`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_userrole`
--

DROP TABLE IF EXISTS `tb_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_userrole` (
  `userID` int(11) NOT NULL,
  `groupRoleID` int(11) NOT NULL,
  `hospitalUnitID` int(11) NOT NULL,
  `creationDate` timestamp NOT NULL,
  `expirationDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userID`,`groupRoleID`,`hospitalUnitID`),
  KEY `FKtb_UserRol864770` (`groupRoleID`),
  KEY `FKtb_UserRol324331` (`hospitalUnitID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_userrole`
--

LOCK TABLES `tb_userrole` WRITE;
/*!40000 ALTER TABLE `tb_userrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_crfforms_covidcrfrapid`
--

DROP TABLE IF EXISTS `vw_crfforms_covidcrfrapid`;
/*!50001 DROP VIEW IF EXISTS `vw_crfforms_covidcrfrapid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_crfforms_covidcrfrapid` AS SELECT 
 1 AS `crfFormsID`,
 1 AS `questionnaireID`,
 1 AS `description`,
 1 AS `ontologyURI`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_listofvalues_covidcrfrapid`
--

DROP TABLE IF EXISTS `vw_listofvalues_covidcrfrapid`;
/*!50001 DROP VIEW IF EXISTS `vw_listofvalues_covidcrfrapid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_listofvalues_covidcrfrapid` AS SELECT 
 1 AS `listOfValuesID`,
 1 AS `listTypeID`,
 1 AS `description`,
 1 AS `ontologyURI`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_listype_covidcrfrapid`
--

DROP TABLE IF EXISTS `vw_listype_covidcrfrapid`;
/*!50001 DROP VIEW IF EXISTS `vw_listype_covidcrfrapid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_listype_covidcrfrapid` AS SELECT 
 1 AS `listTypeID`,
 1 AS `description`,
 1 AS `ontologyURI`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_questiongroup_covidcrfrapid`
--

DROP TABLE IF EXISTS `vw_questiongroup_covidcrfrapid`;
/*!50001 DROP VIEW IF EXISTS `vw_questiongroup_covidcrfrapid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_questiongroup_covidcrfrapid` AS SELECT 
 1 AS `questionGroupID`,
 1 AS `description`,
 1 AS `comment`,
 1 AS `ontologyURI`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_questiongroupform_covidcrfrapid`
--

DROP TABLE IF EXISTS `vw_questiongroupform_covidcrfrapid`;
/*!50001 DROP VIEW IF EXISTS `vw_questiongroupform_covidcrfrapid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_questiongroupform_covidcrfrapid` AS SELECT 
 1 AS `crfFormsID`,
 1 AS `questionID`,
 1 AS `questionOrder`,
 1 AS `form_OntologyURI`,
 1 AS `question_OntologyURI`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_questionnaire_covidcrfrapid`
--

DROP TABLE IF EXISTS `vw_questionnaire_covidcrfrapid`;
/*!50001 DROP VIEW IF EXISTS `vw_questionnaire_covidcrfrapid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_questionnaire_covidcrfrapid` AS SELECT 
 1 AS `questionnaireID`,
 1 AS `description`,
 1 AS `ontologyURI`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_questions_covidcrfrapid`
--

DROP TABLE IF EXISTS `vw_questions_covidcrfrapid`;
/*!50001 DROP VIEW IF EXISTS `vw_questions_covidcrfrapid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_questions_covidcrfrapid` AS SELECT 
 1 AS `questionID`,
 1 AS `description`,
 1 AS `questionTypeID`,
 1 AS `listTypeID`,
 1 AS `questionGroupID`,
 1 AS `subordinateTo`,
 1 AS `isAbout`,
 1 AS `ontologyURI`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_questiontype_covidcrfrapid`
--

DROP TABLE IF EXISTS `vw_questiontype_covidcrfrapid`;
/*!50001 DROP VIEW IF EXISTS `vw_questiontype_covidcrfrapid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_questiontype_covidcrfrapid` AS SELECT 
 1 AS `questionTypeID`,
 1 AS `description`,
 1 AS `ontologyURI`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'vodan_br_bd_fiocruz'
--
/*!50003 DROP FUNCTION IF EXISTS `ontologyuri` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ontologyURI`(`ontologyacronym` VARCHAR(500), `tablename` VARCHAR(500), `identifier` INTEGER) RETURNS varchar(500) CHARSET utf8mb4
BEGIN

   declare v_ontologyURI character varying (255);

   

	  

   SELECT t3.ontologyuri into v_ontologyURI

   from 

       tb_QuestionnairePartsTable t2, tb_QuestionnairePartsOntology t3, tb_ontology t4

   where

	t4.acronym = ontologyAcronym and -- Identifica a ontologia que se deseja relacionar

	t2.description = tableName and

	t3.ontologyID = t4.OntologyID and

	t3.questionnairepartstableid = t2.questionnairepartstableid and

	t3.questionnairepartsid = identifier;

  

    if (v_ontologyURI is null) then  

        SET v_ontologyURI = '';

    END IF;

	  

    RETURN v_ontologyURI;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `translate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `translate`(`lng` VARCHAR(500), `val` VARCHAR(500)) RETURNS varchar(500) CHARSET utf8mb4
BEGIN

      declare descriptionLNG varchar (500);

	

	  select t1.descriptionlang into descriptionLNG

      from tb_multilanguage t1, tb_language t2 

	  where t2.description = lng and t1.languageId = t2.languageID and t1.description = val;

  

      if (descriptionLNG is null) then  

	     SET descriptionLNG = '';

	  END IF;

	  

      RETURN descriptionLNG;

      

    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getqst_rsp_modulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getqst_rsp_modulo`(p_crfformid integer)
BEGIN
 select crfformsid as modId, questionid as qstId,
	      translate('pt-br', questionGroup) as dsc_qst_grp,
		 translate('pt-br', question) as dsc_qst,
	 		    questionType as qst_type,
	            (select  GROUP_CONCAT(translate('pt-br',tlv.description) ORDER BY 1 DESC SEPARATOR ' | ') as listofvalue from tb_listofvalues tlv
                 where listtypeid = tb_Questionario.listtypeid ) as rsp_pad,
	             translate('pt-br', questaosubordinada_a) as sub_qst
		from (
			select crfformsid, questionid, questionorder, 
				   formulario, 
				   (case when questiongroup is null then '' else questiongroup end) as questionGroup,
				   (case when commentquestiongroup is null then '' else commentquestiongroup end) as commentquestiongroup,
				   Question,
				   QuestionType, listTypeResposta, listTypeID, QuestaoSubordinada_A, QuestaoReferente_A
			from (
			select t5.crfformsid, t1.questionid, t9.questionorder,
				   t5.description as formulario,
				   (select t2.description from tb_questiongroup t2 where t2.questiongroupid = t1.questiongroupid) as questionGroup,
				   (select t2.comment from tb_questiongroup t2 where t2.questiongroupid = t1.questiongroupid) as commentquestionGroup,
					t1.description as question,
				   (select t3.description as questionType from tb_questiontype t3 where t3.questiontypeid = t1.questiontypeid) as questionType,
				   (select t6.description from tb_listType t6 where t6.listtypeid = t1.listtypeid) as listTypeResposta,
				   t1.listtypeid,
				   (select description from tb_questions t7 where t7.questionId = t1.subordinateTo) as QuestaoSubordinada_A,
				   (select description from tb_questions t8 where t8.questionId = t1.isabout) as QuestaoReferente_A
			from tb_questions t1,  tb_crfForms t5, tb_questionGroupForm t9
			where t5.crfformsid = p_crfformid and
			t9.crfformsid = t5.crfformsid and t9.questionid = t1.questionid
			) as tabela_Formulario ) as tb_Questionario
			Order by crfformsid, questionorder;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_crfforms_covidcrfrapid`
--

/*!50001 DROP VIEW IF EXISTS `vw_crfforms_covidcrfrapid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_crfforms_covidcrfrapid` AS select `t1`.`crfFormsID` AS `crfFormsID`,`t1`.`questionnaireID` AS `questionnaireID`,`t1`.`description` AS `description`,`ontologyURI`('COVIDCRFRAPID','tb_crfforms',`t1`.`crfFormsID`) AS `ontologyURI` from `tb_crfforms` `t1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_listofvalues_covidcrfrapid`
--

/*!50001 DROP VIEW IF EXISTS `vw_listofvalues_covidcrfrapid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_listofvalues_covidcrfrapid` AS select `t1`.`listOfValuesID` AS `listOfValuesID`,`t1`.`listTypeID` AS `listTypeID`,`t1`.`description` AS `description`,`ontologyURI`('COVIDCRFRAPID','tb_listofvalues',`t1`.`listOfValuesID`) AS `ontologyURI` from `tb_listofvalues` `t1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_listype_covidcrfrapid`
--

/*!50001 DROP VIEW IF EXISTS `vw_listype_covidcrfrapid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_listype_covidcrfrapid` AS select `t1`.`listTypeID` AS `listTypeID`,`t1`.`description` AS `description`,`ontologyURI`('COVIDCRFRAPID','tb_listtype',`t1`.`listTypeID`) AS `ontologyURI` from `tb_listtype` `t1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_questiongroup_covidcrfrapid`
--

/*!50001 DROP VIEW IF EXISTS `vw_questiongroup_covidcrfrapid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_questiongroup_covidcrfrapid` AS select `t1`.`questionGroupID` AS `questionGroupID`,`t1`.`description` AS `description`,`t1`.`comment` AS `comment`,`ontologyURI`('COVIDCRFRAPID','tb_questiongroup',`t1`.`questionGroupID`) AS `ontologyURI` from `tb_questiongroup` `t1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_questiongroupform_covidcrfrapid`
--

/*!50001 DROP VIEW IF EXISTS `vw_questiongroupform_covidcrfrapid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_questiongroupform_covidcrfrapid` AS select `t1`.`crfFormsID` AS `crfFormsID`,`t1`.`questionID` AS `questionID`,`t1`.`questionOrder` AS `questionOrder`,`t2`.`ontologyURI` AS `form_OntologyURI`,`t3`.`ontologyURI` AS `question_OntologyURI` from ((`tb_questiongroupform` `t1` join `vw_crfforms_covidcrfrapid` `t2`) join `vw_questions_covidcrfrapid` `t3`) where ((`t2`.`crfFormsID` = `t1`.`crfFormsID`) and (`t3`.`questionID` = `t1`.`questionID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_questionnaire_covidcrfrapid`
--

/*!50001 DROP VIEW IF EXISTS `vw_questionnaire_covidcrfrapid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_questionnaire_covidcrfrapid` AS select `t1`.`questionnaireID` AS `questionnaireID`,`t1`.`description` AS `description`,`ontologyURI`('COVIDCRFRAPID','tb_questionnaire',`t1`.`questionnaireID`) AS `ontologyURI` from `tb_questionnaire` `t1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_questions_covidcrfrapid`
--

/*!50001 DROP VIEW IF EXISTS `vw_questions_covidcrfrapid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_questions_covidcrfrapid` AS select `t1`.`questionID` AS `questionID`,`t1`.`description` AS `description`,`t1`.`questionTypeID` AS `questionTypeID`,`t1`.`listTypeID` AS `listTypeID`,`t1`.`questionGroupID` AS `questionGroupID`,`t1`.`subordinateTo` AS `subordinateTo`,`t1`.`isAbout` AS `isAbout`,`ontologyURI`('COVIDCRFRAPID','tb_questions',`t1`.`questionID`) AS `ontologyURI` from `tb_questions` `t1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_questiontype_covidcrfrapid`
--

/*!50001 DROP VIEW IF EXISTS `vw_questiontype_covidcrfrapid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_questiontype_covidcrfrapid` AS select `t1`.`questionTypeID` AS `questionTypeID`,`t1`.`description` AS `description`,`ontologyURI`('COVIDCRFRAPID','tb_questiontype',`t1`.`questionTypeID`) AS `ontologyURI` from `tb_questiontype` `t1` */;
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

-- Dump completed on 2020-10-18 12:39:03
