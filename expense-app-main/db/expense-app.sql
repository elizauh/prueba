-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para expense-app
CREATE DATABASE IF NOT EXISTS `expense-app` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `expense-app`;

-- Volcando estructura para tabla expense-app.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla expense-app.categories: ~15 rows (aproximadamente)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `color`) VALUES
	(1, 'comida', '#DE1F59'),
	(2, 'hogar', '#DE1FAA'),
	(3, 'ropa', '#B01FDE'),
	(4, 'Juegos', '#681FDE'),
	(5, 'Viajes', '#1FAADE'),
	(6, 'Cine', '#cb5757'),
	(7, 'Plabra', '#d48282'),
	(10, 'Cancion', '#a07e7e'),
	(15, 'Nueva cate', '#000000'),
	(16, 'cate1', '#000000'),
	(17, 'cate 2', '#000000'),
	(19, 'asd asd', '#000000'),
	(20, 'categ 1 ', '#000000'),
	(21, 'categ 677 ', '#000000'),
	(22, 'otra nueva', '#000000');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla expense-app.expenses
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `category_id` int(5) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `date` date NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user_expense` (`id_user`),
  KEY `id_category_expense` (`category_id`),
  CONSTRAINT `id_category_expense` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `id_user_expense` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla expense-app.expenses: ~27 rows (aproximadamente)
DELETE FROM `expenses`;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` (`id`, `title`, `category_id`, `amount`, `date`, `id_user`) VALUES
	(1, 'prueba', 3, 12.40, '2020-03-21', 5),
	(2, 'starbucks', 1, 60.00, '2020-03-21', 5),
	(4, 'Regalo de cumpleaños mamá', 2, 1200.00, '2020-03-22', 5),
	(5, 'Nintendo Switch', 4, 4600.00, '2020-03-26', 5),
	(6, 'Viaje a Nueva York', 5, 20000.00, '2020-01-25', 5),
	(7, 'Chocolates Ferrero', 1, 140.00, '2020-03-27', 5),
	(10, 'sdsdsd', 1, 2323.00, '2020-04-03', 5),
	(11, 'sadas', 1, 232.00, '2020-04-03', 5),
	(12, 'sadas', 3, 11.00, '2020-04-03', 5),
	(13, 'sdsd', 5, 23.00, '2020-04-03', 5),
	(14, 'sdsd', 5, 23.00, '2020-04-03', 5),
	(19, 'Chilis', 1, 300.00, '2020-01-01', 5),
	(20, 'juego de Halo', 4, 1100.00, '2020-04-04', 5),
	(21, 'Uñas', 3, 200.00, '2020-04-09', 6),
	(23, 'pastillas para la tos', 2, 21.00, '2020-06-06', 5),
	(24, 'Ropa nueva', 3, 300.00, '2020-06-04', 5),
	(25, 'juego Nintendo', 2, 200.00, '2020-07-12', 5),
	(72, 'asd', 1, 3.00, '2022-08-05', 9),
	(84, 'script alert "hola" /script', 1, 12.00, '2022-08-05', 9),
	(85, 'ass asd asd', 1, 2.00, '2022-08-05', 9),
	(86, 'lojita', 5, 67.00, '2022-08-05', 9),
	(87, 'Viaje a cuenca', 5, 123.00, '2022-08-05', 9),
	(88, 'asd', 1, 1.00, '2022-08-05', 9),
	(89, 'gggg', 1, 56.00, '2022-08-05', 9),
	(90, ' qwe', 1, 123.00, '2022-08-05', 13),
	(91, 'xxxxx', 1, 45.00, '2022-08-05', 13),
	(92, 'qwe', 1, 12.00, '2022-08-14', 16);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;

-- Volcando estructura para tabla expense-app.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL,
  `budget` float(10,2) NOT NULL,
  `photo` varchar(300) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla expense-app.users: ~11 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `budget`, `photo`, `name`) VALUES
	(5, 'marcos', '$2y$10$0aOmd1LTFHtBLCEtDrJgy.xxs7FArnOlzHXLrviwP85LWS.XbxsNO', 'user', 100.00, 'd8eb8c58160f13143d4c6ef11c34b57a.png', 'Marcos Rivas'),
	(6, 'lena', '$2y$10$C/MX.IRvzrNuMyo4pk5uU.bCD20hSWChoCM1bp4n3kEzO2TYamSI.', 'user', 16000.00, '', 'Lenis'),
	(7, 'omar', '$2y$10$2YzZ9yzk2rSLbcbfBGkcIuWZ1HzjcNT8lTcgeidTiYbq2yzcNVxuq', 'admin', 20000.00, '', 'El Pozos'),
	(11, 'juan', '$2y$10$J6VtNZdGiHZb3Ip.f7J6w.7EGGmHVTRrpl/fmTnZ0udiSA2JzryLu', 'admin', 2000.00, '2ad73038e7c39f7b301fa8085101ecf9.png', ''),
	(12, 'lu sa', '$2y$10$uwCc8VTmwYO5xJzxjYgCFO5OF/ziCF9wcc11fHO8NVXB1z4StiULi', 'user', 0.00, '', ''),
	(13, '111', '$2y$10$eIlC7a5HyY6AYFTEw3v/3.paEn9CY5cgDRGmloORPqWAXgAJHh1wG', 'user', 200.00, '', 'uno'),
	(14, '222', '$2y$10$p01wxY27RV58Ty0nzCqbxOxlXGpbF.hWVlDLIQ8soNYKLNBI4YkB2', 'user', 0.00, '', ''),
	(15, 'r', '$2y$10$2acgDsueZ3W9N4w.OfAVqud8ojd0unGMEF0BoHkAaTxhBh1ytzllK', 'user', 0.00, '', ''),
	(16, '123', '$2y$10$Ed8EJtMBUDjUNqqcePji5OO9tbeJu1SNSGXOKlLV590lYd8L0hO7S', 'user', 0.00, '', '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
