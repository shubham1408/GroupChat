-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: chat
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add chat group',7,'add_chatgroup'),(26,'Can change chat group',7,'change_chatgroup'),(27,'Can delete chat group',7,'delete_chatgroup'),(28,'Can view chat group',7,'view_chatgroup'),(29,'Can add message',8,'add_message'),(30,'Can change message',8,'change_message'),(31,'Can delete message',8,'delete_message'),(32,'Can view message',8,'view_message'),(33,'Can add auth token',9,'add_authtoken'),(34,'Can change auth token',9,'change_authtoken'),(35,'Can delete auth token',9,'delete_authtoken'),(36,'Can view auth token',9,'view_authtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$PHwsmBY8H9lPdUpKYZFRhv$LDd0kCHfGda1flm00eznJLQMAolGhXUhJVFT3O9cTXY=','2023-02-28 10:37:04.546328',1,'shubham','','','',1,1,'2023-02-27 09:22:36.336927'),(2,'pbkdf2_sha256$390000$J4DnAUcesAY0HosYj1r7iB$deAWUd6NnHD+pf4Foav8M/7YOMGTRiiDtBBxjK0jOZA=','2023-02-27 10:16:58.220869',0,'ankita','','','',0,1,'2023-02-27 09:32:30.510864'),(3,'pbkdf2_sha256$390000$3xSXn6PNsbrXBjNBYo94Jy$DO+naO/BNM3r6+RjN7NUmYhvKL05eHZdoBUnHptWX5Q=',NULL,0,'ankita2','','','',0,1,'2023-02-27 09:35:09.069574'),(4,'pbkdf2_sha256$390000$RpsleWFumxPVqpyhHzGfJ8$RFlwNobBlk+iJ5UbUSqV6X2A4DadlHuSXPgToKnfISU=',NULL,0,'ankita3','','','',0,1,'2023-02-27 09:35:32.399289'),(5,'pbkdf2_sha256$390000$n6zeYV213LRSuo9PCZlVq8$DgBf6/dkbcgzkZiOBNp9JkKFGw1q3+J8TCpWiJyIsQ8=',NULL,0,'ankita4','','','',0,1,'2023-02-27 09:36:06.813976'),(6,'pbkdf2_sha256$390000$peO4lOtBhmvVgY8iF4Uv2X$aPN+slBOlqPZBFk+4zveXGTzYC/TG9FTEW96yfErb0I=',NULL,0,'ankita18','','','',0,1,'2023-02-27 09:52:15.150548'),(7,'pbkdf2_sha256$390000$yZHp2FuXzFenvtBnL0c9Px$QRAfCZ/y2vpI38DO2Tc0uP7n4WdUhBOrBFdtSM+yPhY=',NULL,0,'ankiter','','','',0,1,'2023-02-27 15:00:02.705930');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_chatgroup`
--

DROP TABLE IF EXISTS `chat_chatgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_chatgroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_chatgroup`
--

LOCK TABLES `chat_chatgroup` WRITE;
/*!40000 ALTER TABLE `chat_chatgroup` DISABLE KEYS */;
INSERT INTO `chat_chatgroup` VALUES (1,'Room1','2023-02-27 09:23:30.231035','2023-02-27 09:23:30.231054'),(2,'Room2','2023-02-27 09:23:55.643217','2023-02-27 12:19:07.267226'),(3,'Room3','2023-02-27 10:53:49.981678','2023-02-27 11:32:51.898806'),(4,'Room4','2023-02-28 10:23:51.521138','2023-02-28 10:23:51.521168');
/*!40000 ALTER TABLE `chat_chatgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_chatgroup_members`
--

DROP TABLE IF EXISTS `chat_chatgroup_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_chatgroup_members` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chatgroup_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_chatgroup_members_chatgroup_id_user_id_df46c8c7_uniq` (`chatgroup_id`,`user_id`),
  KEY `chat_chatgroup_members_user_id_f643cbf7_fk_auth_user_id` (`user_id`),
  CONSTRAINT `chat_chatgroup_membe_chatgroup_id_1f624ef9_fk_chat_chat` FOREIGN KEY (`chatgroup_id`) REFERENCES `chat_chatgroup` (`id`),
  CONSTRAINT `chat_chatgroup_members_user_id_f643cbf7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_chatgroup_members`
--

LOCK TABLES `chat_chatgroup_members` WRITE;
/*!40000 ALTER TABLE `chat_chatgroup_members` DISABLE KEYS */;
INSERT INTO `chat_chatgroup_members` VALUES (1,1,1),(2,2,1),(3,3,1),(4,3,2),(6,4,1);
/*!40000 ALTER TABLE `chat_chatgroup_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(1200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `group_id` bigint NOT NULL,
  `sender_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_message_group_id_1d135dcf_fk_chat_chatgroup_id` (`group_id`),
  KEY `chat_message_sender_id_991c686c_fk_auth_user_id` (`sender_id`),
  CONSTRAINT `chat_message_group_id_1d135dcf_fk_chat_chatgroup_id` FOREIGN KEY (`group_id`) REFERENCES `chat_chatgroup` (`id`),
  CONSTRAINT `chat_message_sender_id_991c686c_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
INSERT INTO `chat_message` VALUES (1,'hi','2023-02-27 12:53:32.438609','2023-02-27 12:55:26.496598',1,1),(2,'hi2','2023-02-27 12:57:04.418357','2023-02-27 12:57:04.418380',1,1);
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message_liked_by_users`
--

DROP TABLE IF EXISTS `chat_message_liked_by_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message_liked_by_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_message_liked_by_users_message_id_user_id_5ecfda77_uniq` (`message_id`,`user_id`),
  KEY `chat_message_liked_by_users_user_id_827dcf9e_fk_auth_user_id` (`user_id`),
  CONSTRAINT `chat_message_liked_b_message_id_4b5eb2dc_fk_chat_mess` FOREIGN KEY (`message_id`) REFERENCES `chat_message` (`id`),
  CONSTRAINT `chat_message_liked_by_users_user_id_827dcf9e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message_liked_by_users`
--

LOCK TABLES `chat_message_liked_by_users` WRITE;
/*!40000 ALTER TABLE `chat_message_liked_by_users` DISABLE KEYS */;
INSERT INTO `chat_message_liked_by_users` VALUES (1,1,1);
/*!40000 ALTER TABLE `chat_message_liked_by_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-02-27 09:23:30.232443','1','ChatGroup object (1)',1,'[{\"added\": {}}]',7,1),(2,'2023-02-27 09:23:55.644689','2','ChatGroup object (2)',1,'[{\"added\": {}}]',7,1),(3,'2023-02-27 10:03:27.096309','68cbdc427d6a8c08c0f2908e6e028faf308739de90c98c3fe402800d27ad0f6369f1a9c2f821019edab98f0716403b423b81a4a5696b85abf774d97cc7019477','68cbdc427d6a8c08c0f2908e6e028faf308739de90c98c3fe402800d27ad0f6369f1a9c2f821019edab98f0716403b423b81a4a5696b85abf774d97cc7019477 : shubham',3,'',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'chat','chatgroup'),(8,'chat','message'),(5,'contenttypes','contenttype'),(9,'knox','authtoken'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-02-27 09:21:43.659402'),(2,'auth','0001_initial','2023-02-27 09:21:44.103904'),(3,'admin','0001_initial','2023-02-27 09:21:44.209682'),(4,'admin','0002_logentry_remove_auto_add','2023-02-27 09:21:44.219149'),(5,'admin','0003_logentry_add_action_flag_choices','2023-02-27 09:21:44.226366'),(6,'contenttypes','0002_remove_content_type_name','2023-02-27 09:21:44.284422'),(7,'auth','0002_alter_permission_name_max_length','2023-02-27 09:21:44.328188'),(8,'auth','0003_alter_user_email_max_length','2023-02-27 09:21:44.346931'),(9,'auth','0004_alter_user_username_opts','2023-02-27 09:21:44.356664'),(10,'auth','0005_alter_user_last_login_null','2023-02-27 09:21:44.392524'),(11,'auth','0006_require_contenttypes_0002','2023-02-27 09:21:44.395573'),(12,'auth','0007_alter_validators_add_error_messages','2023-02-27 09:21:44.401839'),(13,'auth','0008_alter_user_username_max_length','2023-02-27 09:21:44.447386'),(14,'auth','0009_alter_user_last_name_max_length','2023-02-27 09:21:44.492599'),(15,'auth','0010_alter_group_name_max_length','2023-02-27 09:21:44.514427'),(16,'auth','0011_update_proxy_permissions','2023-02-27 09:21:44.521957'),(17,'auth','0012_alter_user_first_name_max_length','2023-02-27 09:21:44.566333'),(18,'sessions','0001_initial','2023-02-27 09:21:44.598244'),(19,'chat','0001_initial','2023-02-27 09:22:14.933377'),(20,'knox','0001_initial','2023-02-27 09:35:45.681866'),(21,'knox','0002_auto_20150916_1425','2023-02-27 09:35:45.764802'),(22,'knox','0003_auto_20150916_1526','2023-02-27 09:35:45.789843'),(23,'knox','0004_authtoken_expires','2023-02-27 09:35:45.834448'),(24,'knox','0005_authtoken_token_key','2023-02-27 09:35:45.891969'),(25,'knox','0006_auto_20160818_0932','2023-02-27 09:35:45.955106'),(26,'knox','0007_auto_20190111_0542','2023-02-27 09:35:45.981871'),(27,'knox','0008_remove_authtoken_salt','2023-02-27 09:35:46.024213');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('hvx8q31jg6u4owgwhynxnzi7xjrly8pi','.eJxVjDsOwjAQRO_iGlmss_5R0nMGa722cQA5UpxUiLuTSCmgG817M28RaF1qWHuew5jERYA4_XaR-JnbDtKD2n2SPLVlHqPcFXnQLm9Tyq_r4f4dVOp1W3uHAwNqjDxEhdko57CAUbAFXxRHVHgmcMVkjWitBtDosZBh61IRny-sSDaV:1pWxM0:IEDeEUrvmwJ8xToq1VIv_owbwY5L3W9PMBb3zeLrmyM','2023-03-14 10:37:04.549278'),('vk8mnkf7cyy32okxoxy2pci3oel6h34f','.eJxVjDsOwjAQRO_iGlmss_5R0nMGa722cQA5UpxUiLuTSCmgG817M28RaF1qWHuew5jERYA4_XaR-JnbDtKD2n2SPLVlHqPcFXnQLm9Tyq_r4f4dVOp1W3uHAwNqjDxEhdko57CAUbAFXxRHVHgmcMVkjWitBtDosZBh61IRny-sSDaV:1pWxDY:RkMeja8kccxNzr1oE-TndKCTqnnYMDdGdGoi94aw-5Q','2023-03-14 10:28:20.549587');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knox_authtoken`
--

DROP TABLE IF EXISTS `knox_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knox_authtoken` (
  `digest` varchar(128) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `expiry` datetime(6) DEFAULT NULL,
  `token_key` varchar(8) NOT NULL,
  PRIMARY KEY (`digest`),
  KEY `knox_authtoken_user_id_e5a5d899_fk_auth_user_id` (`user_id`),
  KEY `knox_authtoken_token_key_8f4f7d47` (`token_key`),
  CONSTRAINT `knox_authtoken_user_id_e5a5d899_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knox_authtoken`
--

LOCK TABLES `knox_authtoken` WRITE;
/*!40000 ALTER TABLE `knox_authtoken` DISABLE KEYS */;
INSERT INTO `knox_authtoken` VALUES ('30bbcebd7f9b6f0691a0a3a1b0b0205deac155942da10bd737ec8b198c5f640ac79a7082ba8f549d789ffb551e72196a3dd9b4aa95af8d27e4fb22b9d8b5c45f','2023-02-27 15:00:02.866917',7,'2023-02-28 01:00:02.866635','d8ab83d9'),('67b847018aa5528f605346779d19fe24ab16138dd3851c42c0b74281ef4e2e42f33166b20e177fa81a3931bd90e052fbc6fc9098ba7c557438e3c42ef6024e4b','2023-02-28 10:28:20.544390',1,'2023-02-28 20:28:20.544137','4cf88416'),('6b47aaa508e7af7b9f480890980b6cac89ff4c39c599cb8cb594d45b390c5c797adaf7baa4d56c7ead1d769aed3a83c2afb44ef3e188932af4c19afa2d1a68ff','2023-02-28 10:26:54.659982',1,'2023-02-28 20:26:54.659769','c916edcd'),('ae1e769b1085b867650d3654c2f53510ca78357a326bbd885e64eef37defc4cd53a9025aaddebf4ba4127436702030c05d78a221fba487ee90208b89354fb8ef','2023-02-28 10:27:52.914428',1,'2023-02-28 20:27:52.914146','6eaeba52'),('db0171d305651c4f0473ce61086913d04f6124eb22dbde68f6b8e3ebf82b28f2be5cd05ff897546a0db6a9e4e7f8067fa9d8b02f0590aa697183e975cd4906c1','2023-02-27 09:52:15.252430',6,'2023-02-27 19:52:15.252075','65d59702'),('e42e06081712d3b8dcf8d2a5df380192ed538b10e6f2cda0cfce443e0eed1ac2aea33bb1eb4d9e9261d462ad9f79f407eb669761d141ef641c9f19ff8c97ca8e','2023-02-27 16:21:32.392844',1,'2023-02-28 02:21:32.392589','fd65658b'),('fd9cb001ceaefd34fbe33d80f42c064aa6d044cc2eb9d7e61a6ab156e281c51a849116ba574cfcba21f1e10e90e27ed086b9cf2da26c227d9c3f81560bcdb67a','2023-02-27 09:36:06.915629',5,'2023-02-27 19:36:06.915356','93493bb1');
/*!40000 ALTER TABLE `knox_authtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-28 16:25:13
