-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 21, 2025 lúc 08:58 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL DEFAULT 'primary',
  `icon` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `slug`, `color`, `icon`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Action', 'Thể loại Action', 'action', 'primary', 'fas fa-fist-raised', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(2, 'Adult', 'Thể loại Adult', 'adult', 'danger', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(3, 'Adventure', 'Thể loại Adventure', 'adventure', 'secondary', 'fas fa-compass', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(4, 'Anime', 'Thể loại Anime', 'anime', 'info', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(5, 'Chuyển Sinh', 'Thể loại Chuyển Sinh', 'chuyen-sinh', 'warning', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(6, 'Comedy', 'Thể loại Comedy', 'comedy', 'danger', 'fas fa-laugh', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(7, 'Comic', 'Thể loại Comic', 'comic', 'primary', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(8, 'Cooking', 'Thể loại Cooking', 'cooking', 'danger', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(9, 'Cổ Đại', 'Thể loại Cổ Đại', 'co-dai', 'warning', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(10, 'Doujinshi', 'Thể loại Doujinshi', 'doujinshi', 'success', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(11, 'Drama', 'Thể loại Drama', 'drama', 'warning', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(12, 'Đam Mỹ', 'Thể loại Đam Mỹ', 'dam-my', 'danger', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(13, 'Ecchi', 'Thể loại Ecchi', 'ecchi', 'warning', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(14, 'Fantasy', 'Thể loại Fantasy', 'fantasy', 'warning', 'fas fa-magic', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(15, 'Gender Bender', 'Thể loại Gender Bender', 'gender-bender', 'info', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(16, 'Harem', 'Thể loại Harem', 'harem', 'secondary', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(17, 'Historical', 'Thể loại Historical', 'historical', 'warning', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(18, 'Horror', 'Thể loại Horror', 'horror', 'warning', 'fas fa-ghost', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(19, 'Josei', 'Thể loại Josei', 'josei', 'primary', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33'),
(20, 'Live action', 'Thể loại Live action', 'live-action', 'success', 'fas fa-tag', 1, '2025-08-20 21:50:33', '2025-08-20 21:50:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_novel`
--

CREATE TABLE `category_novel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `novel_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chapters`
--

CREATE TABLE `chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `is_comic` tinyint(1) NOT NULL DEFAULT 0,
  `comic_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`comic_images`)),
  `comic_source` varchar(255) DEFAULT NULL,
  `chapter_number` int(11) NOT NULL,
  `novel_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `word_count` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chapters`
--

INSERT INTO `chapters` (`id`, `title`, `content`, `is_comic`, `comic_images`, `comic_source`, `chapter_number`, `novel_id`, `author_id`, `word_count`, `views`, `is_published`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 1 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 1, 1, 1, 1503, 196, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:54'),
(2, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 2 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 2, 1, 1, 3198, 256, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(3, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 3 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 3, 1, 1, 4992, 80, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(4, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 4 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 4, 1, 1, 2707, 405, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(5, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 5 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 5, 1, 1, 3816, 399, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(6, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 6 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 6, 1, 1, 2145, 348, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:25:30'),
(7, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 7 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 7, 1, 1, 4235, 344, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(8, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 8 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 8, 1, 1, 4082, 331, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(9, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 9 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 9, 1, 1, 1691, 315, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(10, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 10 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 10, 1, 1, 3220, 418, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(11, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 11 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 11, 1, 1, 4738, 319, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(12, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 12 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 12, 1, 1, 1083, 391, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(13, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 13 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 13, 1, 1, 2212, 220, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(14, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 14 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 14, 1, 1, 4669, 340, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(15, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 15 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 15, 1, 1, 1853, 216, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(16, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 16 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 16, 1, 1, 3460, 207, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(17, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 17 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 17, 1, 1, 3096, 174, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(18, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 18 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 18, 1, 1, 3623, 412, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(19, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 19 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 19, 1, 1, 4775, 120, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(20, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 20 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 20, 1, 1, 1985, 326, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(21, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 21 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 21, 1, 1, 2700, 281, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(22, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 22 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 22, 1, 1, 3688, 435, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(23, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 23 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 23, 1, 1, 4226, 482, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(24, 'Zenbu Kimi No Sei [Chap 1-24]', 'Nội dung chương 24 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 24, 1, 1, 3606, 231, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(25, 'Zenbu Kimi No Sei [Chap 24.5]', 'Nội dung chương 24.5 của truyện Zenbu Kimi No Sei', 0, NULL, NULL, 25, 1, 1, 3843, 228, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(27, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 1 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 1, 2, 1, 2652, 444, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(28, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 2 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 2, 2, 1, 1956, 146, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(29, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 3 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 3, 2, 1, 3026, 312, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(30, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 4 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 4, 2, 1, 3013, 420, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(31, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 5 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 5, 2, 1, 4736, 379, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(32, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 6 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 6, 2, 1, 1551, 223, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(33, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 7 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 7, 2, 1, 1363, 136, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(34, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 8 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 8, 2, 1, 2131, 391, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(35, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 9 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 9, 2, 1, 2201, 382, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(36, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 10 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 10, 2, 1, 4581, 74, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(37, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 11 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 11, 2, 1, 1179, 322, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:48:00'),
(38, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 12 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 12, 2, 1, 3761, 378, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(39, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 13 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 13, 2, 1, 4079, 75, 1, '2025-08-20 22:06:39', '2025-08-20 22:06:39', '2025-08-20 22:06:39'),
(40, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 14 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 14, 2, 1, 2590, 96, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(41, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 15 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 15, 2, 1, 3394, 284, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(42, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 16 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 16, 2, 1, 3178, 428, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(43, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 17 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 17, 2, 1, 3171, 99, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(44, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 18 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 18, 2, 1, 1511, 219, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(45, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 19 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 19, 2, 1, 4164, 181, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(46, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 20 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 20, 2, 1, 4572, 218, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(47, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 21 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 21, 2, 1, 1805, 180, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(48, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 22 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 22, 2, 1, 2439, 491, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(49, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 23 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 23, 2, 1, 4578, 115, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(50, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 24 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 24, 2, 1, 1691, 413, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(51, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 25 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 25, 2, 1, 4123, 370, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(52, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 26 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 26, 2, 1, 1820, 248, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(53, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 27 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 27, 2, 1, 2144, 80, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(54, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 28 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 28, 2, 1, 3928, 369, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(55, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 29 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 29, 2, 1, 1419, 390, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(56, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 30 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 30, 2, 1, 2757, 448, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(57, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 31 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 31, 2, 1, 3751, 194, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(58, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 32 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 32, 2, 1, 1867, 348, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(59, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 33 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 33, 2, 1, 1204, 339, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(60, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 34 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 34, 2, 1, 3073, 428, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(61, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 35 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 35, 2, 1, 2932, 83, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(62, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 36 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 36, 2, 1, 4680, 233, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(63, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 37 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 37, 2, 1, 4260, 76, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(64, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 38 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 38, 2, 1, 4084, 266, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(65, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 39 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 39, 2, 1, 1647, 269, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(66, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 40 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 40, 2, 1, 3435, 89, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(67, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 41 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 41, 2, 1, 2136, 441, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(68, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 42 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 42, 2, 1, 2991, 231, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(69, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 1-43]', 'Nội dung chương 43 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 43, 2, 1, 4312, 55, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(70, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 44-45]', 'Nội dung chương 44 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 44, 2, 1, 2416, 432, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(71, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 44-45]', 'Nội dung chương 45 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 45, 2, 1, 1505, 63, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(72, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 46]', 'Nội dung chương 46 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 46, 2, 1, 4141, 94, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(73, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 47]', 'Nội dung chương 47 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 47, 2, 1, 2008, 96, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(74, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 48-49]', 'Nội dung chương 48 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 48, 2, 1, 1378, 353, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(75, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 48-49]', 'Nội dung chương 49 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 49, 2, 1, 4823, 221, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(76, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 50-51]', 'Nội dung chương 50 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 50, 2, 1, 3696, 159, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(77, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 50-51]', 'Nội dung chương 51 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 51, 2, 1, 4643, 411, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(78, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 52-56]', 'Nội dung chương 52 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 52, 2, 1, 3595, 289, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(79, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 52-56]', 'Nội dung chương 53 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 53, 2, 1, 3009, 492, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(80, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 52-56]', 'Nội dung chương 54 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 54, 2, 1, 4772, 418, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(81, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 52-56]', 'Nội dung chương 55 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 55, 2, 1, 3031, 272, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(82, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 52-56]', 'Nội dung chương 56 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 56, 2, 1, 2470, 406, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(83, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 57-68]', 'Nội dung chương 57 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 57, 2, 1, 2329, 241, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(84, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 57-68]', 'Nội dung chương 58 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 58, 2, 1, 1791, 188, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(85, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 57-68]', 'Nội dung chương 59 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 59, 2, 1, 2134, 68, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(86, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện [Chap 57-68]', 'Nội dung chương 60 của truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 0, NULL, NULL, 60, 2, 1, 3099, 326, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:34:43'),
(88, 'Xích Tâm Tuần Thiên [Chap 1-11]', 'Nội dung chương 1 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 1, 3, 1, 1913, 409, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:13:19'),
(89, 'Xích Tâm Tuần Thiên [Chap 1-11]', 'Nội dung chương 2 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 2, 3, 1, 2684, 241, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(90, 'Xích Tâm Tuần Thiên [Chap 1-11]', 'Nội dung chương 3 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 3, 3, 1, 4494, 465, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(91, 'Xích Tâm Tuần Thiên [Chap 1-11]', 'Nội dung chương 4 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 4, 3, 1, 4613, 204, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(92, 'Xích Tâm Tuần Thiên [Chap 1-11]', 'Nội dung chương 5 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 5, 3, 1, 4709, 66, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(93, 'Xích Tâm Tuần Thiên [Chap 1-11]', 'Nội dung chương 6 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 6, 3, 1, 4168, 105, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(94, 'Xích Tâm Tuần Thiên [Chap 1-11]', 'Nội dung chương 7 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 7, 3, 1, 2390, 97, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(95, 'Xích Tâm Tuần Thiên [Chap 1-11]', 'Nội dung chương 8 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 8, 3, 1, 3543, 161, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(96, 'Xích Tâm Tuần Thiên [Chap 1-11]', 'Nội dung chương 9 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 9, 3, 1, 3949, 223, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(97, 'Xích Tâm Tuần Thiên [Chap 1-11]', 'Nội dung chương 10 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 10, 3, 1, 1020, 98, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(98, 'Xích Tâm Tuần Thiên [Chap 1-11]', 'Nội dung chương 11 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 11, 3, 1, 3739, 314, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(99, 'Xích Tâm Tuần Thiên [Chap 12]', 'Nội dung chương 12 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 12, 3, 1, 3374, 194, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(100, 'Xích Tâm Tuần Thiên [Chap 13-14.9]', 'Nội dung chương 13 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 13, 3, 1, 4391, 296, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(101, 'Xích Tâm Tuần Thiên [Chap 13-14.9]', 'Nội dung chương 14 của truyện Xích Tâm Tuần Thiên', 0, NULL, NULL, 14, 3, 1, 3540, 123, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:25:15'),
(103, 'Xi Hồn [Chap 1-3]', 'Nội dung chương 1 của truyện Xi Hồn', 0, NULL, NULL, 1, 4, 1, 3633, 111, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(104, 'Xi Hồn [Chap 1-3]', 'Nội dung chương 2 của truyện Xi Hồn', 0, NULL, NULL, 2, 4, 1, 3812, 129, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(105, 'Xi Hồn [Chap 1-3]', 'Nội dung chương 3 của truyện Xi Hồn', 0, NULL, NULL, 3, 4, 1, 1894, 302, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(106, 'Xi Hồn [Chap 4-6]', 'Nội dung chương 4 của truyện Xi Hồn', 0, NULL, NULL, 4, 4, 1, 1226, 252, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(107, 'Xi Hồn [Chap 4-6]', 'Nội dung chương 5 của truyện Xi Hồn', 0, NULL, NULL, 5, 4, 1, 1937, 134, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(108, 'Xi Hồn [Chap 4-6]', 'Nội dung chương 6 của truyện Xi Hồn', 0, NULL, NULL, 6, 4, 1, 1919, 475, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(109, 'Xi Hồn [Chap 7]', 'Nội dung chương 7 của truyện Xi Hồn', 0, NULL, NULL, 7, 4, 1, 1800, 299, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(110, 'Xi Hồn [Chap 8-9]', 'Nội dung chương 8 của truyện Xi Hồn', 0, NULL, NULL, 8, 4, 1, 4340, 253, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(111, 'Xi Hồn [Chap 8-9]', 'Nội dung chương 9 của truyện Xi Hồn', 0, NULL, NULL, 9, 4, 1, 4223, 190, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(112, 'Xi Hồn [Chap 10]', 'Nội dung chương 10 của truyện Xi Hồn', 0, NULL, NULL, 10, 4, 1, 4979, 143, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(113, 'Xi Hồn [Chap 11]', 'Nội dung chương 11 của truyện Xi Hồn', 0, NULL, NULL, 11, 4, 1, 3187, 460, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(114, 'Xi Hồn [Chap 12-15]', 'Nội dung chương 12 của truyện Xi Hồn', 0, NULL, NULL, 12, 4, 1, 4758, 341, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(115, 'Xi Hồn [Chap 12-15]', 'Nội dung chương 13 của truyện Xi Hồn', 0, NULL, NULL, 13, 4, 1, 4058, 452, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(116, 'Xi Hồn [Chap 12-15]', 'Nội dung chương 14 của truyện Xi Hồn', 0, NULL, NULL, 14, 4, 1, 1909, 99, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(117, 'Xi Hồn [Chap 12-15]', 'Nội dung chương 15 của truyện Xi Hồn', 0, NULL, NULL, 15, 4, 1, 4248, 271, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(118, 'Xi Hồn [Chap 16]', 'Nội dung chương 16 của truyện Xi Hồn', 0, NULL, NULL, 16, 4, 1, 2396, 390, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(119, 'Xi Hồn [Chap 17]', 'Nội dung chương 17 của truyện Xi Hồn', 0, NULL, NULL, 17, 4, 1, 4371, 324, 1, '2025-08-20 22:06:40', '2025-08-20 22:06:40', '2025-08-20 22:06:40'),
(120, 'Xi Hồn [Chap 18]', 'Nội dung chương 18 của truyện Xi Hồn', 0, NULL, NULL, 18, 4, 1, 2887, 263, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(121, 'Xi Hồn [Chap 19]', 'Nội dung chương 19 của truyện Xi Hồn', 0, NULL, NULL, 19, 4, 1, 4247, 136, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(122, 'Xi Hồn [Chap 20]', 'Nội dung chương 20 của truyện Xi Hồn', 0, NULL, NULL, 20, 4, 1, 3950, 273, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(123, 'Xi Hồn [Chap 21]', 'Nội dung chương 21 của truyện Xi Hồn', 0, NULL, NULL, 21, 4, 1, 2736, 442, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(124, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 22 của truyện Xi Hồn', 0, NULL, NULL, 22, 4, 1, 4735, 138, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(125, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 23 của truyện Xi Hồn', 0, NULL, NULL, 23, 4, 1, 1070, 288, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(126, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 24 của truyện Xi Hồn', 0, NULL, NULL, 24, 4, 1, 3621, 488, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(127, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 25 của truyện Xi Hồn', 0, NULL, NULL, 25, 4, 1, 4475, 255, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(128, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 26 của truyện Xi Hồn', 0, NULL, NULL, 26, 4, 1, 1407, 338, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(129, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 27 của truyện Xi Hồn', 0, NULL, NULL, 27, 4, 1, 3983, 483, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(130, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 28 của truyện Xi Hồn', 0, NULL, NULL, 28, 4, 1, 3948, 118, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(131, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 29 của truyện Xi Hồn', 0, NULL, NULL, 29, 4, 1, 2275, 431, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(132, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 30 của truyện Xi Hồn', 0, NULL, NULL, 30, 4, 1, 2779, 162, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(133, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 31 của truyện Xi Hồn', 0, NULL, NULL, 31, 4, 1, 4767, 101, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(134, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 32 của truyện Xi Hồn', 0, NULL, NULL, 32, 4, 1, 2529, 146, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(135, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 33 của truyện Xi Hồn', 0, NULL, NULL, 33, 4, 1, 2983, 404, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(136, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 34 của truyện Xi Hồn', 0, NULL, NULL, 34, 4, 1, 4368, 214, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(137, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 35 của truyện Xi Hồn', 0, NULL, NULL, 35, 4, 1, 1010, 370, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(138, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 36 của truyện Xi Hồn', 0, NULL, NULL, 36, 4, 1, 3322, 148, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(139, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 37 của truyện Xi Hồn', 0, NULL, NULL, 37, 4, 1, 2910, 464, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(140, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 38 của truyện Xi Hồn', 0, NULL, NULL, 38, 4, 1, 1943, 158, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(141, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 39 của truyện Xi Hồn', 0, NULL, NULL, 39, 4, 1, 3847, 105, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(142, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 40 của truyện Xi Hồn', 0, NULL, NULL, 40, 4, 1, 2388, 445, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(143, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 41 của truyện Xi Hồn', 0, NULL, NULL, 41, 4, 1, 4582, 399, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(144, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 42 của truyện Xi Hồn', 0, NULL, NULL, 42, 4, 1, 3917, 136, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(145, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 43 của truyện Xi Hồn', 0, NULL, NULL, 43, 4, 1, 2088, 131, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(146, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 44 của truyện Xi Hồn', 0, NULL, NULL, 44, 4, 1, 2467, 241, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(147, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 45 của truyện Xi Hồn', 0, NULL, NULL, 45, 4, 1, 4858, 86, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(148, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 46 của truyện Xi Hồn', 0, NULL, NULL, 46, 4, 1, 2009, 463, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(149, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 47 của truyện Xi Hồn', 0, NULL, NULL, 47, 4, 1, 3772, 468, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(150, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 48 của truyện Xi Hồn', 0, NULL, NULL, 48, 4, 1, 4545, 339, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(151, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 49 của truyện Xi Hồn', 0, NULL, NULL, 49, 4, 1, 3339, 204, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(152, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 50 của truyện Xi Hồn', 0, NULL, NULL, 50, 4, 1, 1717, 166, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(153, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 51 của truyện Xi Hồn', 0, NULL, NULL, 51, 4, 1, 3820, 294, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(154, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 52 của truyện Xi Hồn', 0, NULL, NULL, 52, 4, 1, 2488, 151, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(155, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 53 của truyện Xi Hồn', 0, NULL, NULL, 53, 4, 1, 3205, 120, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(156, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 54 của truyện Xi Hồn', 0, NULL, NULL, 54, 4, 1, 1624, 234, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(157, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 55 của truyện Xi Hồn', 0, NULL, NULL, 55, 4, 1, 4718, 321, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(158, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 56 của truyện Xi Hồn', 0, NULL, NULL, 56, 4, 1, 2572, 457, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(159, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 57 của truyện Xi Hồn', 0, NULL, NULL, 57, 4, 1, 3219, 201, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(160, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 58 của truyện Xi Hồn', 0, NULL, NULL, 58, 4, 1, 2685, 401, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(161, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 59 của truyện Xi Hồn', 0, NULL, NULL, 59, 4, 1, 3660, 406, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(162, 'Xi Hồn [Chap 22-60]', 'Nội dung chương 60 của truyện Xi Hồn', 0, NULL, NULL, 60, 4, 1, 2007, 473, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(163, 'Xi Hồn [Chap 61]', 'Nội dung chương 61 của truyện Xi Hồn', 0, NULL, NULL, 61, 4, 1, 3747, 51, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(164, 'Xi Hồn [Chap 62]', 'Nội dung chương 62 của truyện Xi Hồn', 0, NULL, NULL, 62, 4, 1, 3096, 147, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(165, 'Xi Hồn [Chap 63]', 'Nội dung chương 63 của truyện Xi Hồn', 0, NULL, NULL, 63, 4, 1, 3356, 99, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(166, 'Xi Hồn [Chap 64]', 'Nội dung chương 64 của truyện Xi Hồn', 0, NULL, NULL, 64, 4, 1, 4236, 343, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(167, 'Xi Hồn [Chap 65-73]', 'Nội dung chương 65 của truyện Xi Hồn', 0, NULL, NULL, 65, 4, 1, 2551, 487, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(168, 'Xi Hồn [Chap 65-73]', 'Nội dung chương 66 của truyện Xi Hồn', 0, NULL, NULL, 66, 4, 1, 2308, 215, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(169, 'Xi Hồn [Chap 65-73]', 'Nội dung chương 67 của truyện Xi Hồn', 0, NULL, NULL, 67, 4, 1, 4034, 358, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(170, 'Xi Hồn [Chap 65-73]', 'Nội dung chương 68 của truyện Xi Hồn', 0, NULL, NULL, 68, 4, 1, 1933, 69, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(171, 'Xi Hồn [Chap 65-73]', 'Nội dung chương 69 của truyện Xi Hồn', 0, NULL, NULL, 69, 4, 1, 4244, 278, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(172, 'Xi Hồn [Chap 65-73]', 'Nội dung chương 70 của truyện Xi Hồn', 0, NULL, NULL, 70, 4, 1, 1106, 52, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(173, 'Xi Hồn [Chap 65-73]', 'Nội dung chương 71 của truyện Xi Hồn', 0, NULL, NULL, 71, 4, 1, 3886, 123, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(174, 'Xi Hồn [Chap 65-73]', 'Nội dung chương 72 của truyện Xi Hồn', 0, NULL, NULL, 72, 4, 1, 1201, 348, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(175, 'Xi Hồn [Chap 65-73]', 'Nội dung chương 73 của truyện Xi Hồn', 0, NULL, NULL, 73, 4, 1, 2017, 144, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(176, 'Xi Hồn [Chap 74-80]', 'Nội dung chương 74 của truyện Xi Hồn', 0, NULL, NULL, 74, 4, 1, 4632, 271, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(177, 'Xi Hồn [Chap 74-80]', 'Nội dung chương 75 của truyện Xi Hồn', 0, NULL, NULL, 75, 4, 1, 1114, 198, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(178, 'Xi Hồn [Chap 74-80]', 'Nội dung chương 76 của truyện Xi Hồn', 0, NULL, NULL, 76, 4, 1, 3368, 198, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(179, 'Xi Hồn [Chap 74-80]', 'Nội dung chương 77 của truyện Xi Hồn', 0, NULL, NULL, 77, 4, 1, 4573, 311, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(180, 'Xi Hồn [Chap 74-80]', 'Nội dung chương 78 của truyện Xi Hồn', 0, NULL, NULL, 78, 4, 1, 2869, 185, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(181, 'Xi Hồn [Chap 74-80]', 'Nội dung chương 79 của truyện Xi Hồn', 0, NULL, NULL, 79, 4, 1, 2707, 489, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:06:41'),
(182, 'Xi Hồn [Chap 74-80]', 'Đây là nội dung text dự phòng cho truyện comic. Hình ảnh sẽ được hiển thị ở trên.', 1, '[\"https:\\/\\/via.placeholder.com\\/800x1200\\/FF6B6B\\/FFFFFF?text=Trang+1\",\"https:\\/\\/via.placeholder.com\\/800x1200\\/4ECDC4\\/FFFFFF?text=Trang+2\",\"https:\\/\\/via.placeholder.com\\/800x1200\\/45B7D1\\/FFFFFF?text=Trang+3\",\"https:\\/\\/via.placeholder.com\\/800x1200\\/96CEB4\\/FFFFFF?text=Trang+4\",\"https:\\/\\/via.placeholder.com\\/800x1200\\/FFEAA7\\/FFFFFF?text=Trang+5\"]', 'sample', 80, 4, 1, 5, 406, 1, '2025-08-20 22:06:41', '2025-08-20 22:06:41', '2025-08-20 22:35:23'),
(183, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 1 của truyện Wind Breaker', 0, NULL, NULL, 1, 5, 1, 2956, 474, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:09:09'),
(184, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 2 của truyện Wind Breaker', 0, NULL, NULL, 2, 5, 1, 4278, 327, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(185, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 3 của truyện Wind Breaker', 0, NULL, NULL, 3, 5, 1, 4960, 54, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(186, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 4 của truyện Wind Breaker', 0, NULL, NULL, 4, 5, 1, 1567, 293, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(187, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 5 của truyện Wind Breaker', 0, NULL, NULL, 5, 5, 1, 3647, 56, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(188, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 6 của truyện Wind Breaker', 0, NULL, NULL, 6, 5, 1, 3251, 473, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(189, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 7 của truyện Wind Breaker', 0, NULL, NULL, 7, 5, 1, 3701, 267, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:26:31'),
(190, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 8 của truyện Wind Breaker', 0, NULL, NULL, 8, 5, 1, 2732, 278, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:26:35'),
(191, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 9 của truyện Wind Breaker', 0, NULL, NULL, 9, 5, 1, 3795, 177, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:26:36'),
(192, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 10 của truyện Wind Breaker', 0, NULL, NULL, 10, 5, 1, 2670, 219, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:26:37'),
(193, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 11 của truyện Wind Breaker', 0, NULL, NULL, 11, 5, 1, 2065, 169, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:26:38'),
(194, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 12 của truyện Wind Breaker', 0, NULL, NULL, 12, 5, 1, 4676, 376, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:26:39'),
(195, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 13 của truyện Wind Breaker', 0, NULL, NULL, 13, 5, 1, 4091, 303, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(196, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 14 của truyện Wind Breaker', 0, NULL, NULL, 14, 5, 1, 3938, 113, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(197, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 15 của truyện Wind Breaker', 0, NULL, NULL, 15, 5, 1, 4920, 319, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(198, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 16 của truyện Wind Breaker', 0, NULL, NULL, 16, 5, 1, 4926, 155, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(199, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 17 của truyện Wind Breaker', 0, NULL, NULL, 17, 5, 1, 3374, 449, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(200, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 18 của truyện Wind Breaker', 0, NULL, NULL, 18, 5, 1, 1673, 455, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(201, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 19 của truyện Wind Breaker', 0, NULL, NULL, 19, 5, 1, 4910, 97, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(202, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 20 của truyện Wind Breaker', 0, NULL, NULL, 20, 5, 1, 4699, 310, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(203, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 21 của truyện Wind Breaker', 0, NULL, NULL, 21, 5, 1, 4965, 450, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(204, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 22 của truyện Wind Breaker', 0, NULL, NULL, 22, 5, 1, 1784, 281, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(205, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 23 của truyện Wind Breaker', 0, NULL, NULL, 23, 5, 1, 1894, 93, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(206, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 24 của truyện Wind Breaker', 0, NULL, NULL, 24, 5, 1, 4236, 306, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(207, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 25 của truyện Wind Breaker', 0, NULL, NULL, 25, 5, 1, 2444, 225, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(208, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 26 của truyện Wind Breaker', 0, NULL, NULL, 26, 5, 1, 4040, 402, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(209, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 27 của truyện Wind Breaker', 0, NULL, NULL, 27, 5, 1, 4837, 397, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(210, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 28 của truyện Wind Breaker', 0, NULL, NULL, 28, 5, 1, 2542, 385, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(211, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 29 của truyện Wind Breaker', 0, NULL, NULL, 29, 5, 1, 1053, 341, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(212, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 30 của truyện Wind Breaker', 0, NULL, NULL, 30, 5, 1, 2611, 497, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(213, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 31 của truyện Wind Breaker', 0, NULL, NULL, 31, 5, 1, 2470, 176, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(214, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 32 của truyện Wind Breaker', 0, NULL, NULL, 32, 5, 1, 2052, 369, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(215, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 33 của truyện Wind Breaker', 0, NULL, NULL, 33, 5, 1, 3432, 223, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(216, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 34 của truyện Wind Breaker', 0, NULL, NULL, 34, 5, 1, 2942, 396, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(217, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 35 của truyện Wind Breaker', 0, NULL, NULL, 35, 5, 1, 3836, 469, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(218, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 36 của truyện Wind Breaker', 0, NULL, NULL, 36, 5, 1, 3512, 443, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(219, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 37 của truyện Wind Breaker', 0, NULL, NULL, 37, 5, 1, 4185, 135, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(220, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 38 của truyện Wind Breaker', 0, NULL, NULL, 38, 5, 1, 2713, 364, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(221, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 39 của truyện Wind Breaker', 0, NULL, NULL, 39, 5, 1, 3169, 226, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(222, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 40 của truyện Wind Breaker', 0, NULL, NULL, 40, 5, 1, 1837, 235, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(223, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 41 của truyện Wind Breaker', 0, NULL, NULL, 41, 5, 1, 1003, 111, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(224, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 42 của truyện Wind Breaker', 0, NULL, NULL, 42, 5, 1, 1807, 195, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(225, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 43 của truyện Wind Breaker', 0, NULL, NULL, 43, 5, 1, 3804, 136, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(226, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 44 của truyện Wind Breaker', 0, NULL, NULL, 44, 5, 1, 3832, 307, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(227, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 45 của truyện Wind Breaker', 0, NULL, NULL, 45, 5, 1, 3562, 436, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(228, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 46 của truyện Wind Breaker', 0, NULL, NULL, 46, 5, 1, 4570, 199, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(229, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 47 của truyện Wind Breaker', 0, NULL, NULL, 47, 5, 1, 1542, 410, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(230, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 48 của truyện Wind Breaker', 0, NULL, NULL, 48, 5, 1, 4922, 114, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(231, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 49 của truyện Wind Breaker', 0, NULL, NULL, 49, 5, 1, 3601, 323, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(232, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 50 của truyện Wind Breaker', 0, NULL, NULL, 50, 5, 1, 2417, 174, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(233, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 51 của truyện Wind Breaker', 0, NULL, NULL, 51, 5, 1, 3042, 74, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(234, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 52 của truyện Wind Breaker', 0, NULL, NULL, 52, 5, 1, 3753, 88, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(235, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 53 của truyện Wind Breaker', 0, NULL, NULL, 53, 5, 1, 1506, 486, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(236, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 54 của truyện Wind Breaker', 0, NULL, NULL, 54, 5, 1, 4764, 495, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(237, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 55 của truyện Wind Breaker', 0, NULL, NULL, 55, 5, 1, 3763, 383, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(238, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 56 của truyện Wind Breaker', 0, NULL, NULL, 56, 5, 1, 1479, 251, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(239, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 57 của truyện Wind Breaker', 0, NULL, NULL, 57, 5, 1, 3186, 190, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(240, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 58 của truyện Wind Breaker', 0, NULL, NULL, 58, 5, 1, 2815, 73, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(241, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 59 của truyện Wind Breaker', 0, NULL, NULL, 59, 5, 1, 3028, 204, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(242, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 60 của truyện Wind Breaker', 0, NULL, NULL, 60, 5, 1, 2747, 132, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(243, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 61 của truyện Wind Breaker', 0, NULL, NULL, 61, 5, 1, 1025, 270, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(244, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 62 của truyện Wind Breaker', 0, NULL, NULL, 62, 5, 1, 2073, 497, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(245, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 63 của truyện Wind Breaker', 0, NULL, NULL, 63, 5, 1, 4940, 353, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(246, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 64 của truyện Wind Breaker', 0, NULL, NULL, 64, 5, 1, 1998, 224, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(247, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 65 của truyện Wind Breaker', 0, NULL, NULL, 65, 5, 1, 3605, 208, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42');
INSERT INTO `chapters` (`id`, `title`, `content`, `is_comic`, `comic_images`, `comic_source`, `chapter_number`, `novel_id`, `author_id`, `word_count`, `views`, `is_published`, `published_at`, `created_at`, `updated_at`) VALUES
(248, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 66 của truyện Wind Breaker', 0, NULL, NULL, 66, 5, 1, 4266, 305, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(249, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 67 của truyện Wind Breaker', 0, NULL, NULL, 67, 5, 1, 1211, 114, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(250, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 68 của truyện Wind Breaker', 0, NULL, NULL, 68, 5, 1, 2551, 62, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(251, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 69 của truyện Wind Breaker', 0, NULL, NULL, 69, 5, 1, 3426, 122, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(252, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 70 của truyện Wind Breaker', 0, NULL, NULL, 70, 5, 1, 3137, 484, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(253, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 71 của truyện Wind Breaker', 0, NULL, NULL, 71, 5, 1, 4636, 177, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(254, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 72 của truyện Wind Breaker', 0, NULL, NULL, 72, 5, 1, 3596, 296, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(255, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 73 của truyện Wind Breaker', 0, NULL, NULL, 73, 5, 1, 2136, 317, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(256, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 74 của truyện Wind Breaker', 0, NULL, NULL, 74, 5, 1, 1143, 156, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(257, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 75 của truyện Wind Breaker', 0, NULL, NULL, 75, 5, 1, 1967, 280, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(258, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 76 của truyện Wind Breaker', 0, NULL, NULL, 76, 5, 1, 4011, 477, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(259, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 77 của truyện Wind Breaker', 0, NULL, NULL, 77, 5, 1, 4455, 464, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(260, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 78 của truyện Wind Breaker', 0, NULL, NULL, 78, 5, 1, 2972, 245, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(261, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 79 của truyện Wind Breaker', 0, NULL, NULL, 79, 5, 1, 2202, 405, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(262, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 80 của truyện Wind Breaker', 0, NULL, NULL, 80, 5, 1, 2830, 251, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(263, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 81 của truyện Wind Breaker', 0, NULL, NULL, 81, 5, 1, 2224, 113, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(264, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 82 của truyện Wind Breaker', 0, NULL, NULL, 82, 5, 1, 2748, 128, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(265, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 83 của truyện Wind Breaker', 0, NULL, NULL, 83, 5, 1, 4611, 334, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(266, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 84 của truyện Wind Breaker', 0, NULL, NULL, 84, 5, 1, 1542, 492, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(267, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 85 của truyện Wind Breaker', 0, NULL, NULL, 85, 5, 1, 3414, 257, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(268, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 86 của truyện Wind Breaker', 0, NULL, NULL, 86, 5, 1, 1917, 310, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(269, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 87 của truyện Wind Breaker', 0, NULL, NULL, 87, 5, 1, 2496, 373, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(270, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 88 của truyện Wind Breaker', 0, NULL, NULL, 88, 5, 1, 4328, 195, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(271, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 89 của truyện Wind Breaker', 0, NULL, NULL, 89, 5, 1, 3968, 482, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(272, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 90 của truyện Wind Breaker', 0, NULL, NULL, 90, 5, 1, 4227, 164, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(273, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 91 của truyện Wind Breaker', 0, NULL, NULL, 91, 5, 1, 2448, 308, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(274, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 92 của truyện Wind Breaker', 0, NULL, NULL, 92, 5, 1, 2361, 269, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(275, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 93 của truyện Wind Breaker', 0, NULL, NULL, 93, 5, 1, 2198, 146, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(276, 'Wind Breaker [Chap 1-94]', 'Nội dung chương 94 của truyện Wind Breaker', 0, NULL, NULL, 94, 5, 1, 4062, 418, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(277, 'Wind Breaker [Chap 95-96]', 'Nội dung chương 95 của truyện Wind Breaker', 0, NULL, NULL, 95, 5, 1, 2477, 146, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(278, 'Wind Breaker [Chap 95-96]', 'Nội dung chương 96 của truyện Wind Breaker', 0, NULL, NULL, 96, 5, 1, 3163, 117, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(279, 'Wind Breaker [Chap 97]', 'Nội dung chương 97 của truyện Wind Breaker', 0, NULL, NULL, 97, 5, 1, 2508, 253, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(280, 'Wind Breaker [Chap 98]', 'Nội dung chương 98 của truyện Wind Breaker', 0, NULL, NULL, 98, 5, 1, 2008, 264, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(281, 'Wind Breaker [Chap 99]', 'Nội dung chương 99 của truyện Wind Breaker', 0, NULL, NULL, 99, 5, 1, 3637, 168, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(282, 'Wind Breaker [Chap 100-100.5]', 'Nội dung chương 100 của truyện Wind Breaker', 0, NULL, NULL, 100, 5, 1, 3605, 83, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(283, 'Wind Breaker [Chap 101]', 'Nội dung chương 101 của truyện Wind Breaker', 0, NULL, NULL, 101, 5, 1, 3141, 415, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(284, 'Wind Breaker [Chap 102]', 'Nội dung chương 102 của truyện Wind Breaker', 0, NULL, NULL, 102, 5, 1, 1442, 463, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(285, 'Wind Breaker [Chap 103]', 'Nội dung chương 103 của truyện Wind Breaker', 0, NULL, NULL, 103, 5, 1, 4437, 202, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(286, 'Wind Breaker [Chap 104]', 'Nội dung chương 104 của truyện Wind Breaker', 0, NULL, NULL, 104, 5, 1, 4710, 53, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(287, 'Wind Breaker [Chap 105]', 'Nội dung chương 105 của truyện Wind Breaker', 0, NULL, NULL, 105, 5, 1, 3649, 415, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(288, 'Wind Breaker [Chap 106]', 'Nội dung chương 106 của truyện Wind Breaker', 0, NULL, NULL, 106, 5, 1, 3582, 252, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(289, 'Wind Breaker [Chap 107-109]', 'Nội dung chương 107 của truyện Wind Breaker', 0, NULL, NULL, 107, 5, 1, 4957, 128, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(290, 'Wind Breaker [Chap 107-109]', 'Nội dung chương 108 của truyện Wind Breaker', 0, NULL, NULL, 108, 5, 1, 1419, 158, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(291, 'Wind Breaker [Chap 107-109]', 'Nội dung chương 109 của truyện Wind Breaker', 0, NULL, NULL, 109, 5, 1, 4139, 363, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(292, 'Wind Breaker [Chap 110-111]', 'Nội dung chương 110 của truyện Wind Breaker', 0, NULL, NULL, 110, 5, 1, 3726, 215, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(293, 'Wind Breaker [Chap 110-111]', 'Nội dung chương 111 của truyện Wind Breaker', 0, NULL, NULL, 111, 5, 1, 3600, 130, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(294, 'Wind Breaker [Chap 112]', 'Nội dung chương 112 của truyện Wind Breaker', 0, NULL, NULL, 112, 5, 1, 1888, 293, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(295, 'Wind Breaker [Chap 113]', 'Nội dung chương 113 của truyện Wind Breaker', 0, NULL, NULL, 113, 5, 1, 1758, 300, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(296, 'Wind Breaker [Chap 114]', 'Nội dung chương 114 của truyện Wind Breaker', 0, NULL, NULL, 114, 5, 1, 1840, 270, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(297, 'Wind Breaker [Chap 115-117]', 'Nội dung chương 115 của truyện Wind Breaker', 0, NULL, NULL, 115, 5, 1, 4789, 148, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(298, 'Wind Breaker [Chap 115-117]', 'Nội dung chương 116 của truyện Wind Breaker', 0, NULL, NULL, 116, 5, 1, 4138, 342, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(299, 'Wind Breaker [Chap 115-117]', 'Nội dung chương 117 của truyện Wind Breaker', 0, NULL, NULL, 117, 5, 1, 4455, 177, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(300, 'Wind Breaker (Nii Satoru) [Chap 118]', 'Nội dung chương 118 của truyện Wind Breaker', 0, NULL, NULL, 118, 5, 1, 2331, 391, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(301, 'Wind Breaker (Nii Satoru) [Chap 118-119]', 'Nội dung chương 119 của truyện Wind Breaker', 0, NULL, NULL, 119, 5, 1, 4165, 397, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(302, 'Wind Breaker (Nii Satoru) [Chap 120]', 'Nội dung chương 120 của truyện Wind Breaker', 0, NULL, NULL, 120, 5, 1, 1592, 339, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(303, 'Wind Breaker (Nii Satoru) [Chap 120-121]', 'Nội dung chương 121 của truyện Wind Breaker', 0, NULL, NULL, 121, 5, 1, 1184, 329, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(304, 'Wind Breaker (Nii Satoru) [Chap 122]', 'Nội dung chương 122 của truyện Wind Breaker', 0, NULL, NULL, 122, 5, 1, 1172, 357, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(305, 'Wind Breaker (Nii Satoru) [Chap 122-123]', 'Nội dung chương 123 của truyện Wind Breaker', 0, NULL, NULL, 123, 5, 1, 2709, 270, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(306, 'Wind Breaker (Nii Satoru) [Chap 122-124]', 'Nội dung chương 124 của truyện Wind Breaker', 0, NULL, NULL, 124, 5, 1, 1403, 434, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(307, 'Wind Breaker (Nii Satoru) [Chap 125]', 'Nội dung chương 125 của truyện Wind Breaker', 0, NULL, NULL, 125, 5, 1, 1266, 477, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(308, 'Wind Breaker (Nii Satoru) [Chap 125-126]', 'Nội dung chương 126 của truyện Wind Breaker', 0, NULL, NULL, 126, 5, 1, 1493, 86, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(309, 'Wind Breaker (Nii Satoru) [Chap 125-127]', 'Nội dung chương 127 của truyện Wind Breaker', 0, NULL, NULL, 127, 5, 1, 2599, 138, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(310, 'Wind Breaker (Nii Satoru) [Chap 125-128]', 'Nội dung chương 128 của truyện Wind Breaker', 0, NULL, NULL, 128, 5, 1, 4186, 439, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(311, 'Wind Breaker (Nii Satoru) [Chap 125-130]', 'Nội dung chương 129 của truyện Wind Breaker', 0, NULL, NULL, 129, 5, 1, 3174, 374, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(312, 'Wind Breaker (Nii Satoru) [Chap 125-130]', 'Nội dung chương 130 của truyện Wind Breaker', 0, NULL, NULL, 130, 5, 1, 2147, 123, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(313, 'Wind Breaker (Nii Satoru) [Chap 131]', 'Nội dung chương 131 của truyện Wind Breaker', 0, NULL, NULL, 131, 5, 1, 1185, 237, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(314, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 132 của truyện Wind Breaker', 0, NULL, NULL, 132, 5, 1, 2267, 406, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(315, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 133 của truyện Wind Breaker', 0, NULL, NULL, 133, 5, 1, 2283, 153, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(316, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 134 của truyện Wind Breaker', 0, NULL, NULL, 134, 5, 1, 2399, 78, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(317, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 135 của truyện Wind Breaker', 0, NULL, NULL, 135, 5, 1, 4969, 483, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(318, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 136 của truyện Wind Breaker', 0, NULL, NULL, 136, 5, 1, 4013, 455, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(319, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 137 của truyện Wind Breaker', 0, NULL, NULL, 137, 5, 1, 2842, 293, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(320, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 138 của truyện Wind Breaker', 0, NULL, NULL, 138, 5, 1, 2851, 472, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(321, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 139 của truyện Wind Breaker', 0, NULL, NULL, 139, 5, 1, 4766, 234, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(322, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 140 của truyện Wind Breaker', 0, NULL, NULL, 140, 5, 1, 2774, 498, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(323, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 141 của truyện Wind Breaker', 0, NULL, NULL, 141, 5, 1, 4330, 196, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(324, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 142 của truyện Wind Breaker', 0, NULL, NULL, 142, 5, 1, 2011, 302, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(325, 'Wind Breaker (Nii Satoru) [Chap 132-143]', 'Nội dung chương 143 của truyện Wind Breaker', 0, NULL, NULL, 143, 5, 1, 4109, 173, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(326, 'Wind Breaker (Nii Satoru) [Chap 132-145]', 'Nội dung chương 144 của truyện Wind Breaker', 0, NULL, NULL, 144, 5, 1, 3449, 212, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(327, 'Wind Breaker (Nii Satoru) [Chap 132-145]', 'Nội dung chương 145 của truyện Wind Breaker', 0, NULL, NULL, 145, 5, 1, 4389, 271, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(328, 'Wind Breaker (Nii Satoru) [Chap 132-146]', 'Nội dung chương 146 của truyện Wind Breaker', 0, NULL, NULL, 146, 5, 1, 2309, 372, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(329, 'Wind Breaker (Nii Satoru) [Chap 132-148]', 'Nội dung chương 147 của truyện Wind Breaker', 0, NULL, NULL, 147, 5, 1, 4804, 380, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(330, 'Wind Breaker (Nii Satoru) [Chap 132-148]', 'Nội dung chương 148 của truyện Wind Breaker', 0, NULL, NULL, 148, 5, 1, 3983, 395, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(331, 'Wind Breaker (Nii Satoru) [Chap 132-149]', 'Nội dung chương 149 của truyện Wind Breaker', 0, NULL, NULL, 149, 5, 1, 4363, 446, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(332, 'Wind Breaker (Nii Satoru) [Chap 132-152]', 'Nội dung chương 151 của truyện Wind Breaker', 0, NULL, NULL, 151, 5, 1, 3596, 283, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(333, 'Wind Breaker (Nii Satoru) [Chap 132-152]', 'Nội dung chương 152 của truyện Wind Breaker', 0, NULL, NULL, 152, 5, 1, 2394, 266, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(334, 'Wind Breaker (Nii Satoru) [Chap 132-154]', 'Nội dung chương 153 của truyện Wind Breaker', 0, NULL, NULL, 153, 5, 1, 4803, 95, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(335, 'Wind Breaker (Nii Satoru) [Chap 132-154]', 'Nội dung chương 154 của truyện Wind Breaker', 0, NULL, NULL, 154, 5, 1, 2965, 156, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(336, 'Wind Breaker (Nii Satoru) [Chap 132-155]', 'Nội dung chương 155 của truyện Wind Breaker', 0, NULL, NULL, 155, 5, 1, 2876, 70, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(337, 'Wind Breaker (Nii Satoru) [Chap 132-156]', 'Nội dung chương 156 của truyện Wind Breaker', 0, NULL, NULL, 156, 5, 1, 2621, 255, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(338, 'Wind Breaker (Nii Satoru) [Chap 132-157]', 'Nội dung chương 157 của truyện Wind Breaker', 0, NULL, NULL, 157, 5, 1, 2841, 317, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(339, 'Wind Breaker (Nii Satoru) [Chap 132-158]', 'Nội dung chương 158 của truyện Wind Breaker', 0, NULL, NULL, 158, 5, 1, 4385, 208, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(340, 'Wind Breaker (Nii Satoru) [Chap 132-159]', 'Nội dung chương 159 của truyện Wind Breaker', 0, NULL, NULL, 159, 5, 1, 1565, 144, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(341, 'Wind Breaker (Nii Satoru) [Chap 132-160]', 'Nội dung chương 160 của truyện Wind Breaker', 0, NULL, NULL, 160, 5, 1, 4259, 288, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(342, 'Wind Breaker (Nii Satoru) [Chap 161-170]', 'Nội dung chương 161 của truyện Wind Breaker', 0, NULL, NULL, 161, 5, 1, 2779, 431, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(343, 'Wind Breaker (Nii Satoru) [Chap 161-170]', 'Nội dung chương 162 của truyện Wind Breaker', 0, NULL, NULL, 162, 5, 1, 1396, 260, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(344, 'Wind Breaker (Nii Satoru) [Chap 161-170]', 'Nội dung chương 163 của truyện Wind Breaker', 0, NULL, NULL, 163, 5, 1, 2969, 404, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(345, 'Wind Breaker (Nii Satoru) [Chap 161-170]', 'Nội dung chương 164 của truyện Wind Breaker', 0, NULL, NULL, 164, 5, 1, 1167, 416, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(346, 'Wind Breaker (Nii Satoru) [Chap 161-170]', 'Nội dung chương 165 của truyện Wind Breaker', 0, NULL, NULL, 165, 5, 1, 4691, 347, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(347, 'Wind Breaker (Nii Satoru) [Chap 161-170]', 'Nội dung chương 166 của truyện Wind Breaker', 0, NULL, NULL, 166, 5, 1, 3466, 278, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(348, 'Wind Breaker (Nii Satoru) [Chap 161-170]', 'Nội dung chương 167 của truyện Wind Breaker', 0, NULL, NULL, 167, 5, 1, 1006, 421, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(349, 'Wind Breaker (Nii Satoru) [Chap 161-170]', 'Nội dung chương 168 của truyện Wind Breaker', 0, NULL, NULL, 168, 5, 1, 2747, 415, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(350, 'Wind Breaker (Nii Satoru) [Chap 161-170]', 'Nội dung chương 169 của truyện Wind Breaker', 0, NULL, NULL, 169, 5, 1, 1992, 229, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(351, 'Wind Breaker (Nii Satoru) [Chap 161-170]', 'Nội dung chương 170 của truyện Wind Breaker', 0, NULL, NULL, 170, 5, 1, 4634, 274, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(352, 'Wind Breaker (Nii Satoru) [Chap 161-171]', 'Nội dung chương 171 của truyện Wind Breaker', 0, NULL, NULL, 171, 5, 1, 3272, 319, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(353, 'Wind Breaker (Nii Satoru) [Chap 161-172]', 'Nội dung chương 172 của truyện Wind Breaker', 0, NULL, NULL, 172, 5, 1, 3029, 262, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:06:42'),
(354, 'Wind Breaker (Nii Satoru) [Chap 172.5-176]', 'Nội dung chương 172.5 của truyện Wind Breaker', 0, NULL, NULL, 173, 5, 1, 4512, 123, 1, '2025-08-20 22:06:42', '2025-08-20 22:06:42', '2025-08-20 22:18:23'),
(356, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 1 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 1, 6, 1, 3894, 496, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(357, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 2 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 2, 6, 1, 2260, 244, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(358, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 3 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 3, 6, 1, 4376, 482, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(359, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 4 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 4, 6, 1, 1338, 422, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(360, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 5 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 5, 6, 1, 2788, 244, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(361, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 6 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 6, 6, 1, 2200, 293, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(362, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 7 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 7, 6, 1, 2793, 342, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(363, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 8 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 8, 6, 1, 2317, 497, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(364, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 9 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 9, 6, 1, 4257, 195, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(365, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 10 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 10, 6, 1, 1359, 205, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(366, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 11 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 11, 6, 1, 1066, 243, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(367, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 12 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 12, 6, 1, 2307, 330, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(368, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 13 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 13, 6, 1, 1346, 357, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(369, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 14 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 14, 6, 1, 1391, 434, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(370, 'What Do You Wish For With Those Murky Eyes [Chap 1-15]', 'Nội dung chương 15 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 15, 6, 1, 4808, 138, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(371, 'What Do You Wish For With Those Murky Eyes [Chap 16]', 'Nội dung chương 16 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 16, 6, 1, 1329, 237, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(372, 'What Do You Wish For With Those Murky Eyes [Chap 17-20]', 'Nội dung chương 17 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 17, 6, 1, 3189, 214, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(373, 'What Do You Wish For With Those Murky Eyes [Chap 17-20]', 'Nội dung chương 18 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 18, 6, 1, 2192, 474, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(374, 'What Do You Wish For With Those Murky Eyes [Chap 17-20]', 'Nội dung chương 19 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 19, 6, 1, 4802, 263, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(375, 'What Do You Wish For With Those Murky Eyes [Chap 17-20]', 'Nội dung chương 20 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 20, 6, 1, 3487, 67, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(376, 'What Do You Wish For With Those Murky Eyes [Chap 21-22]', 'Nội dung chương 21 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 21, 6, 1, 4013, 319, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(377, 'What Do You Wish For With Those Murky Eyes [Chap 21-22]', 'Nội dung chương 22 của truyện What Do You Wish For With Those Murky Eyes', 0, NULL, NULL, 22, 6, 1, 1038, 180, 1, '2025-08-20 22:06:43', '2025-08-20 22:06:43', '2025-08-20 22:06:43'),
(378, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 1 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 1, 7, 1, 1393, 440, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(379, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 2 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 2, 7, 1, 4479, 259, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(380, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 3 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 3, 7, 1, 2188, 456, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(381, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 4 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 4, 7, 1, 1828, 271, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(382, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 5 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 5, 7, 1, 3235, 176, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(383, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 6 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 6, 7, 1, 4900, 341, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(384, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 7 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 7, 7, 1, 1597, 169, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(385, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 8 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 8, 7, 1, 3493, 98, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(386, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 9 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 9, 7, 1, 4945, 237, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(387, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 10 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 10, 7, 1, 1717, 421, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(388, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 11 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 11, 7, 1, 2003, 318, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(389, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 12 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 12, 7, 1, 4419, 238, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(390, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 13 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 13, 7, 1, 1565, 292, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(391, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 14 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 14, 7, 1, 1483, 138, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(392, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 15 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 15, 7, 1, 2616, 183, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(393, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 16 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 16, 7, 1, 4543, 99, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(394, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 17 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 17, 7, 1, 1314, 454, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(395, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 18 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 18, 7, 1, 2492, 411, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(396, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 19 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 19, 7, 1, 3659, 456, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(397, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 21 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 21, 7, 1, 2434, 406, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(398, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 22 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 22, 7, 1, 3491, 454, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(399, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 23 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 23, 7, 1, 3587, 334, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(400, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 24 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 24, 7, 1, 4326, 485, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(401, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 25 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 25, 7, 1, 4683, 195, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(402, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 26 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 26, 7, 1, 4056, 423, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(403, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 27 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 27, 7, 1, 2323, 230, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(404, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 28 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 28, 7, 1, 2398, 63, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(405, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 29 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 29, 7, 1, 2284, 363, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(406, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 30 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 30, 7, 1, 1482, 480, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(407, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 31 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 31, 7, 1, 2988, 174, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(408, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 32 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 32, 7, 1, 1180, 140, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(409, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 33 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 33, 7, 1, 4378, 232, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(410, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 34 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 34, 7, 1, 1123, 289, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(411, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 35 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 35, 7, 1, 2422, 105, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(412, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 36 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 36, 7, 1, 2179, 158, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(413, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 37 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 37, 7, 1, 4638, 57, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(414, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 38 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 38, 7, 1, 4871, 327, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(415, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 39 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 39, 7, 1, 2317, 446, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(416, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 40 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 40, 7, 1, 3508, 432, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(417, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 41 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 41, 7, 1, 4187, 241, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(418, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 42 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 42, 7, 1, 2660, 486, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(419, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 43 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 43, 7, 1, 3151, 263, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(420, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 44 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 44, 7, 1, 3895, 331, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(421, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 45 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 45, 7, 1, 2812, 424, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(422, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 46 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 46, 7, 1, 3638, 57, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(423, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 47 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 47, 7, 1, 4936, 299, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(424, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 48 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 48, 7, 1, 4756, 446, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(425, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 49 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 49, 7, 1, 2990, 278, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(426, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 50 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 50, 7, 1, 1196, 389, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(427, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 51 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 51, 7, 1, 1418, 382, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(428, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 52 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 52, 7, 1, 1294, 451, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(429, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 53 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 53, 7, 1, 1792, 293, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(430, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 54 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 54, 7, 1, 4272, 373, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(431, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 55 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 55, 7, 1, 1007, 396, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(432, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 56 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 56, 7, 1, 3463, 304, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(433, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 57 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 57, 7, 1, 4953, 440, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(434, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 58 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 58, 7, 1, 3589, 89, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(435, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 59 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 59, 7, 1, 1994, 185, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(436, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 60 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 60, 7, 1, 3519, 469, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(437, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 61 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 61, 7, 1, 3069, 79, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(438, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 62 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 62, 7, 1, 4414, 118, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(439, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 63 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 63, 7, 1, 1257, 87, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(440, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 64 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 64, 7, 1, 3737, 196, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(441, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 65 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 65, 7, 1, 1740, 454, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(442, 'Võng Du Thiên Hạ Vô Song [Chap 1-66]', 'Nội dung chương 66 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 66, 7, 1, 4991, 337, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(443, 'Võng Du Thiên Hạ Vô Song [Chap 67-68]', 'Nội dung chương 67 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 67, 7, 1, 4159, 188, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(444, 'Võng Du Thiên Hạ Vô Song [Chap 67-68]', 'Nội dung chương 68 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 68, 7, 1, 1943, 90, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(445, 'Võng Du Thiên Hạ Vô Song [Chap 69]', 'Nội dung chương 69 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 69, 7, 1, 2308, 371, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(446, 'Võng Du Thiên Hạ Vô Song [Chap 71-72]', 'Nội dung chương 71 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 71, 7, 1, 1217, 220, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(447, 'Võng Du Thiên Hạ Vô Song [Chap 71-72]', 'Nội dung chương 72 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 72, 7, 1, 1422, 280, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(448, 'Võng Du Thiên Hạ Vô Song [Chap 73]', 'Nội dung chương 73 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 73, 7, 1, 2912, 360, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(449, 'Võng Du Thiên Hạ Vô Song [Chap 74-77]', 'Nội dung chương 74 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 74, 7, 1, 1711, 58, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(450, 'Võng Du Thiên Hạ Vô Song [Chap 74-77]', 'Nội dung chương 75 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 75, 7, 1, 3615, 102, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(451, 'Võng Du Thiên Hạ Vô Song [Chap 74-77]', 'Nội dung chương 76 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 76, 7, 1, 2236, 158, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(452, 'Võng Du Thiên Hạ Vô Song [Chap 74-77]', 'Nội dung chương 77 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 77, 7, 1, 1416, 462, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(453, 'Võng Du Thiên Hạ Vô Song [Chap 78]', 'Nội dung chương 78 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 78, 7, 1, 2055, 201, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(454, 'Võng Du Thiên Hạ Vô Song [Chap 79]', 'Nội dung chương 79 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 79, 7, 1, 2436, 182, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(455, 'Võng Du Thiên Hạ Vô Song [Chap 80-84]', 'Nội dung chương 80 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 80, 7, 1, 4492, 408, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(456, 'Võng Du Thiên Hạ Vô Song [Chap 80-84]', 'Nội dung chương 81 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 81, 7, 1, 4095, 379, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(457, 'Võng Du Thiên Hạ Vô Song [Chap 80-84]', 'Nội dung chương 82 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 82, 7, 1, 2467, 111, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(458, 'Võng Du Thiên Hạ Vô Song [Chap 80-84]', 'Nội dung chương 83 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 83, 7, 1, 1149, 313, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(459, 'Võng Du Thiên Hạ Vô Song [Chap 80-84]', 'Nội dung chương 84 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 84, 7, 1, 2083, 127, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(460, 'Võng Du Thiên Hạ Vô Song [Chap 85-94]', 'Nội dung chương 85 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 85, 7, 1, 1016, 143, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(461, 'Võng Du Thiên Hạ Vô Song [Chap 85-94]', 'Nội dung chương 86 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 86, 7, 1, 3263, 129, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(462, 'Võng Du Thiên Hạ Vô Song [Chap 85-94]', 'Nội dung chương 88 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 88, 7, 1, 2726, 353, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(463, 'Võng Du Thiên Hạ Vô Song [Chap 85-94]', 'Nội dung chương 89 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 89, 7, 1, 2390, 468, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(464, 'Võng Du Thiên Hạ Vô Song [Chap 85-94]', 'Nội dung chương 90 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 90, 7, 1, 3547, 276, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(465, 'Võng Du Thiên Hạ Vô Song [Chap 85-94]', 'Nội dung chương 91 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 91, 7, 1, 3770, 100, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(466, 'Võng Du Thiên Hạ Vô Song [Chap 85-94]', 'Nội dung chương 92 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 92, 7, 1, 3581, 474, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(467, 'Võng Du Thiên Hạ Vô Song [Chap 85-94]', 'Nội dung chương 93 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 93, 7, 1, 4797, 425, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(468, 'Võng Du Thiên Hạ Vô Song [Chap 85-94]', 'Nội dung chương 94 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 94, 7, 1, 4123, 454, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(469, 'Võng Du Thiên Hạ Vô Song [Chap 95]', 'Nội dung chương 95 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 95, 7, 1, 3906, 304, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(470, 'Võng Du Thiên Hạ Vô Song [Chap 96-102]', 'Nội dung chương 96 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 96, 7, 1, 4664, 417, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(471, 'Võng Du Thiên Hạ Vô Song [Chap 96-102]', 'Nội dung chương 97 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 97, 7, 1, 2087, 304, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(472, 'Võng Du Thiên Hạ Vô Song [Chap 96-102]', 'Nội dung chương 98 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 98, 7, 1, 4053, 264, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(473, 'Võng Du Thiên Hạ Vô Song [Chap 96-102]', 'Nội dung chương 99 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 99, 7, 1, 1032, 443, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(474, 'Võng Du Thiên Hạ Vô Song [Chap 96-102]', 'Nội dung chương 100 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 100, 7, 1, 3022, 434, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(475, 'Võng Du Thiên Hạ Vô Song [Chap 96-102]', 'Nội dung chương 101 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 101, 7, 1, 2567, 50, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(476, 'Võng Du Thiên Hạ Vô Song [Chap 96-102]', 'Nội dung chương 102 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 102, 7, 1, 1270, 299, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(477, 'Võng Du Thiên Hạ Vô Song [Chap 103-107]', 'Nội dung chương 103 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 103, 7, 1, 4180, 478, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(478, 'Võng Du Thiên Hạ Vô Song [Chap 103-107]', 'Nội dung chương 104 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 104, 7, 1, 1935, 281, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(479, 'Võng Du Thiên Hạ Vô Song [Chap 103-107]', 'Nội dung chương 105 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 105, 7, 1, 2790, 499, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(480, 'Võng Du Thiên Hạ Vô Song [Chap 103-107]', 'Nội dung chương 106 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 106, 7, 1, 2886, 294, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(481, 'Võng Du Thiên Hạ Vô Song [Chap 103-107]', 'Nội dung chương 107 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 107, 7, 1, 3967, 323, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(482, 'Võng Du Thiên Hạ Vô Song [Chap 108-109]', 'Nội dung chương 108 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 108, 7, 1, 3111, 178, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44'),
(483, 'Võng Du Thiên Hạ Vô Song [Chap 108-109]', 'Nội dung chương 109 của truyện Võng Du Thiên Hạ Vô Song', 0, NULL, NULL, 109, 7, 1, 3633, 214, 1, '2025-08-20 22:06:44', '2025-08-20 22:06:44', '2025-08-20 22:06:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comics`
--

CREATE TABLE `comics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `status` enum('ongoing','completed','hiatus','cancelled') NOT NULL DEFAULT 'ongoing',
  `type` enum('manhua','manhwa','manga','comic','webtoon') NOT NULL DEFAULT 'manga',
  `total_chapters` int(11) NOT NULL DEFAULT 0,
  `current_chapters` int(11) NOT NULL DEFAULT 0,
  `rating` decimal(3,1) NOT NULL DEFAULT 0.0,
  `views` bigint(20) NOT NULL DEFAULT 0,
  `likes` bigint(20) NOT NULL DEFAULT 0,
  `source_type` varchar(255) DEFAULT NULL,
  `source_url` varchar(255) DEFAULT NULL,
  `last_crawled_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `release_year` int(11) DEFAULT NULL,
  `language` varchar(10) NOT NULL DEFAULT 'vi',
  `country` varchar(100) DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comic_category`
--

CREATE TABLE `comic_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comic_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `novel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chapter_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `rating` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment_likes`
--

CREATE TABLE `comment_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_08_21_042038_add_fields_to_users_table', 1),
(6, '2025_08_21_042534_create_categories_table', 2),
(7, '2025_08_21_042555_create_chapters_table', 2),
(8, '2025_08_21_042611_create_comments_table', 2),
(9, '2025_08_21_042917_create_novel_follows_table', 2),
(10, '2025_08_21_042943_create_comment_likes_table', 2),
(12, '2025_08_21_045110_add_slug_to_novels_table', 3),
(13, '2025_08_21_053357_add_comic_fields_to_chapters_table', 4),
(14, '2025_08_21_054851_create_comics_table', 5),
(15, '2025_08_21_060155_create_category_novel_table', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `novels`
--

CREATE TABLE `novels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('ongoing','completed') NOT NULL DEFAULT 'ongoing',
  `total_chapters` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `rating` decimal(2,1) NOT NULL DEFAULT 0.0,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `novels`
--

INSERT INTO `novels` (`id`, `title`, `description`, `cover_image`, `slug`, `author_id`, `category_id`, `status`, `total_chapters`, `views`, `rating`, `is_completed`, `created_at`, `updated_at`) VALUES
(1, 'Zenbu Kimi No Sei', 'Truyện Zenbu Kimi No Sei - Một câu chuyện thú vị với nhiều tình tiết hấp dẫn. Hãy đọc để khám phá thế giới tuyệt vời này!', 'https://img.otruyenapi.com/uploads/comics/zenbu-kimi-no-sei-thumb.jpg', 'zenbu-kimi-no-sei', 1, 6, 'ongoing', 36, 3033, 3.5, 0, '2025-08-20 21:55:02', '2025-08-20 22:25:26'),
(2, 'Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện', 'Truyện Xuyên Thành Phù Thủy Nuôi Dưỡng Kỵ Sĩ Thánh Điện - Một câu chuyện thú vị với nhiều tình tiết hấp dẫn. Hãy đọc để khám phá thế giới tuyệt vời này!', 'https://img.otruyenapi.com/uploads/comics/xuyen-thanh-phu-thuy-nuoi-duong-ky-si-thanh-dien-thumb.jpg', 'xuyen-thanh-phu-thuy-nuoi-duong-ky-si-thanh-dien', 1, 1, 'ongoing', 68, 1211, 4.1, 0, '2025-08-20 21:55:02', '2025-08-20 22:34:48'),
(3, 'Xích Tâm Tuần Thiên', 'Truyện Xích Tâm Tuần Thiên - Một câu chuyện thú vị với nhiều tình tiết hấp dẫn. Hãy đọc để khám phá thế giới tuyệt vời này!', 'https://img.otruyenapi.com/uploads/comics/xich-tam-tuan-thien-thumb.jpg', 'xich-tam-tuan-thien', 1, 1, 'ongoing', 49, 5774, 3.4, 0, '2025-08-20 21:55:02', '2025-08-20 22:21:04'),
(4, 'Xi Hồn', 'Truyện Xi Hồn - Một câu chuyện thú vị với nhiều tình tiết hấp dẫn. Hãy đọc để khám phá thế giới tuyệt vời này!', 'https://img.otruyenapi.com/uploads/comics/xi-hon-thumb.jpg', 'xi-hon', 1, 1, 'ongoing', 80, 8101, 4.4, 0, '2025-08-20 21:55:08', '2025-08-20 22:25:41'),
(5, 'Wind Breaker', 'Truyện Wind Breaker - Một câu chuyện thú vị với nhiều tình tiết hấp dẫn. Hãy đọc để khám phá thế giới tuyệt vời này!', 'https://img.otruyenapi.com/uploads/comics/wind-breaker-thumb.jpg', 'wind-breaker', 1, 1, 'ongoing', 187, 1675, 3.1, 0, '2025-08-20 21:55:08', '2025-08-20 22:26:28'),
(6, 'What Do You Wish For With Those Murky Eyes', 'Truyện What Do You Wish For With Those Murky Eyes - Một câu chuyện thú vị với nhiều tình tiết hấp dẫn. Hãy đọc để khám phá thế giới tuyệt vời này!', 'https://img.otruyenapi.com/uploads/comics/what-do-you-wish-for-with-those-murky-eyes-thumb.jpg', 'what-do-you-wish-for-with-those-murky-eyes', 1, 1, 'ongoing', 22, 7130, 4.1, 0, '2025-08-20 21:55:08', '2025-08-20 22:08:15'),
(7, 'Võng Du Thiên Hạ Vô Song', 'Truyện Võng Du Thiên Hạ Vô Song - Một câu chuyện thú vị với nhiều tình tiết hấp dẫn. Hãy đọc để khám phá thế giới tuyệt vời này!', 'https://img.otruyenapi.com/uploads/comics/vong-du-thien-ha-vo-song-thumb.jpg', 'vong-du-thien-ha-vo-song', 1, 1, 'ongoing', 109, 2310, 4.5, 0, '2025-08-20 21:55:08', '2025-08-20 22:08:15'),
(8, 'Vợ Của Lục Tổng Không Phải Dạng Vừa', 'Truyện Vợ Của Lục Tổng Không Phải Dạng Vừa - Một câu chuyện thú vị với nhiều tình tiết hấp dẫn. Hãy đọc để khám phá thế giới tuyệt vời này!', 'https://img.otruyenapi.com/uploads/comics/vo-cua-luc-tong-khong-phai-dang-vua-thumb.jpg', 'vo-cua-luc-tong-khong-phai-dang-vua', 1, 1, 'ongoing', 211, 4385, 3.7, 0, '2025-08-20 22:08:15', '2025-08-20 22:10:54'),
(9, 'Vanta Black', 'Truyện Vanta Black - Một câu chuyện thú vị với nhiều tình tiết hấp dẫn. Hãy đọc để khám phá thế giới tuyệt vời này!', 'https://img.otruyenapi.com/uploads/comics/vanta-black-thumb.jpg', 'vanta-black', 1, 1, 'ongoing', 43, 2275, 3.3, 0, '2025-08-20 22:08:15', '2025-08-20 22:13:05'),
(10, 'Vạn Cổ Tối Cường Tông', 'Truyện Vạn Cổ Tối Cường Tông - Một câu chuyện thú vị với nhiều tình tiết hấp dẫn. Hãy đọc để khám phá thế giới tuyệt vời này!', 'https://img.otruyenapi.com/uploads/comics/van-co-toi-cuong-tong-thumb.jpg', 'van-co-toi-cuong-tong', 1, 1, 'ongoing', 448, 9642, 3.0, 0, '2025-08-20 22:08:15', '2025-08-20 22:34:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `novel_follows`
--

CREATE TABLE `novel_follows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `novel_id` bigint(20) UNSIGNED NOT NULL,
  `last_read_at` timestamp NULL DEFAULT NULL,
  `last_read_chapter` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `birth_date`, `gender`, `is_admin`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin NovelHub', 'admin@novelhub.com', NULL, NULL, NULL, 1, NULL, '$2y$10$ObQmTwvdS7scDJ.jpkWPUudLQmTjWgRAYvnt573Qg5CoQLpifIN6C', NULL, '2025-08-20 21:50:39', '2025-08-20 21:50:39'),
(3, 'NGUYEN VAN QUANG', 'admin2@gmail.com', NULL, NULL, NULL, 1, NULL, '$2y$10$OMJ5JOFSgaZPKuhTEvR3EuvL9EoSffbm802OxSCn6ng1yNeXJBkuO', NULL, '2025-08-20 22:11:27', '2025-08-20 22:11:27');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_slug_is_active_index` (`slug`,`is_active`);

--
-- Chỉ mục cho bảng `category_novel`
--
ALTER TABLE `category_novel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_novel_category_id_novel_id_unique` (`category_id`,`novel_id`),
  ADD KEY `category_novel_novel_id_foreign` (`novel_id`);

--
-- Chỉ mục cho bảng `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chapters_novel_id_chapter_number_unique` (`novel_id`,`chapter_number`),
  ADD KEY `chapters_novel_id_is_published_index` (`novel_id`,`is_published`),
  ADD KEY `chapters_author_id_created_at_index` (`author_id`,`created_at`);

--
-- Chỉ mục cho bảng `comics`
--
ALTER TABLE `comics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comics_slug_unique` (`slug`),
  ADD KEY `comics_status_type_index` (`status`,`type`),
  ADD KEY `comics_is_featured_is_completed_index` (`is_featured`,`is_completed`),
  ADD KEY `comics_rating_views_index` (`rating`,`views`),
  ADD KEY `comics_last_crawled_at_index` (`last_crawled_at`);

--
-- Chỉ mục cho bảng `comic_category`
--
ALTER TABLE `comic_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`),
  ADD KEY `comments_novel_id_is_approved_index` (`novel_id`,`is_approved`),
  ADD KEY `comments_chapter_id_is_approved_index` (`chapter_id`,`is_approved`),
  ADD KEY `comments_user_id_created_at_index` (`user_id`,`created_at`);

--
-- Chỉ mục cho bảng `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comment_likes_user_id_comment_id_unique` (`user_id`,`comment_id`),
  ADD KEY `comment_likes_comment_id_created_at_index` (`comment_id`,`created_at`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `novels`
--
ALTER TABLE `novels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `novels_slug_unique` (`slug`),
  ADD KEY `novels_author_id_foreign` (`author_id`);

--
-- Chỉ mục cho bảng `novel_follows`
--
ALTER TABLE `novel_follows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `novel_follows_user_id_novel_id_unique` (`user_id`,`novel_id`),
  ADD KEY `novel_follows_user_id_last_read_at_index` (`user_id`,`last_read_at`),
  ADD KEY `novel_follows_novel_id_created_at_index` (`novel_id`,`created_at`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `category_novel`
--
ALTER TABLE `category_novel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=484;

--
-- AUTO_INCREMENT cho bảng `comics`
--
ALTER TABLE `comics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comic_category`
--
ALTER TABLE `comic_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comment_likes`
--
ALTER TABLE `comment_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `novels`
--
ALTER TABLE `novels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `novel_follows`
--
ALTER TABLE `novel_follows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `category_novel`
--
ALTER TABLE `category_novel`
  ADD CONSTRAINT `category_novel_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_novel_novel_id_foreign` FOREIGN KEY (`novel_id`) REFERENCES `novels` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chapters_novel_id_foreign` FOREIGN KEY (`novel_id`) REFERENCES `novels` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_novel_id_foreign` FOREIGN KEY (`novel_id`) REFERENCES `novels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD CONSTRAINT `comment_likes_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `novels`
--
ALTER TABLE `novels`
  ADD CONSTRAINT `novels_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `novel_follows`
--
ALTER TABLE `novel_follows`
  ADD CONSTRAINT `novel_follows_novel_id_foreign` FOREIGN KEY (`novel_id`) REFERENCES `novels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `novel_follows_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
