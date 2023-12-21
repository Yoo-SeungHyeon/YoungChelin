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
-- Table structure for table `restaurant_evaluate`
--

DROP TABLE IF EXISTS `restaurant_evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_evaluate` (
  `menu_id` int DEFAULT NULL,
  `cleaning` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `plating` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `restaurant_id` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `taste` varchar(255) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `couple` varchar(255) DEFAULT NULL,
  `drink` varchar(255) DEFAULT NULL,
  `family` varchar(255) DEFAULT NULL,
  `friend` varchar(255) DEFAULT NULL,
  `solo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_evaluate`
--

LOCK TABLES `restaurant_evaluate` WRITE;
/*!40000 ALTER TABLE `restaurant_evaluate` DISABLE KEYS */;
INSERT INTO `restaurant_evaluate` VALUES (1,'1','hamburger','2','3','1','1','2',1,'0',NULL,'2',NULL,NULL,NULL),(3,'1','fork','2','3','1','1','2',2,NULL,'1',NULL,NULL,NULL,NULL),(2,'1','pizza','3','1','2','1','1',3,NULL,'1',NULL,'3','4','asasas');
/*!40000 ALTER TABLE `restaurant_evaluate` ENABLE KEYS */;
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
