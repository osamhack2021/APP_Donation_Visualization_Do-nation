/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
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
INSERT INTO goal(id,goal,objective_won,targetId) VALUES(5,'냉동치킨',250000,3),(6,'닭강정',600000,3),(7,'핫팩',40000,1),(8,'군고구마',100000,1);