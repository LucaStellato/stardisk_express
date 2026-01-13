CREATE DATABASE  IF NOT EXISTS `stardisk_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `stardisk_db`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: stardisk_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `record_label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Nas','','Mass Appeal Records'),(2,'MF DOOM','','Metal Face Records'),(3,'J Dilla','','Stones Throw Records'),(4,'Kanye West','','G.O.O.D. Music'),(5,'Kendrick Lamar','','TDE'),(6,'Lauryn Hill',NULL,'Columbia Records'),(7,'Tupac',NULL,'Death Row Records'),(8,'The Notorious B.I.G.',NULL,'Bad Boy Records'),(9,'Frank Ocean','THE GOAT','Boys Don\'t Cry'),(10,'Stevie Wonder',NULL,'Motown Records'),(11,'Beyoncé',NULL,'Parkwood Entertainment'),(12,'Sade',NULL,'Epic Records'),(13,'Usher',NULL,'LaFace Records'),(14,'Marvin Gaye',NULL,'Motown Records'),(15,'D\'Angelo',NULL,'Universal Music'),(16,'Childish Gambino',NULL,'RCA Records'),(17,'Miles Davis',NULL,'Columbia Records'),(18,'John Coltrane',NULL,'Impulse Records'),(19,'Bill Evans',NULL,'Verve Records'),(20,'The Dave Brubeck Quartet',NULL,'Columbia Records'),(21,'Stan Getz, Joao Gilberto',NULL,'Verve Records'),(22,'Bill Evans Trio',NULL,'Riverside Records');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Hip-hop'),(2,'R&b'),(3,'Soul'),(4,'Jazz');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mail` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `free_shipment` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_genres`
--

DROP TABLE IF EXISTS `product_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_genres` (
  `id_product` bigint NOT NULL,
  `id_genre` int NOT NULL,
  PRIMARY KEY (`id_product`,`id_genre`),
  KEY `fk_genre_id` (`id_genre`),
  CONSTRAINT `fk_genre_id` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_genre_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_genres`
--

LOCK TABLES `product_genres` WRITE;
/*!40000 ALTER TABLE `product_genres` DISABLE KEYS */;
INSERT INTO `product_genres` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,3),(17,3),(18,3),(19,3),(20,4),(21,4),(22,4),(23,4),(24,4),(25,4);
/*!40000 ALTER TABLE `product_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_orders`
--

DROP TABLE IF EXISTS `product_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_orders` (
  `id_product` bigint NOT NULL,
  `id_orders` bigint NOT NULL,
  `products_amount` int DEFAULT '0',
  PRIMARY KEY (`id_product`,`id_orders`),
  KEY `fk_pivot_order` (`id_orders`),
  CONSTRAINT `fk_pivot_order` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pivot_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orders`
--

LOCK TABLES `product_orders` WRITE;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `full_price` decimal(10,2) NOT NULL,
  `discount` smallint DEFAULT '0',
  `amount` int DEFAULT '0',
  `img_url` varchar(255) DEFAULT NULL,
  `category` varchar(10) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `rpm` smallint DEFAULT NULL,
  `release_year` year DEFAULT NULL,
  `description` text,
  `id_artist` bigint DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `fk_product_artist` (`id_artist`),
  CONSTRAINT `fk_product_artist` FOREIGN KEY (`id_artist`) REFERENCES `artists` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Illmatic','illmatic',35.00,10,20,'https://i.ebayimg.com/images/g/HgcAAOSwsNFksbxL/s-l1200.jpg','vinyl',NULL,'Black',33,1994,'',1,'2026-01-13 10:34:36'),(2,'Madvillany','madvillany',40.00,0,15,'https://f4.bcbits.com/img/a1024330960_16.jpg','vinyl',NULL,'Silver',33,2004,'',2,'2026-01-13 10:34:36'),(3,'Donuts','donuts',30.00,5,10,'https://www.stonesthrow.com/app/uploads/2011/02/Dilla-Donuts-smile-2021-1024x1024.jpg','vinyl',NULL,'Blue',33,2006,'',3,'2026-01-13 10:34:36'),(4,'The College Dropout','the-college-dropout',50.00,0,12,'https://m.media-amazon.com/images/I/91CDaas05ZL._UF1000,1000_QL80_.jpg','vinyl',NULL,'Black',33,2004,'',4,'2026-01-13 10:34:36'),(5,'To Pimp a Butterfly','to-pimp-a-butterfly',40.00,0,25,'https://www.rollingstone.com/wp-content/uploads/2024/06/Kendrick-Lamar-To-Pimp-a-Butterfly.jpg?w=1000','vinyl',NULL,'Black',33,2015,'',5,'2026-01-13 10:34:36'),(6,'My Beautiful Dark Twisted Fantasy','my-beautiful-dark-twisted-fantasy',45.00,15,8,'https://hiphop-n-more.com/wp-content/uploads/2010/10/kanye-west-my-beautiful-dark-twisted-fantasy-cover.jpg','vinyl',NULL,'White',33,2010,'',4,'2026-01-13 10:34:36'),(7,'The Miseducation of Lauryn Hill','the-miseducation-of-lauryn-hill',40.00,0,10,'https://m.media-amazon.com/images/I/91RwRgo+-gL._UF1000,1000_QL80_.jpg','vinyl',NULL,'Black',33,1998,'',6,'2026-01-13 10:34:36'),(8,'All Eyez on Me','all-eyez-on-me',34.00,0,5,'https://m.media-amazon.com/images/I/61+qKiRPXlL._UF894,1000_QL80_.jpg','vinyl',NULL,'Black',33,1996,'',7,'2026-01-13 10:34:36'),(9,'Ready to Die','ready-to-die',29.00,5,14,'https://i.scdn.co/image/ab67616d0000b2730f51e29700232d57fe8a0830','vinyl',NULL,'Black',33,1994,'',8,'2026-01-13 10:34:36'),(10,'Blonde','blonde',120.00,0,18,'https://pixelframe.design/wp-content/uploads/2024/10/frank-ocean-blonde-album-cover_Blank_no-text.jpg','vinyl',NULL,'Black',33,2016,'',9,'2026-01-13 10:34:36'),(11,'Channel Orange','channel-orange',50.00,0,9,'https://m.media-amazon.com/images/I/51Mp2uc8UFL._UF1000,1000_QL80_.jpg','vinyl',NULL,'Black',33,2012,'',9,'2026-01-13 10:34:36'),(12,'Songs in the Key of Life','songs-in-the-key-of-life',36.00,0,11,'https://storage.highresaudio.com/library/bild/c_190000/193471/field4.jpg','vinyl',NULL,'Blue',33,1976,'',10,'2026-01-13 10:34:36'),(13,'Lemonade','lemonade',28.00,0,7,'https://i.ebayimg.com/images/g/47MAAOSwsgRksbzo/s-l1200.jpg','vinyl',NULL,'Black',33,2016,'',11,'2026-01-13 10:34:36'),(14,'Love (deluxe)','love-deluxe',29.00,0,13,'https://cdn-p.smehost.net/sites/6d143dd0ac344256a22b9076a71775e5/wp-content/uploads/1992/10/Love-Deluxe-1024x1024.jpg','vinyl',NULL,'Black',33,1992,NULL,12,'2026-01-13 10:52:50'),(15,'Confessions','confessions',30.00,10,20,'https://static.qobuz.com/images/covers/77/61/0888880746177_600.jpg','vinyl',NULL,'Black',33,2004,NULL,13,'2026-01-13 10:52:50'),(16,'What\'s Going On','whats-going-on',25.00,5,15,'https://altrockchick.com/wp-content/uploads/2022/05/J22132000000000-00-600x600-1.jpg?w=640','vinyl',NULL,'Black',33,1971,NULL,14,'2026-01-13 10:52:50'),(17,'Innervisions','innervisions',20.00,0,13,'https://dm3v96wjcnps9.cloudfront.net/icpn/00602537070800/00602537070800-cover-zoom.jpg','vinyl',NULL,'Black',33,1973,NULL,10,'2026-01-13 10:52:50'),(18,'Voodoo','voodoo',22.00,5,24,'https://m.media-amazon.com/images/I/81n49CDOEML._UF1000,1000_QL80_.jpg','vinyl',NULL,'Black',33,2000,NULL,15,'2026-01-13 10:52:50'),(19,'\"Awaken, my Love!\"','awaken-my-love',34.00,10,25,'https://m.media-amazon.com/images/I/81OJBDOp21L._UF1000,1000_QL80_.jpg','vinyl',NULL,'Black',33,2016,NULL,16,'2026-01-13 10:52:50'),(20,'Kind of Blue','kind-of-blue',15.00,0,18,'https://storage.highresaudio.com/library/bild/c_330000/336835/field4.jpg','vinyl',NULL,'Blue',33,1959,NULL,17,'2026-01-13 10:52:50'),(21,'A Love Supreme','a-love-supreme',17.00,10,10,'https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/e5/24/aa/e524aacd-467b-66f3-8931-0fcd6750a4b9/08UMGIM07914.rgb.jpg/600x600bf-60.jpg','vinyl',NULL,'Black',33,1965,NULL,18,'2026-01-13 10:52:50'),(22,'Everybody Digs','everybody-digs',29.00,5,12,'https://londonjazzcollector.wordpress.com/wp-content/uploads/2012/03/everybody-digs-bill-evans-uk-riverside-cover-1920px-ljc.jpg','vinyl',NULL,'Black',33,1959,NULL,19,'2026-01-13 10:52:50'),(23,'Timeout','timeout',27.00,15,7,'https://storage.highresaudio.com/library/bild/c_350000/350075/field4.jpg','vinyl',NULL,'Black',33,1959,NULL,20,'2026-01-13 10:52:50'),(24,'Getz/Gilberto','getz-gilberto',26.00,0,26,'https://storage.highresaudio.com/2019/10/30/boiktu-getzgilber-master.jpg','vinyl',NULL,'Black',33,1964,NULL,21,'2026-01-13 10:52:50'),(25,'A Waltz for Debby','a-waltz-for-debby',19.00,5,5,'https://m.media-amazon.com/images/I/51TUnQFH+VL._UF1000,1000_QL80_.jpg','vinyl',NULL,'Black',33,1961,NULL,22,'2026-01-13 10:52:50'),(26,'Cambridge Audio Alva TT','cambridge-audio-alva-tt',199.00,1,13,'https://www.smarthouse.com.au/wp-content/uploads/2019/05/Alva_TT_Top_Angle-1024x682.png','turntable','Cambridge','Black',NULL,NULL,'High-resolution aptX streaming provides up to 24-bit/48kHz sound quality through equally capable Bluetooth speakers, headphones and amplifiers.',NULL,'2026-01-13 12:18:19'),(27,'Audio-Technica AT-LP70XBT','audio-technica-at-lp70xbt',349.00,1,2,'https://www.audio-technica.com/media/catalog/product/cache/c673bc7fec8808a80d23918742b3f339/a/t/at-lp70xbt_bs_01_2.png','turntable','Audio-Technica','Black',NULL,NULL,'Built-in switchable phono/line pre-amplifier, Compatible with the high-quality Qualcomm® aptX™ Adaptive audio codec, Fully automatic belt-drive turntable operation with two speeds: 33-1/3, 45 RPM, High-fidelity audio with Bluetooth wireless technology, Stylish three-piece chassis construction dampens resonance for improved sound quality',NULL,'2026-01-13 12:18:19'),(28,'Audio-Technica AT-LPW40WN','audio-technica-at-lpw40wn',385.00,1,6,'https://recordsoundpro.com/wp-content/uploads/2020/02/Audio-Technica-AT-LPW40WN.png','turntable','Audio-Technica','Wood',NULL,NULL,'Turntable, Dual RCA (male) to dual RCA (male) stereo cable, 45 RPM adapter, rubber mat, and removable hinged dust cover',NULL,'2026-01-13 12:18:19');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-13 17:17:44
