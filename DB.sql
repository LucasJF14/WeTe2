-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.10.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for databazaweb
CREATE DATABASE IF NOT EXISTS `databazaweb` 
/*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `databazaweb`;

-- Dumping structure for table databazaweb.Eventy
CREATE TABLE IF NOT EXISTS `Eventy` (
  `nazov` varchar(20) NOT NULL,
  `opisPodujatia` varchar(100) NOT NULL,
  `typPodujatia` VARCHAR(20) NOT NULL,
  `datumKonania` date NOT NULL,
  `miestoKonania` VARCHAR(30) NOT NULL,
  `region` varchar(20) NOT NULL,
  `sprava_ID` INT(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sprava_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table databweb.Eventy: ~6 rows (approximately)
/*!40000 ALTER TABLE `Eventy` DISABLE KEYS */;
INSERT INTO `Eventy` (`nazov`, `opisPodujatia`, `typPodujatia`, `datumKonania`, `miestoKonania`, `region`) VALUES
	('Futbal', 'Zapas medzi...', 'Pripravny zapas', '2024-03-23', 'Športová, 917 01', 'Dolne Povazie'),
	('Hokej', 'Zapas medzi....', 'Play-Off', '2025-04-20', 'Jesenkeho 22', 'Podpolanie'),
	('Avatar: The way of water', 'Avatar sa vracia do kin po dlhych....', 'Film', '2025-01-04', 'Kino Star - Zvolen', 'Malohont'),
	('Polovacka', 'Podte si s nami uzit polovacku....', 'Polovacka', '2028-11-01', 'Liptovsky Mikulas', 'Liptov'),
	('Airsoft', 'hasdgfisgbviab', 'Strielacka', '2026-08-13', 'Pod Drahamy', 'Tekov'),
	('E-sport', 'fasdyugucguyzvcg', 'Pocitacove hry', '2028-06-21', 'Namestie Mladeze', 'Zemplin'),
	('E-sport', 'fasdyugucguyzvcg', 'Pocitacove hry', '2022-06-21', 'Namestie Mladeze', 'Zemplin'),
	('E-sport', 'fasdyugucguyzvcg', 'Pocitacove hry', '2023-06-21', 'Namestie Mladeze', 'Zemplin');
/*!40000 ALTER TABLE `Eventy` ENABLE KEYS */;

-- Dumping structure for table databazaweb.Message
CREATE TABLE IF NOT EXISTS `Message` (
  `sprava` varchar(100) NOT NULL,
  `sprava_ID` int(11) NOT NULL,
  `datumKon` datetime DEFAULT current_timestamp(),
  `prihlasovacie_meno` varchar(10) DEFAULT 'Pouzivatel',
  `Message_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Message_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table databazaweb.message: ~10 rows (approximately)
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` (`sprava`, `sprava_ID`, `datumKon`, `prihlasovacie_meno`, `Message_ID`) VALUES
	('OBS', 4, '2025-12-28 08:50:23', 'Helou', 6),
	('ksd', 2, '2024-12-20 09:20:55', 'kljms', 16),
	
	('iugfdhbn', 2, '2022-01-23 13:49:00', 'wdwd', 18),
	('pts', 2, '2026-06-03 13:49:05', 'yert', 19),
	('ptsd', 7, '2022-06-03 13:49:14', 'rtyy', 20),
	('ptsd', 7, '2025-06-03 13:49:17', 'yert', 21),
	('hi', 7, '2026-06-03 13:49:22', 'helehel', 22),
	('Otazka ohladom podujatia', 7, '2024-05-14 02:19:00', 'pouzivatel156', 23),
	('uirewto', 7, '2023-05-14 15:57:59', 'Aizek02', 24),
	('Chcem sa pridat do skupiny', 7, '2023-05-14 20:20:20', 'RDO569', 25);
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;

-- Dumping structure for table databazaweb.Pouzivatel
CREATE TABLE IF NOT EXISTS `Pouzivatel` (
  `id` int(11) NOT NULL,
  `pouzivatelske_meno` varchar(20) NOT NULL,
  `heslo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table databazaweb.Pouzivatel: ~1 rows (approximately)
/*!40000 ALTER TABLE `Pouzivatel` DISABLE KEYS */;
INSERT INTO `Pouzivatel` (`id`, `pouzivatelske_meno`, `heslo`) VALUES
	(14, 'admin', 'admin');
/*!40000 ALTER TABLE `Pouzivatel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
