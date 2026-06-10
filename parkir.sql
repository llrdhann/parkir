-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2026 at 11:57 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parkir`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_06_08_002229_create_parkir_locations_table', 1),
(5, '2026_06_08_002304_create_parkir_vehicle_types_table', 1),
(6, '2026_06_08_002311_create_parkir_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parkir_locations`
--

CREATE TABLE `parkir_locations` (
  `id` bigint UNSIGNED NOT NULL,
  `location_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_motorcycle` int NOT NULL,
  `max_car` int NOT NULL,
  `max_other` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parkir_locations`
--

INSERT INTO `parkir_locations` (`id`, `location_name`, `max_motorcycle`, `max_car`, `max_other`, `created_at`, `updated_at`) VALUES
(1, 'Gedung A', 4, 2, 2, '2026-06-08 14:28:22', '2026-06-08 14:28:22'),
(2, 'Gedung B', 6, 1, 2, '2026-06-08 14:28:41', '2026-06-08 14:28:41');

-- --------------------------------------------------------

--
-- Table structure for table `parkir_transactions`
--

CREATE TABLE `parkir_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `id_lokasi` bigint UNSIGNED NOT NULL,
  `no_tiket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_polisi` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_jenis` bigint UNSIGNED NOT NULL,
  `masuk` datetime NOT NULL,
  `keluar` datetime DEFAULT NULL,
  `perjam_pertama` int DEFAULT NULL,
  `perjam_berikutnya` int DEFAULT NULL,
  `max_perhari` int DEFAULT NULL,
  `total_jam` int DEFAULT NULL,
  `total_bayar` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parkir_transactions`
--

INSERT INTO `parkir_transactions` (`id`, `id_lokasi`, `no_tiket`, `no_polisi`, `id_jenis`, `masuk`, `keluar`, `perjam_pertama`, `perjam_berikutnya`, `max_perhari`, `total_jam`, `total_bayar`, `created_at`, `updated_at`) VALUES
(1, 1, 'PRK-20260608213118', 'B 6475 JK', 3, '2026-06-08 21:31:18', '2026-06-08 21:34:50', 5000, 4000, 40000, 4, 17000, '2026-06-08 14:31:18', '2026-06-08 14:34:50'),
(2, 2, 'PRK-20260608213346', 'B 8739 LK', 2, '2026-06-08 21:33:46', '2026-06-08 21:37:37', 4000, 3000, 30000, 4, 13000, '2026-06-08 14:33:46', '2026-06-08 14:37:37'),
(3, 2, 'PRK-20260608223913', 'W 2324 FD', 2, '2026-06-08 22:39:13', '2026-06-08 22:41:30', 4000, 3000, 30000, 3, 10000, '2026-06-08 15:39:13', '2026-06-08 15:41:30'),
(4, 2, 'PRK-20260608223924', 'K 3426 VR', 1, '2026-06-08 22:39:24', '2026-06-08 22:41:49', 3000, 2000, 20000, 3, 7000, '2026-06-08 15:39:24', '2026-06-08 15:41:49'),
(5, 1, 'PRK-20260608223933', 'A 3242 DA', 1, '2026-06-08 22:39:33', '2026-06-10 18:56:34', 3000, 2000, 20000, 2658, 20000, '2026-06-08 15:39:33', '2026-06-10 11:56:34'),
(6, 2, 'PRK-20260608223941', '-', 1, '2026-06-08 22:39:41', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08 15:39:41', '2026-06-08 15:39:41'),
(7, 1, 'PRK-20260608224223', '-', 1, '2026-06-08 22:42:23', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08 15:42:23', '2026-06-08 15:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `parkir_vehicle_types`
--

CREATE TABLE `parkir_vehicle_types` (
  `id` bigint UNSIGNED NOT NULL,
  `jenis` enum('motorcycle','car','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `perjam_pertama` int NOT NULL,
  `perjam_berikutnya` int NOT NULL,
  `max_perhari` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parkir_vehicle_types`
--

INSERT INTO `parkir_vehicle_types` (`id`, `jenis`, `perjam_pertama`, `perjam_berikutnya`, `max_perhari`, `created_at`, `updated_at`) VALUES
(1, 'motorcycle', 3000, 2000, 20000, '2026-06-08 14:29:33', '2026-06-08 14:29:33'),
(2, 'car', 4000, 3000, 30000, '2026-06-08 14:29:54', '2026-06-08 14:29:54'),
(3, 'other', 5000, 4000, 40000, '2026-06-08 14:30:11', '2026-06-08 14:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('tGXer2Gld68WaAbWWf1rVDSXEcDaQrp8VJ5VwfpU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:151.0) Gecko/20100101 Firefox/151.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGI5eEhjQ3Y2U1VxVGpETldNUGR1VE1xR1hvT2d3YVpCZWNramFLaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90cmFuc2FjdGlvbiI7czo1OiJyb3V0ZSI7czoxNzoidHJhbnNhY3Rpb24uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781092594);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parkir_locations`
--
ALTER TABLE `parkir_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parkir_transactions`
--
ALTER TABLE `parkir_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parkir_transactions_id_lokasi_foreign` (`id_lokasi`),
  ADD KEY `parkir_transactions_id_jenis_foreign` (`id_jenis`);

--
-- Indexes for table `parkir_vehicle_types`
--
ALTER TABLE `parkir_vehicle_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `parkir_locations`
--
ALTER TABLE `parkir_locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `parkir_transactions`
--
ALTER TABLE `parkir_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `parkir_vehicle_types`
--
ALTER TABLE `parkir_vehicle_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `parkir_transactions`
--
ALTER TABLE `parkir_transactions`
  ADD CONSTRAINT `parkir_transactions_id_jenis_foreign` FOREIGN KEY (`id_jenis`) REFERENCES `parkir_vehicle_types` (`id`),
  ADD CONSTRAINT `parkir_transactions_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `parkir_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
