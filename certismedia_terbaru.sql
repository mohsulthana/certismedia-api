-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Mar 2021 pada 17.37
-- Versi server: 10.4.16-MariaDB
-- Versi PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `certismedia`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `campaign`
--

CREATE TABLE `campaign` (
  `campaign_id` int(11) NOT NULL,
  `campaign_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `click`
--

CREATE TABLE `click` (
  `id` int(11) NOT NULL,
  `line_name` varchar(255) NOT NULL,
  `creative_name` varchar(255) NOT NULL,
  `creative_size` varchar(255) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `exchange_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `click` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `completed`
--

CREATE TABLE `completed` (
  `id` int(11) NOT NULL,
  `line_name` varchar(255) NOT NULL,
  `creative_name` varchar(255) NOT NULL,
  `creative_size` varchar(255) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `exchange_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `completed_view` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `conversion`
--

CREATE TABLE `conversion` (
  `id` int(11) NOT NULL,
  `line_name` varchar(255) NOT NULL,
  `creative_name` varchar(255) NOT NULL,
  `creative_size` varchar(255) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `exchange_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `conversions` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dashboard`
--

CREATE TABLE `dashboard` (
  `id` int(11) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `impression` int(11) NOT NULL,
  `click` int(11) NOT NULL,
  `ctr` float NOT NULL,
  `win_rate` float NOT NULL,
  `time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `firstquartile`
--

CREATE TABLE `firstquartile` (
  `id` int(11) NOT NULL,
  `line_name` varchar(255) NOT NULL,
  `creative_name` varchar(255) NOT NULL,
  `creative_size` varchar(255) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `exchange_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `first_quartile_view` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `impression`
--

CREATE TABLE `impression` (
  `id` int(11) NOT NULL,
  `line_name` varchar(255) NOT NULL,
  `creative_name` varchar(255) NOT NULL,
  `creative_size` varchar(255) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `exchange_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `impression` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `midpoint`
--

CREATE TABLE `midpoint` (
  `id` int(11) NOT NULL,
  `line_name` varchar(255) NOT NULL,
  `creative_name` varchar(255) NOT NULL,
  `creative_size` varchar(255) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `exchange_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `mid_point_view` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `creative_id` int(11) NOT NULL,
  `creative_name` varchar(255) NOT NULL,
  `creative_size` varchar(255) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `exchange_name` varchar(255) NOT NULL,
  `impression` float NOT NULL,
  `click` float NOT NULL,
  `win_rate` float NOT NULL,
  `ctr` float NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `report`
--

INSERT INTO `report` (`id`, `email`, `campaign_id`, `creative_id`, `creative_name`, `creative_size`, `inventory_id`, `inventory_name`, `exchange_name`, `impression`, `click`, `win_rate`, `ctr`, `time`) VALUES
(87, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 939594233, 'zougla.gr Orange S.A. - AdX EMEA', 'Doubleclick', 0, 0, 0, 0, 20210315),
(88, '', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210315),
(89, '', 28307, 1236289, 'Limassol Pharmacy Sambucol February Display', 'xlarge', 5415552, 'youweekly.gr GDN', 'Doubleclick', 2, 0, 0, 0, 20210320),
(90, '', 28910, 1304405, 'EUC live 10/3/21 Publishers', 'xlarge', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210317),
(91, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210315),
(92, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 1, 0, 33.3333, 0, 20210316),
(93, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 399876807, 'zougla.gr GDN', 'Doubleclick', 29, 0, 74.359, 0, 20210315),
(94, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210316),
(95, '', 28910, 1306878, 'EUC live 10/3/21 Publishers', 'xlarge', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210315),
(96, '', 28881, 1310488, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210320),
(97, '', 28307, 1236290, 'Limassol Pharmacy Sambucol February Display', 'mpu', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210314),
(98, '', 28111, 1216725, 'Podia - Jan 21 - Brand', 'interstitial', 5478727, 'olagiatingunaika.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210319),
(99, '', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210315),
(100, '', 28307, 1236296, 'Limassol Pharmacy Valentines February Display', 'xlarge', 773552, 'bbcgoodfood.com Immediate Media - AdX EMEA', 'Doubleclick', 1, 0, 0, 0, 20210315),
(101, '', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210315),
(102, '', 28307, 1238659, 'Limassol Pharmacy Product Offers February Display', 'mpu', 1734941622, 'parents.org.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210318),
(103, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 628126, 'protothema.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210314),
(104, '', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 628126, 'protothema.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210314),
(105, '', 28307, 1238657, 'Limassol Pharmacy Product Offers February Display', 'interstitial', 1693277470, 'gossip-tv.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210317),
(106, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210315),
(107, '', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210317),
(108, '', 28918, 1306868, 'Eureka Massalias Secrets Black', 'interstitial', 937591, 'hellomagazine.com hola.com', 'Doubleclick', 1, 0, 0, 0, 20210316),
(109, '', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 1335562594, 'dikaiologitika.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210316),
(110, '', 28910, 1304405, 'EUC live 10/3/21 Publishers', 'xlarge', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210315),
(111, '', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210316),
(112, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 20210320),
(113, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210317),
(114, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210314),
(115, '', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 7568100, 'tlife.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210314),
(116, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210319),
(117, '', 28910, 1306878, 'EUC live 10/3/21 Publishers', 'xlarge', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210317),
(118, '', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210320),
(119, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210314),
(120, '', 28307, 1261530, 'Limassol Pharmacy General ads to replace Valentine\'s February Display', 'xlarge', 773552, 'bbcgoodfood.com Immediate Media - AdX EMEA', 'Doubleclick', 1, 0, 0, 0, 20210319),
(121, '', 28881, 1310488, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210316),
(122, '', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 2147091089, 'ethnos.gr', 'OpenX', 0, 1, 0, 0, 20210318),
(123, '', 28307, 1236465, 'Limassol Pharmacy Pupa February Native', 'native', 1840726908, 'infowoman.gr Orange S.A. - AdX EMEA', 'Doubleclick', 1, 0, 0, 0, 20210317),
(124, '', 28307, 1238660, 'Limassol Pharmacy Product Offers February Display', 'xlarge', 1911682292, 'meygeia.gr null', 'Doubleclick', 1, 0, 0, 0, 20210315),
(125, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 628126, 'protothema.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210315),
(126, '', 28910, 1304402, 'EUC live 10/3/21 Publishers', 'mpu', 1707714272, 'dailymotion.com null', 'Doubleclick', 4, 0, 0, 0, 20210317),
(127, '', 28307, 1261530, 'Limassol Pharmacy General ads to replace Valentine\'s February Display', 'xlarge', 773552, 'bbcgoodfood.com Immediate Media - AdX EMEA', 'Doubleclick', 1, 0, 0, 0, 20210320),
(128, '', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210315),
(129, '', 28918, 1306868, 'Eureka Massalias Secrets Black', 'interstitial', 937591, 'hellomagazine.com hola.com', 'Doubleclick', 1, 0, 0, 0, 20210315),
(130, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 20210316),
(131, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 939594233, 'zougla.gr Orange S.A. - AdX EMEA', 'Doubleclick', 0, 0, 0, 0, 20210316),
(132, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 7568100, 'tlife.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210317),
(133, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 7568100, 'tlife.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210318),
(134, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210316),
(135, '', 28111, 1216725, 'Podia - Jan 21 - Brand', 'interstitial', 5478727, 'olagiatingunaika.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210316),
(136, '', 28307, 1236283, 'Limassol Pharmacy Pupa February Display', 'mpu', 2147483647, 'idiva.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210314),
(137, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210321),
(138, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210315),
(139, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 399876807, 'zougla.gr GDN', 'Doubleclick', 4, 0, 44.4444, 0, 20210316),
(140, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 939594233, 'zougla.gr Orange S.A. - AdX EMEA', 'Doubleclick', 0, 0, 0, 0, 20210314),
(141, '', 28307, 1238689, 'Limassol Pharmacy Product Offers February Native', 'native', 5478727, 'olagiatingunaika.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210316),
(142, '', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210321),
(143, '', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 628126, 'protothema.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210314),
(144, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 20210318),
(145, '', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 628126, 'protothema.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210315),
(146, '', 28307, 1238659, 'Limassol Pharmacy Product Offers February Display', 'mpu', 1734941622, 'parents.org.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210319),
(147, '', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 33.3333, 0, 20210315),
(148, '', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210320),
(149, '', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210316),
(150, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 628126, 'protothema.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210315),
(151, '', 28307, 1238659, 'Limassol Pharmacy Product Offers February Display', 'mpu', 1734941622, 'parents.org.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210315),
(152, '', 28111, 1216725, 'Podia - Jan 21 - Brand', 'interstitial', 5478727, 'olagiatingunaika.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210314),
(153, '', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210314),
(154, '', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210314),
(155, '', 28881, 1310488, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 3, 1, 100, 0.333333, 20210315),
(156, '', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 7568100, 'tlife.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210315),
(157, '', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210314),
(158, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 20210314),
(159, '', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210321),
(160, '', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 7568100, 'tlife.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210315),
(161, '', 28918, 1306872, 'Eureka Massalias Secrets Black', 'xlarge', 2147483647, 'argiro.gr WayToGrow - AdX EMEA', 'Doubleclick', 1, 0, 0, 0, 20210318),
(162, '', 28307, 1236290, 'Limassol Pharmacy Sambucol February Display', 'mpu', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210321),
(163, '', 28307, 1236521, 'Limassol Pharmacy Valentines February Display', 'xlarge', 1433449, 'dinfo.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210317),
(164, '', 28918, 1306871, 'Eureka Massalias Secrets Black', 'mpu', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 20210317),
(165, '', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 0, 0, 0, 0, 20210316);

-- --------------------------------------------------------

--
-- Struktur dari tabel `thirdquartile`
--

CREATE TABLE `thirdquartile` (
  `id` int(11) NOT NULL,
  `line_name` varchar(255) NOT NULL,
  `creative_name` varchar(255) NOT NULL,
  `creative_size` varchar(255) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `exchange_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `third_quartile_view` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active | 0=Inactive '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `phone`, `created`, `modified`, `status`) VALUES
(1, 'admin', 'admin', 'cm1056@certismedia.com', 'hJm45?dFe', '1111', '2021-03-10 22:51:29', '2021-03-24 22:51:29', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `view`
--

CREATE TABLE `view` (
  `id` int(11) NOT NULL,
  `line_name` varchar(255) NOT NULL,
  `creative_name` varchar(255) NOT NULL,
  `creative_size` varchar(255) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `exchange_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `view` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`campaign_id`);

--
-- Indeks untuk tabel `click`
--
ALTER TABLE `click`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `completed`
--
ALTER TABLE `completed`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `conversion`
--
ALTER TABLE `conversion`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dashboard`
--
ALTER TABLE `dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `firstquartile`
--
ALTER TABLE `firstquartile`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `impression`
--
ALTER TABLE `impression`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `midpoint`
--
ALTER TABLE `midpoint`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `thirdquartile`
--
ALTER TABLE `thirdquartile`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `view`
--
ALTER TABLE `view`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `click`
--
ALTER TABLE `click`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `completed`
--
ALTER TABLE `completed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `conversion`
--
ALTER TABLE `conversion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dashboard`
--
ALTER TABLE `dashboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `firstquartile`
--
ALTER TABLE `firstquartile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `impression`
--
ALTER TABLE `impression`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `midpoint`
--
ALTER TABLE `midpoint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT untuk tabel `thirdquartile`
--
ALTER TABLE `thirdquartile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `view`
--
ALTER TABLE `view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
