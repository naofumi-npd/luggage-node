# ************************************************************
# Sequel Pro SQL dump
# Version 4500
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.10)
# Database: luggage
# Generation Time: 2016-03-09 18:31:47 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `luggage_id` int(10) unsigned NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `created` datetime NOT NULL,
  `returned_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;

INSERT INTO `history` (`id`, `luggage_id`, `date_from`, `date_to`, `created`, `returned_date`)
VALUES
	(1,1,'2016-01-08 11:09:08','2016-01-18 11:09:08','2016-03-08 11:09:08','2016-01-20 11:09:08'),
	(2,2,'2016-03-08 11:09:15','2016-02-08 11:09:15','2016-03-08 11:09:15',NULL),
	(3,3,'2016-03-08 11:09:18','2016-02-08 11:09:18','2016-03-08 11:09:18',NULL),
	(4,1,'2016-03-08 11:09:08','2016-02-08 11:09:08','2016-01-08 11:09:08','2016-03-20 11:09:08');

/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table luggage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `luggage`;

CREATE TABLE `luggage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) unsigned NOT NULL,
  `available` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `luggage_type_foreign_key` (`type`),
  CONSTRAINT `luggage_type_foreign_key` FOREIGN KEY (`type`) REFERENCES `luggage_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `luggage` WRITE;
/*!40000 ALTER TABLE `luggage` DISABLE KEYS */;

INSERT INTO `luggage` (`id`, `type`, `available`, `created`)
VALUES
	(1,1,1,'2016-03-07 12:33:07'),
	(2,5,0,'2016-03-07 12:33:07'),
	(3,1,0,'2016-03-07 12:33:07'),
	(4,4,1,'2016-03-07 12:33:07'),
	(5,2,0,'2016-03-07 12:33:07'),
	(6,5,1,'2016-03-07 12:33:07'),
	(7,1,1,'2016-03-07 12:33:07'),
	(8,3,1,'2016-03-07 12:33:07'),
	(9,3,1,'2016-03-07 12:33:07'),
	(10,3,1,'2016-03-07 12:33:07');

/*!40000 ALTER TABLE `luggage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table luggage_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `luggage_type`;

CREATE TABLE `luggage_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `luggage_type` WRITE;
/*!40000 ALTER TABLE `luggage_type` DISABLE KEYS */;

INSERT INTO `luggage_type` (`id`, `name`, `description`)
VALUES
	(1,'18\" - 20\" Carry-On Luggage','These are considered the International carry-on sizes, as they are allowed as a carry-on for most International flights. They are ideal for trips of 1-2 days, as they have packing space for a few outfits, a pair of shoes, and toiletries.'),
	(2,'21\" - 22\" Carry-on Luggage','These are the most popular sizes of carry-on luggage for U.S. domestic flights. Most U.S. airlines have carry on restrictions of 22\" x 14\" x 9\", or 45 linear inches. These are the ideal sizes for business travelers or weekend trips, as most pieces of these sizes have either a foldout or removable garment sleeve that can hold one suit or dress and has sufficient packing space for a few outfits, a couple pairs of shoes, and toiletries. Most also have an expansion feature, which allows an additional 2 to 4 inches of packing capacity, but when expanded these sizes may exceed the carry on restrictions and would have to be checked.'),
	(3,'23\" - 24\" Small Checked Luggage','These sizes are popular for travelers looking for a smaller, lighter option of luggage to check. These pieces are too large to carry onto the plane, but are perfect for trips of 3 to 5 days. There is room for 2 to 3 outfits, a couple pair of shoes, and toiletry kits. The suiter (a fold out or removable garment sleeve) has space for up to 2 suits or dresses.'),
	(4,'25\" - 27\" Checked Luggage','These sizes are the most popular size of luggage to check. They are ideal for trips of 5 to 7 days, or longer, depending on how you pack. They have a large capacity for multiple outfits, shoes, and toiletries. The suiter (a fold out or removable garment sleeve) can hold two thick wool suits and up to four dresses. These are the best option for luggage to check, they have lots of room to pack but you won\'t break your back trying to move it.'),
	(5,'28\" - 32\" Suitcase','These are very large suitcases meant for trips exceeding a week. They have a tremendous capacity for anything you would like to travel with. Due to their large size, when fully packed they can be difficult to maneuver and may exceed the 50 lbs. weight restrictions that most U.S. airlines enforce. Along with the weight restrictions, most U.S. airlines have a size restriction of 62\" linear inches and these sizes may exceed that size, especially when expanded. But if you know you need the biggest piece of luggage available, these would be for you.');

/*!40000 ALTER TABLE `luggage_type` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
