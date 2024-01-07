-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jan 2024 pada 16.50
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poli`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_polis`
--

CREATE TABLE `daftar_polis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pasien` bigint(20) UNSIGNED NOT NULL,
  `id_jadwal` bigint(20) UNSIGNED NOT NULL,
  `keluhan` varchar(255) NOT NULL,
  `no_antrian` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `daftar_polis`
--

INSERT INTO `daftar_polis` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `created_at`, `updated_at`) VALUES
(2, 3, 7, 'Nyilu pada gigi', 1, '2024-01-07 08:38:21', '2024-01-07 08:38:21'),
(3, 4, 6, 'Tidak ada', 2, '2024-01-07 08:39:02', '2024-01-07 08:39:02'),
(4, 5, 5, 'Demam', 3, '2024-01-07 08:40:10', '2024-01-07 08:40:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_periksas`
--

CREATE TABLE `detail_periksas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_periksa` bigint(20) UNSIGNED NOT NULL,
  `id_obat` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `detail_periksas`
--

INSERT INTO `detail_periksas` (`id`, `id_periksa`, `id_obat`, `created_at`, `updated_at`) VALUES
(2, 2, 6, '2024-01-07 08:42:07', '2024-01-07 08:42:07'),
(3, 3, 6, '2024-01-07 08:42:39', '2024-01-07 08:42:39'),
(4, 3, 5, '2024-01-07 08:42:39', '2024-01-07 08:42:39'),
(5, 4, 5, '2024-01-07 08:43:15', '2024-01-07 08:43:15'),
(6, 4, 4, '2024-01-07 08:43:15', '2024-01-07 08:43:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokters`
--

CREATE TABLE `dokters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `id_poli` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `dokters`
--

INSERT INTO `dokters` (`id`, `nama`, `alamat`, `no_hp`, `id_poli`, `created_at`, `updated_at`) VALUES
(4, 'Dr. Amin', 'Jl. Merdeka, Semarang No 67', '08975018609', 1, '2024-01-07 08:29:40', '2024-01-07 08:29:40'),
(5, 'Dr. Salsa', 'Jl. Songgom, Brebes No.12', '08975018632', 3, '2024-01-07 08:29:59', '2024-01-07 08:29:59'),
(6, 'Dr. Susilo', 'Jl, Pancasila, Semarang No.120', '08975018609', 4, '2024-01-07 08:30:34', '2024-01-07 08:30:34'),
(7, 'Dr. Sarah', 'Jl. Neo, Semarang  No. 127', '08975018679', 5, '2024-01-07 08:31:07', '2024-01-07 08:31:07'),
(8, 'Dr Malik', 'Jl. Melati, Semarang No 6', '08985018676', 2, '2024-01-07 08:31:43', '2024-01-07 08:31:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwals`
--

CREATE TABLE `jadwals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_dokter` bigint(20) UNSIGNED NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jadwals`
--

INSERT INTO `jadwals` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `status`, `created_at`, `updated_at`) VALUES
(5, 4, 'Senin', '09:00:00', '13:00:00', 1, '2024-01-07 08:35:11', '2024-01-07 08:35:11'),
(6, 5, 'Selasa', '09:00:00', '13:00:00', 1, '2024-01-07 08:35:54', '2024-01-07 08:35:54'),
(7, 6, 'Rabu', '09:00:00', '13:00:00', 1, '2024-01-07 08:36:14', '2024-01-07 08:36:14'),
(8, 7, 'Kamis', '09:00:00', '13:00:00', 1, '2024-01-07 08:36:40', '2024-01-07 08:36:40'),
(9, 8, 'Jumat', '08:00:00', '11:00:00', 1, '2024-01-07 08:37:02', '2024-01-07 08:37:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_28_133559_create_polis_table', 1),
(6, '2023_12_28_134237_create_pasiens_table', 1),
(7, '2023_12_28_135151_create_dokters_table', 1),
(8, '2023_12_28_135315_create_obats_table', 1),
(9, '2023_12_28_140538_create_jadwals_table', 1),
(10, '2023_12_28_141509_create_daftar_polis_table', 1),
(11, '2023_12_28_141609_create_periksas_table', 1),
(12, '2023_12_28_141638_create_detail_periksas_table', 1),
(13, '2023_12_29_161545_add_catatan_to_periksas', 1),
(14, '2024_01_07_085426_add_status_to_jadwals', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `obats`
--

CREATE TABLE `obats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `kemasan` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `obats`
--

INSERT INTO `obats` (`id`, `nama_obat`, `kemasan`, `harga`, `created_at`, `updated_at`) VALUES
(4, 'Asiklovir 200 mg', 'tablet', 36000, '2024-01-07 08:27:45', '2024-01-07 08:27:45'),
(5, 'Alopurinol tablet 100 mg', 'tablet', 16000, '2024-01-07 08:27:59', '2024-01-07 08:27:59'),
(6, 'Ekstraks Belladona 10 mg', 'tablet', 78000, '2024-01-07 08:28:21', '2024-01-07 08:28:21'),
(7, 'Aminofilin tablet 150', 'Botol', 57000, '2024-01-07 08:28:50', '2024-01-07 08:28:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasiens`
--

CREATE TABLE `pasiens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `no_rm` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pasiens`
--

INSERT INTO `pasiens` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `no_rm`, `created_at`, `updated_at`) VALUES
(1, 'Putri Amalia', 'Songgom Lor RT/RW 002/002 RW/RW 002/002 Kecamatan Songgom Kabupaten Brebes', '123456789', '08975018627', '2401-001', '2024-01-07 08:14:07', '2024-01-07 08:14:07'),
(2, 'Andayani', 'Semarang', '567890', '08975018620', '2401-002', '2024-01-07 08:33:56', '2024-01-07 08:33:56'),
(3, 'Amalia', 'Songgom', '123456', '08975018629', '2401-003', '2024-01-07 08:38:02', '2024-01-07 08:38:02'),
(4, 'Andayani', 'SEmarang', '456789', '08975018625', '2401-004', '2024-01-07 08:38:47', '2024-01-07 08:38:47'),
(5, 'Amalia Andayani', 'Brebes', '12345678910', '08975018629', '2401-005', '2024-01-07 08:39:38', '2024-01-07 08:39:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `periksas`
--

CREATE TABLE `periksas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_daftar_poli` bigint(20) UNSIGNED NOT NULL,
  `tgl_periksa` date NOT NULL,
  `biaya` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `periksas`
--

INSERT INTO `periksas` (`id`, `id_daftar_poli`, `tgl_periksa`, `biaya`, `created_at`, `updated_at`, `catatan`) VALUES
(2, 2, '2024-01-13', 306000, '2024-01-07 08:42:07', '2024-01-07 08:42:07', 'pcd'),
(3, 3, '2024-01-11', 228000, '2024-01-07 08:42:39', '2024-01-07 08:42:39', 'Tidak ada'),
(4, 4, '2024-01-11', 202000, '2024-01-07 08:43:15', '2024-01-07 08:43:15', 'Tidak ada');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `polis`
--

CREATE TABLE `polis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_poli` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `polis`
--

INSERT INTO `polis` (`id`, `nama_poli`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Poli Umum', 'memberikan pelayanan kedokteran berupa pemeriksaan kesehatan, pengobatan dan penyuluhan kepada pasien atau masyarakat.', NULL, '2024-01-07 08:19:10'),
(2, 'Poli Gizi', 'memberikan saran dan informasi kepada pasien tentang penatalaksanaan gizi dan masalah kesehatan, terlibat dalam diagnosis dan pengobatan masalah kesehatan yang terkait gizi dan nutrisi', NULL, '2024-01-07 08:23:47'),
(3, 'Poli Kandungan', 'membantu pasien dengan kasus yang berhubungan dengan kehamilan dan penyakit kandungan serta didukung beberapa dokter spesialis kebidanan dan penyakit kandungan', NULL, '2024-01-07 08:24:28'),
(4, 'Poli Gigi', 'pelayanan kesehatan gigi dan mulut berupa pemeriksaan kesehatan gigi dan mulut dan pengobatan.', NULL, '2024-01-07 08:25:40'),
(5, 'Poli Sepesial Paru', 'poliklinik yang menyediakan layanan kesehatan untuk masalah pernapasan, seperti asma, bronkitis, pneumonia, emfisema, dan penyakit paru obstruktif kronis (PPOK)', '2024-01-07 08:26:26', '2024-01-07 08:26:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_pengguna` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama_pengguna`, `username`, `password`, `no_hp`, `no_ktp`, `alamat`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'putriadmin', 'putriamalia', '$2y$10$PQO3BPn5jkCsG7L3hpFzDu9M70B3JSH7em/FCrDEVSOg9qvbbsfa2', '08975018627', '987654321', 'Jl. Pancasakti, Semarang No. 81', 'admin', NULL, NULL, NULL),
(2, 'putridokter', 'putriandayani', '$2y$10$cbFYiVwvoRhlyuPgxpn4secOSm3UquLSQN7fqxDzHwVkCl609xeti', '08975018622', '567891234', 'Jl. Melati, Semarang No. 18', 'dokter', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daftar_polis`
--
ALTER TABLE `daftar_polis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daftar_polis_id_pasien_foreign` (`id_pasien`),
  ADD KEY `daftar_polis_id_jadwal_foreign` (`id_jadwal`);

--
-- Indeks untuk tabel `detail_periksas`
--
ALTER TABLE `detail_periksas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_periksas_id_periksa_foreign` (`id_periksa`),
  ADD KEY `detail_periksas_id_obat_foreign` (`id_obat`);

--
-- Indeks untuk tabel `dokters`
--
ALTER TABLE `dokters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokters_id_poli_foreign` (`id_poli`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwals_id_dokter_foreign` (`id_dokter`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `obats`
--
ALTER TABLE `obats`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasiens`
--
ALTER TABLE `pasiens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pasiens_no_ktp_unique` (`no_ktp`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `periksas`
--
ALTER TABLE `periksas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periksas_id_daftar_poli_foreign` (`id_daftar_poli`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `polis`
--
ALTER TABLE `polis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `daftar_polis`
--
ALTER TABLE `daftar_polis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `detail_periksas`
--
ALTER TABLE `detail_periksas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `dokters`
--
ALTER TABLE `dokters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `obats`
--
ALTER TABLE `obats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pasiens`
--
ALTER TABLE `pasiens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `periksas`
--
ALTER TABLE `periksas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `polis`
--
ALTER TABLE `polis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `daftar_polis`
--
ALTER TABLE `daftar_polis`
  ADD CONSTRAINT `daftar_polis_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daftar_polis_id_pasien_foreign` FOREIGN KEY (`id_pasien`) REFERENCES `pasiens` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_periksas`
--
ALTER TABLE `detail_periksas`
  ADD CONSTRAINT `detail_periksas_id_obat_foreign` FOREIGN KEY (`id_obat`) REFERENCES `obats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_periksas_id_periksa_foreign` FOREIGN KEY (`id_periksa`) REFERENCES `periksas` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `dokters`
--
ALTER TABLE `dokters`
  ADD CONSTRAINT `dokters_id_poli_foreign` FOREIGN KEY (`id_poli`) REFERENCES `polis` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  ADD CONSTRAINT `jadwals_id_dokter_foreign` FOREIGN KEY (`id_dokter`) REFERENCES `dokters` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `periksas`
--
ALTER TABLE `periksas`
  ADD CONSTRAINT `periksas_id_daftar_poli_foreign` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_polis` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
