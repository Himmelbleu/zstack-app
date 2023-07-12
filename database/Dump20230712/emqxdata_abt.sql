-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: emqxdata
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
-- Table structure for table `abt`
--

DROP TABLE IF EXISTS `abt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '状态，如异常解除、传感器异常、强制性解除',
  `date` timestamp NULL DEFAULT NULL COMMENT '日期',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '中断发送的数据',
  `led_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '灯的状态',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '姓名',
  `sno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abt`
--

LOCK TABLES `abt` WRITE;
/*!40000 ALTER TABLE `abt` DISABLE KEYS */;
INSERT INTO `abt` VALUES (261,'红外对射传感器正常','2023-06-14 07:13:33','没有触发红外对射传感器','off','Himmelbleu','42020xxx'),(262,'强制解除红外对射传感器异常','2023-06-15 07:46:38','interrupt','off','Himmelbleu','42020xxx'),(263,'红外对射传感器异常','2023-06-15 07:47:13','interrupt','off','Himmelbleu','42020xxx'),(264,'红外对射传感器异常','2023-06-15 07:47:28','interrupt','off','Himmelbleu','42020xxx'),(265,'红外对射传感器异常','2023-06-15 07:47:32','interrupt','off','Himmelbleu','42020xxx'),(266,'红外对射传感器异常','2023-06-15 07:47:36','interrupt','off','Himmelbleu','42020xxx'),(267,'红外对射传感器异常','2023-06-15 07:47:40','interrupt','off','Himmelbleu','42020xxx'),(268,'红外对射传感器异常','2023-06-15 07:47:44','interrupt','off','Himmelbleu','42020xxx'),(269,'红外对射传感器异常','2023-06-15 07:47:48','interrupt','on','Himmelbleu','42020xxx'),(270,'红外对射传感器异常','2023-06-15 07:47:52','interrupt','on','Himmelbleu','42020xxx'),(271,'红外对射传感器异常','2023-06-15 07:47:56','interrupt','on','Himmelbleu','42020xxx'),(272,'红外对射传感器异常','2023-06-15 07:48:00','interrupt','on','Himmelbleu','42020xxx'),(273,'红外对射传感器异常','2023-06-15 07:48:04','interrupt','on','Himmelbleu','42020xxx'),(274,'红外对射传感器异常','2023-06-15 07:48:08','interrupt','on','Himmelbleu','42020xxx'),(275,'红外对射传感器异常','2023-06-25 08:39:44','<re.Match object; span=(150, 159), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(276,'红外对射传感器异常','2023-06-25 08:39:51','<re.Match object; span=(0, 9), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(277,'红外对射传感器异常','2023-06-25 08:40:05','<re.Match object; span=(145, 154), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(278,'红外对射传感器异常','2023-06-25 08:40:12','<re.Match object; span=(0, 9), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(279,'红外对射传感器异常','2023-06-25 08:40:19','<re.Match object; span=(115, 124), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(280,'红外对射传感器异常','2023-06-25 08:40:26','<re.Match object; span=(0, 9), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(281,'红外对射传感器正常','2023-06-25 08:41:44','<re.Match object; span=(48, 57), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(282,'红外对射传感器异常','2023-06-25 08:41:58','<re.Match object; span=(0, 9), match=\'interrupt\'>','no','Himmelbleu','42020xxx'),(283,'强制解除红外对射传感器异常','2023-06-25 08:42:20','<re.Match object; span=(72, 81), match=\'interrupt\'>','no','Himmelbleu','42020xxx'),(284,'解除红外对射传感器异常','2023-06-25 08:47:36','<re.Match object; span=(92, 101), match=\'interrupt\'>','no','Himmelbleu','42020xxx'),(285,'红外对射传感器正常','2023-06-25 08:47:43','<re.Match object; span=(0, 9), match=\'interrupt\'>','no','Himmelbleu','42020xxx'),(286,'红外对射传感器异常','2023-06-25 08:55:21','<re.Match object; span=(0, 9), match=\'interrupt\'>','no','Himmelbleu','42020xxx'),(287,'红外对射传感器异常','2023-06-25 08:55:35','<re.Match object; span=(48, 57), match=\'interrupt\'>','no','Himmelbleu','42020xxx'),(288,'解除红外对射传感器异常','2023-06-25 09:02:01','<re.Match object; span=(70, 79), match=\'interrupt\'>','no','Himmelbleu','42020xxx'),(289,'红外对射传感器异常','2023-06-25 09:02:15','<re.Match object; span=(0, 9), match=\'interrupt\'>','no','Himmelbleu','42020xxx'),(290,'解除红外对射传感器异常','2023-06-25 09:39:30','<re.Match object; span=(66, 75), match=\'interrupt\'>','no','Himmelbleu','42020xxx'),(291,'红外对射传感器正常','2023-06-25 09:41:37','<re.Match object; span=(116, 125), match=\'interrupt\'>','no','Himmelbleu','42020xxx'),(292,'红外对射传感器异常','2023-06-25 09:41:51','<re.Match object; span=(21, 30), match=\'interrupt\'>','on','Himmelbleu','42020xxx'),(293,'红外对射传感器异常','2023-06-25 09:48:04','<re.Match object; span=(66, 75), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(294,'红外对射传感器异常','2023-06-25 09:48:11','<re.Match object; span=(23, 32), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(295,'红外对射传感器异常','2023-06-25 09:48:32','<re.Match object; span=(0, 9), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(296,'红外对射传感器异常','2023-06-25 09:48:39','<re.Match object; span=(191, 200), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(297,'红外对射传感器异常','2023-06-25 09:48:46','<re.Match object; span=(0, 9), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(298,'强制解除红外对射传感器异常','2023-06-25 09:48:53','<re.Match object; span=(0, 9), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(299,'解除红外对射传感器异常','2023-06-25 09:50:10','<re.Match object; span=(0, 9), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(300,'强制解除红外对射传感器异常','2023-06-25 09:50:17','<re.Match object; span=(38, 47), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(301,'解除红外对射传感器异常','2023-06-25 09:52:24','<re.Match object; span=(156, 165), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(302,'红外对射传感器正常','2023-06-25 09:52:31','<re.Match object; span=(22, 31), match=\'interrupt\'>','off','Himmelbleu','42020xxx'),(303,'红外对射传感器异常','2023-06-25 09:52:38','<re.Match object; span=(47, 56), match=\'interrupt\'>','off','Himmelbleu','42020xxx');
/*!40000 ALTER TABLE `abt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-12 17:54:13
