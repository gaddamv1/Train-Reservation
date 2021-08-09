CREATE DATABASE  IF NOT EXISTS `station` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `station`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: database-1.c7f4bxaozzfl.us-east-1.rds.amazonaws.com    Database: station
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `ssn` int NOT NULL,
  PRIMARY KEY (`ssn`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `employees` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (903),(2222),(54321),(123456789);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerRepresentatives`
--

DROP TABLE IF EXISTS `customerRepresentatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerRepresentatives` (
  `ssn` int NOT NULL,
  PRIMARY KEY (`ssn`),
  CONSTRAINT `customerRepresentatives_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `employees` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerRepresentatives`
--

LOCK TABLES `customerRepresentatives` WRITE;
/*!40000 ALTER TABLE `customerRepresentatives` DISABLE KEYS */;
INSERT INTO `customerRepresentatives` VALUES (1),(2),(7),(111),(333),(434),(666),(1122),(9303030),(39393939);
/*!40000 ALTER TABLE `customerRepresentatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `passwor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('aideptrai8655','Nguyen','Khan',38,'aideptria8655@gmail.com','12345'),('customer1','poland','springs',22,'poland@gmail.com','32!'),('jyang','Jerry','Yang',21,'jy@gmail.com','mysql'),('khanh','nguyen','khanhnguyen',35,'ntdk09199@gmail.com','12345'),('khanh123','nguyen','khanh',49,'ntdk091@gmail.com','12345'),('khanh1234','nguyen','khanh',49,'ntdk091@gmail.com','12345'),('khanh12345','nguyen','khanh',75,'ntdk0919917609@gmail.com','12345'),('mahirules','Mahirul','Islam',21,'mahirulislam11@gmail.com','32!'),('Maple','Kaede','Honjou',18,'mapletree@gmail.com','123'),('mgarc','Miranda','Garcia',32,'mg@gmail.com','tuple'),('miranda','nguyen','khanh',38,'ntd@gmail.com','12345'),('personA','b','a',18,'a@gmail.com','123'),('sanjayk','Sanjay','Koduri',21,'sk@gmail.com','dbms'),('serema123','khanh','nguyen',55,'ntdk0919917609@gmail.com','12345'),('serema12345','gute','khanh',45,'dsada@gmail.com','12345'),('serema8655','nguyen','khanh',49,'ntdk0919917609@gmail.com','12345'),('test','James','Jones',44,'jj@gmail.com','54321'),('testing123123','bobby','bob',18,'hi@gmail.com','123'),('varg','Varun','Gaddam',21,'vg@gmail.com','group35');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinationOfReservation`
--

DROP TABLE IF EXISTS `destinationOfReservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinationOfReservation` (
  `reservationNum` int NOT NULL,
  `stationID` int DEFAULT NULL,
  PRIMARY KEY (`reservationNum`),
  KEY `stationID` (`stationID`),
  CONSTRAINT `destinationOfReservation_ibfk_1` FOREIGN KEY (`stationID`) REFERENCES `stations` (`stationID`),
  CONSTRAINT `destinationOfReservation_ibfk_2` FOREIGN KEY (`reservationNum`) REFERENCES `reservations` (`reservationNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinationOfReservation`
--

LOCK TABLES `destinationOfReservation` WRITE;
/*!40000 ALTER TABLE `destinationOfReservation` DISABLE KEYS */;
INSERT INTO `destinationOfReservation` VALUES (2,2),(3,2),(10,2),(4,3),(6,3),(24,5),(5,6),(25,6),(26,6),(1,7),(7,7),(8,7),(9,7);
/*!40000 ALTER TABLE `destinationOfReservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinationOfTrainSchedule`
--

DROP TABLE IF EXISTS `destinationOfTrainSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinationOfTrainSchedule` (
  `schID` int NOT NULL,
  `trainID` int DEFAULT NULL,
  `transitLine` varchar(50) DEFAULT NULL,
  `stationID` int DEFAULT NULL,
  PRIMARY KEY (`schID`),
  KEY `destinationOfTrainSchedule_ibfk_1` (`stationID`),
  KEY `destinationOfTrainSchedule_ibfk_2` (`trainID`,`transitLine`,`schID`),
  CONSTRAINT `destinationOfTrainSchedule_ibfk_1` FOREIGN KEY (`stationID`) REFERENCES `stations` (`stationID`),
  CONSTRAINT `destinationOfTrainSchedule_ibfk_2` FOREIGN KEY (`schID`) REFERENCES `trainSchedules` (`schID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinationOfTrainSchedule`
--

LOCK TABLES `destinationOfTrainSchedule` WRITE;
/*!40000 ALTER TABLE `destinationOfTrainSchedule` DISABLE KEYS */;
INSERT INTO `destinationOfTrainSchedule` VALUES (1,1,'Green Corridor Line',7),(2,1,'Green Corridor Line',1),(3,1,'Green Corridor Line',7),(4,1,'Green Corridor Line',1),(5,1,'Green Corridor Line',7),(6,1,'Green Corridor Line',1),(7,2,'Blue Corridor Line',2),(8,2,'Blue Corridor Line',1),(9,2,'Blue Corridor Line',2),(10,2,'Blue Corridor Line',1),(11,2,'Blue Corridor Line',2),(12,2,'Blue Corridor Line',1),(13,3,'Red Corridor Line',3),(14,3,'Red Corridor Line',2),(15,3,'Red Corridor Line',3),(16,3,'Red Corridor Line',2),(17,4,'Orange Corridor Line',8),(18,4,'Orange Corridor Line',2),(19,4,'Orange Corridor Line',8),(20,4,'Orange Corridor Line',2),(21,5,'Purple Corridor Line',8),(22,5,'Purple Corridor Line',3),(23,5,'Purple Corridor Line',8),(24,5,'Purple Corridor Line',3),(25,6,'Brown Corridor Line',7),(26,6,'Brown Corridor Line',4),(27,7,'White Corridor Line',3),(28,7,'White Corridor Line',5),(29,8,'Gold Corridor Line',1),(30,8,'Gold Corridor Line',6),(31,9,'Black Corridor Line',8),(32,9,'Black Corridor Line',7),(33,10,'Yellow Corridor Line',5),(34,10,'Yellow Corridor Line',7);
/*!40000 ALTER TABLE `destinationOfTrainSchedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `ssn` int NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `passwor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Mon','Key','monkey','banana'),(2,'Sanjay','Kod','s','k'),(7,'Bob','Tar','b','t'),(111,'d','d','d','d'),(333,'three','3three','33','3'),(434,'guy','dude','g','d'),(666,'dude','Guy','teacher','pass'),(903,'dsadasd','khanh','kel0903','12345'),(1122,'dfds','fdds','fdsfdsfd','sdf'),(2222,'ad','min','adtest','admin'),(54321,'dfds','sdfd','Er','dsfdsf'),(9303030,'nguyen','khanh','aideptrai8655','12345'),(39393939,'nguyen','miranda','miranda','12345'),(123456789,'admin','iam','admin2','adminpass');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `makesReservation`
--

DROP TABLE IF EXISTS `makesReservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `makesReservation` (
  `reservationNum` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `schID` int DEFAULT NULL,
  `trainid` int DEFAULT NULL,
  `transitLine` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reservationNum`),
  KEY `username` (`username`),
  KEY `schID` (`schID`),
  CONSTRAINT `makesReservation_ibfk_1` FOREIGN KEY (`reservationNum`) REFERENCES `reservations` (`reservationNum`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `customers` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makesReservation`
--

LOCK TABLES `makesReservation` WRITE;
/*!40000 ALTER TABLE `makesReservation` DISABLE KEYS */;
INSERT INTO `makesReservation` VALUES (1,'jyang',1,1,'Green Corridor Line'),(2,'jyang',8,2,'Blue Corridor Line'),(3,'Maple',14,3,'Red Corridor Line'),(4,'mgarc',27,7,'White Corridor Line'),(5,'personA',29,8,'Gold Corridor Line'),(6,'sanjayk',21,5,'Purple Corridor Line'),(7,'serema123',33,10,'Yellow Corridor Line'),(8,'varg',31,9,'Black Corridor Line'),(9,'varg',26,6,'Brown Corridor Line'),(10,'mahirules',10,4,'Orange Corridor Line'),(24,'mahirules',33,10,'Yellow Corridor Line'),(25,'mahirules',1,1,'Green Corridor Line'),(26,'mahirules',6,1,'Green Corridor Line');
/*!40000 ALTER TABLE `makesReservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `originOfReservation`
--

DROP TABLE IF EXISTS `originOfReservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `originOfReservation` (
  `reservationNum` int NOT NULL,
  `stationID` int DEFAULT NULL,
  PRIMARY KEY (`reservationNum`),
  KEY `stationID` (`stationID`),
  CONSTRAINT `originOfReservation_ibfk_1` FOREIGN KEY (`stationID`) REFERENCES `stations` (`stationID`),
  CONSTRAINT `originOfReservation_ibfk_2` FOREIGN KEY (`reservationNum`) REFERENCES `reservations` (`reservationNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `originOfReservation`
--

LOCK TABLES `originOfReservation` WRITE;
/*!40000 ALTER TABLE `originOfReservation` DISABLE KEYS */;
INSERT INTO `originOfReservation` VALUES (1,1),(2,1),(5,1),(25,1),(3,2),(4,3),(6,3),(9,4),(7,7),(8,7),(24,7),(26,7),(10,8);
/*!40000 ALTER TABLE `originOfReservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `originOfTrainSchedule`
--

DROP TABLE IF EXISTS `originOfTrainSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `originOfTrainSchedule` (
  `schID` int NOT NULL,
  `trainID` int DEFAULT NULL,
  `transitLine` varchar(50) DEFAULT NULL,
  `stationID` int DEFAULT NULL,
  PRIMARY KEY (`schID`),
  KEY `originOfTrainSchedule_ibfk_1` (`stationID`),
  CONSTRAINT `originOfTrainSchedule_ibfk_1` FOREIGN KEY (`stationID`) REFERENCES `stations` (`stationID`),
  CONSTRAINT `originOfTrainSchedule_ibfk_2` FOREIGN KEY (`schID`) REFERENCES `trainSchedules` (`schID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `originOfTrainSchedule`
--

LOCK TABLES `originOfTrainSchedule` WRITE;
/*!40000 ALTER TABLE `originOfTrainSchedule` DISABLE KEYS */;
INSERT INTO `originOfTrainSchedule` VALUES (1,1,'Green Corridor Line',1),(2,1,'Green Corridor Line',7),(3,1,'Green Corridor Line',1),(4,1,'Green Corridor Line',7),(5,1,'Green Corridor Line',1),(6,1,'Green Corridor Line',7),(7,2,'Blue Corridor Line',1),(8,2,'Blue Corridor Line',2),(9,2,'Blue Corridor Line',1),(10,2,'Blue Corridor Line',2),(11,2,'Blue Corridor Line',1),(12,2,'Blue Corridor Line',2),(13,3,'Red Corridor Line',2),(14,3,'Red Corridor Line',3),(15,3,'Red Corridor Line',2),(16,3,'Red Corridor Line',3),(17,4,'Orange Corridor Line',2),(18,4,'Orange Corridor Line',8),(19,4,'Orange Corridor Line',2),(20,4,'Orange Corridor Line',8),(21,5,'Purple Corridor Line',3),(22,5,'Purple Corridor Line',8),(23,5,'Purple Corridor Line',3),(24,5,'Purple Corridor Line',8),(25,6,'Brown Corridor Line',4),(26,6,'Brown Corridor Line',7),(27,7,'White Corridor Line',5),(28,7,'White Corridor Line',3),(29,8,'Gold Corridor Line',6),(30,8,'Gold Corridor Line',1),(31,9,'Black Corridor Line',7),(32,9,'Black Corridor Line',8),(33,10,'Yellow Corridor Line',7),(34,10,'Yellow Corridor Line',5);
/*!40000 ALTER TABLE `originOfTrainSchedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `questionID` int NOT NULL,
  `question` varchar(50) DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'New key for that','A lot of things to going on and I need your permis'),(2,'Second key for that','A lot of things to going on and I need your permis'),(3,'Second','dasdsaa'),(219,'new question for ya','New answer for id 219'),(309,'new questions for mr miranda','Neq answer for mr.miranda'),(434,'A new questions','A new answer has been updated'),(451,'dasddasdadasda','hey ya'),(784,'New key for that','N/A'),(1077,'New question for question 4','N/A');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservationNum` int NOT NULL,
  `resDate` date DEFAULT NULL,
  `totalFare` float DEFAULT NULL,
  `transitLine` varchar(50) DEFAULT NULL,
  `resType` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reservationNum`),
  KEY `username` (`username`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customers` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'2000-01-01',20,'Green Corridor Line','one-way','jyang'),(2,'2000-02-01',20,'Blue Corridor Line','one-way','mahirules'),(3,'2000-03-01',20,'Red Corridor Line','round-trip','Maple'),(4,'2000-04-01',20,'White Corridor Line','round-trip','mgarc'),(5,'2000-05-01',20,'Gold Corridor Line','one-way','personA'),(6,'2000-06-01',20,'Purple Corridor Line','round-trip','sanjayk'),(7,'2000-07-01',20,'Yellow Corridor Line','round-trip','serema123'),(8,'2000-08-01',20,'Black Corridor Line','round-trip','varg'),(9,'2000-09-01',20,'Brown Corridor Line','one-way','varg'),(10,'2000-10-01',20,'Orange Corridor Line','one-way','mahirules'),(24,'2021-01-01',22,'Yellow Corridor Line','One-way','mahirules'),(25,'2020-12-24',20,'Green Corridor Line','one-way','mahirules'),(26,'2022-02-02',6.5,'Green Corridor Line','one-way','mahirules');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `stationID` int NOT NULL,
  `stationName` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Frost Mountain Rail Line','Sussex','NJ'),(2,'Midland Train Line','Teaneck','NJ'),(3,'South Central Tracks','Flemington','NJ'),(4,'Arrow Point Tracks','Middlesex','NJ'),(5,'Salt Lake Loop Line','Lakewood','NJ'),(6,'Lotus Lake Line','Burlington','NJ'),(7,'Sunflower Rail Line','Salem','NJ'),(8,'Marble Harbor Main Line','Wildwood','NJ');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stopsOfTrainSchedule`
--

DROP TABLE IF EXISTS `stopsOfTrainSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stopsOfTrainSchedule` (
  `schID` int NOT NULL,
  `trainID` int NOT NULL,
  `transitLine` varchar(50) NOT NULL,
  `stationID` int NOT NULL,
  `stopArrival` time NOT NULL,
  `stopDeparture` time DEFAULT NULL,
  `prevStationID` int DEFAULT NULL,
  PRIMARY KEY (`schID`,`trainID`,`transitLine`,`stationID`,`stopArrival`),
  KEY `trainID` (`trainID`,`transitLine`),
  CONSTRAINT `stopsOfTrainSchedule_ibfk_1` FOREIGN KEY (`schID`) REFERENCES `trainSchedules` (`schID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stopsOfTrainSchedule`
--

LOCK TABLES `stopsOfTrainSchedule` WRITE;
/*!40000 ALTER TABLE `stopsOfTrainSchedule` DISABLE KEYS */;
INSERT INTO `stopsOfTrainSchedule` VALUES (1,1,'Green Corridor Line',3,'06:35:00','06:40:00',1),(1,1,'Green Corridor Line',6,'07:15:00','07:20:00',3),(1,1,'Green Corridor Line',7,'08:00:00','08:10:00',6),(2,1,'Green Corridor Line',1,'10:10:00','10:20:00',3),(2,1,'Green Corridor Line',3,'09:30:00','09:35:00',6),(2,1,'Green Corridor Line',6,'08:50:00','08:55:00',7),(3,1,'Green Corridor Line',3,'10:55:00','11:00:00',1),(3,1,'Green Corridor Line',6,'11:35:00','11:40:00',3),(3,1,'Green Corridor Line',7,'12:20:00','12:30:00',6),(4,1,'Green Corridor Line',1,'14:30:00','14:40:00',3),(4,1,'Green Corridor Line',3,'13:50:00','13:55:00',6),(4,1,'Green Corridor Line',6,'13:10:00','13:15:00',7),(5,1,'Green Corridor Line',3,'15:15:00','15:20:00',1),(5,1,'Green Corridor Line',6,'15:55:00','16:00:00',3),(5,1,'Green Corridor Line',7,'16:40:00','16:50:00',6),(6,1,'Green Corridor Line',1,'18:50:00','06:00:00',3),(6,1,'Green Corridor Line',3,'18:10:00','18:15:00',6),(6,1,'Green Corridor Line',6,'17:30:00','17:35:00',7),(7,2,'Blue Corridor Line',2,'09:00:00','09:30:00',1),(8,2,'Blue Corridor Line',1,'10:30:00','11:00:00',2),(9,2,'Blue Corridor Line',2,'12:00:00','12:30:00',1),(10,2,'Blue Corridor Line',1,'13:30:00','15:00:00',2),(11,2,'Blue Corridor Line',2,'16:00:00','17:00:00',1),(12,2,'Blue Corridor Line',1,'18:00:00','08:00:00',2),(13,3,'Red Corridor Line',3,'10:45:00','12:00:00',2),(14,3,'Red Corridor Line',2,'12:45:00','14:00:00',3),(15,3,'Red Corridor Line',3,'14:45:00','16:00:00',2),(16,3,'Red Corridor Line',2,'16:45:00','10:00:00',3),(17,4,'Orange Corridor Line',4,'09:55:00','10:00:00',2),(17,4,'Orange Corridor Line',5,'10:25:00','10:30:00',4),(17,4,'Orange Corridor Line',8,'11:30:00','12:00:00',5),(18,4,'Orange Corridor Line',2,'14:30:00','15:00:00',4),(18,4,'Orange Corridor Line',4,'13:30:00','13:35:00',5),(18,4,'Orange Corridor Line',5,'13:00:00','13:05:00',8),(19,4,'Orange Corridor Line',4,'15:55:00','16:00:00',2),(19,4,'Orange Corridor Line',5,'16:25:00','16:30:00',4),(19,4,'Orange Corridor Line',8,'17:30:00','18:00:00',5),(20,4,'Orange Corridor Line',2,'20:30:00','09:00:00',4),(20,4,'Orange Corridor Line',4,'19:30:00','19:35:00',5),(20,4,'Orange Corridor Line',5,'19:00:00','19:05:00',8),(21,5,'Purple Corridor Line',6,'11:40:00','11:45:00',3),(21,5,'Purple Corridor Line',8,'12:30:00','14:00:00',6),(22,5,'Purple Corridor Line',3,'15:30:00','17:00:00',6),(22,5,'Purple Corridor Line',6,'14:45:00','14:50:00',8),(23,5,'Purple Corridor Line',6,'17:40:00','17:45:00',3),(23,5,'Purple Corridor Line',8,'18:30:00','20:00:00',6),(24,5,'Purple Corridor Line',3,'21:30:00','11:00:00',6),(24,5,'Purple Corridor Line',6,'20:45:00','20:50:00',8),(25,6,'Brown Corridor Line',6,'08:30:00','08:35:00',4),(25,6,'Brown Corridor Line',7,'09:00:00','16:00:00',6),(26,6,'Brown Corridor Line',4,'17:00:00','08:00:00',6),(26,6,'Brown Corridor Line',6,'16:25:00','16:30:00',7),(27,7,'White Corridor Line',3,'09:40:00','17:00:00',4),(27,7,'White Corridor Line',4,'09:15:00','09:20:00',5),(28,7,'White Corridor Line',4,'17:20:00','17:25:00',3),(28,7,'White Corridor Line',5,'17:40:00','09:00:00',4),(29,8,'Gold Corridor Line',1,'11:40:00','15:00:00',6),(30,8,'Gold Corridor Line',6,'16:40:00','10:00:00',1),(31,9,'Black Corridor Line',8,'13:20:00','18:00:00',7),(32,9,'Black Corridor Line',7,'19:20:00','12:00:00',8),(33,10,'Yellow Corridor Line',5,'09:30:00','15:30:00',6),(33,10,'Yellow Corridor Line',6,'08:40:00','08:45:00',7),(34,10,'Yellow Corridor Line',6,'16:15:00','16:20:00',5),(34,10,'Yellow Corridor Line',7,'17:00:00','08:00:00',6);
/*!40000 ALTER TABLE `stopsOfTrainSchedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainBelongsTo`
--

DROP TABLE IF EXISTS `trainBelongsTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainBelongsTo` (
  `trainID` int NOT NULL,
  `stationID` int DEFAULT NULL,
  PRIMARY KEY (`trainID`),
  KEY `stationID` (`stationID`),
  CONSTRAINT `trainBelongsTo_ibfk_1` FOREIGN KEY (`trainID`) REFERENCES `trains` (`trainID`),
  CONSTRAINT `trainBelongsTo_ibfk_2` FOREIGN KEY (`stationID`) REFERENCES `stations` (`stationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainBelongsTo`
--

LOCK TABLES `trainBelongsTo` WRITE;
/*!40000 ALTER TABLE `trainBelongsTo` DISABLE KEYS */;
INSERT INTO `trainBelongsTo` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,4),(7,5),(8,6),(9,7),(10,7);
/*!40000 ALTER TABLE `trainBelongsTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainSchedules`
--

DROP TABLE IF EXISTS `trainSchedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainSchedules` (
  `schID` int NOT NULL,
  `trainID` int DEFAULT NULL,
  `transitLine` varchar(50) DEFAULT NULL,
  `departure` time DEFAULT NULL,
  `arrival` time DEFAULT NULL,
  `travelTime` int DEFAULT NULL,
  `fare` float DEFAULT NULL,
  `numberStops` int DEFAULT NULL,
  PRIMARY KEY (`schID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainSchedules`
--

LOCK TABLES `trainSchedules` WRITE;
/*!40000 ALTER TABLE `trainSchedules` DISABLE KEYS */;
INSERT INTO `trainSchedules` VALUES (1,1,'Green Corridor Line','06:00:00','08:00:00',120,30,3),(2,1,'Green Corridor Line','08:10:00','10:10:00',120,30,3),(3,1,'Green Corridor Line','10:20:00','12:20:00',120,30,3),(4,1,'Green Corridor Line','12:30:00','14:30:00',120,30,3),(5,1,'Green Corridor Line','14:40:00','16:40:00',120,30,3),(6,1,'Green Corridor Line','16:50:00','18:50:00',120,30,3),(7,2,'Blue Corridor Line','08:00:00','09:00:00',60,10,1),(8,2,'Blue Corridor Line','09:30:00','10:30:00',60,10,1),(9,2,'Blue Corridor Line','11:00:00','12:00:00',60,10,1),(10,2,'Blue Corridor Line','12:30:00','13:30:00',60,10,1),(11,2,'Blue Corridor Line','15:00:00','16:00:00',60,10,1),(12,2,'Blue Corridor Line','17:00:00','18:00:00',60,10,1),(13,3,'Red Corridor Line','10:00:00','10:45:00',45,12,1),(14,3,'Red Corridor Line','12:00:00','12:45:00',45,12,1),(15,3,'Red Corridor Line','14:00:00','14:45:00',45,12,1),(16,3,'Red Corridor Line','16:00:00','10:45:00',45,12,1),(17,4,'Orange Corridor Line','09:00:00','11:30:00',150,45,3),(18,4,'Orange Corridor Line','12:00:00','14:30:00',150,45,3),(19,4,'Orange Corridor Line','15:00:00','17:30:00',150,45,3),(20,4,'Orange Corridor Line','18:00:00','20:30:00',150,45,3),(21,5,'Purple Corridor Line','11:00:00','12:30:00',90,50,2),(22,5,'Purple Corridor Line','14:00:00','15:30:00',90,50,2),(23,5,'Purple Corridor Line','17:00:00','18:30:00',90,50,2),(24,5,'Purple Corridor Line','20:00:00','21:30:00',90,50,2),(25,6,'Brown Corridor Line','08:00:00','09:00:00',60,20,2),(26,6,'Brown Corridor Line','16:00:00','17:00:00',60,20,2),(27,7,'White Corridor Line','09:00:00','09:40:00',40,8,2),(28,7,'White Corridor Line','17:00:00','17:40:00',40,8,2),(29,8,'Gold Corridor Line','10:00:00','11:40:00',100,30,1),(30,8,'Gold Corridor Line','15:00:00','16:40:00',100,30,1),(31,9,'Black Corridor Line','12:00:00','13:20:00',80,12,1),(32,9,'Black Corridor Line','18:00:00','19:20:00',80,12,1),(33,10,'Yellow Corridor Line','08:00:00','09:30:00',90,22,2),(34,10,'Yellow Corridor Line','15:30:00','17:00:00',90,22,2),(44,1,'ToEdit Corridor Line','15:00:00','17:00:00',120,33,2);
/*!40000 ALTER TABLE `trainSchedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trains` (
  `trainID` int NOT NULL,
  PRIMARY KEY (`trainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trains`
--

LOCK TABLES `trains` WRITE;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
INSERT INTO `trains` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-16 21:19:07
