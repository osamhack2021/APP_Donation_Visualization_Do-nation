/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
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
INSERT INTO feedback(id,name,message,password,image_url,targetId) VALUES(1,'윤동기','진짜 필요했는데! 감사합니다!','1234',NULL,2),(2,'김하민','덕분에 쉬었다 갈 수 있었습니다~','1234',NULL,2),(7,'김태현','벤치프레스 너무 감사합니다!','1234',NULL,12);