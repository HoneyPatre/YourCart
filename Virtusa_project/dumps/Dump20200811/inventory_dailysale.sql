-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: inventory
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

--
-- Table structure for table `dailysale`
--

DROP TABLE IF EXISTS `dailysale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dailysale` (
  `ProductId` varchar(15) DEFAULT NULL,
  `ProductName` varchar(15) DEFAULT NULL,
  `DateOfSale` date DEFAULT NULL,
  `NoOfCartons` int DEFAULT NULL,
  `PricePerCarton` int DEFAULT NULL,
  `DistributorId` varchar(15) DEFAULT NULL,
  `Username` varchar(15) DEFAULT NULL,
  `IsVerified` tinyint(1) DEFAULT NULL,
  `TransactionId` varchar(15) DEFAULT NULL,
  UNIQUE KEY `TransactionId` (`TransactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dailysale`
--

LOCK TABLES `dailysale` WRITE;
/*!40000 ALTER TABLE `dailysale` DISABLE KEYS */;
INSERT INTO `dailysale` VALUES ('YCP003','ToothBrush','2020-08-10',1,100,'YCD002','YCM002',NULL,'TO001'),('YCP002','Detol Sanitizer','2020-08-07',20,300,'YCD002','YCM002',NULL,'TO002'),('YCP001','Alfanso Mangos','2020-08-09',18,500,'YCD001','YCM001',1,'TO003'),('YCP003','ToothBrush','2020-08-09',20,450,'YCD003','YCM001',1,'TO005'),('YCP004','Rice Kolam','2020-08-09',10,350,'YCD003','YCM001',1,'TO006'),('YCP001','Alfanso Mangos','2020-08-09',9,330,'YCD003','YCM001',1,'TO007'),('YCP001','Alfanso Mangos','2020-08-07',34,600,'YCD001','YCM001',1,'TO008'),('YCP002','Detol Sanitizer','2020-08-07',25,800,'YCD001','YCM001',1,'TO009'),('YCP003','ToothBrush','2020-08-07',15,600,'YCD002','YCM001',1,'TO010'),('YCP002','Detol Sanitizer','2020-08-10',90,200,'YCD002','YCM002',NULL,'TO012'),('YCP001','Alfanso Mangos','2020-08-07',34,600,'YCD001','YCM001',NULL,'TO013'),('YCP002','Detol Sanitizer','2020-08-07',25,800,'YCD001','YCM001',NULL,'TO014'),('YCP003','ToothBrush','2020-08-07',15,600,'YCD002','YCM001',NULL,'TO015'),('YCP004','Rice Kolam','2020-08-07',55,1550,'YCD002','YCM001',NULL,'TO016'),('YCP001','Alfanso Mangos','2020-08-01',3,600,'YCD001','YCM001',1,'TO017'),('YCP002','Detol Sanitizer','2020-08-01',5,800,'YCD001','YCM001',1,'TO018'),('YCP003','ToothBrush','2020-08-01',1,600,'YCD002','YCM001',1,'TO019'),('YCP004','Rice Kolam','2020-08-01',5,1550,'YCD002','YCM001',1,'TO020');
/*!40000 ALTER TABLE `dailysale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-11 11:15:01
