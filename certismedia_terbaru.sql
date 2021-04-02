-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Apr 2021 pada 09.01
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
-- Indeks untuk tabel `report`
--
ALTER TABLE `report`
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
-- AUTO_INCREMENT untuk tabel `daily_delivery`
--
ALTER TABLE `daily_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dashboard`
--
ALTER TABLE `dashboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `report`
--
ALTER TABLE `report`
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
