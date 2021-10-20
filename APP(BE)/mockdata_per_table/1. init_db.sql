/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ do_nation /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE do_nation;

DROP TABLE IF EXISTS donation;
CREATE TABLE `donation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `donor_name` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pay_won` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `targetId` int NOT NULL,
  `x1_coord` float NOT NULL,
  `y1_coord` float NOT NULL,
  `x2_coord` float NOT NULL,
  `y2_coord` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e4d196fad5b527519f8a579d2e6` (`targetId`),
  CONSTRAINT `FK_e4d196fad5b527519f8a579d2e6` FOREIGN KEY (`targetId`) REFERENCES `target` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS feedback;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `targetId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9635c82b2098691c9103631ac7c` (`targetId`),
  CONSTRAINT `FK_9635c82b2098691c9103631ac7c` FOREIGN KEY (`targetId`) REFERENCES `target` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS goal;
CREATE TABLE `goal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goal` varchar(100) NOT NULL,
  `objective_won` int NOT NULL,
  `targetId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_25132c1c9253c64722630f5ccdc` (`targetId`),
  CONSTRAINT `FK_25132c1c9253c64722630f5ccdc` FOREIGN KEY (`targetId`) REFERENCES `target` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS target;
CREATE TABLE `target` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `objective_won` int NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `isFinished` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;