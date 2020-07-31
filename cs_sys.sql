-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: cs_sys
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `cs_goods`
--

DROP TABLE IF EXISTS `cs_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_goods` (
  `goods_id` int(5) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(64) NOT NULL,
  `goods_inventory` int(11) NOT NULL,
  `goods_price` double NOT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_goods`
--

LOCK TABLES `cs_goods` WRITE;
/*!40000 ALTER TABLE `cs_goods` DISABLE KEYS */;
INSERT INTO `cs_goods` VALUES (1,'佳洁士牙膏',50,39.99),(2,'美丽雅 抹布3条装',40,17.9),(3,'阿迪达斯 活力去屑套装',50,62.9),(4,'清扬 那是去屑洗发水',50,58.9),(5,'Ryoe 黑吕洗发水',33,68.9),(6,'多芬 男士护理强韧洗发水',44,39.9),(7,'VS 沙宣洗发水男士',80,49.9),(8,'潘婷 氨基酸洗发露',32,44.8),(9,'哈曼卡顿 Aura Studio3',7,1699),(10,'微星 34英寸144Hz显示器',10,2799),(11,'Beats Solo3 Wireless',10,1499),(12,'Alienware 24.5英寸IPS显示器',10,3899),(13,'绿联 Typec扩展坞',20,128),(14,'丹拿 Music7',10,7980),(15,'Marshall Stanmore II',10,3299),(16,'B&W Zeppelin Wireless',10,5980),(17,'Monster Guardians T恤',200,159),(18,'Converse Chunk70经典帆布鞋',200,569),(19,'李宁 运动裤男',200,89),(20,'BD 山岸秀匡联名T恤',200,184),(21,'Nike AJ1 Mid 黑绿脚趾',200,969),(22,'muscledog 夏季宽松T恤',200,138),(23,'Reebok 运动跑鞋',200,839),(24,'Timberland 黄靴户外防水鞋',200,1490),(25,'家柳螺狮粉 300g*7',200,53.9),(26,'三顿半 精品速溶咖啡18颗*2g',200,89),(27,'自然派 牛肉脯100g*2',200,29.9),(28,'双汇 王中王火腿肠270g*2',200,19.8),(29,'法国黑桃A 香槟白金',30,10800),(30,'豆本豆 豆奶250ml*24',200,46),(31,'illy 黑咖啡深培阿拉比卡咖啡豆',200,169),(32,'屈臣氏 苏打水330ml*6',200,37),(42,'Convens',65,555),(44,'test',0,12),(45,'水杯Test',66,16.69);
/*!40000 ALTER TABLE `cs_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_order`
--

DROP TABLE IF EXISTS `cs_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_order` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_date` varchar(64) NOT NULL,
  `user_id` int(5) NOT NULL,
  `order_total` double NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_order`
--

LOCK TABLES `cs_order` WRITE;
/*!40000 ALTER TABLE `cs_order` DISABLE KEYS */;
INSERT INTO `cs_order` VALUES (3,'2020-1-1',2,35.8),(4,'2020-3-12',2,2838.99),(5,'2020-3-15',3,2042.2),(6,'2020-3-20',3,11530),(7,'2020-4-5',3,191),(10,'2020-04-14 11:04:14',2,380.3),(11,'2020-04-14 12:12:56',2,16857),(15,'2020-04-14 19:05:44',2,394.48),(17,'2020-04-20 16:45:08',2,137.8),(19,'2020-04-20 18:01:27',2,5097),(20,'2020-05-07 11:17:20',7,137.8),(21,'2020-05-07 11:22:38',7,224),(22,'2020-05-07 22:19:55',7,344.5),(24,'2020-05-07 22:28:19',7,344.5);
/*!40000 ALTER TABLE `cs_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_orderitem`
--

DROP TABLE IF EXISTS `cs_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_orderitem` (
  `orderItem_id` int(5) NOT NULL AUTO_INCREMENT,
  `orderItem_quantity` int(5) NOT NULL,
  `orderItem_total` double NOT NULL,
  `goods_id` int(5) NOT NULL,
  `order_id` int(20) NOT NULL,
  PRIMARY KEY (`orderItem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_orderitem`
--

LOCK TABLES `cs_orderitem` WRITE;
/*!40000 ALTER TABLE `cs_orderitem` DISABLE KEYS */;
INSERT INTO `cs_orderitem` VALUES (2,2,35.8,2,3),(3,1,2799,10,4),(4,1,39.99,1,4),(5,2,89.6,8,5),(6,2,125.8,3,5),(7,1,58.9,4,5),(8,1,1699,9,5),(9,1,68.9,5,5),(10,2,2998,11,6),(11,1,7980,14,6),(12,3,552,20,6),(13,2,92,30,7),(14,5,99,28,7),(15,2,35.8,2,10),(16,5,344.5,5,10),(17,2,368,20,11),(18,11,16489,11,11),(19,3,176.7,4,15),(20,2,137.8,5,15),(21,2,79.98,1,15),(22,2,137.8,5,17),(23,3,206.70000000000002,5,16),(24,3,134.39999999999998,8,18),(25,3,5097,9,19),(26,2,137.8,5,20),(27,5,224,8,21),(28,5,344.5,5,22),(29,6,239.39999999999998,6,23),(30,5,344.5,5,24);
/*!40000 ALTER TABLE `cs_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_user`
--

DROP TABLE IF EXISTS `cs_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_user` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) NOT NULL,
  `user_password` char(32) NOT NULL,
  `user_dept` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_user`
--

LOCK TABLES `cs_user` WRITE;
/*!40000 ALTER TABLE `cs_user` DISABLE KEYS */;
INSERT INTO `cs_user` VALUES (2,'ppp','234','owner'),(3,'www','123','owner'),(5,'yyy','123','user'),(7,'admin','123','admin'),(8,'pwb','123','owner');
/*!40000 ALTER TABLE `cs_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-31 19:13:40
