-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: 0.0.0.0    Database: young_cheline
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
-- Table structure for table `taste`
--

DROP TABLE IF EXISTS `taste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taste` (
  `menu_id` int NOT NULL,
  `time` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `taste` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_id`,`time`,`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taste`
--

LOCK TABLES `taste` WRITE;
/*!40000 ALTER TABLE `taste` DISABLE KEYS */;
INSERT INTO `taste` VALUES (1,'2023-11-20T23:45:54.345006','ehddbs4521','1'),(1,'2023-11-20T23:46:38.903474','ehddbs4521','1'),(1,'2023-11-21T21:32:18.158083','ehddbs4521','3'),(1,'2023-11-21T21:32:56.639873','ehddbs4521','3'),(2,'2023-11-20T23:45:54.357311','ehddbs4521','2'),(2,'2023-11-20T23:46:38.940567','ehddbs4521','2'),(3,'2023-11-20T23:45:54.362989','ehddbs4521','2'),(3,'2023-11-20T23:46:38.943148','ehddbs4521','2'),(3,'2023-11-21T14:23:36.912363','ehddbs4521','2'),(3,'2023-11-21T14:27:43.405088','ehddbs4521',NULL),(3,'2023-11-21T19:36:23.250295','ehddbs4521',NULL);
/*!40000 ALTER TABLE `taste` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 21:27:42
