-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2024 at 10:07 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sd`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi_guru`
--

CREATE TABLE `absensi_guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `guru_id` int(11) NOT NULL,
  `kehadiran_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absensi_guru`
--

INSERT INTO `absensi_guru` (`id`, `tanggal`, `guru_id`, `kehadiran_id`, `created_at`, `updated_at`) VALUES
(1, '2024-06-28', 1, 5, '2024-06-28 07:18:35', '2024-06-28 07:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_card` varchar(10) NOT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `nama_guru` varchar(50) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `kode` varchar(5) DEFAULT NULL,
  `jk` enum('L','P') NOT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `tmp_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id`, `id_card`, `nip`, `nama_guru`, `mapel_id`, `kode`, `jk`, `telp`, `tmp_lahir`, `tgl_lahir`, `foto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '00001', '20240601', 'Ahmad Rudi, S.Pd.', 2, '01', 'L', '08412301', 'Kediri', '1997-12-03', 'uploads/guru/52541228062024_teacher_male.png', '2024-06-28 05:49:38', '2024-07-15 04:45:32', NULL),
(2, '00002', '20240602', 'Bagus Permana, S.Pd.', 3, '02', 'L', '08412302', 'Kediri', '1995-12-07', 'uploads/guru/03551228062024_teacher_male.png', '2024-06-28 05:50:57', '2024-07-15 04:45:44', NULL),
(3, '00003', '20240603', 'Cahya Fitriani, S.Pd.', 4, '03', 'L', '08412303', 'Kediri', '1997-12-11', 'uploads/guru/36551228062024_teacher_female.png', '2024-06-28 05:55:36', '2024-07-15 04:45:58', NULL),
(4, '00004', '20240604', 'Lina Darmawati, S.Pd.', 1, '04', 'P', '08412304', 'Kediri', '1998-02-02', 'uploads/guru/24561228062024_teacher_female.png', '2024-06-28 05:56:24', '2024-07-15 04:47:43', NULL),
(5, '00005', '20240605', 'Kasno, S.Pd.', 5, '05', 'L', '08412305', 'Kediri', '1988-02-28', 'uploads/guru/11571228062024_teacher_male.png', '2024-06-28 05:57:11', '2024-07-15 04:47:30', NULL),
(6, '00006', '20240606', 'Suhartono Spd', 10, '06', 'L', '08412306', 'Blitar', '1988-12-03', 'uploads/guru/51371328062024_teacher_male.png', '2024-06-28 06:37:51', '2024-07-15 04:06:26', '2024-07-15 04:06:26'),
(7, '00006', '20240607', 'Sriani, S.Pd.', 16, '07', 'P', '0899289344', 'Kediri', '1993-09-10', 'uploads/guru/38481115072024_teacher_female.png', '2024-07-15 04:48:38', '2024-07-15 04:48:38', NULL),
(8, '00007', '20240608', 'Agus Budiarso, S.Pd.', 11, '08', 'L', '0899289345', 'Kediri', '1994-08-12', 'uploads/guru/21491115072024_teacher_male.png', '2024-07-15 04:49:21', '2024-07-15 04:49:21', NULL),
(9, '00008', '20240609', 'Rahma Putri Wati, S.Pd.', 14, '09', 'P', '0899289347', 'Kediri', '1996-09-04', 'uploads/guru/47501115072024_teacher_female.png', '2024-07-15 04:50:47', '2024-07-15 04:50:55', NULL),
(10, '00009', '20240611', 'Siti Nur Kholifa, S.Ag.', 13, '10', 'P', '0899289388', 'Kediri', '1994-04-28', 'uploads/guru/58531115072024_teacher_female.png', '2024-07-15 04:53:45', '2024-07-15 04:53:58', NULL),
(12, '00010', '20240612', 'M. Darwis Riyoko, S.Pd.', 12, '11', 'L', '0899289377', 'Kediri', '1993-12-07', 'uploads/guru/07571115072024_teacher_male.png', '2024-07-15 04:57:07', '2024-07-15 04:57:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hari`
--

CREATE TABLE `hari` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_hari` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hari`
--

INSERT INTO `hari` (`id`, `nama_hari`, `created_at`, `updated_at`) VALUES
(1, 'Senin', '2021-01-11 01:01:19', '2021-01-11 01:01:19'),
(2, 'Selasa', '2021-01-11 01:01:19', '2021-01-11 01:01:19'),
(3, 'Rabu', '2021-01-11 01:01:19', '2021-01-11 01:01:19'),
(4, 'Kamis', '2021-01-11 01:01:19', '2021-01-11 01:01:19'),
(5, 'Jum\'at', '2021-01-11 01:01:19', '2021-01-11 01:01:19');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hari_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `ruang_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id`, `hari_id`, `kelas_id`, `mapel_id`, `guru_id`, `jam_mulai`, `jam_selesai`, `ruang_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 1, 3, 13, 10, '07:30:00', '09:00:00', 1, '2024-07-16 15:12:00', '2024-07-16 15:40:41', NULL),
(10, 1, 3, 13, 10, '08:00:00', '08:30:00', 1, '2024-07-16 15:12:23', '2024-07-16 15:40:32', '2024-07-16 15:40:32'),
(11, 1, 3, 13, 10, '08:30:00', '09:00:00', 1, '2024-07-16 15:12:50', '2024-07-16 15:40:35', '2024-07-16 15:40:35'),
(12, 1, 3, 5, 5, '09:20:00', '11:00:00', 1, '2024-07-16 15:13:46', '2024-07-16 15:44:06', NULL),
(13, 1, 3, 5, 5, '10:00:00', '10:30:00', 1, '2024-07-16 15:14:16', '2024-07-16 15:44:00', '2024-07-16 15:44:00'),
(14, 1, 3, 5, 5, '10:30:00', '11:00:00', 1, '2024-07-16 15:14:34', '2024-07-16 15:44:02', '2024-07-16 15:44:02'),
(15, 2, 3, 4, 3, '07:00:00', '08:30:00', 1, '2024-07-16 15:15:14', '2024-07-16 15:47:08', NULL),
(16, 2, 3, 4, 3, '07:30:00', '08:00:00', 1, '2024-07-16 15:15:31', '2024-07-16 15:47:01', '2024-07-16 15:47:01'),
(17, 2, 3, 4, 3, '08:00:00', '08:30:00', 1, '2024-07-16 15:16:00', '2024-07-16 15:47:03', '2024-07-16 15:47:03'),
(18, 2, 3, 16, 7, '08:30:00', '09:00:00', 1, '2024-07-16 15:16:37', '2024-07-16 15:16:37', NULL),
(19, 2, 3, 16, 7, '09:20:00', '10:00:00', 1, '2024-07-16 15:17:02', '2024-07-16 15:17:02', NULL),
(20, 2, 3, 2, 1, '10:00:00', '11:00:00', 1, '2024-07-16 15:22:43', '2024-07-16 15:47:35', NULL),
(21, 2, 3, 2, 1, '10:30:00', '11:00:00', 1, '2024-07-16 15:23:00', '2024-07-16 15:47:28', '2024-07-16 15:47:28'),
(22, 3, 3, 1, 4, '07:00:00', '09:00:00', 1, '2024-07-16 15:30:23', '2024-07-16 15:48:30', NULL),
(23, 3, 3, 1, 4, '07:30:00', '08:00:00', 1, '2024-07-16 15:30:44', '2024-07-16 15:48:17', '2024-07-16 15:48:17'),
(24, 3, 3, 1, 4, '08:00:00', '08:30:00', 1, '2024-07-16 15:31:16', '2024-07-16 15:48:20', '2024-07-16 15:48:20'),
(25, 3, 3, 1, 4, '08:30:00', '09:00:00', 1, '2024-07-16 15:31:35', '2024-07-16 15:48:23', '2024-07-16 15:48:23'),
(26, 3, 3, 3, 2, '09:20:00', '10:30:00', 1, '2024-07-16 15:35:40', '2024-07-16 15:48:47', NULL),
(27, 3, 3, 3, 2, '10:00:00', '10:30:00', 1, '2024-07-16 15:35:53', '2024-07-16 15:48:40', '2024-07-16 15:48:40'),
(28, 3, 3, 16, 7, '10:30:00', '11:00:00', 1, '2024-07-16 15:36:20', '2024-07-16 15:36:20', NULL),
(29, 4, 3, 14, 9, '07:00:00', '09:00:00', 1, '2024-07-16 15:37:18', '2024-07-16 15:49:42', NULL),
(30, 4, 3, 14, 9, '07:30:00', '08:00:00', 1, '2024-07-16 15:37:36', '2024-07-16 15:49:27', '2024-07-16 15:49:27'),
(31, 4, 3, 14, 9, '08:00:00', '08:30:00', 1, '2024-07-16 15:37:59', '2024-07-16 15:49:32', '2024-07-16 15:49:32'),
(32, 4, 3, 14, 9, '08:30:00', '09:00:00', 1, '2024-07-16 15:38:13', '2024-07-16 15:49:36', '2024-07-16 15:49:36'),
(33, 4, 3, 1, 4, '09:20:00', '10:30:00', 1, '2024-07-16 15:38:35', '2024-07-16 15:49:55', NULL),
(34, 4, 3, 1, 4, '10:00:00', '10:30:00', 1, '2024-07-16 15:38:50', '2024-07-16 15:50:01', '2024-07-16 15:50:01'),
(35, 4, 3, 16, 7, '10:30:00', '11:00:00', 1, '2024-07-16 15:39:03', '2024-07-16 15:39:03', NULL),
(36, 5, 3, 11, 8, '07:00:00', '09:00:00', 8, '2024-07-16 15:39:30', '2024-07-16 15:50:21', NULL),
(37, 5, 3, 11, 8, '07:30:00', '08:00:00', 8, '2024-07-16 15:39:51', '2024-07-16 15:50:07', '2024-07-16 15:50:07'),
(38, 5, 3, 12, 12, '09:20:00', '11:00:00', 1, '2024-07-16 15:50:53', '2024-07-16 15:50:53', NULL),
(39, 1, 4, 1, 4, '07:30:00', '09:00:00', 2, '2024-07-16 15:54:19', '2024-07-16 15:54:19', NULL),
(40, 1, 4, 4, 3, '09:20:00', '11:00:00', 2, '2024-07-16 15:55:53', '2024-07-16 15:55:53', NULL),
(41, 2, 4, 13, 10, '07:00:00', '09:00:00', 2, '2024-07-16 15:56:22', '2024-07-16 15:56:22', NULL),
(42, 2, 4, 3, 2, '09:20:00', '10:30:00', 2, '2024-07-16 16:02:29', '2024-07-16 16:02:29', NULL),
(43, 2, 4, 16, 7, '10:30:00', '11:00:00', 2, '2024-07-16 16:02:45', '2024-07-16 16:02:45', NULL),
(44, 3, 4, 2, 1, '07:00:00', '09:00:00', 2, '2024-07-16 16:03:15', '2024-07-16 16:03:15', NULL),
(45, 3, 4, 12, 12, '09:20:00', '11:00:00', 2, '2024-07-16 16:03:35', '2024-07-17 01:33:04', NULL),
(46, 4, 4, 16, 7, '07:00:00', '08:00:00', 2, '2024-07-16 16:06:39', '2024-07-16 16:06:39', NULL),
(47, 4, 4, 14, 9, '08:00:00', '09:00:00', 2, '2024-07-16 16:07:25', '2024-07-16 16:07:44', '2024-07-16 16:07:44'),
(48, 4, 4, 5, 5, '08:00:00', '09:00:00', 2, '2024-07-16 16:08:07', '2024-07-16 16:08:07', NULL),
(49, 4, 4, 5, 5, '09:20:00', '10:30:00', 2, '2024-07-16 16:22:22', '2024-07-16 16:23:11', NULL),
(50, 4, 4, 3, 2, '10:30:00', '11:00:00', 2, '2024-07-16 16:23:30', '2024-07-16 16:23:30', NULL),
(51, 5, 4, 11, 8, '07:00:00', '09:00:00', 8, '2024-07-16 16:23:52', '2024-07-16 16:23:52', NULL),
(52, 5, 4, 14, 9, '09:20:00', '11:00:00', 2, '2024-07-16 16:24:19', '2024-07-16 16:24:19', NULL),
(53, 1, 5, 3, 2, '07:30:00', '09:00:00', 3, '2024-07-16 16:45:09', '2024-07-16 16:45:09', NULL),
(54, 1, 5, 16, 7, '07:30:00', '09:00:00', 3, '2024-07-16 16:46:16', '2024-07-16 16:46:26', '2024-07-16 16:46:26'),
(55, 1, 5, 2, 1, '09:20:00', '11:00:00', 3, '2024-07-17 01:23:49', '2024-07-17 01:23:49', NULL),
(56, 1, 5, 16, 7, '11:00:00', '11:30:00', 3, '2024-07-17 01:24:08', '2024-07-17 01:24:08', NULL),
(57, 2, 5, 5, 5, '07:00:00', '09:00:00', 3, '2024-07-17 01:24:57', '2024-07-17 01:24:57', NULL),
(58, 2, 5, 4, 3, '09:20:00', '11:00:00', 3, '2024-07-17 01:25:14', '2024-07-17 01:25:14', NULL),
(59, 2, 5, 3, 2, '11:00:00', '11:30:00', 3, '2024-07-17 01:26:21', '2024-07-17 01:26:21', NULL),
(60, 3, 5, 14, 9, '07:00:00', '09:00:00', 3, '2024-07-17 01:31:51', '2024-07-17 01:31:51', NULL),
(61, 3, 5, 1, 4, '09:20:00', '11:30:00', 3, '2024-07-17 01:33:41', '2024-07-17 01:33:41', NULL),
(62, 4, 5, 11, 8, '07:00:00', '09:00:00', 8, '2024-07-17 01:34:45', '2024-07-17 01:34:45', NULL),
(63, 4, 5, 12, 12, '09:20:00', '10:30:00', 3, '2024-07-17 01:35:22', '2024-07-17 01:35:22', NULL),
(64, 4, 5, 16, 7, '10:30:00', '11:30:00', 3, '2024-07-17 01:35:37', '2024-07-17 01:35:37', NULL),
(65, 5, 5, 13, 10, '07:00:00', '09:00:00', 3, '2024-07-17 01:36:49', '2024-07-17 01:36:49', NULL),
(66, 5, 5, 1, 4, '09:20:00', '10:30:00', 3, '2024-07-17 01:38:09', '2024-07-17 01:38:09', NULL),
(67, 5, 5, 16, 7, '10:30:00', '11:30:00', 3, '2024-07-17 01:38:36', '2024-07-17 01:38:36', NULL),
(68, 1, 6, 4, 3, '07:30:00', '09:00:00', 4, '2024-07-17 02:22:56', '2024-07-17 02:22:56', NULL),
(69, 1, 6, 1, 4, '09:20:00', '11:30:00', 4, '2024-07-17 02:25:09', '2024-07-17 02:25:09', NULL),
(70, 1, 6, 16, 7, '11:30:00', '12:00:00', 4, '2024-07-17 02:25:39', '2024-07-17 02:25:39', NULL),
(71, 1, 6, 14, 9, '12:30:00', '14:00:00', 4, '2024-07-17 02:26:37', '2024-07-17 02:26:37', NULL),
(72, 2, 6, 11, 8, '07:00:00', '09:00:00', 8, '2024-07-17 02:27:07', '2024-07-17 02:27:07', NULL),
(73, 2, 6, 2, 1, '09:20:00', '12:00:00', 4, '2024-07-17 02:27:49', '2024-07-17 02:27:49', NULL),
(74, 2, 6, 12, 12, '12:30:00', '14:00:00', 4, '2024-07-17 02:28:29', '2024-07-17 02:28:29', NULL),
(75, 3, 6, 3, 2, '07:00:00', '09:00:00', 4, '2024-07-17 02:29:40', '2024-07-17 02:29:40', NULL),
(76, 3, 6, 13, 10, '09:20:00', '00:00:00', 4, '2024-07-17 02:30:03', '2024-07-17 02:30:03', NULL),
(77, 3, 6, 4, 3, '12:30:00', '13:00:00', 4, '2024-07-17 02:31:13', '2024-07-17 02:31:13', NULL),
(78, 3, 6, 16, 7, '13:00:00', '14:00:00', 4, '2024-07-17 02:31:29', '2024-07-17 02:31:29', NULL),
(79, 4, 6, 1, 4, '07:00:00', '09:00:00', 4, '2024-07-17 02:33:39', '2024-07-17 02:33:39', NULL),
(80, 4, 6, 2, 1, '09:20:00', '10:30:00', 4, '2024-07-17 02:34:15', '2024-07-17 02:34:15', NULL),
(81, 4, 6, 5, 5, '10:30:00', '12:00:00', 4, '2024-07-17 02:34:45', '2024-07-17 02:34:45', NULL),
(82, 4, 6, 5, 5, '12:30:00', '13:00:00', 4, '2024-07-17 02:35:10', '2024-07-17 02:35:10', NULL),
(83, 4, 6, 3, 2, '13:00:00', '14:00:00', 4, '2024-07-17 02:35:41', '2024-07-17 02:35:41', NULL),
(84, 5, 6, 3, 2, '07:00:00', '08:00:00', 4, '2024-07-17 02:38:57', '2024-07-17 02:38:57', NULL),
(85, 5, 6, 2, 1, '08:00:00', '09:00:00', 4, '2024-07-17 02:39:14', '2024-07-17 02:39:14', NULL),
(86, 5, 6, 4, 3, '09:20:00', '10:30:00', 4, '2024-07-17 02:39:31', '2024-07-17 02:39:31', NULL),
(87, 5, 6, 16, 7, '10:30:00', '11:30:00', 4, '2024-07-17 02:39:45', '2024-07-17 02:39:45', NULL),
(88, 1, 9, 11, 8, '07:30:00', '09:00:00', 8, '2024-07-17 02:41:08', '2024-07-17 02:41:08', NULL),
(89, 1, 9, 11, 8, '09:20:00', '10:00:00', 8, '2024-07-17 02:41:22', '2024-07-17 02:41:22', NULL),
(90, 1, 9, 12, 12, '10:00:00', '12:00:00', 5, '2024-07-17 02:41:38', '2024-07-17 02:43:38', NULL),
(91, 1, 9, 12, 12, '12:30:00', '13:00:00', 5, '2024-07-17 02:43:59', '2024-07-17 02:43:59', NULL),
(92, 1, 9, 2, 1, '13:00:00', '14:00:00', 5, '2024-07-17 02:44:32', '2024-07-17 02:44:32', NULL),
(93, 2, 9, 2, 1, '07:00:00', '08:00:00', 5, '2024-07-17 02:45:20', '2024-07-17 02:45:20', NULL),
(94, 2, 9, 1, 4, '08:00:00', '09:00:00', 5, '2024-07-17 02:46:18', '2024-07-17 02:46:18', NULL),
(95, 2, 9, 1, 4, '09:20:00', '10:30:00', 5, '2024-07-17 02:46:34', '2024-07-17 02:46:34', NULL),
(96, 2, 9, 3, 2, '10:30:00', '12:00:00', 5, '2024-07-17 02:47:59', '2024-07-17 02:47:59', NULL),
(97, 2, 9, 3, 2, '12:30:00', '13:00:00', 5, '2024-07-17 02:48:26', '2024-07-17 02:48:26', NULL),
(98, 2, 9, 4, 3, '13:00:00', '14:00:00', 5, '2024-07-17 02:49:07', '2024-07-17 02:51:11', '2024-07-17 02:51:11'),
(99, 2, 9, 4, 3, '13:00:00', '14:00:00', 5, '2024-07-17 02:51:02', '2024-07-17 02:51:02', NULL),
(100, 3, 9, 5, 5, '07:00:00', '09:00:00', 5, '2024-07-17 02:57:20', '2024-07-17 02:57:20', NULL),
(101, 3, 9, 4, 3, '09:20:00', '10:30:00', 5, '2024-07-17 02:57:39', '2024-07-17 02:57:39', NULL),
(102, 3, 9, 16, 7, '10:30:00', '12:00:00', 5, '2024-07-17 03:01:38', '2024-07-17 03:01:38', NULL),
(103, 3, 9, 16, 7, '12:30:00', '13:00:00', 5, '2024-07-17 03:01:58', '2024-07-17 03:13:37', '2024-07-17 03:13:37'),
(104, 3, 9, 12, 12, '12:30:00', '13:00:00', 5, '2024-07-17 03:02:26', '2024-07-17 03:14:33', NULL),
(105, 4, 9, 13, 10, '07:00:00', '09:00:00', 5, '2024-07-17 03:03:10', '2024-07-17 03:03:10', NULL),
(106, 4, 9, 14, 9, '09:20:00', '12:00:00', 5, '2024-07-17 03:03:45', '2024-07-17 03:03:45', NULL),
(107, 4, 9, 1, 4, '12:30:00', '14:00:00', 5, '2024-07-17 03:06:20', '2024-07-17 03:06:20', NULL),
(108, 5, 9, 2, 1, '07:00:00', '08:00:00', 5, '2024-07-17 03:08:21', '2024-07-17 03:08:21', NULL),
(109, 5, 9, 3, 2, '08:00:00', '09:00:00', 5, '2024-07-17 03:08:36', '2024-07-17 03:08:36', NULL),
(110, 5, 9, 5, 5, '09:20:00', '10:30:00', 5, '2024-07-17 03:09:38', '2024-07-17 03:09:38', NULL),
(111, 5, 9, 4, 3, '10:30:00', '11:30:00', 5, '2024-07-17 03:09:49', '2024-07-17 03:09:49', NULL),
(112, 3, 9, 16, 7, '13:00:00', '14:00:00', 5, '2024-07-17 03:14:53', '2024-07-17 03:14:53', NULL),
(113, 1, 8, 5, 5, '07:00:00', '09:00:00', 6, '2024-07-17 03:15:46', '2024-07-17 03:15:46', NULL),
(114, 1, 8, 4, 3, '09:20:00', '12:00:00', 6, '2024-07-17 03:16:06', '2024-07-17 03:16:32', NULL),
(115, 1, 8, 2, 1, '12:30:00', '14:00:00', 6, '2024-07-17 03:17:01', '2024-07-17 03:17:01', NULL),
(116, 2, 8, 1, 4, '07:00:00', '09:00:00', 6, '2024-07-17 03:17:59', '2024-07-17 03:17:59', NULL),
(117, 2, 8, 13, 10, '09:20:00', '12:00:00', 6, '2024-07-17 03:18:35', '2024-07-17 03:18:35', NULL),
(118, 2, 8, 14, 9, '12:30:00', '14:00:00', 6, '2024-07-17 03:18:54', '2024-07-17 03:18:54', NULL),
(119, 3, 8, 11, 8, '07:00:00', '09:00:00', 8, '2024-07-17 03:19:07', '2024-07-17 03:19:07', NULL),
(120, 3, 8, 3, 2, '09:20:00', '12:00:00', 6, '2024-07-17 03:19:32', '2024-07-17 03:19:32', NULL),
(121, 3, 8, 16, 7, '12:30:00', '14:00:00', 6, '2024-07-17 03:19:53', '2024-07-17 03:19:53', NULL),
(122, 4, 8, 12, 12, '07:00:00', '09:00:00', 6, '2024-07-17 03:20:56', '2024-07-17 03:20:56', NULL),
(123, 4, 8, 3, 2, '09:20:00', '10:30:00', 6, '2024-07-17 03:21:18', '2024-07-17 03:21:18', NULL),
(124, 4, 8, 1, 4, '10:30:00', '00:00:00', 6, '2024-07-17 03:21:30', '2024-07-17 03:21:30', NULL),
(125, 4, 8, 4, 3, '12:30:00', '14:00:00', 6, '2024-07-17 03:22:00', '2024-07-17 03:22:00', NULL),
(126, 5, 8, 5, 5, '07:00:00', '08:00:00', 6, '2024-07-17 03:22:14', '2024-07-17 03:22:14', NULL),
(127, 5, 8, 16, 7, '08:00:00', '09:00:00', 6, '2024-07-17 03:22:46', '2024-07-17 03:22:46', NULL),
(128, 5, 8, 2, 1, '09:20:00', '11:30:00', 6, '2024-07-17 03:23:00', '2024-07-17 03:23:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ket` varchar(30) NOT NULL,
  `color` varchar(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`id`, `ket`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Hadir', '3C0', '2021-01-11 01:01:19', '2021-01-11 01:01:19'),
(2, 'Izin', '0CF', '2021-01-11 01:01:19', '2021-01-11 01:01:19'),
(3, 'Bertugas Keluar', 'F90', '2021-01-11 01:01:19', '2021-01-11 01:01:19'),
(4, 'Sakit', 'FF0', '2021-01-11 01:01:19', '2021-01-11 01:01:19'),
(5, 'Terlambat', '7F0', '2021-01-11 01:01:19', '2021-01-11 01:01:19'),
(6, 'Tanpa Keterangan', 'F00', '2021-01-11 01:01:19', '2021-01-11 01:01:19');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `guru_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'KELAS 1', 1, '2024-06-28 05:57:25', '2024-06-28 06:17:01', '2024-06-28 06:17:01'),
(2, 'KELAS 2', 2, '2024-06-28 06:16:57', '2024-06-28 06:17:01', '2024-06-28 06:17:01'),
(3, 'KELAS 1', 1, '2024-06-28 06:25:56', '2024-06-28 06:25:56', NULL),
(4, 'KELAS 2', 2, '2024-06-28 06:38:23', '2024-06-28 06:38:23', NULL),
(5, 'KELAS 3', 3, '2024-06-28 06:38:32', '2024-06-28 06:38:32', NULL),
(6, 'KELAS 4', 4, '2024-06-28 06:38:40', '2024-06-28 06:38:40', NULL),
(7, 'KELAS 5', 6, '2024-06-28 06:38:52', '2024-07-15 04:57:32', '2024-07-15 04:57:32'),
(8, 'KELAS 6', 5, '2024-06-28 06:38:59', '2024-06-28 06:38:59', NULL),
(9, 'KELAS 5', 7, '2024-07-15 04:57:29', '2024-07-15 04:57:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id`, `nama_mapel`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Matematika', '2024-06-28 05:46:58', '2024-06-28 05:46:58', NULL),
(2, 'Bahasa Indonesia', '2024-06-28 05:47:03', '2024-06-28 05:47:03', NULL),
(3, 'Bahasa Inggris', '2024-06-28 05:47:06', '2024-06-28 05:47:06', NULL),
(4, 'Ilmu Pengetahuan Alam', '2024-06-28 05:47:09', '2024-06-28 05:47:09', NULL),
(5, 'Ilmu Pengetahuan Sosial', '2024-06-28 05:47:12', '2024-06-28 05:47:12', NULL),
(6, 'Tematik 1', '2024-06-28 06:36:39', '2024-07-15 04:05:41', '2024-07-15 04:05:41'),
(7, 'Tematik 2', '2024-06-28 06:36:43', '2024-07-15 04:05:44', '2024-07-15 04:05:44'),
(8, 'Tematik 3', '2024-06-28 06:36:48', '2024-07-15 04:05:48', '2024-07-15 04:05:48'),
(9, 'Tematik 4', '2024-06-28 06:36:52', '2024-07-15 04:05:50', '2024-07-15 04:05:50'),
(10, 'Muatan Lokal', '2024-06-28 06:36:56', '2024-07-15 04:06:26', '2024-07-15 04:06:26'),
(11, 'Pendidikan Jasmani, Olahraga, dan Kesehatan', '2024-07-15 04:03:17', '2024-07-15 04:03:17', NULL),
(12, 'SBDP -Seni Budaya dan Prakarya', '2024-07-15 04:04:14', '2024-07-15 04:04:14', NULL),
(13, 'Agama', '2024-07-15 04:04:28', '2024-07-15 04:04:28', NULL),
(14, 'PPKN - Pendidikan Pancasila dan Kewarganegaraan', '2024-07-15 04:04:41', '2024-07-15 04:04:41', NULL),
(15, 'Muatan Lokal', '2024-07-15 04:06:34', '2024-07-15 04:08:25', '2024-07-15 04:08:25'),
(16, 'Muatan Lokal', '2024-07-15 04:08:31', '2024-07-15 04:08:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_03_12_092809_create_hari_table', 1),
(5, '2020_03_12_092854_create_guru_table', 1),
(6, '2020_03_12_092926_create_absensi_guru_table', 1),
(7, '2020_03_12_092941_create_jadwal_table', 1),
(8, '2020_03_12_092953_create_kehadiran_table', 1),
(9, '2020_03_12_093010_create_kelas_table', 1),
(10, '2020_03_12_093018_create_mapel_table', 1),
(11, '2020_03_12_093027_create_nilai_table', 1),
(12, '2020_03_12_093036_create_paket_table', 1),
(13, '2020_03_12_093050_create_pengumuman_table', 1),
(14, '2020_03_12_093102_create_rapot_table', 1),
(15, '2020_03_12_093117_create_ruang_table', 1),
(16, '2020_03_12_093130_create_siswa_table', 1),
(17, '2020_03_16_102220_create_ulangan_table', 1),
(18, '2020_04_07_094355_create_sikap_table', 1),
(19, '2024_06_28_194753_modify_role_enum_in_users_table', 2),
(20, '2024_07_18_073243_add_deskripsi_e_to_nilai_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guru_id` int(11) NOT NULL,
  `kkm` int(11) NOT NULL,
  `deskripsi_a` text NOT NULL,
  `deskripsi_b` text NOT NULL,
  `deskripsi_c` text NOT NULL,
  `deskripsi_d` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deskripsi_e` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id`, `guru_id`, `kkm`, `deskripsi_a`, `deskripsi_b`, `deskripsi_c`, `deskripsi_d`, `created_at`, `updated_at`, `deskripsi_e`) VALUES
(1, 1, 76, '-', '-', '-', '-', '2024-07-01 09:54:52', '2024-07-01 09:54:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opsi` varchar(32) NOT NULL,
  `isi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rapot`
--

CREATE TABLE `rapot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `p_nilai` varchar(5) NOT NULL,
  `p_predikat` varchar(5) NOT NULL,
  `p_deskripsi` text NOT NULL,
  `k_nilai` varchar(5) DEFAULT NULL,
  `k_predikat` varchar(5) DEFAULT NULL,
  `k_deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rapot`
--

INSERT INTO `rapot` (`id`, `siswa_id`, `kelas_id`, `guru_id`, `mapel_id`, `p_nilai`, `p_predikat`, `p_deskripsi`, `k_nilai`, `k_predikat`, `k_deskripsi`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, 2, '66', 'D', '-', NULL, NULL, NULL, '2024-07-02 05:56:55', '2024-07-02 05:56:55'),
(2, 1, 3, 1, 2, '88', 'B', '-', NULL, NULL, NULL, '2024-07-02 06:06:03', '2024-07-02 06:06:03'),
(3, 1, 3, 1, 2, '88', 'B', '-', NULL, NULL, NULL, '2024-07-02 06:06:07', '2024-07-02 06:06:07'),
(4, 1, 3, 1, 2, '87', 'B', '-', NULL, NULL, NULL, '2024-07-02 07:09:41', '2024-07-02 07:09:41'),
(5, 1, 3, 1, 2, '99', 'A', '-', NULL, NULL, NULL, '2024-07-02 07:09:55', '2024-07-02 07:09:55'),
(6, 1, 3, 1, 2, '11', 'D', '-', NULL, NULL, NULL, '2024-07-02 13:27:44', '2024-07-02 13:27:44'),
(7, 1, 3, 1, 2, '22', 'D', '-', NULL, NULL, NULL, '2024-07-02 14:46:50', '2024-07-02 14:46:50'),
(8, 1, 3, 1, 2, '22', 'D', '-', NULL, NULL, NULL, '2024-07-02 14:47:51', '2024-07-02 14:47:51'),
(9, 44, 9, 1, 2, '86', 'B', '-', NULL, NULL, NULL, '2024-07-18 01:18:42', '2024-07-18 01:18:42'),
(10, 3, 3, 1, 2, '64', 'D', '-', NULL, NULL, NULL, '2024-07-18 02:32:11', '2024-07-18 02:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_ruang` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`id`, `nama_ruang`, `created_at`, `updated_at`) VALUES
(1, 'RUANG 01', NULL, NULL),
(2, 'RUANG 02', NULL, NULL),
(3, 'RUANG 03', NULL, NULL),
(4, 'RUANG 04', NULL, NULL),
(5, 'RUANG 05', NULL, NULL),
(6, 'RUANG 06', NULL, NULL),
(7, 'RUANG 07', NULL, NULL),
(8, 'RUANG 08 ', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sikap`
--

CREATE TABLE `sikap` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `sikap_1` varchar(5) DEFAULT NULL,
  `sikap_2` varchar(5) DEFAULT NULL,
  `sikap_3` varchar(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_induk` varchar(30) NOT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `tmp_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `foto` varchar(255) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `no_induk`, `nis`, `nama_siswa`, `jk`, `telp`, `tmp_lahir`, `tgl_lahir`, `foto`, `kelas_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, '0022407101', '20240101', 'Ahmad Wahyu Ar-Rasyid', 'L', '08832324', 'Kediri', '2017-09-12', 'uploads/siswa/07101215072024_student_male.png', 3, '2024-07-15 05:10:07', '2024-07-15 05:10:38', NULL),
(4, '0022407102', '20240102', 'Bagus Cahyo Firmana', 'L', '08832323', 'Kediri', '2017-08-07', 'uploads/siswa/13111215072024_student_male.png', 3, '2024-07-15 05:11:13', '2024-07-15 05:11:13', NULL),
(5, '0022407103', '20240103', 'Catur Deni Saputra', 'L', '088328493', 'Nganjuk', '2017-02-18', 'uploads/siswa/48111215072024_student_male.png', 3, '2024-07-15 05:11:48', '2024-07-15 05:11:48', NULL),
(6, '0022407104', '20240104', 'Danang Adi Satria', 'L', '088324345', 'Kediri', '2017-07-06', 'uploads/siswa/36041315072024_student_male.png', 3, '2024-07-15 06:04:36', '2024-07-15 06:04:36', NULL),
(7, '0022407105', '20240105', 'Denise Putri Indarwati', 'P', '08832657', 'Tulungagung', '2017-10-09', 'uploads/siswa/18051315072024_student_female.png', 3, '2024-07-15 06:05:18', '2024-07-15 06:05:18', NULL),
(8, '0022407106', '20240106', 'Fitriani Cahyani', 'L', '08832545', 'Kediri', '2017-08-03', 'uploads/siswa/34081315072024_student_female.png', 3, '2024-07-15 06:08:34', '2024-07-15 06:08:34', NULL),
(9, '0022407107', '20240107', 'Galih Prayogo', 'L', '08890375', 'Kediri', '2017-09-12', 'uploads/siswa/07091315072024_student_female.png', 3, '2024-07-15 06:09:07', '2024-07-15 06:09:07', NULL),
(10, '0022407108', '20240108', 'Galuh Candrawati', 'P', '0889375', 'Blitar', '2017-07-14', 'uploads/siswa/52091315072024_student_female.png', 3, '2024-07-15 06:09:52', '2024-07-15 06:09:52', NULL),
(11, '0022407109', '20240109', 'Irsad Saputra Dewangga', 'L', '08835486', 'Kediri', '2017-03-29', 'uploads/siswa/47231315072024_student_male.png', 3, '2024-07-15 06:10:29', '2024-07-15 06:23:47', NULL),
(12, '0022407110', '20240110', 'Jessica Bilbina Putri', 'P', '08890894', 'Kediri', '2017-10-18', 'uploads/siswa/05111315072024_student_female.png', 3, '2024-07-15 06:11:05', '2024-07-15 06:11:05', NULL),
(13, '0022407201', '20240201', 'Adam Bagus Santosa', 'L', '084352324', 'Kediri', '2016-09-02', 'uploads/siswa/18191315072024_student_male.png', 4, '2024-07-15 06:19:18', '2024-07-15 06:19:18', NULL),
(14, '0022407202', '20240202', 'Bella Putri Nurdianti', 'P', '084346735', 'Kediri', '2016-08-18', 'uploads/siswa/58191315072024_student_female.png', 4, '2024-07-15 06:19:58', '2024-07-15 06:19:58', NULL),
(15, '0022407203', '20240203', 'Citra Dewi Anggara', 'P', '084325325', 'Blitar', '2016-07-29', 'uploads/siswa/23231315072024_student_female.png', 4, '2024-07-15 06:23:23', '2024-07-15 06:23:23', NULL),
(16, '0022407204', '20240204', 'Dian Permata Putri', 'P', '085458945', 'Kediri', '2016-11-02', 'uploads/siswa/37241315072024_student_female.png', 4, '2024-07-15 06:24:37', '2024-07-15 06:24:37', NULL),
(17, '0022407205', '20240205', 'Doni Bagus Priawan', 'L', '083454546', 'Nganjuk', '2016-07-28', 'uploads/siswa/42251315072024_student_male.png', 4, '2024-07-15 06:25:42', '2024-07-15 06:25:42', NULL),
(18, '0022407206', '20240206', 'Eko Darmawan', 'L', '0834354354', 'Nganjuk', '0216-02-24', 'uploads/siswa/49261315072024_student_male.png', 4, '2024-07-15 06:26:49', '2024-07-15 06:26:49', NULL),
(19, '0022407207', '20240207', 'Fajar Ardian Saputra', 'L', '083439584', 'Kediri', '2016-08-19', 'uploads/siswa/45271315072024_student_male.png', 4, '2024-07-15 06:27:45', '2024-07-15 06:27:45', NULL),
(20, '0022407208', '20240208', 'Indah Dwi Putri', 'P', '0834359576', 'Nganjuk', '2016-10-05', 'uploads/siswa/21331315072024_student_female.png', 4, '2024-07-15 06:33:21', '2024-07-15 06:33:21', NULL),
(21, '0022407209', '20240209', 'Kevin Kuswantoro', 'L', '0834345677', 'Kediri', '2016-03-18', 'uploads/siswa/23341315072024_student_male.png', 4, '2024-07-15 06:34:23', '2024-07-15 06:34:23', NULL),
(22, '0022407210', '20240210', 'Putri Amalia Kiki', 'P', '083445467', 'Kediri', '2016-12-01', 'uploads/siswa/59341315072024_student_female.png', 4, '2024-07-15 06:34:59', '2024-07-15 06:34:59', NULL),
(23, '0022407301', '20240301', 'Amanda Putri Meliza', 'P', '08434589', 'Tulungagung', '2015-09-29', 'uploads/siswa/05361315072024_student_female.png', 5, '2024-07-15 06:36:05', '2024-07-15 06:36:05', NULL),
(24, '0022407302', '20240302', 'Azzahra Nur Putri Kholifah', 'P', '0834348345', 'Kediri', '2015-08-12', 'uploads/siswa/57361315072024_student_female.png', 5, '2024-07-15 06:36:57', '2024-07-15 06:36:57', NULL),
(25, '0022407303', '20240303', 'Bayu Agung Pratama', 'L', '0834341209', 'Kediri', '2015-02-27', 'uploads/siswa/40371315072024_student_male.png', 5, '2024-07-15 06:37:40', '2024-07-15 06:37:40', NULL),
(26, '0022407304', '20240304', 'Cinthia Dewi', 'P', '0834345602', 'Blitar', '2015-11-09', 'uploads/siswa/27381315072024_student_female.png', 5, '2024-07-15 06:38:27', '2024-07-15 06:38:27', NULL),
(27, '0022407305', '20240305', 'Danu Akbar Januar', 'L', '0834348923', 'Tulungagung', '2015-04-05', 'uploads/siswa/15391315072024_student_male.png', 5, '2024-07-15 06:39:15', '2024-07-15 06:39:15', NULL),
(28, '0022407306', '20240306', 'Deni Cahyo Wirawan', 'L', '0834349854', 'Nganjuk', '2015-08-05', 'uploads/siswa/51391315072024_student_male.png', 5, '2024-07-15 06:39:51', '2024-07-15 06:39:51', NULL),
(29, '0022407307', '20240307', 'Fikha Rahmawati', 'P', '0834349942', 'Kediri', '2015-04-05', 'uploads/siswa/11411315072024_student_female.png', 5, '2024-07-15 06:41:11', '2024-07-15 06:41:11', NULL),
(30, '0022407308', '20240308', 'Freddy Putra Ivanka', 'L', '0834340605', 'Blitar', '2015-05-06', 'uploads/siswa/51411315072024_student_female.png', 5, '2024-07-15 06:41:51', '2024-07-15 06:41:51', NULL),
(31, '0022407309', '20240309', 'Irfansyah Nur Cahya', 'L', '0834345467', 'Kediri', '2015-05-29', 'uploads/siswa/45421315072024_student_male.png', 5, '2024-07-15 06:42:45', '2024-07-15 06:42:45', NULL),
(32, '0022407310', '20240310', 'Rendi Rahmad Cahyadi', 'L', '0834349938', 'Kediri', '2015-06-28', 'uploads/siswa/49431315072024_student_male.png', 5, '2024-07-15 06:43:49', '2024-07-15 06:43:49', NULL),
(33, '0022407401', '20240401', 'Achmad Hidayat Putra', 'L', '08443775432', 'Kediri', '2014-02-16', 'uploads/siswa/42461315072024_student_male.png', 6, '2024-07-15 06:46:42', '2024-07-15 06:46:42', NULL),
(34, '0022407402', '20240402', 'Ana Putri Irawan', 'P', '083434563', 'Blitar', '2014-05-17', 'uploads/siswa/39281716072024_student_female.png', 6, '2024-07-16 10:28:39', '2024-07-16 10:28:39', NULL),
(35, '0022407403', '20240403', 'Azzahra Isyana Dewi', 'P', '08443770923', 'Kediri', '2014-08-20', 'uploads/siswa/53311716072024_student_female.png', 6, '2024-07-16 10:31:53', '2024-07-16 10:31:53', NULL),
(36, '0022407404', '20240404', 'Bagus Rahmat Agung', 'L', '08443779976', 'Blitar', '2014-09-27', 'uploads/siswa/40481716072024_student_male.png', 6, '2024-07-16 10:48:40', '2024-07-16 10:48:40', NULL),
(37, '0022407405', '20240405', 'Bayu Anggara', 'L', '08443770234', 'Kediri', '2014-06-14', 'uploads/siswa/32491716072024_student_male.png', 6, '2024-07-16 10:49:32', '2024-07-16 10:49:32', NULL),
(38, '0022407406', '20240406', 'Erwin Cahyo Nugraha', 'L', '0834348544', 'Kediri', '2014-07-29', 'uploads/siswa/15501716072024_student_male.png', 6, '2024-07-16 10:50:15', '2024-07-16 10:50:15', NULL),
(40, '0022407407', '20240407', 'Farah Amalia Kartika', 'P', '08443776012', 'Tulungagung', '2014-06-28', 'uploads/siswa/53511716072024_student_female.png', 6, '2024-07-16 10:51:53', '2024-07-16 10:51:53', NULL),
(41, '0022407408', '20240408', 'Iqbal Maulana Fikri', 'L', '08443770923', 'Kediri', '2014-04-30', 'uploads/siswa/37581716072024_student_male.png', 6, '2024-07-16 10:58:37', '2024-07-16 10:58:37', NULL),
(42, '0022407409', '20240409', 'Laila Ayu Nurhaliza', 'P', '08443771187', 'Tulungagung', '2014-07-29', 'uploads/siswa/34312016072024_student_female.png', 6, '2024-07-16 13:31:34', '2024-07-16 13:31:34', NULL),
(43, '0022407410', '20240410', 'Pandu Kusuma Alam', 'L', '08443770384', 'Kediri', '2014-06-17', 'uploads/siswa/38332016072024_student_male.png', 6, '2024-07-16 13:33:38', '2024-07-16 13:33:38', NULL),
(44, '0022407501', '20240501', 'Adam Adi Santoso', 'L', '08443771167', 'Kediri', '2013-02-24', 'uploads/siswa/53342016072024_student_male.png', 9, '2024-07-16 13:34:53', '2024-07-16 13:34:53', NULL),
(45, '0022407502', '20240502', 'Ali Rahman Prasetya', 'L', '08443771482', 'Blitar', '2013-09-02', 'uploads/siswa/55352016072024_student_male.png', 9, '2024-07-16 13:35:55', '2024-07-16 13:35:55', NULL),
(46, '0022407503', '20240503', 'Chintya Ayu Dewi', 'P', '08443772381', 'Kediri', '2013-03-28', 'uploads/siswa/44362016072024_student_female.png', 9, '2024-07-16 13:36:44', '2024-07-16 13:36:44', NULL),
(47, '0022407504', '20240504', 'Dwi Arisa Kusnandar', 'P', '08443779074', 'Kediri', '2013-08-19', 'uploads/siswa/29372016072024_student_female.png', 9, '2024-07-16 13:37:29', '2024-07-16 13:37:29', NULL),
(48, '0022407505', '20240505', 'Erlangga Hadi Kusuma', 'L', '08443778484', 'Blitar', '2013-05-16', 'uploads/siswa/11442016072024_student_male.png', 9, '2024-07-16 13:44:11', '2024-07-16 13:44:11', NULL),
(49, '0022407506', '20240506', 'Farah Anindya', 'P', '08443770231', 'Nganjuk', '2013-09-04', 'uploads/siswa/08012116072024_student_female.png', 9, '2024-07-16 14:01:08', '2024-07-16 14:01:08', NULL),
(50, '0022407507', '20240507', 'Galih Wibowo', 'L', '08443777109', 'Nganjuk', '2013-04-29', 'uploads/siswa/17142116072024_student_male.png', 9, '2024-07-16 14:14:17', '2024-07-16 14:14:17', NULL),
(51, '0022407508', '20240508', 'Hafiz Ramadhan Saputra', 'L', '08443777741', 'Kediri', '2013-07-29', 'uploads/siswa/25152116072024_student_male.png', 9, '2024-07-16 14:15:25', '2024-07-16 14:15:25', NULL),
(52, '0022407509', '20240509', 'Lita Anggraini', 'P', '08443775491', 'Tulungagung', '2013-11-08', 'uploads/siswa/26162116072024_student_female.png', 9, '2024-07-16 14:16:26', '2024-07-16 14:16:26', NULL),
(53, '0022407510', '20240510', 'Mahesa Rendy Januar', 'L', '08443776672', 'Kediri', '2013-05-12', 'uploads/siswa/13182116072024_student_male.png', 9, '2024-07-16 14:18:13', '2024-07-16 14:18:13', NULL),
(54, '0022407601', '20240601', 'Anisa Putri Lestari', 'P', '08443770012', 'Blitar', '2012-11-27', 'uploads/siswa/24192116072024_student_female.png', 8, '2024-07-16 14:19:24', '2024-07-16 14:19:24', NULL),
(55, '0022407602', '20240602', 'Berlian Ayu Safitri', 'P', '08443770579', 'Kediri', '2012-07-30', 'uploads/siswa/21212116072024_student_female.png', 8, '2024-07-16 14:21:21', '2024-07-16 14:21:21', NULL),
(56, '0022407603', '20240603', 'Catur Adi Witama', 'L', '08443774400', 'Tulungagung', '2012-07-12', 'uploads/siswa/27222116072024_student_male.png', 8, '2024-07-16 14:22:27', '2024-07-16 14:22:27', NULL),
(57, '0022407604', '20240604', 'Clara Sinthia Maharani', 'P', '08443776671', 'Kediri', '2012-08-31', 'uploads/siswa/12232116072024_student_female.png', 8, '2024-07-16 14:23:12', '2024-07-16 14:23:12', NULL),
(58, '0022407605', '20240605', 'Febri Ramadhani', 'L', '08443779090', 'Kediri', NULL, 'uploads/siswa/56232116072024_student_male.png', 8, '2024-07-16 14:23:56', '2024-07-16 14:23:56', NULL),
(59, '0022407606', '20240606', 'Hendrawan Adi Kusuma', 'L', '08443777842', 'Nganjuk', '2012-04-29', 'uploads/siswa/58242116072024_student_male.png', 8, '2024-07-16 14:24:58', '2024-07-16 14:24:58', NULL),
(60, '0022407607', '20240607', 'Intan Oktaviani', 'P', '08443775602', 'Kediri', '2012-10-09', 'uploads/siswa/50252116072024_student_female.png', 8, '2024-07-16 14:25:50', '2024-07-16 14:25:50', NULL),
(61, '0022407608', '20240608', 'Kevin Nugraha Santosa', 'L', '08443771187', 'Kediri', '2012-04-13', 'uploads/siswa/08272116072024_student_male.png', 8, '2024-07-16 14:27:08', '2024-07-16 14:27:08', NULL),
(62, '0022407609', '20240609', 'Mita Amelia Rizka', 'P', '08443776714', 'Nganjuk', '2012-05-29', 'uploads/siswa/02282116072024_student_female.png', 8, '2024-07-16 14:28:02', '2024-07-16 14:28:02', NULL),
(63, '0022407610', '20240610', 'Niko Bagus Saputra', 'L', '08443778393', 'Kediri', '2012-06-17', 'uploads/siswa/56282116072024_student_male.png', 8, '2024-07-16 14:28:56', '2024-07-16 14:28:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ulangan`
--

CREATE TABLE `ulangan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `ulha_1` varchar(5) DEFAULT NULL,
  `ulha_2` varchar(5) DEFAULT NULL,
  `uts` varchar(5) DEFAULT NULL,
  `ulha_3` varchar(5) DEFAULT NULL,
  `ulha_4` varchar(5) DEFAULT NULL,
  `uas` varchar(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ulangan`
--

INSERT INTO `ulangan` (`id`, `siswa_id`, `kelas_id`, `guru_id`, `mapel_id`, `ulha_1`, `ulha_2`, `uts`, `ulha_3`, `ulha_4`, `uas`, `created_at`, `updated_at`) VALUES
(18, 3, 3, 1, 2, '22', '22', '22', '22', '22', '44', '2024-07-18 02:42:55', '2024-07-18 07:51:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Guru','Siswa','Kepala Sekolah') DEFAULT NULL,
  `no_induk` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `no_induk`, `id_card`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$gNt5v.nhaW1plxWw.4Irxul3mNn0QoCTiFx6cCRg02KNtI78Hwa8m', 'Admin', NULL, NULL, 'q5yqyM3rFRelYWkwZ93nnDPN6sL5GwBntayyet15rKO8pPXhEdniMgtxOdCx', '2021-01-11 01:01:19', '2021-01-11 01:01:19', NULL),
(2, 'Ahmad Rudi, S.Pd.', 'ahmadrusdi@gmail.com', NULL, '$2y$10$7rnBX4/KBQgi9FEz/4eK4uY/RTIeaKkyJqnA4kL2xGD2s04/pRk5O', 'Guru', NULL, '00001', 'hnAWfbxsFZivuOIs4aNI3mKgXqrswgfdWaj0IeEMKzJhOidwTC8nOZxtZpen', '2024-06-28 07:07:26', '2024-07-15 04:45:32', NULL),
(3, 'abi', 'abi123@gmail.com', NULL, '$2y$10$0j4txSiAkE/JhCwrMcltZO6Te8dJTzLNpUi7Ixe3SBFilMhHqvKXC', 'Siswa', '20249901', NULL, NULL, '2024-06-28 07:10:38', '2024-07-15 05:02:32', '2024-07-15 05:02:32'),
(4, 'KepSek SD', 'kepalasekolah@gmail.com', NULL, '$2y$10$YhH9.u.4LnNtAiKEJWWg7uLrQtvGSUJfVf9nddjTrYK58WdyHI6Ay', 'Kepala Sekolah', NULL, NULL, 'GDxaDFtK8Mp5nN03MaPUvI3EC0YRPo9cM1wWIp5mG7IhDBWfJTUPPMres1rO', '2024-06-28 12:54:52', '2024-06-28 12:54:52', NULL),
(5, 'ahmad wahyu ar-rasyid', 'ahmadwahyukls1@gmail.com', NULL, '$2y$10$//Yu92IaPb509DvFu8Qo1uMtaQxaFNTzpM4SBULqlFyjDXEDiwFbW', 'Siswa', '0022407101', NULL, NULL, '2024-07-17 01:56:42', '2024-07-17 01:56:42', NULL),
(6, 'adam bagus santosa', 'adambaguskls2@gmail.com', NULL, '$2y$10$0z131FfIJvO7RHYM125XqeFnsKFvyP2iL5nWE.RoBk9Qd7KS3UjQ6', 'Siswa', '0022407201', NULL, NULL, '2024-07-17 02:14:08', '2024-07-17 02:14:08', NULL),
(7, 'amanda putri meliza', 'amandaputrikls3@gmail.com', NULL, '$2y$10$GGNr0m/Tm6.qSygytrzQDOqd.5GSI8EigSaG/6O6AH8u78pT.dS/G', 'Siswa', '0022407301', NULL, NULL, '2024-07-17 02:15:37', '2024-07-17 02:15:37', NULL),
(8, 'Siti Nur Kholifa, S.Ag.', 'sitinur@gmail.com', NULL, '$2y$10$oZxhaLMPXxBQSQhEwjrjQ.jp1ZM1r9swUFgOrEY548F6NNottxkQW', 'Guru', NULL, '00009', NULL, '2024-07-17 03:23:46', '2024-07-17 03:23:46', NULL),
(9, 'Bagus Permana, S.Pd.', 'baguspermana@gmail.com', NULL, '$2y$10$lwb/zJox7gOihzcPmUtwxe45wWk9rFFbFwxJSwT0ByHxIik8bRYZG', 'Guru', NULL, '00002', NULL, '2024-07-17 03:24:16', '2024-07-17 03:24:16', NULL),
(10, 'Cahya Fitriani, S.Pd.', 'cahyafitriani@gmail.com', NULL, '$2y$10$TFeWM5Y8/9G2Hu65e7zEgOBISN1CyFE8ELgeQR8yfotlz8TwyA/0i', 'Guru', NULL, '00003', NULL, '2024-07-17 03:24:42', '2024-07-17 03:24:42', NULL),
(11, 'Kasno, S.Pd.', 'kasnosd@gmail.com', NULL, '$2y$10$S/ljKpHZC/JC2QnCYW/O.e5PEJTtz.HuEdI4YbI9WoE/7M34SVHeK', 'Guru', NULL, '00005', NULL, '2024-07-17 03:25:14', '2024-07-17 03:25:14', NULL),
(12, 'Lina Darmawati, S.Pd.', 'linadarmawati@gmail.com', NULL, '$2y$10$LaUc/62x9vWxwCnmDOcu1eHOg0pL/pvQI4EnYHtdNVV9wwBBIge/m', 'Guru', NULL, '00004', NULL, '2024-07-17 03:26:06', '2024-07-17 03:26:06', NULL),
(13, 'Sriani, S.Pd.', 'sriani@gmail.com', NULL, '$2y$10$jD9Y4iFFl4NDs8uF/GerweRZ0LS1DXDrH9tKJx4cJIGP61jnkenFO', 'Guru', NULL, '00006', NULL, '2024-07-17 03:26:32', '2024-07-17 03:26:32', NULL),
(14, 'Agus Budiarso, S.Pd.', 'agusbudi@gmail.com', NULL, '$2y$10$MdbaEBxT/nF2uvhJmT56UOi8PD9pOYv19Lch2NB3OZXMefcrUA4Km', 'Guru', NULL, '00007', NULL, '2024-07-17 03:27:00', '2024-07-17 03:27:00', NULL),
(15, 'Rahma Putri Wati, S.Pd.', 'rahmaputri@gmail.com', NULL, '$2y$10$ff1pJgVo39OPm5q4KkO1veka0/MARwdnLp6UExZiIO7sw7OnimoVa', 'Guru', NULL, '00008', NULL, '2024-07-17 03:27:26', '2024-07-17 03:27:26', NULL),
(16, 'M. Darwis Riyoko, S.Pd.', 'darwisriyoko@gmail.com', NULL, '$2y$10$ZgE0y7J8sXByr7sMBqJZKeOv5tIlLb/L0fpMj5adzg//4H8sEVdLC', 'Guru', NULL, '00010', NULL, '2024-07-17 03:27:58', '2024-07-17 03:27:58', NULL),
(17, 'achmad hidayat putra', 'achmadhidayatkls4@gmail.com', NULL, '$2y$10$JBXJPmkxNByCyaSTpVQUDOhW8gRpfAXh2P6PGMWw4T7x38RY0asT2', 'Siswa', '0022407401', NULL, NULL, '2024-07-17 03:28:36', '2024-07-17 03:28:36', NULL),
(18, 'adam adi santoso', 'adamadis@gmail.com', NULL, '$2y$10$As6x134Og2IpvLFZQOrBreKVNbJnJRt4OfyCHe/aM/W4rJeZciTn6', 'Siswa', '0022407501', NULL, NULL, '2024-07-17 03:29:01', '2024-07-17 03:29:01', NULL),
(19, 'anisa putri lestari', 'anisaputri@gmail.com', NULL, '$2y$10$3jnkDIYPC4xlTWnbSBXBIeD7MPMsramjolkS4j67SjPeBdepqAHt2', 'Siswa', '0022407601', NULL, NULL, '2024-07-17 03:29:26', '2024-07-17 03:29:26', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi_guru`
--
ALTER TABLE `absensi_guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rapot`
--
ALTER TABLE `rapot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sikap`
--
ALTER TABLE `sikap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ulangan`
--
ALTER TABLE `ulangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi_guru`
--
ALTER TABLE `absensi_guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `hari`
--
ALTER TABLE `hari`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rapot`
--
ALTER TABLE `rapot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ruang`
--
ALTER TABLE `ruang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sikap`
--
ALTER TABLE `sikap`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `ulangan`
--
ALTER TABLE `ulangan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
