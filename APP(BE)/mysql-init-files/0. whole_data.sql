/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ do_nation /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE do_nation;

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

INSERT INTO target(id,lat,lng,objective_won,image_url,name,description,isFinished) VALUES(1,0,0,150000,'heater.jpg','행정반 난로',X'eab2a8ec9ab8ec9db420eb8ba4eab080ec98a4eba9b4ec849c20eb82a0ec94a8eab08020ecb694ec9b8ceca18ceb8a94eb8db020ed9689eca095ebb098eab099ec9d8020ec9dbceab3bc20ec8b9ceab084ec9790eba78c20ec82acec9aa9ed9598eb8a9420eab3b3ec9d8020eba78eec9db420ecb694ec9b8cec9a942e20eb829ceba19ceab08020ec9e88ec9cbceba9b420eb8d9420eb94b0eb9cbbed95a020eab28320eab099ec9584ec9a942e',0),(2,-6.27,151.13,300000,'bench.png','전산실 벤치',X'eca084ec82b0ec8ba420eab7bcecb298ec979020ec9589ec9d8420eab3b3ec9db420ec9786ec96b420ebb688ed8eb8ed9598eb8ba4eb8a9420ec9d98eab2acec9db420eba78eec9598ec8ab5eb8b88eb8ba42e20ec9e91eca08420ec8898ed9689ed9598eab3a020eb8f8cec9584ec98a820eca084ec82b0ebb391eb93a4ec9db420ec89b420ec889820ec9e88eb8a9420eab3b5eab084ec9d8420eba78ceb93a4ec96b4eca3bcec84b8ec9a9421',1),(3,0,0,800000,'chicken.png','치킨 회식',X'ed9e98eb93a020ed9b88eba0a8ec9db420eb819deb8298ec849c20eb8488ebacb420ebb0b0eab3a0ed8c8cec9a942e20ecb998ed82a820ed9a8cec8b9dec9db420ed9598eab3a0ec8bb6ec96b4ec9a942e',0),(12,0,0,200000,'benchPress.jpg','체력단련실 벤치프레스',X'ecb2b4eba0a5eb8ba8eba0a8ec8ba4ec9790ec849c20eb8da4ebb2a8eba19ceba78c20ec9ab4eb8f99ec9d8420ed9598eb8b8820ec9e90eab7b9ec9db420ec98a4eca78020ec958aec9584ec9a942e20eab09cec9db8eca095ebb98420ec8b9ceab084ec9d8420ebb3b4eb9e8cecb0a8eab28c20ebb3b4eb82bc20ec889820ec9e88eab28c20eb8f84ec9980eca3bcec84b8ec9a942e',1),(13,0,0,1000000,'sing.jpg','노래방 기계 수리',X'eca09c20eab5b0ec839ded999cec9d9820eb8299ec9db820eb85b8eb9e98ebb680eba5b4eab8b0eba5bc20ebaa87eb8baceca7b820ebaabbed9598eab3a020ec9e88ec96b4ec9a9420e3859ce3859c',0),(14,0,0,200000,'cart.jpg','중대에서 사용할 수례',X'eab5b0eb8c80ec9790ec849c20ebacb4eab1b0ec9ab420ebacbceab1b4ec9d8420ec98aeeab8b8ec9dbcec9db420eba78eec9d80eb8db020ec8898eba180eab08020ec9786ec96b4ec849c20eb8d9420ed9e98eb93a4ec96b4ec9a942e20eab7b8eb9e98ec849c20eca491eb8c80eba788eb8ba420ec8898eba180eab08020ed9598eb8298ec94a920ec9e88ec9cbceba9b420eca28bec9d84eab1b020eab099ec9584ec9a942e',0),(16,0,0,140000,'snow.jpg','겨울에 사용할 제설도구',X'eab2a8ec9ab8ec979020eb8888ec9db4ec98a4eba9b420eca09cec84a4ec9d8420ed95b4ec95bceb9098eb8a94eb8db020eca09cec84a4eb8f84eab5aceab08020eba78eec9db420ec9786ec96b4ec849c20ec9e91ec9785ec9db420ec9e9820ec9588eb9098ec9a942e20eca09cec84a420eb8f84eab5aceab08020eca28020eb8d9420eba78eec9cbceba9b420eca28beab2a0ec96b4ec9a942e',0);

INSERT INTO donation(id,donor_name,message,phone,pay_won,password,targetId,x1_coord,y1_coord,x2_coord,y2_coord) VALUES(113,'박민준','벤치 있으면 편하겠다','1',30000,'1',2,0.078125,0.0714286,0.90625,0.153571),(114,'관리관','고생한다.','1',70000,'1',2,0.0732087,0.184397,0.903427,0.336879),(115,'대대장','여러분 다들 고생 많아요','1',100000,'1',2,0.0310559,0.433099,0.956522,0.556338),(116,'고경구','벤치 있으면 담배필때 개꿀일것 같습니다.','1',50000,'1',2,0.120743,0.559441,0.208978,0.944056),(117,'한정우','오, 저도 돈 같이 보태겠습니다.','1',50000,'1',2,0.763889,0.555556,0.856481,0.9375),(118,'행보관','체력단련 시간에 운동 열심히 하는 모습이 보기 좋네. 앞으로도 열심히 했으면 좋겠어.','+82 00-0000-0000',15000,'1234',12,0.63,0.0746667,0.588,0.370667),(119,'대대장','체력 단련을 통해 행복한 군생활이 됐으면 좋겠어요.','+82 00-0000-0000',100000,'1234',12,0.784,0.506667,0.016,0.666667),(120,'중대장','열심히 체력단련 하는 모습 보기좋더라. 너무 무리는 하지 말고 앞으로도 군생활 열심히 하자.','+82 00-0000-0000',10000,'1234',12,0.208,0.986667,0.106,0.650667),(121,'관리관','운동 열심히 해라.','+82 00-0000-0000',30000,'1234',12,0.462,0.44,0.734,0.845333),(122,'체계관리부사관','난 먼저 간다~ 고생해라 ㅋㅋㅋ','+82 00-0000-0000',15000,'1234',12,0.956,0.0106667,0.808,0.466667),(123,'주임원사','앞으로도 원활한 소통을 해줬으면 좋겠어~','+82 00-0000-0000',30000,'1234',12,0.992,0.541333,0.674,0.941333),(124,'대대장','이렇게 소통하는 모습 보기 좋네요. 앞으로도 건의사항 있으면 부담없이 말해주면 좋을거같아요.','+82 00-0000-0000',30000,'1234',1,0,0,0,0),(125,'전자과장','추운 겨울 난로와 함께 이겨내보자!','+82 00-0000-0000',20000,'1234',1,0,0,0,0),(126,'주파수관리관','따뜻하게 같이 군생활 하자~','+82 00-0000-0000',10000,'1234',1,0,0,0,0),(127,'중대장','겨울에도 따뜻한 군생활 하고 비전투 손실 안나게 주의하면서 생활 하자~','+82 00-0000-0000',20000,'1234',1,0,0,0,0),(128,'김유민','행정반 난로 가즈아~','+82 00-0000-0000',15000,'1234',1,0,0,0,0),(129,'김하민','행정반 난로.. 있으면 좋을수도~','+82 00-0000-0000',15000,'1234',1,0,0,0,0),(130,'지원과장','힘든 훈련 고생했어요. 회식하면서 충분히 쉬었으면 좋겠어요.','+82 10 0000 0000',100000,'1234',3,0,0,0,0),(131,'대대장','우리 대대원들이 열심히 노력해준 덕분에 훈련을 성공적으로 마칠 수 있었던거 같아요. 고생했고 회식 맛있게 하세요.','+82 00 0000 0000',200000,'1234',3,0,0,0,0),(133,'강진영','무야호','+82 10 0000 0000',50000,'1234',3,0,0,0,0);

INSERT INTO feedback(id,name,message,password,image_url,targetId) VALUES(1,'윤동기','진짜 필요했는데! 감사합니다!','1234',NULL,2),(2,'김하민','덕분에 쉬었다 갈 수 있었습니다~','1234',NULL,2),(7,'김태현','벤치프레스 너무 감사합니다!','1234',NULL,12);

INSERT INTO goal(id,goal,objective_won,targetId) VALUES(5,'냉동치킨',250000,3),(6,'닭강정',600000,3),(7,'핫팩',40000,1),(8,'군고구마',100000,1);