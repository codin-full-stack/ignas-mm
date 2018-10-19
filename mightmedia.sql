-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 19, 2018 at 10:18 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mightmedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_chat`
--

DROP TABLE IF EXISTS `admin_chat`;
CREATE TABLE IF NOT EXISTS `admin_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` varchar(25) COLLATE utf8_lithuanian_ci NOT NULL,
  `msg` longtext COLLATE utf8_lithuanian_ci NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_box`
--

DROP TABLE IF EXISTS `chat_box`;
CREATE TABLE IF NOT EXISTS `chat_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nikas` varchar(150) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `msg` varchar(250) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `niko_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `chat_box`
--

INSERT INTO `chat_box` (`id`, `nikas`, `msg`, `time`, `niko_id`) VALUES
(1, 'Sistema', 'Labas, Pasauli :)', '2012-09-09 13:48:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `duk`
--

DROP TABLE IF EXISTS `duk`;
CREATE TABLE IF NOT EXISTS `duk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klausimas` varchar(200) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `atsakymas` text COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_forumai`
--

DROP TABLE IF EXISTS `d_forumai`;
CREATE TABLE IF NOT EXISTS `d_forumai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pav` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `place` int(11) DEFAULT NULL,
  `teises` varchar(250) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'N;',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_straipsniai`
--

DROP TABLE IF EXISTS `d_straipsniai`;
CREATE TABLE IF NOT EXISTS `d_straipsniai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `pav` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `last_data` int(10) DEFAULT NULL,
  `last_nick` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `autorius` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `uzrakinta` set('taip','ne') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'ne',
  `sticky` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_temos`
--

DROP TABLE IF EXISTS `d_temos`;
CREATE TABLE IF NOT EXISTS `d_temos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  `pav` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `aprasymas` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `last_data` int(10) DEFAULT NULL,
  `last_nick` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `place` int(11) DEFAULT NULL,
  `teises` varchar(250) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'N;',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_zinute`
--

DROP TABLE IF EXISTS `d_zinute`;
CREATE TABLE IF NOT EXISTS `d_zinute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `nick` int(11) DEFAULT NULL,
  `zinute` text COLLATE utf8_lithuanian_ci,
  `laikas` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galerija`
--

DROP TABLE IF EXISTS `galerija`;
CREATE TABLE IF NOT EXISTS `galerija` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `pavadinimas` char(100) COLLATE utf8_lithuanian_ci DEFAULT 'Be pavadinimo',
  `file` char(100) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'none.png',
  `foto` text COLLATE utf8_lithuanian_ci,
  `apie` longtext COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `autorius` int(6) NOT NULL DEFAULT '0',
  `data` int(10) DEFAULT NULL,
  `categorija` int(3) DEFAULT '1',
  `teises` varchar(2) COLLATE utf8_lithuanian_ci DEFAULT 'N;',
  `kom` set('taip','ne') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'taip',
  `rodoma` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NE',
  PRIMARY KEY (`ID`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_admin_chat`
--

DROP TABLE IF EXISTS `gg_admin_chat`;
CREATE TABLE IF NOT EXISTS `gg_admin_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` varchar(25) COLLATE utf8_lithuanian_ci NOT NULL,
  `msg` longtext COLLATE utf8_lithuanian_ci NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_chat_box`
--

DROP TABLE IF EXISTS `gg_chat_box`;
CREATE TABLE IF NOT EXISTS `gg_chat_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nikas` varchar(150) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `msg` varchar(250) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `niko_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `gg_chat_box`
--

INSERT INTO `gg_chat_box` (`id`, `nikas`, `msg`, `time`, `niko_id`) VALUES
(1, 'Sistema', 'Labas, Pasauli :)', '2012-09-09 13:48:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gg_duk`
--

DROP TABLE IF EXISTS `gg_duk`;
CREATE TABLE IF NOT EXISTS `gg_duk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klausimas` varchar(200) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `atsakymas` text COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_d_forumai`
--

DROP TABLE IF EXISTS `gg_d_forumai`;
CREATE TABLE IF NOT EXISTS `gg_d_forumai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pav` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `place` int(11) DEFAULT NULL,
  `teises` varchar(250) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'N;',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_d_straipsniai`
--

DROP TABLE IF EXISTS `gg_d_straipsniai`;
CREATE TABLE IF NOT EXISTS `gg_d_straipsniai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `pav` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `last_data` int(10) DEFAULT NULL,
  `last_nick` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `autorius` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `uzrakinta` set('taip','ne') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'ne',
  `sticky` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_d_temos`
--

DROP TABLE IF EXISTS `gg_d_temos`;
CREATE TABLE IF NOT EXISTS `gg_d_temos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  `pav` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `aprasymas` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `last_data` int(10) DEFAULT NULL,
  `last_nick` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `place` int(11) DEFAULT NULL,
  `teises` varchar(250) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'N;',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_d_zinute`
--

DROP TABLE IF EXISTS `gg_d_zinute`;
CREATE TABLE IF NOT EXISTS `gg_d_zinute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `nick` int(11) DEFAULT NULL,
  `zinute` text COLLATE utf8_lithuanian_ci,
  `laikas` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_galerija`
--

DROP TABLE IF EXISTS `gg_galerija`;
CREATE TABLE IF NOT EXISTS `gg_galerija` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `pavadinimas` char(100) COLLATE utf8_lithuanian_ci DEFAULT 'Be pavadinimo',
  `file` char(100) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'none.png',
  `foto` text COLLATE utf8_lithuanian_ci,
  `apie` longtext COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `autorius` int(6) NOT NULL DEFAULT '0',
  `data` int(10) DEFAULT NULL,
  `categorija` int(3) DEFAULT '1',
  `teises` varchar(2) COLLATE utf8_lithuanian_ci DEFAULT 'N;',
  `kom` set('taip','ne') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'taip',
  `rodoma` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NE',
  PRIMARY KEY (`ID`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_grupes`
--

DROP TABLE IF EXISTS `gg_grupes`;
CREATE TABLE IF NOT EXISTS `gg_grupes` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(128) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `aprasymas` mediumtext COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `teises` varchar(150) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'N;',
  `pav` varchar(256) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `path` varchar(150) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '0',
  `kieno` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `place` int(11) NOT NULL DEFAULT '1',
  `mod` text COLLATE utf8_lithuanian_ci,
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_kas_prisijunges`
--

DROP TABLE IF EXISTS `gg_kas_prisijunges`;
CREATE TABLE IF NOT EXISTS `gg_kas_prisijunges` (
  `id` int(11) NOT NULL,
  `uid` varchar(11) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '',
  `timestamp` int(15) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `file` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `user` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `agent` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `ref` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `clicks` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `ip` (`ip`),
  KEY `file` (`file`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_knyga`
--

DROP TABLE IF EXISTS `gg_knyga`;
CREATE TABLE IF NOT EXISTS `gg_knyga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nikas` varchar(150) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `msg` varchar(250) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `msg` (`msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_kom`
--

DROP TABLE IF EXISTS `gg_kom`;
CREATE TABLE IF NOT EXISTS `gg_kom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kid` int(11) NOT NULL DEFAULT '0',
  `pid` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '0',
  `zinute` text COLLATE utf8_lithuanian_ci,
  `nick` varchar(250) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `nick_id` int(11) NOT NULL DEFAULT '0',
  `data` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_logai`
--

DROP TABLE IF EXISTS `gg_logai`;
CREATE TABLE IF NOT EXISTS `gg_logai` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `action` text COLLATE utf8_lithuanian_ci,
  `time` int(10) DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_naujienos`
--

DROP TABLE IF EXISTS `gg_naujienos`;
CREATE TABLE IF NOT EXISTS `gg_naujienos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `kategorija` int(2) NOT NULL DEFAULT '1',
  `naujiena` mediumtext COLLATE utf8_lithuanian_ci,
  `daugiau` text COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `data` int(10) DEFAULT NULL,
  `autorius` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `kom` set('taip','ne') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'taip',
  `rodoma` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NE',
  `sticky` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `gg_naujienos`
--

INSERT INTO `gg_naujienos` (`id`, `pavadinimas`, `kategorija`, `naujiena`, `daugiau`, `lang`, `data`, `autorius`, `kom`, `rodoma`, `sticky`) VALUES
(1, 'Sveikiname įdiegus MightMedia TVS v.1.46', 0, 'Jūs sėkmingai įdiegėte <a target=\"_blank\" title=\"MightMedia TVS\" href=\"http://www.mightmedia.lt\">MightMedia TVS</a> . Jos autoriai <a target=\"_blank\" href=\"http://code.google.com/p/coders/\"><strong>CodeRS</strong></a> . Prašome nepasisavinti autorinių teisių, priešingu atveju jūs pažeisite GNU teises.', 'Kiekvienam puslapyje privalomas užrašas apačioje \"<a target=\"_blank\" href=\"http://www.mightmedia.lt/\">MightMedia</a>\" su nuoroda į <a target=\"_blank\" href=\"http://www.mightmedia.lt/\">http://www.mightmedia.lt</a>\r\n', 'lt', 1346622467, 'Sistema', 'taip', 'TAIP', 0);

-- --------------------------------------------------------

--
-- Table structure for table `gg_newsgetters`
--

DROP TABLE IF EXISTS `gg_newsgetters`;
CREATE TABLE IF NOT EXISTS `gg_newsgetters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gg_nuorodos`
--

DROP TABLE IF EXISTS `gg_nuorodos`;
CREATE TABLE IF NOT EXISTS `gg_nuorodos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(3) NOT NULL DEFAULT '1',
  `url` varchar(200) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'http://',
  `pavadinimas` varchar(200) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '0',
  `click` int(11) NOT NULL DEFAULT '0',
  `nick` int(5) DEFAULT NULL,
  `date` int(10) DEFAULT NULL,
  `apie` text COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `active` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NE',
  `balsai` int(255) NOT NULL DEFAULT '0',
  `balsavo` text COLLATE utf8_lithuanian_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_nustatymai`
--

DROP TABLE IF EXISTS `gg_nustatymai`;
CREATE TABLE IF NOT EXISTS `gg_nustatymai` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `val` text COLLATE utf8_lithuanian_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `gg_nustatymai`
--

INSERT INTO `gg_nustatymai` (`id`, `key`, `val`) VALUES
(1, 'Pavadinimas', 'MightMedia TVS'),
(2, 'Apie', 'Trumpai apie svetainę'),
(3, 'Keywords', 'TVS, mightmedia, coders'),
(4, 'Copyright', '<a href=\"http://www.mightmedia.lt\" target=\"_blank\">MightMedia TVS</a>'),
(5, 'Palaikymas', '1'),
(6, 'Maintenance', 'Atsiprašome<br /> Svetainė šiuo metu yra tvarkoma.<br /> Prisijungti gali tik administratoriai.'),
(7, 'Chat_limit', '5'),
(8, 'News_limit', '5'),
(9, 'Stilius', 'apelsinas'),
(10, 'Bandymai', '3'),
(11, 'fotodyd', '450'),
(12, 'minidyd', '150'),
(13, 'galbalsuot', '1'),
(14, 'fotoperpsl', '10'),
(15, 'galkom', '1'),
(16, 'pirminis', 'naujienos'),
(17, 'keshas', '0'),
(18, 'kmomentarai_sveciams', '0'),
(19, 'F_urls', ';'),
(20, 'galorder', 'data'),
(21, 'galorder_type', 'DESC'),
(22, 'Editor', 'markitup'),
(23, 'hyphenator', '1'),
(24, 'Pastas', 'Jurevicius.ignas@gmail.com'),
(25, 'kalba', 'lt.php');

-- --------------------------------------------------------

--
-- Table structure for table `gg_page`
--

DROP TABLE IF EXISTS `gg_page`;
CREATE TABLE IF NOT EXISTS `gg_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `file` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `place` int(11) DEFAULT NULL,
  `show` enum('Y','N') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'Y',
  `teises` varchar(150) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'N;',
  `parent` int(150) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `gg_page`
--

INSERT INTO `gg_page` (`id`, `pavadinimas`, `lang`, `file`, `place`, `show`, `teises`, `parent`) VALUES
(1, 'Forumas', 'lt', 'frm.php', 3, 'Y', 'N;', 0),
(2, 'Naujienos', 'lt', 'naujienos.php', 1, 'Y', 'N;', 0),
(3, 'Apie', 'lt', 'apie.php', 5, 'Y', 'N;', 0),
(4, 'Registracija', 'lt', 'reg.php', 13, 'N', 'N;', 0),
(5, 'Slaptažodis', 'lt', 'slaptazodzio_priminimas.php', 12, 'N', 'N;', 0),
(6, 'Profilio redagavimas', 'lt', 'edit_user.php', 11, 'N', 'N;', 0),
(7, 'Paieška', 'lt', 'search.php', 6, 'Y', 'N;', 0),
(8, 'Kontaktai', 'lt', 'kontaktas.php', 6, 'Y', 'N;', 0),
(9, 'Prisijungę', 'lt', 'online.php', 7, 'Y', 'N;', 0),
(10, 'Archyvas', 'lt', 'deze.php', 8, 'N', 'N;', 0),
(11, 'Asmeniniai pranešimai', 'lt', 'pm.php', 0, 'N', 'N;', 0),
(12, 'Profilis', 'lt', 'view_user.php', 9, 'N', 'N;', 0),
(13, 'Nariai', 'lt', 'nariai.php', 10, 'Y', 'N;', 0),
(14, 'Galerija', 'lt', 'galerija.php', 4, 'Y', 'N;', 0),
(15, 'Straipsniai', 'lt', 'straipsnis.php', 2, 'Y', 'N;', 0);

-- --------------------------------------------------------

--
-- Table structure for table `gg_panel`
--

DROP TABLE IF EXISTS `gg_panel`;
CREATE TABLE IF NOT EXISTS `gg_panel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panel` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `file` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `place` int(11) DEFAULT NULL,
  `align` enum('R','L','C') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'C',
  `rodyti` varchar(4) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `show` enum('Y','N') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'Y',
  `teises` varchar(150) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'N;',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `gg_panel`
--

INSERT INTO `gg_panel` (`id`, `panel`, `lang`, `file`, `place`, `align`, `rodyti`, `show`, `teises`) VALUES
(1, 'Kas naujo?', 'lt', 'kas_naujo.php', 1, 'R', 'Taip', 'Y', 'N;'),
(2, 'Narys', 'lt', 'vartotojas.php', 2, 'R', 'Taip', 'Y', 'N;'),
(3, 'Rėksnių dėžė', 'lt', 'reksniu_deze.php', 3, 'R', 'Taip', 'Y', 'N;'),
(4, 'Kalendorius', 'lt', 'kalendorius.php', 4, 'L', 'Taip', 'Y', 'N;'),
(5, 'Meniu', 'lt', 'meniu.php', 5, 'L', 'Taip', 'Y', 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `gg_poll_answers`
--

DROP TABLE IF EXISTS `gg_poll_answers`;
CREATE TABLE IF NOT EXISTS `gg_poll_answers` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `question_id` int(255) NOT NULL DEFAULT '0',
  `answer` text CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gg_poll_questions`
--

DROP TABLE IF EXISTS `gg_poll_questions`;
CREATE TABLE IF NOT EXISTS `gg_poll_questions` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `question` text CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `radio` int(1) NOT NULL DEFAULT '0',
  `shown` int(1) NOT NULL DEFAULT '0',
  `only_guests` int(1) NOT NULL,
  `author_id` int(11) NOT NULL DEFAULT '1',
  `author_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'Admin',
  `lang` varchar(3) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gg_poll_votes`
--

DROP TABLE IF EXISTS `gg_poll_votes`;
CREATE TABLE IF NOT EXISTS `gg_poll_votes` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `question_id` int(255) NOT NULL DEFAULT '0',
  `answer_id` int(255) NOT NULL DEFAULT '0',
  `lang` varchar(3) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gg_private_msg`
--

DROP TABLE IF EXISTS `gg_private_msg`;
CREATE TABLE IF NOT EXISTS `gg_private_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `to` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '...',
  `msg` text COLLATE utf8_lithuanian_ci,
  `read` set('YES','NO') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NO',
  `date` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_ratings`
--

DROP TABLE IF EXISTS `gg_ratings`;
CREATE TABLE IF NOT EXISTS `gg_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating_id` varchar(80) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `rating_num` int(11) DEFAULT NULL,
  `IP` varchar(45) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `psl` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_salis`
--

DROP TABLE IF EXISTS `gg_salis`;
CREATE TABLE IF NOT EXISTS `gg_salis` (
  `iso` char(2) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `printable_name` varchar(80) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `iso3` char(3) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`iso`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `gg_salis`
--

INSERT INTO `gg_salis` (`iso`, `name`, `printable_name`, `iso3`, `numcode`) VALUES
('LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
('RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
('US', 'UNITED STATES', 'United States', 'USA', 840);

-- --------------------------------------------------------

--
-- Table structure for table `gg_siuntiniai`
--

DROP TABLE IF EXISTS `gg_siuntiniai`;
CREATE TABLE IF NOT EXISTS `gg_siuntiniai` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `paspaudimai` decimal(11,0) NOT NULL DEFAULT '0',
  `pavadinimas` char(100) COLLATE utf8_lithuanian_ci DEFAULT 'Be pavadinimo',
  `file` char(100) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'none.png',
  `foto` text COLLATE utf8_lithuanian_ci,
  `apie` longtext COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `autorius` int(6) NOT NULL DEFAULT '0',
  `data` int(10) DEFAULT NULL,
  `categorija` int(3) DEFAULT '1',
  `teises` varchar(2) COLLATE utf8_lithuanian_ci DEFAULT 'N;',
  `rodoma` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NE',
  PRIMARY KEY (`ID`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_straipsniai`
--

DROP TABLE IF EXISTS `gg_straipsniai`;
CREATE TABLE IF NOT EXISTS `gg_straipsniai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `pav` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `t_text` text COLLATE utf8_lithuanian_ci,
  `f_text` longtext COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `date` int(11) DEFAULT NULL,
  `autorius` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `autorius_id` int(11) DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `kom` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'ne',
  `rodoma` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NE',
  `kat` int(125) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gg_s_punktai`
--

DROP TABLE IF EXISTS `gg_s_punktai`;
CREATE TABLE IF NOT EXISTS `gg_s_punktai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pav` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `gg_s_punktai`
--

INSERT INTO `gg_s_punktai` (`id`, `pav`, `sid`) VALUES
(1, 'Atviras Kodas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gg_users`
--

DROP TABLE IF EXISTS `gg_users`;
CREATE TABLE IF NOT EXISTS `gg_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `nick` varchar(15) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `levelis` int(2) NOT NULL DEFAULT '3',
  `pass` varchar(32) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `slaptas` char(32) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `icq` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `msn` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `skype` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `yahoo` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `aim` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `url` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `salis` varchar(3) COLLATE utf8_lithuanian_ci DEFAULT 'LT',
  `miestas` varchar(20) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `vardas` varchar(15) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `pavarde` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `gim_data` date DEFAULT NULL,
  `parasas` text COLLATE utf8_lithuanian_ci,
  `forum_temos` int(11) NOT NULL DEFAULT '0',
  `forum_atsakyta` int(11) NOT NULL DEFAULT '0',
  `taskai` decimal(11,0) NOT NULL DEFAULT '0',
  `balsai` int(11) NOT NULL DEFAULT '0',
  `balsavo` text COLLATE utf8_lithuanian_ci,
  `pm_viso` int(11) NOT NULL DEFAULT '50',
  `reg_data` int(10) DEFAULT NULL,
  `login_data` int(10) DEFAULT NULL,
  `login_before` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nick` (`nick`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `gg_users`
--

INSERT INTO `gg_users` (`id`, `ip`, `nick`, `levelis`, `pass`, `email`, `slaptas`, `icq`, `msn`, `skype`, `yahoo`, `aim`, `url`, `salis`, `miestas`, `vardas`, `pavarde`, `gim_data`, `parasas`, `forum_temos`, `forum_atsakyta`, `taskai`, `balsai`, `balsavo`, `pm_viso`, `reg_data`, `login_data`, `login_before`) VALUES
(1, '::1', 'Ignitious', 1, '96fc30851a5b736c26d5b15b885d49d4', 'Jurevicius.ignas@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LT', NULL, NULL, NULL, NULL, 'Svetainės administratorius', 0, 0, '0', 0, NULL, 500, 1539938181, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `grupes`
--

DROP TABLE IF EXISTS `grupes`;
CREATE TABLE IF NOT EXISTS `grupes` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(128) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `aprasymas` mediumtext COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `teises` varchar(150) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'N;',
  `pav` varchar(256) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `path` varchar(150) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '0',
  `kieno` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `place` int(11) NOT NULL DEFAULT '1',
  `mod` text COLLATE utf8_lithuanian_ci,
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kas_prisijunges`
--

DROP TABLE IF EXISTS `kas_prisijunges`;
CREATE TABLE IF NOT EXISTS `kas_prisijunges` (
  `id` int(11) NOT NULL,
  `uid` varchar(11) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '',
  `timestamp` int(15) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `file` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `user` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `agent` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `ref` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `clicks` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `ip` (`ip`),
  KEY `file` (`file`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knyga`
--

DROP TABLE IF EXISTS `knyga`;
CREATE TABLE IF NOT EXISTS `knyga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nikas` varchar(150) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `msg` varchar(250) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `msg` (`msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kom`
--

DROP TABLE IF EXISTS `kom`;
CREATE TABLE IF NOT EXISTS `kom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kid` int(11) NOT NULL DEFAULT '0',
  `pid` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '0',
  `zinute` text COLLATE utf8_lithuanian_ci,
  `nick` varchar(250) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `nick_id` int(11) NOT NULL DEFAULT '0',
  `data` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logai`
--

DROP TABLE IF EXISTS `logai`;
CREATE TABLE IF NOT EXISTS `logai` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `action` text COLLATE utf8_lithuanian_ci,
  `time` int(10) DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `naujienos`
--

DROP TABLE IF EXISTS `naujienos`;
CREATE TABLE IF NOT EXISTS `naujienos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `kategorija` int(2) NOT NULL DEFAULT '1',
  `naujiena` mediumtext COLLATE utf8_lithuanian_ci,
  `daugiau` text COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `data` int(10) DEFAULT NULL,
  `autorius` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `kom` set('taip','ne') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'taip',
  `rodoma` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NE',
  `sticky` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `naujienos`
--

INSERT INTO `naujienos` (`id`, `pavadinimas`, `kategorija`, `naujiena`, `daugiau`, `lang`, `data`, `autorius`, `kom`, `rodoma`, `sticky`) VALUES
(1, 'Sveikiname įdiegus MightMedia TVS v.1.46', 0, 'Jūs sėkmingai įdiegėte <a target=\"_blank\" title=\"MightMedia TVS\" href=\"http://www.mightmedia.lt\">MightMedia TVS</a> . Jos autoriai <a target=\"_blank\" href=\"http://code.google.com/p/coders/\"><strong>CodeRS</strong></a> . Prašome nepasisavinti autorinių teisių, priešingu atveju jūs pažeisite GNU teises.', 'Kiekvienam puslapyje privalomas užrašas apačioje \"<a target=\"_blank\" href=\"http://www.mightmedia.lt/\">MightMedia</a>\" su nuoroda į <a target=\"_blank\" href=\"http://www.mightmedia.lt/\">http://www.mightmedia.lt</a>\r\n', 'lt', 1346622467, 'Sistema', 'taip', 'TAIP', 0);

-- --------------------------------------------------------

--
-- Table structure for table `newsgetters`
--

DROP TABLE IF EXISTS `newsgetters`;
CREATE TABLE IF NOT EXISTS `newsgetters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nuorodos`
--

DROP TABLE IF EXISTS `nuorodos`;
CREATE TABLE IF NOT EXISTS `nuorodos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(3) NOT NULL DEFAULT '1',
  `url` varchar(200) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'http://',
  `pavadinimas` varchar(200) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '0',
  `click` int(11) NOT NULL DEFAULT '0',
  `nick` int(5) DEFAULT NULL,
  `date` int(10) DEFAULT NULL,
  `apie` text COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `active` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NE',
  `balsai` int(255) NOT NULL DEFAULT '0',
  `balsavo` text COLLATE utf8_lithuanian_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nustatymai`
--

DROP TABLE IF EXISTS `nustatymai`;
CREATE TABLE IF NOT EXISTS `nustatymai` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `val` text COLLATE utf8_lithuanian_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `nustatymai`
--

INSERT INTO `nustatymai` (`id`, `key`, `val`) VALUES
(1, 'Pavadinimas', 'MightMedia TVS'),
(2, 'Apie', 'Trumpai apie svetainę'),
(3, 'Keywords', 'TVS, mightmedia, coders'),
(4, 'Copyright', '<a href=\"http://www.mightmedia.lt\" target=\"_blank\">MightMedia TVS</a>'),
(5, 'Palaikymas', '1'),
(6, 'Maintenance', 'Atsiprašome<br /> Svetainė šiuo metu yra tvarkoma.<br /> Prisijungti gali tik administratoriai.'),
(7, 'Chat_limit', '5'),
(8, 'News_limit', '5'),
(9, 'Stilius', 'apelsinas'),
(10, 'Bandymai', '3'),
(11, 'fotodyd', '450'),
(12, 'minidyd', '150'),
(13, 'galbalsuot', '1'),
(14, 'fotoperpsl', '10'),
(15, 'galkom', '1'),
(16, 'pirminis', 'naujienos'),
(17, 'keshas', '0'),
(18, 'kmomentarai_sveciams', '0'),
(19, 'F_urls', ';'),
(20, 'galorder', 'data'),
(21, 'galorder_type', 'DESC'),
(22, 'Editor', 'markitup'),
(23, 'hyphenator', '1');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `file` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `place` int(11) DEFAULT NULL,
  `show` enum('Y','N') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'Y',
  `teises` varchar(150) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'N;',
  `parent` int(150) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `pavadinimas`, `lang`, `file`, `place`, `show`, `teises`, `parent`) VALUES
(1, 'Forumas', 'lt', 'frm.php', 3, 'Y', 'N;', 0),
(2, 'Naujienos', 'lt', 'naujienos.php', 1, 'Y', 'N;', 0),
(3, 'Apie', 'lt', 'apie.php', 5, 'Y', 'N;', 0),
(4, 'Registracija', 'lt', 'reg.php', 13, 'N', 'N;', 0),
(5, 'Slaptažodis', 'lt', 'slaptazodzio_priminimas.php', 12, 'N', 'N;', 0),
(6, 'Profilio redagavimas', 'lt', 'edit_user.php', 11, 'N', 'N;', 0),
(7, 'Paieška', 'lt', 'search.php', 6, 'Y', 'N;', 0),
(8, 'Kontaktai', 'lt', 'kontaktas.php', 6, 'Y', 'N;', 0),
(9, 'Prisijungę', 'lt', 'online.php', 7, 'Y', 'N;', 0),
(10, 'Archyvas', 'lt', 'deze.php', 8, 'N', 'N;', 0),
(11, 'Asmeniniai pranešimai', 'lt', 'pm.php', 0, 'N', 'N;', 0),
(12, 'Profilis', 'lt', 'view_user.php', 9, 'N', 'N;', 0),
(13, 'Nariai', 'lt', 'nariai.php', 10, 'Y', 'N;', 0),
(14, 'Galerija', 'lt', 'galerija.php', 4, 'Y', 'N;', 0),
(15, 'Straipsniai', 'lt', 'straipsnis.php', 2, 'Y', 'N;', 0);

-- --------------------------------------------------------

--
-- Table structure for table `panel`
--

DROP TABLE IF EXISTS `panel`;
CREATE TABLE IF NOT EXISTS `panel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panel` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `file` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `place` int(11) DEFAULT NULL,
  `align` enum('R','L','C') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'C',
  `rodyti` varchar(4) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `show` enum('Y','N') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'Y',
  `teises` varchar(150) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'N;',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `panel`
--

INSERT INTO `panel` (`id`, `panel`, `lang`, `file`, `place`, `align`, `rodyti`, `show`, `teises`) VALUES
(1, 'Kas naujo?', 'lt', 'kas_naujo.php', 1, 'R', 'Taip', 'Y', 'N;'),
(2, 'Narys', 'lt', 'vartotojas.php', 2, 'R', 'Taip', 'Y', 'N;'),
(3, 'Rėksnių dėžė', 'lt', 'reksniu_deze.php', 3, 'R', 'Taip', 'Y', 'N;'),
(4, 'Kalendorius', 'lt', 'kalendorius.php', 4, 'L', 'Taip', 'Y', 'N;'),
(5, 'Meniu', 'lt', 'meniu.php', 5, 'L', 'Taip', 'Y', 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `poll_answers`
--

DROP TABLE IF EXISTS `poll_answers`;
CREATE TABLE IF NOT EXISTS `poll_answers` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `question_id` int(255) NOT NULL DEFAULT '0',
  `answer` text CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poll_questions`
--

DROP TABLE IF EXISTS `poll_questions`;
CREATE TABLE IF NOT EXISTS `poll_questions` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `question` text CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `radio` int(1) NOT NULL DEFAULT '0',
  `shown` int(1) NOT NULL DEFAULT '0',
  `only_guests` int(1) NOT NULL,
  `author_id` int(11) NOT NULL DEFAULT '1',
  `author_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'Admin',
  `lang` varchar(3) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poll_votes`
--

DROP TABLE IF EXISTS `poll_votes`;
CREATE TABLE IF NOT EXISTS `poll_votes` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `question_id` int(255) NOT NULL DEFAULT '0',
  `answer_id` int(255) NOT NULL DEFAULT '0',
  `lang` varchar(3) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `private_msg`
--

DROP TABLE IF EXISTS `private_msg`;
CREATE TABLE IF NOT EXISTS `private_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `to` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '...',
  `msg` text COLLATE utf8_lithuanian_ci,
  `read` set('YES','NO') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NO',
  `date` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating_id` varchar(80) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `rating_num` int(11) DEFAULT NULL,
  `IP` varchar(45) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `psl` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salis`
--

DROP TABLE IF EXISTS `salis`;
CREATE TABLE IF NOT EXISTS `salis` (
  `iso` char(2) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `printable_name` varchar(80) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `iso3` char(3) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`iso`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `salis`
--

INSERT INTO `salis` (`iso`, `name`, `printable_name`, `iso3`, `numcode`) VALUES
('LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
('RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
('US', 'UNITED STATES', 'United States', 'USA', 840);

-- --------------------------------------------------------

--
-- Table structure for table `siuntiniai`
--

DROP TABLE IF EXISTS `siuntiniai`;
CREATE TABLE IF NOT EXISTS `siuntiniai` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `paspaudimai` decimal(11,0) NOT NULL DEFAULT '0',
  `pavadinimas` char(100) COLLATE utf8_lithuanian_ci DEFAULT 'Be pavadinimo',
  `file` char(100) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'none.png',
  `foto` text COLLATE utf8_lithuanian_ci,
  `apie` longtext COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `autorius` int(6) NOT NULL DEFAULT '0',
  `data` int(10) DEFAULT NULL,
  `categorija` int(3) DEFAULT '1',
  `teises` varchar(2) COLLATE utf8_lithuanian_ci DEFAULT 'N;',
  `rodoma` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NE',
  PRIMARY KEY (`ID`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `straipsniai`
--

DROP TABLE IF EXISTS `straipsniai`;
CREATE TABLE IF NOT EXISTS `straipsniai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `pav` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `t_text` text COLLATE utf8_lithuanian_ci,
  `f_text` longtext COLLATE utf8_lithuanian_ci,
  `lang` varchar(3) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'lt' COMMENT 'Language',
  `date` int(11) DEFAULT NULL,
  `autorius` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `autorius_id` int(11) DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `kom` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'ne',
  `rodoma` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'NE',
  `kat` int(125) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `s_punktai`
--

DROP TABLE IF EXISTS `s_punktai`;
CREATE TABLE IF NOT EXISTS `s_punktai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pav` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `s_punktai`
--

INSERT INTO `s_punktai` (`id`, `pav`, `sid`) VALUES
(1, 'Atviras Kodas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `nick` varchar(15) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `levelis` int(2) NOT NULL DEFAULT '3',
  `pass` varchar(32) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `slaptas` char(32) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `icq` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `msn` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `skype` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `yahoo` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `aim` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `url` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `salis` varchar(3) COLLATE utf8_lithuanian_ci DEFAULT 'LT',
  `miestas` varchar(20) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `vardas` varchar(15) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `pavarde` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `gim_data` date DEFAULT NULL,
  `parasas` text COLLATE utf8_lithuanian_ci,
  `forum_temos` int(11) NOT NULL DEFAULT '0',
  `forum_atsakyta` int(11) NOT NULL DEFAULT '0',
  `taskai` decimal(11,0) NOT NULL DEFAULT '0',
  `balsai` int(11) NOT NULL DEFAULT '0',
  `balsavo` text COLLATE utf8_lithuanian_ci,
  `pm_viso` int(11) NOT NULL DEFAULT '50',
  `reg_data` int(10) DEFAULT NULL,
  `login_data` int(10) DEFAULT NULL,
  `login_before` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nick` (`nick`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip`, `nick`, `levelis`, `pass`, `email`, `slaptas`, `icq`, `msn`, `skype`, `yahoo`, `aim`, `url`, `salis`, `miestas`, `vardas`, `pavarde`, `gim_data`, `parasas`, `forum_temos`, `forum_atsakyta`, `taskai`, `balsai`, `balsavo`, `pm_viso`, `reg_data`, `login_data`, `login_before`) VALUES
(1, NULL, 'Admin', 1, '21232f297a57a5a743894a0e4a801fc3', 'info@localhost', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LT', NULL, NULL, NULL, NULL, 'Svetainės administratorius', 0, 0, '0', 0, NULL, 500, NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
