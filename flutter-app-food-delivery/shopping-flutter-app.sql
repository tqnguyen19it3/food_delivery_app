-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 12, 2022 lúc 08:20 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopping-flutter-app`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 0, 'Food Category', 'fa-certificate', '/food-types', '*', '2021-11-08 04:58:13', '2022-01-01 00:16:59'),
(10, 0, 0, 'Users', 'fa-bars', '/users', '*', '2021-11-08 05:38:59', '2021-11-08 05:38:59'),
(11, 0, 0, 'Food', 'fa-beer', '/foods', '*', '2021-11-17 01:37:06', '2022-01-01 00:06:15'),
(12, 0, 0, 'Orders', 'fa-first-order', '/orders', '*', '2022-02-09 18:27:25', '2022-02-09 18:27:25'),
(13, 0, 0, 'Payment Setting', 'fa-dollar', '/business-settings', '*', '2022-02-27 22:24:23', '2022-02-27 22:24:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '180.175.17.235', '[]', '2021-11-08 03:42:53', '2021-11-08 03:42:53'),
(2, 1, 'admin', 'GET', '101.85.201.147', '[]', '2021-11-08 04:57:07', '2021-11-08 04:57:07'),
(3, 1, 'admin/auth/menu', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 04:57:10', '2021-11-08 04:57:10'),
(4, 1, 'admin/auth/menu', 'POST', '101.85.201.147', '{\"parent_id\":\"0\",\"title\":\"Category\",\"icon\":\"fa-bars\",\"uri\":\"\\/article-types\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"AMUYbLptKc2cKTgaD72XLJQOd17JLWL6PdTMmW79\"}', '2021-11-08 04:58:13', '2021-11-08 04:58:13'),
(5, 1, 'admin/auth/menu', 'GET', '101.85.201.147', '[]', '2021-11-08 04:58:13', '2021-11-08 04:58:13'),
(6, 1, 'admin/auth/menu', 'GET', '101.85.201.147', '[]', '2021-11-08 04:58:18', '2021-11-08 04:58:18'),
(7, 1, 'admin/auth/menu', 'POST', '101.85.201.147', '{\"parent_id\":\"0\",\"title\":\"Artcles\",\"icon\":\"fa-bars\",\"uri\":\"\\/articles\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"AMUYbLptKc2cKTgaD72XLJQOd17JLWL6PdTMmW79\"}', '2021-11-08 04:58:55', '2021-11-08 04:58:55'),
(8, 1, 'admin/auth/menu', 'GET', '101.85.201.147', '[]', '2021-11-08 04:58:55', '2021-11-08 04:58:55'),
(9, 1, 'admin/auth/menu', 'GET', '101.85.201.147', '[]', '2021-11-08 04:58:58', '2021-11-08 04:58:58'),
(10, 1, 'admin/articles', 'GET', '101.85.201.147', '[]', '2021-11-08 05:02:22', '2021-11-08 05:02:22'),
(11, 1, 'admin/articles/create', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:02:31', '2021-11-08 05:02:31'),
(12, 1, 'admin/articles', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:02:46', '2021-11-08 05:02:46'),
(13, 1, 'admin/articles/create', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:02:50', '2021-11-08 05:02:50'),
(14, 1, 'admin/articles/create', 'GET', '101.85.201.147', '[]', '2021-11-08 05:06:27', '2021-11-08 05:06:27'),
(15, 1, 'admin/auth/logout', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:06:32', '2021-11-08 05:06:32'),
(16, 1, 'admin', 'GET', '101.85.201.147', '[]', '2021-11-08 05:06:36', '2021-11-08 05:06:36'),
(17, 1, 'admin/articles', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:06:38', '2021-11-08 05:06:38'),
(18, 1, 'admin/article-types', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:06:40', '2021-11-08 05:06:40'),
(19, 1, 'admin/articles', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:06:42', '2021-11-08 05:06:42'),
(20, 1, 'admin/articles/create', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:06:43', '2021-11-08 05:06:43'),
(21, 1, 'admin/articles/create', 'GET', '101.85.201.147', '[]', '2021-11-08 05:12:09', '2021-11-08 05:12:09'),
(22, 1, 'admin/articles/create', 'GET', '101.85.201.147', '[]', '2021-11-08 05:13:21', '2021-11-08 05:13:21'),
(23, 1, 'admin/articles/create', 'GET', '101.85.201.147', '[]', '2021-11-08 05:14:03', '2021-11-08 05:14:03'),
(24, 1, 'admin/article-types', 'GET', '101.85.201.147', '[]', '2021-11-08 05:14:10', '2021-11-08 05:14:10'),
(25, 1, 'admin/article-types/create', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:14:13', '2021-11-08 05:14:13'),
(26, 1, 'admin/articles', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:14:18', '2021-11-08 05:14:18'),
(27, 1, 'admin/articles/create', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:14:19', '2021-11-08 05:14:19'),
(28, 1, 'admin/article-types', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:15:02', '2021-11-08 05:15:02'),
(29, 1, 'admin/articles', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:15:05', '2021-11-08 05:15:05'),
(30, 1, 'admin/articles/create', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:15:08', '2021-11-08 05:15:08'),
(31, 1, 'admin/articles/create', 'GET', '101.85.201.147', '[]', '2021-11-08 05:15:45', '2021-11-08 05:15:45'),
(32, 1, 'admin/articles/create', 'GET', '101.85.201.147', '[]', '2021-11-08 05:19:56', '2021-11-08 05:19:56'),
(33, 1, 'admin/articles/create', 'GET', '101.85.201.147', '[]', '2021-11-08 05:22:13', '2021-11-08 05:22:13'),
(34, 1, 'admin/auth/menu', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:38:07', '2021-11-08 05:38:07'),
(35, 1, 'admin/auth/menu/8/edit', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:38:12', '2021-11-08 05:38:12'),
(36, 1, 'admin/auth/menu/8', 'PUT', '101.85.201.147', '{\"parent_id\":\"0\",\"title\":\"Category\",\"icon\":\"fa-certificate\",\"uri\":\"\\/article-types\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"1dRL1ZTg9uL9SBUZUkwxouwgJEat9EZqsMHfsdn6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/auth\\/menu\"}', '2021-11-08 05:38:24', '2021-11-08 05:38:24'),
(37, 1, 'admin/auth/menu', 'GET', '101.85.201.147', '[]', '2021-11-08 05:38:24', '2021-11-08 05:38:24'),
(38, 1, 'admin/auth/menu/9/edit', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:38:26', '2021-11-08 05:38:26'),
(39, 1, 'admin/auth/menu/9', 'PUT', '101.85.201.147', '{\"parent_id\":\"0\",\"title\":\"Articles\",\"icon\":\"fa-bars\",\"uri\":\"\\/articles\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"1dRL1ZTg9uL9SBUZUkwxouwgJEat9EZqsMHfsdn6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/auth\\/menu\"}', '2021-11-08 05:38:32', '2021-11-08 05:38:32'),
(40, 1, 'admin/auth/menu', 'GET', '101.85.201.147', '[]', '2021-11-08 05:38:32', '2021-11-08 05:38:32'),
(41, 1, 'admin/auth/menu', 'GET', '101.85.201.147', '[]', '2021-11-08 05:38:35', '2021-11-08 05:38:35'),
(42, 1, 'admin/auth/menu', 'GET', '101.85.201.147', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:38:40', '2021-11-08 05:38:40'),
(43, 1, 'admin/auth/menu', 'POST', '101.85.201.147', '{\"parent_id\":\"0\",\"title\":\"Users\",\"icon\":\"fa-bars\",\"uri\":\"\\/users\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"1dRL1ZTg9uL9SBUZUkwxouwgJEat9EZqsMHfsdn6\"}', '2021-11-08 05:38:59', '2021-11-08 05:38:59'),
(44, 1, 'admin/auth/menu', 'GET', '101.85.201.147', '[]', '2021-11-08 05:38:59', '2021-11-08 05:38:59'),
(45, 1, 'admin/articles', 'GET', '180.175.17.235', '[]', '2021-11-17 01:36:07', '2021-11-17 01:36:07'),
(46, 1, 'admin/auth/roles', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 01:36:12', '2021-11-17 01:36:12'),
(47, 1, 'admin/auth/menu', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 01:36:14', '2021-11-17 01:36:14'),
(48, 1, 'admin/auth/menu', 'POST', '180.175.17.235', '{\"parent_id\":\"0\",\"title\":\"Places\",\"icon\":\"fa-map-marker\",\"uri\":\"\\/places\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\"}', '2021-11-17 01:37:06', '2021-11-17 01:37:06'),
(49, 1, 'admin/auth/menu', 'GET', '180.175.17.235', '[]', '2021-11-17 01:37:06', '2021-11-17 01:37:06'),
(50, 1, 'admin/auth/menu', 'GET', '180.175.17.235', '[]', '2021-11-17 01:37:08', '2021-11-17 01:37:08'),
(51, 1, 'admin/places', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 01:37:10', '2021-11-17 01:37:10'),
(52, 1, 'admin/places', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 01:45:32', '2021-11-17 01:45:32'),
(53, 1, 'admin/places/create', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 01:45:35', '2021-11-17 01:45:35'),
(54, 1, 'admin/places/create', 'GET', '180.175.17.235', '[]', '2021-11-17 01:46:48', '2021-11-17 01:46:48'),
(55, 1, 'admin/places/create', 'GET', '180.175.17.235', '[]', '2021-11-17 01:46:50', '2021-11-17 01:46:50'),
(56, 1, 'admin/places', 'POST', '180.175.17.235', '{\"name\":\"British Columbia\",\"price\":\"1276\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. The highway takes you via the coast of the Pacific all the way to Howe Sound before arriving at the Turning island. It gives you a mouthwatering opportunity for sightseeing without having the need to walk off road.<\\/span><\\/p>\",\"total_people\":null,\"selected_people\":null,\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\"}', '2021-11-17 02:04:35', '2021-11-17 02:04:35'),
(57, 1, 'admin/places/create', 'GET', '180.175.17.235', '[]', '2021-11-17 02:04:35', '2021-11-17 02:04:35'),
(58, 1, 'admin/places', 'POST', '180.175.17.235', '{\"name\":\"British Columbia\",\"price\":\"1276\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. The highway takes you via the coast of the Pacific all the way to Howe Sound before arriving at the Turning island. It gives you a mouthwatering opportunity for sightseeing without having the need to walk off road.<\\/span><\\/p>\",\"total_people\":null,\"selected_people\":null,\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\"}', '2021-11-17 02:05:28', '2021-11-17 02:05:28'),
(59, 1, 'admin/places/create', 'GET', '180.175.17.235', '[]', '2021-11-17 02:05:28', '2021-11-17 02:05:28'),
(60, 1, 'admin/places', 'POST', '180.175.17.235', '{\"name\":\"British Columbia\",\"price\":\"1276\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. The highway takes you via the coast of the Pacific all the way to Howe Sound before arriving at the Turning island. It gives you a mouthwatering opportunity for sightseeing without having the need to walk off road.<\\/span><\\/p>\",\"total_people\":null,\"selected_people\":null,\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\"}', '2021-11-17 02:06:38', '2021-11-17 02:06:38'),
(61, 1, 'admin/places/create', 'GET', '180.175.17.235', '[]', '2021-11-17 02:06:38', '2021-11-17 02:06:38'),
(62, 1, 'admin/places', 'POST', '180.175.17.235', '{\"name\":\"British Columbia\",\"price\":\"1276\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. The highway takes you via the coast of the Pacific all the way to Howe Sound before arriving at the Turning island. It gives you a mouthwatering opportunity for sightseeing without having the need to walk off road.<\\/span><\\/p>\",\"total_people\":null,\"selected_people\":null,\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\"}', '2021-11-17 02:07:49', '2021-11-17 02:07:49'),
(63, 1, 'admin/places/create', 'GET', '180.175.17.235', '[]', '2021-11-17 02:07:49', '2021-11-17 02:07:49'),
(64, 1, 'admin/places', 'POST', '180.175.17.235', '{\"name\":\"British Columbia\",\"price\":\"1276\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. The highway takes you via the coast of the Pacific all the way to Howe Sound before arriving at the Turning island. It gives you a mouthwatering opportunity for sightseeing without having the need to walk off road.<\\/span><\\/p>\",\"total_people\":\"5\",\"selected_people\":null,\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\"}', '2021-11-17 02:08:45', '2021-11-17 02:08:45'),
(65, 1, 'admin/places/create', 'GET', '180.175.17.235', '[]', '2021-11-17 02:08:45', '2021-11-17 02:08:45'),
(66, 1, 'admin/places', 'POST', '180.175.17.235', '{\"name\":\"British Columbia\",\"price\":\"1276\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. The highway takes you via the coast of the Pacific all the way to Howe Sound before arriving at the Turning island. It gives you a mouthwatering opportunity for sightseeing without having the need to walk off road.<\\/span><\\/p>\",\"total_people\":\"5\",\"selected_people\":\"5\",\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\"}', '2021-11-17 02:09:08', '2021-11-17 02:09:08'),
(67, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 02:09:09', '2021-11-17 02:09:09'),
(68, 1, 'admin/places/create', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 02:09:15', '2021-11-17 02:09:15'),
(69, 1, 'admin/places', 'POST', '180.175.17.235', '{\"name\":\"Icefields Parkway\",\"price\":\"2153\",\"location\":\"Icefields Parkway, Alberta\",\"stars\":\"5\",\"total_people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This stretches for a straight 234 kilometers from Banff to Jasper. The Icefields Parkway offers you the picturesque panorama of Alberta\\u2019s most talked about mountain vistas. Some of these include Lake Louise, Peyto Lake, and the Columbia Icefields.<\\/span><br style=\\\"box-sizing: border-box; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\\\"\\/><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This region is also frequented by a number of ancient glaciers<\\/span><\\/p>\",\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-17 02:10:43', '2021-11-17 02:10:43'),
(70, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 02:10:44', '2021-11-17 02:10:44'),
(71, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 02:10:55', '2021-11-17 02:10:55'),
(72, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 02:11:20', '2021-11-17 02:11:20'),
(73, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 02:12:01', '2021-11-17 02:12:01'),
(74, 1, 'admin/places/1/edit', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 02:12:32', '2021-11-17 02:12:32'),
(75, 1, 'admin/articles', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 02:14:06', '2021-11-17 02:14:06'),
(76, 1, 'admin/article-types', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 02:14:08', '2021-11-17 02:14:08'),
(77, 1, 'admin/users', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 02:14:10', '2021-11-17 02:14:10'),
(78, 1, 'admin/articles', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 02:14:11', '2021-11-17 02:14:11'),
(79, 1, 'admin/places', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 02:15:36', '2021-11-17 02:15:36'),
(80, 1, 'admin/places/create', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 02:15:38', '2021-11-17 02:15:38'),
(81, 1, 'admin/places', 'POST', '180.175.17.235', '{\"name\":\"Moraine Lake\",\"price\":\"3456\",\"location\":\"Moraine Lake, Alberta\",\"stars\":\"3\",\"total_people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">Moraine Lake is yet another astonishing geographical location that you cannot afford to miss out on if you\\u2019re traveling along the Icefields Parkway. Moraine Lake is located in the Banff and is a promising epitome of ecstatic blue waters. This lake is fed from the glaciers and is gifted its startling blue color from the silicon deposits from the melting glaciers<\\/span><\\/p>\",\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-17 02:16:31', '2021-11-17 02:16:31'),
(82, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 02:16:31', '2021-11-17 02:16:31'),
(83, 1, 'admin/places/create', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 02:17:49', '2021-11-17 02:17:49'),
(84, 1, 'admin/places/create', 'GET', '180.175.17.235', '[]', '2021-11-17 02:17:52', '2021-11-17 02:17:52'),
(85, 1, 'admin/places', 'POST', '180.175.17.235', '{\"name\":\"Ontario\",\"price\":\"3312\",\"location\":\"Killarney Provincial Park\",\"stars\":\"4\",\"total_people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">If you\\u2019re in Canada and if you\\u2019re a sucker for mountains, Killarney Provincial Park in&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\/ontario\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Ontario<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;is your best catch for Canada mountains near Toronto. This region makes the center of the La Cloche Mountain Range.<\\/span><\\/p>\",\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-17 02:18:46', '2021-11-17 02:18:46'),
(86, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 02:18:46', '2021-11-17 02:18:46'),
(87, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 02:20:22', '2021-11-17 02:20:22'),
(88, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 02:22:56', '2021-11-17 02:22:56'),
(89, 1, 'admin/places/1/edit', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 02:23:01', '2021-11-17 02:23:01'),
(90, 1, 'admin/places/1', 'PUT', '180.175.17.235', '{\"name\":\"British Columbia\",\"price\":\"1276\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"total_people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. The highway takes you via the coast of the Pacific all the way to Howe Sound before arriving at the Turning island. It gives you a mouthwatering opportunity for sightseeing without having the need to walk off road.<\\/span><\\/p>\",\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-17 02:23:07', '2021-11-17 02:23:07'),
(91, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 02:23:07', '2021-11-17 02:23:07'),
(92, 1, 'admin/places/2/edit', 'GET', '180.175.17.235', '{\"_pjax\":\"#pjax-container\"}', '2021-11-17 02:23:10', '2021-11-17 02:23:10'),
(93, 1, 'admin/places/2', 'PUT', '180.175.17.235', '{\"name\":\"Icefields Parkway\",\"price\":\"2153\",\"location\":\"Icefields Parkway, Alberta\",\"stars\":\"5\",\"total_people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This stretches for a straight 234 kilometers from Banff to Jasper. The Icefields Parkway offers you the picturesque panorama of Alberta\\u2019s most talked about mountain vistas. Some of these include Lake Louise, Peyto Lake, and the Columbia Icefields.<\\/span><br style=\\\"box-sizing: border-box; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\\\"\\/><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This region is also frequented by a number of ancient glaciers<\\/span><\\/p>\",\"_token\":\"DVaZyyNmM0y50LLhvlifo9hBnTZkZKN95JmzdkFg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-17 02:23:18', '2021-11-17 02:23:18'),
(94, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 02:23:18', '2021-11-17 02:23:18'),
(95, 1, 'admin/places', 'GET', '180.175.17.235', '[]', '2021-11-17 03:12:02', '2021-11-17 03:12:02'),
(96, 1, 'admin/articles', 'GET', '116.224.235.15', '[]', '2021-11-19 05:37:22', '2021-11-19 05:37:22'),
(97, 1, 'admin/places', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 05:37:27', '2021-11-19 05:37:27'),
(98, 1, 'admin/places/1/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 05:37:31', '2021-11-19 05:37:31'),
(99, 1, 'admin/places/1', 'PUT', '116.224.235.15', '{\"name\":\"British Columbia\",\"price\":\"1276\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"total_people\":null,\"selected_people\":\"5\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. The highway takes you via the coast of the Pacific all the way to Howe Sound before arriving at the Turning island.&nbsp;<\\/span><\\/p>\",\"_token\":\"csmn0uJipj7DfXFryYJlaz010r03aRaKhuIHVjHu\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-19 05:37:37', '2021-11-19 05:37:37'),
(100, 1, 'admin/places/1/edit', 'GET', '116.224.235.15', '[]', '2021-11-19 05:37:37', '2021-11-19 05:37:37'),
(101, 1, 'admin/places/1/edit', 'GET', '116.224.235.15', '[]', '2021-11-19 05:39:12', '2021-11-19 05:39:12'),
(102, 1, 'admin/places/1', 'PUT', '116.224.235.15', '{\"name\":\"British Columbia\",\"price\":\"1276\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. The highway takes you via the coast of the Pacific all the way to Howe Sound before arriving at the Turning island.&nbsp;<\\/span><\\/p>\",\"_token\":\"csmn0uJipj7DfXFryYJlaz010r03aRaKhuIHVjHu\",\"_method\":\"PUT\"}', '2021-11-19 05:39:17', '2021-11-19 05:39:17'),
(103, 1, 'admin/places', 'GET', '116.224.235.15', '[]', '2021-11-19 05:39:17', '2021-11-19 05:39:17'),
(104, 1, 'admin/places/2/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 05:39:20', '2021-11-19 05:39:20'),
(105, 1, 'admin/places/2', 'PUT', '116.224.235.15', '{\"name\":\"Icefields Parkway\",\"price\":\"2153\",\"location\":\"Icefields Parkway, Alberta\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This stretches for a straight 234 kilometers from Banff to Jasper. The Icefields Parkway offers you the picturesque panorama of Alberta\\u2019s most talked about mountain vistas. Some of these include Lake Louise, Peyto Lake, and the Columbia Icefields.<\\/span><br\\/><\\/p>\",\"_token\":\"csmn0uJipj7DfXFryYJlaz010r03aRaKhuIHVjHu\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-19 05:39:28', '2021-11-19 05:39:28'),
(106, 1, 'admin/places', 'GET', '116.224.235.15', '[]', '2021-11-19 05:39:28', '2021-11-19 05:39:28'),
(107, 1, 'admin/places/3/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 05:39:31', '2021-11-19 05:39:31'),
(108, 1, 'admin/places/3', 'PUT', '116.224.235.15', '{\"name\":\"Moraine Lake\",\"price\":\"3456\",\"location\":\"Moraine Lake, Alberta\",\"stars\":\"3\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">Moraine Lake is yet another astonishing geographical location that you cannot afford to miss out on if you\\u2019re traveling along the Icefields Parkway. Moraine Lake is located in the Banff and is a promising epitome of ecstatic blue waters.&nbsp;<\\/span><\\/p>\",\"_token\":\"csmn0uJipj7DfXFryYJlaz010r03aRaKhuIHVjHu\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-19 05:39:37', '2021-11-19 05:39:37'),
(109, 1, 'admin/places', 'GET', '116.224.235.15', '[]', '2021-11-19 05:39:37', '2021-11-19 05:39:37'),
(110, 1, 'admin/places/4/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 05:39:39', '2021-11-19 05:39:39'),
(111, 1, 'admin/places/4', 'PUT', '116.224.235.15', '{\"name\":\"Ontario\",\"price\":\"3312\",\"location\":\"Killarney Provincial Park\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">If you\\u2019re in Canada and if you\\u2019re a sucker for mountains, Killarney Provincial Park in&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\/ontario\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Ontario<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;is your best catch for Canada mountains near Toronto. This region makes the center of the La Cloche Mountain Range.<\\/span><\\/p>\",\"_token\":\"csmn0uJipj7DfXFryYJlaz010r03aRaKhuIHVjHu\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-19 05:39:42', '2021-11-19 05:39:42'),
(112, 1, 'admin/places', 'GET', '116.224.235.15', '[]', '2021-11-19 05:39:42', '2021-11-19 05:39:42'),
(113, 1, 'admin/places/1/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 05:39:48', '2021-11-19 05:39:48'),
(114, 1, 'admin/places/1', 'PUT', '116.224.235.15', '{\"name\":\"British Columbia\",\"price\":\"1276\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton.&nbsp;<\\/span><\\/p>\",\"_token\":\"csmn0uJipj7DfXFryYJlaz010r03aRaKhuIHVjHu\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-19 05:39:55', '2021-11-19 05:39:55'),
(115, 1, 'admin/places', 'GET', '116.224.235.15', '[]', '2021-11-19 05:39:56', '2021-11-19 05:39:56'),
(116, 1, 'admin/places/2/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 05:39:57', '2021-11-19 05:39:57'),
(117, 1, 'admin/places/2', 'PUT', '116.224.235.15', '{\"name\":\"Icefields Parkway\",\"price\":\"2153\",\"location\":\"Icefields Parkway, Alberta\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This stretches for a straight 234 kilometers from Banff to Jasper. The Icefields Parkway offers you the picturesque panorama of Alberta\\u2019s most talked about mountain vistas.&nbsp;<\\/span><br\\/><\\/p>\",\"_token\":\"csmn0uJipj7DfXFryYJlaz010r03aRaKhuIHVjHu\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-19 05:40:05', '2021-11-19 05:40:05'),
(118, 1, 'admin/places', 'GET', '116.224.235.15', '[]', '2021-11-19 05:40:05', '2021-11-19 05:40:05'),
(119, 1, 'admin/places/3/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 05:40:30', '2021-11-19 05:40:30'),
(120, 1, 'admin/places/3', 'PUT', '116.224.235.15', '{\"name\":\"Moraine Lake\",\"price\":\"3456\",\"location\":\"Moraine Lake, Alberta\",\"stars\":\"3\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">Moraine Lake is yet another astonishing geographical location that you cannot afford to miss out on if you\\u2019re traveling along the Icefields Parkway.&nbsp;<\\/span><\\/p>\",\"_token\":\"csmn0uJipj7DfXFryYJlaz010r03aRaKhuIHVjHu\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-19 05:40:36', '2021-11-19 05:40:36'),
(121, 1, 'admin/places', 'GET', '116.224.235.15', '[]', '2021-11-19 05:40:37', '2021-11-19 05:40:37'),
(122, 1, 'admin/places/4/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 05:40:39', '2021-11-19 05:40:39'),
(123, 1, 'admin/places/4', 'PUT', '116.224.235.15', '{\"name\":\"Ontario\",\"price\":\"3312\",\"location\":\"Killarney Provincial Park\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">If you\\u2019re in Canada and if you\\u2019re a sucker for mountains, Killarney Provincial Park in&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\/ontario\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Ontario<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;is your best catch for Canada mountains near Toronto.&nbsp;<\\/span><\\/p>\",\"_token\":\"csmn0uJipj7DfXFryYJlaz010r03aRaKhuIHVjHu\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-19 05:40:44', '2021-11-19 05:40:44'),
(124, 1, 'admin/places', 'GET', '116.224.235.15', '[]', '2021-11-19 05:40:45', '2021-11-19 05:40:45'),
(125, 1, 'admin/articles', 'GET', '116.224.235.15', '[]', '2021-11-19 06:16:18', '2021-11-19 06:16:18'),
(126, 1, 'admin/places', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 06:16:20', '2021-11-19 06:16:20'),
(127, 1, 'admin/places/2/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 06:16:25', '2021-11-19 06:16:25'),
(128, 1, 'admin/places/2', 'PUT', '116.224.235.15', '{\"name\":\"Icefields Parkway\",\"price\":\"2153\",\"location\":\"Icefields , Alberta\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This stretches for a straight 234 kilometers from Banff to Jasper. The Icefields Parkway offers you the picturesque panorama of Alberta\\u2019s most talked about mountain vistas.&nbsp;<\\/span><br\\/><\\/p>\",\"_token\":\"csmn0uJipj7DfXFryYJlaz010r03aRaKhuIHVjHu\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-19 06:16:34', '2021-11-19 06:16:34'),
(129, 1, 'admin/places', 'GET', '116.224.235.15', '[]', '2021-11-19 06:16:34', '2021-11-19 06:16:34'),
(130, 1, 'admin/places/2/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 06:17:59', '2021-11-19 06:17:59'),
(131, 1, 'admin/places/2', 'PUT', '116.224.235.15', '{\"name\":\"Icefields\",\"price\":\"2153\",\"location\":\"Icefields, Alberta\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This stretches for a straight 234 kilometers from Banff to Jasper. The Icefields Parkway offers you the picturesque panorama of Alberta\\u2019s most talked about mountain vistas.&nbsp;<\\/span><br\\/><\\/p>\",\"_token\":\"csmn0uJipj7DfXFryYJlaz010r03aRaKhuIHVjHu\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-11-19 06:18:09', '2021-11-19 06:18:09'),
(132, 1, 'admin/places', 'GET', '116.224.235.15', '[]', '2021-11-19 06:18:09', '2021-11-19 06:18:09'),
(133, 1, 'admin/places/1/edit', 'GET', '116.224.235.15', '[]', '2021-11-19 06:59:35', '2021-11-19 06:59:35'),
(134, 1, 'admin/places', 'GET', '116.224.235.15', '[]', '2021-11-19 07:00:24', '2021-11-19 07:00:24'),
(135, 1, 'admin/places/2/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 07:00:27', '2021-11-19 07:00:27'),
(136, 1, 'admin/places', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 07:00:52', '2021-11-19 07:00:52'),
(137, 1, 'admin/places/3/edit', 'GET', '116.224.235.15', '{\"_pjax\":\"#pjax-container\"}', '2021-11-19 07:00:55', '2021-11-19 07:00:55'),
(138, 1, 'admin', 'GET', '82.205.1.223', '[]', '2021-12-08 03:52:01', '2021-12-08 03:52:01'),
(139, 1, 'admin/article-types', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 03:52:15', '2021-12-08 03:52:15'),
(140, 1, 'admin/articles', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 03:52:17', '2021-12-08 03:52:17'),
(141, 1, 'admin/places', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 03:52:26', '2021-12-08 03:52:26'),
(142, 1, 'admin/auth/users', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 03:52:34', '2021-12-08 03:52:34'),
(143, 1, 'admin/auth/setting', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 03:52:50', '2021-12-08 03:52:50'),
(144, 1, 'admin/article-types', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 03:52:58', '2021-12-08 03:52:58'),
(145, 1, 'admin/articles', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 03:53:00', '2021-12-08 03:53:00'),
(146, 1, 'admin/articles/create', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 03:53:03', '2021-12-08 03:53:03'),
(147, 1, 'admin/auth/permissions', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 03:53:08', '2021-12-08 03:53:08'),
(148, 1, 'admin/auth/menu', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 03:53:25', '2021-12-08 03:53:25'),
(149, 1, 'admin/auth/roles', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 03:53:33', '2021-12-08 03:53:33'),
(150, 1, 'admin/auth/roles', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2021-12-08 04:26:23', '2021-12-08 04:26:23'),
(151, 1, 'admin/auth/roles', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 04:26:29', '2021-12-08 04:26:29'),
(152, 1, 'admin/auth/roles', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 04:26:33', '2021-12-08 04:26:33'),
(153, 1, 'admin/article-types', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 04:26:35', '2021-12-08 04:26:35'),
(154, 1, 'admin/places', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 04:26:39', '2021-12-08 04:26:39'),
(155, 1, 'admin/places/create', 'GET', '82.205.1.223', '{\"_pjax\":\"#pjax-container\"}', '2021-12-08 04:26:44', '2021-12-08 04:26:44'),
(156, 1, 'admin/places', 'POST', '82.205.1.223', '{\"name\":\"Gaza\",\"price\":\"10\",\"location\":\"Palestine, Gaza\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p>Dome of the rock the beautiful and amazing human made architectural.<\\/p>\",\"_token\":\"jG1U1iWfeEo0sYzdJD2FlJzECW5vTYcBVk4Ka7Zl\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/places\"}', '2021-12-08 04:29:53', '2021-12-08 04:29:53'),
(157, 1, 'admin/places', 'GET', '82.205.1.223', '[]', '2021-12-08 04:29:54', '2021-12-08 04:29:54'),
(158, 1, 'admin/places', 'GET', '82.205.25.170', '[]', '2021-12-08 15:01:40', '2021-12-08 15:01:40'),
(159, 1, 'admin/articles', 'GET', '180.175.17.8', '[]', '2021-12-11 21:50:22', '2021-12-11 21:50:22'),
(160, 1, 'admin/places', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-11 21:50:24', '2021-12-11 21:50:24'),
(161, 1, 'admin/places/5/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-11 21:51:03', '2021-12-11 21:51:03'),
(162, 1, 'admin/places/5/edit', 'GET', '180.175.17.8', '[]', '2021-12-13 23:19:35', '2021-12-13 23:19:35'),
(163, 1, 'admin/articles', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-14 18:27:40', '2021-12-14 18:27:40'),
(164, 1, 'admin/places', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-14 18:27:43', '2021-12-14 18:27:43'),
(165, 1, 'admin/articles', 'GET', '223.104.212.153', '[]', '2021-12-17 22:21:45', '2021-12-17 22:21:45'),
(166, 1, 'admin/auth/users', 'GET', '223.104.212.153', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 22:21:52', '2021-12-17 22:21:52'),
(167, 1, 'admin/auth/users/1/edit', 'GET', '223.104.212.153', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 22:21:56', '2021-12-17 22:21:56'),
(168, 1, 'admin/auth/users/1', 'PUT', '223.104.212.153', '{\"username\":\"admin\",\"name\":\"Administrator\",\"password\":\"admin1234\",\"password_confirmation\":\"admin1234\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"lexAFNMUDD87ySnp2CrCWmWNoLMnqAZFYxRhtFP5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/mark.bslmeiyu.com\\/admin\\/auth\\/users\"}', '2021-12-17 22:22:14', '2021-12-17 22:22:14'),
(169, 1, 'admin/auth/users', 'GET', '223.104.212.153', '[]', '2021-12-17 22:22:14', '2021-12-17 22:22:14'),
(170, 1, 'admin/auth/logout', 'GET', '223.104.212.153', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 22:25:35', '2021-12-17 22:25:35'),
(171, 1, 'admin', 'GET', '223.104.212.153', '[]', '2021-12-17 22:25:52', '2021-12-17 22:25:52'),
(172, 1, 'admin', 'GET', '180.175.17.8', '[]', '2021-12-22 22:21:37', '2021-12-22 22:21:37'),
(173, 1, 'admin/places', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 22:32:01', '2021-12-22 22:32:01'),
(174, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 22:32:11', '2021-12-22 22:32:11'),
(175, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"British Columbia\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton.&nbsp;<\\/span><\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-22 22:32:39', '2021-12-22 22:32:39'),
(176, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 22:32:39', '2021-12-22 22:32:39'),
(177, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 22:33:54', '2021-12-22 22:33:54'),
(178, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 22:34:11', '2021-12-22 22:34:11'),
(179, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 22:58:48', '2021-12-22 22:58:48'),
(180, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"British Columbia\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton.&nbsp;<\\/span><\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-22 22:59:33', '2021-12-22 22:59:33'),
(181, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 22:59:33', '2021-12-22 22:59:33'),
(182, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 23:03:14', '2021-12-22 23:03:14'),
(183, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"British Columbia\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton.&nbsp;<\\/span><\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-22 23:03:35', '2021-12-22 23:03:35'),
(184, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 23:03:35', '2021-12-22 23:03:35'),
(185, 1, 'admin/places/2/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 23:03:38', '2021-12-22 23:03:38'),
(186, 1, 'admin/places/2', 'PUT', '180.175.17.8', '{\"name\":\"Sweet Dessert\",\"price\":\"2153\",\"location\":\"Icefields, Alberta\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p>The best sweet dessert<\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-22 23:04:26', '2021-12-22 23:04:26'),
(187, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 23:04:26', '2021-12-22 23:04:26'),
(188, 1, 'admin/places/3/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 23:04:31', '2021-12-22 23:04:31');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(189, 1, 'admin/places/3', 'PUT', '180.175.17.8', '{\"name\":\"Chinese Side\",\"price\":\"3456\",\"location\":\"Moraine Lake, Alberta\",\"stars\":\"3\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p style=\\\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Enjoy these flavors any time of day.<\\/p><p style=\\\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Whether it\\u2019s lunch or dinner, these side dish recipes are fit for the occasion. Pick out a couple and give them a try!<\\/p><p style=\\\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\\\">If you\\u2019re looking for something savory, you\\u2019ve come to the right place.<\\/p><p style=\\\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\\\">These side dishes are flavored with the best seasonings and spices China is known for.<\\/p><p style=\\\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Block out some time to spend in the kitchen and call a couple of close friends. You might need some help to finish these off!<\\/p><p><br\\/><\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-22 23:05:53', '2021-12-22 23:05:53'),
(190, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 23:05:53', '2021-12-22 23:05:53'),
(191, 1, 'admin/places/4/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 23:06:10', '2021-12-22 23:06:10'),
(192, 1, 'admin/places/4', 'PUT', '180.175.17.8', '{\"name\":\"Ontario\",\"price\":\"3312\",\"location\":\"Killarney Provincial Park\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p><a href=\\\"https:\\/\\/www.thespruceeats.com\\/introduction-to-cassava-yuca-2138084\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"1\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Yuca<\\/a><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">&nbsp;is a starchy root vegetable popular in Hispanic, Latin, and Caribbean cuisine. Used as an accompaniment for grilled meat or saucy preparations, yuca, also known as&nbsp;<\\/span><a href=\\\"https:\\/\\/www.thespruceeats.com\\/introduction-to-cassava-yuca-2138084\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"2\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; white-space: normal; background-color: rgb(255, 255, 255);\\\">cassava<\\/a><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">, can play the part of potatoes in pretty much any dish you can think of. By simply peeling, boiling, and mashing yuca, you&#39;ll have a delicious dish on your table that can serve as a side to stews or&nbsp;<\\/span><a href=\\\"https:\\/\\/www.thespruceeats.com\\/marinated-rump-roast-3058682\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"3\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; white-space: normal; background-color: rgb(255, 255, 255);\\\">roasts<\\/a><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">&nbsp;beautifully.<\\/span><\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-22 23:07:49', '2021-12-22 23:07:49'),
(193, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 23:07:49', '2021-12-22 23:07:49'),
(194, 1, 'admin/places/5/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 23:09:55', '2021-12-22 23:09:55'),
(195, 1, 'admin/places/5', 'PUT', '180.175.17.8', '{\"name\":\"Gaza\",\"price\":\"10\",\"location\":\"Palestine, Gaza\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">Commonly used in soups, eaten boiled with&nbsp;<\\/span><a href=\\\"https:\\/\\/www.thespruceeats.com\\/spanish-tomato-sauce-sofrito-sauce-recipe-3083539\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"1\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; white-space: normal; background-color: rgb(255, 255, 255);\\\">sofrito<\\/a><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">, or fried with a sprinkle of salt,&nbsp;<\\/span><a href=\\\"https:\\/\\/www.thespruceeats.com\\/cassava-yuca-recipes-2137742\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"2\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; white-space: normal; background-color: rgb(255, 255, 255);\\\">yuca<\\/a><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">&nbsp;is a wonderful addition to your ingredient list. It&#39;s affordable and widely available, so you can find it in most supermarkets and Latin stores.<\\/span><\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-22 23:10:36', '2021-12-22 23:10:36'),
(196, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 23:10:37', '2021-12-22 23:10:37'),
(197, 1, 'admin/places/5/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 23:11:59', '2021-12-22 23:11:59'),
(198, 1, 'admin/places/5', 'PUT', '180.175.17.8', '{\"name\":\"Creamed Yuca (Cassava)\",\"price\":\"10\",\"location\":\"China\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">Commonly used in soups, eaten boiled with&nbsp;<\\/span><a href=\\\"https:\\/\\/www.thespruceeats.com\\/spanish-tomato-sauce-sofrito-sauce-recipe-3083539\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"1\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; white-space: normal; background-color: rgb(255, 255, 255);\\\">sofrito<\\/a><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">, or fried with a sprinkle of salt,&nbsp;<\\/span><a href=\\\"https:\\/\\/www.thespruceeats.com\\/cassava-yuca-recipes-2137742\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"2\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; white-space: normal; background-color: rgb(255, 255, 255);\\\">yuca<\\/a><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">&nbsp;is a wonderful addition to your ingredient list. It&#39;s affordable and widely available, so you can find it in most supermarkets and Latin stores.<\\/span><\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-22 23:12:13', '2021-12-22 23:12:13'),
(199, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 23:12:13', '2021-12-22 23:12:13'),
(200, 1, 'admin/places/4/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 23:14:19', '2021-12-22 23:14:19'),
(201, 1, 'admin/places/4', 'PUT', '180.175.17.8', '{\"name\":\"Bitter Orange Marinade\",\"price\":\"33\",\"location\":\"Killarney Provincial Park\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p id=\\\"mntl-sc-block_1-0\\\" class=\\\"comp mntl-sc-block mntl-sc-block-html\\\" style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; padding: 0px; letter-spacing: -0.1px; counter-reset: section 0; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Bitter oranges are often used in Caribbean cuisine as a breakdown agent in marinades. Sometimes called sour oranges, they add a unique citrus flavor to any kind of meat you might want to prepare. This marinade recipe goes well with pork, and I&#39;ve also used it with chicken with great results.<\\/p><p id=\\\"mntl-sc-block_1-0-2\\\" class=\\\"comp mntl-sc-block mntl-sc-block-html\\\" style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; padding: 0px; letter-spacing: -0.1px; counter-reset: section 0; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Bitter oranges grow on trees\\u2014specifically the&nbsp;<em style=\\\"box-sizing: border-box;\\\">citrus aurantium&nbsp;<\\/em>tree. Their fruit is much sourer than regular oranges and, as the name suggests, they&#39;re bitter. The flesh carries a hint of an aftertaste when it&#39;s eaten raw. Bitter oranges are uglier than regular oranges, with thick, rough skin.&nbsp;<\\/p><p><br\\/><\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-22 23:15:25', '2021-12-22 23:15:25'),
(202, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 23:15:25', '2021-12-22 23:15:25'),
(203, 1, 'admin/places/4/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 23:15:58', '2021-12-22 23:15:58'),
(204, 1, 'admin/places', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 23:16:21', '2021-12-22 23:16:21'),
(205, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 23:22:57', '2021-12-22 23:22:57'),
(206, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">This 134 kilometers Highway 99 trail gives you a taste of the&nbsp;<\\/span><a href=\\\"https:\\/\\/traveltriangle.com\\/canada-tourism\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; background: rgb(255, 255, 255); color: rgb(0, 153, 255); text-decoration-line: none; outline: none; font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; white-space: normal;\\\">Canada<\\/a><span style=\\\"font-family: Verdana, arial, Geneva, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\\\">&nbsp;mountains, from Horseshoe Bay in the north of Vancouver to Pemberton.&nbsp;<\\/span><\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-22 23:23:21', '2021-12-22 23:23:21'),
(207, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-22 23:23:21', '2021-12-22 23:23:21'),
(208, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 01:00:18', '2021-12-23 01:00:18'),
(209, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul class=\\\"structured-ingredients__list text-passage list-paddingleft-2\\\" style=\\\"list-style-type: none;\\\"><li class=\\\"structured-ingredients__\\\" style=\\\"\\\"><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li class=\\\"structured-ingredients__\\\" style=\\\"\\\"><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">3<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">bitter oranges<\\/span>, or 3\\/4 cup bottled bitter orange juice<\\/p><\\/li><li class=\\\"structured-ingredients__\\\" style=\\\"\\\"><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">3<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">tablespoons<\\/span>&nbsp;<a href=\\\"https:\\/\\/www.thespruceeats.com\\/types-of-olive-oil-1807855\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"1\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s;\\\"><span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">olive oil<\\/span><\\/a><\\/p><\\/li><li class=\\\"structured-ingredients__\\\" style=\\\"\\\"><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">3&nbsp;<\\/span><span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">tablespoons<\\/span>&nbsp;finely chopped&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">fresh oregano leaves<\\/span><\\/p><\\/li><li class=\\\"structured-ingredients__\\\" style=\\\"\\\"><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">1<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">bay<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">leaf<\\/span>, preferably fresh, finely chopped<\\/p><\\/li><li class=\\\"structured-ingredients__\\\" style=\\\"\\\"><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">1\\/4<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">teaspoon<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">ground cumin<\\/span><\\/p><\\/li><li class=\\\"structured-ingredients__\\\" style=\\\"\\\"><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">Salt<\\/span>,<span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">&nbsp;to taste<\\/span><\\/p><\\/li><\\/ul><p><br\\/><\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-23 01:00:25', '2021-12-23 01:00:25'),
(210, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-23 01:00:25', '2021-12-23 01:00:25'),
(211, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 01:01:08', '2021-12-23 01:01:08'),
(212, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul class=\\\"structured-ingredients__list text-passage list-paddingleft-2\\\" style=\\\"list-style-type: none;\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">3<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">bitter oranges<\\/span>, or 3\\/4 cup bottled bitter orange juice<\\/p><\\/li><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">3<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">tablespoons<\\/span>&nbsp;<a href=\\\"https:\\/\\/www.thespruceeats.com\\/types-of-olive-oil-1807855\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"1\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s;\\\"><span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">olive oil<\\/span><\\/a><\\/p><\\/li><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">3&nbsp;<\\/span><span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">tablespoons<\\/span>&nbsp;finely chopped&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">fresh oregano leaves<\\/span><\\/p><\\/li><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">1<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">bay<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">leaf<\\/span>, preferably fresh, finely chopped<\\/p><\\/li><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">1\\/4<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">teaspoon<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">ground cumin<\\/span><\\/p><\\/li><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">Salt<\\/span>,<span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">&nbsp;to taste<\\/span><\\/p><\\/li><\\/ul><p><br\\/><\\/p><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p>You can make a passable substitute for sour orange juice by combining two parts regular orange juice with one part lemon juice and one part lime juice. Or, as an alternative, try two parts orange juice with one part grapefruit juice and a teaspoon of lime juice.<\\/p><\\/li><li><p>Add minced&nbsp;<a href=\\\"https:\\/\\/www.thespruceeats.com\\/hot-chile-peppers-scoville-scale-1807552\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"1\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s;\\\">hot peppers<\\/a>&nbsp;if you prefer a spicier marinade.&nbsp;<\\/p><\\/li><li><p>You can substitute one or more different fresh herbs for the oregano; thyme and sage are both good options.<\\/p><\\/li><\\/ul><p><br\\/><\\/p>\",\"_token\":\"RprprYTMQrKhj8cfk01DwqwkClMUGlw6yawxZK78\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-23 01:01:16', '2021-12-23 01:01:16'),
(213, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-23 01:01:16', '2021-12-23 01:01:16'),
(214, 1, 'admin', 'GET', '58.39.14.207', '[]', '2021-12-23 06:50:48', '2021-12-23 06:50:48'),
(215, 1, 'admin/places', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 06:50:52', '2021-12-23 06:50:52'),
(216, 1, 'admin/places/create', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 06:50:55', '2021-12-23 06:50:55'),
(217, 1, 'admin/places', 'POST', '58.39.14.207', '{\"name\":\"Creole Rice Side Dish Recipe\",\"price\":\"12\",\"location\":\"china\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<h2 id=\\\"mntl-sc-block_1-0-2\\\" class=\\\"comp mntl-sc-block lifestyle-sc-block-heading mntl-sc-block-heading\\\" style=\\\"box-sizing: border-box; margin: 1rem 0px 0.25rem; padding: 0px; font-weight: 500; font-size: 1.5rem; line-height: 1.25; font-family: &quot;Work Sans&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\\\"><span class=\\\"mntl-sc-block-heading__text\\\" style=\\\"box-sizing: border-box;\\\">Creole and Cajun Cookery<\\/span><\\/h2><p id=\\\"mntl-sc-block_1-0-3\\\" class=\\\"comp mntl-sc-block mntl-sc-block-html\\\" style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; padding: 0px; letter-spacing: -0.1px; counter-reset: section 0; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Creoles&nbsp;refer to the original European\\u2014particularly French and Spanish\\u2014settlers of New Orleans who were mostly from wealthy families, and who brought their personal chefs from Paris, Madrid, and other European capitals. Since many of the ingredients they traditionally used were unavailable locally, they adapted their recipes to include native Louisiana&nbsp;ingredients like shellfish&nbsp;<a href=\\\"https:\\/\\/www.thespruceeats.com\\/about-red-snapper-334338\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"1\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s;\\\">snapper<\\/a>, pompano, alligator, meats, game, and squash like cushaw and mirliton (chayote), sugar cane, and pecans. Add to that the cooking tips and seasonings from the native Indians, Caribbean, and African cooks, and this new style of <a href=\\\"https:\\/\\/www.thespruceeats.com\\/what-is-an-andouille-995561\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"2\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s;\\\">Creole cooking<\\/a>&nbsp;was born.<\\/p>\",\"_token\":\"Ezpf15qYXuW1IU9oXWCFIG9Azk9Rheatu0T51w0M\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-23 07:03:24', '2021-12-23 07:03:24'),
(218, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-23 07:03:24', '2021-12-23 07:03:24'),
(219, 1, 'admin/places/create', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 07:03:32', '2021-12-23 07:03:32'),
(220, 1, 'admin/places', 'POST', '58.39.14.207', '{\"name\":\"Cuban Fufu\",\"price\":\"10\",\"location\":\"Cuba\",\"stars\":\"5\",\"people\":\"0\",\"selected_people\":\"0\",\"description\":\"<p><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">Plantains are a popular ingredient in the Caribbean and are prepared in a variety of ways, similar to how potatoes are used in the United States. The tropical fruit can be incorporated into recipes when it is green as well as when it has ripened. One popular way to use&nbsp;<\\/span><a href=\\\"https:\\/\\/www.thespruceeats.com\\/introduction-to-plantains-2137973\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"1\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; white-space: normal; background-color: rgb(255, 255, 255);\\\">plantains<\\/a><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">&nbsp;is in a stuffing; in Puerto Rico green plantains are made into&nbsp;<\\/span><a href=\\\"https:\\/\\/www.thespruceeats.com\\/traditional-mofongo-recipe-2138186\\\" data-component=\\\"link\\\" data-source=\\\"inlineLink\\\" data-type=\\\"internalLink\\\" data-ordinal=\\\"2\\\" rel=\\\"noopener noreferrer\\\" style=\\\"box-sizing: border-box; text-decoration-line: none; background-image: linear-gradient(to right, rgb(0, 143, 185) 0px, rgb(0, 143, 185) 100%); background-position: 0px 97%; background-repeat: repeat-x; background-size: 100% 1px; color: rgb(0, 143, 185); transition: background-image 0.25s ease 0s, color 0.25s ease 0s; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; white-space: normal; background-color: rgb(255, 255, 255);\\\">mofongo<\\/a><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">&nbsp;and in Cuba, the stuffing is made with ripe plantains and called fufu.<\\/span><\\/p>\",\"_token\":\"Ezpf15qYXuW1IU9oXWCFIG9Azk9Rheatu0T51w0M\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-23 07:04:49', '2021-12-23 07:04:49'),
(221, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-23 07:04:49', '2021-12-23 07:04:49'),
(222, 1, 'admin/places/1/edit', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 09:05:55', '2021-12-24 09:05:55'),
(223, 1, 'admin/places/1', 'PUT', '58.39.14.207', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p><br\\/><\\/p>\",\"_token\":\"r8XWltlKUj6HDvHnGqL2Np0xa7pYWaW0vcuvZIls\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-24 09:06:06', '2021-12-24 09:06:06'),
(224, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-24 09:06:06', '2021-12-24 09:06:06'),
(225, 1, 'admin/places/2/edit', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 09:06:09', '2021-12-24 09:06:09'),
(226, 1, 'admin/places', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 09:06:12', '2021-12-24 09:06:12'),
(227, 1, 'admin/places/3/edit', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 09:06:15', '2021-12-24 09:06:15'),
(228, 1, 'admin/places/3', 'PUT', '58.39.14.207', '{\"name\":\"Chinese Side\",\"price\":\"3456\",\"location\":\"Moraine Lake, Alberta\",\"stars\":\"3\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p style=\\\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Enjoy these flavors any time of day.<\\/p><p><br\\/><\\/p>\",\"_token\":\"r8XWltlKUj6HDvHnGqL2Np0xa7pYWaW0vcuvZIls\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-24 09:06:22', '2021-12-24 09:06:22'),
(229, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-24 09:06:22', '2021-12-24 09:06:22'),
(230, 1, 'admin/places/4/edit', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 09:06:25', '2021-12-24 09:06:25'),
(231, 1, 'admin/places/4', 'PUT', '58.39.14.207', '{\"name\":\"Bitter Orange Marinade\",\"price\":\"33\",\"location\":\"Killarney Provincial Park\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p id=\\\"mntl-sc-block_1-0\\\" class=\\\"comp mntl-sc-block mntl-sc-block-html\\\" style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; padding: 0px; letter-spacing: -0.1px; counter-reset: section 0; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Bitter oranges are often used in Caribbean&nbsp;<\\/p><p><br\\/><\\/p>\",\"_token\":\"r8XWltlKUj6HDvHnGqL2Np0xa7pYWaW0vcuvZIls\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-24 09:06:36', '2021-12-24 09:06:36'),
(232, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-24 09:06:36', '2021-12-24 09:06:36'),
(233, 1, 'admin/places/5/edit', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 09:06:40', '2021-12-24 09:06:40'),
(234, 1, 'admin/places/5', 'PUT', '58.39.14.207', '{\"name\":\"Creamed Yuca (Cassava)\",\"price\":\"10\",\"location\":\"China\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">Commonly used in soups, eaten boiled&nbsp;<\\/span><\\/p>\",\"_token\":\"r8XWltlKUj6HDvHnGqL2Np0xa7pYWaW0vcuvZIls\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-24 09:06:48', '2021-12-24 09:06:48'),
(235, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-24 09:06:48', '2021-12-24 09:06:48'),
(236, 1, 'admin/places/7/edit', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 09:06:52', '2021-12-24 09:06:52'),
(237, 1, 'admin/places/7', 'PUT', '58.39.14.207', '{\"name\":\"Cuban Fufu\",\"price\":\"10\",\"location\":\"Cuba\",\"stars\":\"5\",\"people\":\"0\",\"selected_people\":\"0\",\"description\":\"<p><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">Plantains are a popular ingredient<\\/span><\\/p>\",\"_token\":\"r8XWltlKUj6HDvHnGqL2Np0xa7pYWaW0vcuvZIls\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-24 09:06:58', '2021-12-24 09:06:58'),
(238, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-24 09:06:58', '2021-12-24 09:06:58'),
(239, 1, 'admin/places/6/edit', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 09:07:01', '2021-12-24 09:07:01'),
(240, 1, 'admin/places/6', 'PUT', '58.39.14.207', '{\"name\":\"Creole Rice Side Dish Recipe\",\"price\":\"12\",\"location\":\"china\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<h2 id=\\\"mntl-sc-block_1-0-2\\\" class=\\\"comp mntl-sc-block lifestyle-sc-block-heading mntl-sc-block-heading\\\" style=\\\"box-sizing: border-box; margin: 1rem 0px 0.25rem; padding: 0px; font-weight: 500; font-size: 1.5rem; line-height: 1.25; font-family: &quot;Work Sans&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\\\"><span class=\\\"mntl-sc-block-heading__text\\\" style=\\\"box-sizing: border-box;\\\">Creole and Cajun Cookery<\\/span><\\/h2>\",\"_token\":\"r8XWltlKUj6HDvHnGqL2Np0xa7pYWaW0vcuvZIls\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-24 09:07:08', '2021-12-24 09:07:08'),
(241, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-24 09:07:08', '2021-12-24 09:07:08'),
(242, 1, 'admin', 'GET', '58.39.14.207', '[]', '2021-12-25 17:34:46', '2021-12-25 17:34:46'),
(243, 1, 'admin/places', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-25 17:35:02', '2021-12-25 17:35:02'),
(244, 1, 'admin/places/create', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-25 17:35:07', '2021-12-25 17:35:07'),
(245, 1, 'admin/places', 'POST', '58.39.14.207', '{\"name\":\"Dessert\",\"price\":\"5\",\"location\":\"china\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"2\",\"description\":\"<p>Amazing food to eat with.<\\/p>\",\"_token\":\"SARfHDUmZ3Q6eubD983mvsFXsEC9vWU8AHxVm169\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-25 17:36:29', '2021-12-25 17:36:29'),
(246, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-25 17:36:29', '2021-12-25 17:36:29'),
(247, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-25 17:47:05', '2021-12-25 17:47:05'),
(248, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-25 19:59:46', '2021-12-25 19:59:46'),
(249, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal in china\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p><br\\/><\\/p>\",\"_token\":\"sIUpDzEbW2wjjMdn7WrZlqKpT9MCP7hgSkejSuDO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-25 19:59:55', '2021-12-25 19:59:55'),
(250, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-25 19:59:55', '2021-12-25 19:59:55'),
(251, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-25 20:00:12', '2021-12-25 20:00:12'),
(252, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p><br\\/><\\/p>\",\"_token\":\"sIUpDzEbW2wjjMdn7WrZlqKpT9MCP7hgSkejSuDO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-25 20:00:21', '2021-12-25 20:00:21'),
(253, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-25 20:00:21', '2021-12-25 20:00:21'),
(254, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-25 20:02:13', '2021-12-25 20:02:13'),
(255, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal in china\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p><br\\/><\\/p>\",\"_token\":\"sIUpDzEbW2wjjMdn7WrZlqKpT9MCP7hgSkejSuDO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-25 20:02:22', '2021-12-25 20:02:22'),
(256, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-25 20:02:22', '2021-12-25 20:02:22'),
(257, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-25 20:15:27', '2021-12-25 20:15:27'),
(258, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p><br\\/><\\/p>\",\"_token\":\"sIUpDzEbW2wjjMdn7WrZlqKpT9MCP7hgSkejSuDO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-25 20:15:35', '2021-12-25 20:15:35'),
(259, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-25 20:15:35', '2021-12-25 20:15:35'),
(260, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-25 21:23:53', '2021-12-25 21:23:53');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(261, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal in china\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p><br\\/><\\/p>\",\"_token\":\"sIUpDzEbW2wjjMdn7WrZlqKpT9MCP7hgSkejSuDO\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-25 21:23:59', '2021-12-25 21:23:59'),
(262, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-25 21:23:59', '2021-12-25 21:23:59'),
(263, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-25 23:42:02', '2021-12-25 23:42:02'),
(264, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p><br\\/><\\/p>\",\"_token\":\"qeJb7ZfykBaL9kxprLFQn2TMxwyREiTAC1t4srHW\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-25 23:42:10', '2021-12-25 23:42:10'),
(265, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-25 23:42:10', '2021-12-25 23:42:10'),
(266, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-25 23:53:06', '2021-12-25 23:53:06'),
(267, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal in china\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Super garlic<br\\/><\\/p>\",\"_token\":\"qeJb7ZfykBaL9kxprLFQn2TMxwyREiTAC1t4srHW\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-25 23:53:26', '2021-12-25 23:53:26'),
(268, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-25 23:53:26', '2021-12-25 23:53:26'),
(269, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-25 23:53:34', '2021-12-25 23:53:34'),
(270, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Super garlic<br\\/><\\/p>\",\"_token\":\"qeJb7ZfykBaL9kxprLFQn2TMxwyREiTAC1t4srHW\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-25 23:59:27', '2021-12-25 23:59:27'),
(271, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-25 23:59:27', '2021-12-25 23:59:27'),
(272, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 00:06:57', '2021-12-26 00:06:57'),
(273, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal in china\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Super garlic<br\\/><\\/p>\",\"_token\":\"qeJb7ZfykBaL9kxprLFQn2TMxwyREiTAC1t4srHW\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-26 00:07:01', '2021-12-26 00:07:01'),
(274, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-26 00:07:01', '2021-12-26 00:07:01'),
(275, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 00:13:50', '2021-12-26 00:13:50'),
(276, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Super garlic<br\\/><\\/p>\",\"_token\":\"qeJb7ZfykBaL9kxprLFQn2TMxwyREiTAC1t4srHW\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-26 00:13:56', '2021-12-26 00:13:56'),
(277, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-26 00:13:56', '2021-12-26 00:13:56'),
(278, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 00:14:55', '2021-12-26 00:14:55'),
(279, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal in china\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Super garlic<br\\/><\\/p><p>&nbsp;&nbsp;&nbsp;&nbsp;big oninions<br\\/><\\/p>\",\"_token\":\"qeJb7ZfykBaL9kxprLFQn2TMxwyREiTAC1t4srHW\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-26 00:15:07', '2021-12-26 00:15:07'),
(280, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-26 00:15:07', '2021-12-26 00:15:07'),
(281, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 00:16:32', '2021-12-26 00:16:32'),
(282, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<header class=\\\"section__header \\\" style=\\\"box-sizing: border-box; margin: 1.875rem 0px 0px; padding: 0px 0px 1rem; position: relative; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><h2 class=\\\"section__title section__title--dashed\\\" style=\\\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0.2rem; font-weight: 400; font-size: 1.5rem; background-image: repeating-linear-gradient(to right, rgb(221, 221, 221) 0px, rgb(221, 221, 221) 50%, transparent 50%, transparent 100%); background-position: left bottom; background-repeat: repeat-x; background-size: 8px 2px; line-height: 1.6;\\\">Ingredients<\\/h2><\\/header><ul style=\\\"list-style-type: none;\\\" class=\\\" list-paddingleft-2\\\"><li><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; letter-spacing: -0.1px; display: inline-block;\\\"><span data-ingredient-quantity=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">5<\\/span>&nbsp;<span data-ingredient-unit=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">cloves<\\/span>&nbsp;<span data-ingredient-name=\\\"true\\\" style=\\\"box-sizing: border-box;\\\">garlic<\\/span>, minced<\\/p><\\/li><li><p>&nbsp;options.<\\/p><\\/li><\\/ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Super garlic<br\\/><\\/p><p><br\\/><\\/p>\",\"_token\":\"qeJb7ZfykBaL9kxprLFQn2TMxwyREiTAC1t4srHW\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-26 00:16:43', '2021-12-26 00:16:43'),
(283, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-26 00:16:43', '2021-12-26 00:16:43'),
(284, 1, 'admin/places/1/edit', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 08:17:47', '2021-12-26 08:17:47'),
(285, 1, 'admin/places/1', 'PUT', '58.39.14.207', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">Of five red bases, two are dedicated to salami (fennel and regular), and there&#39;s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">I think it&#39;s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">Rinaldo Di Stasio and Mallory Wall&#39;s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.<\\/p><p><br\\/><\\/p>\",\"_token\":\"JFWwRalUx4l7yXvLG6jEhHpXjZR6EHhvfIwX2wR9\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-26 08:17:55', '2021-12-26 08:17:55'),
(286, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-26 08:17:55', '2021-12-26 08:17:55'),
(287, 1, 'admin/places/6/edit', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 18:09:04', '2021-12-26 18:09:04'),
(288, 1, 'admin/places/6', 'PUT', '58.39.14.207', '{\"name\":\"Creole Rice Side Dish Recipe\",\"price\":\"12\",\"location\":\"china\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p>\",\"_token\":\"tFxmWiAvFsrB5gBB49iGh8okAF3XDNOXog3nZZCe\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-26 18:09:09', '2021-12-26 18:09:09'),
(289, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-26 18:09:09', '2021-12-26 18:09:09'),
(290, 1, 'admin/places/7/edit', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 18:09:16', '2021-12-26 18:09:16'),
(291, 1, 'admin/places/7', 'PUT', '58.39.14.207', '{\"name\":\"Cuban Fufu\",\"price\":\"10\",\"location\":\"Cuba\",\"stars\":\"5\",\"people\":\"0\",\"selected_people\":\"0\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p>\",\"_token\":\"tFxmWiAvFsrB5gBB49iGh8okAF3XDNOXog3nZZCe\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-26 18:09:23', '2021-12-26 18:09:23'),
(292, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-26 18:09:24', '2021-12-26 18:09:24'),
(293, 1, 'admin/places/2/edit', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 18:10:08', '2021-12-26 18:10:08'),
(294, 1, 'admin/places/2', 'PUT', '58.39.14.207', '{\"name\":\"Sweet Dessert\",\"price\":\"2153\",\"location\":\"Icefields, Alberta\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p>The best sweet dessert<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p>\",\"_token\":\"tFxmWiAvFsrB5gBB49iGh8okAF3XDNOXog3nZZCe\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-26 18:10:14', '2021-12-26 18:10:14'),
(295, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-26 18:10:14', '2021-12-26 18:10:14'),
(296, 1, 'admin', 'GET', '58.39.14.207', '[]', '2021-12-26 22:24:07', '2021-12-26 22:24:07'),
(297, 1, 'admin/places', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 22:24:09', '2021-12-26 22:24:09'),
(298, 1, 'admin/places/create', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 22:24:12', '2021-12-26 22:24:12'),
(299, 1, 'admin/places', 'POST', '58.39.14.207', '{\"name\":\"Biriani\",\"price\":\"8\",\"location\":\"BD\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander\\/cilantro, then par boiled lightly spiced rice.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow rice, as well as ghee (or melted butter) for buttery richness.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The pot is then covered and cooked over a low heat for about 25 minutes during which time the rice absorbs the aromas and flavours of the curry underneath, whilst still being beautifully fluffy.<\\/p><p><br\\/><\\/p>\",\"_token\":\"DSevs3ByBGwx5oOQgMnKjFvBh0zg3CuqAdi32Lbn\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-26 22:27:38', '2021-12-26 22:27:38'),
(300, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-26 22:27:38', '2021-12-26 22:27:38'),
(301, 1, 'admin/places/create', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 22:28:12', '2021-12-26 22:28:12'),
(302, 1, 'admin/places', 'POST', '58.39.14.207', '{\"name\":\"Chicken biriani\",\"price\":\"12\",\"location\":\"china\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\">Chicken Biryani Served in a Bowl Close Up Photo. Indian Food, Indian Style Rice and Chicken. #Biryani #ChickenBiryani #IndianFood #StockPhoto<\\/span><\\/p>\",\"_token\":\"DSevs3ByBGwx5oOQgMnKjFvBh0zg3CuqAdi32Lbn\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-26 22:29:47', '2021-12-26 22:29:47'),
(303, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-26 22:29:47', '2021-12-26 22:29:47'),
(304, 1, 'admin/places/create', 'GET', '58.39.14.207', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 22:35:07', '2021-12-26 22:35:07'),
(305, 1, 'admin/places', 'POST', '58.39.14.207', '{\"name\":\"Hilsha fish\",\"price\":\"12\",\"location\":\"china\",\"stars\":\"5\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.<\\/span><\\/p><p><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\"><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.<\\/span><\\/span><\\/p><p><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\"><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\"><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.<\\/span><\\/span><\\/span><\\/p>\",\"_token\":\"DSevs3ByBGwx5oOQgMnKjFvBh0zg3CuqAdi32Lbn\",\"_previous_\":\"https:\\/\\/shop.dbestech.com\\/admin\\/places\"}', '2021-12-26 22:35:34', '2021-12-26 22:35:34'),
(306, 1, 'admin/places', 'GET', '58.39.14.207', '[]', '2021-12-26 22:35:34', '2021-12-26 22:35:34'),
(307, 1, 'admin', 'GET', '180.175.17.8', '[]', '2021-12-28 00:30:14', '2021-12-28 00:30:14'),
(308, 1, 'admin', 'GET', '180.175.17.8', '[]', '2021-12-28 00:32:00', '2021-12-28 00:32:00'),
(309, 1, 'admin/places', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 00:32:55', '2021-12-28 00:32:55'),
(310, 1, 'admin', 'GET', '180.175.17.8', '[]', '2021-12-28 00:37:50', '2021-12-28 00:37:50'),
(311, 1, 'admin/places', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 00:38:05', '2021-12-28 00:38:05'),
(312, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 00:38:08', '2021-12-28 00:38:08'),
(313, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '[]', '2021-12-28 00:38:23', '2021-12-28 00:38:23'),
(314, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">This&nbsp;five red bases, two are dedicated to salami (fennel and regular), and there&#39;s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">I think it&#39;s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">Rinaldo Di Stasio and Mallory Wall&#39;s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.<\\/p><p><br\\/><\\/p>\",\"_token\":\"mW9sobVCPETMbDNxRhwi8qbb16F8LEZ6N5nQ8YgD\",\"_method\":\"PUT\"}', '2021-12-28 00:38:34', '2021-12-28 00:38:34'),
(315, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-28 00:38:34', '2021-12-28 00:38:34'),
(316, 1, 'admin/places/1/edit', 'GET', '180.175.17.8', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 00:40:14', '2021-12-28 00:40:14'),
(317, 1, 'admin/places/1', 'PUT', '180.175.17.8', '{\"name\":\"Nutritious fruit meal in china\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">This&nbsp;five red bases, two are dedicated to salami (fennel and regular), and there&#39;s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">I think it&#39;s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">Rinaldo Di Stasio and Mallory Wall&#39;s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.<\\/p><p><br\\/><\\/p>\",\"_token\":\"mW9sobVCPETMbDNxRhwi8qbb16F8LEZ6N5nQ8YgD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.dbestech.com\\/admin\\/places\"}', '2021-12-28 00:40:19', '2021-12-28 00:40:19'),
(318, 1, 'admin/places', 'GET', '180.175.17.8', '[]', '2021-12-28 00:40:19', '2021-12-28 00:40:19'),
(319, 1, 'admin/places', 'GET', '180.152.243.50', '[]', '2021-12-31 23:04:37', '2021-12-31 23:04:37'),
(320, 1, 'admin/places/3/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:15:18', '2021-12-31 23:15:18'),
(321, 1, 'admin/places/3', 'PUT', '180.152.243.50', '{\"name\":\"Chinese Side\",\"price\":\"3456\",\"location\":\"Moraine Lake, Alberta\",\"stars\":\"3\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p style=\\\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Enjoy these flavors any time of day.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/places\"}', '2021-12-31 23:15:27', '2021-12-31 23:15:27'),
(322, 1, 'admin/places/3/edit', 'GET', '180.152.243.50', '[]', '2021-12-31 23:15:27', '2021-12-31 23:15:27'),
(323, 1, 'admin/places/3', 'PUT', '180.152.243.50', '{\"name\":\"Chinese Side\",\"price\":\"3456\",\"location\":\"Moraine Lake, Alberta\",\"stars\":\"3\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p style=\\\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Enjoy these flavors any time of day.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\"}', '2021-12-31 23:16:26', '2021-12-31 23:16:26'),
(324, 1, 'admin/places', 'GET', '180.152.243.50', '[]', '2021-12-31 23:16:26', '2021-12-31 23:16:26'),
(325, 1, 'admin/places/6/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:16:46', '2021-12-31 23:16:46'),
(326, 1, 'admin/places/6', 'PUT', '180.152.243.50', '{\"name\":\"Creole Rice Side Dish Recipe\",\"price\":\"12\",\"location\":\"china\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/places\"}', '2021-12-31 23:16:53', '2021-12-31 23:16:53'),
(327, 1, 'admin/places', 'GET', '180.152.243.50', '[]', '2021-12-31 23:16:53', '2021-12-31 23:16:53'),
(328, 1, 'admin/places/3/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:20:14', '2021-12-31 23:20:14'),
(329, 1, 'admin/places/3', 'PUT', '180.152.243.50', '{\"name\":\"Chinese Side\",\"price\":\"3456\",\"location\":\"Moraine Lake, Alberta\",\"stars\":\"3\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p style=\\\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Enjoy these flavors any time of day.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/places\"}', '2021-12-31 23:20:20', '2021-12-31 23:20:20'),
(330, 1, 'admin/places', 'GET', '180.152.243.50', '[]', '2021-12-31 23:20:20', '2021-12-31 23:20:20'),
(331, 1, 'admin/places/6/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:20:25', '2021-12-31 23:20:25');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(332, 1, 'admin/places/6', 'PUT', '180.152.243.50', '{\"name\":\"Creole Rice Side Dish Recipe\",\"price\":\"12\",\"location\":\"china\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/places\"}', '2021-12-31 23:20:34', '2021-12-31 23:20:34'),
(333, 1, 'admin/places', 'GET', '180.152.243.50', '[]', '2021-12-31 23:20:34', '2021-12-31 23:20:34'),
(334, 1, 'admin/places/2/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:24:17', '2021-12-31 23:24:17'),
(335, 1, 'admin/places/2', 'PUT', '180.152.243.50', '{\"name\":\"Sweet Dessert\",\"price\":\"2153\",\"location\":\"Icefields, Alberta\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p>The best sweet dessert<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/places\"}', '2021-12-31 23:24:27', '2021-12-31 23:24:27'),
(336, 1, 'admin/places', 'GET', '180.152.243.50', '[]', '2021-12-31 23:24:27', '2021-12-31 23:24:27'),
(337, 1, 'admin/places', 'GET', '180.152.243.50', '[]', '2021-12-31 23:25:52', '2021-12-31 23:25:52'),
(338, 1, 'admin/article-types', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:25:56', '2021-12-31 23:25:56'),
(339, 1, 'admin/article-types/create', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:26:02', '2021-12-31 23:26:02'),
(340, 1, 'admin/article-types', 'POST', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Popular food\",\"description\":\"best food\",\"order\":\"1\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/article-types\"}', '2021-12-31 23:26:34', '2021-12-31 23:26:34'),
(341, 1, 'admin/article-types/create', 'GET', '180.152.243.50', '[]', '2021-12-31 23:26:34', '2021-12-31 23:26:34'),
(342, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:26:57', '2021-12-31 23:26:57'),
(343, 1, 'admin/auth/menu/11/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:27:01', '2021-12-31 23:27:01'),
(344, 1, 'admin/auth/menu/11', 'PUT', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Food\",\"icon\":\"fa-map-marker\",\"uri\":\"\\/places\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/auth\\/menu\"}', '2021-12-31 23:27:12', '2021-12-31 23:27:12'),
(345, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2021-12-31 23:27:13', '2021-12-31 23:27:13'),
(346, 1, 'admin/auth/menu/11/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:27:19', '2021-12-31 23:27:19'),
(347, 1, 'admin/auth/menu/11', 'PUT', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Food\",\"icon\":\"fa-beer\",\"uri\":\"\\/places\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/auth\\/menu\"}', '2021-12-31 23:27:49', '2021-12-31 23:27:49'),
(348, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2021-12-31 23:27:49', '2021-12-31 23:27:49'),
(349, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2021-12-31 23:27:51', '2021-12-31 23:27:51'),
(350, 1, 'admin/places', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:27:53', '2021-12-31 23:27:53'),
(351, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:27:58', '2021-12-31 23:27:58'),
(352, 1, 'admin/auth/menu/11/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:28:02', '2021-12-31 23:28:02'),
(353, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:28:19', '2021-12-31 23:28:19'),
(354, 1, 'admin/auth/menu/9', 'DELETE', '180.152.243.50', '{\"_method\":\"delete\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\"}', '2021-12-31 23:28:24', '2021-12-31 23:28:24'),
(355, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:28:25', '2021-12-31 23:28:25'),
(356, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2021-12-31 23:28:28', '2021-12-31 23:28:28'),
(357, 1, 'admin/article-types', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:28:35', '2021-12-31 23:28:35'),
(358, 1, 'admin/article-types', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:36:10', '2021-12-31 23:36:10'),
(359, 1, 'admin/article-types/create', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:37:05', '2021-12-31 23:37:05'),
(360, 1, 'admin/article-types', 'POST', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Popular food\",\"description\":\"best food\",\"order\":\"1\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/article-types\"}', '2021-12-31 23:37:20', '2021-12-31 23:37:20'),
(361, 1, 'admin/article-types/create', 'GET', '180.152.243.50', '[]', '2021-12-31 23:37:20', '2021-12-31 23:37:20'),
(362, 1, 'admin/article-types', 'POST', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Popular food\",\"description\":\"best food\",\"order\":\"1\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\"}', '2021-12-31 23:41:24', '2021-12-31 23:41:24'),
(363, 1, 'admin/article-types', 'GET', '180.152.243.50', '[]', '2021-12-31 23:41:24', '2021-12-31 23:41:24'),
(364, 1, 'admin/article-types/create', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:41:31', '2021-12-31 23:41:31'),
(365, 1, 'admin/article-types', 'POST', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Food\",\"description\":null,\"order\":\"1\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/article-types\"}', '2021-12-31 23:41:46', '2021-12-31 23:41:46'),
(366, 1, 'admin/article-types/create', 'GET', '180.152.243.50', '[]', '2021-12-31 23:41:46', '2021-12-31 23:41:46'),
(367, 1, 'admin/article-types', 'POST', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Food\",\"description\":\"all food\",\"order\":\"1\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\"}', '2021-12-31 23:41:54', '2021-12-31 23:41:54'),
(368, 1, 'admin/article-types', 'GET', '180.152.243.50', '[]', '2021-12-31 23:41:54', '2021-12-31 23:41:54'),
(369, 1, 'admin/article-types/create', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:42:03', '2021-12-31 23:42:03'),
(370, 1, 'admin/article-types', 'POST', '180.152.243.50', '{\"parent_id\":\"2\",\"title\":\"Recommended food\",\"description\":\"recommended food\",\"order\":\"1\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/article-types\"}', '2021-12-31 23:42:30', '2021-12-31 23:42:30'),
(371, 1, 'admin/article-types', 'GET', '180.152.243.50', '[]', '2021-12-31 23:42:30', '2021-12-31 23:42:30'),
(372, 1, 'admin/article-types', 'POST', '180.152.243.50', '{\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_order\":\"[{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":1},{\\\"id\\\":3}]}]\"}', '2021-12-31 23:42:39', '2021-12-31 23:42:39'),
(373, 1, 'admin/article-types', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:42:40', '2021-12-31 23:42:40'),
(374, 1, 'admin/article-types', 'GET', '180.152.243.50', '[]', '2021-12-31 23:42:42', '2021-12-31 23:42:42'),
(375, 1, 'admin/places', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:42:46', '2021-12-31 23:42:46'),
(376, 1, 'admin/places/create', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:42:48', '2021-12-31 23:42:48'),
(377, 1, 'admin/users', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:43:19', '2021-12-31 23:43:19'),
(378, 1, 'admin/users', 'GET', '180.152.243.50', '[]', '2021-12-31 23:53:24', '2021-12-31 23:53:24'),
(379, 1, 'admin/users', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:53:26', '2021-12-31 23:53:26'),
(380, 1, 'admin/article-types', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2021-12-31 23:53:27', '2021-12-31 23:53:27'),
(381, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:05:58', '2022-01-01 00:05:58'),
(382, 1, 'admin/auth/menu/11/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:06:06', '2022-01-01 00:06:06'),
(383, 1, 'admin/auth/menu/11', 'PUT', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Food\",\"icon\":\"fa-beer\",\"uri\":\"\\/foods\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/auth\\/menu\"}', '2022-01-01 00:06:15', '2022-01-01 00:06:15'),
(384, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2022-01-01 00:06:16', '2022-01-01 00:06:16'),
(385, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2022-01-01 00:06:38', '2022-01-01 00:06:38'),
(386, 1, 'admin/foods', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:06:47', '2022-01-01 00:06:47'),
(387, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:08:54', '2022-01-01 00:08:54'),
(388, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:09:10', '2022-01-01 00:09:10'),
(389, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:09:23', '2022-01-01 00:09:23'),
(390, 1, 'admin/auth/menu/8/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:09:28', '2022-01-01 00:09:28'),
(391, 1, 'admin/auth/menu/8', 'PUT', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Category\",\"icon\":\"fa-certificate\",\"uri\":\"\\/food-types\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/auth\\/menu\"}', '2022-01-01 00:09:40', '2022-01-01 00:09:40'),
(392, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2022-01-01 00:09:41', '2022-01-01 00:09:41'),
(393, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2022-01-01 00:09:51', '2022-01-01 00:09:51'),
(394, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2022-01-01 00:09:52', '2022-01-01 00:09:52'),
(395, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2022-01-01 00:11:25', '2022-01-01 00:11:25'),
(396, 1, 'admin', 'GET', '180.152.243.50', '[]', '2022-01-01 00:14:55', '2022-01-01 00:14:55'),
(397, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:15:11', '2022-01-01 00:15:11'),
(398, 1, 'admin/auth/menu/11/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:15:14', '2022-01-01 00:15:14'),
(399, 1, 'admin/foods', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:15:52', '2022-01-01 00:15:52'),
(400, 1, 'admin/foods/1/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:15:56', '2022-01-01 00:15:56'),
(401, 1, 'admin/food-types', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:16:33', '2022-01-01 00:16:33'),
(402, 1, 'admin/foods/1/edit', 'GET', '180.152.243.50', '[]', '2022-01-01 00:16:33', '2022-01-01 00:16:33'),
(403, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:16:42', '2022-01-01 00:16:42'),
(404, 1, 'admin/auth/menu/8/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:16:47', '2022-01-01 00:16:47'),
(405, 1, 'admin/auth/menu/8', 'PUT', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Food Category\",\"icon\":\"fa-certificate\",\"uri\":\"\\/food-types\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/auth\\/menu\"}', '2022-01-01 00:16:59', '2022-01-01 00:16:59'),
(406, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2022-01-01 00:16:59', '2022-01-01 00:16:59'),
(407, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2022-01-01 00:18:26', '2022-01-01 00:18:26'),
(408, 1, 'admin/food-types', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:18:28', '2022-01-01 00:18:28'),
(409, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2022-01-01 00:18:28', '2022-01-01 00:18:28'),
(410, 1, 'admin/food-types', 'GET', '180.152.243.50', '[]', '2022-01-01 00:20:10', '2022-01-01 00:20:10'),
(411, 1, 'admin/food-types', 'GET', '180.152.243.50', '[]', '2022-01-01 00:20:12', '2022-01-01 00:20:12'),
(412, 1, 'admin/food-types', 'GET', '180.152.243.50', '[]', '2022-01-01 00:20:13', '2022-01-01 00:20:13'),
(413, 1, 'admin/auth/menu', 'GET', '180.152.243.50', '[]', '2022-01-01 00:22:00', '2022-01-01 00:22:00'),
(414, 1, 'admin/food-types', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:22:03', '2022-01-01 00:22:03'),
(415, 1, 'admin/food-types/create', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:22:06', '2022-01-01 00:22:06'),
(416, 1, 'admin/food-types', 'POST', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Food\",\"description\":null,\"order\":\"1\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/food-types\"}', '2022-01-01 00:22:15', '2022-01-01 00:22:15'),
(417, 1, 'admin/food-types/create', 'GET', '180.152.243.50', '[]', '2022-01-01 00:22:15', '2022-01-01 00:22:15'),
(418, 1, 'admin/food-types', 'POST', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Food\",\"description\":\"all about food\",\"order\":\"1\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\"}', '2022-01-01 00:22:27', '2022-01-01 00:22:27'),
(419, 1, 'admin/food-types/create', 'GET', '180.152.243.50', '[]', '2022-01-01 00:22:27', '2022-01-01 00:22:27'),
(420, 1, 'admin/food-types', 'POST', '180.152.243.50', '{\"parent_id\":\"0\",\"title\":\"Food\",\"description\":\"all about food\",\"order\":\"1\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\"}', '2022-01-01 00:22:55', '2022-01-01 00:22:55'),
(421, 1, 'admin/food-types', 'GET', '180.152.243.50', '[]', '2022-01-01 00:22:55', '2022-01-01 00:22:55'),
(422, 1, 'admin/food-types/create', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:22:58', '2022-01-01 00:22:58'),
(423, 1, 'admin/food-types', 'POST', '180.152.243.50', '{\"parent_id\":\"1\",\"title\":\"Popular food\",\"description\":\"popular food\",\"order\":\"1\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/food-types\"}', '2022-01-01 00:23:10', '2022-01-01 00:23:10'),
(424, 1, 'admin/food-types', 'GET', '180.152.243.50', '[]', '2022-01-01 00:23:11', '2022-01-01 00:23:11'),
(425, 1, 'admin/food-types/create', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:23:13', '2022-01-01 00:23:13'),
(426, 1, 'admin/food-types', 'POST', '180.152.243.50', '{\"parent_id\":\"1\",\"title\":\"Recommended food\",\"description\":\"Recommended food\",\"order\":\"1\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/food-types\"}', '2022-01-01 00:23:25', '2022-01-01 00:23:25'),
(427, 1, 'admin/food-types', 'GET', '180.152.243.50', '[]', '2022-01-01 00:23:26', '2022-01-01 00:23:26'),
(428, 1, 'admin/foods', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:25:06', '2022-01-01 00:25:06'),
(429, 1, 'admin/foods/create', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:25:08', '2022-01-01 00:25:08'),
(430, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:25:09', '2022-01-01 00:25:09'),
(431, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:25:36', '2022-01-01 00:25:36'),
(432, 1, 'admin/foods/create', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:25:38', '2022-01-01 00:25:38'),
(433, 1, 'admin/foods', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:25:46', '2022-01-01 00:25:46'),
(434, 1, 'admin/foods/1/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:25:48', '2022-01-01 00:25:48'),
(435, 1, 'admin/foods/1', 'PUT', '180.152.243.50', '{\"name\":\"Nutritious fruit meal in china\",\"type_id\":\"2\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">This&nbsp;five red bases, two are dedicated to salami (fennel and regular), and there&#39;s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">I think it&#39;s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">Rinaldo Di Stasio and Mallory Wall&#39;s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-01 00:25:57', '2022-01-01 00:25:57'),
(436, 1, 'admin/foods/1/edit', 'GET', '180.152.243.50', '[]', '2022-01-01 00:25:58', '2022-01-01 00:25:58'),
(437, 1, 'admin/foods/1', 'PUT', '180.152.243.50', '{\"name\":\"Nutritious fruit meal in china\",\"type_id\":\"2\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">This&nbsp;five red bases, two are dedicated to salami (fennel and regular), and there&#39;s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">I think it&#39;s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">Rinaldo Di Stasio and Mallory Wall&#39;s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\"}', '2022-01-01 00:27:22', '2022-01-01 00:27:22'),
(438, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:27:22', '2022-01-01 00:27:22'),
(439, 1, 'admin/foods/1/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:27:29', '2022-01-01 00:27:29'),
(440, 1, 'admin/foods', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:30:52', '2022-01-01 00:30:52'),
(441, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:33:03', '2022-01-01 00:33:03'),
(442, 1, 'admin/foods/1/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:33:15', '2022-01-01 00:33:15'),
(443, 1, 'admin/foods', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:33:20', '2022-01-01 00:33:20'),
(444, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:33:22', '2022-01-01 00:33:22'),
(445, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:34:06', '2022-01-01 00:34:06'),
(446, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:34:08', '2022-01-01 00:34:08'),
(447, 1, 'admin/food-types', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:34:11', '2022-01-01 00:34:11'),
(448, 1, 'admin/foods', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:34:15', '2022-01-01 00:34:15'),
(449, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:35:55', '2022-01-01 00:35:55'),
(450, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:42:38', '2022-01-01 00:42:38'),
(451, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:42:40', '2022-01-01 00:42:40'),
(452, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:44:43', '2022-01-01 00:44:43'),
(453, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:44:45', '2022-01-01 00:44:45'),
(454, 1, 'admin/foods/2/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:54:34', '2022-01-01 00:54:34'),
(455, 1, 'admin/foods/2', 'PUT', '180.152.243.50', '{\"name\":\"Sweet Dessert\",\"type_id\":\"2\",\"price\":\"2153\",\"location\":\"Icefields, Alberta\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p>The best sweet dessert<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-01 00:54:42', '2022-01-01 00:54:42'),
(456, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:54:42', '2022-01-01 00:54:42'),
(457, 1, 'admin/foods/3/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:54:48', '2022-01-01 00:54:48'),
(458, 1, 'admin/foods/3', 'PUT', '180.152.243.50', '{\"name\":\"Chinese Side\",\"type_id\":\"3\",\"price\":\"3456\",\"location\":\"Moraine Lake, Alberta\",\"stars\":\"3\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p style=\\\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Enjoy these flavors any time of day.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-01 00:54:53', '2022-01-01 00:54:53'),
(459, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:54:54', '2022-01-01 00:54:54'),
(460, 1, 'admin/foods/4/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:54:58', '2022-01-01 00:54:58'),
(461, 1, 'admin/foods/4', 'PUT', '180.152.243.50', '{\"name\":\"Bitter Orange Marinade\",\"type_id\":\"3\",\"price\":\"33\",\"location\":\"Killarney Provincial Park\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"3\",\"description\":\"<p id=\\\"mntl-sc-block_1-0\\\" class=\\\"comp mntl-sc-block mntl-sc-block-html\\\" style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; padding: 0px; letter-spacing: -0.1px; counter-reset: section 0; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; white-space: normal; background-color: rgb(255, 255, 255);\\\">Bitter oranges are often used in Caribbean&nbsp;<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-01 00:55:05', '2022-01-01 00:55:05'),
(462, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:55:06', '2022-01-01 00:55:06'),
(463, 1, 'admin/foods/5/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:55:10', '2022-01-01 00:55:10'),
(464, 1, 'admin/foods/5', 'PUT', '180.152.243.50', '{\"name\":\"Creamed Yuca (Cassava)\",\"type_id\":\"3\",\"price\":\"10\",\"location\":\"China\",\"stars\":\"5\",\"people\":\"5\",\"selected_people\":\"4\",\"description\":\"<p><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">Commonly used in soups, eaten boiled&nbsp;<\\/span><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-01 00:55:44', '2022-01-01 00:55:44'),
(465, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:55:45', '2022-01-01 00:55:45'),
(466, 1, 'admin/foods/6/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:55:53', '2022-01-01 00:55:53'),
(467, 1, 'admin/foods/6', 'PUT', '180.152.243.50', '{\"name\":\"Creole Rice Side Dish Recipe\",\"type_id\":\"2\",\"price\":\"12\",\"location\":\"china\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-01 00:56:02', '2022-01-01 00:56:02'),
(468, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:56:03', '2022-01-01 00:56:03'),
(469, 1, 'admin/foods/11/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:56:12', '2022-01-01 00:56:12'),
(470, 1, 'admin/foods/11', 'PUT', '180.152.243.50', '{\"name\":\"Hilsha fish\",\"type_id\":\"2\",\"price\":\"12\",\"location\":\"china\",\"stars\":\"5\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.<\\/span><\\/p><p><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\"><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.<\\/span><\\/span><\\/p><p><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\"><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\"><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.<\\/span><\\/span><\\/span><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-01 00:56:22', '2022-01-01 00:56:22'),
(471, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:56:22', '2022-01-01 00:56:22'),
(472, 1, 'admin/foods/10/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:56:27', '2022-01-01 00:56:27'),
(473, 1, 'admin/foods/10', 'PUT', '180.152.243.50', '{\"name\":\"Chicken biriani\",\"type_id\":\"2\",\"price\":\"12\",\"location\":\"china\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<p><span style=\\\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;\\u30d2\\u30e9\\u30ae\\u30ce\\u89d2\\u30b4 Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, \\u30e1\\u30a4\\u30ea\\u30aa, Meiryo, &quot;\\uff2d\\uff33 \\uff30\\u30b4\\u30b7\\u30c3\\u30af&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\\\">Chicken Biryani Served in a Bowl Close Up Photo. Indian Food, Indian Style Rice and Chicken. #Biryani #ChickenBiryani #IndianFood #StockPhoto<\\/span><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-01 00:56:33', '2022-01-01 00:56:33'),
(474, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:56:34', '2022-01-01 00:56:34'),
(475, 1, 'admin/foods/7/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:56:38', '2022-01-01 00:56:38');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(476, 1, 'admin/foods/7', 'PUT', '180.152.243.50', '{\"name\":\"Cuban Fufu\",\"type_id\":\"2\",\"price\":\"10\",\"location\":\"Cuba\",\"stars\":\"5\",\"people\":\"0\",\"selected_people\":\"0\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-01 00:56:45', '2022-01-01 00:56:45'),
(477, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:56:45', '2022-01-01 00:56:45'),
(478, 1, 'admin/foods/8/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:56:51', '2022-01-01 00:56:51'),
(479, 1, 'admin/foods/8', 'PUT', '180.152.243.50', '{\"name\":\"Dessert\",\"type_id\":\"3\",\"price\":\"5\",\"location\":\"china\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"2\",\"description\":\"<p>Amazing food to eat with.<\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-01 00:57:01', '2022-01-01 00:57:01'),
(480, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:57:01', '2022-01-01 00:57:01'),
(481, 1, 'admin/foods/9/edit', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-01 00:57:07', '2022-01-01 00:57:07'),
(482, 1, 'admin/foods/9', 'PUT', '180.152.243.50', '{\"name\":\"Biriani\",\"type_id\":\"3\",\"price\":\"8\",\"location\":\"BD\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander\\/cilantro, then par boiled lightly spiced rice.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow rice, as well as ghee (or melted butter) for buttery richness.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The pot is then covered and cooked over a low heat for about 25 minutes during which time the rice absorbs the aromas and flavours of the curry underneath, whilst still being beautifully fluffy.<\\/p><p><br\\/><\\/p>\",\"_token\":\"RhrQGjMJOWd16hG4DatOkRZyu2QwiMqsrNxMU8kC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/dbf.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-01 00:57:16', '2022-01-01 00:57:16'),
(483, 1, 'admin/foods', 'GET', '180.152.243.50', '[]', '2022-01-01 00:57:17', '2022-01-01 00:57:17'),
(484, 1, 'admin', 'GET', '180.152.243.50', '[]', '2022-01-09 17:05:12', '2022-01-09 17:05:12'),
(485, 1, 'admin/foods', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-09 17:05:28', '2022-01-09 17:05:28'),
(486, 1, 'admin/users', 'GET', '180.152.243.50', '{\"_pjax\":\"#pjax-container\"}', '2022-01-09 17:05:31', '2022-01-09 17:05:31'),
(487, 1, 'admin', 'GET', '180.175.21.130', '[]', '2022-01-13 00:57:03', '2022-01-13 00:57:03'),
(488, 1, 'admin', 'GET', '180.175.21.130', '[]', '2022-01-13 23:09:11', '2022-01-13 23:09:11'),
(489, 1, 'admin', 'GET', '180.175.21.130', '[]', '2022-01-13 23:10:52', '2022-01-13 23:10:52'),
(490, 1, 'admin', 'GET', '180.175.21.130', '[]', '2022-01-13 23:13:20', '2022-01-13 23:13:20'),
(491, 1, 'admin', 'GET', '180.175.21.130', '[]', '2022-01-13 23:13:47', '2022-01-13 23:13:47'),
(492, 1, 'admin', 'GET', '180.175.21.130', '[]', '2022-01-17 23:57:08', '2022-01-17 23:57:08'),
(493, 1, 'admin/foods', 'GET', '180.175.21.130', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 23:57:49', '2022-01-17 23:57:49'),
(494, 1, 'admin/foods/9/edit', 'GET', '180.175.21.130', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 23:57:56', '2022-01-17 23:57:56'),
(495, 1, 'admin', 'GET', '180.175.21.130', '[]', '2022-01-18 23:23:20', '2022-01-18 23:23:20'),
(496, 1, 'admin', 'GET', '180.175.21.130', '[]', '2022-01-21 02:25:58', '2022-01-21 02:25:58'),
(497, 1, 'admin/food-types', 'GET', '180.175.21.130', '{\"_pjax\":\"#pjax-container\"}', '2022-01-21 02:26:01', '2022-01-21 02:26:01'),
(498, 1, 'admin/foods', 'GET', '180.175.21.130', '{\"_pjax\":\"#pjax-container\"}', '2022-01-21 02:26:06', '2022-01-21 02:26:06'),
(499, 1, 'admin/foods/2/edit', 'GET', '180.175.21.130', '{\"_pjax\":\"#pjax-container\"}', '2022-01-21 02:26:16', '2022-01-21 02:26:16'),
(500, 1, 'admin/foods', 'GET', '180.175.21.130', '{\"_pjax\":\"#pjax-container\"}', '2022-01-21 02:26:18', '2022-01-21 02:26:18'),
(501, 1, 'admin/foods/6/edit', 'GET', '180.175.21.130', '{\"_pjax\":\"#pjax-container\"}', '2022-01-21 02:26:22', '2022-01-21 02:26:22'),
(502, 1, 'admin/foods', 'GET', '180.175.21.130', '{\"_pjax\":\"#pjax-container\"}', '2022-01-21 02:26:25', '2022-01-21 02:26:25'),
(503, 1, 'admin/foods/10/edit', 'GET', '180.175.21.130', '{\"_pjax\":\"#pjax-container\"}', '2022-01-21 02:26:28', '2022-01-21 02:26:28'),
(504, 1, 'admin/foods', 'GET', '180.175.21.130', '{\"_pjax\":\"#pjax-container\"}', '2022-01-21 02:26:30', '2022-01-21 02:26:30'),
(505, 1, 'admin/foods/6/edit', 'GET', '180.175.21.130', '{\"_pjax\":\"#pjax-container\"}', '2022-01-21 02:27:58', '2022-01-21 02:27:58'),
(506, 1, 'admin/foods/6', 'PUT', '180.175.21.130', '{\"name\":\"Creole Rice Side Dish Recipe\",\"type_id\":\"2\",\"price\":\"18\",\"location\":\"china\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"3\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull \\u2013 equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\\\">Genesis<\\/em>, goes straight for the jugular of unceded sovereignty.<\\/p><p><br\\/><\\/p>\",\"_token\":\"a1BPjQL4YiuckcckRvhImPYDBgVgnOAziaubS7Pb\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/mvs.bslmeiyu.com\\/admin\\/foods\"}', '2022-01-21 02:28:04', '2022-01-21 02:28:04'),
(507, 1, 'admin/foods', 'GET', '180.175.21.130', '[]', '2022-01-21 02:28:04', '2022-01-21 02:28:04'),
(508, 1, 'admin/foods', 'GET', '180.175.21.130', '[]', '2022-01-22 00:35:18', '2022-01-22 00:35:18'),
(509, 1, 'admin', 'GET', '180.175.21.130', '[]', '2022-02-07 22:57:22', '2022-02-07 22:57:22'),
(510, 1, 'admin', 'GET', '198.255.45.131', '[]', '2022-02-09 07:33:32', '2022-02-09 07:33:32'),
(511, 1, 'admin', 'GET', '198.255.45.131', '[]', '2022-02-09 07:33:34', '2022-02-09 07:33:34'),
(512, 1, 'admin/users', 'GET', '198.255.45.131', '[]', '2022-02-09 07:34:12', '2022-02-09 07:34:12'),
(513, 1, 'admin/users', 'GET', '198.255.45.131', '[]', '2022-02-09 07:35:09', '2022-02-09 07:35:09'),
(514, 1, 'admin/users', 'GET', '198.255.45.131', '[]', '2022-02-09 07:35:41', '2022-02-09 07:35:41'),
(515, 1, 'admin/users', 'GET', '198.255.45.131', '[]', '2022-02-09 07:38:34', '2022-02-09 07:38:34'),
(516, 1, 'admin/food-types', 'GET', '198.255.45.131', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 07:38:40', '2022-02-09 07:38:40'),
(517, 1, 'admin/users', 'GET', '198.255.45.131', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 07:38:42', '2022-02-09 07:38:42'),
(518, 1, 'admin/foods', 'GET', '198.255.45.131', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 07:38:45', '2022-02-09 07:38:45'),
(519, 1, 'admin/foods/create', 'GET', '198.255.45.131', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 07:38:54', '2022-02-09 07:38:54'),
(520, 1, 'admin/foods/create', 'GET', '198.255.45.131', '[]', '2022-02-09 07:40:27', '2022-02-09 07:40:27'),
(521, 1, 'admin/auth/menu', 'GET', '104.223.97.2', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:26:18', '2022-02-09 18:26:18'),
(522, 1, 'admin/auth/menu', 'POST', '104.223.97.2', '{\"parent_id\":\"0\",\"title\":\"Orders\",\"icon\":\"fa-first-order\",\"uri\":\"\\/orders\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"8TsmcTdNvmI00f4i4pNJ4DniqL5L6aM0a2Dfd5Ik\"}', '2022-02-09 18:27:25', '2022-02-09 18:27:25'),
(523, 1, 'admin/auth/menu', 'GET', '104.223.97.2', '[]', '2022-02-09 18:27:25', '2022-02-09 18:27:25'),
(524, 1, 'admin/auth/menu', 'GET', '104.223.97.2', '[]', '2022-02-09 18:27:44', '2022-02-09 18:27:44'),
(525, 1, 'admin/orders', 'GET', '104.223.97.2', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:27:47', '2022-02-09 18:27:47'),
(526, 1, 'admin/orders', 'GET', '104.223.97.2', '{\"_pjax\":\"#pjax-container\",\"page\":\"6\"}', '2022-02-09 18:35:37', '2022-02-09 18:35:37'),
(527, 1, 'admin/orders/100101/edit', 'GET', '104.223.97.2', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:38:39', '2022-02-09 18:38:39'),
(528, 1, 'admin/orders/100101/edit', 'GET', '58.39.68.12', '[]', '2022-02-09 18:43:58', '2022-02-09 18:43:58'),
(529, 1, 'admin/orders/100101/edit', 'GET', '58.39.68.12', '[]', '2022-02-09 18:44:16', '2022-02-09 18:44:16'),
(530, 1, 'admin/orders/100101/edit', 'GET', '58.39.68.12', '[]', '2022-02-09 18:44:31', '2022-02-09 18:44:31'),
(531, 1, 'admin/orders/100101/edit', 'GET', '58.39.68.12', '[]', '2022-02-09 18:44:54', '2022-02-09 18:44:54'),
(532, 1, 'admin/orders', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:46:05', '2022-02-09 18:46:05'),
(533, 1, 'admin/orders/100001/edit', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:46:12', '2022-02-09 18:46:12'),
(534, 1, 'admin/orders', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:53:44', '2022-02-09 18:53:44'),
(535, 1, 'admin/orders/100001/edit', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:54:07', '2022-02-09 18:54:07'),
(536, 1, 'admin/orders', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:54:08', '2022-02-09 18:54:08'),
(537, 1, 'admin/orders/100001/edit', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:54:09', '2022-02-09 18:54:09'),
(538, 1, 'admin/orders', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:54:10', '2022-02-09 18:54:10'),
(539, 1, 'admin/orders/100001/edit', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:54:51', '2022-02-09 18:54:51'),
(540, 1, 'admin/orders', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:54:52', '2022-02-09 18:54:52'),
(541, 1, 'admin/orders/100001/edit', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:54:55', '2022-02-09 18:54:55'),
(542, 1, 'admin/orders', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:56:26', '2022-02-09 18:56:26'),
(543, 1, 'admin/orders', 'GET', '58.39.68.12', '[]', '2022-02-09 18:56:27', '2022-02-09 18:56:27'),
(544, 1, 'admin/orders', 'GET', '58.39.68.12', '{\"page\":\"6\",\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:57:30', '2022-02-09 18:57:30'),
(545, 1, 'admin/orders', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:57:32', '2022-02-09 18:57:32'),
(546, 1, 'admin/orders', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\",\"page\":\"6\"}', '2022-02-09 18:57:35', '2022-02-09 18:57:35'),
(547, 1, 'admin/orders/100106/edit', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 18:57:56', '2022-02-09 18:57:56'),
(548, 1, 'admin', 'GET', '103.235.1.9', '[]', '2022-02-25 08:55:46', '2022-02-25 08:55:46'),
(549, 1, 'admin/food-types', 'GET', '103.235.1.9', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 08:55:59', '2022-02-25 08:55:59'),
(550, 1, 'admin/food-types/2/edit', 'GET', '103.235.1.9', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 08:56:04', '2022-02-25 08:56:04'),
(551, 1, 'admin/foods', 'GET', '103.235.1.9', '{\"_pjax\":\"#pjax-container\"}', '2022-02-25 08:56:09', '2022-02-25 08:56:09'),
(552, 1, 'admin', 'GET', '103.54.43.215', '[]', '2022-02-27 03:14:41', '2022-02-27 03:14:41'),
(553, 1, 'admin', 'GET', '103.54.43.215', '[]', '2022-02-27 03:16:31', '2022-02-27 03:16:31'),
(554, 1, 'admin', 'GET', '103.54.43.215', '[]', '2022-02-27 03:45:36', '2022-02-27 03:45:36'),
(555, 1, 'admin', 'GET', '103.54.43.215', '[]', '2022-02-27 03:45:47', '2022-02-27 03:45:47'),
(556, 1, 'admin/auth/users', 'GET', '103.54.43.215', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 03:46:03', '2022-02-27 03:46:03'),
(557, 1, 'admin/auth/permissions', 'GET', '103.54.43.215', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 03:46:06', '2022-02-27 03:46:06'),
(558, 1, 'admin/food-types', 'GET', '103.54.43.215', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 03:46:10', '2022-02-27 03:46:10'),
(559, 1, 'admin/food-types', 'GET', '103.54.43.215', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 03:46:14', '2022-02-27 03:46:14'),
(560, 1, 'admin/food-types', 'GET', '103.54.43.215', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 03:46:17', '2022-02-27 03:46:17'),
(561, 1, 'admin/foods', 'GET', '103.54.43.215', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 03:46:22', '2022-02-27 03:46:22'),
(562, 1, 'admin', 'GET', '58.39.68.12', '[]', '2022-02-27 22:23:22', '2022-02-27 22:23:22'),
(563, 1, 'admin/auth/menu', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 22:23:34', '2022-02-27 22:23:34'),
(564, 1, 'admin/auth/menu', 'POST', '58.39.68.12', '{\"parent_id\":\"0\",\"title\":\"Payment Setting\",\"icon\":\"fa-dollar\",\"uri\":\"\\/business-settings\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"AD5CeNJUhat68Q5go4paKEGp23DTYgzCh5NQNAz7\"}', '2022-02-27 22:24:23', '2022-02-27 22:24:23'),
(565, 1, 'admin/auth/menu', 'GET', '58.39.68.12', '[]', '2022-02-27 22:24:23', '2022-02-27 22:24:23'),
(566, 1, 'admin/auth/menu', 'GET', '58.39.68.12', '[]', '2022-02-27 22:24:26', '2022-02-27 22:24:26'),
(567, 1, 'admin/business-settings', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 22:24:28', '2022-02-27 22:24:28'),
(568, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 22:24:32', '2022-02-27 22:24:32'),
(569, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '[]', '2022-02-27 22:38:35', '2022-02-27 22:38:35'),
(570, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '[]', '2022-02-27 22:44:43', '2022-02-27 22:44:43'),
(571, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '[]', '2022-02-27 22:45:29', '2022-02-27 22:45:29'),
(572, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '[]', '2022-02-27 22:45:41', '2022-02-27 22:45:41'),
(573, 1, 'admin/business-settings', 'POST', '58.39.68.12', '{\"key\":\"test\",\"client_id\":\"734490u\",\"secret_id\":\"isjfuh\",\"_token\":\"AD5CeNJUhat68Q5go4paKEGp23DTYgzCh5NQNAz7\"}', '2022-02-27 22:45:52', '2022-02-27 22:45:52'),
(574, 1, 'admin/business-settings', 'GET', '58.39.68.12', '[]', '2022-02-27 22:45:52', '2022-02-27 22:45:52'),
(575, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 22:46:06', '2022-02-27 22:46:06'),
(576, 1, 'admin/business-settings', 'POST', '58.39.68.12', '{\"key\":\"test\",\"client_id\":\"ss\",\"secret_id\":\"ss\",\"_token\":\"AD5CeNJUhat68Q5go4paKEGp23DTYgzCh5NQNAz7\",\"_previous_\":\"https:\\/\\/mvs.bslmeiyu.com\\/admin\\/business-settings\"}', '2022-02-27 22:46:12', '2022-02-27 22:46:12'),
(577, 1, 'admin/business-settings', 'GET', '58.39.68.12', '[]', '2022-02-27 22:46:12', '2022-02-27 22:46:12'),
(578, 1, 'admin/business-settings', 'GET', '58.39.68.12', '[]', '2022-02-27 22:47:19', '2022-02-27 22:47:19'),
(579, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 22:47:21', '2022-02-27 22:47:21'),
(580, 1, 'admin/business-settings', 'POST', '58.39.68.12', '{\"key\":\"test\",\"client_id\":\"734490u\",\"secret_id\":\"ss\",\"_token\":\"AD5CeNJUhat68Q5go4paKEGp23DTYgzCh5NQNAz7\",\"_previous_\":\"https:\\/\\/mvs.bslmeiyu.com\\/admin\\/business-settings\"}', '2022-02-27 22:47:27', '2022-02-27 22:47:27'),
(581, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '[]', '2022-02-27 22:47:27', '2022-02-27 22:47:27'),
(582, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '[]', '2022-02-27 22:48:42', '2022-02-27 22:48:42'),
(583, 1, 'admin/business-settings', 'POST', '58.39.68.12', '{\"key\":\"test\",\"client_id\":\"ss\",\"secret_id\":\"ss\",\"_token\":\"AD5CeNJUhat68Q5go4paKEGp23DTYgzCh5NQNAz7\"}', '2022-02-27 22:48:48', '2022-02-27 22:48:48'),
(584, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '[]', '2022-02-27 22:48:48', '2022-02-27 22:48:48'),
(585, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '[]', '2022-02-27 22:50:49', '2022-02-27 22:50:49'),
(586, 1, 'admin/business-settings', 'POST', '58.39.68.12', '{\"key\":\"test\",\"_token\":\"AD5CeNJUhat68Q5go4paKEGp23DTYgzCh5NQNAz7\"}', '2022-02-27 22:50:52', '2022-02-27 22:50:52'),
(587, 1, 'admin/business-settings/create', 'GET', '58.39.68.12', '[]', '2022-02-27 22:50:52', '2022-02-27 22:50:52'),
(588, 1, 'admin/business-settings/create', 'GET', '198.255.45.131', '[]', '2022-02-27 23:05:13', '2022-02-27 23:05:13'),
(589, 1, 'admin/business-settings/create', 'GET', '198.255.45.131', '[]', '2022-02-27 23:05:31', '2022-02-27 23:05:31'),
(590, 1, 'admin/business-settings', 'POST', '198.255.45.131', '{\"key\":\"test\",\"value\":\"jshs\",\"_token\":\"AD5CeNJUhat68Q5go4paKEGp23DTYgzCh5NQNAz7\"}', '2022-02-27 23:05:36', '2022-02-27 23:05:36'),
(591, 1, 'admin/business-settings', 'GET', '198.255.45.131', '[]', '2022-02-27 23:05:37', '2022-02-27 23:05:37'),
(592, 1, 'admin/business-settings/create', 'GET', '198.255.45.131', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 23:08:40', '2022-02-27 23:08:40'),
(593, 1, 'admin/business-settings', 'POST', '198.255.45.131', '{\"key\":\"test\",\"value\":{\"client id\":\"shfsuhsf\",\"Secret id\":\"ksfhkhshiuhf\"},\"_token\":\"AD5CeNJUhat68Q5go4paKEGp23DTYgzCh5NQNAz7\",\"_previous_\":\"https:\\/\\/mvs.bslmeiyu.com\\/admin\\/business-settings\"}', '2022-02-27 23:09:10', '2022-02-27 23:09:10'),
(594, 1, 'admin/business-settings', 'GET', '198.255.45.131', '[]', '2022-02-27 23:09:10', '2022-02-27 23:09:10'),
(595, 1, 'admin/business-settings/create', 'GET', '198.255.45.131', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 23:14:52', '2022-02-27 23:14:52'),
(596, 1, 'admin/business-settings/create', 'GET', '198.255.45.131', '[]', '2022-02-27 23:16:02', '2022-02-27 23:16:02'),
(597, 1, 'admin/business-settings/create', 'GET', '198.255.45.131', '[]', '2022-02-27 23:16:28', '2022-02-27 23:16:28'),
(598, 1, 'admin/business-settings', 'POST', '198.255.45.131', '{\"key\":\"pay\",\"value\":{\"status\":\"1\",\"client id\":\"shfsuhsf\",\"Secret id\":\"ksfhkhshiuhf\"},\"_token\":\"AD5CeNJUhat68Q5go4paKEGp23DTYgzCh5NQNAz7\"}', '2022-02-27 23:16:40', '2022-02-27 23:16:40'),
(599, 1, 'admin/business-settings', 'GET', '198.255.45.131', '[]', '2022-02-27 23:16:40', '2022-02-27 23:16:40'),
(600, 1, 'admin/business-settings/create', 'GET', '198.255.45.131', '{\"_pjax\":\"#pjax-container\"}', '2022-02-27 23:29:01', '2022-02-27 23:29:01'),
(601, 1, 'admin/business-settings', 'POST', '198.255.45.131', '{\"key\":\"paypal\",\"value\":{\"status\":\"1\",\"paypal_client_id\":\"AYkWuTf46Z1LRsxr5V1nXXmvplE1Pox0WLJG7JeYPQMQ3RjGtBJ_e7dHzZZO-Pf7dnV5iMhhgMgRhRs5\",\"paypal_secret_id\":\"EMllsYjwRcI3k7TSQjLhH5M8xJb1grRTF7Vrq972dYhzTzIb_j_rVDlEMGiyRhk9eNJuvhk7WdqkMwrR\"},\"_token\":\"AD5CeNJUhat68Q5go4paKEGp23DTYgzCh5NQNAz7\",\"_previous_\":\"https:\\/\\/mvs.bslmeiyu.com\\/admin\\/business-settings\"}', '2022-02-27 23:29:33', '2022-02-27 23:29:33'),
(602, 1, 'admin/business-settings', 'GET', '198.255.45.131', '[]', '2022-02-27 23:29:34', '2022-02-27 23:29:34'),
(603, 1, 'admin/business-settings', 'GET', '58.39.68.12', '[]', '2022-02-28 08:05:23', '2022-02-28 08:05:23'),
(604, 1, 'admin', 'GET', '180.152.242.33', '[]', '2022-03-03 06:42:53', '2022-03-03 06:42:53'),
(605, 1, 'admin/orders', 'GET', '180.152.242.33', '{\"_pjax\":\"#pjax-container\"}', '2022-03-03 06:43:00', '2022-03-03 06:43:00'),
(606, 1, 'admin/orders', 'GET', '180.152.242.33', '[]', '2022-03-03 06:55:57', '2022-03-03 06:55:57'),
(607, 1, 'admin/orders', 'GET', '180.152.242.33', '{\"page\":\"8\",\"_pjax\":\"#pjax-container\"}', '2022-03-03 06:56:02', '2022-03-03 06:56:02'),
(608, 1, 'admin/orders/100141,100142,100143,100144,100145,100146,100147,100148,100149,100150,100151,100152,100153,100154,100155', 'DELETE', '180.152.242.33', '{\"_method\":\"delete\",\"_token\":\"sVkXUnzfmGZgsu7tbhl80ZheHxK85zEcWqh8IqJc\"}', '2022-03-03 06:56:48', '2022-03-03 06:56:48'),
(609, 1, 'admin/orders', 'GET', '180.152.242.33', '{\"page\":\"8\",\"_pjax\":\"#pjax-container\"}', '2022-03-03 06:56:48', '2022-03-03 06:56:48'),
(610, 1, 'admin/orders', 'GET', '180.152.242.33', '{\"page\":\"7\",\"_pjax\":\"#pjax-container\"}', '2022-03-03 06:56:49', '2022-03-03 06:56:49'),
(611, 1, 'admin/orders', 'GET', '180.152.242.33', '{\"page\":\"7\",\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}', '2022-03-03 06:56:56', '2022-03-03 06:56:56'),
(612, 1, 'admin/orders', 'GET', '180.152.242.33', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}', '2022-03-03 06:56:56', '2022-03-03 06:56:56'),
(613, 1, 'admin/orders/100101,100102,100103,100104,100105,100106,100107,100108,100109,100110,100111,100112,100113,100114,100115,100116,100117,100118,100119,100120,100121,100122,100123,100124,100125,100126,100127,100128,100129,100130,100131,100132,100133,100134,1001', 'DELETE', '180.152.242.33', '{\"_method\":\"delete\",\"_token\":\"sVkXUnzfmGZgsu7tbhl80ZheHxK85zEcWqh8IqJc\"}', '2022-03-03 06:57:03', '2022-03-03 06:57:03'),
(614, 1, 'admin/orders', 'GET', '180.152.242.33', '{\"page\":\"2\",\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}', '2022-03-03 06:57:04', '2022-03-03 06:57:04'),
(615, 1, 'admin/orders', 'GET', '180.152.242.33', '{\"page\":\"1\",\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}', '2022-03-03 06:57:04', '2022-03-03 06:57:04'),
(616, 1, 'admin/orders/100003,100004,100005,100006,100007,100008,100009,100010,100011,100012,100013,100014,100015,100016,100017,100018,100019,100020,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032,100033,100034,100035,100036,1000', 'DELETE', '180.152.242.33', '{\"_method\":\"delete\",\"_token\":\"sVkXUnzfmGZgsu7tbhl80ZheHxK85zEcWqh8IqJc\"}', '2022-03-03 06:57:18', '2022-03-03 06:57:18'),
(617, 1, 'admin/orders', 'GET', '180.152.242.33', '{\"page\":\"1\",\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}', '2022-03-03 06:57:19', '2022-03-03 06:57:19'),
(618, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-10-08 11:04:00', '2022-10-08 11:04:00'),
(619, 1, 'admin/food-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:05:33', '2022-10-08 11:05:33'),
(620, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:05:39', '2022-10-08 11:05:39'),
(621, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:05:43', '2022-10-08 11:05:43'),
(622, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-08 11:05:53', '2022-10-08 11:05:53'),
(623, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:06:03', '2022-10-08 11:06:03'),
(624, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:06:07', '2022-10-08 11:06:07'),
(625, 1, 'admin/food-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:06:09', '2022-10-08 11:06:09'),
(626, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:06:22', '2022-10-08 11:06:22'),
(627, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:06:29', '2022-10-08 11:06:29'),
(628, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:06:32', '2022-10-08 11:06:32'),
(629, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:06:35', '2022-10-08 11:06:35'),
(630, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:06:37', '2022-10-08 11:06:37'),
(631, 1, 'admin/food-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:06:45', '2022-10-08 11:06:45'),
(632, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:06:56', '2022-10-08 11:06:56'),
(633, 1, 'admin/auth/setting', 'PUT', '127.0.0.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$8yUtwbsb.WZjJc\\/U\\/s3HOuoEboydAxwR7mXDxMjVYvVrH1aoUvvVm\",\"password_confirmation\":\"$2y$10$8yUtwbsb.WZjJc\\/U\\/s3HOuoEboydAxwR7mXDxMjVYvVrH1aoUvvVm\",\"_token\":\"mznav1pN5rX1WPmT3k8dCOXZgwuv0E6jfz7PIkRL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-types\"}', '2022-10-08 11:08:38', '2022-10-08 11:08:38'),
(634, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2022-10-08 11:08:38', '2022-10-08 11:08:38'),
(635, 1, 'admin/food-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:08:54', '2022-10-08 11:08:54'),
(636, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:09:00', '2022-10-08 11:09:00'),
(637, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2022-10-08 11:09:39', '2022-10-08 11:09:39'),
(638, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:09:43', '2022-10-08 11:09:43'),
(639, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:09:51', '2022-10-08 11:09:51'),
(640, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-08 11:13:47', '2022-10-08 11:13:47'),
(641, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-08 11:13:59', '2022-10-08 11:13:59'),
(642, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-08 11:14:39', '2022-10-08 11:14:39'),
(643, 1, 'admin/foods/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:19:30', '2022-10-08 11:19:30'),
(644, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:19:35', '2022-10-08 11:19:35'),
(645, 1, 'admin/foods/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:19:37', '2022-10-08 11:19:37'),
(646, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:19:51', '2022-10-08 11:19:51'),
(647, 1, 'admin/foods/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:20:00', '2022-10-08 11:20:00'),
(648, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:20:08', '2022-10-08 11:20:08'),
(649, 1, 'admin/foods/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:20:13', '2022-10-08 11:20:13'),
(650, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:20:16', '2022-10-08 11:20:16'),
(651, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_columns_\":\"created_at,description,food_type.title,img,price,stars,updated_at\",\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:20:25', '2022-10-08 11:20:25'),
(652, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_columns_\":\"created_at,description,food_type.title,img,price,stars,updated_at\",\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:20:26', '2022-10-08 11:20:26'),
(653, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:20:29', '2022-10-08 11:20:29'),
(654, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:20:33', '2022-10-08 11:20:33'),
(655, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:20:35', '2022-10-08 11:20:35'),
(656, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2022-10-08 11:20:43', '2022-10-08 11:20:43'),
(657, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}', '2022-10-08 11:21:13', '2022-10-08 11:21:13'),
(658, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}', '2022-10-08 11:21:13', '2022-10-08 11:21:13'),
(659, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"20\"}', '2022-10-08 11:21:16', '2022-10-08 11:21:16'),
(660, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:21:20', '2022-10-08 11:21:20'),
(661, 1, 'admin/food-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:21:21', '2022-10-08 11:21:21'),
(662, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:21:24', '2022-10-08 11:21:24'),
(663, 1, 'admin/foods/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:22:01', '2022-10-08 11:22:01'),
(664, 1, 'admin/foods/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:22:18', '2022-10-08 11:22:18'),
(665, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:22:20', '2022-10-08 11:22:20'),
(666, 1, 'admin/foods/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:22:26', '2022-10-08 11:22:26'),
(667, 1, 'admin/foods/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:22:28', '2022-10-08 11:22:28'),
(668, 1, 'admin/foods/1', 'PUT', '127.0.0.1', '{\"name\":\"Nutritious fruit meal in china\",\"type_id\":\"2\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">This\\u00a0five red bases, two are dedicated to salami (fennel and regular), and there\'s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">I think it\'s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">Rinaldo Di Stasio and Mallory Wall\'s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.<\\/p><p><br><\\/p>\",\"_token\":\"mznav1pN5rX1WPmT3k8dCOXZgwuv0E6jfz7PIkRL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/foods\\/1\"}', '2022-10-08 11:22:36', '2022-10-08 11:22:36'),
(669, 1, 'admin/foods/1', 'GET', '127.0.0.1', '[]', '2022-10-08 11:22:36', '2022-10-08 11:22:36'),
(670, 1, 'admin/foods/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:22:40', '2022-10-08 11:22:40'),
(671, 1, 'admin/foods/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:22:42', '2022-10-08 11:22:42'),
(672, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:22:43', '2022-10-08 11:22:43'),
(673, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:22:45', '2022-10-08 11:22:45'),
(674, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:22:46', '2022-10-08 11:22:46'),
(675, 1, 'admin/foods/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:24:22', '2022-10-08 11:24:22'),
(676, 1, 'admin/foods/1', 'PUT', '127.0.0.1', '{\"name\":\"Nutritious fruit meal in china123\",\"type_id\":\"2\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">This\\u00a0five red bases, two are dedicated to salami (fennel and regular), and there\'s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">I think it\'s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">Rinaldo Di Stasio and Mallory Wall\'s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.<\\/p><p><br><\\/p>\",\"_token\":\"mznav1pN5rX1WPmT3k8dCOXZgwuv0E6jfz7PIkRL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/foods\"}', '2022-10-08 11:24:27', '2022-10-08 11:24:27'),
(677, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-08 11:24:28', '2022-10-08 11:24:28'),
(678, 1, 'admin/foods/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:29:50', '2022-10-08 11:29:50'),
(679, 1, 'admin/foods/1', 'PUT', '127.0.0.1', '{\"name\":\"Nutritiou fruit meal in china\",\"type_id\":\"2\",\"price\":\"12\",\"location\":\"Canada, British Columbia\",\"stars\":\"4\",\"people\":\"5\",\"selected_people\":\"5\",\"description\":\"<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">This\\u00a0five red bases, two are dedicated to salami (fennel and regular), and there\'s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">I think it\'s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.<\\/p><p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\\\">Rinaldo Di Stasio and Mallory Wall\'s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.<\\/p><p><br><\\/p>\",\"_token\":\"mznav1pN5rX1WPmT3k8dCOXZgwuv0E6jfz7PIkRL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/foods\"}', '2022-10-08 11:30:03', '2022-10-08 11:30:03'),
(680, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-08 11:30:04', '2022-10-08 11:30:04'),
(681, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-08 11:42:47', '2022-10-08 11:42:47'),
(682, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"id\":null,\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:42:51', '2022-10-08 11:42:51'),
(683, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-08 11:42:56', '2022-10-08 11:42:56'),
(684, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-10-10 08:54:39', '2022-10-10 08:54:39'),
(685, 1, 'admin/food-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:03:27', '2022-10-10 09:03:27'),
(686, 1, 'admin/food-types/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:03:37', '2022-10-10 09:03:37'),
(687, 1, 'admin/food-types', 'POST', '127.0.0.1', '{\"parent_id\":\"1\",\"title\":\"Healthy Drinks\",\"description\":\"Drink healthy and eat healthy\",\"order\":\"1\",\"_token\":\"ZyuG2PUIlFK0G9C05yp75D6OUPOUtKI6YkZ7Pf8H\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-types\"}', '2022-10-10 09:04:16', '2022-10-10 09:04:16'),
(688, 1, 'admin/food-types', 'GET', '127.0.0.1', '[]', '2022-10-10 09:04:17', '2022-10-10 09:04:17'),
(689, 1, 'admin/food-types', 'GET', '127.0.0.1', '[]', '2022-10-10 09:11:26', '2022-10-10 09:11:26'),
(690, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:12:47', '2022-10-10 09:12:47'),
(691, 1, 'admin/foods/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:12:51', '2022-10-10 09:12:51'),
(692, 1, 'admin/foods', 'POST', '127.0.0.1', '{\"name\":\"Fruit juice\",\"type_id\":\"4\",\"price\":\"4\",\"location\":\"DaNang\",\"stars\":\"4\",\"people\":\"3\",\"selected_people\":\"5\",\"description\":\"<p>Best drinks<\\/p>\",\"_token\":\"ZyuG2PUIlFK0G9C05yp75D6OUPOUtKI6YkZ7Pf8H\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/foods\"}', '2022-10-10 09:14:00', '2022-10-10 09:14:00'),
(693, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-10 09:14:01', '2022-10-10 09:14:01'),
(694, 1, 'admin/foods/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:14:16', '2022-10-10 09:14:16'),
(695, 1, 'admin/foods', 'POST', '127.0.0.1', '{\"name\":\"Real juice\",\"type_id\":\"4\",\"price\":\"5\",\"location\":\"DaNang\",\"stars\":\"5\",\"people\":\"4\",\"selected_people\":\"2\",\"description\":\"<p>abcdef<\\/p>\",\"_token\":\"ZyuG2PUIlFK0G9C05yp75D6OUPOUtKI6YkZ7Pf8H\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/foods\"}', '2022-10-10 09:15:14', '2022-10-10 09:15:14'),
(696, 1, 'admin/foods/create', 'GET', '127.0.0.1', '[]', '2022-10-10 09:15:16', '2022-10-10 09:15:16'),
(697, 1, 'admin/foods', 'POST', '127.0.0.1', '{\"name\":\"Real juice\",\"type_id\":\"4\",\"price\":\"5\",\"location\":\"DaNang\",\"stars\":\"5\",\"people\":\"4\",\"selected_people\":\"2\",\"description\":\"<p>abcdef<\\/p>\",\"_token\":\"ZyuG2PUIlFK0G9C05yp75D6OUPOUtKI6YkZ7Pf8H\"}', '2022-10-10 09:15:29', '2022-10-10 09:15:29'),
(698, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-10 09:15:30', '2022-10-10 09:15:30'),
(699, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-10 09:19:07', '2022-10-10 09:19:07'),
(700, 1, 'admin/food-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:23:35', '2022-10-10 09:23:35'),
(701, 1, 'admin/food-types', 'GET', '127.0.0.1', '[]', '2022-10-10 09:34:13', '2022-10-10 09:34:13'),
(702, 1, 'admin/food-types', 'GET', '127.0.0.1', '[]', '2022-10-10 09:34:22', '2022-10-10 09:34:22'),
(703, 1, 'admin/food-types/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:35:00', '2022-10-10 09:35:00'),
(704, 1, 'admin/food-types', 'POST', '127.0.0.1', '{\"parent_id\":\"1\",\"title\":\"a\",\"description\":\"a\",\"order\":\"1\",\"_token\":\"ZyuG2PUIlFK0G9C05yp75D6OUPOUtKI6YkZ7Pf8H\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-types\"}', '2022-10-10 09:35:13', '2022-10-10 09:35:13'),
(705, 1, 'admin/food-types', 'GET', '127.0.0.1', '[]', '2022-10-10 09:35:13', '2022-10-10 09:35:13'),
(706, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:35:21', '2022-10-10 09:35:21'),
(707, 1, 'admin/food-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:35:37', '2022-10-10 09:35:37'),
(708, 1, 'admin/food-types/5', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"ZyuG2PUIlFK0G9C05yp75D6OUPOUtKI6YkZ7Pf8H\"}', '2022-10-10 09:35:45', '2022-10-10 09:35:45'),
(709, 1, 'admin/food-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:35:45', '2022-10-10 09:35:45'),
(710, 1, 'admin/food-types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:36:22', '2022-10-10 09:36:22'),
(711, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:36:25', '2022-10-10 09:36:25'),
(712, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-10 09:57:33', '2022-10-10 09:57:33'),
(713, 1, 'admin/foods/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 09:57:55', '2022-10-10 09:57:55'),
(714, 1, 'admin/foods', 'POST', '127.0.0.1', '{\"name\":\"Delicious juice\",\"type_id\":\"4\",\"price\":\"6\",\"location\":\"Hue\",\"stars\":\"3\",\"people\":\"3\",\"selected_people\":\"5\",\"description\":\"<p>aaaaaaaaaa<\\/p>\",\"_token\":\"ZyuG2PUIlFK0G9C05yp75D6OUPOUtKI6YkZ7Pf8H\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/foods\"}', '2022-10-10 09:58:38', '2022-10-10 09:58:38'),
(715, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-10 09:58:39', '2022-10-10 09:58:39'),
(716, 1, 'admin/foods/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-10 10:07:31', '2022-10-10 10:07:31'),
(717, 1, 'admin/foods/14', 'PUT', '127.0.0.1', '{\"name\":\"Delicious juiceeee\",\"type_id\":\"4\",\"price\":\"6\",\"location\":\"Quang Nam\",\"stars\":\"3\",\"people\":\"3\",\"selected_people\":\"5\",\"description\":\"<p>bbbbbbbbbbbb<\\/p>\",\"_token\":\"ZyuG2PUIlFK0G9C05yp75D6OUPOUtKI6YkZ7Pf8H\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/foods\"}', '2022-10-10 10:07:50', '2022-10-10 10:07:50'),
(718, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-10 10:07:50', '2022-10-10 10:07:50'),
(719, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-10-10 10:11:07', '2022-10-10 10:11:07'),
(720, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-10-10 15:56:50', '2022-10-10 15:56:50'),
(721, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-10-11 16:30:17', '2022-10-11 16:30:17'),
(722, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-11 16:30:31', '2022-10-11 16:30:31'),
(723, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2022-10-11 16:30:44', '2022-10-11 16:30:44'),
(724, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"77\",\"_model\":\"App_Models_User\",\"_token\":\"H3bN5hIv6XRdnyeCojZvaNlNPYJnrJdMtNeginsk\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-10-11 16:30:51', '2022-10-11 16:30:51'),
(725, 1, 'admin/users', 'GET', '127.0.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-10-11 16:30:52', '2022-10-11 16:30:52'),
(726, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"76\",\"_model\":\"App_Models_User\",\"_token\":\"H3bN5hIv6XRdnyeCojZvaNlNPYJnrJdMtNeginsk\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-10-11 16:31:16', '2022-10-11 16:31:16'),
(727, 1, 'admin/users', 'GET', '127.0.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-10-11 16:31:16', '2022-10-11 16:31:16'),
(728, 1, 'admin/users', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2022-10-11 16:32:20', '2022-10-11 16:32:20'),
(729, 1, 'admin/users', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2022-10-11 16:36:26', '2022-10-11 16:36:26'),
(730, 1, 'admin/users', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2022-10-11 16:39:10', '2022-10-11 16:39:10'),
(731, 1, 'admin/users', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2022-10-11 16:42:10', '2022-10-11 16:42:10'),
(732, 1, 'admin/users', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2022-10-11 16:42:33', '2022-10-11 16:42:33'),
(733, 1, 'admin/users', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2022-10-11 16:43:22', '2022-10-11 16:43:22'),
(734, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-11-10 12:15:17', '2022-11-10 12:15:17'),
(735, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-11-10 12:15:24', '2022-11-10 12:15:24'),
(736, 1, 'admin/foods', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-11-10 12:15:28', '2022-11-10 12:15:28'),
(737, 1, 'admin/foods', 'GET', '127.0.0.1', '[]', '2022-11-10 12:36:11', '2022-11-10 12:36:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2021-11-08 03:39:48', '2021-11-08 03:39:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL),
(1, 10, NULL, NULL),
(1, 11, NULL, NULL),
(1, 12, NULL, NULL),
(1, 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$8yUtwbsb.WZjJc/U/s3HOuoEboydAxwR7mXDxMjVYvVrH1aoUvvVm', 'Administrator', 'images/19IT181.jpg', 'isC2i6h3iyaSE64FCyJ8iowPPUieRkKGG2UtFqqyLx6GczJ896aOl2VY5OvT', '2021-11-08 03:39:48', '2022-10-08 11:08:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'currency', 'USD', '2022-02-27 23:05:36', '2022-02-27 23:05:36'),
(2, 'test', '{\"client id\":\"shfsuhsf\",\"Secret id\":\"ksfhkhshiuhf\"}', '2022-02-27 23:09:10', '2022-02-27 23:09:10'),
(3, 'pay', '{\"status\":\"1\",\"client id\":\"shfsuhsf\",\"Secret id\":\"ksfhkhshiuhf\"}', '2022-02-27 23:16:40', '2022-02-27 23:16:40'),
(4, 'paypal', '{\"status\":\"1\",\"paypal_client_id\":\"AYkWuTf46Z1LRsxr5V1nXXmvplE1Pox0WLJG7JeYPQMQ3RjGtBJ_e7dHzZZO-Pf7dnV5iMhhgMgRhRs5\",\"paypal_secret_id\":\"EMllsYjwRcI3k7TSQjLhH5M8xJb1grRTF7Vrq972dYhzTzIb_j_rVDlEMGiyRhk9eNJuvhk7WdqkMwrR\"}', '2022-02-27 23:29:33', '2022-02-27 23:29:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) NOT NULL,
  `address_type` varchar(100) DEFAULT NULL,
  `contact_person_number` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `latitude` varchar(200) DEFAULT NULL,
  `longitude` varchar(200) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `contact_person_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `address_type`, `contact_person_number`, `address`, `latitude`, `longitude`, `user_id`, `contact_person_name`, `created_at`, `updated_at`) VALUES
(56, NULL, '123456', '309 SW Broadway, Portland, OR 97205, USA', '45.521708425968995', '-122.67854869365692', 27, 'dylan', '2022-01-30 18:56:17', '2022-01-30 18:56:17'),
(57, NULL, '1234567', '309 SW Broadway, Portland, OR 97205, USA', '45.52188390161423', '-122.67854869365692', 28, '123456', '2022-01-30 19:06:02', '2022-01-30 19:06:02'),
(58, NULL, '1', 'Standard Insurance Center, 900 SW 5th Ave, Portland, OR 97204, USA', '45.517183925183836', '-122.67808366566895', 29, 'ahmed', '2022-01-31 00:39:31', '2022-01-31 00:39:31'),
(59, NULL, '1', '2129 NW Northrup St, Portland, OR 97210, USA', '45.53122865713088', '-122.69545532763004', 29, 'ahmed', '2022-01-31 00:40:00', '2022-01-31 00:40:00'),
(60, NULL, '1234567', '309 SW Broadway, Portland, OR 97205, USA', '45.52188390161423', '-122.67854869365692', 28, '123456', '2022-02-07 01:41:43', '2022-02-07 01:41:43'),
(61, NULL, '1234567', '820 SW Washington St, Portland, OR 97205, USA', '45.52102695512081', '-122.68039003014566', 28, '123456', '2022-02-07 12:44:45', '2022-02-07 12:44:45'),
(62, NULL, '1234567', '820 SW Washington St, Portland, OR 97205, USA', '45.52102695512081', '-122.68039003014566', 28, '123456', '2022-02-07 23:02:18', '2022-02-07 23:02:18'),
(63, NULL, '123123123', 'Wells Fargo Building, 309 SW 6th Ave, Portland, OR 97204, USA', '45.521563018025006', '-122.67743289470673', 30, 'Tester', '2022-02-08 03:52:08', '2022-02-08 03:52:08'),
(64, NULL, '12', 'Wells Fargo Building, 309 SW 6th Ave, Portland, OR 97204, USA', '45.521563018025006', '-122.67743289470673', 32, 'telllll', '2022-02-12 22:39:54', '2022-02-12 22:39:54'),
(65, NULL, '2', 'Wells Fargo Building, 309 SW 6th Ave, Portland, OR 97204, USA', '45.521563018025006', '-122.67743289470673', 33, 'Ahmed nowww', '2022-02-15 02:21:35', '2022-02-15 02:21:35'),
(66, NULL, '123456', '309 SW Broadway, Portland, OR 97205, USA', '45.521708425968995', '-122.67854869365692', 27, 'dylan', '2022-02-27 17:55:55', '2022-02-27 17:55:55'),
(71, NULL, '123123', '309 SW Broadway, Portland, OR 97205, USA', '45.521708425968995', '-122.67854869365692', 70, 'TQNguyen', '2022-11-01 15:00:23', '2022-10-26 09:08:16'),
(104, NULL, '123123', '799 NW Glisan St, Portland, OR 97209, USA', '45.526584434180876', '-122.67917483351516', 70, 'TQNguyen', '2022-11-06 17:21:16', '2022-11-06 17:21:16'),
(105, NULL, '123123', '300 NW 15th Ave, Portland, OR 97209, USA', '45.52518119158803', '-122.68655240535736', 70, 'TQNguyen', '2022-11-09 06:04:41', '2022-11-09 06:04:41'),
(106, NULL, '123123', '300 NW 15th Ave, Portland, OR 97209, USA', '45.52502205288403', '-122.69313815896771', 70, 'TQNguyen', '2022-11-09 06:16:54', '2022-11-09 06:16:54'),
(108, NULL, '123123', '1015 SW Washington St, Portland, OR 97205, USA', '45.52168587484239', '-122.68168151378632', 70, 'TQNguyen', '2022-11-10 07:35:51', '2022-11-10 07:35:51'),
(109, NULL, '123123', 'Elk Fountain, 1120 SW 5th Ave, Portland, OR 97204, USA', '45.51563', '-122.677433', 70, 'TQNguyen', '2022-11-12 00:00:17', '2022-11-12 00:00:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `foods`
--

CREATE TABLE `foods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `people` int(11) NOT NULL,
  `selected_people` int(11) NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `foods`
--

INSERT INTO `foods` (`id`, `name`, `description`, `price`, `stars`, `people`, `selected_people`, `img`, `location`, `created_at`, `updated_at`, `type_id`) VALUES
(1, 'Nutritiou fruit meal in china', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">This five red bases, two are dedicated to salami (fennel and regular), and there\'s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">I think it\'s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">Rinaldo Di Stasio and Mallory Wall\'s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.</p><p><br></p>', 12, 4, 5, 5, 'images/ea9367e8a16f1d3e41d4a3ae9af2baff.png', 'Canada, British Columbia', '2021-11-17 02:09:08', '2022-10-08 11:30:03', 2),
(2, 'Sweet Dessert', '<p>The best sweet dessert</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Genesis</em>, goes straight for the jugular of unceded sovereignty.</p><p><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Genesis</em>, goes straight for the jugular of unceded sovereignty.</p><p><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Genesis</em>, goes straight for the jugular of unceded sovereignty.</p><p><br/></p>', 2153, 5, 5, 3, 'images/27567f904a64ba79ae95672e4ddf10c8.png', 'Icefields, Alberta', '2021-11-17 02:10:43', '2022-01-01 00:54:42', 2),
(3, 'Chinese Side', '<p style=\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\">Enjoy these flavors any time of day.</p><p><br/></p>', 3456, 3, 5, 4, 'images/fe978d4b2a6e311efc53370bad41c302.jpg', 'Moraine Lake, Alberta', '2021-11-17 02:16:31', '2022-01-01 00:54:54', 3),
(4, 'Bitter Orange Marinade', '<p id=\"mntl-sc-block_1-0\" class=\"comp mntl-sc-block mntl-sc-block-html\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; padding: 0px; letter-spacing: -0.1px; counter-reset: section 0; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; white-space: normal; background-color: rgb(255, 255, 255);\">Bitter oranges are often used in Caribbean&nbsp;</p><p><br/></p>', 33, 4, 5, 3, 'images/f38f470cc1972c270320c222c3aca9fb.jpg', 'Killarney Provincial Park', '2021-11-17 02:18:46', '2022-01-01 00:55:05', 3),
(5, 'Creamed Yuca (Cassava)', '<p><span style=\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\">Commonly used in soups, eaten boiled&nbsp;</span></p>', 10, 5, 5, 4, 'images/acaa4cdee4b8aa7bf33f2140ce36860c.jpg', 'China', '2021-12-08 04:29:53', '2022-01-01 00:55:44', 3),
(6, 'Creole Rice Side Dish Recipe', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Genesis</em>, goes straight for the jugular of unceded sovereignty.</p><p><br/></p>', 18, 4, 3, 3, 'images/d6648f1f920d6bbc89988d75b3bed5b3.jpg', 'china', '2021-12-23 07:03:24', '2022-01-21 02:28:04', 2),
(7, 'Cuban Fufu', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Genesis</em>, goes straight for the jugular of unceded sovereignty.</p><p><br/></p>', 10, 5, 0, 0, 'images/f937dbd76381d1c10fdfcfd90688cb96.png', 'Cuba', '2021-12-23 07:04:49', '2022-01-01 00:56:45', 2),
(8, 'Dessert', '<p>Amazing food to eat with.</p>', 5, 4, 3, 2, 'images/34b0eaad01e8a95a02df1d934517591c.png', 'china', '2021-12-25 17:36:29', '2022-01-01 00:57:01', 3),
(9, 'Biriani', '<p style=\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\">Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice.</p><p style=\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\">The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow rice, as well as ghee (or melted butter) for buttery richness.</p><p style=\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\">The pot is then covered and cooked over a low heat for about 25 minutes during which time the rice absorbs the aromas and flavours of the curry underneath, whilst still being beautifully fluffy.</p><p><br/></p>', 8, 4, 3, 3, 'images/0f61cb5dd19d38a11e5a9133333eca07.jpeg', 'BD', '2021-12-26 22:27:38', '2022-01-01 00:57:16', 3),
(10, 'Chicken biriani', '<p><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\">Chicken Biryani Served in a Bowl Close Up Photo. Indian Food, Indian Style Rice and Chicken. #Biryani #ChickenBiryani #IndianFood #StockPhoto</span></p>', 12, 4, 3, 3, 'images/9447a79793a4b7f832d981f975c0abc4.jpeg', 'china', '2021-12-26 22:29:47', '2022-01-01 00:56:33', 2),
(11, 'Hilsha fish', '<p><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.</span></p><p><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.</span></span></p><p><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.</span></span></span></p>', 12, 5, 3, 3, 'images/1343ce6cf6792383dfc071727afd5c46.jpeg', 'china', '2021-12-26 22:35:34', '2022-01-01 00:56:22', 2),
(12, 'Fruit juice', '<p>Best drinks</p>', 4, 4, 3, 5, 'images/dad7609abd045121b9d93d7fec2072ce.jpeg', 'DaNang', '2022-10-10 09:14:00', '2022-10-10 09:14:00', 4),
(13, 'Real juice', '<p>abcdef</p>', 5, 5, 4, 2, 'images/4825bb9c50bff30beb744ec0105fabbc.jpg', 'DaNang', '2022-10-10 09:15:29', '2022-10-10 09:15:29', 4),
(14, 'Delicious juiceeee', '<p>bbbbbbbbbbbb</p>', 6, 3, 3, 5, 'images/98bd2e6bb48b122a1775104736aaa2e9.png', 'Quang Nam', '2022-10-10 09:58:38', '2022-10-10 10:07:50', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `food_types`
--

CREATE TABLE `food_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `food_types`
--

INSERT INTO `food_types` (`id`, `title`, `parent_id`, `created_at`, `updated_at`, `order`, `description`) VALUES
(1, 'Food', 0, '2022-01-01 00:22:55', '2022-01-01 00:22:55', 1, 'all about food'),
(2, 'Popular food', 1, '2022-01-01 00:23:10', '2022-01-01 00:23:10', 1, 'popular food'),
(3, 'Recommended food', 1, '2022-01-01 00:23:25', '2022-01-01 00:23:25', 1, 'Recommended food'),
(4, 'Healthy Drinks', 1, '2022-10-10 09:04:16', '2022-10-10 09:04:16', 1, 'Drink healthy and eat healthy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, '2016_01_04_173148_create_admin_tables', 2),
(6, '2021_11_08_125401_create_article_types_table', 3),
(7, '2021_11_08_125420_create_articles_table', 3),
(8, '2021_11_17_092846_create_place_table', 4),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 5),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 5),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 5),
(12, '2016_06_01_000004_create_oauth_clients_table', 5),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 5),
(14, '2022_01_01_075013_create_food_type_table', 6),
(15, '2022_01_14_150322_create_places_table', 7),
(16, '2022_02_28_061329_create_business_settings_table', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0036dc953174471f3d793ab265a6ba99ed87f186bb9825110edea291f04948138201a737eb659626', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 02:43:20', '2022-02-25 02:43:20', '2023-02-25 10:43:20'),
('00e8c26773a36807d7a70caf8833fe495621222deb6378fc926ba61463eb714a10c60f7898203165', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-26 08:10:25', '2022-10-26 08:10:25', '2023-10-26 15:10:25'),
('013ad9d61cbc895a519f5353eda258dc064c63ea4729cd85ee23630465942329ea67d850913a5241', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:49:45', '2022-10-12 16:49:45', '2023-10-12 23:49:45'),
('01e6abc782876c75e36fea0c69c63be36bd5b191b60ce6d4dc1f216c04fab2283a48aa7246495843', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 12:45:12', '2022-02-07 12:45:12', '2023-02-07 20:45:12'),
('022e12aefd25d5a7221a7db68a617b2caefa78971cfd5df3224a9387cefeb80dbada72e0ccba1da4', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 06:37:39', '2022-11-01 06:37:39', '2023-11-01 13:37:39'),
('04823d677fda716203c92447d409fb51737cdb6229ebb247a1f9aa05ef47709d4ecdd6db9ae640d7', 15, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:15:18', '2022-01-05 22:15:18', '2023-01-06 06:15:18'),
('054ec4a7b2b4d3fed56a949eb1d424b32423d7bb536bb0123e5d387e03e06132d53080b458ada3ad', 51, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 08:52:01', '2022-02-25 08:52:01', '2023-02-25 16:52:01'),
('0599450a48dedea247cbe45d7da46c8409953ac34f0208200abc12fdf9219b42bbbe022d04cbd9f7', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 19:05:37', '2022-01-30 19:05:37', '2023-01-31 03:05:37'),
('05bd6c03582785923ffb71fd89633abc8171dd9e2bb539bac740f62a065b43eee67656db092ffb22', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:55:22', '2021-12-29 17:55:22', '2022-12-30 01:55:22'),
('064397f328ad51e21e81b749f5478028c6dab698220d06a40ad14128ab15a5f179fa9c51c7ceb4bb', 61, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 11:06:46', '2022-02-25 11:06:46', '2023-02-25 19:06:46'),
('07f1c06d91fda5bde6b70e8f24037a09c1298363b7a8c99894cadc60363ce944a1d496b3b5c29a3a', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 02:55:50', '2022-01-12 02:55:50', '2023-01-12 10:55:50'),
('0829510b834e7e7f9944f38dc1103324dd313ed1a9dbf74bc4c98da12fc0c35d6eb7ea2875b6fa52', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-10 13:05:39', '2022-11-10 13:05:39', '2023-11-10 20:05:39'),
('08628dd75afedbed2a87b0b155fdb59ddffb59c9e21f2f92d514e9eb34d9d61e6de08d1474bd3239', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 08:00:39', '2022-11-09 08:00:39', '2023-11-09 15:00:39'),
('08a9defc48dfa5fce3da0d69e72897bee95564a5cec348e7a9e7490e5b8630ae485865c87eea6beb', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:55:33', '2022-01-07 20:55:33', '2023-01-08 04:55:33'),
('08f24cec31e6a312ddb545b75a602ea303a8c9ea84937cdd493ca8caeb731c97125b4e7943548da8', 22, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 06:44:36', '2022-01-08 06:44:36', '2023-01-08 14:44:36'),
('0933b998d6358295a885209a1685008ec078e514da1f8ea82b23e809af291b5a4c07260b7c943f68', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-30 06:49:15', '2022-10-30 06:49:15', '2023-10-30 13:49:15'),
('0a813e0d86d1bef4565daa00242201bb6fb1a320e984cd58ce3f0356464dd1f8a2cf81f97ab65b0e', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 07:25:09', '2022-10-22 07:25:09', '2023-10-22 14:25:09'),
('0b26ed23f02c2fe4375a370daf230df49cf40566a522ed6e361fb6653936208426c528b1515c64e6', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 05:54:57', '2022-11-09 05:54:57', '2023-11-09 12:54:57'),
('0b813f55613d36733ed8b90aecaf9156008effd37199ebe816f9f8a84d471f3c8c038fa1d1a6c893', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:58:07', '2022-01-03 18:58:07', '2023-01-04 02:58:07'),
('0c4e7f14d31f24eb8f1d89ad9edd88c05902a34762299197f1eb8cd8cb58399a90a4e68b7a2b1f6f', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 17:22:39', '2021-12-30 17:22:39', '2022-12-31 01:22:39'),
('0e60da7227c68e32060f1cc33318de199f491eabe85fcedab06898cf664a1575ba7c960a824ad176', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-10 12:11:24', '2022-11-10 12:11:24', '2023-11-10 19:11:24'),
('0f552ee0c1439613cd66de8a58a766729a147f9aa576e29d1633143916b6e7c1202b31372d3c200a', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 02:18:40', '2022-02-23 02:18:40', '2023-02-23 10:18:40'),
('0fa0b88bd598e53d08e2f58b04707664b8fe2d22c270cb1a3371ad4dbdcfcf5adb5d1b378682c8bd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-31 00:35:28', '2022-01-31 00:35:28', '2023-01-31 08:35:28'),
('1143258b73dff69bc3bb2deebec10580d80cb009724e53538612941aa6e1093e89566b6d116b8e9b', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 17:46:25', '2022-01-05 17:46:25', '2023-01-06 01:46:25'),
('1155fcb8b6350fd6974b74923fd7c1eed272b2d387db863da42d4b1ffff065d6d58ff8836f9a3b6a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 06:20:28', '2022-10-19 06:20:28', '2023-10-19 13:20:28'),
('115676cf6af6a6e537aace761dbaf97b156289591ac824e51397f805a6f79f81d47ec03ccb58deef', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 07:46:37', '2022-11-04 07:46:37', '2023-11-04 14:46:37'),
('116d66414af11efe032247b7d650fc1a4454ae6777ae082da35e43bd5243b210b2fc1f6e9027b6b8', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 07:14:59', '2022-11-04 07:14:59', '2023-11-04 14:14:59'),
('126cf6638cc87cddc92d4560b0e280b7fd116fa9e418ff5eb7324b7444404087a24967005ed9bce0', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 06:04:12', '2022-11-09 06:04:12', '2023-11-09 13:04:12'),
('132848f26976925b99c2e06937ba6af72ca4b5aeadcf373ee1f13b0bea9240fd1ed5a2873994eb3f', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:06:27', '2022-01-05 22:06:27', '2023-01-06 06:06:27'),
('135a6e8a477e67e689b24e33cddfbd166d4892956be69269102e9167e2f688fb651a0d82b3ee973c', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 06:21:38', '2022-11-01 06:21:38', '2023-11-01 13:21:38'),
('1473696dece99c2f5717f0f6c6e0662dced7efce7bb9bd8838a83a1090e19c5e20860d57cdeb2815', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:28:46', '2022-11-04 09:28:46', '2023-11-04 16:28:46'),
('14dc258b6c0aa45c13e1ddca30509aec96e025c0a07256499a04f7ea457adca69fe29d87e39b501d', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 15:36:39', '2022-10-12 15:36:39', '2023-10-12 22:36:39'),
('14dec4ecaba73cfb584248e0d19b24fc08aa09c85255333670d1aa76ebcc94d31c610da8c163326a', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:51:38', '2022-01-05 22:51:38', '2023-01-06 06:51:38'),
('150f5997e3db4453cca354eddef97121872a0bc08e1a5f398074c1fc96b85099ef8f27c2ebe6037f', 62, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 16:05:16', '2022-02-25 16:05:16', '2023-02-26 00:05:16'),
('1551143b55f7cb6bd437c97c29f33580625fb28641ff1ecbd3304e045c92023e502583d7e2ac0aa6', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 23:46:23', '2022-01-11 23:46:23', '2023-01-12 07:46:23'),
('15a577f8e1be2d30e97f5b4d6f882a916a0e96f207d62aed17123f725e92c89d10e144475a52be3e', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-06 15:22:28', '2022-11-06 15:22:28', '2023-11-06 22:22:28'),
('15d1763ac33801da6ba7dbb8d2885b06ddb4e236d4814473b0aabe6bae4953f811b42820cd077855', 17, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:22:50', '2022-01-07 20:22:50', '2023-01-08 04:22:50'),
('16533f51ca18f3373eaf0b6f0e08bb2593a33b238eae07c5a5849fe4d6a20ddd8d7d697acb603b17', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 07:56:45', '2022-11-01 07:56:45', '2023-11-01 14:56:45'),
('16f62ea3c553b8206649c28bd86b0a445870b6de277c97c812677cfce65c28b3e1940a0d0945f2b8', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 23:01:51', '2022-02-07 23:01:51', '2023-02-08 07:01:51'),
('17df1d10b42530c0d62a4b941262229fa5aca65b45617dfca2a8e947c2e5f1023aa1fe7520d60423', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-30 06:51:36', '2022-10-30 06:51:36', '2023-10-30 13:51:36'),
('1a760d6d14d4afa5a0eaf552b5fc89ef57a3ceb27d33bb1ea30204e533322b09418f859ca70e9e22', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:34:36', '2022-01-03 18:34:36', '2023-01-04 02:34:36'),
('1b6e6beafadac98825537c5e0dbaf73d2f27d3fc3ce9b1020914f19681ca30b0c5fe9b506cf7ff9a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 11:40:26', '2022-11-01 11:40:26', '2023-11-01 18:40:26'),
('1b986f883b83415d4e34774da7eb671019b4b2022585130a11ae86c09c41d96474b17fb8776f550a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 06:07:46', '2022-10-19 06:07:46', '2023-10-19 13:07:46'),
('1c0e1b12b5bc11e0177a9b194c453ea4222afe0af29f861a041e5576f2f33d375776dd0b4d77a41c', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 22:16:36', '2022-01-04 22:16:36', '2023-01-05 06:16:36'),
('1d6618dd616c4a4ea2ac0205d96ae0d661526d0fd22da0171245010926fe2b61564c62f20c758ba4', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 05:54:09', '2022-11-09 05:54:09', '2023-11-09 12:54:09'),
('1d7f40f7128b0c343c128232a3b7069d252c0cb96e93a9dffe5c597b6bd0c853702f126142a7d4fe', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 08:10:36', '2022-11-04 08:10:36', '2023-11-04 15:10:36'),
('1da173c6b9cfe2d7c9f044ee5b9164a33440c614389fe7c42dba6992c415a1e5d87e65f0eee90522', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-03-03 07:21:32', '2022-03-03 07:21:32', '2023-03-03 15:21:32'),
('1db004c309b45241fc4723570a24c4004e28a5fd7fa9ea317c5a7894b26b3b5e968b8fd5e42f2593', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:29:42', '2022-11-04 09:29:42', '2023-11-04 16:29:42'),
('1e0cce37fc205f8177d9f341829dcdbd9c62738603f532647a4b094f09abb9b9b91d4bc4264138a5', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-09 17:45:02', '2022-01-09 17:45:02', '2023-01-10 01:45:02'),
('1f064aee6e162db0ceb152b52f74d97e8154d2065ec16769a66b1d0a12ebdeb3eaef5c3c26e4fb6a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-06 16:40:22', '2022-11-06 16:40:22', '2023-11-06 23:40:22'),
('1fea550e0dd49ede8b4b089e503fa37b5800fbe415a3165aa7b540eb9709319ecee2b1d412f24e5e', 71, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 16:02:56', '2022-10-11 16:02:56', '2023-10-11 23:02:56'),
('202835d57393387aea7e0514b51c281a9593542941328e875201f6a694962e2c58cebc9a7c881096', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 08:02:13', '2022-11-01 08:02:13', '2023-11-01 15:02:13'),
('20aefef21c2f6bed54b6ee192a2ceb9ce917800d26b1bb0d2765c60c9e45f8f8ca5bff54cc52a7fb', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 05:30:48', '2022-10-22 05:30:48', '2023-10-22 12:30:48'),
('21405ac0cb326fd3e02b1f385540eedaad4e2e7ad174e784edd39e3a6faf71a54e8461cb9f40d135', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:51:08', '2022-01-07 21:51:08', '2023-01-08 05:51:08'),
('21a20563381e98387c355bb375594bfe821aa750af822aa29b2eacd91247537ca0ee420693574e55', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:29:57', '2022-11-04 09:29:57', '2023-11-04 16:29:57'),
('21fca43d0f19523ce566f5722a5290c82a30ade75c82f7c1cab9e9655054b68351ea6349067e8003', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-09 16:35:48', '2022-01-09 16:35:48', '2023-01-10 00:35:48'),
('22478ca6cd92bf24c8263c795d1a2fd2b5967e0de0f2f3e492900db548bfaff7c313b525f1214852', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:19:52', '2022-11-04 09:19:52', '2023-11-04 16:19:52'),
('227c46bcb3b547d947f79778f98800c120bc4055484c6b95c5780d337c2df03f8f4b6e72eed26e69', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 07:26:27', '2022-11-04 07:26:27', '2023-11-04 14:26:27'),
('22aacefa544608c5ea6e2ca9efe86c85e75550b0a2395083aa8aa8d8a2b341f956aea315fecca42f', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 05:59:07', '2022-11-09 05:59:07', '2023-11-09 12:59:07'),
('2312ca58dcb25489e4f087fda597ab8172810f57da8530bf0123d05a507eadabf52c7a50482c0e0f', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:16:21', '2022-02-23 01:16:21', '2023-02-23 09:16:21'),
('235cf7d4e5ca3a2576fc2c9e0297cd72026fe6413ac124b82e442e2b32d1444ccc220aec4d85a554', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-10 09:42:49', '2022-11-10 09:42:49', '2023-11-10 16:42:49'),
('235f9452fefb4b035b3ca83a33ff893f2f9a4bbc6f5b39cc2274206a104a0ab26fc91de45f163e4f', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 22:48:51', '2022-01-10 22:48:51', '2023-01-11 06:48:51'),
('23bc22e0fbb05066696f2e7a1d785d77d5e4b7df5f4c1ba78a24feb3236abead877af355720b8e7b', 81, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:41:34', '2022-10-12 16:41:34', '2023-10-12 23:41:34'),
('23e26c92aaa0a0ebdd4bfd34bd20dc28ece5260b1a4bd82d0bf905a6904586d9d28ef95ec37c4d98', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 22:17:33', '2022-01-04 22:17:33', '2023-01-05 06:17:33'),
('24d919d11e6984858a7f5059f331442c0e44705a985be8227b56090d50a3ee28e56b340c8e3fa9ac', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 06:43:51', '2022-10-19 06:43:51', '2023-10-19 13:43:51'),
('24ffc6cd71f0d7ffa76909d2096608ad8db9f4c0a1f84ec14245879bc32db64b172dc29a23eabca5', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:20:27', '2022-11-04 09:20:27', '2023-11-04 16:20:27'),
('255ac3ef8c80afec0926f4c5f63316056fb0b1a9f5f609c7e16531145aa11ec2be8bba754ca31585', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 22:49:25', '2022-02-07 22:49:25', '2023-02-08 06:49:25'),
('26134f5ff7f36b70591321913b0e07f00f71ae6e7a8ca55a72ccc17fbd9e383e82ad6ec3e864b433', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:41:40', '2022-01-03 18:41:40', '2023-01-04 02:41:40'),
('2618f1ba807c27b02049b91031896ca3526633e752cef545c83eec347cc79c3d8c03eaa8bbfa90ca', 50, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 08:49:07', '2022-02-25 08:49:07', '2023-02-25 16:49:07'),
('26ca90cca7c8b3c37f4ae4988f1e37edbaa6541c5e331828ceada998922ef4d9dd8956317419c7af', 59, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:40:19', '2022-02-25 10:40:19', '2023-02-25 18:40:19'),
('274f5d1cd3c6c3398f300fe9138efeea156631716111eaddb0f4c938e4f10f0ece07f4efc0af80dc', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 17:37:18', '2022-01-05 17:37:18', '2023-01-06 01:37:18'),
('2843714a2881721c22950224916e511b4a2e9a9d35a3b3eb4156abee0acc4309d97dc023d60d76cb', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:25:27', '2022-01-07 21:25:27', '2023-01-08 05:25:27'),
('287e041ce0c94a6b9ca3014a666eda3b0f0198d363555876d3d835b8da840834921a0e8b8d5a0d6f', 26, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 18:19:01', '2022-01-30 18:19:01', '2023-01-31 02:19:01'),
('28cde07dc5c914d203682f25f5d5300b08301c19d0d69f95b8a8ed7b5b467ebe2ec59a863771b62b', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 02:11:35', '2022-02-23 02:11:35', '2023-02-23 10:11:35'),
('290fd9f380514bce796ef42840e915bf721b1cb835c96ee1de362a9430bca310d617df3779923055', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 11:19:22', '2022-11-01 11:19:22', '2023-11-01 18:19:22'),
('293e4b3fab6eaa0cb9deec8bb415a5664da04b8f7286bc812538794320afb1da4bf3ae66002c724f', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 01:30:19', '2022-10-19 01:30:19', '2023-10-19 08:30:19'),
('2a216cab6bd99037202d39d373001edb519b3db9e9260d64a5105451f82660dc4267b11b4039f0c8', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:47:06', '2022-02-23 18:47:06', '2023-02-24 02:47:06'),
('2a2bdad12d85de18e92c81ae0811dd034cc18cac9d50281599a015990e4b0b22c8caf0d1127112fa', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:52:28', '2021-12-29 17:52:28', '2022-12-30 01:52:28'),
('2a3b8a1fa5fd182ebf6429afe9be0d329bc58dea17c2733e2373baeb5f92fc948a7c783ed2545453', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 18:20:14', '2022-01-04 18:20:14', '2023-01-05 02:20:14'),
('2bb4513313b8eb05bb6397639d9d02a43b106f49c83e427806ecd2377d3ade034d9f297f73a8bfb9', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:09:41', '2022-01-05 22:09:41', '2023-01-06 06:09:41'),
('2cd6fc6977d19de135d80e738b8b768cf39e1192e11a350c540ebb1f7c4e09c57edafc3ddef06a5e', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 09:00:44', '2022-02-25 09:00:44', '2023-02-25 17:00:44'),
('2e0031739ba52079b680501f56faf9c177ad5019714ba95f04d299252b0c374ce6fcd4863480df10', 80, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 17:30:18', '2022-10-11 17:30:18', '2023-10-12 00:30:18'),
('2ef5af90c8178037d15a783418280aa8bac99ab9676b59c0d36ca53cfce215e231bc8288d08bb28a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-06 16:50:11', '2022-11-06 16:50:11', '2023-11-06 23:50:11'),
('2f79801e0d5d6089edff878ab2134f70b8429e03b9a73c90ae9e48c406d201f1f73fa08959f8a55c', 79, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 17:18:45', '2022-10-11 17:18:45', '2023-10-12 00:18:45'),
('315996b88b281037ac863385c1722d5fd1e008445b13293eb667fd419b4945e885535127e95bbae6', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 11:10:52', '2022-11-01 11:10:52', '2023-11-01 18:10:52'),
('32f95ee6b70f2c36500d5e8aef2523ad34fcad4127e6bed96d0b822fe01a6f6689f47427d062471c', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 10:17:48', '2022-11-01 10:17:48', '2023-11-01 17:17:48'),
('332f18c04cb69ea86cc974aeb249467ee32dc7a19b5419e152009f5993366f715d35c8dbbe940efe', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 02:52:42', '2022-01-12 02:52:42', '2023-01-12 10:52:42'),
('3332aad83020243da57094fd71e590a60ec47d3c66b619068b522315f81ffaaac4bb8bb876ec095d', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 06:34:40', '2022-11-01 06:34:40', '2023-11-01 13:34:40'),
('3425a480ccdac05c68a84b5af04a72acdf13c832537b495cbe4d8842d2a1aab3c38b0ea2fbaa92c1', 24, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 06:49:30', '2022-01-12 06:49:30', '2023-01-12 14:49:30'),
('34322acf15aeebc3a544b403c96ae350af8c7790d50e8a5efb25caa2a4e05d3241e927277a4032ab', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 08:23:13', '2022-11-09 08:23:13', '2023-11-09 15:23:13'),
('3445e4c6f75b4454986162c130b2091f69db52b2b8d1de331f85f937ea3f4cfd87e8e186e0b7a614', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:13:48', '2022-02-25 10:13:48', '2023-02-25 18:13:48'),
('34ce704d4a76083413226082699d13d089cdfefc180ec1a39905c7c40022b06490e3b81f95e0a313', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 07:34:49', '2022-11-01 07:34:49', '2023-11-01 14:34:49'),
('3541c81ddd33885ac6226272ffe5e5040cd39b79275507943fbc550b4f8851edba7bd393d128d819', 81, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:53:38', '2022-10-12 16:53:38', '2023-10-12 23:53:38'),
('360dd099aea3c2c7123aebed23c6817cf001a863abcc44ecea1bbfe471681dc2fb5deaa396e39ca9', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 01:41:28', '2022-02-07 01:41:28', '2023-02-07 09:41:28'),
('364d88afa806437d93da14fe3897597a3ad3ef656b8ef2bcfad3cca76caa9f65dc3f25cee79474d3', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 08:13:05', '2021-12-31 08:13:05', '2022-12-31 16:13:05'),
('3679bd274c8153bf2d2ba568f05b887dbf1583702f5af0a599fbd337f48aaf61cd9a0180b4e4cd8f', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:08:28', '2022-02-23 18:08:28', '2023-02-24 02:08:28'),
('367ca2b575f60458cb8a949c931122d318cff921d828971dcdef0d930ea78f881bd3103cd2efa519', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 08:54:03', '2022-11-01 08:54:03', '2023-11-01 15:54:03'),
('377f2c750aff02dfd67bf26f7bf81538362f8c2fcb3f0c47c4fd56511f10854c618c9d6c7ec76a8a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 07:56:01', '2022-10-22 07:56:01', '2023-10-22 14:56:01'),
('380c42fcdfdf90b5d37be5d5ab663be58694002f8bf4526d8c658ad8de33e6906bb2aa2028e59888', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-06 17:23:51', '2022-11-06 17:23:51', '2023-11-07 00:23:51'),
('381e7a089271cafe9a4e00f1f68e9a21af0a9e92d88e44e45a7439689348f44a90205607e0648a3a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-06 17:03:37', '2022-11-06 17:03:37', '2023-11-07 00:03:37'),
('389ac52cd3553a28030e1b83c41814d4678c76265da2f4cb59b1165374af17252e1d3194da262b20', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-06 16:59:35', '2022-11-06 16:59:35', '2023-11-06 23:59:35'),
('38fb24c5d3994408a10015e331bd5e33ab3114e882fd40f6c3e0829d6c8ae53b666294dace9597a2', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:25:53', '2022-02-23 01:25:53', '2023-02-23 09:25:53'),
('3971213025b9c7b4486bb9e3db278063ad77c1dce835ac4385b769444aac972fb2473211949a5eb8', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 07:37:50', '2022-11-01 07:37:50', '2023-11-01 14:37:50'),
('39bb7af02b57a1fcfd28d7519ce3b8306ca2eea6801af9159253708356b0b331ad8e044ee31a6554', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 11:01:44', '2022-11-01 11:01:44', '2023-11-01 18:01:44'),
('39bec59a448992cfde15c74f51ae15dec233e34d5a13afeda7d267ce1cb2eefe7a2653dc268af748', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:06:55', '2022-01-03 18:06:55', '2023-01-04 02:06:55'),
('3b0f60a94f0f8e223b4f2233ff89451138182fcef8e044b610ee6b3bb0ee49cd72e38a9a323c8c64', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 07:18:47', '2022-02-16 07:18:47', '2023-02-16 15:18:47'),
('3bd3a6eb1d793748c0f246001afa1a1ddceb5380421445e46ee766a5f1b7750d57591cabdc72522b', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 08:06:56', '2022-11-01 08:06:56', '2023-11-01 15:06:56'),
('3c072956dad6114aa205fd5f543c2477233a8b7df46c8acc088359473985f342095e8b0b780f6a1f', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-09 16:56:40', '2022-01-09 16:56:40', '2023-01-10 00:56:40'),
('3c3ec00991376446577e3a5ec6bc3afe14d6529af06842c99ce821c1d50e88f7ad559aa131fe6e19', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 22:00:57', '2022-01-04 22:00:57', '2023-01-05 06:00:57'),
('3c4f07c15771e960c57bc7c3b3571a0b98540ac1e1a771ce0a51e344ecc286d4291b08220eb2bc8f', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-02 18:53:59', '2022-01-02 18:53:59', '2023-01-03 02:53:59'),
('3c8e5b9dd293b15cd628e727fd739cbbd9578bcac95110dcf14826f02cbfb8ed5dedb17085925c17', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-03 07:52:34', '2022-02-03 07:52:34', '2023-02-03 15:52:34'),
('3f266f95affd088f31f848053e761e3c5b438f7415e6bac8ec90d2da2f238777d0bea8be835d0925', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 11:41:41', '2022-11-01 11:41:41', '2023-11-01 18:41:41'),
('3f4d0dfee9721fea2ed594e6e1b6414a49b9bb806ca14673a04cec44e7d36909de2fa8c909b4081a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 05:56:17', '2022-11-09 05:56:17', '2023-11-09 12:56:17'),
('406c40041c9300234644675fc283c1502778cc33aa856a9f6ca79c04cabbdec65d61e61bcce87980', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-06 17:20:59', '2022-11-06 17:20:59', '2023-11-07 00:20:59'),
('4270bf51f540e5591f4c52e95ce31536e688c2d77ae154cea9a893568c7edd6c11f312f239d3de5b', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 07:14:51', '2022-11-09 07:14:51', '2023-11-09 14:14:51'),
('42e6cc0b27d599e03c06e4e5f4402f5ec132003439d1a21cf3918886054bb65730c5f6013d530b56', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 01:08:13', '2022-01-06 01:08:13', '2023-01-06 09:08:13'),
('43a4b9d75d063ed696cd8d68e06f33bc34a4cfe6f25873a8fe91f50163bc947025414dc0674f2e4b', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 18:31:59', '2022-01-11 18:31:59', '2023-01-12 02:31:59'),
('43b8ce2a8ca9cc650f043498ea30feb82e6cc724d78a8b4e6398dee3cb73ca702de47e29f99cb783', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 18:41:48', '2022-01-11 18:41:48', '2023-01-12 02:41:48'),
('441537552a8f837664b64d74b36021c519aed177c1c90bc48fe591848194dc3d5a205410ff30a3ae', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 08:34:21', '2021-12-31 08:34:21', '2022-12-31 16:34:21'),
('44402271c13fc25f30f158aae6019d7e48c3ae27ef3334343b51700f38ab27dce4199d9cbd4d2d19', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 22:47:58', '2022-01-03 22:47:58', '2023-01-04 06:47:58'),
('46f0d53729c19a7325eb6631a88441d43504fa9c1857303333082c6e4d323d1ff3def078ecc49809', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:28:35', '2022-10-12 16:28:35', '2023-10-12 23:28:35'),
('4748dd9d19cde10f231c685151718716eccd7c75487058f46624bf5f26453a43b96d8862a02702d2', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 06:55:48', '2022-11-01 06:55:48', '2023-11-01 13:55:48'),
('47ce504089ffb73e6ffe8af89261fecf6db71fc4e6372b6dc6b8f6e990af836f3391b9828974ea60', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 14:33:09', '2022-10-12 14:33:09', '2023-10-12 21:33:09'),
('4830676d2fadc020e0d08fd4ecf1cefea35bc3c1df0c3e60ef3691783823742644cffe946ec9d73d', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-11 22:23:50', '2022-11-11 22:23:50', '2023-11-12 05:23:50'),
('48526f415d466a365498853e9f51058d5793e821f7534161f3a458f6d066bf33cd12b0a296c2ddd4', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 08:07:47', '2022-11-04 08:07:47', '2023-11-04 15:07:47'),
('48dbe246a710fb4a5e3a6483836f17b4b702e0d0f4d9090c1920b02218281119632a596067fc053e', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 06:56:51', '2022-11-09 06:56:51', '2023-11-09 13:56:51'),
('4920552d27c7730e3bfa653418d1e30963e69792034a99ed3b017e3b00e4f078f825e34c4c8d7d23', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:02:13', '2022-11-04 09:02:13', '2023-11-04 16:02:13'),
('49bd187788b84463b3bcef842cd97de2aa138b412078090021c7780cad206518d90ed8e0fd8758bb', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 06:38:46', '2022-11-09 06:38:46', '2023-11-09 13:38:46'),
('49e0298519d3cb71d2943ad178f1d8d49ad6105ee7161a0541432ba14f561c785fbcf3bdbdb18b51', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-11 20:03:29', '2022-11-11 20:03:29', '2023-11-12 03:03:29'),
('4a34479926019afecca979b7f3a829295c908cde2c5925520b3de4c11e95eb695aaae07f07a8225e', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-18 23:37:19', '2022-01-18 23:37:19', '2023-01-19 07:37:19'),
('4a4892f0e28d356ecff6ec434b97d5efd941a39dc5f8c07b78de1f077282448acae7deba638fab8b', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:13:20', '2022-02-25 10:13:20', '2023-02-25 18:13:20'),
('4ae08506f044711218155027e448470c1edc5210e6b51da9aa0b211d821904799dba0bd247e7c007', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:28:29', '2022-01-05 21:28:29', '2023-01-06 05:28:29'),
('4b238417e5f5da177762215fe95430706ed6a8ff11a26ee44ba68ec069d50ca5b79e00e3d609bca2', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-10 12:05:14', '2022-11-10 12:05:14', '2023-11-10 19:05:14'),
('4bc73e6afa7aa70e1e1233e6f27ffeaa8ae38d8017d90ff4abcd1c9068bfdd5b45cb42216c0082cd', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 08:16:41', '2022-11-01 08:16:41', '2023-11-01 15:16:41'),
('4bcd2eff0d1775b7cdff9aa0c2a55ae0304ba1b13faefc3082aa2634bfbb86291e41c48947248371', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:25:17', '2022-11-04 09:25:17', '2023-11-04 16:25:17'),
('4c191e1fe0d023e23b57b01c1e20dbabb87c7df6db39cd5e8b70cab8342a50eabecf2e404d74285f', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 10:13:47', '2022-11-01 10:13:47', '2023-11-01 17:13:47'),
('4c75988efe029b94b0bd21997e7a42b7dcbde0edbf84dda54f34467006bf695d3e5687b3e8fff22e', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 18:06:55', '2022-01-30 18:06:55', '2023-01-31 02:06:55'),
('4ce4e76e9785c22fd6f92868252dec45e471a2b02a5f5f43a2e5e7809c9df48ccaeab28a01037723', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 05:36:54', '2022-10-19 05:36:54', '2023-10-19 12:36:54'),
('4d877ad975a6b472e76e42ef2427eea8095f2f3cc6a6fb5dbedf6dda615aba6cf603fc96d8c8c4c0', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 00:51:53', '2022-01-08 00:51:53', '2023-01-08 08:51:53'),
('4d8a08d106cf98f08ae0247718c44a00c9ddf0de8a15be216ab4ac6b8102adee9ef6930d515bec93', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:41:53', '2022-01-07 21:41:53', '2023-01-08 05:41:53'),
('4d999c261602cc29249d233a9bd29aa9415ed8459c3c0233e57baa13aac31cb11e7352daf76a1e5f', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 07:16:29', '2022-01-07 07:16:29', '2023-01-07 15:16:29'),
('4eb59929f4a80ad7bad8eb75fe7c25c96ba70e4f7fe07c1b4f7745d9d27984cdb5003324ce98f548', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 08:31:42', '2021-12-31 08:31:42', '2022-12-31 16:31:42'),
('4fc18b601f2960a0d5c9fc8501bc047373ff7e8879bcf06b67398efc58373ceef361f4d980a6c380', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-10 12:38:26', '2022-11-10 12:38:26', '2023-11-10 19:38:26'),
('4fea56c8f33baaf2427564cbe4b6cc45455d0dd87096eb7f5fd86adca1e013ed85c4c602d14ea882', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 03:47:25', '2021-12-31 03:47:25', '2022-12-31 11:47:25'),
('4ff4d16e3b5ac8cc86142252099585ad2df9b1d125f3655657d27b3c24d35f865c351d987aa67f88', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 22:13:14', '2022-02-25 22:13:14', '2023-02-26 06:13:14'),
('50353dad8730b5058341a09553f54fdecc3945504e95ab282a370e17af1365362fedf8f63031b4da', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:53:46', '2022-01-05 22:53:46', '2023-01-06 06:53:46'),
('509ab42650667eb7c8e7c566536144a6799a3d0ffa3f18f0c405bf112d983b2a356c119c5891b323', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:33:39', '2022-01-07 21:33:39', '2023-01-08 05:33:39'),
('51032e534066d5775bebf9d76d7368cf9e3043d8a70c5d3e09cf352b2f94ef65778b932f968be943', 68, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-26 06:45:54', '2022-02-26 06:45:54', '2023-02-26 14:45:54'),
('51ae6734178a1a3e4490245f4473656707ae6a92130c07fe5334b32ba59cb7732d356a850f444517', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 07:13:05', '2022-10-22 07:13:05', '2023-10-22 14:13:05'),
('51c6a510b264b0d77bf8509949eb682c8f7a724fccd9244615aeebf0341ae4e1d1babc4a08c770b9', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:17:11', '2022-01-05 21:17:11', '2023-01-06 05:17:11'),
('53d1a347c40a9af10de5bb2ec33d5665ec41b4726d00e59cf6dc604e6e4817ce342f07c5b51f6aa3', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 09:13:57', '2022-11-01 09:13:57', '2023-11-01 16:13:57'),
('53d82140023b6463b4e9b52e41cf6109729b7d238ab842dabd033b8e694e65714c613cfb35da7755', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 12:45:46', '2022-02-07 12:45:46', '2023-02-07 20:45:46'),
('5466374804f5da714c0ee114ac46ca5e07f9310a3d4668079aab13fe3ce7a511a1c9b199ffa724ff', 67, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-26 06:15:01', '2022-02-26 06:15:01', '2023-02-26 14:15:01'),
('54b9202e3b2622695c7f5a9e24d7bbaeeb3fdfd36f8cd10898a5885f33cd36c7fd56d6a1d2d0c59f', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 20:57:20', '2021-12-30 20:57:20', '2022-12-31 04:57:20'),
('5573e4c3cc0a18559d7deb9cc234862e515c45a91e37444c145010690edcb2cbd5897c077458e71a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 15:09:37', '2022-10-12 15:09:37', '2023-10-12 22:09:37'),
('57488ed60ba54f17942289c6f59d7c253c383427ebabf039265e741b2602e8bfc057f6b552bf5eb4', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 15:11:39', '2022-10-12 15:11:39', '2023-10-12 22:11:39'),
('57a1dede9b77054f43a5cde6acb1b7ced7a1f394bdecb8e24a8599f93e0023cf21b64329f69dc339', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:41:10', '2022-10-12 16:41:10', '2023-10-12 23:41:10'),
('58ee7af23b0a9503206cebf3404956918be8fb566361aacd79687919ca27d25dbbccdfb8d703bd54', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 15:53:48', '2022-10-12 15:53:48', '2023-10-12 22:53:48'),
('59398e7c1f7f0aa2f93bb211859489444ec27031f09a38ca36288f955f5bdd4ab75ccd2600190641', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 06:34:39', '2022-11-09 06:34:39', '2023-11-09 13:34:39'),
('5a471f198a6281878ef7a8f1775f82648db9c645e49b002595678b5a0c1d603e306d46488edbb215', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:34:43', '2022-01-07 21:34:43', '2023-01-08 05:34:43'),
('5a5e0f9b0ac7883f75a7181c06c350674eae7cb02f6e79972454dc5c4aac0d8774f23c9b5fb3618e', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 06:48:35', '2022-01-08 06:48:35', '2023-01-08 14:48:35'),
('5a663e46365a096bef2872d8b5c12dfb018e49bbf0ada69be2408f636b3dd8fb4c72941a103fdb59', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:19:50', '2022-02-23 01:19:50', '2023-02-23 09:19:50'),
('5b6d9723742af39a685470308b046b3a425627133998027e340a3cfe37a2c4dac73dbece51d93fdc', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-27 08:39:59', '2022-10-27 08:39:59', '2023-10-27 15:39:59'),
('5bfd176ae88e3744e2eca482d2d1b9a8b4878fcd656810375fbbbb0b723b0daeb8c535a319c878ae', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 16:28:09', '2021-12-28 16:28:09', '2022-12-29 00:28:09'),
('5c50f65860a326d66b552ad82bf8e9eaa418cd5f7f4e3e9e223f43a704e80eb15064228b1a8d78f8', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 21:16:24', '2022-01-06 21:16:24', '2023-01-07 05:16:24'),
('5f0256d5e0a77a11b2a699e32217f77e00cc30641d7570bc546dd7a437975631ad4e1a56ce5325c7', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:34:37', '2022-01-05 21:34:37', '2023-01-06 05:34:37'),
('6001f5c1cc1095ebbde1560a65dd478a9b428818e5024b50983c81295cd207ea1f942ae54571d642', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:05:04', '2022-02-23 18:05:04', '2023-02-24 02:05:04'),
('6022926f0c94ae4b0df70b48f3fe6217bee7b6e70919f1435a0641b51a6cbebab91c08996f5a2036', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 18:04:57', '2021-12-29 18:04:57', '2022-12-30 02:04:57'),
('60e611cc1d23952a9658c2dc5aef68482724d14bbbc982806edaae466c42a7713cc9b9e0c28dba00', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 21:20:03', '2022-01-06 21:20:03', '2023-01-07 05:20:03'),
('61d5bf00dcdb7ede44c604e5a000a22136949587517c45660403a5712a7e4e4cef4961ef410990b3', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:20:10', '2022-11-04 09:20:10', '2023-11-04 16:20:10'),
('61df5d0f781f1b0a85a203c03536b2db47ec36405df32a76fe81c57582ed468fc915bcf509bb94d3', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 14:33:55', '2022-10-12 14:33:55', '2023-10-12 21:33:55'),
('623cee0da31673b4411fabdbf4769dae9031996d7a98c97d99e295cf72f73d5409aa2dd9992f1728', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 17:24:57', '2021-12-30 17:24:57', '2022-12-31 01:24:57'),
('627257b7f0ac2cac045527491b13ade4b23cee574bf5ff3a2dc04353cb8d8a42d8839e60bff46e64', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:19:21', '2022-11-04 09:19:21', '2023-11-04 16:19:21'),
('637c9d61db4464d31c351d737ea356518b78c16ad2c437a6a2347ddffd59d9a19a4e288e4b79069b', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:25:42', '2022-10-12 16:25:42', '2023-10-12 23:25:42'),
('643baed8f355955cd55f3e61db97b2b30ceb13c451efa302dfa99346506a0777c566a75f4638805e', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:18:53', '2022-01-05 21:18:53', '2023-01-06 05:18:53'),
('652b3a2754166157d3c0b303d08ec801fecf6fa915965ff273c4d7f3058d7d1a94ef7c2264237b86', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 09:01:03', '2022-11-01 09:01:03', '2023-11-01 16:01:03'),
('675d4cda828abc98f0e39b679e34dc8c8c3bcdeb2c563c2475ccc20dcc9c8d78249dd9f957527dbe', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 18:43:37', '2022-01-04 18:43:37', '2023-01-05 02:43:37'),
('682d743b1dbcddfd1858e990986a4bd42517fa780b2bfe3b08a0748d42372753d70a319ffea69c94', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-26 06:34:30', '2022-10-26 06:34:30', '2023-10-26 13:34:30'),
('683bf05b22e21590e12a7ba7de84d2d6594b93b1ab496dc8a7e9b1b1ce78a207f5cb9916bc23502b', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:52:57', '2022-02-23 01:52:57', '2023-02-23 09:52:57'),
('688728a737d10064259c9d413af2e31c02478d330bb64a5c1478e4503d622b93e1d19b07fa1d22c4', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-26 08:10:50', '2022-10-26 08:10:50', '2023-10-26 15:10:50'),
('69cc008c74d95da069c9f28247c9fb9bc74dfae2ef804458d5604294aeace6a087d7386ba9371402', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:48:59', '2022-01-05 22:48:59', '2023-01-06 06:48:59'),
('69ccb3f44f023f9f32bcc0f838cf7c414fb2488bc03ad46eb3288f6765f364a504aab549a2bd77bc', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 06:43:20', '2022-01-12 06:43:20', '2023-01-12 14:43:20'),
('6a2c9693fff98b924e6c122ccf5ce2026d3a9a37e287e1c4e5bae993b3c3fdc9adc2c4760392f753', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:49:58', '2022-02-25 10:49:58', '2023-02-25 18:49:58'),
('6b01d5a9b15a2ebb96c96bf19aa19dc12c92a63e6e6e2459ab583ee6200975c7aabacc1456eb82ab', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 07:40:53', '2022-11-04 07:40:53', '2023-11-04 14:40:53'),
('6b17ee46e647070bc3b50a3e391aaed5efa9455a6cf7e86ed85f8d7a5eae4e4e786289f71bf64898', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 06:39:21', '2022-11-01 06:39:21', '2023-11-01 13:39:21'),
('6ba387a6950fe1d30f81978d7ddbdefa6fc025af704ff7a2f2293675139599834cf4fab9f9ebaebb', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 06:51:22', '2022-10-22 06:51:22', '2023-10-22 13:51:22'),
('6bab2074f4f2d2a7a9e85ddbf1cd6e11524024c5583e9b412fa3c7fe5cf387ff616ed8e39dfdc898', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:05:16', '2022-11-04 09:05:16', '2023-11-04 16:05:16'),
('6c102eb820a8e984dced47d88fbcb9a4f7473f43c342714e454c5d69ee7ab3257291df11c821afb9', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 06:24:46', '2022-10-19 06:24:46', '2023-10-19 13:24:46'),
('6d13a1449422754a9e1e7fd299e9f8f71cf569e08578c8a49fdc9695d0b8bf7e27667c4512320751', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 04:50:15', '2022-02-25 04:50:15', '2023-02-25 12:50:15'),
('6d65ada89ee7dd6998b88e8d1c769d90d8acfe5f0ef39ffcebbf416c9fbba603fca57c5ca9801d52', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 11:13:11', '2022-11-01 11:13:11', '2023-11-01 18:13:11'),
('6d7a5b5b91aa4a86ed34ee515e6fc3df670d59531054f2dacef1d186642465fffd9d56c5e6fb1eb6', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 04:35:00', '2021-12-31 04:35:00', '2022-12-31 12:35:00'),
('6db3c8603d02bab5b6e2a0c923bbd7b70b411a99a9185c8c12787c34f0e54c9600d82e3b9cca01d1', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 11:11:12', '2022-11-01 11:11:12', '2023-11-01 18:11:12'),
('6ddc51eeae912fe72230627a0e4e366fe19eb9f15ddf3b033b94522748c3440adae90a1cc9e4fdf2', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 08:11:38', '2022-11-01 08:11:38', '2023-11-01 15:11:38'),
('6e0b016027fcea8a9247c4b24bd15feaa04c0d9c0946d7050808d1000218a92078aa3b3f25f9d52f', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-26 03:55:54', '2022-10-26 03:55:54', '2023-10-26 10:55:54'),
('6e46321b6cb41f24319526455f7ba38633c5fadcefabde12cb6a53b5c29ae84f7b1ce77790d8cd60', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:04:09', '2022-11-04 09:04:09', '2023-11-04 16:04:09'),
('6e5bfbfdfca5491ade4fa829c397654c09ac0a53cdea2775827a50c1d6452d74cba992bdb7d44b0b', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:08:52', '2022-11-04 09:08:52', '2023-11-04 16:08:52'),
('6e7adc4d655604527fa2149a226c9028c7fcf526fd5019cb17aaee6a2f1a9cabaf38dcf90e4a3bd1', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 15:19:11', '2022-01-08 15:19:11', '2023-01-08 23:19:11'),
('6f518bc739c8238c4a3eb6e265f2ca1f9784f39d89f07e7b78ba726d490cd77f04cca3d482e2c9d6', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 05:57:44', '2022-11-04 05:57:44', '2023-11-04 12:57:44'),
('6fa3bd7b05337722a0a102417e394313318dab69eaab4521d5cc017ee53a1c2270785a53bd78fefb', 81, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:29:26', '2022-10-12 16:29:26', '2023-10-12 23:29:26'),
('705ba45cd63c7b7b2ecee858feb5780eac786a255be56394c194a3b34475161033b2b816ff27063c', 36, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-22 09:38:20', '2022-02-22 09:38:20', '2023-02-22 17:38:20'),
('70c1e66753654de62a578b85f96cf0d4ef5cb21f9644ec61fb4e9fbf70c358909320a578daea7d02', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 10:53:12', '2022-11-01 10:53:12', '2023-11-01 17:53:12'),
('71380264fb3ab00a28bbbb3419378eb2b2040e5405498d11ea086d4091a2a980167d9eb029de4710', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 10:59:01', '2022-11-01 10:59:01', '2023-11-01 17:59:01'),
('71c775f4c72b7698969a5fdf2c3da2a6d2d5c8aa66f1c419f0e87f11bc449fdf8657e4a431d1c352', 45, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 02:32:14', '2022-02-25 02:32:14', '2023-02-25 10:32:14'),
('7232cf95e921ba6713675f12f419822a33e9377e9f3e0284058117b031330cfdbc5d5e6ccbb0681c', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 06:50:32', '2022-11-01 06:50:32', '2023-11-01 13:50:32'),
('7280e990465afe67eb2d371c676f9b665a08525e49085fc200136367938681d027bcf1319fef8e45', 43, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:50:49', '2022-02-23 18:50:49', '2023-02-24 02:50:49'),
('73f76515919fa6369e6d39f3ba7b1e1e4f11587e2984939c75425f570ddf4db1ef328034fe5113cd', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-10 12:51:22', '2022-11-10 12:51:22', '2023-11-10 19:51:22'),
('74192eb9f5bbee0a56acdf5bd563651c0a65c4665c72ae3cbcb44b9af8ece7b98511bd7fa5d7b945', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 01:31:38', '2022-10-19 01:31:38', '2023-10-19 08:31:38'),
('74821caf6d2ac22e9b6ef8dfc0a698a590d76ad1c837388ab52e38abcb073f6ca80b6ff10344b8a2', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 12:45:39', '2022-02-07 12:45:39', '2023-02-07 20:45:39'),
('751a88cf916da3f1e3e0f30953c82418c3712207eb9277f362f525450da9f981aa2633507c3eb8db', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 07:43:52', '2022-11-01 07:43:52', '2023-11-01 14:43:52'),
('757063555d459dcc7cce329aa8aacf51b2f5b8192cf9be71f74ef1764adca54eb30475b643b93914', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:55:14', '2021-12-29 17:55:14', '2022-12-30 01:55:14'),
('75892dcd672ead45c95e324ffa430e57c49e4a60c3c2ea0e855dddd0f4614c2386baaed729d21e70', 13, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:47:54', '2022-01-05 21:47:54', '2023-01-06 05:47:54'),
('75fe6a6a5c4253c4eeba5c97b5bbf08df87fc4ce0bfa62fcbb6a2255fe4d7db0dde87729bedf5605', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 06:57:37', '2022-11-01 06:57:37', '2023-11-01 13:57:37'),
('7643927b0b754070e24b453f9e44faf62a2df05c7d92eb22c2ddbe26d8fd61822181eba0887f2492', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 07:19:23', '2022-11-04 07:19:23', '2023-11-04 14:19:23'),
('779752a9692ed4d550ccff03d26f635df43375a865c94c3e18e82da09701f8d1095691f61d8e5550', 49, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 08:23:34', '2022-02-25 08:23:34', '2023-02-25 16:23:34'),
('784dae95df96ef61f8138a3b959744a5cd879d95e2b33ac256b146224c105ad12e9bc8696812893e', 16, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:05:33', '2022-01-07 20:05:33', '2023-01-08 04:05:33'),
('792beb9f87d06576c7908f3d365b5feb98a2d9c71677ff1ffde0ad0bcb833c4d6c6b23a35863011d', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 07:16:43', '2022-02-08 07:16:43', '2023-02-08 15:16:43'),
('79a5b17c0076d72329b13d6ae0d40953b49c6d6771a37aff46ce23496f7281a7a9995a384517da6a', 58, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:30:23', '2022-02-25 10:30:23', '2023-02-25 18:30:23'),
('79cfb6361fb483d8229f512af04eeac71a904a9dbdf09cb9e05830cd7ae56f72a716c844c26fec1c', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 09:17:58', '2022-11-01 09:17:58', '2023-11-01 16:17:58'),
('79d078a028b6221d32a188d43ece8bdb6b8998a70cd21cbada04d3767831ea82beee6bd6c224667f', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 11:38:37', '2022-11-01 11:38:37', '2023-11-01 18:38:37'),
('79f5527a90d2c2195c13bc2f22738cb6ad741530585679b6e58630f26f474c7f130fd9c3809221ea', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 18:55:57', '2022-01-30 18:55:57', '2023-01-31 02:55:57'),
('7b24e8cf2eee5e09f07d40b7b4adf3bd1e308a1231e29ebe1861f7f247163c0821b3acb4f2b38881', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 06:48:03', '2022-10-19 06:48:03', '2023-10-19 13:48:03'),
('7b3d68657f25661ea504e300c0b0c2281d189633450594e1d9fe08c7af1c9ef490ac72dd09d81e87', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 17:28:16', '2021-12-30 17:28:16', '2022-12-31 01:28:16'),
('7b9ad4d0a151bee3209e85b544c343dff5af2787f62a59cd77044bf5445d0e89468e6c287e8dbcfa', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:33:05', '2022-01-03 18:33:05', '2023-01-04 02:33:05'),
('7eb94bf1a8404f4c59461170f49a649099f37e23a416e008c27b6c5198c6de7382d402d8f1008983', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 06:17:30', '2022-10-22 06:17:30', '2023-10-22 13:17:30'),
('807897807d2d5591dfcf5625ec31db78830c0f696a091364cf9de2e350c74bd696a287d3d5d041ad', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:13:05', '2022-11-04 09:13:05', '2023-11-04 16:13:05'),
('812c8587c694d358e8783e482a011fcd5a3f0cc60fb183bdfb5eb5752501005d758128179ff326fc', 60, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:49:20', '2022-02-25 10:49:20', '2023-02-25 18:49:20'),
('81649d1b88056837bcfc319b41dc49cbacf80991c73282182a2039de990b336c6d38563cdafa4a8a', 82, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:43:30', '2022-10-12 16:43:30', '2023-10-12 23:43:30'),
('817a809477897626524c7232b904fa6d8c998ed59e4442ebd5b5d83318e159e92b7f56fe6bf646df', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 14:50:29', '2022-10-12 14:50:29', '2023-10-12 21:50:29'),
('818542fbd348e70ee6af11544d6e29ae26c02b4655b6b8e2a34e4adce5f8b735757348e6624dd69c', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 17:30:14', '2022-01-03 17:30:14', '2023-01-04 01:30:14'),
('8284518210f8b5d99af902312956ce3f4aa077494f722e4905f830ec7b82bfa39747893a318fccd6', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 17:42:08', '2022-01-03 17:42:08', '2023-01-04 01:42:08'),
('838a1b1289dacc3cd554ec3dd6f35232896bcbe02abbe4bea7a220db640c2d6082e2215a603af6bf', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 15:20:00', '2022-01-08 15:20:00', '2023-01-08 23:20:00'),
('846f4be36d7d2975e95f0c60a0b0be8a9cec3fc0e47368d0babacc9ff813feb23d5c9c29631524a7', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 00:22:58', '2022-02-23 00:22:58', '2023-02-23 08:22:58'),
('84c781d6e16225016015d83ba54a48139d96361a70905d6372d688de945fe3fede21133d4e313650', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:13:35', '2022-11-04 09:13:35', '2023-11-04 16:13:35'),
('852ac3cfedae03cc5cde1d69a475a51cce94500c2666da3fac041808f8f4a610abe509e48948938e', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:54:31', '2022-01-03 18:54:31', '2023-01-04 02:54:31'),
('89ba2b8d672c2b2d6ea33932487d9a70e74fbf9eb23d2fb01ef94beb6e952e6866095e1054f4aac7', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:13:55', '2022-11-04 09:13:55', '2023-11-04 16:13:55'),
('89e3f21e8cd79ad02f513e21327567b1995953b40455bc6d18e9f10aee38937c38a618031ddda839', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:34:20', '2022-01-05 21:34:20', '2023-01-06 05:34:20'),
('8a40a6b00571bbc1bea0ebca233a51c2e5a570097093610d5a84c1f806a18ea00abde385b1981cee', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 19:23:55', '2022-01-03 19:23:55', '2023-01-04 03:23:55'),
('8b077f0766d3ab34f93603dc08e6e61a1e8e43a2397a464ff061d2e0ec05aff64e1800d170c03020', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 03:49:41', '2022-02-08 03:49:41', '2023-02-08 11:49:41'),
('8bb0f802659369d8a0987dfc9b70456b819b6cf15c9d94c96ba6f78ec44f5032cc2d6e1b81213705', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 09:11:01', '2022-11-01 09:11:01', '2023-11-01 16:11:01'),
('8bbeecbd458ee9a11e307c5738d071561f5c1c93fb6a746f6329b1beed11415af532d05fe2a6b5f1', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 06:32:01', '2022-10-22 06:32:01', '2023-10-22 13:32:01'),
('8c61f126db6a6ccf3c0ac7d59c8f3f839982aae5a1bad046efb018abaf2b6e83c06c32023150c4b7', 32, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-12 22:39:27', '2022-02-12 22:39:27', '2023-02-13 06:39:27'),
('8d2e8a6cd049ffad60dc4effcb54785b3b0953a6a9a2117da39f65a2d00f99fe085dd5e0443b09cb', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 08:14:53', '2021-12-28 08:14:53', '2022-12-28 16:14:53'),
('8e85fdf65e8cf5bf056549574a4ef1ff7ce6c26d3b02165f6ebab710c3feab3e01b19a73ac33b955', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 07:18:00', '2022-10-22 07:18:00', '2023-10-22 14:18:00'),
('8eb2e80e081846d750813aaaba794b3924f37ba3c2171878da2aa86c24c8fb12f12e376b7ea112f3', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 06:02:06', '2022-11-04 06:02:06', '2023-11-04 13:02:06'),
('8ec3174972db78aadb19721544fcc3b9fdc18a244ab9e4e14d78cd8136b1431c411c83da425ccc11', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 06:51:09', '2022-10-22 06:51:09', '2023-10-22 13:51:09'),
('8eef0ad9f62e7ac6bc2131e6ed0e8cf75b319834b86cc4e6a60f82921952b2ac6654504176a7c634', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 06:28:14', '2022-11-01 06:28:14', '2023-11-01 13:28:14'),
('8f2cf0c4beb353a453f64983fd1a32cd71403a781c477416fc1c81d0fd2748a3b0dc47ce4a11cb0d', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 12:45:55', '2022-02-07 12:45:55', '2023-02-07 20:45:55'),
('918458ba4fc1212c05770f0d7bd19005a1da21b4e06a706de50c7af7aead7a3c605f367c1f63de73', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 08:29:35', '2022-11-04 08:29:35', '2023-11-04 15:29:35'),
('9206e57ad0dcf8a4df5a637ae864eb7088a05a1b9a4ce47e77a845a20841b4689664dcf3b1b8afe7', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-15 02:20:48', '2022-02-15 02:20:48', '2023-02-15 10:20:48'),
('924a0bf5f657ecff6e4cb2c1d31f72fc7d26e82e573631fda6ad595d3e4f7828913ec1138303f844', 72, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 16:04:27', '2022-10-11 16:04:27', '2023-10-11 23:04:27'),
('92804fa01545d971587b64d216802b1f8e2bdea7c7388f8b447acd557023418adb0a80e7e7d9989e', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:55:18', '2022-01-07 21:55:18', '2023-01-08 05:55:18'),
('930661948a2351f8de5a8dcc74fa0531e321e7a897bda5eacd619ea94397d113dcaa619eaf9a94f2', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:30:10', '2022-10-12 16:30:10', '2023-10-12 23:30:10'),
('932c77cc24b6d409addc052e6794cf6c5f901699a88e755746afc4ce5a77c8b948b8ec667e60789e', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 00:40:47', '2022-01-06 00:40:47', '2023-01-06 08:40:47'),
('9336e4ae531bf8678683d7a9c1702aa8ad0d8d71560090e2568404030cf283f0b1a02f5739f822c1', 73, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 16:19:26', '2022-10-11 16:19:26', '2023-10-11 23:19:26'),
('93626a8da875a33dd7d513d0818ee20f14138f7b9f88dc098588cab09c793f20f1233718ff5e44bc', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 08:44:41', '2022-11-01 08:44:41', '2023-11-01 15:44:41');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('93990e46b32cf0227ae9cae83cf696ddbf32b26406b6903df81a22a8378f1027f5a6a2de3fcb81b6', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 06:14:44', '2022-10-22 06:14:44', '2023-10-22 13:14:44'),
('93e21f505c3c34bbad5ba188ae5333155084f6476a856fa9c662283cb337858f9239983a0044fb2a', 78, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 17:09:25', '2022-10-11 17:09:25', '2023-10-12 00:09:25'),
('93eb7d8f7517394c44cfb3a9f6ea43c3b7d5b9472b9cb6d417af1b7d815752a7df0c679e348f6692', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 00:50:37', '2022-01-06 00:50:37', '2023-01-06 08:50:37'),
('93ee57e41496de8d5dbcfffa742d875589358b73540106511dde09f9a93c0cd625552ac4418cf5ff', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 06:52:41', '2022-11-01 06:52:41', '2023-11-01 13:52:41'),
('93f0492421c41e5eb1443c118e74512ebde15eb0137b7410824c860f05f8774ec9d0cecfb1f9b92e', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 15:49:21', '2022-10-11 15:49:21', '2023-10-11 22:49:21'),
('970d7b325c224c57d3a5b72f90a6a80ac0b85031d20d3fa367d764f227fb09273c651ab3f2444c59', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 06:40:20', '2022-10-19 06:40:20', '2023-10-19 13:40:20'),
('97b6ed4b39d0d64dbd35a8cac3d1ca5142f0251a26ad4d8116d0fc392dee89c5f49f08e0730fdecc', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 19:20:26', '2022-01-03 19:20:26', '2023-01-04 03:20:26'),
('980d8cc2ba4cca1a65993fdbbb5d662881a84ff109584ba7ea998f4e6068afb15c13a17bcb31719b', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 06:14:20', '2022-11-01 06:14:20', '2023-11-01 13:14:20'),
('9895b1686d3e2b8b0b5b7bf6b7a295e3ed7a7514807c4c2bc3b850ecaab985459cf4b48e1f61e90f', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 19:18:19', '2022-01-07 19:18:19', '2023-01-08 03:18:19'),
('9a230c77939a392527cf3920deee545546c5a089660ec568b65f6814f56123d212606d907ff80274', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 07:33:28', '2022-01-10 07:33:28', '2023-01-10 15:33:28'),
('9a6528118e3a7bbf5232aa44c7651b259c9ca70cfb415ed31c989edcac0c85f3cbe0dedf25c023c9', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-27 06:55:48', '2022-10-27 06:55:48', '2023-10-27 13:55:48'),
('9ad423386cd09f641e780e24c36ce7d34d25eaf632622177ae46800d6136fa7e1f5008b81cc5c3c4', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-06 17:26:09', '2022-11-06 17:26:09', '2023-11-07 00:26:09'),
('9b5143193a246762d2ca70e73278faa0f01b6b3f5cbaeebcdf621e0804fb5aa52be6992e68c93fb3', 53, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 09:09:03', '2022-02-25 09:09:03', '2023-02-25 17:09:03'),
('9cfbb8c2976812e7980c0834b8dda13618d904377670abc36f681d2bb805c07c952e09ca058d8795', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 17:59:34', '2022-01-03 17:59:34', '2023-01-04 01:59:34'),
('9f7bb3fea19cbb156b550dfd88fe6d73cd38b895d0cc0ea22ceda0fea061b21ecca3e14b13b2629a', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 08:18:27', '2021-12-31 08:18:27', '2022-12-31 16:18:27'),
('a1df67582c4a021caf8b5326c76f0f2841d80478897c3727171d244fee71f8cfdadd44357e5109c5', 15, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:14:44', '2022-01-05 22:14:44', '2023-01-06 06:14:44'),
('a259293e68782e9b23d55b4ab5a797ceb55068120f3774f14c710f532dd0ef94f316595b951519be', 35, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-17 08:08:33', '2022-02-17 08:08:33', '2023-02-17 16:08:33'),
('a355bde9ee168d4ba799870f85c0d0276852a09c615ab848acb78faa1051391ffda9e5a5bf91e945', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 06:59:59', '2022-11-09 06:59:59', '2023-11-09 13:59:59'),
('a370ecb131278d852254654ee9c255b71d991189aeb141cdfb2848760ba9b31f1444890a2fc08f09', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:51:51', '2022-01-03 18:51:51', '2023-01-04 02:51:51'),
('a3e7eccd24319ee0fb265f3040e42e1a3990270c202823b93cee2bf2ddc924f8c3be9f8e67a527b1', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:46:47', '2022-01-03 18:46:47', '2023-01-04 02:46:47'),
('a4568e0f106c0f7cc7b2267315d119731c6029ff7cdab19e2d1fe58dad6707623899055f10921448', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 03:21:20', '2022-02-23 03:21:20', '2023-02-23 11:21:20'),
('a4b9011a3eae07097f1b13df1bd4601f8ee1595aca7c20ef83ce98deb7a31633953e628634be95b6', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:25:53', '2022-10-12 16:25:53', '2023-10-12 23:25:53'),
('a54cebde04a6a69a15338b39fa5b246f9966390180bdfeb250535c4860ead886d584c52885f3274c', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:51:17', '2022-10-12 16:51:17', '2023-10-12 23:51:17'),
('a662c6a8f145e296068f678a0fea3b64055b60b5557f735941643b0271b86f491e061295d7ff271b', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 06:42:35', '2022-10-22 06:42:35', '2023-10-22 13:42:35'),
('a6e8eecf25d4ee64ec1978a7e68192d66aa8498e9e3a9aec563eef52b2aeaa299353b8c6658e0455', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-26 00:11:54', '2022-01-26 00:11:54', '2023-01-26 08:11:54'),
('a718b32121f8064871472a8f6514aa3762bc1bf7eceed76330a384b370f67a3cd1aee8f9c9ff2dbc', 76, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 16:24:27', '2022-10-11 16:24:27', '2023-10-11 23:24:27'),
('a8ff89b1ca5d4cb9f069c30355270531b188c3f22591458c86eb3060290e10d1c8b5b63899384c1b', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:54:58', '2022-01-07 21:54:58', '2023-01-08 05:54:58'),
('aa493107d78a8231f33996d409da2cff0d3b1bf7143d06213bc5e0a3dd4574572f0c4acbc5248a9b', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 07:00:47', '2022-11-01 07:00:47', '2023-11-01 14:00:47'),
('aab379630aea4730836f7fd8e5d06371b4abc5aa2f0a982769ab039fddd929525974d609a1dcb893', 66, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-26 03:30:11', '2022-02-26 03:30:11', '2023-02-26 11:30:11'),
('ab3fbfa27746be44605374cc5cc480c9638c5ac58feb854bdc7b3309201310c90da79117d64f1c91', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-10 12:10:52', '2022-11-10 12:10:52', '2023-11-10 19:10:52'),
('ab58fc7a5ce9348c15cc8d00cfb9739bbdb45f06f9cfccacfaabfe84b645d8cc5252bb45ada8dfde', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:43:57', '2022-10-12 16:43:57', '2023-10-12 23:43:57'),
('aca4fb865dff9425e91ba9f9520498db22d7329d3edf98e20b2aa4add5ce34cd8fe511e846974d11', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 04:01:13', '2021-12-31 04:01:13', '2022-12-31 12:01:13'),
('add9b792108d4f804a4adc1f84090cbe3f8842460c6b909577543ae326a23a347a23724e631928fb', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 07:04:37', '2022-11-09 07:04:37', '2023-11-09 14:04:37'),
('ae50b7a44294fd573e59752df3e9110a0b613631df7558953dc671c489cc627917f25886bf2fbe69', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 07:09:29', '2022-02-16 07:09:29', '2023-02-16 15:09:29'),
('aee79a16ee8d485eb34dcdbf8db900d100f1be766e7b5399618d5dc82cd952129c4704d819f3946f', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 08:20:47', '2022-11-01 08:20:47', '2023-11-01 15:20:47'),
('afc4136aabc5da2dc175e8b0eea2fc4439a90c7a8e80870fc746555d288878f62b64c6e110506a7a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 10:21:09', '2022-11-01 10:21:09', '2023-11-01 17:21:09'),
('b0970a82cd28ee59fa499ac08f51c0b78c09716b0b19b4fb92f32849f4a6559aff46ad01e7f741f2', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:39:38', '2022-01-07 21:39:38', '2023-01-08 05:39:38'),
('b111a0c8c7abce669388a758ae94a5f95af31868a4a04b1bc9624dd1bfef8271d8a88ffe200a1dff', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 06:50:04', '2022-02-16 06:50:04', '2023-02-16 14:50:04'),
('b14fe58c9480e1214e8e95ce2c1ddc8b633f262c87f36665be23d6ba22d5b77cbaeeb09161004074', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:13:47', '2022-01-07 21:13:47', '2023-01-08 05:13:47'),
('b16a67803345503cee0f7c048dcff17b426d9f0212828ae7dbbf4c68357d3cadd7946cae4f9d96fe', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:15:34', '2022-01-05 22:15:34', '2023-01-06 06:15:34'),
('b18e920e75c7c7b10e9458fa1beb93723cd1c36dca347e30180f96dc1dbef5a11dfe2646dc558b94', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:43:38', '2022-01-07 20:43:38', '2023-01-08 04:43:38'),
('b18eb86c4799cbf5cb3be06054e41695bec9b8a8b914004cf7fa1abaee9f0a3fb0e7ab839ce415dd', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:04:24', '2022-11-04 09:04:24', '2023-11-04 16:04:24'),
('b1c5efc19738e2080cc2cca53421aa39b6a06f058d086907712560b6f47368fa64ae687b034bf869', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 08:18:39', '2022-11-04 08:18:39', '2023-11-04 15:18:39'),
('b328adb94a5a23e5be4570755bae5f9841dbe3ff9d1608abe4d6496aa10ce2d8112110207910f572', 69, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 15:45:51', '2022-10-11 15:45:51', '2023-10-11 22:45:51'),
('b334b88e20c16f197921fb51d65c91397e527204b8aa06ddcb80496475c8963e04cb8d10e242c0ab', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 09:25:54', '2022-11-01 09:25:54', '2023-11-01 16:25:54'),
('b3cf1147124ba4cdb091f3dd7b3429ac25bc5be2acd6c46740cab0215167b9851cedd4b709015d6d', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 15:11:45', '2022-10-12 15:11:45', '2023-10-12 22:11:45'),
('b3e71302087818ed6c38184a6f46718d94409856e84bee82e86113bf41282bfe9923bfbd28a1f9f5', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:09:33', '2022-11-04 09:09:33', '2023-11-04 16:09:33'),
('b4b5d8a4e5595afce7fd0ac3f8ef4f838767e6e56f7212ee93c30ecaa8a7edcadbf79e0b24df0d14', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 07:53:36', '2022-11-01 07:53:36', '2023-11-01 14:53:36'),
('b4d66b118f6b46890ba5365bdc59d7725422e7bcc5089684e2ed59dd9a0d835c0f57717c261bd6e7', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 07:03:08', '2022-11-01 07:03:08', '2023-11-01 14:03:08'),
('b4e832011fb26ccbe94e46e38b51b2654844ca885779bf368858633909d90097f4db8a5ca4b9409d', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-03-01 02:01:44', '2022-03-01 02:01:44', '2023-03-01 10:01:44'),
('b4ed1de0a9e79074ae937ce0a182bd6b5e0d29e2df66c5438284f39d31b6a3c26f691a5be200832b', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 07:11:56', '2022-11-09 07:11:56', '2023-11-09 14:11:56'),
('b5bc9a3decb0df9e1e1bea8472894a2dca25aafad9a24a9151359396f84131c70565a31a0ccd1777', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:18:16', '2022-11-04 09:18:16', '2023-11-04 16:18:16'),
('b64bfab6099ba9e24c4d1e6bf87075662a643c852d8f44be81abf95cf3db44aa0f8a7903f0a4dc90', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:49:57', '2022-02-25 10:49:57', '2023-02-25 18:49:57'),
('b7218ced9da03ec4e05a2ddd1dd5020247f00389530de63f959efc68edf49ee16aabb92160472128', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 08:10:14', '2022-11-04 08:10:14', '2023-11-04 15:10:14'),
('b745b277fdf4a08fd28737ebaeba0e2f3527d3624f5cde475618209b66a2cd8a2041a62f8ef2abe3', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 18:09:51', '2022-01-30 18:09:51', '2023-01-31 02:09:51'),
('b7728db19a9e2b34f5314891592cff81fb91230325e0f3ca935cea4a6989c6fc002c50572e386167', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 07:07:37', '2022-11-09 07:07:37', '2023-11-09 14:07:37'),
('b7af72bb2dd06513035cd9c0e9a67734365b7ffa4d7008a03f933ddfdc3f61ac52e00d40070835ee', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 08:52:20', '2022-02-16 08:52:20', '2023-02-16 16:52:20'),
('b8d0cc8a596194c86554cfe94ab86972e2986cd306913c614e5749b3deee1bde5e44bf941f62eb00', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 06:32:25', '2022-10-19 06:32:25', '2023-10-19 13:32:25'),
('b92eaee9332a5a545c658424335ac75aae4485d5ba496b718efae8fcb7d7618b440b4802d7cdbde9', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-27 17:55:07', '2022-02-27 17:55:07', '2023-02-28 01:55:07'),
('b9b14af601ac3bde16d7c013bb2a9e268c430442cde0e3786dba01095b18978c4383bea507a3671a', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:19:49', '2022-02-23 01:19:49', '2023-02-23 09:19:49'),
('bae661623e948fd2f96a94ac48136ac6d341f2483d5f763862a70b76e9c1b675a0893918a0c75512', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:54:42', '2022-01-07 20:54:42', '2023-01-08 04:54:42'),
('bb02fc16f239caeca4932cd252631976e46fc451bcde618c9da5b15b25a7fd023d5eb8def299865c', 22, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 00:52:49', '2022-01-08 00:52:49', '2023-01-08 08:52:49'),
('bcf1b60cf6b6c0310d3dbaa41d85b4ab3b362f2bf7d5b2537daf6b8848a97575491b25c913e56147', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-03-03 07:21:43', '2022-03-03 07:21:43', '2023-03-03 15:21:43'),
('bd27cc07e8c7492768bc34e1251b832d1949372b60768fcd27f431d3edf1745905a2591e2abb8a98', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 09:10:16', '2022-11-01 09:10:16', '2023-11-01 16:10:16'),
('bd53a9724f776d159ac44b86e82333f1fd400f290a1f312159d46d9e12517276175888b9786a3acf', 31, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 23:50:16', '2022-02-10 23:50:16', '2023-02-11 07:50:16'),
('bd9a3bc439c4cdb8da3393f97066ca2f317d072b199c5a04950ee381d903d286396dca2355e50223', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 11:41:05', '2022-11-01 11:41:05', '2023-11-01 18:41:05'),
('bdb3d83241e7d2817ce4e55e943b86d2fd48bcb32cf6d38357b0de1b90b3004068361a4bed97ab80', 19, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:26:06', '2022-01-07 21:26:06', '2023-01-08 05:26:06'),
('bdc79db7837802ba79f8bf29930778b09c12e1ed952c81a90741293cf84c8c246c85669d124a3a75', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 07:04:25', '2022-11-09 07:04:25', '2023-11-09 14:04:25'),
('bdfc2ebc5a1f38947573d9544278bb314789c18dd47b9daa06aa3c334bd9c5ed62ef2fa3265b4fa4', 75, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 16:22:02', '2022-10-11 16:22:02', '2023-10-11 23:22:02'),
('bee288bd715da73ce3626106a6842e853ebb46ee1ad3a0aa2a0f2c3754040d086da6324beaed7a1c', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 07:22:24', '2022-11-09 07:22:24', '2023-11-09 14:22:24'),
('bfcc535abfc64ea391dd989b2a19b8fdf098d2f10481e850a6451ecfd7ee81b0a70a91f98425a2ce', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 08:24:32', '2022-11-01 08:24:32', '2023-11-01 15:24:32'),
('c1f188092bd9c63195d0b6211b458e474add63d580a97bf1becc62e0c06cb5cdc528bc8c0fe80820', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:33:08', '2022-01-07 21:33:08', '2023-01-08 05:33:08'),
('c28b9e848791dee0dff8432d88fbacc2a2a8100bc930d21d1cfbc76a0766539d282d30c2fcb681be', 64, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-26 00:18:52', '2022-02-26 00:18:52', '2023-02-26 08:18:52'),
('c2ab66c06d5846070ea2b1710bcb6d21b27dd5efe78d2edf2eb161ad727689a59f8ed34165afeda3', 10, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 19:04:30', '2022-01-04 19:04:30', '2023-01-05 03:04:30'),
('c3d5563d316d53822494437f7aa89706affc1fc934c2638823b1101655e6c257e2ff2336d808fad1', 81, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:50:50', '2022-10-12 16:50:50', '2023-10-12 23:50:50'),
('c4256e9eb5e95187f47b1568926cf3026699ad9f293b303bce05917f448c5e77eac4767c280a81f2', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 08:36:12', '2022-11-01 08:36:12', '2023-11-01 15:36:12'),
('c4f74d08c012251d334451af3f698a502dcf691bf28916dbe8d75890d747ad9766b0084dcf1d5d44', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-06 17:18:11', '2022-11-06 17:18:11', '2023-11-07 00:18:11'),
('c4fb2cc64c50e8372a8e96dbbada34d31d07f05ea5a0a04b3bd3365b85a01780a4c4428a580d0a6a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 07:24:25', '2022-10-22 07:24:25', '2023-10-22 14:24:25'),
('c55f8f5621f8d0d7ef08d787fa088720e2acdfe62afa1b3178439b3f11f58e3dbba75e05847faedf', 26, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 18:49:39', '2022-01-30 18:49:39', '2023-01-31 02:49:39'),
('c67b6aa06424a7282a33c98a142bdb69ef240403b7f8ab0743f74abebdbec72975d230709d1989c4', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 16:21:32', '2022-10-11 16:21:32', '2023-10-11 23:21:32'),
('c682ce7bc575cf25140dd971ba4be430c730810e701bcd197e0ec27cc1e95655854e6efb41d24f7f', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 05:52:34', '2022-10-22 05:52:34', '2023-10-22 12:52:34'),
('c6f436a4aeb9a3bd91ee033e51016f2c7ae13068d33e1d1dbce1eebe2050448a6f2804e573c7fc43', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 17:45:52', '2022-01-17 17:45:52', '2023-01-18 01:45:52'),
('c708cf885409855de568a4dd4344d9c247b2860f5ef4952a3ba959f58fe2f86a21eac277f7b87269', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-26 00:13:24', '2022-01-26 00:13:24', '2023-01-26 08:13:24'),
('c70c170de9eafbbb7bacabfd03d640d465eaeabe6871cf78f533a3297d3816e9fd06fe21cdb087ba', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 07:31:53', '2022-11-04 07:31:53', '2023-11-04 14:31:53'),
('c744417e94a2dd40d26ec0a394e679c77d4e442a999830dccebaf5a98a1d518ebedaaec88ffb5ff4', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 06:09:13', '2022-11-01 06:09:13', '2023-11-01 13:09:13'),
('c75ff2befbf1a7250f752a5127e27b033ca0e9821f681e09620a36363fba4dc67678f36b8705dd61', 33, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-15 02:21:28', '2022-02-15 02:21:28', '2023-02-15 10:21:28'),
('c838b381a4bf4b68278e7748e7915390540dacddb7aa57cd43d3290cb20e94051dc2fa9dce3707c4', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 20:50:46', '2022-01-05 20:50:46', '2023-01-06 04:50:46'),
('cb22fba378b4314c2ac8397f2b48b583344b4d13fe187147c712ac5467d3a36b104943a406cc5728', 81, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 01:31:04', '2022-10-19 01:31:04', '2023-10-19 08:31:04'),
('cb7b35c208d6dee6348702d5412dad97155ace5b47ddd4e4366672dcacb034606861ce60a0864bdf', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:15:25', '2022-11-04 09:15:25', '2023-11-04 16:15:25'),
('cc67c14726b98162cf45e62a1f9d91778532bb2982baad34bebeb1a5739d8dcf7dabbaedb7627e44', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 19:38:13', '2022-01-07 19:38:13', '2023-01-08 03:38:13'),
('cc968ee4e6184b932d096201ac085269f057eee60771f900b2c698e4895ea85693fd8b8d8e6b568b', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:19:51', '2022-02-23 01:19:51', '2023-02-23 09:19:51'),
('cd39071d2721b34fa0c88b64d97c4c8fec4a3b6a2a6c53f0e106ff05a5210fb432d181d302e1fe8e', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 07:59:01', '2021-12-29 07:59:01', '2022-12-29 15:59:01'),
('cd5b45f967755ad2c861b2d1e2a37ef33dc5dab8d3215f86d61a7caf8942923f175477297b73c156', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 07:12:14', '2022-11-04 07:12:14', '2023-11-04 14:12:14'),
('ce0be1779c1d98e5658a7d42eadccabcd43b2fbaf33dd4f55cf00eb19accf9842eff4ed11b4f6ce8', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 15:54:50', '2022-10-12 15:54:50', '2023-10-12 22:54:50'),
('ce425be208df8462009976cf3f1ed630257015a3022636ee0000a1d2046bd6604d553f9d6deac033', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 18:28:37', '2022-01-04 18:28:37', '2023-01-05 02:28:37'),
('ce90b98fe7cf3529b9a70a9e82e5af135b8ac6849c9b376d41a3fc885ac32acdbb2fae220b6f1c51', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:09:54', '2022-02-23 18:09:54', '2023-02-24 02:09:54'),
('cf46fa2283aecf3979f49a020a253322d3afc3ca04b3e04487fdab21cf8f611fea381fcfa66f5d74', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:46:44', '2022-01-07 21:46:44', '2023-01-08 05:46:44'),
('cfb55a3a47711f96885eb1a11584ac2c0fa9d26cd7f68119b24162060ab36f0d20b9ebbabafab5d5', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:44:08', '2022-02-25 10:44:08', '2023-02-25 18:44:08'),
('d1c8c50bb49a15cd0e2c4ac8362ff76b565c1dc9c815c4e874febe7dc5224b537d683b83394a5e22', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 07:10:28', '2022-11-04 07:10:28', '2023-11-04 14:10:28'),
('d318602d0cafc529ba40c5ec29f8e4de5b904cd4b5426a9714ccaae61631b24f3e46f018e3af1004', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 06:54:50', '2022-02-16 06:54:50', '2023-02-16 14:54:50'),
('d414e787d5bcbb58d4b61c0b97d6212bc2ebf90811f9852315a19c215dcb778a323c95571e643c5b', 24, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 06:48:37', '2022-01-12 06:48:37', '2023-01-12 14:48:37'),
('d4220a2f5b419bc9116c0b915d3d27e91a86627d3412dea92cef3fd79a142867f08f9815552272f0', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 07:56:14', '2022-11-09 07:56:14', '2023-11-09 14:56:14'),
('d550e4dd294357d9d36c84d7c33751b56bdfc1f377b30896cbcd9f58a58f587d0b0aa8d8cbfea7e9', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 15:41:07', '2022-10-12 15:41:07', '2023-10-12 22:41:07'),
('d58074129985ca9957a846cbaa3787a3725f5c86da9b353d9bd002b93fedb53ba03df2abc53e0998', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:09:10', '2022-11-04 09:09:10', '2023-11-04 16:09:10'),
('d5beb4d141c6c0e79b3a2d1681c2df9fd87970d3a00b688888c0721c4b272b12a4e037eb3d7132d0', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 09:06:55', '2022-11-01 09:06:55', '2023-11-01 16:06:55'),
('d72e2def018c9b38eebedf16ce8560557ddf0ccf6351a2ac341d2983441fb8227af1ff73efcd1030', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 00:52:11', '2022-01-08 00:52:11', '2023-01-08 08:52:11'),
('d86080af82f3a85bad15e4da646239c5d44e32fe4b0d55f41153fc98e8daa2333170ad46000f36ca', 77, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 16:29:37', '2022-10-11 16:29:37', '2023-10-11 23:29:37'),
('d8c2b0a2054daebef60c2f92c4b4099fbe3ad8d3a95927bd10db427c1a9f588fca386192c6dd31ed', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 17:26:30', '2021-12-30 17:26:30', '2022-12-31 01:26:30'),
('d93a866a3bc8a8cf12ac57c37d2ce322a260fae54775a0e222d8d06f2b182b5b28478c4b93a23df8', 44, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 19:01:03', '2022-02-23 19:01:03', '2023-02-24 03:01:03'),
('d98a47192ea85f285f2ff105e4b07b8163bc600775f523b3d18644ec06b1d1fd674a9d93aa4207e5', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 10:07:14', '2022-11-01 10:07:14', '2023-11-01 17:07:14'),
('d9d1a7ad6452a0a0b4723c6472e21229bc186cda1f24151ef8e7bd0fa429d199d09a9bf279dbcec4', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:01:10', '2022-11-04 09:01:10', '2023-11-04 16:01:10'),
('d9e4187836a60952bed16156d25b3b42495e7d94edc0f7229d5c7c4e2907dae0e27c18eb5b89c1bb', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 00:37:36', '2021-12-31 00:37:36', '2022-12-31 08:37:36'),
('da3d221b1ce8cb6daf8941e45bd10b8a36d1c782b3f475b65c99ba03b51ce5d73f6b9f4d4e87b6f5', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 17:37:13', '2022-02-16 17:37:13', '2023-02-17 01:37:13'),
('da52ce525cbe05382b4051b402c03aaf5da9350b1c4b07b5e7e56e652979bfefe1091d7281122c47', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:20:54', '2022-02-25 10:20:54', '2023-02-25 18:20:54'),
('db34e238fc21be532be79fdbe7d0dc32675830a139fcaf62bfc66eddacc51be8b30ba2f1e8631c7e', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 07:46:04', '2022-10-22 07:46:04', '2023-10-22 14:46:04'),
('dc3b80ea493a76b23a44e2025ce97ee941c6c58e05dde1e32235a11a0773933b4818ea640c9d8b77', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 09:08:39', '2022-11-09 09:08:39', '2023-11-09 16:08:39'),
('dcb12b323fb5551d9b95023cad8b338067a46a18b0b37d54f5ed3da814cfa67fac56d4414a3fbe35', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 07:04:00', '2022-11-09 07:04:00', '2023-11-09 14:04:00'),
('dccb3e7a5d1fab409cc47fb538e38d1712f536b4cf6cf99d19a783cd574c3f7a47bae6de9c26e199', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-22 09:41:11', '2022-02-22 09:41:11', '2023-02-22 17:41:11'),
('dd2fc67e35f5a4774ed7dd6c774709faa2385cf0dd7b7ad76756fac46cd0297486c08ff5b606b833', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:43:30', '2022-02-25 10:43:30', '2023-02-25 18:43:30'),
('dd35dd67e2eae672eff1169370ed64ab663c47906c7f8f5dd2734dc18590510ecf012ae6f56a71e7', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-16 16:58:51', '2022-01-16 16:58:51', '2023-01-17 00:58:51'),
('dd74c84225ad42c6cf2312cab1b64c257cd8f498ba71485198bb4a0d4618799723789eea483839b6', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 18:43:08', '2022-01-04 18:43:08', '2023-01-05 02:43:08'),
('de674362ea56c764f20b7950d25fcbff92c20753f7a0d2f30171fbb94cb1bf5bdff15470b6b08c0d', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 10:43:35', '2022-11-01 10:43:35', '2023-11-01 17:43:35'),
('dedf7ee842c332ebeb2bd502d0d41960d86b23dc0d2ef1a3fb4157edc862691855d5837e72196a2d', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-19 06:31:23', '2022-10-19 06:31:23', '2023-10-19 13:31:23'),
('df3ef4569672d48409c1f5d9cc934ebd11decfb659cc75cb34ec6a2b3940657d400d4898568c79e5', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 23:47:51', '2022-01-11 23:47:51', '2023-01-12 07:47:51'),
('df4da297fdc36704b7c8309698bd9f7cfe4b9fd5d19c6731e5a574c4c6fd55f02c06ef35ecb0d672', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-27 08:38:59', '2022-10-27 08:38:59', '2023-10-27 15:38:59'),
('df949b02768ea3f0f4b8ce2277c21abb7c0c16639b94cca031920e9a2e21ac49c5b7a05840cac1e3', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-27 08:40:18', '2022-10-27 08:40:18', '2023-10-27 15:40:18'),
('dfea9edef3f120fda94744d456436a82617eab316e0e9e79e7f7b130fbb9538b97d352839ee330e6', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 00:21:17', '2022-02-07 00:21:17', '2023-02-07 08:21:17'),
('e01f3793d3ab164c47593362307c076c69416167e78aeb4b50f2f4d1a7e52758ccfaf04db83c0231', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 17:39:34', '2022-01-03 17:39:34', '2023-01-04 01:39:34'),
('e08c93cf5811af3aaa0478df44c9ab5a36e5b5f7b6bd459b6b43a163b1327e12981cb2dceb179468', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:05:42', '2022-11-04 09:05:42', '2023-11-04 16:05:42'),
('e0a57e343582a3b3b7daa9deb3b97127fbdd0b7dc28fa60333abedaddfe8a041c3742eee8a0ce1cd', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 05:57:33', '2022-11-09 05:57:33', '2023-11-09 12:57:33'),
('e12f4b7ea3e843dd00491e7ba0c32136161f47657a77d225346c68745e817bb0d52cdadd0be1961c', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 09:26:33', '2022-11-01 09:26:33', '2023-11-01 16:26:33'),
('e186b509f347a545cee5348cf6121dbdb82778f70d66f285edeef7bebb8265bb28952b7a4670a96f', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-11 20:22:01', '2022-11-11 20:22:01', '2023-11-12 03:22:01'),
('e276eda603d749901c1bf9effc239ef32ffb4a1f22448d8e05f1af7253dd015cba09a2e87b1f6724', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-25 23:03:32', '2022-01-25 23:03:32', '2023-01-26 07:03:32'),
('e2e3f5cb015c152164440e144edab446f41a986424b5fff8655b829a98cc7d2490c5020fbca487a7', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 21:19:32', '2022-01-06 21:19:32', '2023-01-07 05:19:32'),
('e4947b91bf5ff37cefcc8a8b969382b3905e4577e5b481de102b21b35ac06bbab47dfb7034d08cec', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-06 15:23:10', '2022-11-06 15:23:10', '2023-11-06 22:23:10'),
('e523ef58c5e10d7c2cda534f7330e13f62ea3c15b3216b3b43141f5da9bd58ecba58d532689064cb', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:30:09', '2022-11-04 09:30:09', '2023-11-04 16:30:09'),
('e5b7dd92daf45fcc9ab693c80ed1a0291c9dd584e24c851395428e3c4d10174ad184e0d8651a3a14', 65, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-26 03:12:08', '2022-02-26 03:12:08', '2023-02-26 11:12:08'),
('e638f5dfc43e34816f416d28bee92788d452744c30df7e6c91d262e8788a236b6e67bf8e1822902c', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:50:27', '2021-12-29 17:50:27', '2022-12-30 02:50:27'),
('e6e0c0972a3ab0b84d1818ae7d42d228ac35efa878be5d9958720276cd8f05aee9c0346a0ed65d3e', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:19:01', '2022-11-04 09:19:01', '2023-11-04 16:19:01'),
('e736771b1c04953e92df9620a0f6ce23a67e83ab379dd02357d0f9f11727593118303c08e864c660', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 08:14:23', '2022-11-01 08:14:23', '2023-11-01 15:14:23'),
('e811c02ffff9f5ede99508debcaa794de1c8b138e03a6b745da55c204c8e63fc4c0d99219624948b', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 06:06:42', '2022-10-22 06:06:42', '2023-10-22 13:06:42'),
('e89f9b669bfc201dc0c15b42129bb1c3c96b93b86ac6ed336fc6427cca8fe4401c884f0f602a698c', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 07:59:18', '2022-11-01 07:59:18', '2023-11-01 14:59:18'),
('e90280a97ed64414b2225c945e353130396dd4711e29c99c53d1226100e7c8b261b7c7bf0818a697', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 06:37:27', '2022-01-12 06:37:27', '2023-01-12 14:37:27'),
('ea1de93ac3b213ae97260e8f868e6894bec361d0f29cd1146f8b295a7735fefb593514e4d5067916', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 23:17:56', '2022-11-04 23:17:56', '2023-11-05 06:17:56'),
('eb0d2060910568bcfa09f225993f27925061e06650035553eafaa34642c1af22a317c8bc27282d15', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:11:33', '2022-02-23 18:11:33', '2023-02-24 02:11:33'),
('ebbe5cde3a3ea3bf8e400041133cef3939014a6968e80e52512d0b7ab4f7deff6cb375cd8a37e23c', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 07:35:03', '2022-11-04 07:35:03', '2023-11-04 14:35:03'),
('ebf3ce7bb2748675221c05d959fe31c1d0677e2936f91ac8a10a643edc539e41e45e3cde66eca4b1', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 02:09:27', '2021-12-29 02:09:27', '2022-12-29 10:09:27'),
('ec712489d0ed23268c4d342fe73026f1ee3b9d6da0eb8f1c3a5f7f09e9913b0de580c009376037e7', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 16:45:49', '2022-10-12 16:45:49', '2023-10-12 23:45:49'),
('eda650e88d6136c070a12572ffa8cdd7bd72109140f6db491eca58a3a73b10249fece5511c730ab0', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 08:26:38', '2022-11-01 08:26:38', '2023-11-01 15:26:38'),
('ee3c7ee03a70cd84b3b26d9c2ce949f4d625a774f33a5f67d03af324415b789d1d74bc596073f0b6', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 08:59:14', '2021-12-31 08:59:14', '2022-12-31 16:59:14'),
('ef02a047cc140cc3c3b4423685092d9e3b38237d5829804b00b8d6bd3ab7d19529c077d7655e4725', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 18:22:54', '2022-01-04 18:22:54', '2023-01-05 02:22:54'),
('ef34c304af8363ca32a9fd28f2c7dff46d34b49055610faaf2d5834481a1fe091da453b22cfaef98', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 01:32:39', '2022-01-06 01:32:39', '2023-01-06 09:32:39'),
('eff31b54b44c536e146f7203566315af44a3972a1168453980c66aa114aee96639283de7e8727b73', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 22:11:33', '2022-01-04 22:11:33', '2023-01-05 06:11:33'),
('f0ed9dd733a7cd04f5f9cc02618c0b89009cfe1c03d925568d61536e63f5990281b3269892c94e7d', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-09 07:06:59', '2022-11-09 07:06:59', '2023-11-09 14:06:59'),
('f184ed47038f9cd8a4dc671e2f1b62ab96f71911a84dbcf40da7f1bc6e043ac03977fc1902fbc3b9', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-10 07:35:17', '2022-11-10 07:35:17', '2023-11-10 14:35:17'),
('f1ed5d1647c88e58939c3c0dcd549137cb6b452b669af17fc6f868d92cab4834078d2f832eab318b', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-09 16:35:17', '2022-01-09 16:35:17', '2023-01-10 00:35:17'),
('f301e574fef178cfee35a866ac3c051fdf9d2a55b4eb53a1e706c731d06475ed9162389877519904', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-22 05:35:22', '2022-10-22 05:35:22', '2023-10-22 12:35:22'),
('f399874d980d4b95969b10697ddfbf3f93086be6101ebc3cafe16ff576cb09873420b7251afacd28', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 06:07:53', '2022-11-04 06:07:53', '2023-11-04 13:07:53'),
('f4ba92e91ca100b7608e40100e5c7ba54711fd2e65a81ec597cb0206b47e2c5e28a208587e5595ea', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 07:43:23', '2022-11-04 07:43:23', '2023-11-04 14:43:23'),
('f562c87e65d03a3e0d216ae98a8e4487580c797d0bc21020dbdc5dd080384107fdf2ecc90260a69d', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-11 20:21:49', '2022-11-11 20:21:49', '2023-11-12 03:21:49'),
('f5d70416e7bfdfcce4268a2f095bf5955c023ad393f1057ef4beddedc6e8e586ade7bb8a3608143f', 48, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 04:53:32', '2022-02-25 04:53:32', '2023-02-25 12:53:32'),
('f75b7edab2fcf3b86eeb8de29dfa0bfc6c22395844227d122c6e6e8838dbd60fb315b5d94babd5cf', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 00:50:15', '2022-01-06 00:50:15', '2023-01-06 08:50:15'),
('f7aedd5e5dbe94ba4ec6dc0c121bf71a76f05a9d479ecce5dac035b277aad3fdc4c70115bb7bd9ff', 38, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-22 09:52:10', '2022-02-22 09:52:10', '2023-02-22 17:52:10'),
('f7b154c693649d097eee53f41bd65039444f1e371cd55b6df86e9eddc9135689d99458a97e4e4951', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-01 11:10:41', '2022-11-01 11:10:41', '2023-11-01 18:10:41'),
('f8b8fa5bb357b32041e4c00b45ecd1216855cec2292c43535127cfa1ea0a64773bf9e386eae377f7', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 02:18:09', '2022-02-23 02:18:09', '2023-02-23 10:18:09'),
('f99f43a92ba0a17b9b343e2a393915fb97b94766322c3059a2786fc7a4b22e6f6d11fb714ba17d88', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-30 04:01:43', '2022-10-30 04:01:43', '2023-10-30 11:01:43'),
('f9bfe2c67d568114600a3516033ae482cfb01d62602058d23dea42ce954fe5de910fee6d878beb6a', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-10 12:34:50', '2022-11-10 12:34:50', '2023-11-10 19:34:50'),
('fb18e4fddb7fea1f57744e171f56dd5eebf5c3778a41a31a683ed714a53670c5a9e0d12dfe16e0c8', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 07:21:36', '2022-11-04 07:21:36', '2023-11-04 14:21:36'),
('fb3f0ac4f0a2dab81618adcb503e68bbc7cd4be99fd17bcd64f59a865a8af8a6242102baa0052c03', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-15 02:22:45', '2022-02-15 02:22:45', '2023-02-15 10:22:45'),
('fb7f4f1efe5667f429b508e27f156e62fe0c5ff51563baca1eff03db3b810b3ac15a6847bd077b3d', 39, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-22 23:34:33', '2022-02-22 23:34:33', '2023-02-23 07:34:33'),
('fccc94500671627f2ad449c555674281d11f9a4345e4039de5cb461f83c7142797214bd7150ef693', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 09:15:50', '2022-11-04 09:15:50', '2023-11-04 16:15:50'),
('fd752f2375e1dcefb6c801037542d3dadb4a1903833ae1435526de86142fe6bf85518d9db0d71f83', 83, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-04 05:58:30', '2022-11-04 05:58:30', '2023-11-04 12:58:30'),
('fd83327cb9951f102b0fb260f03fc40871f3d962dc922510c56e6cb2981f1dfd12a7d5927d25b823', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-11-11 20:02:53', '2022-11-11 20:02:53', '2023-11-12 03:02:53'),
('fd989d4d22a1adfc0201687dd75042e277ec9d3cd1c233ce679c44e958bcc7ed6f2a6acff565eb39', 54, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:12:00', '2022-02-25 10:12:00', '2023-02-25 18:12:00'),
('fe349b7e8301049bd5b90008eb153da8c098b12e964b9e050aadd1ee3db26808826e512332f7db4b', 41, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:09:05', '2022-02-23 01:09:05', '2023-02-23 09:09:05'),
('febf5b1028890e37dd91560409d40f9710e480759853ed1d22c4025666a8aa9b9c63dfe9a8503dea', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 06:45:42', '2022-01-12 06:45:42', '2023-01-12 14:45:42'),
('feccdb9a7438e8d4cb757dde5fe9376e1a5b90aaf99954ecf3825c438dbeb1600625a2526f9fd55b', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 09:27:52', '2022-01-06 09:27:52', '2023-01-06 17:27:52'),
('ffc8299683101d89735a8a4bdeaa878db1d895487c00cbfe9451ae728b5e4b9e44535683cd9ba226', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 19:23:26', '2022-01-03 19:23:26', '2023-01-04 03:23:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ahmed', 'YTU2JKogY8Mo8n14mxL5yLaO5Tc7tjKCWdVtrXDN', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 08:14:11', '2021-12-28 08:14:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-12-28 08:14:11', '2021-12-28 08:14:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_amount` decimal(8,2) NOT NULL,
  `payment_status` varchar(191) DEFAULT 'pending',
  `payment_method` varchar(30) DEFAULT NULL,
  `transaction_reference` varchar(30) DEFAULT NULL,
  `order_status` varchar(191) NOT NULL DEFAULT 'pending',
  `confirmed` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `scheduled` tinyint(1) NOT NULL DEFAULT 0,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `failed` timestamp NULL DEFAULT NULL,
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `order_note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivery_charge` decimal(6,2) DEFAULT NULL,
  `delivery_address` text NOT NULL,
  `otp` varchar(191) NOT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_amount`, `payment_status`, `payment_method`, `transaction_reference`, `order_status`, `confirmed`, `accepted`, `scheduled`, `processing`, `handover`, `failed`, `scheduled_at`, `delivery_address_id`, `order_note`, `created_at`, `updated_at`, `delivery_charge`, `delivery_address`, `otp`, `pending`, `picked_up`, `delivered`, `canceled`) VALUES
(100001, 22, '36.00', NULL, '', '', 'pending', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Note about food', '2022-01-08 06:35:12', '2022-01-08 06:35:12', NULL, '{\"contact_person_name\":\"as\",\"contact_person_number\":\"1\",\"address\":\"test\",\"longitude\":\"\",\"latitude\":\"\"}', '4976', '2022-01-08 06:35:12', NULL, NULL, NULL),
(100002, 70, '6479.00', NULL, '', '', 'pending', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Note about food', '2022-01-08 06:43:27', '2022-01-08 06:43:27', NULL, '{\"contact_person_name\":\"as\",\"contact_person_number\":\"1\",\"address\":\"test\",\"longitude\":\"\",\"latitude\":\"\"}', '2115', '2022-01-08 06:43:27', NULL, NULL, NULL),
(100003, 27, '56.00', 'pending', 'paypal', 'PAYID-MIQN7AQ22W926030N577731P', 'success', NULL, NULL, 0, NULL, NULL, '2022-03-03 07:32:18', NULL, NULL, 'Note about food', '2022-03-03 07:21:50', '2022-03-03 07:32:18', NULL, '{\"contact_person_name\":\"dylan\",\"contact_person_number\":\"123456\",\"address\":\"309 SW Broadway, Portland, OR 97205, USA\",\"longitude\":\"-122.67854869365692\",\"latitude\":\"45.521708425968995\"}', '1839', '2022-03-03 07:21:50', NULL, NULL, NULL),
(100004, 70, '24.00', 'pending', NULL, NULL, 'pending', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Not about the food', '2022-11-12 00:00:24', '2022-11-12 00:00:24', NULL, '{\"contact_person_name\":\"TQNguyen\",\"contact_person_number\":\"123123\",\"address\":\"Elk Fountain, 1120 SW 5th Ave, Portland, OR 97204, USA\",\"longitude\":\"-122.677433\",\"latitude\":\"45.51563\"}', '9968', '2022-11-12 00:00:24', NULL, NULL, NULL),
(100005, 70, '49.00', 'pending', NULL, NULL, 'pending', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Not about the food', '2022-11-12 00:06:59', '2022-11-12 00:06:59', NULL, '{\"contact_person_name\":\"TQNguyen\",\"contact_person_number\":\"123123\",\"address\":\"Unknow Location Found\",\"longitude\":\"-122.677433\",\"latitude\":\"45.51563\"}', '9598', '2022-11-12 00:06:59', NULL, NULL, NULL),
(100006, 70, '49.00', 'pending', NULL, NULL, 'pending', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Not about the food', '2022-11-12 00:09:22', '2022-11-12 00:09:22', NULL, '{\"contact_person_name\":\"TQNguyen\",\"contact_person_number\":\"123123\",\"address\":\"Unknow Location Found\",\"longitude\":\"-122.677433\",\"latitude\":\"45.51563\"}', '4961', '2022-11-12 00:09:22', NULL, NULL, NULL),
(100007, 70, '49.00', 'pending', NULL, NULL, 'pending', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Not about the food', '2022-11-12 00:09:44', '2022-11-12 00:09:44', NULL, '{\"contact_person_name\":\"TQNguyen\",\"contact_person_number\":\"123123\",\"address\":\"Unknow Location Found\",\"longitude\":\"-122.677433\",\"latitude\":\"45.51563\"}', '4871', '2022-11-12 00:09:44', NULL, NULL, NULL),
(100008, 70, '49.00', 'pending', NULL, NULL, 'pending', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Not about the food', '2022-11-12 00:11:29', '2022-11-12 00:11:29', NULL, '{\"contact_person_name\":\"TQNguyen\",\"contact_person_number\":\"123123\",\"address\":\"Unknow Location Found\",\"longitude\":\"-122.677433\",\"latitude\":\"45.51563\"}', '8449', '2022-11-12 00:11:29', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `food_id` bigint(20) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `food_details` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `tax_amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `test` int(11) NOT NULL DEFAULT 7
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `food_id`, `price`, `food_details`, `quantity`, `tax_amount`, `created_at`, `updated_at`, `test`) VALUES
(261, 100004, 9, '8.00', '{\"id\":9,\"name\":\"Biriani\",\"description\":\"<p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander\\/cilantro, then par boiled lightly spiced rice.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow rice, as well as ghee (or melted butter) for buttery richness.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The pot is then covered and cooked over a low heat for about 25 minutes during which time the rice absorbs the aromas and flavours of the curry underneath, whilst still being beautifully fluffy.<\\/p><p><br\\/><\\/p>\",\"price\":8,\"stars\":4,\"people\":3,\"selected_people\":3,\"img\":\"images\\/0f61cb5dd19d38a11e5a9133333eca07.jpeg\",\"location\":\"BD\",\"created_at\":\"2021-12-27 05:27:38\",\"updated_at\":\"2022-01-01 07:57:16\",\"type_id\":3}', 3, '10.00', '2022-11-12 00:00:24', '2022-11-12 00:00:24', 7),
(262, 100005, 9, '8.00', '{\"id\":9,\"name\":\"Biriani\",\"description\":\"<p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander\\/cilantro, then par boiled lightly spiced rice.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow rice, as well as ghee (or melted butter) for buttery richness.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The pot is then covered and cooked over a low heat for about 25 minutes during which time the rice absorbs the aromas and flavours of the curry underneath, whilst still being beautifully fluffy.<\\/p><p><br\\/><\\/p>\",\"price\":8,\"stars\":4,\"people\":3,\"selected_people\":3,\"img\":\"images\\/0f61cb5dd19d38a11e5a9133333eca07.jpeg\",\"location\":\"BD\",\"created_at\":\"2021-12-27 05:27:38\",\"updated_at\":\"2022-01-01 07:57:16\",\"type_id\":3}', 3, '10.00', '2022-11-12 00:06:59', '2022-11-12 00:06:59', 7),
(263, 100005, 8, '5.00', '{\"id\":8,\"name\":\"Dessert\",\"description\":\"<p>Amazing food to eat with.<\\/p>\",\"price\":5,\"stars\":4,\"people\":3,\"selected_people\":2,\"img\":\"images\\/34b0eaad01e8a95a02df1d934517591c.png\",\"location\":\"china\",\"created_at\":\"2021-12-26 00:36:29\",\"updated_at\":\"2022-01-01 07:57:01\",\"type_id\":3}', 1, '10.00', '2022-11-12 00:06:59', '2022-11-12 00:06:59', 7),
(264, 100005, 5, '10.00', '{\"id\":5,\"name\":\"Creamed Yuca (Cassava)\",\"description\":\"<p><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">Commonly used in soups, eaten boiled&nbsp;<\\/span><\\/p>\",\"price\":10,\"stars\":5,\"people\":5,\"selected_people\":4,\"img\":\"images\\/acaa4cdee4b8aa7bf33f2140ce36860c.jpg\",\"location\":\"China\",\"created_at\":\"2021-12-08 11:29:53\",\"updated_at\":\"2022-01-01 07:55:44\",\"type_id\":3}', 2, '10.00', '2022-11-12 00:06:59', '2022-11-12 00:06:59', 7),
(265, 100006, 9, '8.00', '{\"id\":9,\"name\":\"Biriani\",\"description\":\"<p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander\\/cilantro, then par boiled lightly spiced rice.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow rice, as well as ghee (or melted butter) for buttery richness.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The pot is then covered and cooked over a low heat for about 25 minutes during which time the rice absorbs the aromas and flavours of the curry underneath, whilst still being beautifully fluffy.<\\/p><p><br\\/><\\/p>\",\"price\":8,\"stars\":4,\"people\":3,\"selected_people\":3,\"img\":\"images\\/0f61cb5dd19d38a11e5a9133333eca07.jpeg\",\"location\":\"BD\",\"created_at\":\"2021-12-27 05:27:38\",\"updated_at\":\"2022-01-01 07:57:16\",\"type_id\":3}', 3, '10.00', '2022-11-12 00:09:22', '2022-11-12 00:09:22', 7),
(266, 100006, 8, '5.00', '{\"id\":8,\"name\":\"Dessert\",\"description\":\"<p>Amazing food to eat with.<\\/p>\",\"price\":5,\"stars\":4,\"people\":3,\"selected_people\":2,\"img\":\"images\\/34b0eaad01e8a95a02df1d934517591c.png\",\"location\":\"china\",\"created_at\":\"2021-12-26 00:36:29\",\"updated_at\":\"2022-01-01 07:57:01\",\"type_id\":3}', 1, '10.00', '2022-11-12 00:09:22', '2022-11-12 00:09:22', 7),
(267, 100006, 5, '10.00', '{\"id\":5,\"name\":\"Creamed Yuca (Cassava)\",\"description\":\"<p><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">Commonly used in soups, eaten boiled&nbsp;<\\/span><\\/p>\",\"price\":10,\"stars\":5,\"people\":5,\"selected_people\":4,\"img\":\"images\\/acaa4cdee4b8aa7bf33f2140ce36860c.jpg\",\"location\":\"China\",\"created_at\":\"2021-12-08 11:29:53\",\"updated_at\":\"2022-01-01 07:55:44\",\"type_id\":3}', 2, '10.00', '2022-11-12 00:09:22', '2022-11-12 00:09:22', 7),
(268, 100007, 9, '8.00', '{\"id\":9,\"name\":\"Biriani\",\"description\":\"<p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander\\/cilantro, then par boiled lightly spiced rice.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow rice, as well as ghee (or melted butter) for buttery richness.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The pot is then covered and cooked over a low heat for about 25 minutes during which time the rice absorbs the aromas and flavours of the curry underneath, whilst still being beautifully fluffy.<\\/p><p><br\\/><\\/p>\",\"price\":8,\"stars\":4,\"people\":3,\"selected_people\":3,\"img\":\"images\\/0f61cb5dd19d38a11e5a9133333eca07.jpeg\",\"location\":\"BD\",\"created_at\":\"2021-12-27 05:27:38\",\"updated_at\":\"2022-01-01 07:57:16\",\"type_id\":3}', 3, '10.00', '2022-11-12 00:09:44', '2022-11-12 00:09:44', 7),
(269, 100007, 8, '5.00', '{\"id\":8,\"name\":\"Dessert\",\"description\":\"<p>Amazing food to eat with.<\\/p>\",\"price\":5,\"stars\":4,\"people\":3,\"selected_people\":2,\"img\":\"images\\/34b0eaad01e8a95a02df1d934517591c.png\",\"location\":\"china\",\"created_at\":\"2021-12-26 00:36:29\",\"updated_at\":\"2022-01-01 07:57:01\",\"type_id\":3}', 1, '10.00', '2022-11-12 00:09:44', '2022-11-12 00:09:44', 7),
(270, 100007, 5, '10.00', '{\"id\":5,\"name\":\"Creamed Yuca (Cassava)\",\"description\":\"<p><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">Commonly used in soups, eaten boiled&nbsp;<\\/span><\\/p>\",\"price\":10,\"stars\":5,\"people\":5,\"selected_people\":4,\"img\":\"images\\/acaa4cdee4b8aa7bf33f2140ce36860c.jpg\",\"location\":\"China\",\"created_at\":\"2021-12-08 11:29:53\",\"updated_at\":\"2022-01-01 07:55:44\",\"type_id\":3}', 2, '10.00', '2022-11-12 00:09:44', '2022-11-12 00:09:44', 7),
(271, 100008, 9, '8.00', '{\"id\":9,\"name\":\"Biriani\",\"description\":\"<p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander\\/cilantro, then par boiled lightly spiced rice.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow rice, as well as ghee (or melted butter) for buttery richness.<\\/p><p style=\\\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\\\">The pot is then covered and cooked over a low heat for about 25 minutes during which time the rice absorbs the aromas and flavours of the curry underneath, whilst still being beautifully fluffy.<\\/p><p><br\\/><\\/p>\",\"price\":8,\"stars\":4,\"people\":3,\"selected_people\":3,\"img\":\"images\\/0f61cb5dd19d38a11e5a9133333eca07.jpeg\",\"location\":\"BD\",\"created_at\":\"2021-12-27 05:27:38\",\"updated_at\":\"2022-01-01 07:57:16\",\"type_id\":3}', 3, '10.00', '2022-11-12 00:11:29', '2022-11-12 00:11:29', 7),
(272, 100008, 8, '5.00', '{\"id\":8,\"name\":\"Dessert\",\"description\":\"<p>Amazing food to eat with.<\\/p>\",\"price\":5,\"stars\":4,\"people\":3,\"selected_people\":2,\"img\":\"images\\/34b0eaad01e8a95a02df1d934517591c.png\",\"location\":\"china\",\"created_at\":\"2021-12-26 00:36:29\",\"updated_at\":\"2022-01-01 07:57:01\",\"type_id\":3}', 1, '10.00', '2022-11-12 00:11:29', '2022-11-12 00:11:29', 7),
(273, 100008, 5, '10.00', '{\"id\":5,\"name\":\"Creamed Yuca (Cassava)\",\"description\":\"<p><span style=\\\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\\\">Commonly used in soups, eaten boiled&nbsp;<\\/span><\\/p>\",\"price\":10,\"stars\":5,\"people\":5,\"selected_people\":4,\"img\":\"images\\/acaa4cdee4b8aa7bf33f2140ce36860c.jpg\",\"location\":\"China\",\"created_at\":\"2021-12-08 11:29:53\",\"updated_at\":\"2022-01-01 07:55:44\",\"type_id\":3}', 2, '10.00', '2022-11-12 00:11:29', '2022-11-12 00:11:29', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `places`
--

CREATE TABLE `places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `f_name`, `phone`, `email`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `order_count`) VALUES
(27, 'dylan', '123456', 'a@a.com', 1, NULL, '$2y$10$4HNDC4q5C2csQD0DzFwkheWH9upu/IX5UK8X2xNP2flgqv/hBRfrS', NULL, '2022-01-30 18:55:57', '2022-01-30 18:55:57', 0),
(28, '123456', '1234567', 'b@b.com', 1, NULL, '$2y$10$2jpKDnyVTKpYuxER5Y35GODeBV/h35KQOZPlwcSAvBF1hKdrTczn.', NULL, '2022-01-30 19:05:37', '2022-01-30 19:05:37', 0),
(29, 'ahmed', '1', 'c@c.com', 1, NULL, '$2y$10$hKwCLxEu05m28wZxq2xBc.mGqe5pjnOx/Bk9RL5v588yYcprDiD/.', NULL, '2022-01-31 00:35:28', '2022-01-31 00:35:28', 0),
(30, 'Tester', '123123123', 'test@dmail.com', 1, NULL, '$2y$10$Z.C4UusLSn9FFkrof7YYLeMOA8PlUxg.9GXmBZNsGU8Y4fWdFk.xO', NULL, '2022-02-08 03:49:41', '2022-02-08 03:49:41', 0),
(31, 'Ahmed', '13761849016', 'mjdazaa87@yahoo.com', 1, NULL, '$2y$10$qVWfv9G0BycS3TWuVt.8LexQi2VUR8tu1f3sr8aDA9ozHS23oDrMW', NULL, '2022-02-10 23:50:16', '2022-02-10 23:50:16', 0),
(32, 'telllll', '12', 'cc@cc.co', 1, NULL, '$2y$10$IMCOIel3Ta0xY1tyOHDzeOLjHE1FGQDHB5e1NR/adlAoRfylYONy6', NULL, '2022-02-12 22:39:27', '2022-02-12 22:39:27', 0),
(33, 'Ahmed nowww', '2', 'c@cc.com', 1, NULL, '$2y$10$7UIUIgVJmL1D0R7qwPm4BOBjmzFGjYtG7IFEmz18M95fbRdw4d9NC', NULL, '2022-02-15 02:21:28', '2022-02-15 02:21:28', 0),
(34, 'Akhmet', '87078546060', 'ahmet_07@mail.ru', 1, NULL, '$2y$10$n2Fx9nnR.VJNT8WkaDKUEu8PfFmXtV/6OTWVXfVYfD0t1d1IjKNlW', NULL, '2022-02-16 06:50:04', '2022-02-16 06:50:04', 0),
(35, 'ff', '5', 'dd@dd.com', 1, NULL, '$2y$10$ttYX2D217QzCmGmfA9Q00uryG7xCwnG3AGl0uoq3I2uUko8tiZ6fm', NULL, '2022-02-17 08:08:33', '2022-02-17 08:08:33', 0),
(36, 'huy', '0977233398', 'quanghuy@gmail.com', 1, NULL, '$2y$10$K6t3N1t00vNUxU.lx6ONo..1Q7/MR7q1VpYLKVsFZrQLQVwIqWbbu', NULL, '2022-02-22 09:38:20', '2022-02-22 09:38:20', 0),
(37, 'Quang Huy', '0937268554', 'huytq@gmail.com', 1, NULL, '$2y$10$wVcLF4h7lzYJ9J3O3ufp/.UWt9fhOWX04Unjjxwn3lCejq.YV2knu', NULL, '2022-02-22 09:41:11', '2022-02-22 09:41:11', 0),
(38, 'sds', '098765432', 'huytq1@gmail.com', 1, NULL, '$2y$10$ndLt8CNVFa8SClIIE7a15uFVvk.P41MRFf5znPwuBj8bOWImjml.u', NULL, '2022-02-22 09:52:10', '2022-02-22 09:52:10', 0),
(39, 'tuanson', '0906340620', 'sonbt@gmail.com', 1, NULL, '$2y$10$95ENY1VvUMum9A7ZDTX4DOhUa5G1e2M3Y9JoUoB0rOhApzk1dnOKa', NULL, '2022-02-22 23:34:33', '2022-02-22 23:34:33', 0),
(40, 'tuanson', '0906240410', 'sonbt@hqplay.vn', 1, NULL, '$2y$10$OTTbiyI5TQl8pQNS1SEd9es/nusgQ.QwOa/Hun/YxE/vLZmyo9Mza', NULL, '2022-02-23 00:22:58', '2022-02-23 00:22:58', 0),
(41, 'tuanson', '0906240411', 'son@hqplay.vn', 1, NULL, '$2y$10$2d6omv/1OdwXvBbuzNePweOMNI1LGH9Vl/l7CsaW2Uzh2eXoPdBPq', NULL, '2022-02-23 01:09:05', '2022-02-23 01:09:05', 0),
(42, '12', '0987654321', 'test@gmail.com', 1, NULL, '$2y$10$nX01lQGeByW25UELTIFuJeGx66JTqy09mEqccZcjMWNdnN4liDFIO', NULL, '2022-02-23 18:47:06', '2022-02-23 18:47:06', 0),
(43, '12', '1234567890', 'test1@gmail.com', 1, NULL, '$2y$10$iOIAvcwWloVNWI79rwk7FeK9yyI3VbLMYGPxXOZYKDalLdiy50346', NULL, '2022-02-23 18:50:49', '2022-02-23 18:50:49', 0),
(44, 'd', 'd', 't@gmail.com', 1, NULL, '$2y$10$LLppI4ej1gaYpawXkg5cUeLSv9nWXlg6w/v6tGickmZFyqD9As83q', NULL, '2022-02-23 19:01:03', '2022-02-23 19:01:03', 0),
(45, 'Ahmed', '12345678', 'info@dbestech.com', 1, NULL, '$2y$10$d4BqmNrQG68SKUNYPVfboOcRMEzufSZBH2b43kUA554t80ZpazJdu', NULL, '2022-02-25 02:32:14', '2022-02-25 02:32:14', 0),
(46, 'Ahmed', '123456789', 'info1@dbestech.com', 1, NULL, '$2y$10$7HPVbMoXn7OTkcEHrkqa3ug7gJaYZBvftSM3e7WJ0fL/4ZIqPWARW', NULL, '2022-02-25 02:43:20', '2022-02-25 02:43:20', 0),
(47, 'sas', '12455566', 's@a.com', 1, NULL, '$2y$10$h.cWcLl/SFvLad1MAL.SUOLwoM4BiSir2iKg5/L3MHqCeQZKuQca6', NULL, '2022-02-25 04:50:15', '2022-02-25 04:50:15', 0),
(48, 'txdbestech', '213214', 'aa@a.com', 1, NULL, '$2y$10$UXeBYn1IZX9fN95WzL1Z7OxjsQAqwWUhu0BvzOJiqxZOrFha/HGm2', NULL, '2022-02-25 04:53:32', '2022-02-25 04:53:32', 0),
(49, 'giddiness', '12444444', 'aaa@a.com', 1, NULL, '$2y$10$Bb7P6t7d5vUAxyoUmSKDEe7IrqVWB3v8O38Iyrj9yfd.D8f6Elclq', NULL, '2022-02-25 08:23:34', '2022-02-25 08:23:34', 0),
(50, 'ricky', '123432', 'b@c.com', 1, NULL, '$2y$10$A5ZcZedLRRZETHY7CzHSA.f0RMGunr5iBe236/8m.lCd3fLuYNKEu', NULL, '2022-02-25 08:49:07', '2022-02-25 08:49:07', 0),
(51, 'kumarsanga', '882829', 'sl@cricket.com', 1, NULL, '$2y$10$0FPtjxwhP4cJxR.2s8a2XOK/VSYC0Vj8Aupe8peWWq33860jsPo4W', NULL, '2022-02-25 08:52:01', '2022-02-25 08:52:01', 0),
(69, 'Rumtqn', '01203103', 'rumtqn@gmail.com', 1, NULL, '$2y$10$7p7o7Y983X3c7D3fBfplYuFVm9IVszYxz/JTBCQjA.iYoH2MpS2Fu', NULL, '2022-10-11 15:45:50', '2022-10-11 15:45:50', 0),
(70, 'TQNguyen', '123123', 'tqn@gmail.com', 1, NULL, '$2y$10$GOtMZtYsIH3qa9CbVNv6TOSLO8EYlIJGZaad1MbKtHf2dz8lxVLpi', NULL, '2022-10-11 15:49:21', '2022-10-11 15:49:21', 0),
(71, 'rum123', '123321123', 'rum123@gmail.com', 1, NULL, '$2y$10$Q8xzIQNgl2DFx19Cm35Bce6Xs.iBS.Iv8VgXelFQAB0/T9E40iGiy', NULL, '2022-10-11 16:02:55', '2022-10-11 16:02:55', 0),
(72, 'rum12341', '12332112311', 'rum12341@gmail.com', 1, NULL, '$2y$10$9a3HYiC6N3vCldWGsI3NJunAhYFkapSqwI8Ti3Ska9RSbiH8Dc4GG', NULL, '2022-10-11 16:04:27', '2022-10-11 16:04:27', 0),
(73, 'aaaa123', '1234562', 'tqn123321@gmail.com', 1, NULL, '$2y$10$yW1IV9OzWp4Dm7xrRUGSXuW9NMkrpIR4mRq/nFK5.HlFul8JmV/Qy', NULL, '2022-10-11 16:19:26', '2022-10-11 16:19:26', 0),
(74, 'rum73', '12345673', 'tqn@adagmail.com', 1, NULL, '$2y$10$1oWfon/Nn1gHSFWc/w6YWeEfgMz5RFSbqdsjzPJAeuZktpWqTpId6', NULL, '2022-10-11 16:21:32', '2022-10-11 16:21:32', 0),
(75, 'rum731', '123456731', 'tqn1@adagmail.com', 1, NULL, '$2y$10$5IaAGRwgzSfuRp05TPdZsugiqNdu1p8mh7ZkCweL9r5FOD8ouaB2S', NULL, '2022-10-11 16:22:02', '2022-10-11 16:22:02', 0),
(78, 'rumtqnprovip', '0939898539', 'ab@gmail.com', 1, NULL, '$2y$10$z/ELNiU0Ja3L0Wtm1f7cces57MZnT5th2YvsGbMcG1TRCERkshF4y', NULL, '2022-10-11 17:09:25', '2022-10-11 17:09:25', 0),
(79, 'qqqq', '1232222', 'a@gmail.com', 1, NULL, '$2y$10$SFzm.A7STxgT.T3H7oPhO.c63odqb3JNqHsX8XldSOU/L0k32raI.', NULL, '2022-10-11 17:18:45', '2022-10-11 17:18:45', 0),
(80, 'ra', '131231231561', 'r@a.com', 1, NULL, '$2y$10$J/VzrOcrZS6W2aySh.RN6uXfXV/T84Rvi8563n6L85eFAMbTBiy3C', NULL, '2022-10-11 17:30:18', '2022-10-11 17:30:18', 0),
(81, 'gg', '112233332211', 'gg@gmail.com', 1, NULL, '$2y$10$w96rS74G97hcd0jdJTsgRuB6lHkHzbciswBDbNZ/TNrv5pnSjDqeq', NULL, '2022-10-12 16:29:26', '2022-10-12 16:29:26', 0),
(82, 'gggg', '1111', 'gg@gg.com', 1, NULL, '$2y$10$2jnGMMUuuITDqAIj5aCMueRGFOOSe4CjviuGSeDuXxQe6j1e/.xjy', NULL, '2022-10-12 16:43:30', '2022-10-12 16:43:30', 0),
(83, 'tqn', '333', 'a3333@gmail.com', 1, NULL, '$2y$10$W6vy.vEf4mJHvYnozS9IMeEHReLvkqmuW4BwGzYJ9D/GcBmH/.PPC', NULL, '2022-10-22 07:25:08', '2022-10-22 07:25:08', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `restaurant_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`) VALUES
(2, 'american', 0x000000000103000000010000000d000000a7ae16e73fc559c0c6ada38e10ba4540a7ae16e73f1f5ac0bb921158d39d4340d4ad16e73fe458c09ad3eca2a9da4540a7ae16e7bf5f5dc0ab5c9ffe76d14740a7ae16e73f2a5ec0ddae516852114340a7ae16e73f4c5ac0acc0ff07d7993e40d4ad16e73f7c57c09ed3f02f0e623d40d4ad16e7bf8753c0fa91cbf688a64240d4ad16e73f1753c078b91c1606d24440d4ad16e73f9b56c08a9e77fb12574740a7ae16e73f9859c0ab5c9ffe76d14740a7ae16e7bf5f5dc03aa313f4b7ef4740a7ae16e73fc559c0c6ada38e10ba4540, 1, '2022-01-14 14:45:07', '2022-01-14 14:45:07', 'zone_1_restaurant', 'zone_1_customer', 'zone_1_delivery_man');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Chỉ mục cho bảng `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Chỉ mục cho bảng `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Chỉ mục cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Chỉ mục cho bảng `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Chỉ mục cho bảng `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `food_types`
--
ALTER TABLE `food_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=738;

--
-- AUTO_INCREMENT cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `foods`
--
ALTER TABLE `foods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `food_types`
--
ALTER TABLE `food_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100156;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `places`
--
ALTER TABLE `places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT cho bảng `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
