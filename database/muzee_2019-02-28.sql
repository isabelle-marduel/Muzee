# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: 127.0.0.1 (MySQL 5.7.25)
# Base de données: muzee
# Temps de génération: 2019-02-28 16:39:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;

INSERT INTO `image` (`id`, `url`)
VALUES
	(3,'5c750dd68a886646471335.png'),
	(4,'5c7510fc34858386202399.jpg'),
	(5,'5c7514c24c6f3282747325.png'),
	(6,'5c751b2f3e503393441090.png'),
	(7,'5c75209016280063235967.jpg'),
	(8,'5c769f0f32653_gou.jpg');

/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table migration_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migration_versions`;

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;

INSERT INTO `migration_versions` (`version`, `executed_at`)
VALUES
	('20190212112747','2019-02-12 12:31:12'),
	('20190212145741','2019-02-12 15:06:19');

/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table museum
# ------------------------------------------------------------

DROP TABLE IF EXISTS `museum`;

CREATE TABLE `museum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `museum` WRITE;
/*!40000 ALTER TABLE `museum` DISABLE KEYS */;

INSERT INTO `museum` (`id`, `name`, `address`, `zip_code`, `city`, `latitude`, `longitude`)
VALUES
	(1,'Musée du Quai Branly - Jacques Chirac','37 quai Branly',75007,'Paris',48.8608889,2.297894),
	(2,'Musée du Louvre - Pavillon des Sessions','Rue de Rivoli',75001,'Paris',48.8606111,2.337644);

/*!40000 ALTER TABLE `museum` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table piece_of_art
# ------------------------------------------------------------

DROP TABLE IF EXISTS `piece_of_art`;

CREATE TABLE `piece_of_art` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sizes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `museum_id` int(11) DEFAULT NULL,
  `main_image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_147A8522E4873418` (`main_image_id`),
  KEY `IDX_147A85224B52E5B5` (`museum_id`),
  CONSTRAINT `FK_147A85224B52E5B5` FOREIGN KEY (`museum_id`) REFERENCES `museum` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_147A8522E4873418` FOREIGN KEY (`main_image_id`) REFERENCES `image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `piece_of_art` WRITE;
/*!40000 ALTER TABLE `piece_of_art` DISABLE KEYS */;

INSERT INTO `piece_of_art` (`id`, `title`, `subtitle`, `author`, `datation`, `origin`, `origin_detail`, `material`, `sizes`, `content`, `latitude`, `longitude`, `museum_id`, `main_image_id`)
VALUES
	(4,'Salière','style Edo','','16e siècle','Nigéria, Afrique','Owo, royaume du Bénin','ivoire d\'éléphant','26 x 8 x 8,5 cm','Cette salière à deux coupes du 16e siècle fut commandée à un artiste par des commerçants Portugais. Ce type de sculpture en ivoire était destiné à l’élite européenne. Les ivoires afro-portugais de la Renaissance mêlent généralement une iconographie européenne à une facture africain, ici de style edo du royaume de Bénin (Nigeria actuel). Sur cette salière sculptée, les soldats portugais et la petite caravelle à l’imposant poste de vigie indiquent un sujet européen.',48.8608889,2.297894,1,3),
	(5,'Statue androgyne','style Djennenké','','9e-10e siècle','Mali, Afrique','Pré-Dogon','bois','210 x 37 x 22 cm','Cette grande sculpture ancienne en bois sculpté combine un visage masculin et un corps féminin. La présence des parures sur cette image androgyne indique un homme de haut rang de l\'ancien empire de Ghana (Mali actuel). Les seins féminins évoquent une allégorie de la protection, de la fécondité et par extension de la paix sur la communauté. Ce chef d’œuvre du Mali témoigne du style d’une population qui émigra aux alentours du 9e siècle de la région de Djenné vers le sud, sur le plateau de Bandiagara dans l’actuel pays dogon',48.8608889,2.297894,1,4),
	(6,'Figure du théâtre d\'ombre','Le dieu Phra Naraï (Vishnu)','','Première moitié du 20e siècle','Thaïlande, Asie','','cuir découpé et peint','68 x 35 x 1 cm','Les figurines de cuir du théâtre d\'ombres se manipulent contre un écran rétroéclairé. Leur esthétique repose sur l’équilibre entre les pleins et les vides, pour produire le contraste entre ombre et lumière. Ce personnage très ajouré brille tout particulièrement durant le spectacle. Il représente Phra Naraï, une divinité associée à la royauté.',48.8608889,2.297894,1,5),
	(7,'Tenture de temple bouddhique','','','Fin du 18e siècle','Cambodge, Asie','','peinture sur toile de coton','192 x 86,4 cm','Cette tenture de temple de la fin du 18ème siècle est dans un état de conservation exceptionnel. Les scènes étaient déroulées par les moines pour illustrer les dix dernières vies antérieures du Bouddha.',48.8608889,2.297894,1,6),
	(8,'Sculpture du dieu Gou','','Akati Ekplékendo','1858','Bénin, Afrique','Population Fon, Abomey','fer, bois','165 cm de haut','Gou, chez les Fon, est le Dieu de la guerre et du métal. Cette sculpture est attribuée à Akati Ekplékendo qui l’aurait réalisée avant 1858 au début du règne du roi Glélé. La statue fut exposée au musée d’ethnographie du Trocadéro après la prise du palais d’Abomey par les troupes françaises, en 1894.',48.8606111,2.337644,2,7);

/*!40000 ALTER TABLE `piece_of_art` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table piece_of_art_document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `piece_of_art_document`;

CREATE TABLE `piece_of_art_document` (
  `piece_of_art_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`piece_of_art_id`,`document_id`),
  KEY `IDX_912A2165ABACA386` (`piece_of_art_id`),
  KEY `IDX_912A2165C33F7837` (`document_id`),
  CONSTRAINT `FK_912A2165ABACA386` FOREIGN KEY (`piece_of_art_id`) REFERENCES `piece_of_art` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_912A2165C33F7837` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table piece_of_art_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `piece_of_art_image`;

CREATE TABLE `piece_of_art_image` (
  `piece_of_art_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`piece_of_art_id`,`image_id`),
  KEY `IDX_63CA3848ABACA386` (`piece_of_art_id`),
  KEY `IDX_63CA38483DA5256D` (`image_id`),
  CONSTRAINT `FK_63CA38483DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_63CA3848ABACA386` FOREIGN KEY (`piece_of_art_id`) REFERENCES `piece_of_art` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `piece_of_art_image` WRITE;
/*!40000 ALTER TABLE `piece_of_art_image` DISABLE KEYS */;

INSERT INTO `piece_of_art_image` (`piece_of_art_id`, `image_id`)
VALUES
	(4,7),
	(6,5),
	(7,6),
	(8,7);

/*!40000 ALTER TABLE `piece_of_art_image` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table piece_of_art_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `piece_of_art_video`;

CREATE TABLE `piece_of_art_video` (
  `piece_of_art_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`piece_of_art_id`,`video_id`),
  KEY `IDX_DA30E63BABACA386` (`piece_of_art_id`),
  KEY `IDX_DA30E63B29C1004E` (`video_id`),
  CONSTRAINT `FK_DA30E63B29C1004E` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DA30E63BABACA386` FOREIGN KEY (`piece_of_art_id`) REFERENCES `piece_of_art` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `lastname`, `firstname`, `email`, `birthdate`, `city`, `password`)
VALUES
	(68,'ramiro86','Aufderhar','Janice','vincent.rutherford@heaney.com','1978-03-12','Ortizville','$2y$13$2QQS/NVRk4MxpRBSVF9V..ENNKF2MrNBzON8rE1If7l.4Mk0aEu7W'),
	(69,'deborah12','Klocko','Herminia','hassie95@yahoo.com','2001-02-05','Emilefurt','$2y$13$ebOKsjsAKnOeKAbcx7knwuhhJ49FQpaiEU4XwgHnQTDg3WmCpGRv6'),
	(70,'zelda33','Stokes','Alysson','rahsaan99@gmail.com','1991-03-13','Torphymouth','$2y$13$MZTzMLIEq32svMiA8lk13.gBlpYRyb7CyFSoFaF6v9am/gO5zZBE6'),
	(71,'lonie.moore','Runolfsdottir','Rodolfo','ferry.shanna@yahoo.com','1971-04-01','Laurianetown','$2y$13$fzLJ/SHlEUr6h1I7bR0yr.yy2HuWJ5dORdSj5rvEGiILxY1gKlHNG'),
	(72,'simonis.king','Wiza','Laurine','kuvalis.jonathan@gmail.com','1992-04-03','North Edisonshire','$2y$13$1O3GZzSkmLrZgedsPSeOBOyJ.JJf8kYf.66/WCKsCVmyjO8S1E0U.'),
	(73,'garrick.bradtke','Crona','Flo','tressie.homenick@purdy.com','1986-12-06','East Dejaland','$2y$13$YcdF0Laxvjdp0nfV4tojy.r8X3s.Xaa.udSANZVnrHOcBq9CfsyJS'),
	(74,'blemke','Lesch','Joel','labadie.malvina@hotmail.com','1990-05-30','Keeblerbury','$2y$13$tQdcPaI8nFIwxaBNDqcA2em9QCzwZLyfT/qjAw3q.L2cf9uIFz7Oe'),
	(75,'bweissnat','Dibbert','Lacy','flueilwitz@gmail.com','1979-12-26','Wehnerport','$2y$13$oPz5yyoijaGVs2.HnjcvbeJOcqp8O6IBiHLI6gRKBX3uBRv957UGe'),
	(76,'predovic.jeffry','Krajcik','Korey','garrison18@yahoo.com','1991-06-30','Eltaborough','$2y$13$D9larrQnO1iYGS51VdfEIOCFVntROtByAgNe/LHiE6VioH5h5u5qa'),
	(77,'aurelia.block','Tillman','Antonietta','ywunsch@oberbrunner.biz','1992-07-21','Jackland','$2y$13$TwBZZhW.7MTpeTF/KH5WxeDqmnp06jZRTsDsh8DUuhxczQHAY/pb.'),
	(78,'roberts.willis','Torp','Eliane','little.rafael@gmail.com','2001-04-28','Kautzerport','$2y$13$MtS9Jiz0/93L4DEklVamR.o6dU4p5XIELHAKybVPlUT58WzySlntK'),
	(79,'harber.ambrose','Hauck','Braulio','schultz.zoe@runolfsdottir.com','1995-05-26','Lake Hayden','$2y$13$oo4tXsXVZ9E/BiCIvpz.P.rEd2ooubRun9hUMmDa9jaLMLr3oXKNi'),
	(80,'lelah87','O\'Hara','Earnestine','ueffertz@goldner.net','2007-10-01','Candaceberg','$2y$13$ri3GX5qOkvFuJs2lihwry.yK8A8vriiO7ArCUKfiMR/xkm4cSF2DC'),
	(81,'fahey.helmer','Watsica','Clifford','arvid.ward@yahoo.com','1980-09-22','West Oliverborough','$2y$13$jxSjZYsYkgfiNm2GoyqY7O0gzXfLhzzwgSgf7WNkfcg2dpy0/qkSu'),
	(82,'obeatty','Waters','Samson','fern75@hotmail.com','1971-12-16','East Garnet','$2y$13$Mevby70xlS.XDv9yqRId5un.7joF.BtyAOUIDRhGitiPcB9xHaiFO'),
	(83,'aric.toy','Rutherford','Zola','jasen84@donnelly.com','2017-02-23','West Kaiabury','$2y$13$aOlEx1kyqplZ5cXffQaWeeMwdNOAshZsNsX8W0K.Pjr07byqJ.tu2'),
	(84,'darrion.hills','Homenick','Keely','naltenwerth@bradtke.info','2015-01-13','East Madilynhaven','$2y$13$WfL2SdVKmQqpk9k2QG6SaeZPExJds98kHaxwgjXi/78sEFF43OpDq'),
	(85,'aidan48','McGlynn','Bessie','ethel.grady@yahoo.com','2006-10-18','South Elva','$2y$13$D9vvDf9pq27koiyVxg678uxwWtd0Bcic8D/ALpdFh0eibfgZc7gh.'),
	(86,'charlene86','Stracke','Garrison','zhills@gmail.com','1976-12-22','Makaylaberg','$2y$13$T/cjw755v4xVPbwT/HGR9OxjNNwUkeIW5QcE40dUUbLF6De3NXhSq'),
	(87,'heber.stamm','Denesik','Liam','kreiger.brycen@wuckert.com','2017-12-21','Port Hellen','$2y$13$yZnsbDV3UuovhlQ4WhziPeZ9ngmEkU/H1m9dPMpELOZEAkNvK.Nqi'),
	(88,'coucou','Machin','Truc','machin@truc.com','2000-02-14','Montpellier','$2y$13$iSbY6To7NoemhdcamUfjwe12sV1SgDi3bPcJkmbqo0lu4BCrzjeJ.'),
	(89,'T0t0aze','Toto','Tata','toto@tata.com','2000-02-15','Paris','$2y$13$42BbQjFV5lqz8My/YW4Q4.y9M9sv1SFLK7DpJUdTjrl.C4ZiHAJaa'),
	(90,'Azerty','Azerty','Truc','azerty@truc.com','2000-02-14','Montpellier','$2y$13$VZRRrBi8S.33WUwiaJVAWuIa2iIVG8VmEMBP2k/QWKGlweZPaEcuC');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
