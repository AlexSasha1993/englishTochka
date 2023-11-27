-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: english_test
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` int(12) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` int(7) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `label` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Спецкурс1',7900,'Описание спецкурса номер один. Lorem ipsum dolor sit amet','hit'),(2,'Спецкурс2',8900,'Описание спецкурса номер два. consectetur adipiscing elit','popular'),(3,'Спецкурс3',9900,'Описание спецкурса номер три. sed do eiusmod tempor incididunt ut','popular'),(4,'Спецкурс4',8900,'Описание спецкурса номер четыре. labore et dolore magna aliqua','popular'),(5,'Спецкурс5',9900,'Описание спецкурса номер пять. Ut enim ad minim veniam','new'),(6,'Спецкурс6',7900,'Описание спецкурса номер шесть. quis nostrud exercitation ullamco laboris',NULL),(7,'Спецкурс7',7900,'Описание спецкурса номер семь. nisi ut aliquip ex ea commodo consequat',NULL),(8,'Спецкурс8',9900,'Описание спецкурса номер восемь. Duis aute irure dolor in reprehenderit',NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo_prices`
--

DROP TABLE IF EXISTS `promo_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promo_id` varchar(45) DEFAULT NULL,
  `order` int(1) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `price` int(7) DEFAULT NULL,
  `oldprice` int(7) DEFAULT NULL,
  `months` int(2) DEFAULT NULL,
  `prepay` int(7) DEFAULT NULL,
  `link_ru` varchar(255) DEFAULT NULL,
  `link_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo_prices`
--

LOCK TABLES `promo_prices` WRITE;
/*!40000 ALTER TABLE `promo_prices` DISABLE KEYS */;
INSERT INTO `promo_prices` VALUES (1,'test',1,'Один курс',10900,21900,2,900,'http://example.com/pay/ru/1','http://example.com/pay/en/1'),(2,'test',2,'Два курса',21900,48900,4,900,'http://example.com/pay/ru/2','http://example.com/pay/en/2'),(3,'test',3,'Три курса',28900,74900,6,900,'http://example.com/pay/ru/3','http://example.com/pay/en/3'),(4,'test',4,'Пять курсов',44900,124900,10,900,'http://example.com/pay/ru/4','http://example.com/pay/en/4');
/*!40000 ALTER TABLE `promo_prices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18 17:34:28
