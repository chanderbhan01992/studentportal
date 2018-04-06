-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: portal_storage
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
-- Current Database: `portal_storage`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `portal_storage` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `portal_storage`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add roles',7,'add_roles'),(20,'Can change roles',7,'change_roles'),(21,'Can delete roles',7,'delete_roles'),(22,'Can add department',8,'add_department'),(23,'Can change department',8,'change_department'),(24,'Can delete department',8,'delete_department'),(25,'Can add personinformation',9,'add_personinformation'),(26,'Can change personinformation',9,'change_personinformation'),(27,'Can delete personinformation',9,'delete_personinformation'),(28,'Can add for login',10,'add_forlogin'),(29,'Can change for login',10,'change_forlogin'),(30,'Can delete for login',10,'delete_forlogin'),(31,'Can add company_table',11,'add_company_table'),(32,'Can change company_table',11,'change_company_table'),(33,'Can delete company_table',11,'delete_company_table'),(34,'Can add company_ department_ relation',12,'add_company_department_relation'),(35,'Can change company_ department_ relation',12,'change_company_department_relation'),(36,'Can delete company_ department_ relation',12,'delete_company_department_relation'),(37,'Can add session',13,'add_session'),(38,'Can change session',13,'change_session'),(39,'Can delete session',13,'delete_session'),(40,'Can add profile_type',14,'add_profile_type'),(41,'Can change profile_type',14,'change_profile_type'),(42,'Can delete profile_type',14,'delete_profile_type'),(43,'Can add difficulty_type',15,'add_difficulty_type'),(44,'Can change difficulty_type',15,'change_difficulty_type'),(45,'Can delete difficulty_type',15,'delete_difficulty_type'),(46,'Can add interview round_type',16,'add_interviewround_type'),(47,'Can change interview round_type',16,'change_interviewround_type'),(48,'Can delete interview round_type',16,'delete_interviewround_type'),(49,'Can add interview round_details',17,'add_interviewround_details'),(50,'Can change interview round_details',17,'change_interviewround_details'),(51,'Can delete interview round_details',17,'delete_interviewround_details'),(52,'Can add experience_placement',18,'add_experience_placement'),(53,'Can change experience_placement',18,'change_experience_placement'),(54,'Can delete experience_placement',18,'delete_experience_placement'),(55,'Can add experience_internship',19,'add_experience_internship'),(56,'Can change experience_internship',19,'change_experience_internship'),(57,'Can delete experience_internship',19,'delete_experience_internship'),(58,'Can add requests',20,'add_requests'),(59,'Can change requests',20,'change_requests'),(60,'Can delete requests',20,'delete_requests');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$gaulHWP98oD7$s59YKx0K+slkszltQkeLsPNQP/FDJId0L7DxslbxFvQ=','2017-02-18 06:02:43',1,'portaladmin','','','',1,1,'2017-02-18 05:49:40');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-02-18 06:10:30','1','Department object',1,'',8,1),(2,'2017-02-18 06:11:47','1','Roles object',1,'',7,1),(3,'2017-02-18 07:03:54','1','InterviewRound_type object',3,'',16,1),(4,'2017-02-18 07:19:12','1','Difficulty_type object',1,'',15,1),(5,'2017-02-18 07:19:26','2','Difficulty_type object',1,'',15,1),(6,'2017-02-18 07:19:36','3','Difficulty_type object',1,'',15,1),(7,'2017-02-18 08:35:56','1','ForLogin object',3,'',10,1),(8,'2017-02-18 08:36:08','15616','Personinformation object',3,'',9,1),(9,'2017-02-18 09:32:24','15616','Personinformation object',3,'',9,1),(10,'2017-02-18 09:32:24','15567','Personinformation object',3,'',9,1),(11,'2017-02-18 09:33:32','15616','Personinformation object',3,'',9,1),(12,'2017-02-18 09:33:33','15567','Personinformation object',3,'',9,1),(13,'2017-02-18 10:05:39','5','ForLogin object',3,'',10,1),(14,'2017-02-18 10:05:39','4','ForLogin object',3,'',10,1),(15,'2017-02-24 06:09:37','90','company_table object',3,'',11,1),(16,'2017-02-24 06:09:37','89','company_table object',3,'',11,1),(17,'2017-02-24 06:09:37','88','company_table object',3,'',11,1),(18,'2017-02-24 06:09:37','87','company_table object',3,'',11,1),(19,'2017-02-24 06:09:37','86','company_table object',3,'',11,1),(20,'2017-02-24 06:09:38','85','company_table object',3,'',11,1),(21,'2017-02-24 06:09:38','84','company_table object',3,'',11,1),(22,'2017-02-24 06:09:38','83','company_table object',3,'',11,1),(23,'2017-02-24 06:09:38','82','company_table object',3,'',11,1),(24,'2017-02-24 06:09:38','81','company_table object',3,'',11,1),(25,'2017-02-24 06:09:38','80','company_table object',3,'',11,1),(26,'2017-02-24 06:09:38','79','company_table object',3,'',11,1),(27,'2017-02-24 06:09:38','78','company_table object',3,'',11,1),(28,'2017-02-24 06:09:38','77','company_table object',3,'',11,1),(29,'2017-02-24 06:09:38','76','company_table object',3,'',11,1),(30,'2017-02-24 06:09:38','75','company_table object',3,'',11,1),(31,'2017-02-24 06:09:38','74','company_table object',3,'',11,1),(32,'2017-02-24 06:09:38','73','company_table object',3,'',11,1),(33,'2017-02-24 06:09:38','72','company_table object',3,'',11,1),(34,'2017-02-24 06:09:38','71','company_table object',3,'',11,1),(35,'2017-02-24 06:09:38','70','company_table object',3,'',11,1),(36,'2017-02-24 06:09:38','69','company_table object',3,'',11,1),(37,'2017-02-24 06:09:38','68','company_table object',3,'',11,1),(38,'2017-02-24 06:09:38','67','company_table object',3,'',11,1),(39,'2017-02-24 06:09:38','66','company_table object',3,'',11,1),(40,'2017-02-24 06:09:38','65','company_table object',3,'',11,1),(41,'2017-02-24 06:09:38','64','company_table object',3,'',11,1),(42,'2017-02-24 06:09:38','63','company_table object',3,'',11,1),(43,'2017-02-24 06:09:39','62','company_table object',3,'',11,1),(44,'2017-02-24 06:09:39','61','company_table object',3,'',11,1),(45,'2017-02-24 06:09:39','60','company_table object',3,'',11,1),(46,'2017-02-24 06:09:39','59','company_table object',3,'',11,1),(47,'2017-02-24 06:09:39','58','company_table object',3,'',11,1),(48,'2017-02-24 06:09:39','57','company_table object',3,'',11,1),(49,'2017-02-24 06:09:39','56','company_table object',3,'',11,1),(50,'2017-02-24 06:09:39','55','company_table object',3,'',11,1),(51,'2017-02-24 06:09:39','54','company_table object',3,'',11,1),(52,'2017-02-24 06:09:39','53','company_table object',3,'',11,1),(53,'2017-02-24 06:09:39','52','company_table object',3,'',11,1),(54,'2017-02-24 06:09:39','51','company_table object',3,'',11,1),(55,'2017-02-24 06:09:39','50','company_table object',3,'',11,1),(56,'2017-02-24 06:09:39','49','company_table object',3,'',11,1),(57,'2017-02-24 06:09:39','48','company_table object',3,'',11,1),(58,'2017-02-24 06:09:39','47','company_table object',3,'',11,1),(59,'2017-02-24 06:09:39','46','company_table object',3,'',11,1),(60,'2017-02-24 06:09:39','45','company_table object',3,'',11,1),(61,'2017-02-24 06:09:39','44','company_table object',3,'',11,1),(62,'2017-02-24 06:09:39','43','company_table object',3,'',11,1),(63,'2017-02-24 06:09:39','42','company_table object',3,'',11,1),(64,'2017-02-24 06:09:39','41','company_table object',3,'',11,1),(65,'2017-02-24 06:09:39','40','company_table object',3,'',11,1),(66,'2017-02-24 06:09:39','39','company_table object',3,'',11,1),(67,'2017-02-24 06:09:39','38','company_table object',3,'',11,1),(68,'2017-02-24 06:09:40','37','company_table object',3,'',11,1),(69,'2017-02-24 06:09:40','36','company_table object',3,'',11,1),(70,'2017-02-24 06:09:40','35','company_table object',3,'',11,1),(71,'2017-02-24 06:09:40','34','company_table object',3,'',11,1),(72,'2017-02-24 06:09:40','33','company_table object',3,'',11,1),(73,'2017-02-24 06:09:40','32','company_table object',3,'',11,1),(74,'2017-02-24 06:09:40','31','company_table object',3,'',11,1),(75,'2017-02-24 06:09:40','30','company_table object',3,'',11,1),(76,'2017-02-24 06:09:40','29','company_table object',3,'',11,1),(77,'2017-02-24 06:09:40','28','company_table object',3,'',11,1),(78,'2017-02-24 06:09:40','27','company_table object',3,'',11,1),(79,'2017-02-24 06:09:40','26','company_table object',3,'',11,1),(80,'2017-02-24 06:09:40','25','company_table object',3,'',11,1),(81,'2017-02-24 06:09:40','24','company_table object',3,'',11,1),(82,'2017-02-24 06:09:40','23','company_table object',3,'',11,1),(83,'2017-02-24 06:09:40','22','company_table object',3,'',11,1),(84,'2017-02-24 06:09:40','21','company_table object',3,'',11,1),(85,'2017-02-24 06:09:40','20','company_table object',3,'',11,1),(86,'2017-02-24 06:09:40','19','company_table object',3,'',11,1),(87,'2017-02-24 06:09:40','18','company_table object',3,'',11,1),(88,'2017-02-24 06:09:40','17','company_table object',3,'',11,1),(89,'2017-02-24 06:09:40','16','company_table object',3,'',11,1),(90,'2017-02-24 06:09:40','15','company_table object',3,'',11,1),(91,'2017-02-24 06:09:40','14','company_table object',3,'',11,1),(92,'2017-02-24 06:09:41','13','company_table object',3,'',11,1),(93,'2017-02-24 06:09:41','12','company_table object',3,'',11,1),(94,'2017-02-24 06:09:41','11','company_table object',3,'',11,1),(95,'2017-02-24 06:09:41','10','company_table object',3,'',11,1),(96,'2017-02-24 06:09:41','9','company_table object',3,'',11,1),(97,'2017-02-24 06:09:41','8','company_table object',3,'',11,1),(98,'2017-02-24 06:09:41','7','company_table object',3,'',11,1),(99,'2017-02-24 06:09:41','6','company_table object',3,'',11,1),(100,'2017-02-24 06:09:41','5','company_table object',3,'',11,1),(101,'2017-02-24 06:09:41','4','company_table object',3,'',11,1),(102,'2017-02-24 06:09:41','3','company_table object',3,'',11,1),(103,'2017-02-24 06:09:41','2','company_table object',3,'',11,1),(104,'2017-02-24 06:09:41','1','company_table object',3,'',11,1),(105,'2017-02-24 06:26:26','8','ForLogin object',3,'',10,1),(106,'2017-02-24 06:26:26','7','ForLogin object',3,'',10,1),(107,'2017-02-24 06:26:26','6','ForLogin object',3,'',10,1),(108,'2017-02-24 06:26:38','15617','Personinformation object',3,'',9,1),(109,'2017-02-24 06:26:38','15616','Personinformation object',3,'',9,1),(110,'2017-02-24 06:26:38','15567','Personinformation object',3,'',9,1),(111,'2017-02-24 06:40:05','15616','Personinformation object',3,'',9,1),(112,'2017-02-24 06:40:05','15567','Personinformation object',3,'',9,1),(113,'2017-02-25 03:28:37','2','Roles object',1,'',7,1),(114,'2017-02-25 03:29:13','15616','Personinformation object',2,'Changed roleid and telephone2.',9,1),(115,'2017-02-25 05:00:10','3','Roles object',1,'',7,1),(116,'2017-02-25 05:01:01','15616','Personinformation object',2,'Changed roleid.',9,1),(117,'2017-02-25 05:02:04','15616','Personinformation object',2,'Changed roleid.',9,1),(118,'2017-02-26 04:26:14','1','experience_placement object',3,'',18,1),(119,'2017-02-26 04:30:49','15616','Personinformation object',3,'',9,1),(120,'2017-02-26 04:30:49','15567','Personinformation object',3,'',9,1),(121,'2017-02-26 04:33:33','15616','Personinformation object',3,'',9,1),(122,'2017-02-26 04:34:38','15616','Personinformation object',3,'',9,1),(123,'2017-02-26 04:43:23','15616','Personinformation object',3,'',9,1),(124,'2017-02-26 04:43:23','15567','Personinformation object',3,'',9,1),(125,'2017-02-26 04:46:21','15616','Personinformation object',3,'',9,1),(126,'2017-02-26 04:47:40','15616','Personinformation object',3,'',9,1),(127,'2017-02-26 04:51:22','15616','Personinformation object',3,'',9,1),(128,'2017-02-26 04:51:36','15616','Personinformation object',3,'',9,1),(129,'2017-02-26 04:58:19','15616','Personinformation object',3,'',9,1),(130,'2017-02-26 05:06:06','15616','Personinformation object',3,'',9,1),(131,'2017-02-26 05:06:06','15567','Personinformation object',3,'',9,1),(132,'2017-02-26 05:07:45','15616','Personinformation object',3,'',9,1),(133,'2017-02-26 05:07:45','15567','Personinformation object',3,'',9,1),(134,'2017-02-26 06:42:56','15616','Personinformation object',3,'',9,1),(135,'2017-02-26 06:42:56','15567','Personinformation object',3,'',9,1),(136,'2017-02-26 06:46:29','15616','Personinformation object',2,'Changed roleid and telephone2.',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'portalapp','company_department_relation'),(11,'portalapp','company_table'),(8,'portalapp','department'),(15,'portalapp','difficulty_type'),(19,'portalapp','experience_internship'),(18,'portalapp','experience_placement'),(10,'portalapp','forlogin'),(17,'portalapp','interviewround_details'),(16,'portalapp','interviewround_type'),(9,'portalapp','personinformation'),(14,'portalapp','profile_type'),(20,'portalapp','requests'),(7,'portalapp','roles'),(13,'portalapp','session'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-02-18 05:42:31'),(2,'auth','0001_initial','2017-02-18 05:42:35'),(3,'admin','0001_initial','2017-02-18 05:42:36'),(4,'contenttypes','0002_remove_content_type_name','2017-02-18 05:42:36'),(5,'auth','0002_alter_permission_name_max_length','2017-02-18 05:42:37'),(6,'auth','0003_alter_user_email_max_length','2017-02-18 05:42:37'),(7,'auth','0004_alter_user_username_opts','2017-02-18 05:42:37'),(8,'auth','0005_alter_user_last_login_null','2017-02-18 05:42:37'),(9,'auth','0006_require_contenttypes_0002','2017-02-18 05:42:37'),(10,'portalapp','0001_initial','2017-02-18 05:43:01'),(11,'sessions','0001_initial','2017-02-18 05:43:02'),(12,'portalapp','0002_auto_20170218_0547','2017-02-18 05:47:28'),(13,'portalapp','0003_auto_20170218_0811','2017-02-18 08:11:30'),(14,'portalapp','0004_auto_20170218_0840','2017-02-18 08:40:19'),(15,'portalapp','0005_auto_20170218_0937','2017-02-18 09:37:03');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('57hgljnralnx6dz1b5tdd3ujhlgtysye','M2QxZTVkZGY3MTM2YzYzYjA3MTg1ZDg0YjcxMGM2MzA3Y2I4M2I1MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWI0YTEwY2EzZDc5N2QwZmRjODkzN2Y5ZmU5Nzk0OGRhY2IwMzVkZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-12 06:52:22');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_company_department_relation`
--

DROP TABLE IF EXISTS `portalapp_company_department_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_company_department_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(20) DEFAULT NULL,
  `intern_valid` int(11) NOT NULL,
  `job_valid` int(11) NOT NULL,
  `company_id_id` int(11) NOT NULL,
  `deptid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portalapp_company_department_relation_ca4ae90a` (`company_id_id`),
  KEY `portalapp_company_department_relation_30d13079` (`deptid_id`),
  CONSTRAINT `portalapp__deptid_id_6b6fff2740ec08f0_fk_portalapp_department_id` FOREIGN KEY (`deptid_id`) REFERENCES `portalapp_department` (`id`),
  CONSTRAINT `port_company_id_id_1fe6d622f603285_fk_portalapp_company_table_id` FOREIGN KEY (`company_id_id`) REFERENCES `portalapp_company_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_company_department_relation`
--

LOCK TABLES `portalapp_company_department_relation` WRITE;
/*!40000 ALTER TABLE `portalapp_company_department_relation` DISABLE KEYS */;
INSERT INTO `portalapp_company_department_relation` VALUES (1,'2016-17',0,1,98,1);
/*!40000 ALTER TABLE `portalapp_company_department_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_company_table`
--

DROP TABLE IF EXISTS `portalapp_company_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_company_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` longtext,
  `short_name` longtext,
  `long_name` longtext,
  `display_name` longtext,
  `intern_exp_count` int(11) NOT NULL,
  `job_exp_count` int(11) NOT NULL,
  `company_intern_valid` int(11) NOT NULL,
  `company_job_valid` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `recentdate` date NOT NULL,
  `valid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_company_table`
--

LOCK TABLES `portalapp_company_table` WRITE;
/*!40000 ALTER TABLE `portalapp_company_table` DISABLE KEYS */;
INSERT INTO `portalapp_company_table` VALUES (91,'3DPLM Software Solutions Ltd','3DPLM ','3DPLM Software Solutions Ltd','3DPLM ',0,0,0,1,'2014-01-01','2017-02-24',1),(92,'ACG Worldwide','ACG','ACG Worldwide','ACG',0,0,0,1,'2014-01-01','2017-02-24',1),(93,'Aditya Birla Group (Hindalco)','Aditya Birla Group (Hindalco)','Aditya Birla Group (Hindalco)','Aditya Birla Group (Hindalco)',0,0,0,1,'2014-01-01','2017-02-24',1),(94,'ADM Agro Industries India Pvt Ltd','ADM Agro ','ADM Agro Industries India Pvt Ltd','ADM Agro ',0,0,0,1,'2014-01-01','2017-02-24',1),(95,'Adyant Eduction Pvt. Ltd. (Aakash Institue)','Adyant Edu (Aakash Institue)','Adyant Eduction Pvt. Ltd. (Aakash Institue)','Adyant Edu (Aakash Institue)',0,0,0,1,'2014-01-01','2017-02-24',1),(96,'Alfa Laval (India) Limited','Alfa Laval','Alfa Laval (India) Limited','Alfa Laval',0,0,0,1,'2014-01-01','2017-02-24',1),(97,'Amadeus Software Labs India Pvt Ltd','Amadeus','Amadeus Software Labs India Pvt Ltd','Amadeus',0,0,0,1,'2014-01-01','2017-02-24',1),(98,'Amazon','Amazon','Amazon','Amazon',0,14,0,1,'2014-01-01','2017-02-24',1),(99,'Ashok Leyland','Ashok Leyland','Ashok Leyland','Ashok Leyland',0,0,0,1,'2014-01-01','2017-02-24',1),(100,'Atos India Pvt. Ltd.','Atos.','Atos India Pvt. Ltd.','Atos.',0,0,0,1,'2014-01-01','2017-02-24',1),(101,'Avanti Fellows','Avanti','Avanti Fellows','Avanti',0,0,0,1,'2014-01-01','2017-02-24',1),(102,'AVAYA India Pvt Ltd','AVAYA','AVAYA India Pvt Ltd','AVAYA',0,0,0,1,'2014-01-01','2017-02-24',1),(103,'Bajaj Auto Ltd.','Bajaj Auto ','Bajaj Auto Ltd.','Bajaj Auto ',0,0,0,1,'2014-01-01','2017-02-24',1),(104,'Barclays Technology Centre India Pvt Ltd','Barclays Technology','Barclays Technology Centre India Pvt Ltd','Barclays Technology',0,0,0,1,'2014-01-01','2017-02-24',1),(105,'BASE Educational Services Pvt Ltd','BASE Edu','BASE Educational Services Pvt Ltd','BASE Edu',0,0,0,1,'2014-01-01','2017-02-24',1),(106,'Bharat Forge ','Bharat Forge ','Bharat Forge ','Bharat Forge ',0,0,0,1,'2014-01-01','2017-02-24',1),(107,'Birla Century','Birla Century','Birla Century','Birla Century',0,0,0,1,'2014-01-01','2017-02-24',1),(108,'C-DOT','C-DOT','C-DOT','C-DOT',0,0,0,1,'2014-01-01','2017-02-24',1),(109,'Capgemini India Pvt Ltd','Capgemini','Capgemini India Pvt Ltd','Capgemini',0,0,0,1,'2014-01-01','2017-02-24',1),(110,'CarWale.com','CarWale.com','CarWale.com','CarWale.com',0,0,0,1,'2014-01-01','2017-02-24',1),(111,'Citicorp Finance India Limited-PPO','Citicorp Finance','Citicorp Finance India Limited-PPO','Citicorp Finance',0,0,0,1,'2014-01-01','2017-02-24',1),(112,'Clairvolex Knowledge Processes Pvt. Ltd.','Clairvolex','Clairvolex Knowledge Processes Pvt. Ltd.','Clairvolex',0,0,0,1,'2014-01-01','2017-02-24',1),(113,'Coal India Ltd.','Coal India','Coal India Ltd.','Coal India',0,0,0,1,'2014-01-01','2017-02-24',1),(114,'Decathlon Sports India Pvt. Ltd.','Decathlon Sports','Decathlon Sports India Pvt. Ltd.','Decathlon Sports',0,0,0,1,'2014-01-01','2017-02-24',1),(115,'Deloitte','Deloitte','Deloitte','Deloitte',0,0,0,1,'2014-01-01','2017-02-24',1),(116,'FactSet Systems India Pvt Ltd','FactSet','FactSet Systems India Pvt Ltd','FactSet',0,0,0,1,'2014-01-01','2017-02-24',1),(117,'FCA (FIAT)','FCA (FIAT)','FCA (FIAT)','FCA (FIAT)',0,0,0,1,'2014-01-01','2017-02-24',1),(118,'Fidelity Investments','Fidelity','Fidelity Investments','Fidelity',0,0,0,1,'2014-01-01','2017-02-24',1),(119,'Fractal Analytics Pvt. Ltd.','Fractal Analytics','Fractal Analytics Pvt. Ltd.','Fractal Analytics',0,0,0,1,'2014-01-01','2017-02-24',1),(120,'Futures First','Futures First','Futures First','Futures First',0,0,0,1,'2014-01-01','2017-02-24',1),(121,'Godrej & Boyce Mfg. Co. Ltd.','Godrej & Boyce','Godrej & Boyce Mfg. Co. Ltd.','Godrej & Boyce',0,0,0,1,'2014-01-01','2017-02-24',1),(122,'Godrej Industries Ltd','Godrej','Godrej Industries Ltd','Godrej',0,0,0,1,'2014-01-01','2017-02-24',1),(123,'Goldman Sachs','Goldman Sachs','Goldman Sachs','Goldman Sachs',0,0,0,1,'2014-01-01','2017-02-24',1),(124,'Halftick Info Services Pvt Ltd','Halftick','Halftick Info Services Pvt Ltd','Halftick',0,0,0,1,'2014-01-01','2017-02-24',1),(125,'Hero MotoCorp Ltd','Hero MotoCorp','Hero MotoCorp Ltd','Hero MotoCorp',0,0,0,1,'2014-01-01','2017-02-24',1),(126,'HSBC Software Development (India) Pvt. Ltd.','HSBC','HSBC Software Development (India) Pvt. Ltd.','HSBC',0,0,0,1,'2014-01-01','2017-02-24',1),(127,'HUL','HUL','HUL','HUL',0,0,0,1,'2014-01-01','2017-02-24',1),(128,'HYUNDAI Mobis Technical Center in India (MTCI)','HYUNDAI Mobis','HYUNDAI Mobis Technical Center in India (MTCI)','HYUNDAI Mobis',0,0,0,1,'2014-01-01','2017-02-24',1),(129,'Indian Navy','Indian Navy','Indian Navy','Indian Navy',0,0,0,1,'2014-01-01','2017-02-24',1),(130,'Infocepts','Infocepts','Infocepts','Infocepts',0,0,0,1,'2014-01-01','2017-02-24',1),(131,'Infosys','Infosys ','Infosys','Infosys ',0,0,0,1,'2014-01-01','2017-02-24',1),(132,'Ittiam','Ittiam','Ittiam','Ittiam',0,0,0,1,'2014-01-01','2017-02-24',1),(133,'John Deere Technology','John Deere','John Deere Technology','John Deere',0,0,0,1,'2014-01-01','2017-02-24',1),(134,'JP Morgan','JP Morgan','JP Morgan','JP Morgan',0,0,0,1,'2014-01-01','2017-02-24',1),(135,'KEC International Ltd.','KEC ','KEC International Ltd.','KEC ',0,0,0,1,'2014-01-01','2017-02-24',1),(136,'L&T ECC','L&T ECC','L&T ECC','L&T ECC',0,0,0,1,'2014-01-01','2017-02-24',1),(137,'Lafarge India Ltd.','Lafarge','Lafarge India Ltd.','Lafarge',0,0,0,1,'2014-01-01','2017-02-24',1),(138,'Larsen & Toubro Limited','Larsen & Toubro','Larsen & Toubro Limited','Larsen & Toubro',0,0,0,1,'2014-01-01','2017-02-24',1),(139,'MAQ','MAQ','MAQ','MAQ',0,0,0,1,'2014-01-01','2017-02-24',1),(140,'Maruti Suzuki India Ltd.','Maruti Suzuki','Maruti Suzuki India Ltd.','Maruti Suzuki',0,0,0,1,'2014-01-01','2017-02-24',1),(141,'Misys Software Solutions (India) Pvt Ltd.','Misys ','Misys Software Solutions (India) Pvt Ltd.','Misys ',0,0,0,1,'2014-01-01','2017-02-24',1),(142,'Morgan Stanley Advantage Services Pvt Ltd','Morgan Stanley','Morgan Stanley Advantage Services Pvt Ltd','Morgan Stanley',0,0,0,1,'2014-01-01','2017-02-24',1),(143,'mSupply.com','mSupply.com','mSupply.com','mSupply.com',0,0,0,1,'2014-01-01','2017-02-24',1),(144,'Nice Software Solutions Pvt. Ltd.','Nice','Nice Software Solutions Pvt. Ltd.','Nice',0,0,0,1,'2014-01-01','2017-02-24',1),(145,'Ntex Transportation Services Pvt Ltd (ElasticRun)','Ntex','Ntex Transportation Services Pvt Ltd (ElasticRun)','Ntex',0,0,0,1,'2014-01-01','2017-02-24',1),(146,'Numerify India Software Pvt .Ltd','Numerify','Numerify India Software Pvt .Ltd','Numerify',0,0,0,1,'2014-01-01','2017-02-24',1),(147,'Nykaa.com','Nykaa.com','Nykaa.com','Nykaa.com',0,0,0,1,'2014-01-01','2017-02-24',1),(148,'OFSS','OFSS','OFSS','OFSS',0,0,0,1,'2014-01-01','2017-02-24',1),(149,'Oracle India Pvt. Ltd.','Oracle ','Oracle India Pvt. Ltd.','Oracle ',0,0,0,1,'2014-01-01','2017-02-24',1),(150,'Persistent Systems Ltd.','Persistent ','Persistent Systems Ltd.','Persistent ',0,0,0,1,'2014-01-01','2017-02-24',1),(151,'Philips Innovation','Philips Innovation','Philips Innovation','Philips Innovation',0,0,0,1,'2014-01-01','2017-02-24',1),(152,'Pidilite Industries Ltd.','Pidilite ','Pidilite Industries Ltd.','Pidilite ',0,0,0,1,'2014-01-01','2017-02-24',1),(153,'Publicis.Sapient','Publicis.Sapient','Publicis.Sapient','Publicis.Sapient',0,0,0,1,'2014-01-01','2017-02-24',1),(154,'Qualcomm India Pvt Ltd','Qualcomm','Qualcomm India Pvt Ltd','Qualcomm',0,0,0,1,'2014-01-01','2017-02-24',1),(155,'Reliance Industries Ltd.','Reliance','Reliance Industries Ltd.','Reliance',0,0,0,1,'2014-01-01','2017-02-24',1),(156,'Rishabh Instruments Pvt. Ltd','Rishabh Instruments','Rishabh Instruments Pvt. Ltd','Rishabh Instruments',0,0,0,1,'2014-01-01','2017-02-24',1),(157,'S Jain Ventures','S Jain Ventures','S Jain Ventures','S Jain Ventures',0,0,0,1,'2014-01-01','2017-02-24',1),(158,'Schneider Electric India','Schneider ','Schneider Electric India','Schneider ',0,0,0,1,'2014-01-01','2017-02-24',1),(159,'SHV Energy','SHV Energy','SHV Energy','SHV Energy',0,0,0,1,'2014-01-01','2017-02-24',1),(160,'Siemens Ltd.','Siemens','Siemens Ltd.','Siemens',0,0,0,1,'2014-01-01','2017-02-24',1),(161,'Sun Pharmaceutical Industries Ltd','Sun Pharmaceutical','Sun Pharmaceutical Industries Ltd','Sun Pharmaceutical',0,0,0,1,'2014-01-01','2017-02-24',1),(162,'Tata Consultancy Services','Tata Consultancy Services','Tata Consultancy Services','Tata Consultancy Services',0,0,0,1,'2014-01-01','2017-02-24',1),(163,'Tata Motors Ltd.','Tata Motors','Tata Motors Ltd.','Tata Motors',0,0,0,1,'2014-01-01','2017-02-24',1),(164,'Thermax Ltd.','Thermax ','Thermax Ltd.','Thermax ',0,0,0,1,'2014-01-01','2017-02-24',1),(165,'ThyssenKrupp Electrical Steel India Pvt. Ltd.','ThyssenKrupp Electrical Steel','ThyssenKrupp Electrical Steel India Pvt. Ltd.','ThyssenKrupp Electrical Steel',0,0,0,1,'2014-01-01','2017-02-24',1),(166,'Varroc Engineering Pvt. Ltd.','Varroc Engineering','Varroc Engineering Pvt. Ltd.','Varroc Engineering',0,0,0,1,'2014-01-01','2017-02-24',1),(167,'VE Commercial Vehicles','VE Commercial Vehicles','VE Commercial Vehicles','VE Commercial Vehicles',0,0,0,1,'2014-01-01','2017-02-24',1),(168,'Vedanta Ltd.','Vedanta','Vedanta Ltd.','Vedanta',0,0,0,1,'2014-01-01','2017-02-24',1),(169,'Webonise Lab','Webonise Lab','Webonise Lab','Webonise Lab',0,0,0,1,'2014-01-01','2017-02-24',1),(170,'Wipro Ltd.','Wipro ','Wipro Ltd.','Wipro ',0,0,0,1,'2014-01-01','2017-02-24',1),(171,'ZS Associates','ZS Associates','ZS Associates','ZS Associates',0,0,0,1,'2014-01-01','2017-02-24',1);
/*!40000 ALTER TABLE `portalapp_company_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_department`
--

DROP TABLE IF EXISTS `portalapp_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` longtext,
  `long_name` longtext,
  `display_name` longtext,
  `program` longtext,
  `degree_level` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_department`
--

LOCK TABLES `portalapp_department` WRITE;
/*!40000 ALTER TABLE `portalapp_department` DISABLE KEYS */;
INSERT INTO `portalapp_department` VALUES (1,'CSE','Computer Science and Engineering','CSE','B.Tech','B.Tech');
/*!40000 ALTER TABLE `portalapp_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_difficulty_type`
--

DROP TABLE IF EXISTS `portalapp_difficulty_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_difficulty_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` longtext NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_difficulty_type`
--

LOCK TABLES `portalapp_difficulty_type` WRITE;
/*!40000 ALTER TABLE `portalapp_difficulty_type` DISABLE KEYS */;
INSERT INTO `portalapp_difficulty_type` VALUES (1,'Easy','Easy'),(2,'Difficult','Difficult'),(3,'Medium','Medium');
/*!40000 ALTER TABLE `portalapp_difficulty_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_experience_internship`
--

DROP TABLE IF EXISTS `portalapp_experience_internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_experience_internship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `criteria` varchar(500) DEFAULT NULL,
  `onoffcampus` int(11) NOT NULL,
  `package` double DEFAULT NULL,
  `cgpa` double DEFAULT NULL,
  `num_of_rounds` int(11) NOT NULL,
  `other_comments` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  `valid` int(11) NOT NULL,
  `cdr_id_id` int(11) DEFAULT NULL,
  `profile_id` int(11),
  `round1_text_id` int(11),
  `round2_text_id` int(11),
  `round3_text_id` int(11),
  `round4_text_id` int(11),
  `round5_text_id` int(11),
  `round6_text_id` int(11),
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `D1cf10747ed82a90f40fab8b7fdb4207` (`cdr_id_id`),
  KEY `portalapp_experience_internship_83a0eb3f` (`profile_id`),
  KEY `portalapp_experience_internship_aa922236` (`round1_text_id`),
  KEY `portalapp_experience_internship_ee0331d8` (`round2_text_id`),
  KEY `portalapp_experience_internship_e1367d66` (`round3_text_id`),
  KEY `portalapp_experience_internship_bcc892e3` (`round4_text_id`),
  KEY `portalapp_experience_internship_36a376a5` (`round5_text_id`),
  KEY `portalapp_experience_internship_0fac9153` (`round6_text_id`),
  KEY `portalapp_experience_internship_3b029f5a` (`userid_id`),
  CONSTRAINT `b51247d017d57a9c430d96319925bccc` FOREIGN KEY (`round4_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `b6af837c1c6f019f2c8b0e4dcd06192d` FOREIGN KEY (`round2_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `c68441ee266d2efc9055c86d3366be78` FOREIGN KEY (`round1_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `D1cf10747ed82a90f40fab8b7fdb4207` FOREIGN KEY (`cdr_id_id`) REFERENCES `portalapp_company_department_relation` (`id`),
  CONSTRAINT `D3cbe15413ed250de91b90286e43a1d1` FOREIGN KEY (`round6_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `D4249fda161473a53c40d6bc2ebb6c7e` FOREIGN KEY (`userid_id`) REFERENCES `portalapp_personinformation` (`clg_id`),
  CONSTRAINT `e8a9855ebc1c62602b967194210c0cc2` FOREIGN KEY (`round3_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `f517e5583c79b06527fa37c5ab0a765c` FOREIGN KEY (`round5_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `portala_profile_id_5181552c67014de6_fk_portalapp_profile_type_id` FOREIGN KEY (`profile_id`) REFERENCES `portalapp_profile_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_experience_internship`
--

LOCK TABLES `portalapp_experience_internship` WRITE;
/*!40000 ALTER TABLE `portalapp_experience_internship` DISABLE KEYS */;
/*!40000 ALTER TABLE `portalapp_experience_internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_experience_placement`
--

DROP TABLE IF EXISTS `portalapp_experience_placement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_experience_placement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `criteria` varchar(500) DEFAULT NULL,
  `onoffcampus` int(11) NOT NULL,
  `package` double DEFAULT NULL,
  `cgpa` double DEFAULT NULL,
  `num_of_rounds` int(11) NOT NULL,
  `other_comments` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  `valid` int(11) NOT NULL,
  `cdr_id_id` int(11) DEFAULT NULL,
  `profile_id` int(11),
  `round1_text_id` int(11),
  `round2_text_id` int(11),
  `round3_text_id` int(11),
  `round4_text_id` int(11),
  `round5_text_id` int(11),
  `round6_text_id` int(11),
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `a6567ebce2c8a9ce39750c1f0efb01ba` (`cdr_id_id`),
  KEY `portalapp_experience_placement_83a0eb3f` (`profile_id`),
  KEY `portalapp_experience_placement_aa922236` (`round1_text_id`),
  KEY `portalapp_experience_placement_ee0331d8` (`round2_text_id`),
  KEY `portalapp_experience_placement_e1367d66` (`round3_text_id`),
  KEY `portalapp_experience_placement_bcc892e3` (`round4_text_id`),
  KEY `portalapp_experience_placement_36a376a5` (`round5_text_id`),
  KEY `portalapp_experience_placement_0fac9153` (`round6_text_id`),
  KEY `portalapp_experience_placement_3b029f5a` (`userid_id`),
  CONSTRAINT `a6567ebce2c8a9ce39750c1f0efb01ba` FOREIGN KEY (`cdr_id_id`) REFERENCES `portalapp_company_department_relation` (`id`),
  CONSTRAINT `b4d0887f820168d41c75f00833fddea9` FOREIGN KEY (`round4_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `D12d1d468c8e68cc2537401d802d1995` FOREIGN KEY (`userid_id`) REFERENCES `portalapp_personinformation` (`clg_id`),
  CONSTRAINT `D23522577db37c012d4433b211c26cc4` FOREIGN KEY (`round3_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `D23da4db554e0bb38487fbab1ebb5d58` FOREIGN KEY (`round6_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `D37064c88403851025c2627bc620ed73` FOREIGN KEY (`round2_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `D50f3a1bd679f232e36d815d02f99aec` FOREIGN KEY (`round5_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `dfe3eae756d94f53587fe51b847552f7` FOREIGN KEY (`round1_text_id`) REFERENCES `portalapp_interviewround_details` (`id`),
  CONSTRAINT `portala_profile_id_5ff42e3be7e8838e_fk_portalapp_profile_type_id` FOREIGN KEY (`profile_id`) REFERENCES `portalapp_profile_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_experience_placement`
--

LOCK TABLES `portalapp_experience_placement` WRITE;
/*!40000 ALTER TABLE `portalapp_experience_placement` DISABLE KEYS */;
INSERT INTO `portalapp_experience_placement` VALUES (2,'Around 400 students from our university were eligible to attend the interview process conducted by PayPal Pvt. Ltd., The selection criteria was based on the CGPA till 4th semester. Luckily I was one among them!',1,12000,5,1,'','2017-02-26 05:21:33',1,1,1,2,NULL,NULL,NULL,NULL,NULL,15616),(3,'Around 400 students from our university were eligible to attend the interview process conducted by PayPal Pvt. Ltd., The selection criteria was based on the CGPA till 4th semester. Luckily I was one among them!',1,12000,5,1,'','2017-02-26 06:45:40',-1,1,1,3,NULL,NULL,NULL,NULL,NULL,15616);
/*!40000 ALTER TABLE `portalapp_experience_placement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_forlogin`
--

DROP TABLE IF EXISTS `portalapp_forlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_forlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(500) DEFAULT NULL,
  `clg_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portalapp_forlogin_cfce2944` (`clg_id_id`),
  CONSTRAINT `a18827cdd4d8e1d9877957a1b1c0c04b` FOREIGN KEY (`clg_id_id`) REFERENCES `portalapp_personinformation` (`clg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_forlogin`
--

LOCK TABLES `portalapp_forlogin` WRITE;
/*!40000 ALTER TABLE `portalapp_forlogin` DISABLE KEYS */;
INSERT INTO `portalapp_forlogin` VALUES (39,'pbkdf2_sha256$20000$QsmkD1L7dPdN$DiUKnQmP0ZZ9ClEda6+ojgCjVjamoLsp836jZMGljkU=',15616),(40,'pbkdf2_sha256$20000$uSAz0xGoS5ML$g82mDhJLqRqL6ILfJajqPFF7qv2GbeyGiFuPerKFbVM=',15567);
/*!40000 ALTER TABLE `portalapp_forlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_interviewround_details`
--

DROP TABLE IF EXISTS `portalapp_interviewround_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_interviewround_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `description` longtext,
  `difficulty_id` int(11) NOT NULL,
  `round_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p_difficulty_id_466e9b0a8bfa6d55_fk_portalapp_difficulty_type_id` (`difficulty_id`),
  KEY `portalapp_interviewround_details_d2a2c124` (`round_type_id`),
  CONSTRAINT `D704cf5ec05a2f15818c56ebe864ecee` FOREIGN KEY (`round_type_id`) REFERENCES `portalapp_interviewround_type` (`id`),
  CONSTRAINT `p_difficulty_id_466e9b0a8bfa6d55_fk_portalapp_difficulty_type_id` FOREIGN KEY (`difficulty_id`) REFERENCES `portalapp_difficulty_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_interviewround_details`
--

LOCK TABLES `portalapp_interviewround_details` WRITE;
/*!40000 ALTER TABLE `portalapp_interviewround_details` DISABLE KEYS */;
INSERT INTO `portalapp_interviewround_details` VALUES (1,30,'Great EXpeirence',1,7),(2,30,'',1,2),(3,30,'',1,2);
/*!40000 ALTER TABLE `portalapp_interviewround_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_interviewround_type`
--

DROP TABLE IF EXISTS `portalapp_interviewround_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_interviewround_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` longtext NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_interviewround_type`
--

LOCK TABLES `portalapp_interviewround_type` WRITE;
/*!40000 ALTER TABLE `portalapp_interviewround_type` DISABLE KEYS */;
INSERT INTO `portalapp_interviewround_type` VALUES (2,'Resume Shortlist','Resume Shortlist'),(3,'Computer Based Test','Computer Based Test'),(4,'Written Test','Written Test'),(5,'Group Discussion','Group Discussion'),(6,'HR Interview','HR Interview'),(7,'Summary','Giving summary of all rounds'),(8,'Telephonic Interview','Telephonic Interview'),(9,'Technical','Technical');
/*!40000 ALTER TABLE `portalapp_interviewround_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_personinformation`
--

DROP TABLE IF EXISTS `portalapp_personinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_personinformation` (
  `email` varchar(100) NOT NULL,
  `firstname` longtext,
  `lastname` longtext,
  `telephone1` varchar(15) DEFAULT NULL,
  `telephone2` varchar(15),
  `clg_id` int(11) NOT NULL,
  `deptid` int(11) NOT NULL,
  `roll_no` longtext,
  `createdondate` date NOT NULL,
  `is_active` int(11) NOT NULL,
  `roleid_id` int(11) NOT NULL,
  PRIMARY KEY (`clg_id`),
  KEY `portalapp_personinformation_f60990d5` (`roleid_id`),
  CONSTRAINT `portalapp_p_roleid_id_1611c56e0d668e5_fk_portalapp_roles_role_id` FOREIGN KEY (`roleid_id`) REFERENCES `portalapp_roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_personinformation`
--

LOCK TABLES `portalapp_personinformation` WRITE;
/*!40000 ALTER TABLE `portalapp_personinformation` DISABLE KEYS */;
INSERT INTO `portalapp_personinformation` VALUES ('soniaa.godhwani@gmail.com','Sonia','Godhwani','8446117954','',15567,1,'BT13CSE037','2017-02-26',1,1),('ddgandhi.96@gmail.com','Dhiraj','Gandhi','9689089054','8655022884',15616,1,'BT13CSE033','2017-02-26',1,2);
/*!40000 ALTER TABLE `portalapp_personinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_profile_type`
--

DROP TABLE IF EXISTS `portalapp_profile_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_profile_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` longtext NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_profile_type`
--

LOCK TABLES `portalapp_profile_type` WRITE;
/*!40000 ALTER TABLE `portalapp_profile_type` DISABLE KEYS */;
INSERT INTO `portalapp_profile_type` VALUES (1,'IT Services','IT Services'),(2,'Sales','Sales'),(3,'Operations','Operations'),(4,'KPO','KPO'),(5,'ITES BPO','ITES BPO'),(6,'Core- Plant','Core- Plant'),(7,'IT Product','IT Product'),(8,'Core - R & D','Core - R & D');
/*!40000 ALTER TABLE `portalapp_profile_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_requests`
--

DROP TABLE IF EXISTS `portalapp_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` longtext,
  `status` int(11) NOT NULL,
  `company_id_id` int(11) DEFAULT NULL,
  `intern_exp_id_id` int(11) DEFAULT NULL,
  `job_exp_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `por_company_id_id_3c60a42d186b5f5d_fk_portalapp_company_table_id` (`company_id_id`),
  KEY `D432c2ef579840ce60f33cff94fbf501` (`intern_exp_id_id`),
  KEY `D71a7745ebf9c86bb7f3b2b03883d4a3` (`job_exp_id_id`),
  CONSTRAINT `D432c2ef579840ce60f33cff94fbf501` FOREIGN KEY (`intern_exp_id_id`) REFERENCES `portalapp_experience_internship` (`id`),
  CONSTRAINT `D71a7745ebf9c86bb7f3b2b03883d4a3` FOREIGN KEY (`job_exp_id_id`) REFERENCES `portalapp_experience_placement` (`id`),
  CONSTRAINT `por_company_id_id_3c60a42d186b5f5d_fk_portalapp_company_table_id` FOREIGN KEY (`company_id_id`) REFERENCES `portalapp_company_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_requests`
--

LOCK TABLES `portalapp_requests` WRITE;
/*!40000 ALTER TABLE `portalapp_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `portalapp_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_roles`
--

DROP TABLE IF EXISTS `portalapp_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` longtext,
  `long_name` longtext,
  `display_name` longtext,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_roles`
--

LOCK TABLES `portalapp_roles` WRITE;
/*!40000 ALTER TABLE `portalapp_roles` DISABLE KEYS */;
INSERT INTO `portalapp_roles` VALUES (1,'Student','Student','Student'),(2,'TNP Head','TNP Head','TNP Head'),(3,'Admin','Admin','Admin');
/*!40000 ALTER TABLE `portalapp_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalapp_session`
--

DROP TABLE IF EXISTS `portalapp_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalapp_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` longtext NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalapp_session`
--

LOCK TABLES `portalapp_session` WRITE;
/*!40000 ALTER TABLE `portalapp_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `portalapp_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-26 13:34:10
