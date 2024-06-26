-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 06 jun 2024 om 12:52
-- Serverversie: 10.4.25-MariaDB
-- PHP-versie: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bas project 8`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artikel`
--

CREATE TABLE `artikel` (
  `artId` int(11) NOT NULL,
  `artOmschrijving` varchar(12) NOT NULL,
  `artInkoop` decimal(5,2) DEFAULT NULL,
  `artVerkoop` decimal(5,2) DEFAULT NULL,
  `artVoorraad` int(11) NOT NULL,
  `artMinVoorraad` int(11) NOT NULL,
  `artMaxVoorraad` int(11) NOT NULL,
  `artLocatie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `artikel`
--

INSERT INTO `artikel` (`artId`, `artOmschrijving`, `artInkoop`, `artVerkoop`, `artVoorraad`, `artMinVoorraad`, `artMaxVoorraad`, `artLocatie`) VALUES
(1, 'Iphone', '450.00', '950.00', 5, 1, 20, 1),
(2, 'Ipad', '635.00', '750.00', 8, 2, 25, 2),
(3, 'Apple Watch', '185.00', '420.00', 15, 5, 50, 3),
(4, 'MacBook', '380.00', '825.00', 12, 1, 50, 4);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `inkoop`
--

CREATE TABLE `inkoop` (
  `inkOrdId` int(11) NOT NULL,
  `levId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `inkOrdDatum` date DEFAULT NULL,
  `inkOrdBestAantal` int(11) DEFAULT NULL,
  `inkOrdStatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `inkoop`
--

INSERT INTO `inkoop` (`inkOrdId`, `levId`, `artId`, `inkOrdDatum`, `inkOrdBestAantal`, `inkOrdStatus`) VALUES
(3, 1, 2, '2024-05-14', 50, 0),
(4, 2, 3, '2024-05-14', 25, 1),
(5, 3, 1, '2024-05-14', 30, 1),
(6, 4, 2, '2024-05-14', 50, 1),
(7, 3, 2, '2024-05-14', 50, 0),
(8, 4, 4, '2024-05-14', 30, 0),
(9, 1, 2, '2024-05-14', 25, 0),
(10, 2, 3, '2024-05-14', 50, 1),
(11, 1, 4, '2024-05-14', 50, 0),
(12, 3, 1, '2024-05-14', 25, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
--

CREATE TABLE `klant` (
  `klantId` int(11) NOT NULL,
  `klantNaam` varchar(20) NOT NULL,
  `klantEmail` varchar(30) NOT NULL,
  `klantAdres` varchar(30) NOT NULL,
  `klantPostcode` varchar(6) DEFAULT NULL,
  `klantWoonplaats` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `klant`
--

INSERT INTO `klant` (`klantId`, `klantNaam`, `klantEmail`, `klantAdres`, `klantPostcode`, `klantWoonplaats`) VALUES
(1, 'Younes', 'younes@example.com', 'Vlaardingen', '56756', 'Rotterdam'),
(2, 'Damien', 'damien@example.com', 'Sommelsdijk', '92738', 'Zuid-Holland'),
(3, 'Daniel', 'daniel@example.com', 'Middelharnis', '29471', 'Zeeland'),
(4, 'Joost', 'joost@example.com', 'Assen', '90241', 'Drenthe'),
(5, 'Alicia', 'alicia@example.com', 'Harlingen', '57192', 'Friesland'),
(6, 'Robbie', 'robbie@example.com', 'Bergen op Zoom', '95718', 'Noord-Brabant'),
(7, 'Koen', 'koen@example.com', 'Amstelveen', '47182', 'Noord-Holland'),
(8, 'Raoul ', 'raoul@example.com', 'Beek', '12343', 'Limburg'),
(9, 'Arda', 'arda@example.com', 'Somalie', '4391', 'Rotterdam'),
(10, 'Brandon', 'brandon@exampple.com', 'Afrika', '4391', 'Rotterdam'),
(11, 'Jacob', 'jacob@example.com', 'Anna Blamanpad 13', '65658', 'Middelharnis'),
(12, 'Rob', 'robwigmans@example.com', 'Vlaardingen', '626193', 'Rotterdam');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leveranciers`
--

CREATE TABLE `leveranciers` (
  `levId` int(11) NOT NULL,
  `levNaam` varchar(15) NOT NULL,
  `levContact` varchar(20) DEFAULT NULL,
  `levEmail` varchar(30) NOT NULL,
  `levAdres` varchar(30) DEFAULT NULL,
  `levPostcode` varchar(6) DEFAULT NULL,
  `levWoonplaats` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `leveranciers`
--

INSERT INTO `leveranciers` (`levId`, `levNaam`, `levContact`, `levEmail`, `levAdres`, `levPostcode`, `levWoonplaats`) VALUES
(1, 'Unilever', 'Alex heer', 'Alex@heer.com', '123 Main Street', '54321', 'Rotterdam'),
(2, 'Chocopop', 'Mark krom', 'Mark@krom.com', '456 Oak Avenue', '98765', 'Rotterdam'),
(3, 'Greens', 'John groen', 'John@groen.com', 'Supplier 789 Maple Drive', '13579', 'Rotterdam'),
(4, 'Sandwichking', 'Kate nas', 'Kate@nas.com', '321 Elm Street', '24680', 'Rotterdam');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `verkoop`
--

CREATE TABLE `verkoop` (
  `verkOrdId` int(11) NOT NULL,
  `klantId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `verkOrdDatum` date DEFAULT NULL,
  `verkOrdBestAantal` int(11) DEFAULT NULL,
  `verkOrdStatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `verkoop`
--

INSERT INTO `verkoop` (`verkOrdId`, `klantId`, `artId`, `verkOrdDatum`, `verkOrdBestAantal`, `verkOrdStatus`) VALUES
(77, 7, 4, '2024-10-31', 10, 1),
(78, 7, 3, '2024-08-31', 2, 1);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`artId`);

--
-- Indexen voor tabel `inkoop`
--
ALTER TABLE `inkoop`
  ADD PRIMARY KEY (`inkOrdId`),
  ADD KEY `levId` (`levId`),
  ADD KEY `artId` (`artId`);

--
-- Indexen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`klantId`);

--
-- Indexen voor tabel `leveranciers`
--
ALTER TABLE `leveranciers`
  ADD PRIMARY KEY (`levId`);

--
-- Indexen voor tabel `verkoop`
--
ALTER TABLE `verkoop`
  ADD PRIMARY KEY (`verkOrdId`),
  ADD KEY `klantId` (`klantId`),
  ADD KEY `artId` (`artId`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `artikel`
--
ALTER TABLE `artikel`
  MODIFY `artId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT voor een tabel `inkoop`
--
ALTER TABLE `inkoop`
  MODIFY `inkOrdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `klant`
--
ALTER TABLE `klant`
  MODIFY `klantId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `leveranciers`
--
ALTER TABLE `leveranciers`
  MODIFY `levId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `verkoop`
--
ALTER TABLE `verkoop`
  MODIFY `verkOrdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `inkoop`
--
ALTER TABLE `inkoop`
  ADD CONSTRAINT `inkoop_ibfk_1` FOREIGN KEY (`levId`) REFERENCES `leveranciers` (`levId`),
  ADD CONSTRAINT `inkoop_ibfk_2` FOREIGN KEY (`artId`) REFERENCES `artikel` (`artId`);

--
-- Beperkingen voor tabel `verkoop`
--
ALTER TABLE `verkoop`
  ADD CONSTRAINT `verkoop_ibfk_1` FOREIGN KEY (`klantId`) REFERENCES `klant` (`klantId`),
  ADD CONSTRAINT `verkoop_ibfk_2` FOREIGN KEY (`artId`) REFERENCES `artikel` (`artId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
