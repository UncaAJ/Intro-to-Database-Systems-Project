-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 17, 2025 at 12:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs4332proj7`
--

-- --------------------------------------------------------

--
-- Table structure for table `PLAYERS`
--

CREATE TABLE `PLAYERS` (
  `PlayerID` int(10) NOT NULL,
  `PlayerName` varchar(255) NOT NULL,
  `Position` varchar(1) NOT NULL,
  `DateHired` date NOT NULL,
  `Salary` int(11) NOT NULL,
  `GamesPlayed` int(11) NOT NULL,
  `GamesOnRoster` int(11) NOT NULL,
  `Fouls` int(11) NOT NULL,
  `YellowCards` int(11) NOT NULL,
  `RedCards` int(11) NOT NULL,
  `Offsides` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PLAYERS`
--

INSERT INTO `PLAYERS` (`PlayerID`, `PlayerName`, `Position`, `DateHired`, `Salary`, `GamesPlayed`, `GamesOnRoster`, `Fouls`, `YellowCards`, `RedCards`, `Offsides`) VALUES
(1, 'Brad Stuver', 'G', '2020-12-28', 676780, 1, 1, 0, 0, 0, 0),
(2, 'Jon Gallagher', 'D', '2020-12-13', 375000, 1, 1, 0, 0, 0, 0),
(3, 'Julio Cascante', 'D', '2021-04-23', 780000, 1, 1, 1, 0, 0, 0),
(4, 'Zan Kolmanic', 'D', '2021-03-13', 350000, 0, 1, 0, 0, 0, 0),
(5, 'Daniel Pereira', 'M', '2021-04-23', 450000, 1, 1, 2, 0, 0, 0),
(6, 'Owen Wolff', 'M', '2021-09-09', 221600, 1, 1, 1, 0, 0, 0),
(7, 'Diego Rubio', 'F', '2024-01-01', 600000, 0, 1, 0, 0, 0, 0),
(8, 'Brendan Hines-Ike', 'D', '2024-01-01', 500000, 1, 1, 1, 0, 0, 0),
(9, 'Brandon Vázquez', 'F', '2025-01-06', 3200000, 1, 1, 2, 0, 0, 0),
(10, 'Jader Obrian', 'M', '2024-01-01', 350000, 1, 1, 4, 0, 0, 0),
(11, 'I. Sánchez', 'M', '2025-01-01', 320000, 1, 1, 1, 0, 0, 0),
(12, 'S. Cleveland', 'G', '2024-01-01', 150000, 0, 1, 0, 0, 0, 0),
(13, 'C. Fodrey', 'F', '2023-12-21', 108000, 0, 1, 0, 0, 0, 0),
(14, 'G. Biro', 'M', '2024-01-01', 475000, 1, 1, 1, 1, 0, 0),
(15, 'Osman Bukari', 'F', '2024-01-01', 1424800, 1, 1, 1, 0, 0, 0),
(16, 'Mikkel Desler', 'D', '2024-06-03', 550000, 1, 1, 1, 0, 0, 0),
(17, 'Oleksandr Svatok', 'D', '2024-01-01', 500000, 1, 1, 1, 0, 0, 0),
(18, 'Besard Sabovic', 'M', '2025-01-01', 605540, 1, 1, 0, 0, 0, 0),
(19, 'Myrto Uzuni', 'F', '2024-01-01', 1000000, 1, 1, 0, 0, 0, 0),
(20, 'Nikolai Dubersarsky', 'M', '2025-01-01', 300000, 1, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `STATS_DEFENDER`
--

CREATE TABLE `STATS_DEFENDER` (
  `PlayerID` int(11) NOT NULL,
  `Tackles` int(11) NOT NULL,
  `CornerKicks` int(11) NOT NULL,
  `Clearances` int(11) NOT NULL,
  `Passes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `STATS_DEFENDER`
--

INSERT INTO `STATS_DEFENDER` (`PlayerID`, `Tackles`, `CornerKicks`, `Clearances`, `Passes`) VALUES
(2, 0, 0, 0, 3),
(3, 0, 0, 0, 23),
(4, 0, 0, 0, 0),
(8, 0, 0, 0, 62),
(16, 0, 0, 0, 35),
(17, 0, 0, 0, 21);

-- --------------------------------------------------------

--
-- Table structure for table `STATS_FORWARD`
--

CREATE TABLE `STATS_FORWARD` (
  `PlayerID` int(11) NOT NULL,
  `Goals` int(11) NOT NULL,
  `ShotsOnGoal` int(11) NOT NULL,
  `ExpectedGoals` int(11) NOT NULL,
  `Assists` int(11) NOT NULL,
  `Passes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `STATS_FORWARD`
--

INSERT INTO `STATS_FORWARD` (`PlayerID`, `Goals`, `ShotsOnGoal`, `ExpectedGoals`, `Assists`, `Passes`) VALUES
(7, 0, 0, 0, 0, 0),
(9, 0, 3, 0, 0, 9),
(13, 0, 0, 0, 0, 0),
(15, 0, 2, 0, 0, 18),
(19, 0, 1, 0, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `STATS_GOAL`
--

CREATE TABLE `STATS_GOAL` (
  `PlayerID` int(11) NOT NULL,
  `Saves` int(11) NOT NULL,
  `AllowedGoals` int(11) NOT NULL,
  `GoalKicks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `STATS_GOAL`
--

INSERT INTO `STATS_GOAL` (`PlayerID`, `Saves`, `AllowedGoals`, `GoalKicks`) VALUES
(1, 1, 1, 15),
(12, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `STATS_MIDFIELDER`
--

CREATE TABLE `STATS_MIDFIELDER` (
  `PlayerID` int(10) NOT NULL,
  `Goals` int(11) NOT NULL,
  `ShotsOnGoal` int(11) NOT NULL,
  `Crosses` int(11) NOT NULL,
  `Assists` int(11) NOT NULL,
  `Passes` int(11) NOT NULL,
  `CornerKicks` int(11) NOT NULL,
  `Tackles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `STATS_MIDFIELDER`
--

INSERT INTO `STATS_MIDFIELDER` (`PlayerID`, `Goals`, `ShotsOnGoal`, `Crosses`, `Assists`, `Passes`, `CornerKicks`, `Tackles`) VALUES
(5, 0, 1, 3, 0, 54, 3, 0),
(6, 0, 0, 2, 0, 14, 0, 0),
(10, 0, 1, 0, 0, 10, 0, 0),
(11, 0, 1, 0, 0, 30, 0, 0),
(14, 0, 0, 0, 0, 45, 0, 0),
(18, 0, 2, 0, 0, 17, 0, 0),
(20, 0, 0, 0, 0, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `PLAYERS`
--
ALTER TABLE `PLAYERS`
  ADD PRIMARY KEY (`PlayerID`);

--
-- Indexes for table `STATS_DEFENDER`
--
ALTER TABLE `STATS_DEFENDER`
  ADD KEY `PlayerID` (`PlayerID`);

--
-- Indexes for table `STATS_FORWARD`
--
ALTER TABLE `STATS_FORWARD`
  ADD KEY `PlayerID` (`PlayerID`);

--
-- Indexes for table `STATS_GOAL`
--
ALTER TABLE `STATS_GOAL`
  ADD KEY `PlayerID` (`PlayerID`);

--
-- Indexes for table `STATS_MIDFIELDER`
--
ALTER TABLE `STATS_MIDFIELDER`
  ADD KEY `PlayerID` (`PlayerID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `STATS_DEFENDER`
--
ALTER TABLE `STATS_DEFENDER`
  ADD CONSTRAINT `stats_defender_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYERS` (`PlayerID`);

--
-- Constraints for table `STATS_FORWARD`
--
ALTER TABLE `STATS_FORWARD`
  ADD CONSTRAINT `stats_forward_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYERS` (`PlayerID`);

--
-- Constraints for table `STATS_GOAL`
--
ALTER TABLE `STATS_GOAL`
  ADD CONSTRAINT `stats_goal_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYERS` (`PlayerID`);

--
-- Constraints for table `STATS_MIDFIELDER`
--
ALTER TABLE `STATS_MIDFIELDER`
  ADD CONSTRAINT `stats_midfielder_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYERS` (`PlayerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
