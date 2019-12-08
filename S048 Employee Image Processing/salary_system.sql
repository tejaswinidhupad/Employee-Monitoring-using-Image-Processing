-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: salary_system
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `rank` varchar(10) DEFAULT '0',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Nilesh B Kale','nil@gmail.com','nil7628','Pune','2016-01-01','8308120640','Software Developer',50000,'3.7'),(2,'Kishor K kottal','kis@gmail.com','kis2805','Latur','2016-01-01','9988998899','Business Development Executive',40000,'3.3');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_request`
--

DROP TABLE IF EXISTS `leave_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_request`
--

LOCK TABLES `leave_request` WRITE;
/*!40000 ALTER TABLE `leave_request` DISABLE KEYS */;
INSERT INTO `leave_request` VALUES (1,1,'12/14/2016','','Unpaid','Approved'),(2,1,'12/15/2016','','Paid','Approved'),(3,1,'01/13/2017','','Unpaid','Approved'),(4,1,'01/18/2017','','Paid','Approved');
/*!40000 ALTER TABLE `leave_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `off_desk_request`
--

DROP TABLE IF EXISTS `off_desk_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `off_desk_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` varchar(45) DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'pending',
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `off_desk_request`
--

LOCK TABLES `off_desk_request` WRITE;
/*!40000 ALTER TABLE `off_desk_request` DISABLE KEYS */;
INSERT INTO `off_desk_request` VALUES (1,'1','','1','Approved','12/11/2016'),(2,'1','','2','Disapproved','12/16/2016'),(3,'1','','2','Approved','01/02/2017'),(4,'1','','3','Disapproved','12/15/2016');
/*!40000 ALTER TABLE `off_desk_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `actual_salary` varchar(45) DEFAULT NULL,
  `total_working_days` varchar(45) DEFAULT NULL,
  `total_working_hours` varchar(45) DEFAULT NULL,
  `actual_working_hours` varchar(45) DEFAULT NULL,
  `gross_salary` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,1,'12','2016','50000.0','31','248','239','48039'),(2,2,'12','2016','40000.0','31','248','248','40000'),(3,1,'01','2017','50000.0','31','248','238','47838'),(4,2,'01','2017','40000.0','31','248','248','40000'),(5,1,'02','2017','50000.0','28','224','224','50000'),(6,2,'02','2017','40000.0','28','224','224','40000'),(7,1,'03','2017','50000.0','31','248','248','50000'),(8,2,'03','2017','40000.0','31','248','248','40000');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wasted_hours_per_month`
--

DROP TABLE IF EXISTS `wasted_hours_per_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wasted_hours_per_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` varchar(45) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `wasted_minutes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wasted_hours_per_month`
--

LOCK TABLES `wasted_hours_per_month` WRITE;
/*!40000 ALTER TABLE `wasted_hours_per_month` DISABLE KEYS */;
INSERT INTO `wasted_hours_per_month` VALUES (1,'1','12','2016','540'),(2,'1','01','2017','600');
/*!40000 ALTER TABLE `wasted_hours_per_month` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-30 12:29:16
