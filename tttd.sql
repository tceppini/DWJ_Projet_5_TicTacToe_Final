# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: localhost (MySQL 5.6.35)
# Base de données: tttd
# Temps de génération: 2017-06-15 07:55:28 +0000
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;

INSERT INTO `games` (`id`, `winner_id`, `created_at`, `updated_at`, `end_date`, `is_started`, `first_player_id`, `second_player_id`)
VALUES
	(1,1,'2017-06-14 13:28:49','2017-06-14 13:29:12','2017-06-14 13:29:12',1,2,1),
	(2,2,'2017-06-14 13:29:24','2017-06-14 13:30:01','2017-06-14 13:30:01',1,1,2),
	(4,1,'2017-06-14 13:30:46','2017-06-14 13:35:00','2017-06-14 13:35:00',1,2,1),
	(5,2,'2017-06-14 13:35:09','2017-06-14 13:35:30','2017-06-14 13:35:30',1,1,2),
	(6,1,'2017-06-14 13:35:46','2017-06-14 13:36:07','2017-06-14 13:36:07',1,2,1),
	(10,1,'2017-06-14 13:38:41','2017-06-14 13:39:01','2017-06-14 13:39:01',1,2,1),
	(11,1,'2017-06-14 14:14:19','2017-06-14 14:15:00','2017-06-14 14:15:00',1,2,1),
	(12,1,'2017-06-14 14:14:31','2017-06-14 14:15:33','2017-06-14 14:15:33',1,2,1),
	(13,2,'2017-06-14 14:15:39','2017-06-14 14:15:55','2017-06-14 14:15:55',1,1,2),
	(16,1,'2017-06-14 14:30:35','2017-06-14 14:30:55','2017-06-14 14:30:55',1,2,1),
	(17,2,'2017-06-14 14:31:02','2017-06-14 14:31:18','2017-06-14 14:31:18',1,1,2),
	(18,2,'2017-06-14 14:32:15','2017-06-14 14:32:42','2017-06-14 14:32:42',1,1,2),
	(19,2,'2017-06-14 14:34:15','2017-06-14 14:35:24','2017-06-14 14:35:24',1,1,2),
	(20,1,'2017-06-14 14:35:32','2017-06-14 14:45:59','2017-06-14 14:45:59',1,2,1),
	(31,1,'2017-06-14 15:12:55','2017-06-14 15:13:39','2017-06-14 15:13:39',1,1,2),
	(37,2,'2017-06-14 15:31:47','2017-06-14 15:32:11','2017-06-14 15:32:11',1,1,2),
	(41,1,'2017-06-14 15:41:19','2017-06-14 15:42:15','2017-06-14 15:42:15',1,2,1),
	(46,1,'2017-06-15 05:13:20','2017-06-15 05:13:40','2017-06-15 05:13:40',1,2,1);

/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2017_02_04_230343_create_games_table',1),
	(4,'2017_02_04_230636_create_turns_table',1),
	(5,'2017_02_04_231555_update_users_table_add_score_column',1),
	(6,'2017_06_11_161932_add_is_admin_to_users',1),
	(7,'2017_06_11_193902_add_is_banned_to_users',1),
	(8,'2017_06_12_003844_update_games_table',1),
	(9,'2017_06_12_113146_add_country_field_to_users',1),
	(10,'2017_06_14_092749_update_table_turns',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


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
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `turns` WRITE;
/*!40000 ALTER TABLE `turns` DISABLE KEYS */;

INSERT INTO `turns` (`id`, `player_id`, `game_id`, `location`, `type`, `created_at`, `updated_at`, `turn_id`)
VALUES
	(1,1,1,'3','x',NULL,'2017-06-14 13:28:54','1'),
	(2,2,1,'1','o',NULL,'2017-06-14 13:29:06','2'),
	(3,1,1,'6','x',NULL,'2017-06-14 13:29:08','3'),
	(4,2,1,'4','o',NULL,'2017-06-14 13:29:10','4'),
	(5,1,1,'9','x',NULL,'2017-06-14 13:29:12','5'),
	(6,2,1,NULL,'o',NULL,NULL,'6'),
	(7,1,1,NULL,'x',NULL,NULL,'7'),
	(8,2,1,NULL,'o',NULL,NULL,'8'),
	(9,1,1,NULL,'x',NULL,NULL,'9'),
	(10,1,1,NULL,'x',NULL,NULL,'1'),
	(11,2,1,NULL,'o',NULL,NULL,'2'),
	(12,1,1,NULL,'x',NULL,NULL,'3'),
	(13,2,1,NULL,'o',NULL,NULL,'4'),
	(14,1,1,NULL,'x',NULL,NULL,'5'),
	(15,2,1,NULL,'o',NULL,NULL,'6'),
	(16,1,1,NULL,'x',NULL,NULL,'7'),
	(17,2,1,NULL,'o',NULL,NULL,'8'),
	(18,1,1,NULL,'x',NULL,NULL,'9'),
	(19,2,2,'3','x',NULL,'2017-06-14 13:29:28','1'),
	(20,1,2,'2','o',NULL,'2017-06-14 13:29:44','2'),
	(21,2,2,'5','x',NULL,'2017-06-14 13:29:56','3'),
	(22,1,2,'6','o',NULL,'2017-06-14 13:29:59','4'),
	(23,2,2,'7','x',NULL,'2017-06-14 13:30:01','5'),
	(24,1,2,NULL,'o',NULL,NULL,'6'),
	(25,2,2,NULL,'x',NULL,NULL,'7'),
	(26,1,2,NULL,'o',NULL,NULL,'8'),
	(27,2,2,NULL,'x',NULL,NULL,'9'),
	(28,1,4,'3','x',NULL,'2017-06-14 13:34:33','1'),
	(29,2,4,'6','o',NULL,'2017-06-14 13:34:44','2'),
	(30,1,4,'2','x',NULL,'2017-06-14 13:34:46','3'),
	(31,2,4,'5','o',NULL,'2017-06-14 13:34:47','4'),
	(32,1,4,'4','x',NULL,'2017-06-14 13:34:49','5'),
	(33,2,4,'7','o',NULL,'2017-06-14 13:34:58','6'),
	(34,1,4,'1','x',NULL,'2017-06-14 13:35:00','7'),
	(35,2,4,NULL,'o',NULL,NULL,'8'),
	(36,1,4,NULL,'x',NULL,NULL,'9'),
	(37,2,5,'3','x',NULL,'2017-06-14 13:35:13','1'),
	(38,1,5,'2','o',NULL,'2017-06-14 13:35:24','2'),
	(39,2,5,'6','x',NULL,'2017-06-14 13:35:27','3'),
	(40,1,5,'5','o',NULL,'2017-06-14 13:35:29','4'),
	(41,2,5,'9','x',NULL,'2017-06-14 13:35:30','5'),
	(42,1,5,NULL,'o',NULL,NULL,'6'),
	(43,2,5,NULL,'x',NULL,NULL,'7'),
	(44,1,5,NULL,'o',NULL,NULL,'8'),
	(45,2,5,NULL,'x',NULL,NULL,'9'),
	(46,2,5,NULL,'x',NULL,NULL,'1'),
	(47,1,5,NULL,'o',NULL,NULL,'2'),
	(48,2,5,NULL,'x',NULL,NULL,'3'),
	(49,1,5,NULL,'o',NULL,NULL,'4'),
	(50,2,5,NULL,'x',NULL,NULL,'5'),
	(51,1,5,NULL,'o',NULL,NULL,'6'),
	(52,2,5,NULL,'x',NULL,NULL,'7'),
	(53,1,5,NULL,'o',NULL,NULL,'8'),
	(54,2,5,NULL,'x',NULL,NULL,'9'),
	(55,1,6,'3','x',NULL,'2017-06-14 13:35:49','1'),
	(56,2,6,'6','o',NULL,'2017-06-14 13:35:59','2'),
	(57,1,6,'2','x',NULL,'2017-06-14 13:36:00','3'),
	(58,2,6,'9','o',NULL,'2017-06-14 13:36:05','4'),
	(59,1,6,'1','x',NULL,'2017-06-14 13:36:07','5'),
	(60,2,6,NULL,'o',NULL,NULL,'6'),
	(61,1,6,NULL,'x',NULL,NULL,'7'),
	(62,2,6,NULL,'o',NULL,NULL,'8'),
	(63,1,6,NULL,'x',NULL,NULL,'9'),
	(64,1,10,'3','x',NULL,'2017-06-14 13:38:46','1'),
	(65,2,10,'6','o',NULL,'2017-06-14 13:38:54','2'),
	(66,1,10,'2','x',NULL,'2017-06-14 13:38:56','3'),
	(67,2,10,'5','o',NULL,'2017-06-14 13:38:59','4'),
	(68,1,10,'1','x',NULL,'2017-06-14 13:39:01','5'),
	(69,2,10,NULL,'o',NULL,NULL,'6'),
	(70,1,10,NULL,'x',NULL,NULL,'7'),
	(71,2,10,NULL,'o',NULL,NULL,'8'),
	(72,1,10,NULL,'x',NULL,NULL,'9'),
	(73,1,10,NULL,'x',NULL,NULL,'1'),
	(74,2,10,NULL,'o',NULL,NULL,'2'),
	(75,1,10,NULL,'x',NULL,NULL,'3'),
	(76,2,10,NULL,'o',NULL,NULL,'4'),
	(77,1,10,NULL,'x',NULL,NULL,'5'),
	(78,2,10,NULL,'o',NULL,NULL,'6'),
	(79,1,10,NULL,'x',NULL,NULL,'7'),
	(80,2,10,NULL,'o',NULL,NULL,'8'),
	(81,1,10,NULL,'x',NULL,NULL,'9'),
	(82,1,11,'3','x',NULL,'2017-06-14 14:14:24','1'),
	(83,2,11,'2','o',NULL,'2017-06-14 14:14:45','2'),
	(84,1,11,'1','x',NULL,'2017-06-14 14:14:48','3'),
	(85,2,11,'6','o',NULL,'2017-06-14 14:14:49','4'),
	(86,1,11,'5','x',NULL,'2017-06-14 14:14:56','5'),
	(87,2,11,'9','o',NULL,'2017-06-14 14:14:58','6'),
	(88,1,11,'7','x',NULL,'2017-06-14 14:15:00','7'),
	(89,2,11,NULL,'o',NULL,NULL,'8'),
	(90,1,11,NULL,'x',NULL,NULL,'9'),
	(91,1,11,NULL,'x',NULL,NULL,'1'),
	(92,2,11,NULL,'o',NULL,NULL,'2'),
	(93,1,11,NULL,'x',NULL,NULL,'3'),
	(94,2,11,NULL,'o',NULL,NULL,'4'),
	(95,1,11,NULL,'x',NULL,NULL,'5'),
	(96,2,11,NULL,'o',NULL,NULL,'6'),
	(97,1,11,NULL,'x',NULL,NULL,'7'),
	(98,2,11,NULL,'o',NULL,NULL,'8'),
	(99,1,11,NULL,'x',NULL,NULL,'9'),
	(100,1,12,'3','x',NULL,'2017-06-14 14:15:16','1'),
	(101,2,12,'6','o',NULL,'2017-06-14 14:15:26','2'),
	(102,1,12,'2','x',NULL,'2017-06-14 14:15:30','3'),
	(103,2,12,'5','o',NULL,'2017-06-14 14:15:31','4'),
	(104,1,12,'1','x',NULL,'2017-06-14 14:15:33','5'),
	(105,2,12,NULL,'o',NULL,NULL,'6'),
	(106,1,12,NULL,'x',NULL,NULL,'7'),
	(107,2,12,NULL,'o',NULL,NULL,'8'),
	(108,1,12,NULL,'x',NULL,NULL,'9'),
	(109,2,13,'3','x',NULL,'2017-06-14 14:15:42','1'),
	(110,1,13,'6','o',NULL,'2017-06-14 14:15:51','2'),
	(111,2,13,'2','x',NULL,'2017-06-14 14:15:53','3'),
	(112,1,13,'5','o',NULL,'2017-06-14 14:15:54','4'),
	(113,2,13,'1','x',NULL,'2017-06-14 14:15:55','5'),
	(114,1,13,NULL,'o',NULL,NULL,'6'),
	(115,2,13,NULL,'x',NULL,NULL,'7'),
	(116,1,13,NULL,'o',NULL,NULL,'8'),
	(117,2,13,NULL,'x',NULL,NULL,'9'),
	(118,2,13,NULL,'x',NULL,NULL,'1'),
	(119,1,13,NULL,'o',NULL,NULL,'2'),
	(120,2,13,NULL,'x',NULL,NULL,'3'),
	(121,1,13,NULL,'o',NULL,NULL,'4'),
	(122,2,13,NULL,'x',NULL,NULL,'5'),
	(123,1,13,NULL,'o',NULL,NULL,'6'),
	(124,2,13,NULL,'x',NULL,NULL,'7'),
	(125,1,13,NULL,'o',NULL,NULL,'8'),
	(126,2,13,NULL,'x',NULL,NULL,'9'),
	(127,1,16,'3','x',NULL,'2017-06-14 14:30:38','1'),
	(128,2,16,'6','o',NULL,'2017-06-14 14:30:47','2'),
	(129,1,16,'2','x',NULL,'2017-06-14 14:30:53','3'),
	(130,2,16,'5','o',NULL,'2017-06-14 14:30:54','4'),
	(131,1,16,'1','x',NULL,'2017-06-14 14:30:55','1'),
	(132,1,16,NULL,'x',NULL,NULL,'5'),
	(133,2,16,NULL,'o',NULL,NULL,'2'),
	(134,2,16,NULL,'o',NULL,NULL,'6'),
	(135,1,16,NULL,'x',NULL,NULL,'3'),
	(136,1,16,NULL,'x',NULL,NULL,'7'),
	(137,2,16,NULL,'o',NULL,NULL,'4'),
	(138,2,16,NULL,'o',NULL,NULL,'8'),
	(139,1,16,NULL,'x',NULL,NULL,'5'),
	(140,1,16,NULL,'x',NULL,NULL,'9'),
	(141,2,16,NULL,'o',NULL,NULL,'6'),
	(142,1,16,NULL,'x',NULL,NULL,'7'),
	(143,2,16,NULL,'o',NULL,NULL,'8'),
	(144,1,16,NULL,'x',NULL,NULL,'9'),
	(145,2,17,'3','x',NULL,'2017-06-14 14:31:05','1'),
	(146,1,17,'6','o',NULL,'2017-06-14 14:31:13','2'),
	(147,2,17,'2','x',NULL,'2017-06-14 14:31:16','3'),
	(148,1,17,'5','o',NULL,'2017-06-14 14:31:17','4'),
	(149,2,17,'1','x',NULL,'2017-06-14 14:31:18','5'),
	(150,1,17,NULL,'o',NULL,NULL,'6'),
	(151,2,17,NULL,'x',NULL,NULL,'7'),
	(152,1,17,NULL,'o',NULL,NULL,'8'),
	(153,2,17,NULL,'x',NULL,NULL,'9'),
	(154,2,17,NULL,'x',NULL,NULL,'1'),
	(155,1,17,NULL,'o',NULL,NULL,'2'),
	(156,2,17,NULL,'x',NULL,NULL,'3'),
	(157,1,17,NULL,'o',NULL,NULL,'4'),
	(158,2,17,NULL,'x',NULL,NULL,'5'),
	(159,1,17,NULL,'o',NULL,NULL,'6'),
	(160,2,17,NULL,'x',NULL,NULL,'7'),
	(161,1,17,NULL,'o',NULL,NULL,'8'),
	(162,2,17,NULL,'x',NULL,NULL,'9'),
	(163,2,18,'3','x',NULL,'2017-06-14 14:32:27','1'),
	(164,1,18,'6','o',NULL,'2017-06-14 14:32:35','2'),
	(165,2,18,'2','x',NULL,'2017-06-14 14:32:37','3'),
	(166,1,18,'5','o',NULL,'2017-06-14 14:32:38','4'),
	(167,2,18,'8','x',NULL,'2017-06-14 14:32:39','5'),
	(168,1,18,'9','o',NULL,'2017-06-14 14:32:40','6'),
	(169,2,18,'1','x',NULL,'2017-06-14 14:32:42','7'),
	(170,1,18,NULL,'o',NULL,NULL,'8'),
	(171,2,18,NULL,'x',NULL,NULL,'9'),
	(172,2,19,'3','x',NULL,'2017-06-14 14:35:04','1'),
	(173,1,19,'6','o',NULL,'2017-06-14 14:35:20','2'),
	(174,2,19,'2','x',NULL,'2017-06-14 14:35:22','3'),
	(175,1,19,'5','o',NULL,'2017-06-14 14:35:23','4'),
	(176,2,19,'1','x',NULL,'2017-06-14 14:35:24','5'),
	(177,1,19,NULL,'o',NULL,NULL,'6'),
	(178,2,19,NULL,'x',NULL,NULL,'7'),
	(179,1,19,NULL,'o',NULL,NULL,'8'),
	(180,2,19,NULL,'x',NULL,NULL,'9'),
	(181,1,20,'3','x',NULL,'2017-06-14 14:45:47','1'),
	(182,2,20,'6','o',NULL,'2017-06-14 14:45:55','2'),
	(183,1,20,'2','x',NULL,'2017-06-14 14:45:57','3'),
	(184,2,20,'5','o',NULL,'2017-06-14 14:45:58','4'),
	(185,1,20,'1','x',NULL,'2017-06-14 14:45:59','5'),
	(186,2,20,NULL,'o',NULL,NULL,'6'),
	(187,1,20,NULL,'x',NULL,NULL,'7'),
	(188,2,20,NULL,'o',NULL,NULL,'8'),
	(189,1,20,NULL,'x',NULL,NULL,'9'),
	(190,2,31,'3','x',NULL,'2017-06-14 15:13:00','1'),
	(191,1,31,'6','o',NULL,'2017-06-14 15:13:09','2'),
	(192,2,31,'2','x',NULL,'2017-06-14 15:13:26','3'),
	(193,1,31,'5','o',NULL,'2017-06-14 15:13:28','4'),
	(194,2,31,'9','x',NULL,'2017-06-14 15:13:29','5'),
	(195,1,31,'1','o',NULL,'2017-06-14 15:13:30','6'),
	(196,2,31,'7','x',NULL,'2017-06-14 15:13:36','7'),
	(197,1,31,'4','o',NULL,'2017-06-14 15:13:39','8'),
	(198,2,31,NULL,'x',NULL,NULL,'9'),
	(199,2,31,NULL,'x',NULL,NULL,'1'),
	(200,1,31,NULL,'o',NULL,NULL,'2'),
	(201,2,31,NULL,'x',NULL,NULL,'3'),
	(202,1,31,NULL,'o',NULL,NULL,'4'),
	(203,2,31,NULL,'x',NULL,NULL,'5'),
	(204,1,31,NULL,'o',NULL,NULL,'6'),
	(205,2,31,NULL,'x',NULL,NULL,'7'),
	(206,1,31,NULL,'o',NULL,NULL,'8'),
	(207,2,31,NULL,'x',NULL,NULL,'9'),
	(208,2,37,'3','x',NULL,'2017-06-14 15:31:55','1'),
	(209,1,37,'2','o',NULL,'2017-06-14 15:32:05','2'),
	(210,2,37,'6','x',NULL,'2017-06-14 15:32:08','3'),
	(211,1,37,'5','o',NULL,'2017-06-14 15:32:09','4'),
	(212,2,37,'9','x',NULL,'2017-06-14 15:32:11','5'),
	(213,1,37,NULL,'o',NULL,NULL,'6'),
	(214,2,37,NULL,'x',NULL,NULL,'7'),
	(215,2,37,NULL,'x',NULL,NULL,'1'),
	(216,1,37,NULL,'o',NULL,NULL,'8'),
	(217,1,37,NULL,'o',NULL,NULL,'2'),
	(218,2,37,NULL,'x',NULL,NULL,'9'),
	(219,2,37,NULL,'x',NULL,NULL,'3'),
	(220,1,37,NULL,'o',NULL,NULL,'4'),
	(221,2,37,NULL,'x',NULL,NULL,'5'),
	(222,1,37,NULL,'o',NULL,NULL,'6'),
	(223,2,37,NULL,'x',NULL,NULL,'7'),
	(224,1,37,NULL,'o',NULL,NULL,'8'),
	(225,2,37,NULL,'x',NULL,NULL,'9'),
	(226,1,41,'3','x',NULL,'2017-06-14 15:41:31','1'),
	(227,2,41,'6','o',NULL,'2017-06-14 15:41:37','2'),
	(228,1,41,'2','x',NULL,'2017-06-14 15:41:41','3'),
	(229,2,41,'1','o',NULL,'2017-06-14 15:41:46','4'),
	(230,1,41,'5','x',NULL,'2017-06-14 15:41:48','5'),
	(231,2,41,'4','o',NULL,'2017-06-14 15:41:53','6'),
	(232,1,41,'8','x',NULL,'2017-06-14 15:42:15','7'),
	(233,2,41,NULL,'o',NULL,NULL,'8'),
	(234,1,41,NULL,'x',NULL,NULL,'9'),
	(235,1,46,'3','x',NULL,'2017-06-15 05:13:27','1'),
	(236,2,46,'6','o',NULL,'2017-06-15 05:13:34','2'),
	(237,1,46,'2','x',NULL,'2017-06-15 05:13:38','3'),
	(238,2,46,'5','o',NULL,'2017-06-15 05:13:39','4'),
	(239,1,46,'1','x',NULL,'2017-06-15 05:13:40','5'),
	(240,2,46,NULL,'o',NULL,NULL,'6'),
	(241,1,46,NULL,'x',NULL,NULL,'7'),
	(242,2,46,NULL,'o',NULL,NULL,'8'),
	(243,1,46,NULL,'x',NULL,NULL,'9'),
	(244,1,46,NULL,'x',NULL,NULL,'1'),
	(245,2,46,NULL,'o',NULL,NULL,'2'),
	(246,1,46,NULL,'x',NULL,NULL,'3'),
	(247,2,46,NULL,'o',NULL,NULL,'4'),
	(248,1,46,NULL,'x',NULL,NULL,'5'),
	(249,2,46,NULL,'o',NULL,NULL,'6'),
	(250,1,46,NULL,'x',NULL,NULL,'7'),
	(251,2,46,NULL,'o',NULL,NULL,'8'),
	(252,1,46,NULL,'x',NULL,NULL,'9');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `score`, `remember_token`, `created_at`, `updated_at`, `is_admin`, `is_banned`, `country`)
VALUES
	(1,'Thomas CEPPINI','thomas5757@outlook.com','$2y$10$Y.Gfu.Lz7pJnQbyKAokbJOab7orhepnOTin1K8Ka2DMejCmEKUjxC',11,'64618nYnQuj9mqE1N81vkuQyGIH8z7UcCf46WcPhNrTIKY4n6TtSOkN1pLZS','2017-06-14 13:28:13','2017-06-15 05:13:40',1,0,'FR'),
	(2,'John DOE','gt3rs5757@yahoo.fr','$2y$10$QjEhqOiflSoBJ1qU14EWAeAjDAQcquLF9duUGWOz8FEx4I6HQ7yJ6',7,'xq2VBYCjJITNypVIeWE257H7GXQtX097JHWdML2RnP6D646S27SvLcIC1GzP','2017-06-14 13:28:35','2017-06-14 15:32:11',0,0,'FR');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
