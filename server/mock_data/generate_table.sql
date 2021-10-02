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
  `target_id` int NOT NULL,
  `donor_name` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pay_won` int NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;