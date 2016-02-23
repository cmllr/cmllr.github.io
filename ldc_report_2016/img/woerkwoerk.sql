-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 16. Nov 2015 um 21:49
-- Server Version: 5.5.46
-- PHP-Version: 5.6.14-1~dotdeb+7.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `woerkwoerk`
--

DELIMITER $$
--
-- Prozeduren
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `country_hos`(IN con CHAR(20))
BEGIN
 INSERT INTO  `woerkwoerk`.`InviteCode` (
`Code`
)
VALUES (
MD5(  uuid() )
);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bans`
--

CREATE TABLE IF NOT EXISTS `Bans` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ip` text COLLATE utf8_bin NOT NULL,
  `Reason` text COLLATE utf8_bin NOT NULL,
  `BanDateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `InviteCode`
--

CREATE TABLE IF NOT EXISTS `InviteCode` (
  `Code` varchar(5) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `InviteCode`
--

INSERT INTO `InviteCode` (`Code`) VALUES
('da984'),
('f63d9'),
('261af'),
('d0aed'),
('b4ccb'),
('71341'),
('b9a1d');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Role`
--

CREATE TABLE IF NOT EXISTS `Role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_bin,
  `permissions` text COLLATE utf8_bin,
  `IsDefault` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `Role`
--

INSERT INTO `Role` (`id`, `description`, `permissions`, `IsDefault`) VALUES
(1, 'Standard', '1111111111111', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Scheduler`
--

CREATE TABLE IF NOT EXISTS `Scheduler` (
  `TaskID` int(11) NOT NULL AUTO_INCREMENT,
  `Timestamp` bigint(20) NOT NULL,
  `What` text COLLATE utf8_bin NOT NULL,
  `UserID` int(11) NOT NULL,
  `Args` text COLLATE utf8_bin NOT NULL,
  `Active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`TaskID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;

--
-- Daten für Tabelle `Scheduler`
--

INSERT INTO `Scheduler` (`TaskID`, `Timestamp`, `What`, `UserID`, `Args`, `Active`) VALUES
(12, 1447704318, 'WoerkWoerk.Information.Mail', 191, '[''2015-11-16 00:00'',''2015-11-16 23:59'']', 0),
(13, 1447704432, 'WoerkWoerk.Information.Mail', 191, '[''1447628400'',''1447714740'']', 0),
(14, 1447704692, 'WoerkWoerk.Information.Mail', 191, '["1447628400","1447714740"]', 0),
(15, 1447705068, 'WoerkWoerk.Information.Mail', 191, '["1447628400","1447714740"]', 0),
(16, 1447705112, 'WoerkWoerk.Information.Mail', 191, '["1447628400","1447714740"]', 0),
(17, 1447705157, 'WoerkWoerk.Information.Mail', 191, '["",""]', 0),
(18, 1447705488, 'WoerkWoerk.Information.Mail', 191, '["",""]', 0),
(19, 1447705639, 'WoerkWoerk.Information.Mail', 191, '["1447023600","1447628340"]', 0),
(20, 1447705791, 'WoerkWoerk.Information.Mail', 191, '["1447023600","1447628340"]', 0),
(21, 1447705864, 'WoerkWoerk.Information.Mail', 191, '["1447023600","1447628340"]', 0),
(22, 1447705998, 'WoerkWoerk.Information.Mail', 191, '["1447023600","1447628340"]', 0),
(23, 1447706013, 'WoerkWoerk.Information.Mail', 191, '["1447023600","1447628340"]', 0),
(24, 1447706874, 'WoerkWoerk.Information.Mail', 191, '["",""]', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Session`
--

CREATE TABLE IF NOT EXISTS `Session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `token` text COLLATE utf8_bin NOT NULL,
  `sessionStartedDateTime` datetime NOT NULL,
  `sessionEndDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=51 ;

--
-- Daten für Tabelle `Session`
--

INSERT INTO `Session` (`id`, `userID`, `token`, `sessionStartedDateTime`, `sessionEndDateTime`) VALUES
(42, 191, '11937b0880f531acc36ef268af71dc65', '2015-11-15 00:32:32', NULL),
(45, 191, '8069dc438a3363109f5826175b20d37f', '2015-11-15 11:33:54', '1970-01-01 01:00:00'),
(47, 191, 'b0132a61e45ac71a1fa1a174a2d90551', '2015-11-15 16:27:36', '1970-01-01 01:00:00'),
(49, 191, '4ae9d42de5ef6ac44f1248a12c9a61f8', '2015-11-16 06:14:32', '1970-01-01 01:00:00'),
(50, 191, '5e61935827a4fc7599e52d689f4b1a84', '2015-11-16 19:31:37', '1970-01-01 01:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Settings`
--

CREATE TABLE IF NOT EXISTS `Settings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SettingName` text COLLATE utf8_bin NOT NULL,
  `SettingType` text COLLATE utf8_bin NOT NULL,
  `SettingValue` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=14 ;

--
-- Daten für Tabelle `Settings`
--

INSERT INTO `Settings` (`ID`, `SettingName`, `SettingType`, `SettingValue`) VALUES
(13, 'Enable_Register', 'Boolean', 'true');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TaskTimes`
--

CREATE TABLE IF NOT EXISTS `TaskTimes` (
  `ID` varchar(40) COLLATE utf8_bin NOT NULL,
  `UserID` int(11) NOT NULL,
  `Reason` text COLLATE utf8_bin,
  `Begin` bigint(20) DEFAULT NULL,
  `End` bigint(20) DEFAULT NULL,
  `Voided` tinyint(4) NOT NULL,
  `VoidDate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `TaskTimes`
--

INSERT INTO `TaskTimes` (`ID`, `UserID`, `Reason`, `Begin`, `End`, `Voided`, `VoidDate`) VALUES
('02ca16bd-8b27-11e5-9384-c03fd569730a', 191, 'fsdfdsfdsfds', 1447543539, 1447543540, 0, NULL),
('033fe210-8bac-11e5-9384-c03fd569730a', 191, 'gfdgfdgd', 1447600660, 1447600672, 0, NULL),
('09230d5b-8b27-11e5-9384-c03fd569730a', 191, 'fsdfdsf', 1447543550, 1447543552, 0, NULL),
('6f4e34f3-8b9b-11e5-9384-c03fd569730a', 191, 'fafawfawfawfwafawfawfawfafawfawf', 1447593540, 1447593575, 0, NULL),
('97c35fa2-8b7d-11e5-9384-c03fd569730a', 191, 'gzuj', 1447580723, 1447580741, 0, NULL),
('af159570-8c9b-11e5-9384-c03fd569730a', 191, 'test', 1447703598, 1447703607, 0, NULL),
('bea39fe6-8b26-11e5-9384-c03fd569730a', 191, 'cdsvds', 1447543422, 1447543435, 0, NULL),
('d7df6903-8baa-11e5-9384-c03fd569730a', 191, '48454', 1447600158, 1447600199, 0, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailAddress` text COLLATE utf8_bin,
  `registrationDateTime` datetime DEFAULT NULL,
  `lastLoginDateTime` datetime DEFAULT NULL,
  `passwordHash` text COLLATE utf8_bin,
  `isEnabled` tinyint(1) DEFAULT NULL,
  `roleID` int(11) DEFAULT NULL,
  `failedLogins` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Role` (`roleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=195 ;

--
-- Daten für Tabelle `User`
--

INSERT INTO `User` (`id`, `mailAddress`, `registrationDateTime`, `lastLoginDateTime`, `passwordHash`, `isEnabled`, `roleID`, `failedLogins`) VALUES
(191, 'me@0fury.de', '2015-10-24 18:33:59', '2015-11-16 19:31:37', '$2y$11$Y5anebN3Ny.v.BQmhw8b8ej.7gSWU/aRMO86H1wJHVs.ZUwwBtYLu', 1, 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserSettings`
--

CREATE TABLE IF NOT EXISTS `UserSettings` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SettingName` text COLLATE utf8_bin NOT NULL,
  `SettingType` text COLLATE utf8_bin NOT NULL,
  `SettingValue` text COLLATE utf8_bin NOT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=21 ;

--
-- Daten für Tabelle `UserSettings`
--

INSERT INTO `UserSettings` (`Id`, `SettingName`, `SettingType`, `SettingValue`, `UserId`) VALUES
(4, 'NotifyMonthly', 'Boolean', 'true', 191),
(13, 'RunningOvertimeNotify', 'UInt', '3', 191),
(14, 'day0', 'TimeSpan', '07:15-16:15', 191),
(15, 'day1', 'TimeSpan', '07:15-16:15', 191),
(16, 'day2', 'TimeSpan', '07:15-16:15', 191),
(17, 'day3', 'TimeSpan', '07:15-16:15', 191),
(18, 'day4', 'TimeSpan', '08:00-13:00', 191),
(19, 'day5', 'TimeSpan', '00:00-00:00', 191),
(20, 'day6', 'TimeSpan', '08:00-09:00', 191);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Scheduler`
--
ALTER TABLE `Scheduler`
  ADD CONSTRAINT `Scheduler_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`id`);

--
-- Constraints der Tabelle `Session`
--
ALTER TABLE `Session`
  ADD CONSTRAINT `Session_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`id`);

--
-- Constraints der Tabelle `TaskTimes`
--
ALTER TABLE `TaskTimes`
  ADD CONSTRAINT `TaskTimes_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`id`);

--
-- Constraints der Tabelle `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `fk_Role` FOREIGN KEY (`roleID`) REFERENCES `Role` (`id`);

--
-- Constraints der Tabelle `UserSettings`
--
ALTER TABLE `UserSettings`
  ADD CONSTRAINT `UserSettings_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `User` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
