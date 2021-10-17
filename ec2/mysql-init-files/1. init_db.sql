CREATE DATABASE IF NOT EXISTS do_nation;
USE do_nation;
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
) ENGINE = InnoDB AUTO_INCREMENT = 118 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;