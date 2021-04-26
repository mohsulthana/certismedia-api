-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Apr 2021 pada 19.06
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
-- Struktur dari tabel `logs_cronjob`
--

CREATE TABLE `logs_cronjob` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `creative_id` int(11) NOT NULL,
  `creative_name` varchar(255) NOT NULL,
  `creative_size` varchar(255) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `exchange_name` varchar(255) NOT NULL,
  `impressions` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `completed_views` int(11) NOT NULL,
  `ctr` float NOT NULL,
  `date_time` date NOT NULL
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
  `API` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statusDashboard` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=ok, 2=credential error',
  `statusReporting` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=ok, 2=credential error'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `logs_cronjob`
--
ALTER TABLE `logs_cronjob`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `logs_cronjob`
--
ALTER TABLE `logs_cronjob`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
