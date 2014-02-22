CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 10.10.32.36    Database: mydb
-- ------------------------------------------------------
-- Server version	5.1.67

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `idcompany` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) NOT NULL,
  `cif` varchar(9) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcompany`),
  UNIQUE KEY `idcompany_UNIQUE` (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'company1','123132','23213','123123'),(2,'company2','98908','098908','098098');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duties`
--

DROP TABLE IF EXISTS `duties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duties` (
  `idduties` int(11) NOT NULL AUTO_INCREMENT,
  `duty` varchar(255) NOT NULL,
  PRIMARY KEY (`idduties`),
  UNIQUE KEY `idduties_UNIQUE` (`idduties`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duties`
--

LOCK TABLES `duties` WRITE;
/*!40000 ALTER TABLE `duties` DISABLE KEYS */;
/*!40000 ALTER TABLE `duties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duties_has_projects`
--

DROP TABLE IF EXISTS `duties_has_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duties_has_projects` (
  `duties_idduties` int(11) NOT NULL,
  `projects_idproject` int(11) NOT NULL,
  PRIMARY KEY (`duties_idduties`,`projects_idproject`),
  KEY `fk_duties_has_projects_projects1_idx` (`projects_idproject`),
  KEY `fk_duties_has_projects_duties_idx` (`duties_idduties`),
  CONSTRAINT `fk_duties_has_projects_duties` FOREIGN KEY (`duties_idduties`) REFERENCES `duties` (`idduties`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_duties_has_projects_projects1` FOREIGN KEY (`projects_idproject`) REFERENCES `projects` (`idproject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duties_has_projects`
--

LOCK TABLES `duties_has_projects` WRITE;
/*!40000 ALTER TABLE `duties_has_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `duties_has_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `idproject` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `date_ini` varchar(45) DEFAULT NULL,
  `date_fini` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `tweet` varchar(45) DEFAULT NULL,
  `companies_idcompany` int(11) NOT NULL,
  `statuses_idstatuses` int(11) NOT NULL,
  PRIMARY KEY (`idproject`),
  UNIQUE KEY `idproject_UNIQUE` (`idproject`),
  KEY `fk_projects_companies1_idx` (`companies_idcompany`),
  KEY `fk_projects_statuses1_idx` (`statuses_idstatuses`),
  CONSTRAINT `fk_projects_companies1` FOREIGN KEY (`companies_idcompany`) REFERENCES `companies` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_projects_statuses1` FOREIGN KEY (`statuses_idstatuses`) REFERENCES `statuses` (`idstatuses`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (2,'proyecto 1','probando php','2014-02-25','','desarrollo PHP','PHP',2,1);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `idstatuses` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`idstatuses`),
  UNIQUE KEY `idstatuses_UNIQUE` (`idstatuses`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Abierto'),(2,'Cerrado');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `projects_idproject` int(11) NOT NULL,
  `users_idusers` int(11) NOT NULL,
  `duties_idduties` int(11) NOT NULL,
  PRIMARY KEY (`projects_idproject`,`users_idusers`,`duties_idduties`),
  KEY `fk_tasks_projects1_idx` (`projects_idproject`),
  KEY `fk_tasks_users1_idx` (`users_idusers`),
  KEY `fk_tasks_duties1_idx` (`duties_idduties`),
  CONSTRAINT `fk_tasks_projects1` FOREIGN KEY (`projects_idproject`) REFERENCES `projects` (`idproject`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_duties1` FOREIGN KEY (`duties_idduties`) REFERENCES `duties` (`idduties`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `tfno` varchar(12) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_duties_has_projects`
--

DROP TABLE IF EXISTS `users_has_duties_has_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_has_duties_has_projects` (
  `users_idusers` int(11) NOT NULL,
  `duties_has_projects_duties_idduties` int(11) NOT NULL,
  `duties_has_projects_projects_idproject` int(11) NOT NULL,
  PRIMARY KEY (`users_idusers`,`duties_has_projects_duties_idduties`,`duties_has_projects_projects_idproject`),
  KEY `fk_users_has_duties_has_projects_duties_has_projects1_idx` (`duties_has_projects_duties_idduties`,`duties_has_projects_projects_idproject`),
  KEY `fk_users_has_duties_has_projects_users1_idx` (`users_idusers`),
  CONSTRAINT `fk_users_has_duties_has_projects_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_duties_has_projects_duties_has_projects1` FOREIGN KEY (`duties_has_projects_duties_idduties`, `duties_has_projects_projects_idproject`) REFERENCES `duties_has_projects` (`duties_idduties`, `projects_idproject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_duties_has_projects`
--

LOCK TABLES `users_has_duties_has_projects` WRITE;
/*!40000 ALTER TABLE `users_has_duties_has_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_has_duties_has_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-22 19:00:03
