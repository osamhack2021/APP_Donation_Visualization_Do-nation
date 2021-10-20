/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
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
INSERT INTO target(id,lat,lng,objective_won,image_url,name,description,isFinished) VALUES(1,0,0,150000,'heater.jpg','행정반 난로',X'eab2a8ec9ab8ec9db420eb8ba4eab080ec98a4eba9b4ec849c20eb82a0ec94a8eab08020ecb694ec9b8ceca18ceb8a94eb8db020ed9689eca095ebb098eab099ec9d8020ec9dbceab3bc20ec8b9ceab084ec9790eba78c20ec82acec9aa9ed9598eb8a9420eab3b3ec9d8020eba78eec9db420ecb694ec9b8cec9a942e20eb829ceba19ceab08020ec9e88ec9cbceba9b420eb8d9420eb94b0eb9cbbed95a020eab28320eab099ec9584ec9a942e',0),(2,-6.27,151.13,300000,'bench.png','전산실 벤치',X'eca084ec82b0ec8ba420eab7bcecb298ec979020ec9589ec9d8420eab3b3ec9db420ec9786ec96b420ebb688ed8eb8ed9598eb8ba4eb8a9420ec9d98eab2acec9db420eba78eec9598ec8ab5eb8b88eb8ba42e20ec9e91eca08420ec8898ed9689ed9598eab3a020eb8f8cec9584ec98a820eca084ec82b0ebb391eb93a4ec9db420ec89b420ec889820ec9e88eb8a9420eab3b5eab084ec9d8420eba78ceb93a4ec96b4eca3bcec84b8ec9a9421',1),(3,0,0,800000,'chicken.png','치킨 회식',X'ed9e98eb93a020ed9b88eba0a8ec9db420eb819deb8298ec849c20eb8488ebacb420ebb0b0eab3a0ed8c8cec9a942e20ecb998ed82a820ed9a8cec8b9dec9db420ed9598eab3a0ec8bb6ec96b4ec9a942e',0),(12,0,0,200000,'benchPress.jpg','체력단련실 벤치프레스',X'ecb2b4eba0a5eb8ba8eba0a8ec8ba4ec9790ec849c20eb8da4ebb2a8eba19ceba78c20ec9ab4eb8f99ec9d8420ed9598eb8b8820ec9e90eab7b9ec9db420ec98a4eca78020ec958aec9584ec9a942e20eab09cec9db8eca095ebb98420ec8b9ceab084ec9d8420ebb3b4eb9e8cecb0a8eab28c20ebb3b4eb82bc20ec889820ec9e88eab28c20eb8f84ec9980eca3bcec84b8ec9a942e',1),(13,0,0,1000000,'sing.jpg','노래방 기계 수리',X'eca09c20eab5b0ec839ded999cec9d9820eb8299ec9db820eb85b8eb9e98ebb680eba5b4eab8b0eba5bc20ebaa87eb8baceca7b820ebaabbed9598eab3a020ec9e88ec96b4ec9a9420e3859ce3859c',0),(14,0,0,200000,'cart.jpg','중대에서 사용할 수례',X'eab5b0eb8c80ec9790ec849c20ebacb4eab1b0ec9ab420ebacbceab1b4ec9d8420ec98aeeab8b8ec9dbcec9db420eba78eec9d80eb8db020ec8898eba180eab08020ec9786ec96b4ec849c20eb8d9420ed9e98eb93a4ec96b4ec9a942e20eab7b8eb9e98ec849c20eca491eb8c80eba788eb8ba420ec8898eba180eab08020ed9598eb8298ec94a920ec9e88ec9cbceba9b420eca28bec9d84eab1b020eab099ec9584ec9a942e',0),(16,0,0,140000,'snow.jpg','겨울에 사용할 제설도구',X'eab2a8ec9ab8ec979020eb8888ec9db4ec98a4eba9b420eca09cec84a4ec9d8420ed95b4ec95bceb9098eb8a94eb8db020eca09cec84a4eb8f84eab5aceab08020eba78eec9db420ec9786ec96b4ec849c20ec9e91ec9785ec9db420ec9e9820ec9588eb9098ec9a942e20eca09cec84a420eb8f84eab5aceab08020eca28020eb8d9420eba78eec9cbceba9b420eca28beab2a0ec96b4ec9a942e',0);