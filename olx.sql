-- MySQL dump 10.13  Distrib 5.5.3-m3, for Win32 (x86)
--
-- Host: localhost    Database: olx
-- ------------------------------------------------------
-- Server version	5.5.3-m3-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin','admin'),('admin2@gmail.com','admin2','admin2'),('matrix.computers@ymail.com','1234567890','kamal');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'GIONEE'),(2,'MICROMAX'),(3,'HTC'),(4,'SAMSUNG'),(5,'NIKE'),(6,'APPLE'),(7,'PUMA'),(8,'WOODLAND'),(9,'SIYARAM'),(10,'TOYOTA'),(11,'HP'),(12,'DELL'),(13,'MIRACLE'),(14,'ADIDAS'),(15,'LEVIS'),(16,'ALLEN SOLLY'),(17,'UNITED STATE OF BENETTON'),(18,'HERO'),(19,'HONDA'),(20,'LEE COPPER'),(21,'LG'),(22,'PHILIPSE'),(23,'REEBOK'),(24,'RENAULT'),(25,'TESA'),(26,'DURA'),(27,'BAJAJ'),(28,'PATANGLI'),(29,'HYUNDAI'),(30,'UNIQUE BUILDERS'),(31,'MARUTI'),(32,'NISSAN'),(33,'RAYMONDS'),(34,'YAMAHA'),(35,'KTM'),(36,'DURIAN'),(37,'USHA'),(38,'GODREJ'),(39,'ASHIYANA'),(40,'DLF'),(41,'__OTHER BRANDS__'),(42,'AVON'),(43,'HERCULES'),(44,'HARLEY DAVIDSON'),(45,'ROYAL ENFIELD'),(46,'TVS'),(47,'VESPA'),(48,'MRF'),(49,'TATA'),(50,'HINDUSTAN LEVER'),(51,'CANON'),(52,'DAIKIN'),(53,'PSP SERIES'),(54,'ORPAT'),(55,'LENOVO'),(56,'IBALL'),(57,'PLOTS'),(58,'BMW');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Bikes','1.png'),(2,'Books  & Sports','2.jpeg'),(3,'Cars','3.png'),(4,'Electronic ','4.png'),(5,'Fashion','5.jpg'),(6,'Furniture','6.png'),(7,'Mobiles ','7.jpeg'),(8,'Real Estate','8.png');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Jaipur',18),(2,'Jhodpur',18),(3,'Kota',18),(4,'Bikaner',18),(5,'Ajmer',18),(6,'Udaipur',18),(7,'Bhilwara',18),(8,'Alwar',18),(9,'Bharatpur',18),(10,'Sikar',18),(11,'Pali',18),(12,'Tonk',18),(13,'Kishangarh',18),(14,'Gangapur City',18),(15,'Sawai Madhopur',18),(16,'Churu',18),(17,'ludhiana',17),(18,'Amritsar',17),(19,'Jalandhar',17),(20,'Patiala',17),(21,'Pathankot',17),(22,'Hisar',8),(23,'Gurugram',8),(24,'Sirsa',8),(25,'Panipat',8),(26,'Jhajjar',8),(27,'Faridabad',8),(28,'Surat',7),(29,'Ahemdabad',7),(30,'Gandhi Nagar',7),(31,'Vadodra',7),(32,'Anantapur',1),(33,'Kakinada',1),(34,'Kurnool',1),(35,'Mumbai',15),(36,'Guwahati',3),(37,'Silchar',3),(38,'Jorhat',3),(39,'Dibrujarh',3),(40,'Bomdila',2),(41,'Bhalukpong',2),(42,'Gaya',4),(43,'Patna',4),(44,'Darbhanga',4),(45,'Bodhgaya',4),(46,'Kaimur',4),(47,'Raipur',5),(48,'Bilaspur',5),(49,'Raigarh',5),(50,'Panaji',6),(51,'Vasco',6),(52,'Leh',10),(53,'Kullu Manali',9),(54,'Shimla',9),(55,'Porbandar',7),(56,'Rajkot',7),(57,'Dhanbad',11),(58,'Ranchi',11),(59,'Bangalore',12),(60,'Mangalore',12),(61,'Thiruvananthapuram',13),(62,'Kochi',13),(63,'Gulbarga',12),(64,'Pune',15),(65,'Indore',14),(66,'Bhopal',14),(67,'Nasik',15),(68,'Gwalior',14),(69,'Latur',15),(70,'Hyderabad',20),(71,'Warangal',20),(72,'Chennai',19),(73,'Puri',16),(74,'Pondicherry',19),(75,'Cuttack',16),(76,'Kanpur',21),(77,'Allahabad',21),(78,'Luckhnow',21),(79,'Kolkata',23),(80,'Haridwar',22),(81,'Dehradun',22);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `subcat_id` int(11) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `post_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'New Bicycle ',18,1,1,'1.jpeg',8500,'very good in condition. no damage. gear is good','2016-07-14','2016-08-14',1),(2,'bike at good price',27,1,2,'2.jpeg',25000,'bike is in good condition','2016-07-15','2016-08-15',1),(3,'Scooter ',19,1,3,'3.jpg',28000,'White color ,Good Average,Less used','2016-07-15','2016-08-15',1),(4,'bike at good price',42,1,1,'4.jpeg',10000,'RED color ,good condition,without gear,well maintaned','2016-07-18','2016-08-18',1),(5,'cycle to sell',43,1,1,'5.jpeg',7600,'black color ,good condition,with 4 gear,well maintaned','2016-07-16','2016-08-16',1),(6,'Bike',44,1,2,'6.jpeg',55000,'black in  color ,good condition,well maintaned,good average','2016-07-16','2016-08-16',1),(7,'Bike',19,1,2,'7.jpeg',35000,'black in  color ,good condition,well maintaned,good average','2016-07-16','2016-08-16',1),(8,'KTM',35,1,2,'8.jpeg',520000,'black and orange in  color ,Cool shades,good in condition,well maintaned,good average','2016-07-17','2016-08-17',1),(9,'ROYAL bike',45,1,1,'9.jpeg',60000,'yellow  color ,good condition,well maintaned,good average','2016-07-17','2016-08-17',1),(10,'bike ',34,1,2,'10.jpg',40000,'black beauty ,good condition,well maintaned,good average','2016-07-20','2016-08-20',1),(11,'Scooter ',46,1,3,'11.jpeg',22000,'light weight,good condition ,good average','2016-07-16','2016-08-16',1),(12,'Scooter ',47,1,3,'12.jpeg',36000,'good condition,well maintaned,good average','2016-07-17','2016-08-17',1),(13,'spare parts of scooter',50,1,4,'13.jpeg',3500,'good condition,company product,1 year warranty','2016-07-16','2016-08-16',1),(14,' 7 story book series',41,2,5,'14.jpg',500,'books are good in condition,well maintained','2016-07-16','2016-08-16',1),(15,'SLB Bat',41,2,6,'15.jpeg',500,'Bat is in good condition,\r\n1 year used','2016-07-16','2016-08-16',1),(16,'BMW',58,3,7,'16.jpg',2000000,'2 year used car White in color ,Also under Inssurance,no accident casegood average','2016-07-16','2016-08-16',1),(17,'honda civic',19,3,7,'17.jpeg',1800000,'white color good condition 2 year used car ','2016-07-15','2016-08-15',1),(18,'Hyundai',29,3,7,'18.jpeg',220000,'excellent condition,good average , 2.5 year used,only 6000 Km drived car','2016-07-16','2016-08-16',1),(19,'Maruti',31,3,7,'19.jpeg',250000,'best car with good average ,suspension','2016-07-16','2016-08-16',1),(20,'nissan',32,3,7,'20.jpg',450000,'nissan has a powerful engine with good average and 3 year used car','2016-07-16','2016-08-16',1),(21,'TATA_max truck',49,3,8,'21.jpeg',100000,'5 year used ,good loading capacity,good average','2016-07-16','2016-08-16',1),(22,'T-shirt',16,5,17,'22.jpeg',1200,'shirt with good fabric,not used once','2016-07-15','2016-08-15',1),(23,'shoe',14,5,18,'23.jpeg',2500,'light weight shoe , cool look','2016-07-16','2016-08-16',1),(24,'shoe',5,5,18,'24.jpeg',3500,'good fiber used product \r\ngood condition','2016-07-16','2016-08-16',1),(25,'iphone',6,7,22,'25.jpg',32000,'no damage,1 year warranty ','2016-07-15','2016-08-15',1),(26,'mobile phone',1,7,22,'26.jpeg',7500,'good condition,5-5 Mp front and rear,no damage ever ,good battery backup','2016-07-16','2016-08-16',1),(27,'samsung galaxy S-7',4,7,22,'27.jpeg',16500,'good condition , display is also good,1 year warranty','2016-07-16','2016-08-16',1),(28,'micrmax canvas',2,7,22,'28.jpeg',19500,'phone with 13Mp rear and 5 Mp front camera,good battery backup ,6 months warranty','2016-07-16','2016-08-16',1),(30,'tablet',11,7,23,'30.jpg',12500,'tablet in good condition,good Battery life,1.5 year warranty','2016-07-16','2016-08-16',1),(32,'dell tablet',12,7,23,'32.jpeg',12500,'good condition, tablet color black ,android -lolipop','2016-07-16','2016-08-16',1),(33,'home',57,8,25,'33.jpg',1000000,'3BHK good view ,decent place to live,helpful neighbours','2016-07-16','2016-08-16',1),(34,'appartement for rent',57,8,24,'34.jpeg',20000,'good place 2-BHK and good surrounding,well maintened','2016-07-18','2016-08-18',1),(35,'plot ',57,8,26,'35.jpg',75000000,'10 acer land with fertile soil,fencing also','2016-07-16','2016-08-16',1),(36,'Sofa',26,6,20,'36.jpeg',12000,'sofa with comfort ,good fabric used','2016-07-20','2016-08-20',1),(37,'bed',25,6,19,'37.jpeg',15000,'bed contain space ,7 * 7 feet good looking','2016-07-16','2016-08-16',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Andhra Pradesh'),(2,'Arunachal Pradesh'),(3,'Assam'),(4,'Bihar'),(5,'Chhattisgarh'),(6,'Goa'),(7,'Gujarat'),(8,'Haryana'),(9,'Himachal Pradesh'),(10,'Jammu & Kashmir'),(11,'Jharkhand'),(12,'Karnataka'),(13,'Kerala'),(14,'Madhya Pradesh'),(15,'Maharashtra'),(16,'Orissa'),(17,'Punjab'),(18,'Rajasthan'),(19,'Tamil Nadu'),(20,'Telangan'),(21,'Uttar Pradesh'),(22,'Uttrakhand'),(23,'West Bengal');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory` (
  `subcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `subcat_name` varchar(255) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `subcat_pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'BiCycles',1,'1.png'),(2,'MotorCycles',1,'2.png'),(3,'Scooters',1,'3.png'),(4,'Spare Parts',1,'4.png'),(5,'Books & Magazines',2,'5.jpeg'),(6,'Sports Equipments',2,'6.jpeg'),(7,'Cars',3,'7.png'),(8,'Commercial Vehicals',3,'8.png'),(9,'Spare Parts',3,'9.png'),(10,'Cameras & Accessories',4,'10.png'),(11,'Computers ',4,'11.jpeg'),(12,'Fridge- AC -Washing Machines',4,'12.png'),(13,'Games & Entertainment',4,'13.png'),(14,'Kichen & Other Appliances',4,'14.png'),(15,'TV -Video-Audio',7,'15.jpeg'),(16,'Accessories',1,'16.png'),(17,'Clothes',5,'17.jpg'),(18,'Footwear',5,'18.png'),(19,'Beds ',6,'19.png'),(20,'Sofa ',6,'20.png'),(21,'Mobile Accessories',7,'21.jpeg'),(22,'Mobiles',7,'22.jpeg'),(23,'Tablets',1,'23.jpeg'),(24,'Appartment',8,'24.jpeg'),(25,'House',8,'25.jpeg'),(26,'Shops  & Plots',8,'26.jpeg');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'matrix.computers@ymail.com','1234567','seller','919414244351',3,2,'10/564');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-15 11:44:47
