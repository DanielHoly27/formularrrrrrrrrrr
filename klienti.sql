-- phpMyAdmin SQL Dump.
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost:3306
-- Vytvořeno: Čtv 26. úno 2026, 10:27
-- Verze serveru: 5.7.24
-- Verze PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `klienti`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `klienti`
--

CREATE TABLE `klienti` (
  `id` int(11) NOT NULL,
  `jmeno` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `prijmeni` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_czech_ci NOT NULL,
  `komentar` text COLLATE utf8mb4_czech_ci NOT NULL,
  `vytvoreno` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `klienti`
--

INSERT INTO `klienti` (`id`, `jmeno`, `prijmeni`, `email`, `komentar`, `vytvoreno`) VALUES
(1, 'awfd\\srf', 'rsdfyse', 'czsairy@gmail.com', 'aedfsfwe', '2026-02-26 09:26:33'),
(2, 'venca', 'dufgzhijok', 's.kavnjanyk@gmail.com', 'awrtdgrf', '2026-02-26 09:26:54');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `klienti`
--
ALTER TABLE `klienti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `klienti`
--
ALTER TABLE `klienti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
