CREATE DATABASE `projectmygames` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `collections` (
  `gameId` int NOT NULL,
  `userId` int NOT NULL,
  `played` tinyint(1) NOT NULL DEFAULT '0',
  `finishDate` date NOT NULL,
  `review` varchar(250) DEFAULT NULL,
  `stars` int NOT NULL,
  PRIMARY KEY (`gameId`,`userId`),
  KEY `FKl2dn5qgdu7dgey3r6ry13gg7f` (`userId`),
  CONSTRAINT `FK7g5a1cfehd6w46lpnfcur8la1` FOREIGN KEY (`gameId`) REFERENCES `games` (`gameId`),
  CONSTRAINT `FKl2dn5qgdu7dgey3r6ry13gg7f` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `developers` (
  `developerPK` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`developerPK`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `game_developers` (
  `gameId` int NOT NULL,
  `developerPK` int NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`gameId`,`developerPK`),
  KEY `FKjr6c9w1e4v21ganm1ynsb14ji` (`developerPK`),
  CONSTRAINT `FKhv1vfy9rlw7ag48icqqu9hay9` FOREIGN KEY (`gameId`) REFERENCES `games` (`gameId`),
  CONSTRAINT `FKjr6c9w1e4v21ganm1ynsb14ji` FOREIGN KEY (`developerPK`) REFERENCES `developers` (`developerPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `game_genres` (
  `gameId` int NOT NULL,
  `genrePK` int NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`gameId`,`genrePK`),
  KEY `FKi52bwxdvbta56frjsqpjpnj24` (`genrePK`),
  CONSTRAINT `FKi52bwxdvbta56frjsqpjpnj24` FOREIGN KEY (`genrePK`) REFERENCES `genres` (`genrePK`),
  CONSTRAINT `FKnp4glqyfiqx6295239ou7dki2` FOREIGN KEY (`gameId`) REFERENCES `games` (`gameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `game_platforms` (
  `gameId` int NOT NULL,
  `platformPK` int NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`gameId`,`platformPK`),
  KEY `FK3ut47cen301qk8rr4e19443y5` (`platformPK`),
  CONSTRAINT `FK3ut47cen301qk8rr4e19443y5` FOREIGN KEY (`platformPK`) REFERENCES `platforms` (`platformPK`),
  CONSTRAINT `FKt2daixdpojtp3txfrskisouls` FOREIGN KEY (`gameId`) REFERENCES `games` (`gameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `games` (
  `gameId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `releaseDate` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `apiId` int NOT NULL,
  `developers` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gameId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `genres` (
  `genrePK` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`genrePK`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `platforms` (
  `platformPK` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`platformPK`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
