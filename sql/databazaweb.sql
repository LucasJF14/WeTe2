-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `databazaweb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Switch to the database
USE `databazaweb`;

-- Create the "podujatie" table
CREATE TABLE IF NOT EXISTS podujatie (
  nazov varchar(20) NOT NULL,
  opisPodujatia varchar(100) NOT NULL,
  typpodujatia VARCHAR(20) NOT NULL,
  datumKonania date NOT NULL,
  miestoKonania VARCHAR(30) NOT NULL,
  region varchar(20) NOT NULL,
  sprava_ID INT(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (sprava_ID)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS regionpodujatia (
  ID_region INT(11) unsigned NOT NULL AUTO_INCREMENT,
  region VARCHAR(20) NOT NULL,
  PRIMARY KEY (ID_region)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS adresaPodujatia (
  ID_adresa INT(11) unsigned NOT NULL AUTO_INCREMENT,
  mesto VARCHAR(30) NOT NULL,
  ulica VARCHAR(50) NOT NULL,
  ID_region INT(11) unsigned NOT NULL, -- Change the data type here
  PRIMARY KEY (ID_adresa),
  FOREIGN KEY (ID_region) REFERENCES regionpodujatia (ID_region)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

-- Insert data into the "podujatie" table
INSERT INTO `podujatie` (`nazov`, `opisPodujatia`, `typPodujatia`, `datumKonania`, `miestoKonania`, `region`) VALUES
    ('Futbal', 'Zapas medzi...', 'Pripravny zapas', '2023-03-23', 'Športová, 917 01', 'Dolne Povazie'),
    ('Hokej', 'Zapas medzi....', 'Play-Off', '2023-04-20', 'Jesenkeho 22', 'Podpolanie'),
    ('Avatar: The way of water', 'Avatar sa vracia do kin po dlhych....', 'Film', '2023-01-04', 'Kino Star - Zvolen', 'Malohont'),
    ('Polovacka', 'Podte si s nami uzit polovacku....', 'Polovacka', '2028-11-01', 'Liptovsky Mikulas', 'Liptov'),
    ('Airsoft', 'hasdgfisgbviab', 'Strielacka', '2023-08-13', 'Pod Drahamy', 'Tekov'),
    ('E-sport', 'fasdyugucguyzvcg', 'Pocitacove hry', '2024-06-21', 'Namestie Mladeze', 'Zemplin');

-- Create the "Message" table
CREATE TABLE IF NOT EXISTS `Message` (
  `sprava` varchar(100) NOT NULL,
  `sprava_ID` int(11) NOT NULL,
  `datumKon` datetime DEFAULT current_timestamp(),
  `prihlasovacie_meno` varchar(10) DEFAULT 'Pouzivatel',
  `Message_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Message_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert data into the "Message" table
INSERT INTO `Message` (`sprava`, `sprava_ID`, `datumKon`, `prihlasovacie_meno`, `Message_ID`) VALUES
    ('OBS', 4, '2023-12-28 08:50:23', 'Helou', 6),
    ('ksd', 2, '2023-12-20 09:20:55', 'kljms', 16),
    ('iugfdhbn', 2, '2023-01-23 13:49:00', 'wdwd', 18),
    ('pts', 2, '2023-06-03 13:49:05', 'yert', 19),
    ('ptsd', 7, '2023-06-03 13:49:14', 'rtyy', 20),
    ('ptsd', 7, '2023-06-03 13:49:17', 'yert', 21),
    ('hi', 7, '2023-06-03 13:49:22', 'helehel', 22),
    ('Otazka ohladom podujatia', 7, '2023-05-14 02:19:00', 'pouzivatel156', 23),
    ('uirewto', 7, '2023-05-14 15:57:59', 'Aizek02', 24),
    ('Chcem sa pridat do skupiny', 7, '2023-05-14 20:20:20', 'RDO569', 25);

-- Create the "Pouzivatel" table
CREATE TABLE IF NOT EXISTS `Pouzivatel` (
  `id` int(11) NOT NULL,
  `pouzivatelske_meno` varchar(20) NOT NULL,
  `heslo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert data into the "Pouzivatel" table
INSERT INTO `Pouzivatel` (`id`, `pouzivatelske_meno`, `heslo`) VALUES
    (14, 'admin', 'admin');