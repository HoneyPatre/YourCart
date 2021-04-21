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
-- Table structure for table `checkerinformation`
--

DROP TABLE IF EXISTS `checkerinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkerinformation` (
  `Username` varchar(15) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `Firstname` varchar(20) DEFAULT NULL,
  `Lastname` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(16) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkerinformation`
--

LOCK TABLES `checkerinformation` WRITE;
/*!40000 ALTER TABLE `checkerinformation` DISABLE KEYS */;
INSERT INTO `checkerinformation` VALUES ('YCC001','199905honey','Honey','Patre','honeypatre019@gmail.com','9123456789','Ameya Ashish-Nashik,MH.'),('YCC002','199905swara','Swara','Bhaskar','honeypatre1999@gmail.com','8446068600','Flat No 11 Ameya Ashish Apartment Nr Jogging Track'),('YCC003','199905rita','Rita','Richard','honeypatre1999@gmail.com','8446068777','Flat No 11 Ameya Ashish Apartment Nr Jogging Track');
/*!40000 ALTER TABLE `checkerinformation` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `dailystockfill`
--

DROP TABLE IF EXISTS `dailystockfill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dailystockfill` (
  `ProductId` varchar(15) DEFAULT NULL,
  `ProductName` varchar(15) DEFAULT NULL,
  `DateOfArrival` date DEFAULT NULL,
  `NoOfCartons` int DEFAULT NULL,
  `PricePerCarton` int DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `VendorId` varchar(15) DEFAULT NULL,
  `Username` varchar(15) DEFAULT NULL,
  `IsVerified` tinyint(1) DEFAULT NULL,
  `TransactionId` varchar(15) DEFAULT NULL,
  UNIQUE KEY `TransactionId` (`TransactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dailystockfill`
--

LOCK TABLES `dailystockfill` WRITE;
/*!40000 ALTER TABLE `dailystockfill` DISABLE KEYS */;
INSERT INTO `dailystockfill` VALUES ('YCP003','ToothBrush','2020-08-09',10,100,'2020-08-26','YCV003','YCM001',NULL,'TI004'),('YCP001','Alfanso Mangos','2020-08-09',70,560,'2020-08-27','YCV002','YCM001',NULL,'TI005'),('YCP002','Detol Sanitizer','2020-08-09',10,100,'2020-08-11','YCV003','YCM002',NULL,'TI006'),('YCP003','ToothBrush','2020-08-08',20,450,'2023-01-11','YCV002','YCM001',NULL,'TI007'),('YCP003','ToothBrush','2020-08-09',70,300,'2020-08-09','YCV003','YCM001',NULL,'TI008'),('YCP003','ToothBrush','2020-08-10',1,100,'2020-08-27','YCV002','YCM001',NULL,'TI009'),('YCP001','Alfanso Mangos','2020-08-02',10,390,'2020-08-17','YCV001','YCM001',1,'TI001'),('YCP001','Alfanso Mangos','2020-08-02',90,780,'2020-08-20','YCV002','YCM001',1,'TI002'),('YCP004','Rice Kolam','2020-08-10',23,200,'2021-08-10','YCV003','YCM001',NULL,'TI010'),('YCP002','Detol Sanitizer','2020-08-10',200,500,'2020-08-31','YCV002','YCM001',NULL,'TI011'),('YCP001','Alfanso Mangos','2020-08-07',10,700,'2020-08-20','YCV001','YCM001',NULL,'TI012'),('YCP002','Detol Sanitizer','2020-08-07',20,900,'2021-08-01','YCV001','YCM001',NULL,'TI013'),('YCP003','ToothBrush','2020-08-07',10,500,'2022-08-01','YCV002','YCM001',NULL,'TI014'),('YCP004','Rice Kolam','2020-08-07',50,1500,'2020-09-01','YCV002','YCM001',NULL,'TI015'),('YCP001','Alfanso Mangos','2020-08-11',20,670,'2020-08-13','YCV003','YCM001',NULL,'TI016'),('YCP004','Rice Kolam','2020-08-11',5,300,'2020-09-03','YCV003','YCM001',NULL,'TI017'),('YCP005','Haaji Sweets','2020-08-11',50,1000,'2020-08-24','YCV003','YCM005',NULL,'TI018'),('YCP001','Alfanso Mangos','2020-08-01',50,7000,'2020-08-20','YCV003','YCM001',1,'TI019'),('YCP002','Detol Sanitizer','2020-08-01',40,9000,'2021-08-01','YCV001','YCM001',1,'TI020'),('YCP003','ToothBrush','2020-08-01',40,8000,'2022-08-01','YCV002','YCM001',1,'TI021'),('YCP004','Rice Kolam','2020-08-01',60,1000,'2020-09-01','YCV002','YCM001',1,'TI022');
/*!40000 ALTER TABLE `dailystockfill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dailystockremaining`
--

DROP TABLE IF EXISTS `dailystockremaining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dailystockremaining` (
  `ProductId` varchar(15) DEFAULT NULL,
  `ProductName` varchar(15) DEFAULT NULL,
  `DateOfConsideration` date DEFAULT NULL,
  `NoOfcartons` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dailystockremaining`
--

LOCK TABLES `dailystockremaining` WRITE;
/*!40000 ALTER TABLE `dailystockremaining` DISABLE KEYS */;
INSERT INTO `dailystockremaining` VALUES ('YCP001','Alfanso Mangos','2020-08-01',40),('YCP002','Detol Sanitizer','2020-08-01',10),('YCP003','ToothBrush','2020-08-01',16),('YCP004','Rice Kolam','2020-08-01',0),('YCP001','Alfanso Mangos','2020-08-02',50),('YCP002','Detol Sanitizer','2020-08-02',35),('YCP003','ToothBrush','2020-08-02',16),('YCP004','Rice Kolam','2020-08-02',0),('YCP001','Alfanso Mangos','2020-08-03',80),('YCP002','Detol Sanitizer','2020-08-03',80),('YCP003','ToothBrush','2020-08-03',16),('YCP004','Rice Kolam','2020-08-03',0),('YCP001','Alfanso Mangos','2020-08-04',55),('YCP002','Detol Sanitizer','2020-08-04',87),('YCP003','ToothBrush','2020-08-04',16),('YCP004','Rice Kolam','2020-08-04',0),('YCP001','Alfanso Mangos','2020-08-05',65),('YCP002','Detol Sanitizer','2020-08-05',57),('YCP003','ToothBrush','2020-08-05',16),('YCP004','Rice Kolam','2020-08-05',0),('YCP001','Alfanso Mangos','2020-08-06',20),('YCP002','Detol Sanitizer','2020-08-06',56),('YCP003','ToothBrush','2020-08-06',16),('YCP004','Rice Kolam','2020-08-06',0),('YCP001','Alfanso Mangos','2020-08-07',98),('YCP002','Detol Sanitizer','2020-08-07',196),('YCP003','ToothBrush','2020-08-07',16),('YCP004','Rice Kolam','2020-08-07',0),('YCP001','Alfanso Mangos','2020-08-08',77),('YCP002','Detol Sanitizer','2020-08-08',56),('YCP003','ToothBrush','2020-08-08',26),('YCP004','Rice Kolam','2020-08-08',50),('YCP001','Alfanso Mangos','2020-08-09',47),('YCP002','Detol Sanitizer','2020-08-09',7),('YCP003','ToothBrush','2020-08-09',65),('YCP004','Rice Kolam','2020-08-09',35),('YCP001','Alfanso Mangos','2020-08-10',74),('YCP002','Detol Sanitizer','2020-08-10',80),('YCP003','ToothBrush','2020-08-10',40),('YCP004','Rice Kolam','2020-08-10',8),('YCP001','Alfanso Mangos','2020-08-11',152),('YCP002','Detol Sanitizer','2020-08-11',105),('YCP003','ToothBrush','2020-08-11',99),('YCP004','Rice Kolam','2020-08-11',68),('YCP005','Haaji Sweets','2020-08-11',50);
/*!40000 ALTER TABLE `dailystockremaining` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damagegoods`
--

DROP TABLE IF EXISTS `damagegoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damagegoods` (
  `ProductId` varchar(15) DEFAULT NULL,
  `TransactionId` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damagegoods`
--

LOCK TABLES `damagegoods` WRITE;
/*!40000 ALTER TABLE `damagegoods` DISABLE KEYS */;
INSERT INTO `damagegoods` VALUES ('YCP003','TO015'),('YCP002','TI011'),('YCP002','TO002');
/*!40000 ALTER TABLE `damagegoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributorinformation`
--

DROP TABLE IF EXISTS `distributorinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributorinformation` (
  `DistributorId` varchar(15) DEFAULT NULL,
  `DistributorFirstName` varchar(15) DEFAULT NULL,
  `DistributorLastname` varchar(15) DEFAULT NULL,
  `DistributorEmail` varchar(50) DEFAULT NULL,
  `DistributorPhone` varchar(16) DEFAULT NULL,
  `DistributorAddress` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributorinformation`
--

LOCK TABLES `distributorinformation` WRITE;
/*!40000 ALTER TABLE `distributorinformation` DISABLE KEYS */;
INSERT INTO `distributorinformation` VALUES ('YCD001','Aryan','Kapoor','aryan@kpstores.com','9876587654','KP Stores, RedTower Shop-79, Kishan Nagar, Pune'),('YCD002','Siddhesh','Singh','sidsingh@singhretailers.com','9856587654','Singh Retailers, Prasad Shop-79, Prem Nagar, Nagpur'),('YCD003','Honey','Patre','honeypatre019@gmail.com','9875670987','Rutej Park, Pune');
/*!40000 ALTER TABLE `distributorinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `makerinformation`
--

DROP TABLE IF EXISTS `makerinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `makerinformation` (
  `Username` varchar(15) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `Firstname` varchar(20) DEFAULT NULL,
  `Lastname` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(16) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makerinformation`
--

LOCK TABLES `makerinformation` WRITE;
/*!40000 ALTER TABLE `makerinformation` DISABLE KEYS */;
INSERT INTO `makerinformation` VALUES ('YCM001','199905honey','Honey','Patre','honeypatre019@gmail.com','8446068604','Rutej Park-407, Near D. Y. Patil, Akurdi, Pune'),('YCM002','199905suzi','Suzi','Roy','suziroy@gmail.com','9876543210','Rutej Park-407, Near D. Y. Patil, Akurdi, Pune'),('YCM003','199905harrika','Harrika','Barapatre','honeypatre019@gmail.com','8446068601','Rutej Park , 407, near D. Y. Patil , Akurdi, Pune');
/*!40000 ALTER TABLE `makerinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdetail`
--

DROP TABLE IF EXISTS `productdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productdetail` (
  `ProductID` varchar(15) NOT NULL,
  `ProductName` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetail`
--

LOCK TABLES `productdetail` WRITE;
/*!40000 ALTER TABLE `productdetail` DISABLE KEYS */;
INSERT INTO `productdetail` VALUES ('YCP001','Alfanso Mangos'),('YCP002','Detol Sanitizer'),('YCP003','ToothBrush'),('YCP004','Rice Kolam'),('YCP005','Haaji Sweets');
/*!40000 ALTER TABLE `productdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorinformation`
--

DROP TABLE IF EXISTS `vendorinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendorinformation` (
  `VendorId` varchar(15) NOT NULL,
  `VendorFirstName` varchar(15) DEFAULT NULL,
  `VendorLastname` varchar(15) DEFAULT NULL,
  `VendorEmail` varchar(50) DEFAULT NULL,
  `VendorPhone` varchar(16) DEFAULT NULL,
  `VendorAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorinformation`
--

LOCK TABLES `vendorinformation` WRITE;
/*!40000 ALTER TABLE `vendorinformation` DISABLE KEYS */;
INSERT INTO `vendorinformation` VALUES ('YCV001','Gajanan','Patre','gajanan@patreandsons.com','9876545678','Old building-23, Thane, Mumbai'),('YCV002','Bhawana','Khawas','bhawana@khenterprises.com','9876587657','Bardi-Building-786,Ravi Nagar, Nagpur'),('YCV003','Honey','Patre','honeypatre019@gmail.com','9123456787','Rutej Park, Akurdi, Pune');
/*!40000 ALTER TABLE `vendorinformation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-11 11:21:38
