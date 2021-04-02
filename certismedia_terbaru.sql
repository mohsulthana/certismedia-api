-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Apr 2021 pada 05.14
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
-- Struktur dari tabel `daily_delivery`
--

CREATE TABLE `daily_delivery` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `impression` int(11) NOT NULL,
  `click` int(11) NOT NULL,
  `ctr` float NOT NULL,
  `win_rate` float NOT NULL,
  `view` int(11) NOT NULL,
  `completed_view` int(11) NOT NULL,
  `time` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `daily_delivery`
--

INSERT INTO `daily_delivery` (`id`, `campaign_id`, `impression`, `click`, `ctr`, `win_rate`, `view`, `completed_view`, `time`) VALUES
(1, 28881, 3, 3, 1, 7.14286, 0, 0, '20210329'),
(2, 28881, 8, 3, 0.375, 24.2424, 0, 0, '20210323'),
(3, 28918, 1, 0, 0, 0, 0, 0, '20210322'),
(4, 28881, 1, 2, 2, 3.33333, 0, 0, '20210328'),
(5, 28910, 1, 0, 0, 0, 0, 0, '20210328'),
(6, 28910, 2, 0, 0, 0, 0, 0, '20210324'),
(7, 28881, 33, 3, 0.0909091, 42.8571, 0, 0, '20210325'),
(8, 28918, 1, 0, 0, 0, 0, 0, '20210326'),
(9, 28881, 3, 0, 0, 25, 0, 0, '20210326'),
(10, 28881, 15, 2, 0.133333, 26.3158, 0, 0, '20210322'),
(11, 28910, 2, 0, 0, 0, 0, 0, '20210325'),
(12, 28881, 0, 0, 0, 0, 0, 0, '20210327'),
(13, 28881, 21, 3, 0.142857, 53.8462, 0, 0, '20210324'),
(14, 28910, 1, 0, 0, 0, 0, 0, '20210326'),
(15, 28910, 1, 0, 0, 0, 0, 0, '20210329'),
(16, 28910, 1, 0, 0, 0, 0, 0, '20210326'),
(17, 28881, 5, 4, 0.8, 7.93651, 0, 0, '20210329'),
(18, 28881, 0, 0, 0, 0, 0, 0, '20210327'),
(19, 28910, 1, 0, 0, 0, 0, 0, '20210328'),
(20, 28910, 2, 0, 0, 0, 0, 0, '20210329'),
(21, 28918, 1, 0, 0, 0, 0, 0, '20210326'),
(22, 28910, 2, 0, 0, 0, 0, 0, '20210325'),
(23, 28881, 1, 2, 2, 3.33333, 0, 0, '20210328'),
(24, 28881, 3, 0, 0, 25, 0, 0, '20210326'),
(25, 28918, 2, 0, 0, 0, 0, 0, '20210331'),
(26, 28881, 10, 3, 0.3, 15.1515, 0, 0, '20210330'),
(27, 28881, 33, 3, 0.0909091, 42.8571, 0, 0, '20210325'),
(28, 28881, 5, 4, 0.8, 7.93651, 0, 0, '20210329'),
(29, 28881, 1, 2, 2, 3.33333, 0, 0, '20210328'),
(30, 28910, 1, 0, 0, 0, 0, 0, '20210328'),
(31, 28918, 2, 0, 0, 0, 0, 0, '20210331'),
(32, 28918, 1, 0, 0, 0, 0, 0, '20210326'),
(33, 28881, 3, 0, 0, 25, 0, 0, '20210326'),
(34, 28910, 1, 0, 0, 0, 0, 0, '20210326'),
(35, 28881, 10, 3, 0.3, 15.1515, 0, 0, '20210330'),
(36, 28881, 0, 0, 0, 0, 0, 0, '20210327'),
(37, 28881, 33, 3, 0.0909091, 42.8571, 0, 0, '20210325'),
(38, 28910, 2, 0, 0, 0, 0, 0, '20210329'),
(39, 28910, 2, 0, 0, 0, 0, 0, '20210325'),
(40, 28881, 5, 4, 0.8, 7.93651, 0, 0, '20210329'),
(41, 28918, 1, 0, 0, 0, 0, 0, '20210326'),
(42, 28910, 1, 0, 0, 0, 0, 0, '20210328'),
(43, 28910, 1, 0, 0, 0, 0, 0, '20210326'),
(44, 28881, 1, 2, 2, 3.33333, 0, 0, '20210328'),
(45, 28881, 0, 0, 0, 0, 0, 0, '20210327'),
(46, 28918, 2, 0, 0, 0, 0, 0, '20210331'),
(47, 28910, 2, 0, 0, 0, 0, 0, '20210329'),
(48, 28881, 3, 0, 0, 25, 0, 0, '20210326'),
(49, 28910, 2, 0, 0, 0, 0, 0, '20210325'),
(50, 28881, 10, 3, 0.3, 15.1515, 0, 0, '20210330'),
(51, 28881, 33, 3, 0.0909091, 42.8571, 0, 0, '20210325'),
(52, 28881, 5, 4, 0.8, 7.93651, 0, 0, '20210329'),
(53, 28910, 2, 0, 0, 0, 0, 0, '20210329'),
(54, 28910, 1, 0, 0, 0, 0, 0, '20210328'),
(55, 28910, 1, 0, 0, 0, 0, 0, '20210326'),
(56, 28918, 1, 0, 0, 0, 0, 0, '20210326'),
(57, 28881, 0, 0, 0, 0, 0, 0, '20210327'),
(58, 28881, 1, 2, 2, 3.33333, 0, 0, '20210328'),
(59, 28910, 2, 0, 0, 0, 0, 0, '20210325'),
(60, 28918, 2, 0, 0, 0, 0, 0, '20210331'),
(61, 28881, 33, 3, 0.0909091, 42.8571, 0, 0, '20210325'),
(62, 28881, 10, 3, 0.3, 15.1515, 0, 0, '20210330'),
(63, 28881, 3, 0, 0, 25, 0, 0, '20210326');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dashboard`
--

CREATE TABLE `dashboard` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `impression` int(11) NOT NULL,
  `click` int(11) NOT NULL,
  `ctr` float NOT NULL,
  `win_rate` float NOT NULL,
  `view` int(11) NOT NULL,
  `completed_view` int(11) NOT NULL,
  `time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dashboard`
--

INSERT INTO `dashboard` (`id`, `email`, `campaign_name`, `campaign_id`, `impression`, `click`, `ctr`, `win_rate`, `view`, `completed_view`, `time`) VALUES
(1, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032204'),
(2, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 3, 0, 0, 100, 0, 0, '2021032200'),
(3, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 5, 0, 0, 83.3333, 0, 0, '2021032206'),
(4, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032205'),
(5, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 66.6667, 0, 0, '2021032300'),
(6, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032217'),
(7, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032403'),
(8, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021032222'),
(9, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032413'),
(10, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032303'),
(11, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 66.6667, 0, 0, '2021032417'),
(12, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021032321'),
(13, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 100, 0, 0, '2021032422'),
(14, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021032400'),
(15, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032422'),
(16, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032414'),
(17, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 12, 0, 0, 44.4444, 0, 0, '2021032509'),
(18, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032418'),
(19, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032805'),
(20, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 7, 0, 0, 58.3333, 0, 0, '2021032423'),
(21, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032818'),
(22, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 50, 0, 0, '2021032512'),
(23, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032900'),
(24, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 66.6667, 0, 0, '2021032518'),
(25, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032903'),
(26, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032521'),
(27, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032304'),
(28, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032610'),
(29, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032312'),
(30, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032709'),
(31, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032313'),
(32, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032901'),
(33, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 0, 0, 0, '2021032316'),
(34, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032906'),
(35, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032412'),
(36, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032203'),
(37, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032502'),
(38, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032210'),
(39, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032506'),
(40, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 3, 1, 0.333333, 50, 0, 0, '2021032213'),
(41, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032511'),
(42, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032308'),
(43, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032612'),
(44, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 40, 0, 0, '2021032500'),
(45, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032714'),
(46, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032507'),
(47, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032807'),
(48, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032515'),
(49, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032902'),
(50, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 2, 2, 33.3333, 0, 0, '2021032523'),
(51, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032905'),
(52, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032602'),
(53, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032201'),
(54, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 6.66667, 0, 0, '2021032800'),
(55, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032202'),
(56, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032804'),
(57, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032207'),
(58, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032816'),
(59, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032208'),
(60, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032904'),
(61, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032212'),
(62, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032908'),
(63, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021032306'),
(64, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032209'),
(65, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032322'),
(66, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032215'),
(67, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032406'),
(68, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032503'),
(69, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 66.6667, 0, 0, '2021032416'),
(70, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 50, 0, 0, '2021032508'),
(71, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032600'),
(72, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032513'),
(73, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032603'),
(74, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 50, 0, 0, '2021032514'),
(75, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021032613'),
(76, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032514'),
(77, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032619'),
(78, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032700'),
(79, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032701'),
(80, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021032910'),
(81, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032803'),
(82, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032912'),
(83, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 0, 0, 0, '2021032912'),
(84, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 12, 0, 0, 44.4444, 0, 0, '2021032509'),
(85, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032502'),
(86, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032805'),
(87, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032506'),
(88, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032818'),
(89, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032511'),
(90, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032900'),
(91, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032612'),
(92, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032903'),
(93, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032714'),
(94, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032915'),
(95, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032807'),
(96, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032915'),
(97, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032902'),
(98, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032921'),
(99, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032905'),
(100, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033009'),
(101, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032914'),
(102, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033010'),
(103, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032922'),
(104, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 33.3333, 0, 0, '2021033011'),
(105, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033020'),
(106, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 0, 0, 0, '2021033013'),
(107, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 40, 0, 0, '2021032500'),
(108, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033015'),
(109, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032507'),
(110, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033018'),
(111, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032515'),
(112, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 50, 0, 0, '2021032512'),
(113, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 2, 2, 33.3333, 0, 0, '2021032523'),
(114, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 66.6667, 0, 0, '2021032518'),
(115, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032602'),
(116, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032521'),
(117, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 6.66667, 0, 0, '2021032800'),
(118, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032610'),
(119, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032804'),
(120, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032709'),
(121, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032816'),
(122, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032901'),
(123, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032904'),
(124, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032906'),
(125, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032908'),
(126, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033000'),
(127, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 0, 0, 0, '2021032916'),
(128, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033004'),
(129, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032918'),
(130, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033021'),
(131, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032923'),
(132, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033022'),
(133, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033003'),
(134, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032600'),
(135, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033014'),
(136, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032603'),
(137, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021033019'),
(138, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021032613'),
(139, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033108'),
(140, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032619'),
(141, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033111'),
(142, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032701'),
(143, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032503'),
(144, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032803'),
(145, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 50, 0, 0, '2021032508'),
(146, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 0, 0, 0, '2021032912'),
(147, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032513'),
(148, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032912'),
(149, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 50, 0, 0, '2021032514'),
(150, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021033016'),
(151, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032514'),
(152, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032700'),
(153, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021032910'),
(154, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033023'),
(155, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 12, 0, 0, 44.4444, 0, 0, '2021032509'),
(156, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032600'),
(157, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032805'),
(158, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032603'),
(159, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032818'),
(160, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021032613'),
(161, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032900'),
(162, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032619'),
(163, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032903'),
(164, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032701'),
(165, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032915'),
(166, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032803'),
(167, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032915'),
(168, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 0, 0, 0, '2021032912'),
(169, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032921'),
(170, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032912'),
(171, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033009'),
(172, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021033016'),
(173, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033010'),
(174, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032502'),
(175, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 33.3333, 0, 0, '2021033011'),
(176, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032506'),
(177, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 0, 0, 0, '2021033013'),
(178, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032511'),
(179, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033015'),
(180, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032612'),
(181, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033018'),
(182, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032714'),
(183, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 50, 0, 0, '2021032512'),
(184, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032807'),
(185, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 66.6667, 0, 0, '2021032518'),
(186, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032902'),
(187, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032521'),
(188, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032905'),
(189, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032610'),
(190, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032914'),
(191, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032709'),
(192, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032922'),
(193, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032901'),
(194, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033020'),
(195, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032906'),
(196, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032503'),
(197, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033000'),
(198, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 50, 0, 0, '2021032508'),
(199, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033004'),
(200, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032513'),
(201, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033021'),
(202, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 50, 0, 0, '2021032514'),
(203, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033022'),
(204, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032514'),
(205, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 40, 0, 0, '2021032500'),
(206, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032700'),
(207, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032507'),
(208, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021032910'),
(209, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032515'),
(210, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033023'),
(211, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 2, 2, 33.3333, 0, 0, '2021032523'),
(212, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032602'),
(213, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 6.66667, 0, 0, '2021032800'),
(214, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032804'),
(215, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032816'),
(216, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032904'),
(217, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032908'),
(218, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 0, 0, 0, '2021032916'),
(219, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032918'),
(220, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032923'),
(221, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033003'),
(222, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033014'),
(223, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021033019'),
(224, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033108'),
(225, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033111'),
(226, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 12, 0, 0, 44.4444, 0, 0, '2021032509'),
(227, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032502'),
(228, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032805'),
(229, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032506'),
(230, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032818'),
(231, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032511'),
(232, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032900'),
(233, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032612'),
(234, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032903'),
(235, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032714'),
(236, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032915'),
(237, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032807'),
(238, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032915'),
(239, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032902'),
(240, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032921'),
(241, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032905'),
(242, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033009'),
(243, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032914'),
(244, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033010'),
(245, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032922'),
(246, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 33.3333, 0, 0, '2021033011'),
(247, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033020'),
(248, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 0, 0, 0, '2021033013'),
(249, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 40, 0, 0, '2021032500'),
(250, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033015'),
(251, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032507'),
(252, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033018'),
(253, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032515'),
(254, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 50, 0, 0, '2021032512'),
(255, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 2, 2, 33.3333, 0, 0, '2021032523'),
(256, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 66.6667, 0, 0, '2021032518'),
(257, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032602'),
(258, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032521'),
(259, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 6.66667, 0, 0, '2021032800'),
(260, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032610'),
(261, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032804'),
(262, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032709'),
(263, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032816'),
(264, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032901'),
(265, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032904'),
(266, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032906'),
(267, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032908'),
(268, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033000'),
(269, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 0, 0, 0, '2021032916'),
(270, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033004'),
(271, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032918'),
(272, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033021'),
(273, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032923'),
(274, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033022'),
(275, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033003'),
(276, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032600'),
(277, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033014'),
(278, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032603'),
(279, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021033019'),
(280, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021032613'),
(281, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033108'),
(282, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032619'),
(283, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033111'),
(284, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032701'),
(285, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032503'),
(286, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032803'),
(287, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 50, 0, 0, '2021032508'),
(288, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 0, 0, 0, '2021032912'),
(289, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032513'),
(290, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032912'),
(291, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 50, 0, 0, '2021032514'),
(292, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021033016'),
(293, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032514'),
(294, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032700'),
(295, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021032910'),
(296, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033023'),
(297, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032600'),
(298, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 12, 0, 0, 44.4444, 0, 0, '2021032509'),
(299, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032603'),
(300, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032805'),
(301, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021032613'),
(302, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032818'),
(303, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032619'),
(304, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032900'),
(305, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032701'),
(306, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032903'),
(307, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032803'),
(308, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032915'),
(309, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 0, 0, 0, '2021032912'),
(310, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032915'),
(311, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032912'),
(312, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032921'),
(313, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021033016'),
(314, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033009'),
(315, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032502'),
(316, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033010'),
(317, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032506'),
(318, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 33.3333, 0, 0, '2021033011'),
(319, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032511'),
(320, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 0, 0, 0, '2021033013'),
(321, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032612'),
(322, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033015'),
(323, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032714'),
(324, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033018'),
(325, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032807'),
(326, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 50, 0, 0, '2021032512'),
(327, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032902'),
(328, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 66.6667, 0, 0, '2021032518'),
(329, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032905'),
(330, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032521'),
(331, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032914'),
(332, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032610'),
(333, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032922'),
(334, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032709'),
(335, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033020'),
(336, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032901'),
(337, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032503'),
(338, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032906'),
(339, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 50, 0, 0, '2021032508'),
(340, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033000'),
(341, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032513'),
(342, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033004'),
(343, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 50, 0, 0, '2021032514'),
(344, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033021'),
(345, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032514'),
(346, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033022'),
(347, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032700'),
(348, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 40, 0, 0, '2021032500'),
(349, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021032910'),
(350, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032507'),
(351, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033023'),
(352, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032515'),
(353, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 2, 2, 33.3333, 0, 0, '2021032523'),
(354, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032602'),
(355, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 6.66667, 0, 0, '2021032800'),
(356, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032804'),
(357, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032816'),
(358, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032904'),
(359, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032908'),
(360, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 0, 0, 0, '2021032916'),
(361, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032918'),
(362, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032923'),
(363, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033003'),
(364, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033014'),
(365, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021033019'),
(366, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033108'),
(367, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033111'),
(368, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 12, 0, 0, 44.4444, 0, 0, '2021032509'),
(369, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032503'),
(370, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032805'),
(371, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 50, 0, 0, '2021032508'),
(372, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032818'),
(373, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032513'),
(374, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032900'),
(375, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 50, 0, 0, '2021032514'),
(376, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032903'),
(377, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032514'),
(378, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032915'),
(379, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032700'),
(380, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032915'),
(381, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021032910'),
(382, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032921'),
(383, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033023'),
(384, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033009'),
(385, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032502'),
(386, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033010'),
(387, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032506'),
(388, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 33.3333, 0, 0, '2021033011'),
(389, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032511'),
(390, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 0, 0, 0, '2021033013'),
(391, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032612'),
(392, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033015'),
(393, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032714'),
(394, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033018'),
(395, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032807'),
(396, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 50, 0, 0, '2021032512'),
(397, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032902'),
(398, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 66.6667, 0, 0, '2021032518'),
(399, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032905'),
(400, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032521'),
(401, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032914'),
(402, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032610'),
(403, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032922'),
(404, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032709'),
(405, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033020'),
(406, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032901'),
(407, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032600'),
(408, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032906'),
(409, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032603'),
(410, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033000'),
(411, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021032613'),
(412, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033004'),
(413, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032619'),
(414, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033021'),
(415, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032701'),
(416, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033022'),
(417, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032803'),
(418, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 40, 0, 0, '2021032500'),
(419, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 0, 0, 0, '2021032912'),
(420, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032507'),
(421, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032912'),
(422, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032515'),
(423, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021033016'),
(424, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 2, 2, 33.3333, 0, 0, '2021032523'),
(425, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032602'),
(426, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 6.66667, 0, 0, '2021032800'),
(427, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032804'),
(428, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032816'),
(429, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032904'),
(430, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032908'),
(431, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 0, 0, 0, '2021032916'),
(432, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032918'),
(433, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032923'),
(434, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033003'),
(435, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033014'),
(436, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021033019'),
(437, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033108'),
(438, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033111'),
(439, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 12, 0, 0, 44.4444, 0, 0, '2021032509'),
(440, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 50, 0, 0, '2021032512'),
(441, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032805'),
(442, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 66.6667, 0, 0, '2021032518'),
(443, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032818'),
(444, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032521'),
(445, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032900'),
(446, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032610'),
(447, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032903'),
(448, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032709'),
(449, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032915'),
(450, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032901'),
(451, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032915'),
(452, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032906'),
(453, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032921'),
(454, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033000'),
(455, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033009'),
(456, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033004'),
(457, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033010'),
(458, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033021'),
(459, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 33.3333, 0, 0, '2021033011'),
(460, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033022'),
(461, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 1, 0.5, 0, 0, 0, '2021033013'),
(462, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032502'),
(463, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033015'),
(464, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032506'),
(465, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033018'),
(466, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032511'),
(467, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 40, 0, 0, '2021032500'),
(468, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032612'),
(469, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032507'),
(470, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032714'),
(471, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032515'),
(472, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032807'),
(473, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 2, 2, 33.3333, 0, 0, '2021032523'),
(474, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032902'),
(475, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032602'),
(476, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032905'),
(477, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 6.66667, 0, 0, '2021032800'),
(478, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032914'),
(479, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032804');
INSERT INTO `dashboard` (`id`, `email`, `campaign_name`, `campaign_id`, `impression`, `click`, `ctr`, `win_rate`, `view`, `completed_view`, `time`) VALUES
(480, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032922'),
(481, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032816'),
(482, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021033020'),
(483, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032904'),
(484, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032600'),
(485, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021032908'),
(486, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 33.3333, 0, 0, '2021032603'),
(487, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 0, 0, 0, '2021032916'),
(488, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021032613'),
(489, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032918'),
(490, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032619'),
(491, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032923'),
(492, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032701'),
(493, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033003'),
(494, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032803'),
(495, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021033014'),
(496, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 1, 1, 0, 0, 0, '2021032912'),
(497, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021033019'),
(498, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032912'),
(499, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033108'),
(500, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 1, 0, 0, 0, 0, '2021033016'),
(501, 'cm1056@certismedia.com', 'Eureka Massalias Secrets Black', 28918, 1, 0, 0, 0, 0, 0, '2021033111'),
(502, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 0, 0, 0, '2021032503'),
(503, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 6, 0, 0, 50, 0, 0, '2021032508'),
(504, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032513'),
(505, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 50, 0, 0, '2021032514'),
(506, 'cm1056@certismedia.com', 'EUC Live Presentation 10/3/21', 28910, 1, 0, 0, 0, 0, 0, '2021032514'),
(507, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 0, 0, 0, 0, 0, 0, '2021032700'),
(508, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 2, 0, 0, 66.6667, 0, 0, '2021032910'),
(509, 'cm1056@certismedia.com', 'Attica Bank-Consumer Interest', 28881, 1, 0, 0, 16.6667, 0, 0, '2021033023');

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
  `view` int(11) NOT NULL,
  `completed_view` int(11) NOT NULL,
  `click` float NOT NULL,
  `win_rate` float NOT NULL,
  `ctr` float NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `report`
--

INSERT INTO `report` (`id`, `email`, `campaign_id`, `creative_id`, `creative_name`, `creative_size`, `inventory_id`, `inventory_name`, `exchange_name`, `impression`, `view`, `completed_view`, `click`, `win_rate`, `ctr`, `time`) VALUES
(1, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210324),
(2, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(3, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210322),
(4, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 1, 0, 0, 0, 16.6667, 0, 20210324),
(5, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(6, 'cm1056@certismedia.com', 28881, 1310488, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210324),
(7, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(8, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210322),
(9, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(10, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(11, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(12, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(13, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210326),
(14, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210323),
(15, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(16, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(17, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210322),
(18, 'cm1056@certismedia.com', 28910, 1306877, 'EUC live 10/3/21 Publishers', 'xlarge', 1873853357, 'gavros.gr', 'PubMatic', 2, 0, 0, 0, 0, 0, 20210325),
(19, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(20, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(21, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210324),
(22, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(23, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210322),
(24, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(25, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(26, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(27, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(28, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210323),
(29, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(30, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(31, 'cm1056@certismedia.com', 28910, 1304405, 'EUC live 10/3/21 Publishers', 'xlarge', 1803207750, 'genius.com', 'PubMatic', 1, 0, 0, 0, 0, 0, 20210329),
(32, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(33, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210323),
(34, 'cm1056@certismedia.com', 28910, 1304402, 'EUC live 10/3/21 Publishers', 'mpu', 1920939804, 'justjared.com', 'PubMatic', 2, 0, 0, 0, 0, 0, 20210324),
(35, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210324),
(36, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210322),
(37, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 2147483647, 'in.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210324),
(38, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210322),
(39, 'cm1056@certismedia.com', 28918, 1306868, 'Eureka Massalias Secrets Black', 'interstitial', 937591, 'hellomagazine.com hola.com', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210322),
(40, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(41, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(42, 'cm1056@certismedia.com', 28881, 1301469, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(43, 'cm1056@certismedia.com', 28881, 1301469, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210323),
(44, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(45, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210323),
(46, 'cm1056@certismedia.com', 28881, 1310488, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(47, 'cm1056@certismedia.com', 28881, 1301477, 'Attica Bank - Consumer Interest - RTG', 'mpu', 399876807, 'zougla.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(48, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(49, 'cm1056@certismedia.com', 28881, 1301478, 'Attica Bank - Consumer Interest - RTG', 'xlarge', 5415552, 'youweekly.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(50, 'cm1056@certismedia.com', 28918, 1306872, 'Eureka Massalias Secrets Black', 'xlarge', 2147483647, 'argiro.gr WayToGrow - AdX EMEA', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(51, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210322),
(52, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 3, 0, 0, 0, 100, 0, 20210323),
(53, 'cm1056@certismedia.com', 28910, 1304403, 'EUC live 10/3/21 Publishers', 'leaderboard', 1876190373, 'gavros.gr null', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210328),
(54, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(55, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(56, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(57, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5510612, 'alfavita.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210322),
(58, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(59, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5510612, 'alfavita.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210324),
(60, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210323),
(61, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210322),
(62, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210325),
(63, 'cm1056@certismedia.com', 28881, 1301469, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210322),
(64, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 2147483647, 'ethnos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(65, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(66, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210323),
(67, 'cm1056@certismedia.com', 28910, 1306878, 'EUC live 10/3/21 Publishers', 'xlarge', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(68, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(69, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(70, 'cm1056@certismedia.com', 28910, 1306878, 'EUC live 10/3/21 Publishers', 'xlarge', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(71, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(72, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(73, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(74, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(75, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(76, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(77, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(78, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(79, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210326),
(80, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(81, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(82, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210330),
(83, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(84, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210325),
(85, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(86, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(87, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(88, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(89, 'cm1056@certismedia.com', 28910, 1304405, 'EUC live 10/3/21 Publishers', 'xlarge', 1803207750, 'genius.com', 'PubMatic', 1, 0, 0, 0, 0, 0, 20210329),
(90, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 2147483647, 'ethnos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(91, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(92, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(93, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(94, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(95, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(96, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(97, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1335562594, 'dikaiologitika.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210330),
(98, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(99, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(100, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(101, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(102, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(103, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(104, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(105, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(106, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(107, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(108, 'cm1056@certismedia.com', 28910, 1306876, 'EUC live 10/3/21 Publishers', 'interstitial', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(109, 'cm1056@certismedia.com', 28881, 1301477, 'Attica Bank - Consumer Interest - RTG', 'mpu', 399876807, 'zougla.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(110, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 1335562594, 'dikaiologitika.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(111, 'cm1056@certismedia.com', 28881, 1301478, 'Attica Bank - Consumer Interest - RTG', 'xlarge', 5415552, 'youweekly.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(112, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(113, 'cm1056@certismedia.com', 28918, 1306871, 'Eureka Massalias Secrets Black', 'mpu', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210331),
(114, 'cm1056@certismedia.com', 28910, 1306877, 'EUC live 10/3/21 Publishers', 'xlarge', 1873853357, 'gavros.gr', 'PubMatic', 2, 0, 0, 0, 0, 0, 20210325),
(115, 'cm1056@certismedia.com', 28910, 1304403, 'EUC live 10/3/21 Publishers', 'leaderboard', 1876190373, 'gavros.gr null', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210328),
(116, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(117, 'cm1056@certismedia.com', 28918, 1306872, 'Eureka Massalias Secrets Black', 'xlarge', 2147483647, 'argiro.gr WayToGrow - AdX EMEA', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(118, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(119, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(120, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(121, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(122, 'cm1056@certismedia.com', 28918, 1306868, 'Eureka Massalias Secrets Black', 'interstitial', 937591, 'hellomagazine.com hola.com', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210331),
(123, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 2, 0, 0, 0, 0, 0, 20210330),
(124, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 245600700, 'athensvoice.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(125, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(126, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(127, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(128, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(129, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(130, 'cm1056@certismedia.com', 28881, 1301469, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(131, 'cm1056@certismedia.com', 28881, 1310488, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(132, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(133, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(134, 'cm1056@certismedia.com', 28910, 1304405, 'EUC live 10/3/21 Publishers', 'xlarge', 1803207750, 'genius.com', 'PubMatic', 1, 0, 0, 0, 0, 0, 20210329),
(135, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(136, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(137, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(138, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(139, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(140, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(141, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(142, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1335562594, 'dikaiologitika.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210330),
(143, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210326),
(144, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(145, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(146, 'cm1056@certismedia.com', 28918, 1306872, 'Eureka Massalias Secrets Black', 'xlarge', 2147483647, 'argiro.gr WayToGrow - AdX EMEA', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(147, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(148, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(149, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(150, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(151, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(152, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 2, 0, 0, 0, 0, 0, 20210330),
(153, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(154, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 245600700, 'athensvoice.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(155, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(156, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(157, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(158, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(159, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(160, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(161, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(162, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(163, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(164, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(165, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(166, 'cm1056@certismedia.com', 28881, 1301469, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(167, 'cm1056@certismedia.com', 28910, 1306876, 'EUC live 10/3/21 Publishers', 'interstitial', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(168, 'cm1056@certismedia.com', 28881, 1310488, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(169, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 1335562594, 'dikaiologitika.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(170, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(171, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(172, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(173, 'cm1056@certismedia.com', 28910, 1306877, 'EUC live 10/3/21 Publishers', 'xlarge', 1873853357, 'gavros.gr', 'PubMatic', 2, 0, 0, 0, 0, 0, 20210325),
(174, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(175, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(176, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(177, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(178, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(179, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(180, 'cm1056@certismedia.com', 28881, 1301477, 'Attica Bank - Consumer Interest - RTG', 'mpu', 399876807, 'zougla.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(181, 'cm1056@certismedia.com', 28918, 1306868, 'Eureka Massalias Secrets Black', 'interstitial', 937591, 'hellomagazine.com hola.com', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210331),
(182, 'cm1056@certismedia.com', 28881, 1301478, 'Attica Bank - Consumer Interest - RTG', 'xlarge', 5415552, 'youweekly.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(183, 'cm1056@certismedia.com', 28910, 1306878, 'EUC live 10/3/21 Publishers', 'xlarge', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(184, 'cm1056@certismedia.com', 28918, 1306871, 'Eureka Massalias Secrets Black', 'mpu', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210331),
(185, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(186, 'cm1056@certismedia.com', 28910, 1304403, 'EUC live 10/3/21 Publishers', 'leaderboard', 1876190373, 'gavros.gr null', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210328),
(187, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(188, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(189, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(190, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(191, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210330),
(192, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210325),
(193, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(194, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(195, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 2147483647, 'ethnos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(196, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(197, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(198, 'cm1056@certismedia.com', 28918, 1306872, 'Eureka Massalias Secrets Black', 'xlarge', 2147483647, 'argiro.gr WayToGrow - AdX EMEA', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(199, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(200, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(201, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(202, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(203, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(204, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 2, 0, 0, 0, 0, 0, 20210330),
(205, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(206, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 245600700, 'athensvoice.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(207, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210326),
(208, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(209, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(210, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(211, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(212, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(213, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(214, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(215, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(216, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(217, 'cm1056@certismedia.com', 28910, 1304405, 'EUC live 10/3/21 Publishers', 'xlarge', 1803207750, 'genius.com', 'PubMatic', 1, 0, 0, 0, 0, 0, 20210329),
(218, 'cm1056@certismedia.com', 28881, 1301469, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(219, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(220, 'cm1056@certismedia.com', 28881, 1310488, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(221, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(222, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(223, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(224, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(225, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1335562594, 'dikaiologitika.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210330),
(226, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(227, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(228, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(229, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(230, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(231, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(232, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(233, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(234, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(235, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(236, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(237, 'cm1056@certismedia.com', 28881, 1301477, 'Attica Bank - Consumer Interest - RTG', 'mpu', 399876807, 'zougla.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(238, 'cm1056@certismedia.com', 28910, 1306876, 'EUC live 10/3/21 Publishers', 'interstitial', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(239, 'cm1056@certismedia.com', 28881, 1301478, 'Attica Bank - Consumer Interest - RTG', 'xlarge', 5415552, 'youweekly.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(240, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 1335562594, 'dikaiologitika.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(241, 'cm1056@certismedia.com', 28918, 1306871, 'Eureka Massalias Secrets Black', 'mpu', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210331),
(242, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(243, 'cm1056@certismedia.com', 28910, 1304403, 'EUC live 10/3/21 Publishers', 'leaderboard', 1876190373, 'gavros.gr null', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210328),
(244, 'cm1056@certismedia.com', 28910, 1306877, 'EUC live 10/3/21 Publishers', 'xlarge', 1873853357, 'gavros.gr', 'PubMatic', 2, 0, 0, 0, 0, 0, 20210325),
(245, 'cm1056@certismedia.com', 28910, 1306878, 'EUC live 10/3/21 Publishers', 'xlarge', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(246, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(247, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(248, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(249, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(250, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(251, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(252, 'cm1056@certismedia.com', 28918, 1306868, 'Eureka Massalias Secrets Black', 'interstitial', 937591, 'hellomagazine.com hola.com', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210331),
(253, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(254, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(255, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210330),
(256, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210325),
(257, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(258, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(259, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 2147483647, 'ethnos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(260, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(261, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(262, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(263, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(264, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(265, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(266, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(267, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(268, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326);
INSERT INTO `report` (`id`, `email`, `campaign_id`, `creative_id`, `creative_name`, `creative_size`, `inventory_id`, `inventory_name`, `exchange_name`, `impression`, `view`, `completed_view`, `click`, `win_rate`, `ctr`, `time`) VALUES
(269, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(270, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(271, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(272, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(273, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(274, 'cm1056@certismedia.com', 28910, 1306877, 'EUC live 10/3/21 Publishers', 'xlarge', 1873853357, 'gavros.gr', 'PubMatic', 2, 0, 0, 0, 0, 0, 20210325),
(275, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210326),
(276, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(277, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(278, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(279, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(280, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(281, 'cm1056@certismedia.com', 28910, 1304405, 'EUC live 10/3/21 Publishers', 'xlarge', 1803207750, 'genius.com', 'PubMatic', 1, 0, 0, 0, 0, 0, 20210329),
(282, 'cm1056@certismedia.com', 28918, 1306868, 'Eureka Massalias Secrets Black', 'interstitial', 937591, 'hellomagazine.com hola.com', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210331),
(283, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(284, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(285, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(286, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(287, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1335562594, 'dikaiologitika.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210330),
(288, 'cm1056@certismedia.com', 28910, 1306876, 'EUC live 10/3/21 Publishers', 'interstitial', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(289, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(290, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 1335562594, 'dikaiologitika.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(291, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(292, 'cm1056@certismedia.com', 28918, 1306872, 'Eureka Massalias Secrets Black', 'xlarge', 2147483647, 'argiro.gr WayToGrow - AdX EMEA', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(293, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(294, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(295, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(296, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(297, 'cm1056@certismedia.com', 28881, 1301477, 'Attica Bank - Consumer Interest - RTG', 'mpu', 399876807, 'zougla.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(298, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 2, 0, 0, 0, 0, 0, 20210330),
(299, 'cm1056@certismedia.com', 28881, 1301478, 'Attica Bank - Consumer Interest - RTG', 'xlarge', 5415552, 'youweekly.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(300, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 245600700, 'athensvoice.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(301, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(302, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(303, 'cm1056@certismedia.com', 28918, 1306871, 'Eureka Massalias Secrets Black', 'mpu', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210331),
(304, 'cm1056@certismedia.com', 28881, 1301469, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(305, 'cm1056@certismedia.com', 28910, 1304403, 'EUC live 10/3/21 Publishers', 'leaderboard', 1876190373, 'gavros.gr null', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210328),
(306, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(307, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(308, 'cm1056@certismedia.com', 28881, 1310488, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(309, 'cm1056@certismedia.com', 28910, 1306878, 'EUC live 10/3/21 Publishers', 'xlarge', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(310, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(311, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(312, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(313, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(314, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(315, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210325),
(316, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(317, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(318, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(319, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 2147483647, 'ethnos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(320, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(321, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(322, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(323, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(324, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210330),
(325, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(326, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(327, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(328, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(329, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(330, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(331, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(332, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(333, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(334, 'cm1056@certismedia.com', 28881, 1301477, 'Attica Bank - Consumer Interest - RTG', 'mpu', 399876807, 'zougla.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(335, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(336, 'cm1056@certismedia.com', 28881, 1301478, 'Attica Bank - Consumer Interest - RTG', 'xlarge', 5415552, 'youweekly.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(337, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(338, 'cm1056@certismedia.com', 28918, 1306871, 'Eureka Massalias Secrets Black', 'mpu', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210331),
(339, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210326),
(340, 'cm1056@certismedia.com', 28910, 1304403, 'EUC live 10/3/21 Publishers', 'leaderboard', 1876190373, 'gavros.gr null', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210328),
(341, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(342, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(343, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(344, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(345, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(346, 'cm1056@certismedia.com', 28910, 1304405, 'EUC live 10/3/21 Publishers', 'xlarge', 1803207750, 'genius.com', 'PubMatic', 1, 0, 0, 0, 0, 0, 20210329),
(347, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(348, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(349, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(350, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1335562594, 'dikaiologitika.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210330),
(351, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(352, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(353, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(354, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(355, 'cm1056@certismedia.com', 28910, 1306876, 'EUC live 10/3/21 Publishers', 'interstitial', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(356, 'cm1056@certismedia.com', 28910, 1306878, 'EUC live 10/3/21 Publishers', 'xlarge', 392158007, 'argiro.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(357, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 1335562594, 'dikaiologitika.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(358, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 1866446148, 'car.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(359, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(360, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(361, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(362, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(363, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415534, 'newsit.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(364, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210330),
(365, 'cm1056@certismedia.com', 28910, 1306877, 'EUC live 10/3/21 Publishers', 'xlarge', 1873853357, 'gavros.gr', 'PubMatic', 2, 0, 0, 0, 0, 0, 20210325),
(366, 'cm1056@certismedia.com', 28881, 1310485, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(367, 'cm1056@certismedia.com', 28881, 1301470, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(368, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415534, 'newsit.gr GDN', 'Doubleclick', 1, 0, 0, 0, 33.3333, 0, 20210325),
(369, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(370, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5417294, 'newsit.gr Journalist Independent Productions', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(371, 'cm1056@certismedia.com', 28881, 1301466, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(372, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5419613, 'athensmagazine.gr GDN', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210329),
(373, 'cm1056@certismedia.com', 28918, 1306868, 'Eureka Massalias Secrets Black', 'interstitial', 937591, 'hellomagazine.com hola.com', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210331),
(374, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 2147483647, 'ethnos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(375, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(376, 'cm1056@certismedia.com', 28881, 1301468, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210326),
(377, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 2, 0, 0, 0, 0, 0, 20210330),
(378, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 245600700, 'athensvoice.gr null', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(379, 'cm1056@certismedia.com', 28881, 1310487, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(380, 'cm1056@certismedia.com', 28918, 1306872, 'Eureka Massalias Secrets Black', 'xlarge', 2147483647, 'argiro.gr WayToGrow - AdX EMEA', 'Doubleclick', 1, 0, 0, 0, 0, 0, 20210326),
(381, 'cm1056@certismedia.com', 28881, 1310489, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328),
(382, 'cm1056@certismedia.com', 28881, 1323107, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(383, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(384, 'cm1056@certismedia.com', 28881, 1323106, 'Attica Bank - Consumer Interest - Premium Display', 'mpu', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210330),
(385, 'cm1056@certismedia.com', 28881, 1323108, 'Attica Bank - Consumer Interest - Premium Display', 'xlarge', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210329),
(386, 'cm1056@certismedia.com', 28881, 1301469, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210327),
(387, 'cm1056@certismedia.com', 28881, 1310488, 'Attica Bank - Consumer Interest - Premium Display', 'leaderboard', 977106286, 'eleftherostypos.gr GDN', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210325),
(388, 'cm1056@certismedia.com', 28881, 1323104, 'Attica Bank - Consumer Interest - Premium Display', 'interstitial', 5415749, 'protothema.gr protothema.gr', 'Doubleclick', 0, 0, 0, 0, 0, 0, 20210328);

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
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ON UPDATE CURRENT_TIMESTAMP()',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=Active | 0=Inactive | 3 = pending ',
  `API` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `phone`, `created`, `modified`, `status`, `API`) VALUES
(2, 'syyyyy 2', 'syyyy22', 'cm1056@certismedia.com', '$2y$10$mXMp8e.yt06CqjWxZ9DP2.7fwKPfRXt7kqhvxY3V6TQvuePQrs9ra', NULL, '2021-04-02 07:25:43', '2021-04-02 07:25:43', 1, 'Y20xMDU2QGNlcnRpc21lZGlhLmNvbTpoSm00NT9kRmU=');

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
-- Indeks untuk tabel `daily_delivery`
--
ALTER TABLE `daily_delivery`
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
-- AUTO_INCREMENT untuk tabel `daily_delivery`
--
ALTER TABLE `daily_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `dashboard`
--
ALTER TABLE `dashboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=510;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT untuk tabel `thirdquartile`
--
ALTER TABLE `thirdquartile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `view`
--
ALTER TABLE `view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
