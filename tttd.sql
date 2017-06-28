# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: localhost (MySQL 5.6.35)
# Base de données: ttt3
# Temps de génération: 2017-06-26 20:11:15 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table games
# ------------------------------------------------------------

DROP TABLE IF EXISTS `games`;

CREATE TABLE `games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `winner_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `is_started` tinyint(1) NOT NULL DEFAULT '0',
  `first_player_id` int(11) NOT NULL,
  `second_player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;

INSERT INTO `games` (`id`, `winner_id`, `created_at`, `updated_at`, `end_date`, `is_started`, `first_player_id`, `second_player_id`)
VALUES
	(1,2,'2017-06-26 08:35:05','2017-06-26 09:10:37','2017-06-26 09:10:37',1,1,2),
	(2,1,'2017-06-26 09:04:04','2017-06-26 09:05:36','2017-06-26 09:05:36',1,1,3),
	(3,3,'2017-06-26 09:07:22','2017-06-26 09:09:56','2017-06-26 09:09:56',1,1,3),
	(4,1,'2017-06-26 09:08:04','2017-06-26 09:09:06','2017-06-26 09:09:06',1,3,1),
	(5,NULL,'2017-06-26 18:16:58','2017-06-26 18:17:29','2017-06-26 18:17:29',1,2,1),
	(6,2,'2017-06-26 18:30:38','2017-06-26 18:31:05','2017-06-26 18:31:05',1,2,1),
	(7,1,'2017-06-26 18:31:13','2017-06-26 18:32:37','2017-06-26 18:32:37',1,1,2),
	(8,2,'2017-06-26 18:34:52','2017-06-26 18:35:25','2017-06-26 18:35:25',1,1,2),
	(11,2,'2017-06-26 18:36:38','2017-06-26 18:37:31','2017-06-26 18:37:31',1,1,2),
	(19,1,'2017-06-26 18:47:09','2017-06-26 18:47:33','2017-06-26 18:47:33',1,2,1),
	(20,2,'2017-06-26 18:48:23','2017-06-26 19:00:12','2017-06-26 19:00:12',1,1,2),
	(22,1,'2017-06-26 19:16:06','2017-06-26 19:24:46','2017-06-26 19:24:46',1,2,1),
	(23,1,'2017-06-26 19:29:12','2017-06-26 19:42:27','2017-06-26 19:42:27',1,2,1),
	(24,2,'2017-06-26 19:43:40','2017-06-26 19:56:41','2017-06-26 19:56:41',1,2,1),
	(26,2,'2017-06-26 19:55:25','2017-06-26 19:56:07','2017-06-26 19:56:07',1,1,2),
	(27,1,'2017-06-26 19:59:01','2017-06-26 19:59:40','2017-06-26 19:59:40',1,2,1);

/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;

INSERT INTO `messages` (`id`, `game_id`, `user_id`, `message`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'salut','2017-06-26 08:35:41','2017-06-26 08:35:41'),
	(2,1,2,'hello','2017-06-26 08:35:49','2017-06-26 08:35:49'),
	(3,4,3,'gfhnfghnghn','2017-06-26 09:09:18','2017-06-26 09:09:18'),
	(4,4,1,'ghnghnghn','2017-06-26 09:09:22','2017-06-26 09:09:22'),
	(5,7,2,'ghngnhgfh','2017-06-26 18:32:43','2017-06-26 18:32:43'),
	(6,7,1,'ghnghnn','2017-06-26 18:32:46','2017-06-26 18:32:46'),
	(7,19,2,'fgvfdvg','2017-06-26 18:47:40','2017-06-26 18:47:40'),
	(8,19,1,'fgvfvg','2017-06-26 18:47:43','2017-06-26 18:47:43'),
	(9,20,2,'dfvdfvdfv','2017-06-26 18:48:49','2017-06-26 18:48:49'),
	(10,20,1,'dfvdfvdfv','2017-06-26 18:48:51','2017-06-26 18:48:51'),
	(11,22,2,'bn nbhnhgnf','2017-06-26 19:16:23','2017-06-26 19:16:23'),
	(12,22,1,'hnhgjn','2017-06-26 19:16:31','2017-06-26 19:16:31'),
	(13,23,2,'fghnghng','2017-06-26 19:29:31','2017-06-26 19:29:31'),
	(14,23,1,'ghnghn','2017-06-26 19:29:37','2017-06-26 19:29:37'),
	(15,24,2,'rtgrtg','2017-06-26 19:44:14','2017-06-26 19:44:14'),
	(16,24,1,'fgbfgb','2017-06-26 19:47:04','2017-06-26 19:47:04'),
	(17,27,2,'dfvdfv','2017-06-26 19:59:21','2017-06-26 19:59:21'),
	(18,27,1,'dfvdfv','2017-06-26 19:59:25','2017-06-26 19:59:25');

/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;

INSERT INTO `password_resets` (`email`, `token`, `created_at`)
VALUES
	('thomas5757@outlook.com','$2y$10$Sef8BscwbXaCfcJYUeXX8uKDTr6Folb9DTWujjs3QCsCM.mG9yLKy','2017-06-26 11:28:55'),
	('gt3rs5757@yahoo.fr','$2y$10$jfkZLn/FX.HTpWSFFoW0lemSvnMjgmXNZLGEnk2k4TbsW4tXK9XFy','2017-06-26 11:34:05');

/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;

INSERT INTO `reports` (`id`, `message_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,2,'2017-06-26 08:35:54','2017-06-26 08:35:54'),
	(5,1,2,'2017-06-26 19:44:17','2017-06-26 19:44:17'),
	(9,2,1,'2017-06-26 19:59:28','2017-06-26 19:59:28');

/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table turns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `turns`;

CREATE TABLE `turns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL,
  `game_id` int(10) unsigned NOT NULL,
  `location` enum('1','2','3','4','5','6','7','8','9') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('x','o') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `turn_id` enum('1','2','3','4','5','6','7','8','9') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`game_id`),
  KEY `turns_player_id_foreign` (`player_id`),
  KEY `turns_game_id_foreign` (`game_id`),
  CONSTRAINT `turns_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  CONSTRAINT `turns_player_id_foreign` FOREIGN KEY (`player_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `turns` WRITE;
/*!40000 ALTER TABLE `turns` DISABLE KEYS */;

INSERT INTO `turns` (`id`, `player_id`, `game_id`, `location`, `type`, `created_at`, `updated_at`, `turn_id`)
VALUES
	(1,2,1,'3','x',NULL,'2017-06-26 08:35:24','1'),
	(2,1,1,'2','o',NULL,'2017-06-26 08:35:34','2'),
	(3,2,1,'6','x',NULL,'2017-06-26 08:35:36','3'),
	(4,1,1,'5','o',NULL,'2017-06-26 08:35:37','4'),
	(5,2,1,'1','x',NULL,'2017-06-26 09:10:34','5'),
	(6,1,1,'4','o',NULL,'2017-06-26 09:10:36','6'),
	(7,2,1,'9','x',NULL,'2017-06-26 09:10:37','7'),
	(8,1,1,NULL,'o',NULL,NULL,'8'),
	(9,2,1,NULL,'x',NULL,NULL,'9'),
	(10,3,2,'3','x',NULL,'2017-06-26 09:04:31','1'),
	(11,1,2,'6','o',NULL,'2017-06-26 09:04:55','2'),
	(12,3,2,'2','x',NULL,'2017-06-26 09:05:02','3'),
	(13,1,2,'5','o',NULL,'2017-06-26 09:05:04','4'),
	(14,3,2,'1','x',NULL,'2017-06-26 09:05:06','5'),
	(15,1,2,'4','o',NULL,'2017-06-26 09:05:14','6'),
	(16,3,2,'7','x',NULL,'2017-06-26 09:05:28','7'),
	(17,1,2,'8','o',NULL,'2017-06-26 09:05:36','8'),
	(18,3,2,NULL,'x',NULL,NULL,'9'),
	(19,3,3,'3','x',NULL,'2017-06-26 09:07:41','1'),
	(20,1,3,'2','o',NULL,'2017-06-26 09:09:44','2'),
	(21,3,3,'5','x',NULL,'2017-06-26 09:09:52','3'),
	(22,1,3,'6','o',NULL,'2017-06-26 09:09:53','4'),
	(23,3,3,'7','x',NULL,'2017-06-26 09:09:56','5'),
	(24,1,3,NULL,'o',NULL,NULL,'6'),
	(25,3,3,NULL,'x',NULL,NULL,'7'),
	(26,1,3,NULL,'o',NULL,NULL,'8'),
	(27,3,3,NULL,'x',NULL,NULL,'9'),
	(28,1,4,'1','x',NULL,'2017-06-26 09:08:12','1'),
	(29,3,4,'2','o',NULL,'2017-06-26 09:08:36','2'),
	(30,1,4,'3','x',NULL,'2017-06-26 09:08:59','3'),
	(31,3,4,'6','o',NULL,'2017-06-26 09:09:01','4'),
	(32,1,4,'5','x',NULL,'2017-06-26 09:09:03','5'),
	(33,3,4,'4','o',NULL,'2017-06-26 09:09:05','6'),
	(34,1,4,'9','x',NULL,'2017-06-26 09:09:06','7'),
	(35,3,4,NULL,'o',NULL,NULL,'8'),
	(36,1,4,NULL,'x',NULL,NULL,'9'),
	(37,1,5,'3','x',NULL,'2017-06-26 18:17:08','1'),
	(38,2,5,'2','o',NULL,'2017-06-26 18:17:14','2'),
	(39,1,5,'1','x',NULL,'2017-06-26 18:17:17','3'),
	(40,2,5,'6','o',NULL,'2017-06-26 18:17:19','4'),
	(41,1,5,'5','x',NULL,'2017-06-26 18:17:20','5'),
	(42,2,5,'9','o',NULL,'2017-06-26 18:17:21','6'),
	(43,1,5,'8','x',NULL,'2017-06-26 18:17:25','7'),
	(44,2,5,'7','o',NULL,'2017-06-26 18:17:27','8'),
	(45,1,5,'4','x',NULL,'2017-06-26 18:17:29','9'),
	(46,1,6,'3','x',NULL,'2017-06-26 18:30:46','1'),
	(47,2,6,'2','o',NULL,'2017-06-26 18:30:53','2'),
	(48,1,6,'1','x',NULL,'2017-06-26 18:30:55','3'),
	(49,2,6,'6','o',NULL,'2017-06-26 18:30:58','4'),
	(50,1,6,'9','x',NULL,'2017-06-26 18:30:59','5'),
	(51,2,6,'5','o',NULL,'2017-06-26 18:31:01','6'),
	(52,1,6,'4','x',NULL,'2017-06-26 18:31:03','7'),
	(53,2,6,'8','o',NULL,'2017-06-26 18:31:05','8'),
	(54,1,6,NULL,'x',NULL,NULL,'9'),
	(55,1,6,NULL,'x',NULL,NULL,'1'),
	(56,2,6,NULL,'o',NULL,NULL,'2'),
	(57,1,6,NULL,'x',NULL,NULL,'3'),
	(58,2,6,NULL,'o',NULL,NULL,'4'),
	(59,1,6,NULL,'x',NULL,NULL,'5'),
	(60,2,6,NULL,'o',NULL,NULL,'6'),
	(61,1,6,NULL,'x',NULL,NULL,'7'),
	(62,2,6,NULL,'o',NULL,NULL,'8'),
	(63,1,6,NULL,'x',NULL,NULL,'9'),
	(64,2,7,'3','x',NULL,'2017-06-26 18:32:23','1'),
	(65,1,7,'2','o',NULL,'2017-06-26 18:32:27','2'),
	(66,2,7,'1','x',NULL,'2017-06-26 18:32:32','3'),
	(67,1,7,'5','o',NULL,'2017-06-26 18:32:35','4'),
	(68,2,7,'6','x',NULL,'2017-06-26 18:32:36','5'),
	(69,1,7,'8','o',NULL,'2017-06-26 18:32:37','6'),
	(70,2,7,NULL,'x',NULL,NULL,'7'),
	(71,1,7,NULL,'o',NULL,NULL,'8'),
	(72,2,7,NULL,'x',NULL,NULL,'9'),
	(73,2,7,NULL,'x',NULL,NULL,'1'),
	(74,1,7,NULL,'o',NULL,NULL,'2'),
	(75,2,7,NULL,'x',NULL,NULL,'3'),
	(76,1,7,NULL,'o',NULL,NULL,'4'),
	(77,2,7,NULL,'x',NULL,NULL,'5'),
	(78,1,7,NULL,'o',NULL,NULL,'6'),
	(79,2,7,NULL,'x',NULL,NULL,'7'),
	(80,1,7,NULL,'o',NULL,NULL,'8'),
	(81,2,7,NULL,'x',NULL,NULL,'9'),
	(82,2,8,'3','x',NULL,'2017-06-26 18:35:10','1'),
	(83,1,8,'2','o',NULL,'2017-06-26 18:35:19','2'),
	(84,2,8,'6','x',NULL,'2017-06-26 18:35:22','3'),
	(85,1,8,'5','o',NULL,'2017-06-26 18:35:23','4'),
	(86,2,8,'9','x',NULL,'2017-06-26 18:35:25','5'),
	(87,1,8,NULL,'o',NULL,NULL,'6'),
	(88,2,8,NULL,'x',NULL,NULL,'7'),
	(89,1,8,NULL,'o',NULL,NULL,'8'),
	(90,2,8,NULL,'x',NULL,NULL,'9'),
	(91,2,11,'3','x',NULL,'2017-06-26 18:36:49','1'),
	(92,1,11,'2','o',NULL,'2017-06-26 18:36:55','2'),
	(93,2,11,'5','x',NULL,'2017-06-26 18:37:22','3'),
	(94,1,11,'1','o',NULL,'2017-06-26 18:37:23','4'),
	(95,2,11,'6','x',NULL,'2017-06-26 18:37:25','5'),
	(96,1,11,'4','o',NULL,'2017-06-26 18:37:27','6'),
	(97,2,11,'9','x',NULL,'2017-06-26 18:37:31','7'),
	(98,1,11,NULL,'o',NULL,NULL,'8'),
	(99,2,11,NULL,'x',NULL,NULL,'9'),
	(100,1,19,'3','x',NULL,'2017-06-26 18:47:15','1'),
	(101,2,19,'2','o',NULL,'2017-06-26 18:47:23','2'),
	(102,1,19,'6','x',NULL,'2017-06-26 18:47:26','3'),
	(103,2,19,'5','o',NULL,'2017-06-26 18:47:29','4'),
	(104,1,19,'9','x',NULL,'2017-06-26 18:47:33','5'),
	(105,2,19,NULL,'o',NULL,NULL,'6'),
	(106,1,19,NULL,'x',NULL,NULL,'7'),
	(107,2,19,NULL,'o',NULL,NULL,'8'),
	(108,1,19,NULL,'x',NULL,NULL,'9'),
	(109,2,20,'3','x',NULL,'2017-06-26 18:48:28','1'),
	(110,1,20,'2','o',NULL,'2017-06-26 18:48:40','2'),
	(111,2,20,'6','x',NULL,'2017-06-26 19:00:03','3'),
	(112,1,20,'5','o',NULL,'2017-06-26 19:00:05','4'),
	(113,2,20,'1','x',NULL,'2017-06-26 19:00:06','5'),
	(114,1,20,'4','o',NULL,'2017-06-26 19:00:08','6'),
	(115,2,20,'9','x',NULL,'2017-06-26 19:00:12','7'),
	(116,1,20,NULL,'o',NULL,NULL,'8'),
	(117,2,20,NULL,'x',NULL,NULL,'9'),
	(118,2,20,NULL,'x',NULL,NULL,'1'),
	(119,1,20,NULL,'o',NULL,NULL,'2'),
	(120,2,20,NULL,'x',NULL,NULL,'3'),
	(121,1,20,NULL,'o',NULL,NULL,'4'),
	(122,2,20,NULL,'x',NULL,NULL,'5'),
	(123,1,20,NULL,'o',NULL,NULL,'6'),
	(124,2,20,NULL,'x',NULL,NULL,'7'),
	(125,1,20,NULL,'o',NULL,NULL,'8'),
	(126,2,20,NULL,'x',NULL,NULL,'9'),
	(127,1,22,'3','x',NULL,'2017-06-26 19:16:58','1'),
	(128,2,22,'2','o',NULL,'2017-06-26 19:17:27','2'),
	(129,1,22,'6','x',NULL,'2017-06-26 19:17:56','3'),
	(130,2,22,'9','o',NULL,'2017-06-26 19:24:14','4'),
	(131,1,22,'5','x',NULL,'2017-06-26 19:24:40','5'),
	(132,2,22,'8','o',NULL,'2017-06-26 19:24:44','6'),
	(133,1,22,'4','x',NULL,'2017-06-26 19:24:46','7'),
	(134,2,22,NULL,'o',NULL,NULL,'8'),
	(135,1,22,NULL,'x',NULL,NULL,'9'),
	(136,1,22,NULL,'x',NULL,NULL,'1'),
	(137,2,22,NULL,'o',NULL,NULL,'2'),
	(138,1,22,NULL,'x',NULL,NULL,'3'),
	(139,2,22,NULL,'o',NULL,NULL,'4'),
	(140,1,22,NULL,'x',NULL,NULL,'5'),
	(141,2,22,NULL,'o',NULL,NULL,'6'),
	(142,1,22,NULL,'x',NULL,NULL,'7'),
	(143,2,22,NULL,'o',NULL,NULL,'8'),
	(144,1,22,NULL,'x',NULL,NULL,'9'),
	(145,1,23,'3','x',NULL,'2017-06-26 19:29:25','1'),
	(146,2,23,'6','o',NULL,'2017-06-26 19:42:12','2'),
	(147,1,23,'2','x',NULL,'2017-06-26 19:42:16','3'),
	(148,2,23,'5','o',NULL,'2017-06-26 19:42:18','4'),
	(149,1,23,'9','x',NULL,'2017-06-26 19:42:22','5'),
	(150,2,23,'8','o',NULL,'2017-06-26 19:42:24','6'),
	(151,1,23,'1','x',NULL,'2017-06-26 19:42:27','7'),
	(152,2,23,NULL,'o',NULL,NULL,'8'),
	(153,1,23,NULL,'x',NULL,NULL,'9'),
	(154,1,24,'3','x',NULL,'2017-06-26 19:44:03','1'),
	(155,2,24,'2','o',NULL,'2017-06-26 19:56:33','2'),
	(156,1,24,'6','x',NULL,'2017-06-26 19:56:35','3'),
	(157,2,24,'5','o',NULL,'2017-06-26 19:56:37','4'),
	(158,1,24,'4','x',NULL,'2017-06-26 19:56:40','5'),
	(159,2,24,'8','o',NULL,'2017-06-26 19:56:41','6'),
	(160,1,24,NULL,'x',NULL,NULL,'7'),
	(161,2,24,NULL,'o',NULL,NULL,'8'),
	(162,1,24,NULL,'x',NULL,NULL,'9'),
	(163,2,26,'3','x',NULL,'2017-06-26 19:55:44','1'),
	(164,1,26,'2','o',NULL,'2017-06-26 19:56:02','2'),
	(165,2,26,'6','x',NULL,'2017-06-26 19:56:04','3'),
	(166,1,26,'5','o',NULL,'2017-06-26 19:56:06','4'),
	(167,2,26,'9','x',NULL,'2017-06-26 19:56:07','5'),
	(168,1,26,NULL,'o',NULL,NULL,'6'),
	(169,2,26,NULL,'x',NULL,NULL,'7'),
	(170,1,26,NULL,'o',NULL,NULL,'8'),
	(171,2,26,NULL,'x',NULL,NULL,'9'),
	(172,1,27,'3','x',NULL,'2017-06-26 19:59:14','1'),
	(173,2,27,'2','o',NULL,'2017-06-26 19:59:36','2'),
	(174,1,27,'6','x',NULL,'2017-06-26 19:59:37','3'),
	(175,2,27,'5','o',NULL,'2017-06-26 19:59:39','4'),
	(176,1,27,'9','x',NULL,'2017-06-26 19:59:40','5'),
	(177,2,27,NULL,'o',NULL,NULL,'6'),
	(178,1,27,NULL,'x',NULL,NULL,'7'),
	(179,2,27,NULL,'o',NULL,NULL,'8'),
	(180,1,27,NULL,'x',NULL,NULL,'9');

/*!40000 ALTER TABLE `turns` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `country` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `score`, `remember_token`, `created_at`, `updated_at`, `is_admin`, `is_banned`, `country`)
VALUES
	(1,'Thomas CEPPINI','thomas5757@outlook.com','$2y$10$QDgCXeqv/xwV8oflLtyCpOUTdQLOaZVdiFq44kOqZb7L2ebfzm7yC',8,'I3arMjYxTbnSW3mZIQTJJDMxyz4wpheTaX4k2X4XPvzFsJjJjo33zDHyJcRx','2017-06-26 08:32:27','2017-06-26 19:59:40',1,0,'FR'),
	(2,'John DOE','gt3rs5757@yahoo.fr','$2y$10$3.onjEWTKxxZij5mkMWd/.LLOgX.siYM.m62ShS.B4sqvm.ksXPvy',7,'lhE4mPZSDdrOfgYVyCH3cgMQRnZLZKWBA68WVGVJidG5fvoNYyuBDscp29XZ','2017-06-26 08:33:51','2017-06-26 19:56:41',0,0,'FR'),
	(3,'Jean','jbe@yahoo.fr','$2y$10$Y8PfVKTKlGan.xYUsavk9uwTBgqD8BZHax2hQlonK0.GKMlbhITmG',3,'PpDxS4maxk4DEYVaZeG4Y8dMtdxGtQvx4PUQtmGHQemsDzKGzhyEKXjGw9bQ','2017-06-26 09:00:57','2017-06-26 09:09:56',0,0,'BE');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
