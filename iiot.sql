-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: iott
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alert_info`
--

DROP TABLE IF EXISTS `alert_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_info` (
  `dno` int NOT NULL AUTO_INCREMENT,
  `temperature` float NOT NULL,
  `sender` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `did` int NOT NULL,
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_info`
--

LOCK TABLES `alert_info` WRITE;
/*!40000 ALTER TABLE `alert_info` DISABLE KEYS */;
INSERT INTO `alert_info` VALUES (1,31.2343,'sensor','2022-08-14 00:19:36',2),(2,33.0289,'sensor','2022-08-14 00:20:06',2),(3,35.5381,'air-conditioning','2022-08-14 00:21:06',1),(4,35.4494,'sensor','2022-08-14 00:21:06',2),(5,33.0982,'air-conditioning','2022-08-14 00:21:16',1),(6,37.9454,'fan','2022-08-14 00:21:36',3),(7,32.9906,'sensor','2022-08-14 00:21:47',2),(8,38.9557,'fan','2022-08-15 08:15:02',3),(9,33.0363,'air-conditioning','2022-08-15 08:15:22',1),(10,38.1381,'air-conditioning','2022-08-15 08:15:32',1),(11,33.981,'sensor','2022-08-15 08:16:12',2),(12,30.4539,'fan','2022-08-15 08:16:22',3),(13,32.8786,'air-conditioning','2022-08-15 08:16:32',1),(14,31.3029,'sensor','2022-09-30 14:58:11',2),(15,30.1594,'fan','2022-09-30 15:01:48',3),(16,30.2197,'air-conditioning','2022-09-30 15:02:18',1),(17,35.3748,'sensor','2022-09-30 15:02:18',2),(18,38.9878,'air-conditioning','2022-09-30 15:02:48',1),(19,32.712,'fan','2022-09-30 15:02:48',3),(20,35.3054,'fan','2022-09-30 15:02:58',3),(21,34.8835,'fan','2022-09-30 15:03:28',3),(22,33.767,'air-conditioning','2022-09-30 15:03:38',1),(23,36.5719,'air-conditioning','2022-09-30 15:07:39',1),(24,36.0935,'fan','2022-09-30 15:07:39',3),(25,33.9455,'air-conditioning','2022-09-30 15:07:49',1),(26,33.3652,'fan','2022-09-30 15:07:49',3);
/*!40000 ALTER TABLE `alert_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `average_temperature`
--

DROP TABLE IF EXISTS `average_temperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `average_temperature` (
  `dno` int NOT NULL AUTO_INCREMENT,
  `did` int NOT NULL,
  `temperature` float NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `average_temperature`
--

LOCK TABLES `average_temperature` WRITE;
/*!40000 ALTER TABLE `average_temperature` DISABLE KEYS */;
INSERT INTO `average_temperature` VALUES (1,1,14.2664,'2022-10-01 15:41:58'),(2,2,15.137,'2022-10-01 15:42:08'),(3,1,15.2664,'2022-10-01 15:42:18'),(4,3,15.2664,'2022-10-01 15:42:28'),(5,2,16.137,'2022-10-01 15:42:38'),(6,3,14.2664,'2022-10-01 15:43:14'),(7,1,13.2664,'2022-10-01 15:43:24'),(8,3,16.38,'2022-10-01 15:43:34'),(9,1,13.5664,'2022-10-01 15:43:44'),(10,2,14.137,'2022-10-01 15:43:54'),(11,1,15.4664,'2022-10-01 15:45:25'),(12,3,15.38,'2022-10-01 15:45:35'),(13,1,12.2664,'2022-10-01 15:45:45');
/*!40000 ALTER TABLE `average_temperature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `did` int NOT NULL AUTO_INCREMENT,
  `deviceName` varchar(20) NOT NULL,
  `status` varchar(8) NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,'air-condition','on',116.37,39.86),(2,'sensor','off',121.47,31.23),(3,'fringe','off',110.21,22.66),(4,'测试设备4','off',123,22),(5,'摄像头','off',122.44,22.33),(6,'测试设备6','off',122,23),(7,'测试设备7','off',123,23),(8,'测试8','off',123,21),(9,'测试11','off',123,21),(10,'测试设备10','off',112,23),(11,'测试设备11','off',123,24);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_action`
--

DROP TABLE IF EXISTS `device_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_action` (
  `deviceName` varchar(50) NOT NULL,
  `action` varchar(50) DEFAULT NULL,
  `param` varchar(50) DEFAULT NULL,
  `dno` int NOT NULL AUTO_INCREMENT,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_action`
--

LOCK TABLES `device_action` WRITE;
/*!40000 ALTER TABLE `device_action` DISABLE KEYS */;
INSERT INTO `device_action` VALUES ('1','closenow',NULL,1,'2022-08-15 08:17:02'),('1','delayopen','2min',2,'2022-08-15 08:17:02'),('2','opennow',NULL,3,'2022-08-15 08:17:02'),('2','delayclose','2min',4,'2022-08-15 08:17:02'),('air-condition','opennow','',5,'2022-09-30 00:09:58'),('air-condition','delayopen','2min',6,'2022-09-30 00:10:02'),('air-condition','closenow','',7,'2022-09-30 00:10:04'),('air-condition','delayclose','2min',8,'2022-09-30 00:10:06'),('fringe','opennow','',9,'2022-09-30 11:17:43'),('fringe','delayclose','2min',10,'2022-09-30 11:17:50'),('fringe','closenow','',11,'2022-09-30 11:21:26'),('fringe','delayclose','2min',12,'2022-09-30 11:21:29'),('sensor','delayclose','2min',13,'2022-09-30 11:22:58'),('sensor','closenow','',14,'2022-09-30 11:23:34'),('air-condition','closenow','',15,'2022-09-30 13:33:06'),('air-condition','closenow','',16,'2022-09-30 13:34:31'),('air-condition','delayclose','2min',17,'2022-09-30 13:34:57'),('air-condition','delayclose','2min',18,'2022-09-30 13:49:43'),('air-condition','opennow','',19,'2022-09-30 13:54:34'),('air-condition','delayopen','2min',20,'2022-09-30 13:54:39'),('air-condition','closenow','',21,'2022-09-30 13:55:07'),('air-condition','delayclose','2min',22,'2022-09-30 13:55:13'),('air-condition','opennow','',23,'2022-09-30 15:10:22'),('fringe','delayopen','2min',24,'2022-10-01 14:03:24'),('fringe','delayclose','2min',25,'2022-10-01 14:04:06'),('fringe','delayopen','2min',26,'2022-10-01 14:04:31'),('fringe','delayclose','2min',27,'2022-10-01 14:27:50'),('sensor','delayopen','2min',28,'2022-10-01 14:34:14'),('air-condition','closenow','',29,'2022-10-03 21:00:01'),('sensor','delayclose','2min',30,'2022-10-03 21:01:11');
/*!40000 ALTER TABLE `device_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `normal_data`
--

DROP TABLE IF EXISTS `normal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `normal_data` (
  `dno` int NOT NULL AUTO_INCREMENT,
  `did` int NOT NULL,
  `temperature` float NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `normal_data`
--

LOCK TABLES `normal_data` WRITE;
/*!40000 ALTER TABLE `normal_data` DISABLE KEYS */;
INSERT INTO `normal_data` VALUES (1,2,19.5917,'2022-08-15 08:17:02'),(2,1,28.446,'2022-08-14 00:19:46'),(3,2,15.9584,'2022-08-14 00:19:46'),(4,1,25.735,'2022-08-14 00:19:56'),(5,2,27.3471,'2022-08-14 00:19:56'),(6,1,7.75604,'2022-08-14 00:20:06'),(7,3,6.14843,'2022-08-14 00:20:16'),(8,1,25.1659,'2022-08-14 00:20:16'),(9,3,2.63473,'2022-08-14 00:20:26'),(10,2,7.92553,'2022-08-14 00:20:26'),(11,2,24.171,'2022-08-14 00:20:36'),(12,3,14.8567,'2022-08-14 00:20:36'),(13,1,3.21413,'2022-08-14 00:20:46'),(14,3,10.4727,'2022-08-14 00:20:46'),(15,1,14.6942,'2022-08-14 00:20:56'),(16,1,16.4767,'2022-08-14 00:20:56'),(17,2,3.44898,'2022-08-14 00:21:16'),(18,1,15.5972,'2022-08-14 00:21:26'),(19,2,7.85811,'2022-08-14 00:21:26'),(20,1,12.3452,'2022-08-14 00:21:36'),(21,3,17.6541,'2022-08-14 00:21:47'),(22,1,23.688,'2022-08-14 00:21:57'),(23,3,10.3889,'2022-08-15 08:14:32'),(24,1,19.9691,'2022-08-15 08:14:32'),(25,1,16.0708,'2022-08-15 08:14:42'),(26,3,23.4453,'2022-08-15 08:14:42'),(27,1,20.9384,'2022-08-15 08:14:52'),(28,3,16.3433,'2022-08-15 08:14:52'),(29,1,27.8723,'2022-08-15 08:15:02'),(30,2,12.0226,'2022-08-15 08:15:12'),(31,1,28.2427,'2022-08-15 08:15:12'),(32,2,1.42735,'2022-08-15 08:15:22'),(33,2,24.4388,'2022-08-15 08:15:32'),(34,1,5.93442,'2022-08-15 08:15:42'),(35,1,6.49322,'2022-08-15 08:15:42'),(36,3,6.04633,'2022-08-15 08:15:52'),(37,1,19.7319,'2022-08-15 08:15:52'),(38,3,25.8381,'2022-08-15 08:16:02'),(39,2,10.6046,'2022-08-15 08:16:02'),(40,1,24.1836,'2022-08-15 08:16:12'),(41,2,19.1285,'2022-08-15 08:16:22'),(42,1,0.0115113,'2022-08-15 08:16:32'),(43,2,2.25996,'2022-08-15 08:16:42'),(44,3,1.94188,'2022-08-15 08:16:42'),(45,3,22.024,'2022-08-15 08:16:52'),(46,2,12.4273,'2022-08-15 08:16:52'),(47,1,20.1017,'2022-09-30 14:58:01'),(48,1,3.7279,'2022-09-30 14:58:01'),(49,1,0.324549,'2022-09-30 14:58:11'),(50,2,0.979237,'2022-09-30 14:58:21'),(51,2,19.7548,'2022-09-30 14:58:21'),(52,3,21.3295,'2022-09-30 15:00:22'),(53,3,1.92634,'2022-09-30 15:00:32'),(54,2,0.790537,'2022-09-30 15:01:48'),(55,2,23.9299,'2022-09-30 15:01:58'),(56,3,26.188,'2022-09-30 15:01:58'),(57,1,26.0678,'2022-09-30 15:02:08'),(58,2,17.3505,'2022-09-30 15:02:08'),(59,1,25.1627,'2022-09-30 15:02:28'),(60,2,19.7836,'2022-09-30 15:02:28'),(61,3,23.8425,'2022-09-30 15:02:38'),(62,2,12.5631,'2022-09-30 15:02:38'),(63,1,14.53,'2022-09-30 15:02:58'),(64,1,20.4661,'2022-09-30 15:03:08'),(65,3,11.4669,'2022-09-30 15:03:08'),(66,1,5.45041,'2022-09-30 15:03:18'),(67,2,23.6494,'2022-09-30 15:03:18'),(68,1,8.85319,'2022-09-30 15:03:28');
/*!40000 ALTER TABLE `normal_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','111111'),('echo','123456');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03 21:27:41
