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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-11 11:15:03
