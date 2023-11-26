-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `cast_movie`
--

DROP TABLE IF EXISTS `cast_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cast_movie` (
  `cast_ID` int NOT NULL,
  `project_ID` int NOT NULL,
  `cost` int DEFAULT NULL,
  PRIMARY KEY (`cast_ID`,`project_ID`),
  KEY `project_ID` (`project_ID`),
  CONSTRAINT `cast_movie_ibfk_1` FOREIGN KEY (`cast_ID`) REFERENCES `film_cast` (`cast_ID`) ON DELETE CASCADE,
  CONSTRAINT `cast_movie_ibfk_2` FOREIGN KEY (`project_ID`) REFERENCES `project` (`project_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_movie`
--

LOCK TABLES `cast_movie` WRITE;
/*!40000 ALTER TABLE `cast_movie` DISABLE KEYS */;
INSERT INTO `cast_movie` VALUES (1,5,550000),(1,8,550000),(2,2,550000),(2,14,550000),(2,16,550000),(2,18,550000),(3,4,550000),(4,7,550000),(4,10,550000),(5,2,550000),(5,14,550000),(5,16,550000),(5,18,550000),(6,5,550000),(6,8,550000),(7,4,550000),(8,7,550000),(8,10,550000),(9,3,550000),(9,13,550000),(9,15,550000),(9,17,550000),(9,19,550000),(10,6,550000),(10,9,550000),(10,15,550000),(11,6,550000),(11,9,550000),(11,11,550000),(12,2,550000),(12,11,550000),(12,14,550000),(12,16,550000),(12,18,550000),(13,1,550000),(13,3,550000),(15,1,550000),(15,12,550000),(16,5,550000),(16,8,550000),(16,12,550000),(16,13,550000),(17,3,550000),(17,11,550000),(17,13,550000),(17,15,550000),(17,17,550000),(17,19,550000),(18,1,550000),(18,10,550000),(18,17,550000),(19,6,550000),(19,9,550000),(20,20,145000),(21,20,180000);
/*!40000 ALTER TABLE `cast_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew`
--

DROP TABLE IF EXISTS `crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew` (
  `crew_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `role` varchar(30) DEFAULT NULL,
  `contact_info` bigint DEFAULT NULL,
  PRIMARY KEY (`crew_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew`
--

LOCK TABLES `crew` WRITE;
/*!40000 ALTER TABLE `crew` DISABLE KEYS */;
INSERT INTO `crew` VALUES (1,'Rajesh Kumar','Director',1234567890),(2,'Neha Sharma','Director',2345678901),(3,'Alok Tiwari','Director',3456789012),(4,'Priya Sharma','Cinematographer',4567890123),(5,'Deepak Gupta','Cinematographer',5678901234),(6,'Ravi Verma','Cinematographer',6789012345),(7,'Amit Singh','Production Designer',7890123456),(8,'Reena Malhotra','Production Designer',8901234567),(9,'Sanjay Yadav','Production Designer',9012345678),(10,'Sneha Gupta','Editor',1234567890),(11,'Rajesh Verma','Editor',2345678901),(12,'Anita Jain','Editor',3456789012),(13,'Vikram Kumar','Sound Engineer',4567890123),(14,'Ramesh Singh','Sound Engineer',5678901234),(15,'Sanjay Kumar','Sound Engineer',6789012345),(16,'Anjali Yadav','Costume Designer',7890123456),(17,'Alok Yadav','Costume Designer',8901234567),(18,'Rahul Verma','Script Supervisor',9012345678),(19,'Neeta Singh','Makeup Artist',1234567890),(20,'Karthik Reddy','Assistant Director',2345678901),(21,'Sarita Mishra','Producer',3456789012),(22,'Ali Abbas','Producer',4567890123),(23,'Suresh Sharma','Script Supervisor',5678901234),(24,'Priyanka Jain','Makeup Artist',6789012345),(25,'Rajendra Verma','Assistant Director',7890123456),(26,'Geeta Reddy','Producer',8901234567),(27,'Rajesh Yadav','Script Supervisor',9012345678),(28,'Nidhi Singh','Makeup Artist',1234567890),(29,'Amit Verma','Assistant Director',2345678901),(30,'Renuka Mishra','Producer',3456789012),(31,'Rakesh Kumar','Script Supervisor',4567890123),(32,'Arti Sharma','Makeup Artist',5678901234),(33,'Deepak Jain','Assistant Director',6789012345),(34,'Smita Verma','Producer',7890123456),(35,'Rajkumar Hirani','Director',8754857858),(36,'Salman Khan','Producer',8958652578),(37,'Tanush Jain','Script Supervisor',7854586956),(38,'Tanuja Sharma','Makeup Artist',7854285687);
/*!40000 ALTER TABLE `crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_movie`
--

DROP TABLE IF EXISTS `crew_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew_movie` (
  `crew_ID` int NOT NULL,
  `project_ID` int NOT NULL,
  `cost` int DEFAULT NULL,
  PRIMARY KEY (`crew_ID`,`project_ID`),
  KEY `project_ID` (`project_ID`),
  CONSTRAINT `crew_movie_ibfk_1` FOREIGN KEY (`crew_ID`) REFERENCES `crew` (`crew_ID`) ON DELETE CASCADE,
  CONSTRAINT `crew_movie_ibfk_2` FOREIGN KEY (`project_ID`) REFERENCES `project` (`project_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_movie`
--

LOCK TABLES `crew_movie` WRITE;
/*!40000 ALTER TABLE `crew_movie` DISABLE KEYS */;
INSERT INTO `crew_movie` VALUES (1,1,500000),(1,4,540000),(1,7,490000),(1,10,510000),(1,13,510000),(1,16,500000),(1,19,490000),(2,2,530000),(2,5,500000),(2,8,530000),(2,11,530000),(2,14,540000),(2,17,530000),(3,3,490000),(3,6,510000),(3,9,540000),(3,12,510000),(3,15,520000),(3,18,520000),(4,1,520000),(4,13,520000),(4,19,500000),(5,2,500000),(5,4,490000),(5,9,500000),(5,12,490000),(5,16,510000),(6,3,520000),(6,5,520000),(6,7,500000),(6,11,500000),(6,15,510000),(6,18,530000),(7,1,490000),(7,6,500000),(7,8,520000),(7,10,500000),(7,14,530000),(7,17,520000),(8,2,490000),(8,11,520000),(8,15,490000),(8,19,510000),(9,3,540000),(9,4,500000),(9,8,540000),(9,13,530000),(9,17,500000),(10,1,530000),(10,5,490000),(10,9,530000),(10,10,520000),(10,14,520000),(10,18,500000),(11,2,510000),(11,6,530000),(11,7,510000),(11,12,540000),(11,16,530000),(12,3,500000),(12,4,520000),(12,11,530000),(12,15,520000),(13,1,500000),(13,5,530000),(13,7,520000),(13,12,530000),(13,16,540000),(14,2,530000),(14,8,510000),(14,10,510000),(14,15,540000),(14,19,520000),(15,3,480000),(15,5,500000),(15,9,520000),(15,12,520000),(15,13,520000),(15,17,540000),(16,1,510000),(16,6,490000),(16,10,530000),(16,14,510000),(16,18,520000),(17,2,540000),(17,6,520000),(17,7,530000),(17,11,500000),(17,15,500000),(17,19,530000),(18,1,500000),(18,3,520000),(18,4,490000),(18,8,490000),(18,13,490000),(18,17,490000),(19,1,480000),(19,5,540000),(19,9,490000),(19,11,540000),(19,14,500000),(19,18,490000),(20,1,540000),(20,2,490000),(20,6,500000),(20,9,530000),(20,12,500000),(20,16,510000),(20,19,540000),(21,1,520000),(21,3,510000),(21,4,530000),(21,7,540000),(21,13,530000),(21,17,530000),(22,5,510000),(22,8,530000),(22,11,510000),(22,15,530000),(22,18,530000),(23,2,530000),(23,6,510000),(23,10,500000),(23,14,530000),(23,18,520000),(24,3,490000),(24,4,500000),(24,8,500000),(24,11,490000),(24,15,510000),(25,5,490000),(25,7,480000),(25,10,520000),(25,13,500000),(25,19,480000),(26,2,510000),(26,6,530000),(26,8,490000),(26,13,540000),(26,16,530000),(26,19,520000),(27,3,530000),(27,4,510000),(27,9,500000),(27,12,540000),(27,17,500000),(28,5,530000),(28,7,520000),(28,10,530000),(28,14,540000),(28,18,530000),(29,2,500000),(29,4,540000),(29,9,540000),(29,12,510000),(29,16,540000),(30,3,540000),(30,5,500000),(30,8,520000),(30,13,510000),(30,17,520000),(31,5,520000),(31,9,510000),(31,10,510000),(31,15,520000),(32,6,500000),(32,7,510000),(32,14,520000),(32,17,530000),(33,6,520000),(33,8,530000),(33,11,520000),(33,16,520000),(33,19,510000),(34,4,500000),(34,7,490000),(34,12,530000),(34,14,500000),(34,18,500000),(35,20,125000),(36,20,135000),(37,20,178000),(38,20,165000);
/*!40000 ALTER TABLE `crew_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribution`
--

DROP TABLE IF EXISTS `distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribution` (
  `distributor_ID` int NOT NULL AUTO_INCREMENT,
  `distributor_name` varchar(30) NOT NULL,
  `release_date` date NOT NULL,
  `cost` float NOT NULL,
  `project_ID` int NOT NULL,
  PRIMARY KEY (`distributor_ID`),
  KEY `project_ID` (`project_ID`),
  CONSTRAINT `distribution_ibfk_1` FOREIGN KEY (`project_ID`) REFERENCES `project` (`project_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribution`
--

LOCK TABLES `distribution` WRITE;
/*!40000 ALTER TABLE `distribution` DISABLE KEYS */;
INSERT INTO `distribution` VALUES (1,'ABC Films','2020-12-15',200000,1),(2,'Star Distributions','2021-02-10',180000,2),(3,'Silver Screens','2021-03-25',220000,3),(4,'Cineplex','2020-12-20',190000,4),(5,'Gold Pictures','2022-01-30',210000,5),(6,'Vista Movies','2022-05-05',240000,6),(7,'Skyline Cinemas','2022-03-15',230000,7),(8,'Sunrise Films','2021-12-05',195000,8),(9,'Rainbow Reels','2023-04-10',205000,9),(10,'Globe Cinema','2023-06-20',250000,10),(11,'Moonlight Pictures','2023-05-15',225000,11),(12,'Starshine Productions','2020-11-05',215000,12),(13,'Miracle Movies','2021-03-30',235000,13),(14,'Sunset Studios','2022-02-10',198000,14),(15,'Red Carpet Releasing','2022-04-05',202000,15),(16,'Picture Perfect','2022-06-10',255000,16),(17,'CinemaScape','2023-05-30',228000,17),(18,'Platinum Films','2021-02-15',197000,18),(19,'DreamCatcher Pictures','2021-01-20',212000,19),(20,'Tilesh Distributors','2025-11-27',150000,20);
/*!40000 ALTER TABLE `distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equipment_ID` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `quantity` int NOT NULL,
  `cost` float NOT NULL,
  `project_ID` int NOT NULL,
  PRIMARY KEY (`equipment_ID`),
  KEY `project_ID` (`project_ID`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`project_ID`) REFERENCES `project` (`project_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Camera',12,500000,1),(2,'Microphones',8,150000,1),(3,'Catering',3,200000,1),(4,'Camera',10,250000,2),(5,'Microphones',6,180000,2),(6,'Lights',9,250000,2),(7,'Transportation',5,120000,2),(8,'Camera',15,400000,3),(9,'Microphones',10,200000,3),(10,'Sound System',7,450000,3),(11,'Costumes',4,600000,3),(12,'Camera',14,350000,4),(13,'Microphones',12,160000,4),(14,'Microphones',9,170000,4),(15,'Stunt Equipment',3,800000,4),(16,'Camera',11,280000,5),(17,'Microphones',7,140000,5),(18,'Props',2,350000,5),(19,'Camera',13,320000,6),(20,'Microphones',8,160000,6),(21,'Costumes',5,550000,6),(22,'Camera',16,380000,7),(23,'Microphones',11,190000,7),(24,'Set Design',6,500000,7),(25,'Camera',18,420000,8),(26,'Microphones',14,210000,8),(27,'Editing Software',2,1200000,8),(28,'Camera',15,360000,9),(29,'Microphones',10,180000,9),(30,'Transportation',4,150000,9),(31,'Camera',12,340000,10),(32,'Microphones',9,170000,10),(33,'Catering',1,220000,10),(34,'Camera',17,450000,11),(35,'Microphones',13,220000,11),(36,'Special Effects',5,1000000,11),(37,'Camera',16,390000,12),(38,'Microphones',11,190000,12),(39,'Stunt Equipment',4,900000,12),(40,'Camera',14,410000,13),(41,'Microphones',9,200000,13),(42,'Lights',6,300000,13),(43,'Transportation',5,130000,13),(44,'Camera',12,370000,14),(45,'Microphones',8,180000,14),(46,'Props',3,320000,14),(47,'Camera',10,300000,15),(48,'Microphones',7,150000,15),(49,'Costumes',5,500000,15),(50,'Editing Software',2,1000000,15),(51,'Camera',13,330000,16),(52,'Microphones',9,160000,16),(53,'Set Design',4,450000,16),(54,'Camera',15,390000,17),(55,'Microphones',10,190000,17),(56,'Transportation',4,140000,17),(57,'Camera',18,420000,18),(58,'Microphones',14,210000,18),(59,'Sound System',6,500000,18),(60,'Camera',16,360000,19),(61,'Microphones',11,180000,19),(62,'Props',5,300000,19),(66,'Camera',12,450000,20),(67,'Microphone',7,350000,20),(68,'Soundproofing',5,400000,20);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_cast`
--

DROP TABLE IF EXISTS `film_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_cast` (
  `cast_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `manager_name` varchar(25) DEFAULT NULL,
  `contact_info` bigint DEFAULT NULL,
  PRIMARY KEY (`cast_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_cast`
--

LOCK TABLES `film_cast` WRITE;
/*!40000 ALTER TABLE `film_cast` DISABLE KEYS */;
INSERT INTO `film_cast` VALUES (1,'Shah Rukh Khan','Ali Abbas',1234567890),(2,'Kajol','Reena Malhotra',2345678901),(3,'Amrish Puri','Rajesh Sharma',3456789012),(4,'Amitabh Bachchan','Sunita Verma',4567890123),(5,'Jaya Bachchan','Anita Jain',5678901234),(6,'Hrithik Roshan','Deepak Gupta',6789012345),(7,'Kareena Kapoor Khan','Ramesh Singh',7890123456),(8,'Shahid Kapoor','Sanjay Kumar',8901234567),(9,'Aamir Khan','Neha Sharma',9012345678),(10,'Prabhas','Ravi Verma',1234567890),(11,'Rana Daggubati','Shweta Yadav',2345678901),(12,'Anushka Shetty','Alok Tiwari',3456789012),(13,'Rajkumar Rao','Neha Singh',4567890123),(14,'Sanjay Dutt','Ramesh Gupta',6789012345),(15,'Rekha','Alok Yadav',9012345678),(16,'Deepika Padukone','Priya Sharma',2345678901),(17,'Sridevi','Sanjay Kumar',3456789012),(18,'Salman Khan','Rajesh Verma',4567890123),(19,'Rani Mukerji','Reena Malhotra',5678901234),(20,'Ali Zafar','Himesh Rajinder',7854859686),(21,'Kareena Kapoor','Hitesh Singhania',9868568695);
/*!40000 ALTER TABLE `film_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`location_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Los Angeles Studio','Los Angeles','USA'),(2,'New York Studio','New York','USA'),(3,'London Studio','London','UK'),(4,'Toronto Studio','Toronto','Canada'),(5,'Sydney Studio','Sydney','Australia'),(6,'Tokyo Studio','Tokyo','Japan'),(7,'Mumbai Studio','Mumbai','India'),(8,'Paris Studio','Paris','France'),(9,'Berlin Studio','Berlin','Germany'),(10,'Beijing Studio','Beijing','China'),(11,'Toronto Gardens','Texas','Canada');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing`
--

DROP TABLE IF EXISTS `marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing` (
  `marketing_ID` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `cost` float NOT NULL,
  `project_ID` int NOT NULL,
  PRIMARY KEY (`marketing_ID`),
  KEY `project_ID` (`project_ID`),
  CONSTRAINT `marketing_ibfk_1` FOREIGN KEY (`project_ID`) REFERENCES `project` (`project_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing`
--

LOCK TABLES `marketing` WRITE;
/*!40000 ALTER TABLE `marketing` DISABLE KEYS */;
INSERT INTO `marketing` VALUES (1,'Movie Trailers',500000,1),(2,'Social Media Marketing',350000,1),(3,'Influencer Marketing',250000,1),(4,'Teaser Posters',400000,2),(5,'Email Marketing',300000,2),(6,'Billboard and Outdoor Advertising',450000,2),(7,'Social Media Marketing',350000,3),(8,'Video Marketing',400000,3),(9,'Public Relations',550000,3),(10,'Movie Trailers',500000,4),(11,'Teaser Posters',300000,4),(12,'Influencer Marketing',250000,4),(13,'Social Media Marketing',400000,5),(14,'Email Marketing',350000,5),(15,'Billboard and Outdoor Advertising',450000,5),(16,'Video Marketing',400000,6),(17,'Influencer Marketing',350000,6),(18,'Social Media Marketing',500000,6),(19,'Public Relations',450000,7),(20,'Teaser Posters',300000,7),(21,'Movie Trailers',550000,7),(22,'Email Marketing',350000,8),(23,'Video Marketing',450000,8),(24,'Social Media Marketing',400000,8),(25,'Billboard and Outdoor Advertising',550000,9),(26,'Influencer Marketing',500000,9),(27,'Movie Trailers',350000,9),(28,'Teaser Posters',450000,10),(29,'Social Media Marketing',400000,10),(30,'Video Marketing',300000,10),(31,'Public Relations',500000,11),(32,'Email Marketing',450000,11),(33,'Video Marketing',500000,11),(34,'Billboard and Outdoor Advertising',500000,12),(35,'Teaser Posters',300000,12),(36,'Social Media Marketing',350000,12),(37,'Influencer Marketing',400000,13),(38,'Movie Trailers',550000,13),(39,'Teaser Posters',400000,13),(40,'Social Media Marketing',300000,14),(41,'Email Marketing',450000,14),(42,'Billboard and Outdoor Advertising',550000,14),(43,'Video Marketing',400000,15),(44,'Public Relations',350000,15),(45,'Influencer Marketing',500000,15),(46,'Movie Trailers',500000,16),(47,'Social Media Marketing',350000,16),(48,'Influencer Marketing',250000,16),(49,'Teaser Posters',400000,17),(50,'Email Marketing',300000,17),(51,'Billboard and Outdoor Advertising',450000,17),(52,'Social Media Marketing',350000,18),(53,'Video Marketing',400000,18),(54,'Public Relations',550000,18),(55,'Movie Trailers',500000,19),(56,'Teaser Posters',300000,19),(57,'Social Media Marketing',350000,19),(61,'Movie Trailers',540000,20),(62,'Movie Trailers',432000,20),(63,'Teaser Posters',530000,20);
/*!40000 ALTER TABLE `marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_ID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(35) NOT NULL,
  `budget` float NOT NULL,
  `status` varchar(20) NOT NULL,
  `genre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`project_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Dilwale Dulhania Le Jayenge',5000000,'In Production','Romance'),(2,'Kabhi Khushi Kabhie Gham',8000000,'Post-production','Drama'),(3,'3 Idiots',7000000,'In Production','Comedy'),(4,'Baahubali: The Beginning',10000000,'Pre-production','Action'),(5,'PK',9000000,'In Production','Comedy'),(6,'Koi... Mil Gaya',4000000,'Post-production','Sci-Fi'),(7,'Chennai Express',6000000,'In Production','Action'),(8,'Bajrangi Bhaijaan',7500000,'Pre-production','Action'),(9,'Golmaal Again',5500000,'Post-production','Comedy'),(10,'Dhoom 3',8500000,'In Production','Action'),(11,'Baahubali: The Conclusion',12000000,'Pre-production','Action'),(12,'Secret Superstar',3000000,'Post-production','Drama'),(13,'Raees',7000000,'Post-production','Action'),(14,'Padmaavat',9000000,'In Production','Drama'),(15,'War',8000000,'Pre-production','Action'),(16,'Andhadhun',3500000,'In Production','Mystery'),(17,'Dangal',9500000,'Post-production','Drama'),(18,'Bharat',6500000,'In Production','Drama'),(19,'Sultan',8500000,'Post-production','Action'),(20,'Yaariyan',4800000,'Pre-production','Romance');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shot_at`
--

DROP TABLE IF EXISTS `shot_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shot_at` (
  `project_ID` int NOT NULL,
  `location_ID` int NOT NULL,
  PRIMARY KEY (`project_ID`,`location_ID`),
  KEY `location_ID` (`location_ID`),
  CONSTRAINT `shot_at_ibfk_1` FOREIGN KEY (`project_ID`) REFERENCES `project` (`project_ID`) ON DELETE CASCADE,
  CONSTRAINT `shot_at_ibfk_2` FOREIGN KEY (`location_ID`) REFERENCES `location` (`location_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shot_at`
--

LOCK TABLES `shot_at` WRITE;
/*!40000 ALTER TABLE `shot_at` DISABLE KEYS */;
INSERT INTO `shot_at` VALUES (1,1),(11,1),(2,2),(12,2),(3,3),(13,3),(4,4),(14,4),(5,5),(15,5),(6,6),(16,6),(7,7),(17,7),(8,8),(18,8),(9,9),(19,9),(10,10),(20,11);
/*!40000 ALTER TABLE `shot_at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sound_track`
--

DROP TABLE IF EXISTS `sound_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sound_track` (
  `track_ID` int NOT NULL AUTO_INCREMENT,
  `track_name` varchar(50) DEFAULT NULL,
  `cost` float NOT NULL,
  `label` varchar(30) NOT NULL,
  `composer` varchar(25) NOT NULL,
  `project_ID` int NOT NULL,
  PRIMARY KEY (`track_ID`),
  KEY `project_ID` (`project_ID`),
  CONSTRAINT `sound_track_ibfk_1` FOREIGN KEY (`project_ID`) REFERENCES `project` (`project_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sound_track`
--

LOCK TABLES `sound_track` WRITE;
/*!40000 ALTER TABLE `sound_track` DISABLE KEYS */;
INSERT INTO `sound_track` VALUES (1,'Ek Din Shaam Ho Gayi',100000,'T-Series','Mithoon',1),(2,'Chale Chalo',98000,'Sony Music','Pritam',1),(3,'Koi Ladki Hai',105000,'YRF Music','Pritam',1),(4,'Pehla Nasha',103000,'Eros Music','Atif Aslam',2),(5,'Bole Chudiyan',110500,'Sony Music','Pritam',2),(6,'Nadiya Ne Saare Gaane Gaye',104000,'Eros Music','Shankar-Ehsaan-Loy',3),(7,'Humko Humise Kum Nahi Sakte',107000,'YRF Music','Pritam',3),(8,'Radha Medley',108000,'T-Series','Pritam',3),(9,'Yeh Hai Chichai Gaadi',99000,'T-Series','A.R. Rahman',4),(10,'Dil To Pagal Hai',100000,'Sony Music','Mithoon',4),(11,'Taal Se Taal Mila',105000,'YRF Music','Pritam',4),(12,'Yeh Jo Desh Hai Tera',103000,'Eros Music','Atif Aslam',5),(13,'Chhaiyya Chhaiyya',112000,'T-Series','Pritam',5),(14,'Mehbooba Mehbooba',110500,'Sony Music','Pritam',5),(15,'Udi Udi Parva',104000,'Eros Music','Shankar-Ehsaan-Loy',6),(16,'Mitwa',107000,'YRF Music','Pritam',6),(17,'You Are My Sonia',108000,'T-Series','Pritam',6),(18,'Ruk Ja O Dil Diwane',99000,'T-Series','A.R. Rahman',7),(19,'Kal Ho Naa Ho',100000,'Sony Music','Mithoon',7),(20,'Dil Hi Dil Hai',105000,'YRF Music','Pritam',7),(21,'Chale Chalo (Remix)',103000,'Eros Music','Atif Aslam',8),(22,'Dil Ne Yeh Zubaan De Di (Remix)',112000,'T-Series','Pritam',8),(23,'Suraj Hua Madham',110500,'Sony Music','Pritam',8),(24,'Chann Mere Dadi',104000,'Eros Music','Shankar-Ehsaan-Loy',9),(25,'Kuch Kuch Hota Hai',107000,'YRF Music','Pritam',9),(26,'Hai Rama Ye Kya Hua',108000,'T-Series','Pritam',9),(27,'Dil To Paagal Hai (Title Track)',99000,'T-Series','A.R. Rahman',10),(28,'Taare Zameen Par',100000,'Sony Music','Mithoon',10),(29,'Yeh Jo Desh Hai Tera (Reprise)',105000,'YRF Music','Pritam',10),(30,'Chaiyya Chaiyya (Reprise)',103000,'Eros Music','Atif Aslam',11),(31,'Maine Chupke Se',112000,'T-Series','Pritam',11),(32,'Do Dil Mil Gaye',110500,'Sony Music','Pritam',11),(33,'Awaarapan',104000,'Eros Music','Shankar-Ehsaan-Loy',12),(34,'Ladki Deewani',107000,'YRF Music','Pritam',12),(35,'Ho Gaya Hai Pyaar',108000,'T-Series','Pritam',12),(36,'Yaadein Yaad Aati Hain',99000,'T-Series','A.R. Rahman',13),(37,'Dil Ka Rishta',100000,'Sony Music','Mithoon',13),(38,'Ooparwala',105000,'YRF Music','Pritam',13),(39,'Dil Ne Yeh Zubaan De Di (Unplugged)',103000,'Eros Music','Atif Aslam',14),(40,'Kabhi Khushi Kabhie Gham Title Track',112000,'T-Series','Pritam',14),(41,'Kuch Tum Kaho Kuch Hum Kahe',110500,'Sony Music','Pritam',14),(42,'Yeh Ladki Hai Deewani',104000,'Eros Music','Shankar-Ehsaan-Loy',15),(43,'Tauba Tauba',107000,'YRF Music','Pritam',15),(44,'Dil To Pagal Hai (Remix)',108000,'T-Series','Pritam',15),(45,'Ek Din Shaam Ho Gayi',100000,'Sony Music','Mithoon',16),(46,'Chale Chalo',105000,'YRF Music','Pritam',16),(47,'Koi Ladki Hai',103000,'Eros Music','Atif Aslam',17),(48,'Pehla Nasha',112000,'T-Series','Pritam',17),(49,'Dil Ne Yeh Zubaan De Di',110500,'Sony Music','Pritam',17),(50,'Bole Chudiyan',104000,'Eros Music','Shankar-Ehsaan-Loy',18),(51,'Nadiya Ne Saare Gaane Gaye',107000,'YRF Music','Pritam',18),(52,'Humko Humise Kum Nahi Sakte',108000,'T-Series','Pritam',18),(53,'Radha Medley',99000,'T-Series','A.R. Rahman',19),(54,'Yeh Hai Chichai Gaadi',100000,'Sony Music','Mithoon',19),(55,'Dil To Pagal Hai',105000,'YRF Music','Pritam',19),(56,'Dil ki Kahaani',146000,'Red Label Studios','Pritam',20);
/*!40000 ALTER TABLE `sound_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soundtrack_singers`
--

DROP TABLE IF EXISTS `soundtrack_singers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soundtrack_singers` (
  `singer_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `cost` float NOT NULL,
  `track_ID` int NOT NULL,
  PRIMARY KEY (`singer_ID`,`track_ID`),
  KEY `track_ID` (`track_ID`),
  CONSTRAINT `soundtrack_singers_ibfk_1` FOREIGN KEY (`track_ID`) REFERENCES `sound_track` (`track_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soundtrack_singers`
--

LOCK TABLES `soundtrack_singers` WRITE;
/*!40000 ALTER TABLE `soundtrack_singers` DISABLE KEYS */;
INSERT INTO `soundtrack_singers` VALUES (1,'Arijit Singh',100000,1),(2,'Shreya Ghoshal',95000,2),(3,'Sonu Nigam',105000,3),(4,'Atif Aslam',103000,4),(5,'Lata Mangeshkar',98000,5),(6,'Kishore Kumar',102000,6),(7,'Sunidhi Chauhan',99000,7),(8,'Udit Narayan',104000,8),(9,'Neha Kakkar',108000,9),(10,'Kumar Sanu',97000,10),(11,'Asha Bhosle',101000,11),(12,'Kailash Kher',99000,12),(13,'Mohammed Rafi',102000,13),(14,'Shaan',98000,14),(15,'Alka Yagnik',97000,15),(16,'Javed Ali',100000,16),(17,'Hariharan',105000,17),(18,'S. P. Balasubrahmanyam',99000,18),(19,'Shankar Mahadevan',102000,19),(20,'Kavita Krishnamurthy',104000,20),(21,'Rahat Fateh Ali Khan',97000,21),(22,'Shilpa Rao',101000,22),(23,'Jasleen Royal',98000,23),(24,'Mika Singh',105000,24),(25,'Palak Muchhal',99000,25),(26,'Benny Dayal',102000,26),(27,'Monali Thakur',100000,27),(28,'K.K.',97000,28),(29,'Neeti Mohan',101000,29),(30,'Amit Kumar',98000,30),(31,'Kanika Kapoor',104000,31),(32,'Jubin Nautiyal',99000,32),(33,'Amaal Mallik',105000,33),(34,'Sukhwinder Singh',102000,34),(35,'Jonita Gandhi',97000,35),(36,'Darshan Raval',101000,36),(37,'Ankit Tiwari',98000,37),(38,'Shalmali Kholgade',100000,38),(39,'Adnan Sami',99000,39),(40,'Nakash Aziz',105000,40),(41,'Aditi Singh Sharma',100000,41),(42,'Akash Mukherjee',95000,42),(43,'Akriti Kakar',98000,43),(44,'Arijit Singh',110000,44),(45,'Bhavna Bhatt',92000,45),(46,'Chinmayi Sripada',105000,46),(47,'Deepak Dev',96000,47),(48,'Farrukh Abid',90000,48),(49,'Gulzar',87000,49),(50,'Himanshi Khurana',93000,50),(51,'Javed Ali',98000,51),(52,'Kunal Ganjawala',94000,52),(53,'Mika Singh',112000,53),(54,'Neha Bhasin',97000,54),(55,'Shankar Mahadevan',108000,55),(56,'Shreya Ghoshal',106000,56),(57,'Amaal Malik',180000,56);
/*!40000 ALTER TABLE `soundtrack_singers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 14:26:43
