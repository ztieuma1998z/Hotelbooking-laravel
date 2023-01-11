-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 11, 2023 lúc 12:57 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `datn`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isdeleted` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `email`, `name`, `password`, `isdeleted`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'admin@gmail.com', 'admin', '$2a$12$qg7luZu2UWHxG1h4ARYsO.wPkWFn9yMF1HPfb.uM6iPoJEJEeZiom', 0, '4309JcPfPYGbUO1CMyyFtd49yjW9pmMRAnxRdr8Z5Lqig9AuylWHYcFtnE6b', NULL, NULL),
(8, 'admin2@gmail.com', 'Admin2', '$2a$12$Wk2nxW2Cy6ZdnWM4X2RGAOgU8EsdHuX.GCZ8hmGUnXXAAHb2uzVFe', 0, NULL, '2020-08-24 09:08:46', '2020-08-24 09:08:46'),
(9, 'admin3@gmail.com', 'Admin3', '$2a$12$Wk2nxW2Cy6ZdnWM4X2RGAOgU8EsdHuX.GCZ8hmGUnXXAAHb2uzVFe', 0, NULL, '2020-08-24 09:10:01', '2020-08-24 09:10:01'),
(10, 'admin4@gmail.com', 'Admin4', '$2a$12$Wk2nxW2Cy6ZdnWM4X2RGAOgU8EsdHuX.GCZ8hmGUnXXAAHb2uzVFe', 0, NULL, '2020-08-24 09:10:59', '2020-08-24 09:10:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `audits`
--

CREATE TABLE `audits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(365, NULL, NULL, 'created', 'App\\Models\\Booking', 69, '[]', '{\"booking_code\":\"3693792023111\",\"transaction_date\":\"2023-01-11T11:09:02.331884Z\",\"check_in_date\":\"2023-01-11\",\"check_out_date\":\"2023-01-12\",\"adult\":1,\"kid\":0,\"fullname\":\"Ng\\u00f4 \\u0110\\u00ecnh Long\",\"email\":\"nguyenlinh00981@gmail.com\",\"phone\":\"0332242010\",\"user_id\":38,\"total_amount\":1000000,\"payment\":\"0\",\"message\":null,\"status\":false,\"id\":69}', 'http://localhost:8000/quick_checkout/21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', NULL, '2023-01-11 04:09:02', '2023-01-11 04:09:02'),
(366, 'App\\Models\\Admin', 2, 'updated', 'App\\Models\\Booking', 69, '{\"status\":0}', '{\"status\":\"2\"}', 'http://127.0.0.1:8000/admin/checkin/69', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, '2023-01-11 04:11:56', '2023-01-11 04:11:56'),
(367, NULL, NULL, 'updated', 'App\\Models\\Booking', 69, '{\"status\":2,\"payment\":\"0\"}', '{\"status\":1,\"payment\":1}', 'http://localhost:8000/result_payment?vnp_Amount=100000000&vnp_BankCode=NCB&vnp_BankTranNo=VNP13925132&vnp_CardType=ATM&vnp_OrderInfo=Thanh%20to%C3%A1n%20%C4%91%C6%A1n%20%C4%91%E1%BA%B7t%20ph%C3%B2ng%21&vnp_PayDate=20230111181716&vnp_ResponseCode=00&vnp_SecureHash=1660ea51b1bcf852350c156a008417a1ccc10434c3c4d4282d5391fe8403232d&vnp_SecureHashType=SHA256&vnp_TmnCode=GQ47CVPT&vnp_TransactionNo=13925132&vnp_TxnRef=3693792023111', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', NULL, '2023-01-11 04:17:20', '2023-01-11 04:17:20'),
(368, 'App\\Models\\Admin', 2, 'updated', 'App\\Models\\Booking', 69, '{\"status\":1}', '{\"status\":\"3\"}', 'http://127.0.0.1:8000/admin/checkin/69', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, '2023-01-11 04:19:50', '2023-01-11 04:19:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_date` datetime NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `adult` int(11) NOT NULL,
  `kid` int(11) NOT NULL,
  `total_amount` double NOT NULL,
  `payment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bookings`
--

INSERT INTO `bookings` (`id`, `booking_code`, `transaction_date`, `check_in_date`, `check_out_date`, `status`, `adult`, `kid`, `total_amount`, `payment`, `fullname`, `phone`, `email`, `message`, `user_id`, `isdeleted`, `created_at`, `updated_at`, `update_by`) VALUES
(69, '3693792023111', '2023-01-11 18:09:02', '2023-01-11', '2023-01-12', 3, 1, 0, 1000000, '1', 'Ngô Đình Long', 332242010, 'nguyenlinh00981@gmail.com', NULL, 38, 0, '2023-01-11 04:09:02', '2023-01-11 04:19:50', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking_detail`
--

CREATE TABLE `booking_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `booking_detail`
--

INSERT INTO `booking_detail` (`id`, `room_id`, `booking_id`, `price`, `created_at`, `updated_at`) VALUES
(53, 21, 69, 500000, '2023-01-11 04:09:02', '2023-01-11 04:09:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cost_booking`
--

CREATE TABLE `cost_booking` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `cost_id` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cost_overrun`
--

CREATE TABLE `cost_overrun` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cost_overrun`
--

INSERT INTO `cost_overrun` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`, `isdeleted`, `created_by`, `updated_by`) VALUES
(5, 'Lunch', 'Lunch', 100000, '2020-08-13 02:40:59', '2020-08-13 02:40:59', 0, 2, 2),
(6, 'Have breakfast', 'Have breakfast', 50000, '2020-08-13 02:41:43', '2020-08-13 02:41:43', 0, 2, 2),
(7, 'Dinner', 'Dinner', 100000, '2020-08-13 02:42:40', '2020-08-13 02:42:40', 0, 2, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0,
  `reply` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `name`, `email`, `title`, `content`, `isdeleted`, `reply`, `reply_by`, `created_at`, `updated_at`) VALUES
(1, 'Lee Van Quang', 'duachutthoinhe123@gmail.com', 'Thanks hotel', '\r\nThank the hotel with the excellent service and friendly staff', 0, '\r\nThanks Quang, see you someday', 2, '2020-07-24 04:22:13', '2020-07-24 04:24:32'),
(2, 'Admin', 'duachutthoinhe123@gmail.com', '\r\nThanks for everything', 'sdjfgsdhfgsdfgsdfdgsjfgsdjf', 0, 'Heloo bạn', 3, '2020-07-24 04:26:13', '2020-08-02 08:44:44'),
(3, 'Admin', 'phanvanthong555@gmail.com', 'Thanks hotel', 'sdfkhsdyfudskgfds', 0, 'FDFDHGFGFH', 2, '2020-07-24 04:27:04', '2020-07-24 04:27:28'),
(4, 'hello', 'duachutthoinhe123@gmail.com', '\r\nThanks for everything', 'hfdghkhsdfsdf', 0, 'dgshjfsdff', 2, '2020-07-25 10:25:17', '2020-07-25 10:25:31'),
(5, 'Quang', 'duachutthoinhe123@gmail.com', 'Good looking', 'Good looking Good looking Good looking Good looking Good looking', 0, 'Quang', 2, '2020-08-05 00:52:10', '2020-08-12 23:26:51'),
(6, 'Toàn', 'toan@gmail.com', 'I\'m very good', 'I\'m very goodI\'m very goodI\'m very goodI\'m very goodI\'m very goodI\'m very good', 0, 'Toan', 2, '2020-08-05 00:57:52', '2020-08-12 23:36:33'),
(7, 'Quang', 'duachutthoinhe123@gmail.com', 'Hello', 'Hello Hello Hello Hello', 0, 'Quang DDep Trai', 2, '2020-08-11 06:03:28', '2020-08-12 23:38:03'),
(8, 'Đỗ Huy Hùng', 'hung@gmail.com', 'Service', 'Good', 0, 'Thank\'s', 2, '2020-08-16 06:26:16', '2020-08-16 06:26:43'),
(9, 'Minh Thư', 'quang38173@gmail.com', 'Thank you Hotel', 'Good', 0, 'Cảm ơn quý khách đã góp ý', 2, '2020-08-17 08:52:32', '2020-08-17 08:53:22'),
(10, 'Bảo Thư', 'quang38173@donga.edu.vn', 'Dịch vụ của khách sạn rất tốt', 'Dịch vụ của khách sạn rất tốt', 0, 'Cảm ơn quý khách !', 2, '2020-08-17 08:54:20', '2020-08-17 09:00:12'),
(11, 'Lê Quốc Hùng', 'Quoc@gmail.com', 'Hotel Good', 'Hotel GoodHotel GoodHotel GoodHotel GoodHotel GoodHotel Good', 0, NULL, NULL, '2020-08-19 01:27:12', '2020-08-19 01:27:12'),
(12, 'Lê Quốc Hùng', 'hung@gmail.com', 'Hotel Good', 'Hotel GoodHotel GoodHotel GoodHotel Good', 0, NULL, NULL, '2020-08-19 01:29:38', '2020-08-19 01:29:38'),
(13, 'Lê Quốc Hùng', 'hungquoc@gmail.com', 'Hotel Good', 'GoodGoodGoodGoodGood', 0, NULL, NULL, '2020-08-19 01:37:34', '2020-08-19 01:37:34'),
(14, 'Lê Quốc Hùng', 'hungquoc@gmail.com', 'Hotel Good', 'GoodGoodGoodGoodGood', 0, NULL, NULL, '2020-08-19 01:37:47', '2020-08-19 01:37:47'),
(15, 'Bảo Linh', 'Linh@gmail.com', 'Dịch vụ phòng', 'Khách sạn nên tăng giá dịch vụ lên', 0, NULL, NULL, '2020-08-24 08:58:47', '2020-08-24 08:58:47'),
(16, 'Hoài Linh', 'hoailinh@gmail.com', 'Khách sạn', 'Tôi cảm thấy khách sạn nên tạo ra nhiều dịch vụ phát sinh trong quá trình đặt phòng', 0, NULL, NULL, '2020-08-24 09:00:33', '2020-08-24 09:00:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `member`
--

CREATE TABLE `member` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `member`
--

INSERT INTO `member` (`id`, `email`, `created_at`, `updated_at`) VALUES
(3, 'phanvanthong555@gmail.com', '2020-08-24 08:56:42', '2020-08-24 08:56:42');

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
(3, '2020_06_17_075809_create_address_table', 1),
(4, '2020_06_17_075937_create_roomtypes_table', 1),
(5, '2020_06_17_080101_create_rooms_table', 1),
(6, '2020_06_17_080237_create_room_image_table', 1),
(7, '2020_06_17_080633_create_services_table', 1),
(8, '2020_06_17_080650_create_room_service_table', 1),
(9, '2020_06_17_080744_create_tags_table', 1),
(10, '2020_06_17_080757_create_room_tag_table', 1),
(11, '2020_06_17_080839_create_vote_table', 1),
(12, '2020_06_17_081005_create_bookings_table', 1),
(13, '2020_06_17_081021_create_booking_details_table', 1),
(14, '2020_06_17_081106_create_payments_table', 1),
(15, '2020_06_17_081426_create_price_manager_table', 1),
(16, '2020_06_17_092129_create_permission_table', 1),
(17, '2020_07_09_173559_created_admins_table', 2),
(18, '2020_07_10_054315_add_colum_remeber_token', 3),
(19, '2020_07_12_101114_add_colunmdateofbirth', 4),
(20, '2020_07_12_101557_add_nationality', 5),
(21, '2020_07_12_101916_add_image', 6),
(22, '2020_07_12_140422_update_fied_user', 7),
(23, '2020_07_12_170706_add_user', 8),
(24, '2020_07_14_144510_create_password_reset', 9),
(25, '2020_07_15_151321_create_cost_overrun_table', 10),
(26, '2020_07_15_155125_update_price_managerment', 11),
(27, '2020_07_17_081847_update_user', 12),
(28, '2020_07_20_035551_update_price_manangerment', 13),
(29, '2020_07_21_074147_create_audits_table', 14),
(30, '2020_07_17_091051_create__cost__booking_table', 15),
(31, '2020_07_20_210233_create_news_table', 15),
(32, '2020_07_21_182037_update_bookings_table', 15),
(33, '2020_07_21_204131_update_cost_overrun_table', 15),
(34, '2020_07_24_073934_update_admin', 16),
(35, '2020_07_24_074654_update_roomtype', 17),
(36, '2020_07_22_085429_create_feedbacks_table', 18),
(37, '2020_07_25_145858_update_table_service', 19),
(38, '2020_07_26_060155_update_table_role', 20),
(39, '2020_07_28_181904_update_address_table', 21),
(40, '2020_08_02_100658_create_permission_tables', 22),
(41, '2020_07_29_134200_update_booking_table', 23),
(42, '2020_08_02_160828_create_vote_booking_table', 23),
(43, '2020_08_09_142405_add_google_id_column', 24),
(44, '2020_08_10_131446_create_member_table', 25),
(45, '2020_08_13_155040_create_specialday_booking_table', 26),
(46, '2020_08_14_091051_add_paid_to_price_manager_table', 27),
(47, '2020_08_14_183834_update_news_table', 28);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(4, 'App\\Models\\Admin', 2),
(7, 'App\\Models\\Admin', 9),
(8, 'App\\Models\\Admin', 8),
(9, 'App\\Models\\Admin', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `hot` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `thumbnail`, `content`, `status`, `hot`, `isdeleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Covid-19 ở Đà Nẵng', 'covid-19-o-da-nang', '2020-Aug-Mon_1596450464600.jpg', '<p>Trưa 24/7, Ban chỉ đạo phòng chống dịch Covid-19 Đà Nẵng thông tin về ca nghi mắc Covid-19 trên địa bàn. Theo đó, sau hai lần có kết quả dương tính, sáng nay, mẫu bệnh phẩm của ca này đã được Viện Pasteur Nha Trang xác nhận dương tính với SARS-CoV-2.</p><p>Viện Vệ sinh dịch tễ Trung ương sẽ tiến hành xét nghiệm khẳng định đối với trường hợp này.</p><p>Bệnh nhân 57 tuổi, sống chung với vợ và con gái tại phường Hòa Khánh Bắc, quận Liên Chiểu. Theo thông tin người nhà cung cấp, trong vòng 1 tháng gần đây, bệnh nhân chỉ ở thành phố Đà Nẵng, không đi ra ngoại tỉnh.</p><p>Sáng cùng ngày 24/7, ông Nguyễn Tiên Hồng, Phó giám đốc Sở Y tế Đà Nẵng, xác nhận Bệnh viện C Đà Nẵng đang được phong tỏa và nhà chức trách đã cách ly 50 người tiếp xúc với nam bệnh nhân.</p><p>Trước đó, người này có biểu hiện sốt, khó thở nên đến Bệnh viện C Đà Nẵng thăm khám. Nghi ngờ người này nhiễm bệnh, các bác sĩ đã lấy mẫu bệnh phẩm để làm xét nghiệm.</p><p>Ông Nguyễn Trọng Thiện, Giám đốc Bệnh viện C Đà Nẵng, cho biết nam bệnh nhân bị sốt và đã được chuyển qua Bệnh viện Đà Nẵng để điều trị. Bệnh viện đã thông báo cho tất cả cán bộ, nhân viên của đơn vị biết để chủ động phòng tránh dịch bệnh. Các y, bác sĩ cũng được khuyến cáo hạn chế di chuyển trong các khoa, kể cả việc đi lấy thức ăn và các vật dụng khác.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w660/Uploaded/jugtzb/2020_07_24/bv2.jpg\" alt=\"Benh nhan tho bang may do nhiem dich Covid-19 anh 1\"></figure></td></tr><tr><td>Lực lượng chức năng phong tỏa Bệnh viện C Đà Nẵng. Ảnh:<i> Đoàn Nguyên</i>.</td></tr></tbody></table></figure><p>Sáng 24/7, các bác sĩ đã chuyển bệnh nhân sang Bệnh viện Đà Nẵng để cách ly, điều trị. Hiện bệnh nhân phải thở bằng máy.</p><p>Theo Giám đốc Bệnh viện C Đà Nẵng, hai ngày qua, đã có hàng chục bác sĩ, điều dưỡng tiếp xúc với bệnh nhân này. Sở Y tế Đà Nẵng đến nay đã lấy mẫu xét nghiệm các trường hợp tiếp xúc gần với bệnh nhận tại Bệnh viện C, Bệnh viện Đà Nẵng, gia đình bệnh nhân, con gái bệnh nhân và mẹ bệnh nhân.</p><p>Kết quả đã lấy mẫu xét nghiệm 103/103 mẫu âm tính với tác nhân SARS-CoV-2.</p><p>Sở Y tế cũng đã chỉ đạo các đơn vị tiến hành các biện pháp điều tra dịch tễ, xác định các đối tượng tiếp xúc gần, cách ly, khoanh vùng địa bàn và các đối tượng...</p>', 0, NULL, 0, '2', '2', '2020-07-22 01:27:00', '2020-08-15 08:00:12'),
(2, 'Đồng Nai phong tỏa một tuyến', 'dong-nai-phong-toa-mot-tuyen', '2020-Aug-Mon_1596450531022.jpg', '<p>Lực lượng chức năng TP Biên Hòa phong tỏa tuyến đường Hồ Văn Đại trong 14 ngày phòng lây lan dịch Covid-19 sau khi phát hiện ca bệnh 595.</p><p>Ngày 3/8, ông Phạm Anh Dũng, Chủ tịch UBND TP Biên Hòa, tỉnh&nbsp;<a href=\"https://zingnews.vn/tieu-diem/dong-nai.html\">Đồng Nai</a>, đã ký quyết định cách ly khu dân cư trên tuyến đường Hồ Văn Đại và các con hẻm kết nối với đường này tại tổ 13, 14 và 15 thuộc khu phố 3 (phường Quang Vinh) trong 14 ngày.</p><p>Theo ông Dũng, việc cách ly nhằm khoanh vùng khu dân cư có nguy cơ lây lan dịch Covid-19 ra bên ngoài. 182 hộ dân với khoảng 900 nhân khẩu được cách ly từ 12h ngày 3/8.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w660/Uploaded/kbd_ivdb/2020_08_03/116863880_989086694875284_4066573795748295394_n.jpg\" alt=\"dich benh Covid-19 anh 1\"></figure></td></tr><tr><td>Tuyến đường Hồ Văn Đại được lực lượng chức năng phong tỏa từ 12h trưa 3/8. Ảnh:&nbsp;<i>A.H.</i></td></tr></tbody></table></figure><p>Lực lượng chức năng thành phố lập 2 chốt tại ngã ba Hồ Văn Đại - Cách Mạng Tháng Tám, Hồ Văn Đại - quốc lộ 1K. Những trường hợp không chấp hành sẽ bị xử lý nghiêm theo quy định.</p><p>Hôm 1/8, Ban chỉ đạo phòng chống dịch Covid-19 tỉnh Đồng Nai phát hiện bà P.T.T.N. (50 tuổi, ngụ phường Quang Vinh) mắc Covid-19.</p><p>Trong đêm 1/8 và ngày 2/8, lực lượng chức năng đã khử trùng nhà bệnh nhân, các nhà lân cận và những nơi bà này từng đến trong thời gian ủ bệnh. Ngoài ra, 11 trường hợp được xác định F1 và 11 trường hợp F2 được cơ quan y tế đưa đi cách ly tập trung.</p><p>Sáng 3/8, 11 ca F1 có kết quả âm tính lần 1 với Covid-19. Sức khỏe bệnh nhân hiện bình thường và không có biểu hiện lâm sàng về hô hấp.</p>', 0, 'on', 0, '2', '2', '2020-08-03 03:28:51', '2020-08-15 08:00:03'),
(3, 'Tháo dỡ lệnh phong tỏa Bệnh viện TP Quảng Ngãi', 'thao-do-lenh-phong-toa-benh-vien-tp-quang-ngai', '2020-Aug-Mon_1596450572966.jpg', '<p>Sau một tuần phong tỏa, cách ly y tế phòng, chống dịch Covid-19, từ ngày mai (3/8), Bệnh viện TP Quảng Ngãi hoạt động trở lại.</p><p>&nbsp;</p><p>00:06/01:03</p><p>&nbsp;</p><p>&nbsp;</p><p><a href=\"https://zingnews.vn/video-benh-vien-tp-quang-ngai-duoc-khu-khuan-khi-do-phong-toa-post1114642.html\"><strong>Bệnh viện TP Quảng Ngãi được khử khuẩn khi dỡ phong tỏa</strong></a>&nbsp;Sau một tuần cách ly y tế, Bệnh viện TP Quảng Ngãi được tháo dỡ lệnh phong tỏa. Bắt đầu từ ngày 3/8, bệnh viện này tiếp nhận khám và điều trị bệnh nhân trở lại.</p><p>UBND TP Quảng Ngãi quyết định tháo dỡ lệnh phong tỏa đối với Bệnh viện TP Quảng Ngãi sau 6 ngày cách ly y tế. Từ ngày mai (3/8), bệnh viện này sẵn sàng tiếp nhận, khám và điều trị bệnh cho người dân trở lại.</p><p>Ngày 2/8, Bộ Chỉ huy Quân sự tỉnh Quảng Ngãi phối hợp với ngành y tế phun thuốc tiêu độc, khử khuẩn bằng Cloramin B 9 khoa, phòng của Bệnh viện TP Quảng Ngãi. Lực lượng vũ trang đã sử dụng xe quân đội với máy bơm áp lực cao phun thuốc lên các tầng lầu, những ngóc ngách của bệnh viện tiêu độc, khử khuẩn.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w660/Uploaded/sotntb/2020_08_02/Anh_chong_dich_den.jpg\" alt=\"Phong chong dich benh Covid-19 anh 1\"></figure></td></tr><tr><td>Khu vực phía trước Bệnh viện TP Quảng Ngãi. Ảnh:&nbsp;<i>Minh Hoàng.</i></td></tr></tbody></table></figure><p>Trước đó, ngày 27/7, UBND TP Quảng Ngãi áp dụng lệnh phong tỏa toàn bệnh viện vì nơi đây đã tiếp nhận, khám ban đầu cho ca bệnh 419 mắc Covid-19.</p><p>Sau 6 ngày tiêu độc, khử trùng và điều tra dịch tễ, đến nay, Bệnh viện này không còn yếu tố nguy cơ cao có mầm bệnh nên UBND TP Quảng Ngãi cho phép hoạt động trở lại.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w660/Uploaded/sotntb/2020_08_02/phun_thuoc_khu_trung_den_day.jpg\" alt=\"Phong chong dich benh Covid-19 anh 2\"></figure></td></tr><tr><td>Nhân viên y tế phun thuốc khử khuẩn các khoa, phòng Bệnh viện TP Quảng Ngãi. Ảnh:<i>&nbsp;Minh Hoàng.</i></td></tr></tbody></table></figure><p>Những ngày qua, các trường hợp khám, chữa bệnh thẻ bảo hiểm y tế đăng ký tại Bệnh viện Đa khoa TP Quảng Ngãi tạm thời chuyển về khám, chữa bệnh tại các cơ sở y tế gần nhất ở huyện Sơn Tịnh và Tư Nghĩa.</p><p>Cơ quan chức năng Quảng Ngãi cũng đã ghi nhận 300 người là F1 và F2 của bệnh nhân 419 mắc Covid-19. Trong đó, 170 trường hợp là F1. Do số người từng tiếp xúc gần bệnh nhân 419 rất nhiều nên ngành y tế phối hợp với công an đến từng nhà vận động, thu thập thông tin và yêu cầu cách ly, lấy mẫu xét nghiệm.</p>', 0, 'on', 0, '2', '2', '2020-08-03 03:29:32', '2020-08-15 07:59:56'),
(4, 'Dân buôn khẩu trang bán xả hàng', 'dan-buon-khau-trang-ban-xa-hang', '2020-Aug-Mon_1596450619402.jpg', '<p>Cơ quan chức năng liên tiếp vào cuộc xử lý nhiều kho hàng khẩu trang lậu, không rõ nguồn gốc&nbsp;khiến giới buôn tích trữ hàng lo lắng phải bán hạ giá nhằm tránh rủi ro.</p><p>Ngay sau thông tin Đà Nẵng xuất hiện ca nhiễm Covid-19 mới, mặt hàng khẩu trang trên thị trường đã nhanh chóng tăng giá. Tuần trước, có lúc giá bán lẻ lên đến 150.000-200.000 đồng/hộp loại 50 chiếc. Song, hiện giá khẩu trang đã có xu hướng giảm, thậm chí trên các chợ mạng giá khẩu trang giảm hơn một nửa.</p><h3><strong>Bán \"cắt lỗ\" vì ôm hàng không rõ xuất xứ</strong></h3><p>Theo khảo sát, giá khẩu trang y tế được rao bán trên các diễn đàn chợ mạng đang giảm mạnh, từ 7 triệu đồng xuống còn 2,5-4,5 triệu đồng/thùng loại 50 hộp. Giá bán lẻ dao động khoảng 90.000-120.000 đồng/hộp loại 50 chiếc. Còn trên thị trường, nhiều hiệu thuốc đã thông báo hết hàng dừng bán, một số điểm chỉ bán lẻ khẩu trang, giá 2.000-3.000 đồng/chiếc.</p><p>\"Đứng ngồi không yên\" mấy ngày nay khi thấy nhiều dân buôn đồng loạt hạ giá bán khẩu trang, một tài khoản tên Dung Thanh tỏ ra hoang mang: \"Lúc nhập hơn 5 triệu/thùng loại 50 hộp, tôi đang chờ lên 9 triệu/thùng để bán ai ngờ bây giờ hạ giá xuống còn 3, 4 triệu/thùng\".</p><p>\"Hiện, vẫn còn một số nơi bán 5-6 triệu đồng/thùng loại 50 hộp, nhưng phần lớn đều là hàng công ty sản xuất có giấy tờ, hoá đơn rõ ràng\", chị cho biết.</p><p>&nbsp;</p><p>Theo chị Thanh, gần đây trên khắp cả nước liên tiếp diễn ra các vụ bắt giữ nhiều kho hàng, cơ sở sản xuất khẩu trang giả, không rõ nguồn gốc xuất xứ, khẩu trang y tế không có hóa đơn,…khiến giới dân buôn như chị và xưởng sản xuất có tâm lý sợ bị cơ quan chức năng \"chú ý\" nên đồng loạt hạ giá bán.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bfjysesfzyr/2020_07_26/IMG_2898.JPG\" alt=\"Khau trang giam gia o at tren cho mang anh 1\"></figure></td></tr><tr><td>Cơ quan chức năng liên tiếp vào cuộc xử lý nhiều kho hàng khẩu trang lậu, không rõ nguồn gốc xuất xứ khiến giới dân buôn, sản xuất đều dè chừng và hạ giá khẩu trang.&nbsp;<i>Ảnh: D.T.</i></td></tr></tbody></table></figure><p>\"Tôi đang chờ xem tình hình giá bán có biến động gì không rồi mới bán nốt số hàng còn lại\", chị chia sẻ thêm.</p><p>Khác với chị Thanh, một người khác tên Tuấn đang tích cực đăng bài rao bán \"xả lỗ\" khẩu trang với mức giá 3,9 triệu đồng/thùng loại 50 hộp. Anh cho biết phải bán tháo như vậy vì giá khẩu trang đang giảm dần, nếu không bán được lúc này sẽ bị lỗ nặng.</p><p>Sau khi Việt Nam ghi nhận có ca nhiễm Covid-19 trở lại, giá khẩu trang đã tăng gấp 2, 3 lần so với trước. Tuy nhiên, đợt tăng này không quá mạnh và đang dần được cơ quan chức năng vào cuộc kiểm soát.</p><p>Mặt khác, theo một số dân buôn khẩu trang online, hiện nay xuất hiện tình trạng thu mua khẩu trang Trung Quốc với giá siêu rẻ đóng vào vỏ hộp khẩu trang trong nước rồi bán ra thị trường với giá rất thấp, khiến giá bán có sự chênh lệch. Điều này cũng sẽ khiến người tiêu dùng khó phân biệt được chất lượng sản phẩm.</p><p>Chị Hồng Minh, một tài khoản buôn khẩu trang cho hay: \"Tôi thường chọn nơi bán rẻ nhất nhập về. Họ đưa cho tôi một số giấy tờ kiểm định sản phẩm chứ tôi cũng không biết cách phân biệt khẩu trang đó có đạt chuẩn hay không\".</p><p>Thực tế, nhiều người tiêu dùng khi được hỏi về chất lượng khẩu trang đang sử dụng đều tỏ ra bối rối. \"Mua về cứ thế mà dùng thôi, cũng ít khi để ý chất lượng khẩu trang đó như thế nào\", Nguyễn Đức (Cầu Giấy, Hà Nội) cho hay.</p><h3><strong>Cảnh giác mua phải hàng giả, kém chất lượng</strong></h3><p>Trước diễn biến mới của dịch bệnh và sự gia tăng nhu cầu của người tiêu dùng về một số mặt hàng, vật tư y tế như khẩu trang, dung dịch sát khuẩn, găng tay y tế..., một số đối tượng đã gia tăng đầu cơ, nâng giá, sản xuất, buôn bán hàng giả, hàng kém chất lượng ra thị trường, đặc biệt là trên chợ mạng.</p><p>Trước tình hình đó, cơ quan chức năng đã vào cuộc phát hiện và xử lý nhiều kho hàng, cơ sở sản xuất khẩu trang lậu, không rõ nguồn gốc xuất xứ. Điển hình, sáng 1/8, cơ quan chức năng phát hiện một nhà xưởng 2.000 m2 tại huyện Lương Sơn, Hòa Bình đang sản xuất khẩu trang giả và tái chế găng tay đã qua sử dụng.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bfjysesfzyr/2020_08_03/IMG_3015.JPG\" alt=\"Khau trang giam gia o at tren cho mang anh 2\"></figure></td></tr><tr><td>Lượng khẩu trang giả và găng tay đã qua sử dụng được cơ quan chức năng phát hiện tại chỗ.&nbsp;<i>Ảnh: MOIT.</i></td></tr></tbody></table></figure><p>Chiều 31/7, Đội Quản lý thị trường (QLTT) số 7 thuộc Cục QLTT Quảng Bình cũng đã phát hiện một đối tượng vận chuyển gần 1,8 triệu khẩu trang lậu không có hóa đơn chứng từ, trị giá gần&nbsp;1 tỷ đồng.</p><p>Trước đó, từ ngày 25/7 đến 29/7, cơ quan chức năng đã tiến hành thanh tra, rà soát tại gần 900 cơ sở kinh doanh trang thiết bị y tế, phát hiện 3 lô hàng khẩu trang tại Đà Nẵng không có hóa đơn chứng từ chứng minh nguồn gốc xuất xứ. Số lượng khẩu trang bị tạm giữ lên đến 58.000 chiếc.</p><p>Trong khi các nhà thuốc hầu hết đều báo hết khẩu trang y tế, nhiều người dân đã tìm mua nguồn khẩu trang y tế trên các diễn đàn chợ mạng, song chất lượng, nguồn gốc những khẩu trang được rao bán trôi nổi này khó đảm bảo. Thậm chí, nhiều cơ sở, dân buôn online còn giả mạo giấy kiểm nghiệm của Bộ Y tế để quảng cáo chất lượng khẩu trang đạt chuẩn.</p><p>\"Trong thời điểm dịch Covid-19 đang quay trở lại Việt Nam, việc người dân sử dụng những loại khẩu trang giả, không đảm bảo về chất lượng như thế này có thể gây ra hậu quả nghiêm trọng trong công tác phòng, tránh dịch bệnh\", đại diện Tổng cục QLTT cảnh báo.</p><p>Tổng cục QLTT cho biết sẽ tiếp tục phối hợp chặt chẽ với các đơn vị chức năng xử lý cương quyết đối với các cơ sở, cá nhân có biểu hiện buôn bán, sản xuất, kinh doanh hàng giả, hàng kém chất lượng, hàng không rõ nguồn gốc xuất xứ, đầu cơ, găm hàng, nâng giá các mặt hàng y tế.</p><p>Đồng thời, khuyến cáo người dân nên bình tĩnh, cảnh giác trước những thông tin thất thiệt, chưa được kiểm chứng trên các trang mạng xã hội của một số đối tượng nhằm mục đích tạo ra tình trạng khan hiếm giả, phục vụ việc đầu cơ, găm hàng, trục lợi. Người dân nên chọn mua, bán các sản phẩm y tế tại các cơ sở, cửa hàng được cấp phép, có uy tín để tránh mua phải hàng giả, hàng kém chất lượng, không rõ nguồn gốc xuất xứ...</p>', 0, 'on', 0, '2', '2', '2020-08-03 03:30:19', '2020-08-19 01:01:04'),
(5, 'Thêm 6 người mắc Covid-19 tại Đà Nẵng và Hải Dương', 'them-6-nguoi-mac-covid-19-tai-da-nang-va-hai-duong', '2020-Aug-Mon_1598279611126.jpg', '<p><strong>Các bệnh nhân từ 1017 đến 1022 được ghi nhận tại Đà Nẵng và Hải Dương. Trong đó, 2 người là nhân viên y tế.</strong></p><p>Theo Bộ Y tế, tính đến 18h ngày 24/8, Việt Nam có tổng cộng 1.022 người mắc Covid-19. Trong đó, 680 ca lây nhiễm trong nước.</p><p><strong>BN1017 </strong>(nữ, 68 tuổi, ở Mỹ An, Ngũ Hành Sơn, Đà Nẵng) là người đi chợ, được lấy mẫu xét nghiệm sàng lọc Covid-19 ngày 23/8 tại chợ Hà Thân, phường An Hải Tây, quận Sơn Trà, TP Đà Nẵng.</p><p><strong>BN1018</strong> (nam, 57 tuổi, ở Hải Châu 2, Hải Châu, Đà Nẵng) là nhân viên y tế Bệnh viện Đà Nẵng.</p><p><strong>BN1019</strong> (nữ, 37 tuổi, ở Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng) là nhân viên y tế Bệnh Viện Đà Nẵng. Bà là nhân viên y tế tăng cường cho Bệnh viện Phổi Đà Nẵng, đã được cách ly tại khách sạn từ ngày 5/8.</p><p><strong>BN1020</strong> (nam, 26 tuổi, ở Hòa Khánh Bắc, Hòa Vang, Đà Nẵng) từng tiếp xúc BN996.</p><p><strong>BN1021</strong> (nam, 8 tuổi, ở Liên Hồng, thành phố Hải Dương, tỉnh Hải Dương) là con của BN1016.</p><p><strong>BN1022</strong> (nữ, 63 tuổi, ở Liên Hồng, thành phố Hải Dương, tỉnh Hải Dương) là mẹ đẻ của BN1016.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w660/Uploaded/znanug/2020_08_24/24.jpg\" alt=\"Ca mac Covid-19 moi anh 1\"></figure></td></tr></tbody></table></figure><p>Những ngày qua, số ca mắc Covid-19 có xu hướng giảm, đồng thời, nhiều bệnh nhân đã khỏi Covid-19 và xuất viện.</p><p>Theo Cục Y tế Dự phòng, từ khi bùng nổ dịch Covid-19 đến 15h ngày 24/8, Việt Nam đã thực hiện 1.009.145 xét nghiệm bằng phương pháp rRT-PCR. Riêng ngày 24/8, 11.698 xét nghiệm đã tiến hành.</p><p>Trong vòng một tháng qua, công suất xét nghiệm đã tăng gấp 5-6 lần so với giai đoạn cao điểm tháng 3-4. Số lượng xét nghiệm trong gần một tháng qua bằng tổng 6 tháng giai đoạn đầu.</p><p>Hiện Việt Nam có 71 đơn vị thực hiện xét nghiệm khẳng định Covid-19 (công suất khoảng 34.000 mẫu/ngày).</p>', 0, 'on', 0, '2', '2', '2020-08-24 07:33:31', '2020-08-24 07:33:31'),
(6, 'Sẽ có sổ tay hướng dẫn sống chung với Covid-19', 'se-co-so-tay-huong-dan-song-chung-voi-covid-19', '2020-Aug-Mon_1598279772821.jpg', '<p><strong>Để sống chung an toàn với Covid-19, người dân cần tuân thủ các quy định như hạn chế đi ra ngoài, đeo khẩu trang nơi công cộng, rửa tay sát khuẩn.</strong></p><p>Chiều 24/8, tại cuộc họp của Ban Chỉ đạo quốc gia về phòng, chống dịch Covid-19, các thành viên thống nhất quan điểm dịch Covid-19 tại Đà Nẵng, <a href=\"https://zingnews.vn/tieu-diem/quang-nam.html\">Quảng Nam</a>, Hải Dương… đã được kiểm soát. Qua đợt này, Bộ Y tế sẽ tổng hợp kinh nghiệm phòng, chống dịch Covid-19 để tổ chức tập huấn cho các địa phương trên cả nước.</p><p>Bên cạnh đó, Ban Chỉ đạo yêu cầu Bộ Y tế chủ trì, phối hợp với các bộ, ngành, địa phương ban hành sổ tay hướng dẫn chung sống an toàn trong điều kiện dịch bệnh.</p><p>Các thành viên Ban Chỉ đạo đề nghị để chung sống an toàn với Covid-19, cần tiếp tục tuyên truyền người dân tuân thủ các quy định cơ bản như: Hạn chế đi ra ngoài; thường xuyên đeo khẩu trang khi đi ra ngoài hoặc trên các phương tiện công cộng, nơi đông người; thường xuyên rửa tay bằng xà phòng, nước sạch hoặc dung dịch sát khuẩn; không lơ là, chủ quan trước diễn biến của dịch bệnh.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w660/Uploaded/ovhpaob/2020_08_24/DDN_9535.jpg\" alt=\"hon 26.000 thi sinh vung dich thi tot nghiep dot 2 anh 1\"></figure></td></tr><tr><td>Phó thủ tướng <a href=\"https://zingnews.vn/tieu-diem/dong-chi-vu-duc-dam.html\">Vũ Đức Đam</a> chủ trì cuộc họp Ban Chỉ đạo quốc gia về phòng, chống dịch Covid-19 chiều 24/8. Ảnh: <i>VGP.</i></td></tr></tbody></table></figure><p>Ban Chỉ đạo thống nhất giao Bộ Y tế tiếp tục rà soát toàn bộ hệ thống máy móc, dự án nghiên cứu sản xuất sinh phẩm; tiếp tục thúc đẩy để chủ động mức cao nhất việc xét nghiệm Covid-19 trên tinh thần tiết kiệm, hiệu quả.</p><p>Bộ Y tế có phương án để các địa phương cùng phối hợp lấy mẫu, xét nghiệm, chi viện lẫn nhau nhằm tiết kiệm nguồn lực chung của toàn xã hội.</p><p>Bên cạnh đó, các chuyên gia đề nghị Bộ Y tế tiếp tục theo dõi sát việc nghiên cứu, sản xuất vaccine trên toàn thế giới; đồng thời cùng Bộ Khoa học và Công nghệ thúc đẩy các dự án nghiên cứu vaccine phòng Covid-19.</p><p>Cũng tại cuộc họp, trung tướng Nguyễn Văn Sơn, Thứ trưởng Bộ Công an, cho biết qua kiểm tra, bộ phát hiện một số địa phương chưa thực hiện đúng quy trình xuất nhập cảnh chuyên gia, lao động kỹ thuật cao, nhà đầu tư… vào Việt Nam.</p><p>Đặc biệt, còn xảy ra tình trạng lợi dụng chính sách, đưa đối tượng không đúng quy định nhập cảnh. Hiện, Bộ Công an đang tiếp tục tiến hành điều tra, xử lý nghiêm các vụ việc theo quy định của pháp luật.</p>', 0, 'on', 0, '2', '2', '2020-08-24 07:36:12', '2020-08-24 07:36:12'),
(7, 'Nga dự kiến sản xuất 2 triệu liều vaccine Covid-19 mỗi tháng', 'nga-du-kien-san-xuat-2-trieu-lieu-vaccine-covid-19-moi-thang', '2020-Aug-Mon_1598279841370.jpg', '<p><strong>Hãng thông tấn RIA của Nga cho biết quốc gia này có kế hoạch sản xuất 1,5-2 triệu liều vaccine Covid-19 mỗi tháng.</strong></p><p>Trả lời phỏng vấn kênh truyền hình Zvezda, người đứng đầu Bộ Công thương của Nga - Denis Manturov - cho biết kế hoạch này sẽ triển khai từ cuối năm 2020 và dự định đạt năng suất 6 triệu liều vaccine một tháng.</p><p>Để đạt được điều này, 3 doanh nghiệp sẽ được kết nối tham gia sản xuất. Đó là Binnopharm, R-Pharm và Generium. Hiện năng lực sản xuất của Nga có thể cho ra đời 30.000 liều vaccine Covid-19 vào cuối tháng 8.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w660/Uploaded/znanug/2020_08_24/1575770559_0_326_3062_2048_600x0_80_0_0_31a7531acf69305ec126c1d1abbe9c5a.jpg\" alt=\"vaccine Covid-19 anh 1\"></figure></td></tr><tr><td>Năng lực sản xuất vaccine Covid-19 của Nga là 500 triệu liều một năm. Ảnh: <i>RIA.</i></td></tr></tbody></table></figure><p>Ông Manturov cho biết thêm quốc gia này đang xem xét các đơn đặt hàng vaccine Sputnik V. Tuy nhiên, nhiệm vụ đảm bảo nhu cầu cho người dân trong nước sẽ được đặt lên hàng đầu.</p><p>Trước đó, Nga trở thành quốc gia đầu tiên công bố sản xuất thành công vaccine Covid-19. Ông Kirill Dmitriev, Giám đốc Quỹ Đầu tư trực tiếp Nga, cho biết nước này đã nhận đơn đặt hàng vaccine Sputnik V từ hơn 20 quốc gia, với khoảng một tỷ liều. Hiện năng lực sản xuất của Nga có thể đạt 500 triệu liều vaccine Covid-19 mỗi năm.</p>', 0, NULL, 0, '2', '2', '2020-08-24 07:37:21', '2020-08-24 07:37:21'),
(8, 'Người đàn ông bỏ trốn khỏi chốt phòng dịch', 'nguoi-dan-ong-bo-tron-khoi-chot-phong-dich', '2020-Aug-Mon_1598279909561.jpg', '<p><strong>Cơ quan chức năng TP Móng Cái (Quảng Ninh) đang tìm kiếm người đàn ông để lại chứng minh nhân dân và bỏ trốn khỏi chốt kiểm soát phòng, chống dịch Covid-19.</strong></p><p>Chiều 23/8, cơ quan chức năng thành phố Móng Cái cho biết đang truy tìm người đàn ông bỏ trốn khỏi chốt kiểm soát phòng dịch Covid-19 tại Trạm kiểm soát liên hợp Km15 (xã Hải Tiến, TP Móng Cái).</p><p>Ông Nguyễn Như Đông, Trạm trưởng Trạm kiểm soát liên hợp KM15, cho biết người này ngồi trên xe khách vào thành phố Móng Cái.</p><p>Đến chốt kiểm soát phòng dịch đặt tại trạm, người đàn ông cùng hành khách trên xe vào khai báo y tế và kiểm tra thân nhiệt.</p><p>\"Khi đang chờ đo thân nhiệt, ông ấy để lại chứng minh nhân dân và bỏ trốn mất\", ông Đông nói.</p><p>Thông tin trên chứng minh nhân dân ghi người này tên Đinh Phúc Thạo (40 tuổi) trú thành phố Hải Dương, tỉnh Hải Dương.</p><p>Lãnh đạo thành phố Móng Cái cho biết đã thông báo đến toàn bộ địa phương trong thành phố và người dân để tìm kiếm, đưa người đàn ông bỏ trốn về khu cách ly.</p>', 0, 'on', 0, '2', '2', '2020-08-24 07:38:29', '2020-08-24 07:38:29'),
(9, 'Quảng Nam chốt thời gian tổ chức thi tốt nghiệp THPT', 'quang-nam-chot-thoi-gian-to-chuc-thi-tot-nghiep-thpt', '2020-Aug-Mon_1598279997703.jpg', '<p><strong>Hơn 9.000 thí sinh tại Quảng Nam sẽ bước vào đợt 2 kỳ thi tốt nghiệp THPT từ ngày 29 đến 31/8.</strong></p><p>Ngày 22/8, ông Hà Thanh Quốc, Giám đốc Sở GD&amp;ĐT tỉnh Quảng Nam, cho biết đợt 2 của kỳ thi tốt nghiệp THPT sẽ diễn ra từ 29/8 đến 31/8.</p><p>Ông Quốc cho hay do tình hình dịch Covid-19 tại địa phương có chiều hướng tốt lên khi chỉ còn 3 nơi cách ly xã hội. Do đó, Sở GD&amp;ĐT thống nhất thời gian tổ chức đợt 2 kỳ thi tốt nghiệp THPT của Bộ Y tế.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w660/Uploaded/lce_mdlwc/2020_08_15/thithpt_zing.jpg\" alt=\"thi THPT quoc gia lan 2 o Quang Nam anh 1\"></figure></td></tr><tr><td>Sở GD&amp;ĐT Quảng Nam tổ chức thi THPT quốc gia lần 2 vào cuối tháng 8. Ảnh minh họa: <i>Thanh Đức.</i></td></tr></tbody></table></figure><p>Lãnh đạo Sở GD&amp;ĐT Quảng Nam cho hay trong đợt 2 sẽ có 9.196 thí sinh dự thi với 28 điểm thi.</p><p>Đợt thi lần này, Sở GD&amp;ĐT yêu cầu các điểm thi nắm rõ thí sinh, rà soát kỹ từng trường hợp và kiểm tra y tế, đảm bảo an toàn.</p><p>\"Hiệu trưởng các trường phải nắm danh sách từng em học sinh, phối hợp với ngành y tế, xác minh từng trường hợp. Ngoài ra, các trường chịu trách nhiệm điều tra y tế đối với những thí sinh và cán bộ coi thi, cán bộ phục vụ kỳ thi. Những trường hợp có yếu tố dịch tễ sẽ tiến hành làm xét nghiệm để có phương án phù hợp\", ông Quốc nói.</p><p>Với giáo viên có yếu tố dịch tễ, sống tại TP Đà Nẵng sẽ không làm nhiệm vụ coi thi.</p><p>Trường hợp thí sinh là F1, F2 sẽ được xe bố trí đưa đón, phòng thi riêng. Cán bộ coi thi thực hiện biện pháp bảo hộ trong quá trình làm nhiệm vụ. Bài thi niêm phong riêng để khi chấm xử lý y tế theo quy định.</p>', 0, NULL, 0, '2', '2', '2020-08-24 07:39:57', '2020-08-24 07:39:57'),
(10, 'Bánh trung thu cao cấp vẫn cháy hàng giữa dịch Covid-19', 'banh-trung-thu-cao-cap-van-chay-hang-giua-dich-covid-19', '2020-Aug-Mon_1598280051620.jpg', '<p><strong>Một số doanh nghiệp sản xuất và nhập khẩu bánh trung thu ghi nhận sự tăng trưởng đáng kể của phân khúc cao cấp, dù trước đó dự báo sức mua không cao vì Covid-19.</strong></p><p>Dù còn hơn một tháng nữa mới đến Trung thu, Công ty TNHH Thực phẩm Đại Phát đã bán được hơn 1.000 hộp bánh trung thu sơn mài giá 1,58 triệu đồng. Cùng kỳ năm ngoái, chỉ hơn 300 hộp được bán ra. Sản phẩm hộp gốm sứ Minh Long giá 1,68 triệu đồng hiện cũng đã hết hàng.</p><p>Ông Hứa Ngọc Lâm, Tổng giám đốc, cho biết doanh thu dòng bánh trung thu tăng gấp 3 lần năm 2019, chủ yếu nhờ phân khúc cao cấp.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w660/Uploaded/rgtgtn/2020_08_22/banh_trung_thu_dai_phat_zing.jpg\" alt=\"Banh trung thu cao cap anh 1\"></figure></td></tr><tr><td>Sức mua bánh trung thu năm nay sớm tăng trưởng từ đầu mùa. Ảnh:<i> Lan Anh.</i></td></tr></tbody></table></figure><p>\"Những năm gần đây, chúng tôi tăng trưởng bình quân 10-20%/năm. Năm nay, dự báo thị trường khó khăn với Covid-19 nên tôi chỉ tăng 5% sản lượng, không hiểu sao kết quả kinh doanh lại tốt như vậy. Chúng tôi đang sản xuất thêm một số sản phẩm đã cháy hàng. Nhưng dù sao cũng mới đầu mùa, rất khó để đánh giá nhu cầu thực tế trong thời gian tới\", ông chia sẻ.</p><p>Theo vị này, sau giai đoạn kinh doanh không thuận lợi bởi Covid-19, rất có thể các doanh nghiệp đang cố gắng giữ chân khách hàng và tìm kiếm khách hàng mới, do đó nhu cầu tặng quà cao hơn. Bên cạnh đó, từ phía Đại Phát, doanh nghiệp cũng chủ động đổi mới sản phẩm và thiết kế bao bì bám sát thị hiếu khách hàng, đồng thời đẩy mạnh quảng cáo online và xây dựng cửa hàng trải nghiệm.</p><p>Mia Fruit, đơn vị chuyên nhập khẩu trái cây và bánh kẹo cao cấp ở TP.HCM và Hà Nội, cũng đã bán hết 20% tổng sản lượng bánh trung thu lava trứng muối <a href=\"https://zingnews.vn/tieu-diem/hong-kong.html\">Hong Kong</a> dù mới nhập về hơn 10 ngày. Bà Lạc Thảo Vy - giám đốc điều hành - cho biết giá mỗi hộp 8 bánh 45 g là 1,45 triệu đồng.</p><p>Sức tiêu thụ hiện nay được đánh giá là tăng trưởng so với mọi năm, chủ yếu nhờ việc tiếp cận hiệu quả với phân khúc khách hàng doanh nghiệp.</p><figure class=\"table\"><table><tbody><tr><td><figure class=\"image\"><img src=\"https://znews-photo.zadn.vn/w660/Uploaded/rgtgtn/2020_08_22/banh_lava_hong_kong_zing2.jpg\" alt=\"Banh trung thu cao cap anh 2\"></figure></td></tr><tr><td>Các dòng bánh trung thu cao cấp ghi nhận sức tăng trưởng tốt nhờ phân khúc khách hàng doanh nghiệp. Ảnh: <i>Minh Thừa.</i></td></tr></tbody></table></figure><p>Tuy nhiên, với dự báo trước đó về việc các công ty sẽ cắt giảm chi phí biếu tặng đối tác và nhân viên dịp trung thu, Mia Fruit chỉ nhập về 1.000 hộp bánh, giảm 50% so với các năm trước.</p><p>Đại diện ABC Bakery, bà Kao Huy Minh cũng cho biết đã chủ động giảm 30% sản lượng bánh trung thu so với năm ngoái. Số lượng sản phẩm đồng thời giảm bớt so với hơn 60 vị bánh trước đây.</p><p>\"Chúng tôi ghi nhận khoảng 70% khách hàng doanh nghiệp cắt giảm chi phí tặng quà cho nhân viên, chỉ dành ngân sách để tặng quà cho đối tác. Do đó, chúng tôi buộc phải giảm số lượng và chủng loại bánh trong từng phân khúc bình dân, trung bình và cao cấp\", bà Kao Huy Minh chia sẻ.</p><p>Mặc dù vậy, thị trường năm nay vẫn được nhận xét là sôi động với sự xuất hiện của một số loại bánh mới, như các sản phẩm từ nông sản gồm thanh long phô mai, tắc hạt dưa, sầu riêng 6 Ri của ABC Bakery, hay bánh đậu xanh rau má từ The Yên Concept.</p><p>Mới đây, Kido cũng thông báo quay lại với thương hiệu bánh trung thu Kingdom, sau 5 năm bán mảng bánh kẹo cho đối tác nước ngoài. Doanh nghiệp dự kiến tung ra thị trường 4 triệu bánh, tương đương khoảng 1 triệu hộp, với kỳ vọng doanh số đạt 200 tỷ đồng.</p>', 0, NULL, 0, '2', '2', '2020-08-24 07:40:51', '2020-08-24 07:40:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
('05d893d2-1ac4-4f73-9b5b-26af88e22bae', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":43}', NULL, '2020-08-24 07:59:33', '2020-08-24 07:59:33', NULL),
('09efd5e5-1160-4b70-b777-8686a7b3345e', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":25}', '2020-08-13 07:28:51', '2020-08-12 07:43:07', '2020-08-13 07:28:51', NULL),
('1061ab72-7261-4207-8a96-9ac8750f00c9', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":56}', NULL, '2023-01-09 03:42:30', '2023-01-09 03:42:30', NULL),
('1b1a777d-76a0-40b7-85cb-f1bcb3f4dee0', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":39}', '2020-08-19 02:39:16', '2020-08-19 01:10:28', '2020-08-19 02:39:16', NULL),
('205da0fb-3d8f-4526-83b6-160a59e2b5ee', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 31, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":33}', '2020-08-16 04:58:37', '2020-08-16 03:07:45', '2020-08-16 04:58:37', NULL),
('264a1c5a-f848-4781-8a42-b131866f3b5f', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 32, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":51}', '2020-08-19 01:14:17', '2020-08-18 02:48:34', '2020-08-19 01:14:17', NULL),
('273399f0-c11d-4e71-891a-c67e9908146d', 'App\\Notifications\\FeedbackNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new feedback\",\"content\":\"There is a new feedback\",\"id\":7}', '2020-08-11 06:03:39', '2020-08-11 06:03:28', '2020-08-11 06:03:39', NULL),
('2ca363a9-8e2b-4882-a406-fe8928e23f4a', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":16}', '2020-08-11 05:37:30', '2020-08-11 05:29:04', '2020-08-11 05:37:30', NULL),
('31cd8ca2-a0db-489c-8ec7-4af0406dd22d', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":17}', '2020-08-15 00:08:56', '2020-08-11 05:29:31', '2020-08-15 00:08:56', NULL),
('350a6d99-4f1b-4fb5-9530-3dc2cc23341e', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 37, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":49}', NULL, '2020-08-24 08:44:01', '2020-08-24 08:44:01', NULL),
('379ff9a8-c09d-409e-b95e-5c79ad898268', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":20}', '2020-08-11 05:44:01', '2020-08-11 05:43:53', '2020-08-11 05:44:01', NULL),
('3e0dfc5a-f078-429c-b512-f4f6ffe2bd74', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":24}', '2020-08-15 00:09:05', '2020-08-11 08:17:54', '2020-08-15 00:09:05', NULL),
('3f3910a8-0adf-4f87-819a-0401b461eea0', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 36, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":47}', NULL, '2020-08-24 08:40:47', '2020-08-24 08:40:47', NULL),
('49e302a8-2c4d-42c7-9d4a-9b9dd9f4d23c', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":30}', NULL, '2020-08-15 08:53:52', '2020-08-15 08:53:52', NULL),
('4dec09fb-d4ab-474f-9e0a-586b88a103f7', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":59}', NULL, '2023-01-09 04:23:13', '2023-01-09 04:23:13', NULL),
('50ae7030-497b-4dfe-b445-7869ca1b4a12', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":53}', NULL, '2023-01-09 03:25:47', '2023-01-09 03:25:47', NULL),
('558a47ea-b967-4767-b973-9a20e0a571b4', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 21, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":45}', NULL, '2020-08-24 08:34:56', '2020-08-24 08:34:56', NULL),
('562b008d-c712-4edb-b5d5-2bd4789a3ecb', 'App\\Notifications\\FeedbackNotification', 'App\\Models\\Feedback', 16, '{\"title\":\"There is a new feedback\",\"content\":\"There is a new feedback\",\"id\":16}', NULL, '2020-08-24 09:00:34', '2020-08-24 09:00:34', NULL),
('5bb4c305-d0b7-4db0-8034-988486798497', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":23}', '2020-08-15 00:09:02', '2020-08-11 08:06:40', '2020-08-15 00:09:02', NULL),
('68472b8b-1919-4d53-af35-e0fb9c183b26', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":21}', '2020-08-11 06:03:50', '2020-08-11 05:47:25', '2020-08-11 06:03:50', NULL),
('725cd583-c43e-4c9c-b4ee-e1b7390d98ae', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":60}', NULL, '2023-01-09 04:24:15', '2023-01-09 04:24:15', NULL),
('72697ffb-9060-4411-aaf4-59b601fa1797', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":19}', '2020-08-15 00:09:00', '2020-08-11 05:38:57', '2020-08-15 00:09:00', NULL),
('7a3680b0-f833-4696-862a-dbd80cb432e4', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":26}', '2020-08-15 00:09:08', '2020-08-13 23:53:25', '2020-08-15 00:09:08', NULL),
('7a89a5e5-e6e2-4248-b350-953a11646cec', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":32}', '2020-08-16 04:58:41', '2020-08-15 09:43:51', '2020-08-16 04:58:41', NULL),
('81f8092a-e982-47ba-ad52-329c5c007c0d', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 36, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":48}', NULL, '2020-08-24 08:42:03', '2020-08-24 08:42:03', NULL),
('9c105b48-3e68-473a-9df9-2e05df447c19', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 32, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":50}', '2020-08-19 01:14:21', '2020-08-18 01:13:30', '2020-08-19 01:14:21', NULL),
('a1190619-1269-43c3-9d26-5bf8677b809e', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 31, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":34}', '2020-08-16 04:58:33', '2020-08-16 03:12:13', '2020-08-16 04:58:33', NULL),
('ab0cb11a-6085-4b9d-94c2-f782e5fef09d', 'App\\Notifications\\FeedbackNotification', 'App\\Models\\Feedback', 14, '{\"title\":\"There is a new feedback\",\"content\":\"There is a new feedback\",\"id\":14}', '2020-08-23 05:55:59', '2020-08-19 01:37:47', '2020-08-23 05:55:59', NULL),
('ae6cc61b-1caa-4542-9428-e41a039e4512', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":27}', NULL, '2020-08-13 23:55:29', '2020-08-13 23:55:29', NULL),
('b0c04309-46c1-4b89-9b69-7bae3d19717b', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":41}', NULL, '2020-08-24 07:53:02', '2020-08-24 07:53:02', NULL),
('bc6b4037-69f4-4381-a1a8-cbf91e1fbe6d', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":18}', '2020-08-11 05:37:26', '2020-08-11 05:34:26', '2020-08-11 05:37:26', NULL),
('bfff686c-a83a-4ef9-b014-3219d119209e', 'App\\Notifications\\FeedbackNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new feedback\",\"content\":\"There is a new feedback\",\"id\":8}', '2020-08-16 07:17:06', '2020-08-16 06:26:17', '2020-08-16 07:17:06', NULL),
('c082eb84-a52d-4b07-89ed-c5b436b59381', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":58}', NULL, '2023-01-09 04:19:37', '2023-01-09 04:19:37', NULL),
('c1e44801-e787-45d2-9ed8-833e2d69a577', 'App\\Notifications\\FeedbackNotification', 'App\\Models\\User', 32, '{\"title\":\"There is a new feedback\",\"content\":\"There is a new feedback\",\"id\":10}', '2020-08-19 01:14:24', '2020-08-17 08:54:20', '2020-08-19 01:14:24', NULL),
('c9679f21-7866-47cb-a9aa-658500019864', 'App\\Notifications\\FeedbackNotification', 'App\\Models\\Feedback', 15, '{\"title\":\"There is a new feedback\",\"content\":\"There is a new feedback\",\"id\":15}', NULL, '2020-08-24 08:58:47', '2020-08-24 08:58:47', NULL),
('ccb20e87-d4be-4241-80a8-bd46900e369c', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":22}', '2020-08-11 06:03:46', '2020-08-11 05:51:09', '2020-08-11 06:03:46', NULL),
('dfd6a266-361b-4092-ad2d-ab9e43f057b5', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":50}', NULL, '2023-01-08 23:59:35', '2023-01-08 23:59:35', NULL),
('e1e711ff-5827-41b5-9e1e-fccd88df7182', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":31}', '2020-08-19 01:14:30', '2020-08-15 09:04:24', '2020-08-19 01:14:30', NULL),
('e21bf8e3-2a6b-49de-9461-06094ae6b53c', 'App\\Notifications\\FeedbackNotification', 'App\\Models\\User', 32, '{\"title\":\"There is a new feedback\",\"content\":\"There is a new feedback\",\"id\":9}', '2020-08-19 01:14:27', '2020-08-17 08:52:32', '2020-08-19 01:14:27', NULL),
('e938ba80-9b46-4724-aea9-e6b67f251c93', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":29}', '2020-08-14 06:01:29', '2020-08-14 03:00:28', '2020-08-14 06:01:29', NULL),
('f2709bc2-5a1f-4562-9b7b-026a804b5f0a', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":55}', NULL, '2023-01-09 03:39:54', '2023-01-09 03:39:54', NULL),
('fb623c92-1a02-46fa-94cf-f6067d7f5555', 'App\\Notifications\\BookingNotification', 'App\\Models\\User', 19, '{\"title\":\"There is a new reservation\",\"content\":\"There is a new reservation\",\"id\":52}', NULL, '2023-01-09 03:24:36', '2023-01-09 03:24:36', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`, `deleted_at`) VALUES
('duachutthoinhe123@gmail.com', '$2y$10$PLwhZDkmD2PlQ7LNBrB3CumrlJzvZEKMqbg6kJlLqXd4WirntkEga', '2020-08-17 06:55:34', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(78, 'role-list', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(79, 'role-create', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(80, 'role-edit', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(81, 'role-delete', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(82, 'role-show', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(83, 'tag-list', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(84, 'tag-create', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(85, 'tag-edit', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(86, 'tag-delete', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(87, 'tag-show', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(88, 'roomtype-list', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(89, 'roomtype-create', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(90, 'roomtype-edit', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(91, 'roomtype-delete', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(92, 'roomtype-show', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(93, 'service-list', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(94, 'service-create', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(95, 'service-edit', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(96, 'service-delete', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(97, 'service-show', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(98, 'room-list', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(99, 'room-create', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(100, 'room-edit', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(101, 'room-delete', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(102, 'room-export', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(103, 'room-show', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(104, 'user-list', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(105, 'user-edit', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(106, 'user-delete', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(107, 'user-export', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(108, 'user-show', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(109, 'admin-list', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(110, 'admin-create', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(111, 'admin-edit', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(112, 'admin-delete', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(113, 'admin-show', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(114, 'price-list', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(115, 'price-create', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(116, 'price-edit', 'admin', '2020-08-12 00:15:06', '2020-08-12 00:15:06'),
(117, 'price-delete', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(118, 'price-show', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(119, 'booking-list', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(120, 'booking-edit', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(121, 'booking-delete', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(122, 'booking-export', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(123, 'checkin-checkout-list', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(124, 'checkin-checkout-edit', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(125, 'checkin-checkout-show', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(126, 'revenue-statistics-by-year', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(127, 'revenue-statistics-by-month', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(128, 'new-list', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(129, 'new-create', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(130, 'new-edit', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(131, 'new-delete', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(132, 'new-show', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(133, 'cost-list', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(134, 'cost-create', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(135, 'cost-edit', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(136, 'cost-delete', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(137, 'cost-show', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(138, 'feedback-list', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(139, 'feedback-reply', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(140, 'feedback-edit', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(141, 'audit-list', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(142, 'audit-show', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(143, 'vote-list', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(144, 'vote-show', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(145, 'notification-show', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07'),
(146, 'notification-showhight', 'admin', '2020-08-12 00:15:07', '2020-08-12 00:15:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `price_manager`
--

CREATE TABLE `price_manager` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent` int(11) NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `price_manager`
--

INSERT INTO `price_manager` (`id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `date`, `description`, `percent`, `isdeleted`) VALUES
(9, '2020-08-13 02:36:05', '2020-08-24 07:27:33', '2', '2', '2020-01-01', 'Holiday', 20, 0),
(10, '2020-08-13 02:36:16', '2020-08-13 02:36:16', '2', '2', '2020-02-14', 'Holiday', 5, 0),
(11, '2020-08-13 02:36:32', '2020-08-13 02:36:32', '2', '2', '2020-02-27', 'Holiday', -5, 0),
(12, '2020-08-13 02:36:54', '2020-08-24 07:27:53', '2', '2', '2020-03-08', 'Holiday', 15, 0),
(13, '2020-08-13 02:37:21', '2020-08-13 02:37:21', '2', '2', '2020-03-26', 'Holiday', -10, 0),
(14, '2020-08-13 02:37:36', '2020-08-24 07:25:54', '2', '2', '2020-09-02', 'Independence Day', 10, 0),
(15, '2020-08-13 02:37:47', '2020-08-24 07:26:53', '2', '2', '2020-09-10', 'Date of establishment of the hotel', -5, 0),
(16, '2020-08-13 02:38:00', '2020-08-24 07:27:40', '2', '2', '2020-10-01', 'Holiday', -2, 0),
(17, '2020-08-13 02:38:20', '2020-08-13 02:38:20', '2', '2', '2020-10-10', 'Holiday', -3, 0),
(18, '2020-08-13 02:38:36', '2020-08-13 02:38:36', '2', '2', '2020-10-20', 'Holiday', 3, 0),
(19, '2020-08-13 02:38:49', '2020-08-13 02:38:49', '2', '2', '2020-10-31', 'Holiday', 3, 0),
(20, '2020-08-13 02:39:04', '2020-08-13 02:39:04', '2', '2', '2020-11-09', 'Holiday', 5, 0),
(21, '2020-08-13 02:39:21', '2020-08-24 07:27:21', '2', '2', '2020-11-20', 'Holiday', 5, 0),
(22, '2020-08-13 02:39:33', '2020-08-24 06:59:36', '2', '2', '2020-08-24', 'Holiday', 10, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'Admin', 'admin', '2020-08-12 00:18:12', '2020-08-12 00:18:12'),
(7, 'Phản hồi Góp ý', 'admin', '2020-08-24 09:05:25', '2020-08-24 09:05:25'),
(8, 'Quản lý phòng, thể loại phòng', 'admin', '2020-08-24 09:07:11', '2020-08-24 09:07:11'),
(9, 'Check in & Check out', 'admin', '2020-08-24 09:10:27', '2020-08-24 09:10:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(78, 4),
(79, 4),
(80, 4),
(81, 4),
(82, 4),
(83, 4),
(83, 8),
(84, 4),
(84, 8),
(85, 4),
(85, 8),
(86, 4),
(86, 8),
(87, 4),
(87, 8),
(88, 4),
(88, 8),
(89, 4),
(89, 8),
(90, 4),
(90, 8),
(91, 4),
(91, 8),
(92, 4),
(92, 8),
(93, 4),
(93, 8),
(94, 4),
(94, 8),
(95, 4),
(95, 8),
(96, 4),
(96, 8),
(97, 4),
(97, 8),
(98, 4),
(98, 8),
(99, 4),
(99, 8),
(100, 4),
(100, 8),
(101, 4),
(101, 8),
(102, 4),
(102, 8),
(103, 4),
(103, 8),
(104, 4),
(105, 4),
(106, 4),
(107, 4),
(108, 4),
(108, 8),
(109, 4),
(110, 4),
(111, 4),
(112, 4),
(113, 4),
(114, 4),
(114, 8),
(115, 4),
(115, 8),
(116, 4),
(116, 8),
(117, 4),
(117, 8),
(118, 4),
(118, 8),
(119, 4),
(120, 4),
(121, 4),
(122, 4),
(123, 4),
(123, 9),
(124, 4),
(124, 9),
(125, 4),
(125, 9),
(126, 4),
(127, 4),
(128, 4),
(128, 8),
(129, 4),
(129, 8),
(130, 4),
(130, 8),
(131, 4),
(131, 8),
(132, 4),
(132, 8),
(133, 4),
(133, 8),
(134, 4),
(134, 8),
(135, 4),
(135, 8),
(136, 4),
(136, 8),
(137, 4),
(137, 8),
(138, 4),
(138, 7),
(139, 4),
(139, 7),
(140, 4),
(140, 7),
(141, 4),
(141, 7),
(142, 4),
(143, 4),
(144, 4),
(144, 8),
(145, 4),
(146, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_type_id` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adult` int(11) NOT NULL,
  `kid` int(11) NOT NULL,
  `acreage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `views` int(11) DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `description`, `thumbnail`, `room_code`, `room_type_id`, `price`, `location`, `adult`, `kid`, `acreage`, `status`, `views`, `isdeleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(21, '01', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312080439.jpg', 'Gf9pOkAVmh', 12, 500000, '1st floor', 1, 0, '100', 0, 14, 0, '2', '2', '2020-08-13 02:48:00', '2023-01-11 04:08:46'),
(22, '02', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312161174.jpg', '5tfRTQY7fV', 12, 600000, '1st floor', 1, 1, '100', 0, 2, 0, '2', '2', '2020-08-13 02:49:21', '2023-01-09 03:22:25'),
(23, '03', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312250802.jpg', '4tQIjjtfDT', 12, 550000, '1st floor', 1, 0, '110', 0, 2, 0, '2', '2', '2020-08-13 02:50:50', '2023-01-09 03:39:09'),
(24, '04', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312325646.jpg', 'rQOaMG5nza', 12, 600000, '1st floor', 1, 1, '100', 0, 1, 0, '2', '2', '2020-08-13 02:52:05', '2023-01-09 03:47:37'),
(25, '05', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '0BkEJ2eA9G', 15, 800000, '1st floor', 1, 1, '100', 0, 1, 0, '2', '2', '2020-08-13 02:54:29', '2023-01-09 04:18:54'),
(26, '06', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'L2Y7kFVJLX', 12, 500000, '1st floor', 1, 0, '100', 0, 1, 0, '2', '2', '2020-08-13 03:12:38', '2023-01-09 04:25:26'),
(27, '07', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '1MJuy7ej41', 12, 500000, '1st floor', 1, 0, '100', 0, 2, 0, '2', '2', '2020-08-13 03:12:38', '2023-01-09 04:26:51'),
(28, '08', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '67FyFe8pU9', 12, 500000, '1st floor', 1, 0, '100', 0, 1, 0, '2', '2', '2020-08-13 03:12:38', '2023-01-10 03:01:10'),
(29, '09', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'gD6SZ02hZA', 12, 500000, '1st floor', 1, 0, '100', 0, 1, 0, '2', '2', '2020-08-13 03:12:38', '2023-01-09 00:02:30'),
(30, '10', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'iJ1przXAIj', 12, 500000, '1st floor', 1, 0, '100', 0, 1, 0, '2', '2', '2020-08-13 03:12:38', '2023-01-10 02:22:00'),
(31, '11', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'J3SoHBRQNJ', 12, 500000, '1st floor', 1, 0, '100', 0, 1, 0, '2', '2', '2020-08-13 03:12:38', '2023-01-10 02:44:19'),
(32, '12', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '0ljnRU1ymp', 12, 500000, '1st floor', 1, 0, '100', 0, 0, 0, '2', '2', '2020-08-13 03:12:38', '2020-08-13 03:12:38'),
(33, '13', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'hsVggN307I', 12, 500000, '1st floor', 1, 0, '100', 0, 1, 0, '2', '2', '2020-08-13 03:12:38', '2023-01-10 03:53:47'),
(34, '14', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'yRN3rRDQsy', 12, 500000, '1st floor', 1, 0, '100', 0, 1, 0, '2', '2', '2020-08-13 03:12:38', '2023-01-10 09:53:12'),
(35, '15', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'FQF5TySOQr', 12, 500000, '1st floor', 1, 0, '100', 0, 0, 0, '2', '2', '2020-08-13 03:12:38', '2020-08-13 03:12:38'),
(36, '16', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'wszLZWvCG8', 15, 800000, '1st floor', 1, 0, '100', 0, 1, 0, '2', '2', '2020-08-13 03:15:13', '2023-01-10 03:29:17'),
(37, '17', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '13dFs5d8VQ', 15, 800000, '1st floor', 1, 0, '100', 0, 0, 0, '2', '2', '2020-08-13 03:15:13', '2020-08-13 03:15:13'),
(38, '18', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'vXNxvYJT5G', 15, 800000, '1st floor', 1, 0, '100', 0, 0, 0, '2', '2', '2020-08-13 03:15:13', '2020-08-13 03:15:13'),
(39, '19', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '46iRh2cvOE', 15, 800000, '1st floor', 1, 0, '100', 0, 0, 0, '2', '2', '2020-08-13 03:15:13', '2020-08-13 03:15:13'),
(40, '20', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'fAgTm94s0C', 15, 800000, '1st floor', 1, 0, '100', 0, 0, 0, '2', '2', '2020-08-13 03:15:13', '2020-08-13 03:15:13'),
(41, '21', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '4h0TcyTmDt', 15, 900000, '1st floor', 1, 1, '100', 0, 0, 0, '2', '2', '2020-08-13 03:15:50', '2020-08-13 03:15:50'),
(42, '22', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'JFzbTribml', 15, 900000, '1st floor', 1, 1, '100', 0, 0, 0, '2', '2', '2020-08-13 03:15:50', '2020-08-13 03:15:50'),
(43, '23', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'hg6WhQ12mt', 15, 900000, '1st floor', 1, 1, '100', 0, 0, 0, '2', '2', '2020-08-13 03:15:50', '2020-08-13 03:15:50'),
(44, '24', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '8iLjSuLYqe', 15, 900000, '1st floor', 1, 1, '100', 0, 0, 0, '2', '2', '2020-08-13 03:15:50', '2020-08-13 03:15:50'),
(45, '25', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'N5ZXWJDjpO', 15, 900000, '1st floor', 1, 1, '100', 0, 0, 0, '2', '2', '2020-08-13 03:15:50', '2020-08-13 03:15:50'),
(46, '26', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'hFZZVXNu5e', 10, 1000000, '2st floor', 2, 0, '100', 0, 5, 0, '2', '2', '2020-08-13 03:17:18', '2023-01-09 00:01:56'),
(47, '27', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'geWf2rNMRS', 10, 1000000, '2st floor', 2, 0, '100', 0, 1, 0, '2', '2', '2020-08-13 03:17:18', '2020-08-14 05:24:33'),
(48, '28', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'Kk8WfxPDPO', 10, 1000000, '2st floor', 2, 0, '100', 0, 0, 0, '2', '2', '2020-08-13 03:17:18', '2020-08-13 03:17:18'),
(49, '29', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'kFXUgReZVt', 10, 1000000, '2st floor', 2, 0, '100', 0, 0, 0, '2', '2', '2020-08-13 03:17:18', '2020-08-13 03:17:18'),
(50, '30', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'JIGx8LrQRT', 10, 1000000, '2st floor', 2, 0, '100', 0, 1, 0, '2', '2', '2020-08-13 03:17:18', '2023-01-09 00:02:20'),
(51, '31', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'KP1f9Wz3rf', 10, 1100000, '2st floor', 2, 1, '100', 0, 1, 0, '2', '2', '2020-08-13 03:18:05', '2020-08-23 05:52:07'),
(52, '32', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'rILjdt7p4E', 10, 1100000, '2st floor', 2, 1, '100', 0, 0, 0, '2', '2', '2020-08-13 03:18:05', '2020-08-13 03:18:05'),
(53, '33', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '4DyJ8GUQs9', 10, 1100000, '2st floor', 2, 1, '100', 0, 0, 0, '2', '2', '2020-08-13 03:18:05', '2020-08-13 03:18:05'),
(54, '34', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'PjngNKgW8G', 10, 1100000, '2st floor', 2, 1, '100', 0, 0, 0, '2', '2', '2020-08-13 03:18:05', '2020-08-13 03:18:05'),
(55, '35', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'prwPSyX0tK', 10, 1100000, '2st floor', 2, 1, '100', 0, 1, 0, '2', '2', '2020-08-13 03:18:05', '2020-08-24 08:11:11'),
(56, '36', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'r5SRNYXkvY', 11, 1500000, '2st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:19:11', '2020-08-13 03:19:11'),
(57, '37', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '5TdPTBMyTo', 11, 1500000, '2st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:19:11', '2020-08-13 03:19:11'),
(58, '38', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'mpPRo6Almw', 11, 1500000, '2st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:19:11', '2020-08-13 03:19:11'),
(59, '39', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'Cb4JrrGF4w', 11, 1500000, '2st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:19:11', '2020-08-13 03:19:11'),
(60, '40', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'N55JJ0cFGQ', 11, 1500000, '2st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:19:11', '2020-08-13 03:19:11'),
(61, '41', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'yTpdgruAhk', 11, 1700000, '2st floor', 2, 1, '150', 0, 0, 0, '2', '2', '2020-08-13 03:19:56', '2020-08-13 03:19:56'),
(62, '42', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'O6tTCJN2go', 11, 1700000, '2st floor', 2, 1, '150', 0, 0, 0, '2', '2', '2020-08-13 03:19:56', '2020-08-13 03:19:56'),
(63, '43', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'n11znnChdi', 11, 1700000, '2st floor', 2, 1, '150', 0, 0, 0, '2', '2', '2020-08-13 03:19:56', '2020-08-13 03:19:56'),
(64, '44', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'PlwWqgdvNE', 11, 1700000, '2st floor', 2, 1, '150', 0, 0, 0, '2', '2', '2020-08-13 03:19:56', '2020-08-13 03:19:56'),
(65, '45', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'Nn70xZikcw', 11, 1700000, '2st floor', 2, 1, '150', 0, 0, 0, '2', '2', '2020-08-13 03:19:56', '2020-08-13 03:19:56'),
(66, '46', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'yM85As0YXy', 13, 1600000, '2st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:21:24', '2020-08-13 03:21:24'),
(67, '47', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'OkxClm5mIr', 13, 1600000, '2st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:21:24', '2020-08-13 03:21:24'),
(68, '48', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '87c73SD1I7', 13, 1600000, '2st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:21:24', '2020-08-13 03:21:24'),
(69, '49', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'XSR03z4AUU', 13, 1600000, '2st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:21:24', '2020-08-13 03:21:24'),
(70, '50', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'Ssy5Slms9y', 13, 1600000, '2st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:21:24', '2020-08-13 03:21:24'),
(71, '51', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'jOdEx7rDUc', 13, 1650000, '2st floor', 2, 1, '150', 0, 0, 0, '2', '2', '2020-08-13 03:21:58', '2020-08-13 03:21:58'),
(72, '52', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'UMVi60Y0I2', 13, 1650000, '2st floor', 2, 1, '150', 0, 0, 0, '2', '2', '2020-08-13 03:21:58', '2020-08-13 03:21:58'),
(73, '53', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'ZYnx0IrNub', 13, 1650000, '2st floor', 2, 1, '150', 0, 0, 0, '2', '2', '2020-08-13 03:21:58', '2020-08-13 03:21:58'),
(74, '54', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'zDcxETRRJO', 13, 1650000, '2st floor', 2, 1, '150', 0, 0, 0, '2', '2', '2020-08-13 03:21:58', '2020-08-13 03:21:58'),
(75, '55', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'QF8HXNomUU', 13, 1650000, '2st floor', 2, 1, '150', 0, 0, 0, '2', '2', '2020-08-13 03:21:58', '2020-08-13 03:21:58'),
(76, '56', 'But I must explain to you how all this mistaken idea of  of human happiness. No one rejects, dislikes, or avoids pleasure i consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'fc29nN5vbM', 14, 190000, '3st floor', 2, 0, '150', 0, 24, 0, '2', '2', '2020-08-13 03:22:55', '2020-08-24 07:22:33'),
(77, '57', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'MqTsSAkjTW', 14, 190000, '3st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:22:55', '2020-08-13 03:22:55'),
(78, '58', 'teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'x5ldEblE9P', 14, 190000, '3st floor', 2, 0, '150', 0, 0, 0, '2', '2', '2020-08-13 03:22:55', '2020-08-24 07:23:03'),
(79, '59', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '56Xf2d2le1', 14, 190000, '3st floor', 2, 0, '150', 0, 2, 0, '2', '2', '2020-08-13 03:22:55', '2020-08-24 07:53:42'),
(80, '60', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'mkEQssz4j0', 14, 190000, '3st floor', 2, 0, '150', 0, 1, 0, '2', '2', '2020-08-13 03:22:55', '2020-08-16 04:43:56'),
(81, '61', 'teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure,', '2020-Aug-Mon_1598279008672.jpeg', 'agm641sIEn', 14, 195000, '3st floor', 2, 1, '200', 0, 0, 0, '2', '2', '2020-08-13 03:23:37', '2020-08-24 07:23:28'),
(82, '62', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder', '2020-Aug-Mon_1598278832550.jpeg', 'PnlyWIrSvO', 14, 195000, '3st floor', 2, 1, '200', 0, 0, 0, '2', '2', '2020-08-13 03:23:37', '2020-08-24 07:20:32'),
(83, '63', 'But I must explain to you how all this mistaken idea of , the master-builder of human happiness. No one rejects, dislikes, or rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', 'MQDiQfWHzn', 14, 195000, '3st floor', 2, 1, '200', 0, 0, 0, '2', '2', '2020-08-13 03:23:37', '2020-08-24 07:21:15'),
(84, '64', 'But I must explain to you how all this mistaken idea of itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Mon_1598278903707.jpeg', 's8osvDc5nH', 14, 195000, '3st floor', 2, 1, '200', 0, 0, 0, '2', '2', '2020-08-13 03:23:37', '2020-08-24 07:21:43'),
(85, '65', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', '2020-Aug-Thu_1597312469554.jpg', '0nsFrjVQEl', 14, 195000, '3st floor', 2, 1, '200', 0, 0, 0, '2', '2', '2020-08-13 03:23:37', '2020-08-13 03:23:37'),
(86, '85', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', '2020-Aug-Mon_1597655720525.jpeg', 'e8QDlpwnyc', 10, 500000, '3st floor', 1, 2, '200', 0, NULL, 0, '2', '2', '2020-08-17 02:15:20', '2020-08-18 01:06:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_images`
--

CREATE TABLE `room_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `room_images`
--

INSERT INTO `room_images` (`id`, `image_name`, `room_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(22, '2020-Aug-Thu_1597312080522.jpg', 21, NULL, NULL, '2020-08-13 02:48:00', '2020-08-13 02:48:00'),
(23, '2020-Aug-Thu_1597312080542.jpg', 21, NULL, NULL, '2020-08-13 02:48:00', '2020-08-13 02:48:00'),
(24, '2020-Aug-Thu_1597312080549.jpg', 21, NULL, NULL, '2020-08-13 02:48:00', '2020-08-13 02:48:00'),
(25, '2020-Aug-Thu_1597312161251.jpg', 22, NULL, NULL, '2020-08-13 02:49:21', '2020-08-13 02:49:21'),
(26, '2020-Aug-Thu_1597312161260.jpg', 22, NULL, NULL, '2020-08-13 02:49:21', '2020-08-13 02:49:21'),
(27, '2020-Aug-Thu_1597312161267.jpg', 22, NULL, NULL, '2020-08-13 02:49:21', '2020-08-13 02:49:21'),
(28, '2020-Aug-Thu_1597312250870.jpg', 23, NULL, NULL, '2020-08-13 02:50:50', '2020-08-13 02:50:50'),
(29, '2020-Aug-Thu_1597312250879.jpg', 23, NULL, NULL, '2020-08-13 02:50:50', '2020-08-13 02:50:50'),
(30, '2020-Aug-Thu_1597312250886.jpg', 23, NULL, NULL, '2020-08-13 02:50:50', '2020-08-13 02:50:50'),
(31, '2020-Aug-Thu_1597312325724.jpg', 24, NULL, NULL, '2020-08-13 02:52:05', '2020-08-13 02:52:05'),
(32, '2020-Aug-Thu_1597312325734.jpg', 24, NULL, NULL, '2020-08-13 02:52:05', '2020-08-13 02:52:05'),
(33, '2020-Aug-Thu_1597312325741.jpg', 24, NULL, NULL, '2020-08-13 02:52:05', '2020-08-13 02:52:05'),
(34, '2020-Aug-Thu_1597312469637.jpg', 25, NULL, NULL, '2020-08-13 02:54:29', '2020-08-13 02:54:29'),
(35, '2020-Aug-Thu_1597312469646.jpg', 25, NULL, NULL, '2020-08-13 02:54:29', '2020-08-13 02:54:29'),
(36, '2020-Aug-Thu_1597312469653.jpg', 25, NULL, NULL, '2020-08-13 02:54:29', '2020-08-13 02:54:29'),
(37, '2020-Aug-Sun_1597577000171.jpg', 81, NULL, NULL, '2020-08-16 04:23:20', '2020-08-16 04:23:20'),
(38, '2020-Aug-Sun_1597577011235.jpeg', 81, NULL, NULL, '2020-08-16 04:23:31', '2020-08-16 04:23:31'),
(39, '2020-Aug-Sun_1597577011246.jpeg', 81, NULL, NULL, '2020-08-16 04:23:31', '2020-08-16 04:23:31'),
(40, '2020-Aug-Sun_1597577039772.jpg', 82, NULL, NULL, '2020-08-16 04:23:59', '2020-08-16 04:23:59'),
(41, '2020-Aug-Sun_1597577039783.jpeg', 82, NULL, NULL, '2020-08-16 04:23:59', '2020-08-16 04:23:59'),
(43, '2020-Aug-Sun_1597577069503.jpg', 83, NULL, NULL, '2020-08-16 04:24:29', '2020-08-16 04:24:29'),
(44, '2020-Aug-Sun_1597577069512.jpeg', 83, NULL, NULL, '2020-08-16 04:24:29', '2020-08-16 04:24:29'),
(45, '2020-Aug-Sun_1597577103702.jpg', 84, NULL, NULL, '2020-08-16 04:25:03', '2020-08-16 04:25:03'),
(46, '2020-Aug-Sun_1597577103709.jpeg', 84, NULL, NULL, '2020-08-16 04:25:03', '2020-08-16 04:25:03'),
(47, '2020-Aug-Sun_1597577122689.jpg', 85, NULL, NULL, '2020-08-16 04:25:22', '2020-08-16 04:25:22'),
(48, '2020-Aug-Sun_1597577122700.jpeg', 85, NULL, NULL, '2020-08-16 04:25:22', '2020-08-16 04:25:22'),
(49, '2020-Aug-Sun_1597577122707.jpeg', 85, NULL, NULL, '2020-08-16 04:25:22', '2020-08-16 04:25:22'),
(50, '2020-Aug-Sun_1597577155300.jpg', 76, NULL, NULL, '2020-08-16 04:25:55', '2020-08-16 04:25:55'),
(51, '2020-Aug-Sun_1597577155309.jpeg', 76, NULL, NULL, '2020-08-16 04:25:55', '2020-08-16 04:25:55'),
(52, '2020-Aug-Sun_1597577155316.jpeg', 76, NULL, NULL, '2020-08-16 04:25:55', '2020-08-16 04:25:55'),
(53, '2020-Aug-Sun_1597577155323.jpeg', 76, NULL, NULL, '2020-08-16 04:25:55', '2020-08-16 04:25:55'),
(54, '2020-Aug-Sun_1597577177510.jpg', 77, NULL, NULL, '2020-08-16 04:26:17', '2020-08-16 04:26:17'),
(55, '2020-Aug-Sun_1597577177519.jpeg', 77, NULL, NULL, '2020-08-16 04:26:17', '2020-08-16 04:26:17'),
(56, '2020-Aug-Sun_1597577198575.jpeg', 78, NULL, NULL, '2020-08-16 04:26:38', '2020-08-16 04:26:38'),
(57, '2020-Aug-Sun_1597577198583.jpeg', 78, NULL, NULL, '2020-08-16 04:26:38', '2020-08-16 04:26:38'),
(58, '2020-Aug-Sun_1597577242961.jpeg', 80, NULL, NULL, '2020-08-16 04:27:22', '2020-08-16 04:27:22'),
(59, '2020-Aug-Sun_1597577242971.jpeg', 80, NULL, NULL, '2020-08-16 04:27:22', '2020-08-16 04:27:22'),
(60, '2020-Aug-Sun_1597577259878.jpeg', 79, NULL, NULL, '2020-08-16 04:27:39', '2020-08-16 04:27:39'),
(61, '2020-Aug-Sun_1597577259887.jpeg', 79, NULL, NULL, '2020-08-16 04:27:39', '2020-08-16 04:27:39'),
(62, '2020-Aug-Sun_1597577259893.jpeg', 79, NULL, NULL, '2020-08-16 04:27:39', '2020-08-16 04:27:39'),
(63, '2020-Aug-Sun_1597577309124.jpeg', 71, NULL, NULL, '2020-08-16 04:28:29', '2020-08-16 04:28:29'),
(64, '2020-Aug-Sun_1597577309138.jpeg', 71, NULL, NULL, '2020-08-16 04:28:29', '2020-08-16 04:28:29'),
(65, '2020-Aug-Sun_1597577344284.jpg', 72, NULL, NULL, '2020-08-16 04:29:04', '2020-08-16 04:29:04'),
(66, '2020-Aug-Sun_1597577344295.jpeg', 72, NULL, NULL, '2020-08-16 04:29:04', '2020-08-16 04:29:04'),
(67, '2020-Aug-Sun_1597577405079.jpg', 73, NULL, NULL, '2020-08-16 04:30:05', '2020-08-16 04:30:05'),
(68, '2020-Aug-Sun_1597577405088.jpeg', 73, NULL, NULL, '2020-08-16 04:30:05', '2020-08-16 04:30:05'),
(69, '2020-Aug-Sun_1597577405096.jpeg', 73, NULL, NULL, '2020-08-16 04:30:05', '2020-08-16 04:30:05'),
(70, '2020-Aug-Sun_1597577405102.jpeg', 73, NULL, NULL, '2020-08-16 04:30:05', '2020-08-16 04:30:05'),
(71, '2020-Aug-Sun_1597577418269.jpg', 74, NULL, NULL, '2020-08-16 04:30:18', '2020-08-16 04:30:18'),
(72, '2020-Aug-Sun_1597577418279.jpeg', 74, NULL, NULL, '2020-08-16 04:30:18', '2020-08-16 04:30:18'),
(73, '2020-Aug-Sun_1597577453317.jpeg', 75, NULL, NULL, '2020-08-16 04:30:53', '2020-08-16 04:30:53'),
(74, '2020-Aug-Sun_1597577453326.jpeg', 75, NULL, NULL, '2020-08-16 04:30:53', '2020-08-16 04:30:53'),
(75, '2020-Aug-Sun_1597577465305.jpeg', 66, NULL, NULL, '2020-08-16 04:31:05', '2020-08-16 04:31:05'),
(76, '2020-Aug-Sun_1597577465314.jpeg', 66, NULL, NULL, '2020-08-16 04:31:05', '2020-08-16 04:31:05'),
(77, '2020-Aug-Sun_1597577478586.jpeg', 67, NULL, NULL, '2020-08-16 04:31:18', '2020-08-16 04:31:18'),
(78, '2020-Aug-Sun_1597577478596.jpeg', 67, NULL, NULL, '2020-08-16 04:31:18', '2020-08-16 04:31:18'),
(79, '2020-Aug-Sun_1597577478602.jpeg', 67, NULL, NULL, '2020-08-16 04:31:18', '2020-08-16 04:31:18'),
(80, '2020-Aug-Sun_1597577496743.jpeg', 68, NULL, NULL, '2020-08-16 04:31:36', '2020-08-16 04:31:36'),
(81, '2020-Aug-Sun_1597577496753.jpeg', 68, NULL, NULL, '2020-08-16 04:31:36', '2020-08-16 04:31:36'),
(82, '2020-Aug-Sun_1597577496760.jpeg', 68, NULL, NULL, '2020-08-16 04:31:36', '2020-08-16 04:31:36'),
(83, '2020-Aug-Sun_1597577519548.jpg', 69, NULL, NULL, '2020-08-16 04:31:59', '2020-08-16 04:31:59'),
(84, '2020-Aug-Sun_1597577519559.jpeg', 69, NULL, NULL, '2020-08-16 04:31:59', '2020-08-16 04:31:59'),
(85, '2020-Aug-Sun_1597577519567.jpeg', 69, NULL, NULL, '2020-08-16 04:31:59', '2020-08-16 04:31:59'),
(86, '2020-Aug-Sun_1597577519574.jpeg', 69, NULL, NULL, '2020-08-16 04:31:59', '2020-08-16 04:31:59'),
(87, '2020-Aug-Sun_1597577540575.jpeg', 70, NULL, NULL, '2020-08-16 04:32:20', '2020-08-16 04:32:20'),
(88, '2020-Aug-Sun_1597577540586.jpeg', 70, NULL, NULL, '2020-08-16 04:32:20', '2020-08-16 04:32:20'),
(89, '2020-Aug-Sun_1597577540592.jpeg', 70, NULL, NULL, '2020-08-16 04:32:20', '2020-08-16 04:32:20'),
(90, '2020-Aug-Sun_1597577550373.jpeg', 61, NULL, NULL, '2020-08-16 04:32:30', '2020-08-16 04:32:30'),
(91, '2020-Aug-Sun_1597577550383.jpeg', 61, NULL, NULL, '2020-08-16 04:32:30', '2020-08-16 04:32:30'),
(92, '2020-Aug-Sun_1597577563371.jpg', 62, NULL, NULL, '2020-08-16 04:32:43', '2020-08-16 04:32:43'),
(93, '2020-Aug-Sun_1597577563380.jpeg', 62, NULL, NULL, '2020-08-16 04:32:43', '2020-08-16 04:32:43'),
(94, '2020-Aug-Sun_1597577563387.jpeg', 62, NULL, NULL, '2020-08-16 04:32:43', '2020-08-16 04:32:43'),
(95, '2020-Aug-Sun_1597577563394.jpeg', 62, NULL, NULL, '2020-08-16 04:32:43', '2020-08-16 04:32:43'),
(96, '2020-Aug-Sun_1597577575181.jpeg', 63, NULL, NULL, '2020-08-16 04:32:55', '2020-08-16 04:32:55'),
(97, '2020-Aug-Sun_1597577575189.jpeg', 63, NULL, NULL, '2020-08-16 04:32:55', '2020-08-16 04:32:55'),
(98, '2020-Aug-Sun_1597577584960.jpeg', 64, NULL, NULL, '2020-08-16 04:33:04', '2020-08-16 04:33:04'),
(99, '2020-Aug-Sun_1597577584971.jpeg', 64, NULL, NULL, '2020-08-16 04:33:04', '2020-08-16 04:33:04'),
(100, '2020-Aug-Sun_1597577593111.jpg', 64, NULL, NULL, '2020-08-16 04:33:13', '2020-08-16 04:33:13'),
(101, '2020-Aug-Sun_1597577593120.jpeg', 64, NULL, NULL, '2020-08-16 04:33:13', '2020-08-16 04:33:13'),
(102, '2020-Aug-Sun_1597577593127.jpeg', 64, NULL, NULL, '2020-08-16 04:33:13', '2020-08-16 04:33:13'),
(103, '2020-Aug-Sun_1597577593134.jpeg', 64, NULL, NULL, '2020-08-16 04:33:13', '2020-08-16 04:33:13'),
(104, '2020-Aug-Sun_1597577603573.jpg', 65, NULL, NULL, '2020-08-16 04:33:23', '2020-08-16 04:33:23'),
(105, '2020-Aug-Sun_1597577603582.jpeg', 65, NULL, NULL, '2020-08-16 04:33:23', '2020-08-16 04:33:23'),
(106, '2020-Aug-Sun_1597577611532.jpeg', 65, NULL, NULL, '2020-08-16 04:33:31', '2020-08-16 04:33:31'),
(107, '2020-Aug-Sun_1597577611540.jpeg', 65, NULL, NULL, '2020-08-16 04:33:31', '2020-08-16 04:33:31'),
(108, '2020-Aug-Sun_1597577623299.jpeg', 56, NULL, NULL, '2020-08-16 04:33:43', '2020-08-16 04:33:43'),
(109, '2020-Aug-Sun_1597577623308.jpeg', 56, NULL, NULL, '2020-08-16 04:33:43', '2020-08-16 04:33:43'),
(110, '2020-Aug-Sun_1597577632621.jpeg', 57, NULL, NULL, '2020-08-16 04:33:52', '2020-08-16 04:33:52'),
(111, '2020-Aug-Sun_1597577632632.jpeg', 57, NULL, NULL, '2020-08-16 04:33:52', '2020-08-16 04:33:52'),
(112, '2020-Aug-Sun_1597577647884.jpeg', 58, NULL, NULL, '2020-08-16 04:34:07', '2020-08-16 04:34:07'),
(113, '2020-Aug-Sun_1597577647892.jpeg', 58, NULL, NULL, '2020-08-16 04:34:07', '2020-08-16 04:34:07'),
(114, '2020-Aug-Sun_1597577647899.jpeg', 58, NULL, NULL, '2020-08-16 04:34:07', '2020-08-16 04:34:07'),
(115, '2020-Aug-Sun_1597577665436.jpg', 59, NULL, NULL, '2020-08-16 04:34:25', '2020-08-16 04:34:25'),
(116, '2020-Aug-Sun_1597577665444.jpeg', 59, NULL, NULL, '2020-08-16 04:34:25', '2020-08-16 04:34:25'),
(117, '2020-Aug-Sun_1597577665451.jpeg', 59, NULL, NULL, '2020-08-16 04:34:25', '2020-08-16 04:34:25'),
(118, '2020-Aug-Sun_1597577665458.jpeg', 59, NULL, NULL, '2020-08-16 04:34:25', '2020-08-16 04:34:25'),
(119, '2020-Aug-Sun_1597577678868.jpeg', 60, NULL, NULL, '2020-08-16 04:34:38', '2020-08-16 04:34:38'),
(120, '2020-Aug-Sun_1597577678878.jpeg', 60, NULL, NULL, '2020-08-16 04:34:38', '2020-08-16 04:34:38'),
(121, '2020-Aug-Sun_1597577678884.jpeg', 60, NULL, NULL, '2020-08-16 04:34:38', '2020-08-16 04:34:38'),
(122, '2020-Aug-Sun_1597577742126.jpeg', 51, NULL, NULL, '2020-08-16 04:35:42', '2020-08-16 04:35:42'),
(123, '2020-Aug-Sun_1597577754394.jpg', 52, NULL, NULL, '2020-08-16 04:35:54', '2020-08-16 04:35:54'),
(124, '2020-Aug-Sun_1597577754404.jpeg', 52, NULL, NULL, '2020-08-16 04:35:54', '2020-08-16 04:35:54'),
(125, '2020-Aug-Sun_1597577754410.jpeg', 52, NULL, NULL, '2020-08-16 04:35:54', '2020-08-16 04:35:54'),
(126, '2020-Aug-Sun_1597577765011.jpeg', 53, NULL, NULL, '2020-08-16 04:36:05', '2020-08-16 04:36:05'),
(127, '2020-Aug-Sun_1597577765021.jpeg', 53, NULL, NULL, '2020-08-16 04:36:05', '2020-08-16 04:36:05'),
(128, '2020-Aug-Sun_1597577765028.jpeg', 53, NULL, NULL, '2020-08-16 04:36:05', '2020-08-16 04:36:05'),
(129, '2020-Aug-Sun_1597577778177.jpg', 54, NULL, NULL, '2020-08-16 04:36:18', '2020-08-16 04:36:18'),
(130, '2020-Aug-Sun_1597577778185.jpeg', 54, NULL, NULL, '2020-08-16 04:36:18', '2020-08-16 04:36:18'),
(131, '2020-Aug-Sun_1597577778191.jpeg', 54, NULL, NULL, '2020-08-16 04:36:18', '2020-08-16 04:36:18'),
(132, '2020-Aug-Sun_1597577778197.jpeg', 54, NULL, NULL, '2020-08-16 04:36:18', '2020-08-16 04:36:18'),
(133, '2020-Aug-Sun_1597577789963.jpeg', 55, NULL, NULL, '2020-08-16 04:36:29', '2020-08-16 04:36:29'),
(134, '2020-Aug-Sun_1597577789973.jpeg', 55, NULL, NULL, '2020-08-16 04:36:29', '2020-08-16 04:36:29'),
(135, '2020-Aug-Sun_1597577789979.jpeg', 55, NULL, NULL, '2020-08-16 04:36:29', '2020-08-16 04:36:29'),
(136, '2020-Aug-Sun_1597577804173.jpeg', 46, NULL, NULL, '2020-08-16 04:36:44', '2020-08-16 04:36:44'),
(137, '2020-Aug-Sun_1597577804182.jpeg', 46, NULL, NULL, '2020-08-16 04:36:44', '2020-08-16 04:36:44'),
(138, '2020-Aug-Sun_1597577804189.jpeg', 46, NULL, NULL, '2020-08-16 04:36:44', '2020-08-16 04:36:44'),
(139, '2020-Aug-Sun_1597577816665.jpeg', 47, NULL, NULL, '2020-08-16 04:36:56', '2020-08-16 04:36:56'),
(140, '2020-Aug-Sun_1597577816673.jpeg', 47, NULL, NULL, '2020-08-16 04:36:56', '2020-08-16 04:36:56'),
(141, '2020-Aug-Sun_1597577816679.jpeg', 47, NULL, NULL, '2020-08-16 04:36:56', '2020-08-16 04:36:56'),
(142, '2020-Aug-Sun_1597577835525.jpg', 48, NULL, NULL, '2020-08-16 04:37:15', '2020-08-16 04:37:15'),
(143, '2020-Aug-Sun_1597577835532.jpeg', 48, NULL, NULL, '2020-08-16 04:37:15', '2020-08-16 04:37:15'),
(144, '2020-Aug-Sun_1597577849962.jpg', 49, NULL, NULL, '2020-08-16 04:37:29', '2020-08-16 04:37:29'),
(145, '2020-Aug-Sun_1597577849970.jpeg', 49, NULL, NULL, '2020-08-16 04:37:29', '2020-08-16 04:37:29'),
(146, '2020-Aug-Sun_1597577849976.jpeg', 49, NULL, NULL, '2020-08-16 04:37:29', '2020-08-16 04:37:29'),
(147, '2020-Aug-Sun_1597577859564.jpeg', 50, NULL, NULL, '2020-08-16 04:37:39', '2020-08-16 04:37:39'),
(148, '2020-Aug-Sun_1597577859572.jpeg', 50, NULL, NULL, '2020-08-16 04:37:39', '2020-08-16 04:37:39'),
(149, '2020-Aug-Sun_1597577859578.jpeg', 50, NULL, NULL, '2020-08-16 04:37:39', '2020-08-16 04:37:39'),
(150, '2020-Aug-Sun_1597577877109.jpg', 41, NULL, NULL, '2020-08-16 04:37:57', '2020-08-16 04:37:57'),
(151, '2020-Aug-Sun_1597577877120.jpeg', 41, NULL, NULL, '2020-08-16 04:37:57', '2020-08-16 04:37:57'),
(152, '2020-Aug-Sun_1597577877127.jpeg', 41, NULL, NULL, '2020-08-16 04:37:57', '2020-08-16 04:37:57'),
(153, '2020-Aug-Sun_1597577877134.jpeg', 41, NULL, NULL, '2020-08-16 04:37:57', '2020-08-16 04:37:57'),
(154, '2020-Aug-Sun_1597577889043.jpeg', 42, NULL, NULL, '2020-08-16 04:38:09', '2020-08-16 04:38:09'),
(155, '2020-Aug-Sun_1597577889054.jpeg', 42, NULL, NULL, '2020-08-16 04:38:09', '2020-08-16 04:38:09'),
(157, '2020-Aug-Sun_1597577904472.jpeg', 43, NULL, NULL, '2020-08-16 04:38:24', '2020-08-16 04:38:24'),
(158, '2020-Aug-Sun_1597577904482.jpeg', 43, NULL, NULL, '2020-08-16 04:38:24', '2020-08-16 04:38:24'),
(159, '2020-Aug-Sun_1597577904488.jpeg', 43, NULL, NULL, '2020-08-16 04:38:24', '2020-08-16 04:38:24'),
(160, '2020-Aug-Sun_1597577917520.jpg', 44, NULL, NULL, '2020-08-16 04:38:37', '2020-08-16 04:38:37'),
(161, '2020-Aug-Sun_1597577917529.jpeg', 44, NULL, NULL, '2020-08-16 04:38:37', '2020-08-16 04:38:37'),
(162, '2020-Aug-Sun_1597577917535.jpeg', 44, NULL, NULL, '2020-08-16 04:38:37', '2020-08-16 04:38:37'),
(163, '2020-Aug-Sun_1597577917541.jpeg', 44, NULL, NULL, '2020-08-16 04:38:37', '2020-08-16 04:38:37'),
(164, '2020-Aug-Sun_1597577927607.jpg', 45, NULL, NULL, '2020-08-16 04:38:47', '2020-08-16 04:38:47'),
(165, '2020-Aug-Sun_1597577927615.jpeg', 45, NULL, NULL, '2020-08-16 04:38:47', '2020-08-16 04:38:47'),
(166, '2020-Aug-Sun_1597577944504.jpeg', 36, NULL, NULL, '2020-08-16 04:39:04', '2020-08-16 04:39:04'),
(167, '2020-Aug-Sun_1597577944513.jpeg', 36, NULL, NULL, '2020-08-16 04:39:04', '2020-08-16 04:39:04'),
(168, '2020-Aug-Sun_1597577959031.jpeg', 37, NULL, NULL, '2020-08-16 04:39:19', '2020-08-16 04:39:19'),
(169, '2020-Aug-Sun_1597577959039.jpeg', 37, NULL, NULL, '2020-08-16 04:39:19', '2020-08-16 04:39:19'),
(170, '2020-Aug-Sun_1597577968778.jpeg', 37, NULL, NULL, '2020-08-16 04:39:28', '2020-08-16 04:39:28'),
(171, '2020-Aug-Sun_1597577968787.jpeg', 37, NULL, NULL, '2020-08-16 04:39:28', '2020-08-16 04:39:28'),
(172, '2020-Aug-Sun_1597577968793.jpeg', 37, NULL, NULL, '2020-08-16 04:39:28', '2020-08-16 04:39:28'),
(173, '2020-Aug-Sun_1597577980682.jpeg', 38, NULL, NULL, '2020-08-16 04:39:40', '2020-08-16 04:39:40'),
(174, '2020-Aug-Sun_1597577980692.jpeg', 38, NULL, NULL, '2020-08-16 04:39:40', '2020-08-16 04:39:40'),
(175, '2020-Aug-Sun_1597577980698.jpeg', 38, NULL, NULL, '2020-08-16 04:39:40', '2020-08-16 04:39:40'),
(176, '2020-Aug-Sun_1597578007360.jpg', 39, NULL, NULL, '2020-08-16 04:40:07', '2020-08-16 04:40:07'),
(177, '2020-Aug-Sun_1597578007370.jpeg', 39, NULL, NULL, '2020-08-16 04:40:07', '2020-08-16 04:40:07'),
(178, '2020-Aug-Sun_1597578007377.jpeg', 39, NULL, NULL, '2020-08-16 04:40:07', '2020-08-16 04:40:07'),
(179, '2020-Aug-Sun_1597578007384.jpeg', 39, NULL, NULL, '2020-08-16 04:40:07', '2020-08-16 04:40:07'),
(180, '2020-Aug-Sun_1597578017443.jpg', 40, NULL, NULL, '2020-08-16 04:40:17', '2020-08-16 04:40:17'),
(181, '2020-Aug-Sun_1597578017453.jpeg', 40, NULL, NULL, '2020-08-16 04:40:17', '2020-08-16 04:40:17'),
(182, '2020-Aug-Sun_1597578017458.jpeg', 40, NULL, NULL, '2020-08-16 04:40:17', '2020-08-16 04:40:17'),
(183, '2020-Aug-Sun_1597578075373.jpg', 26, NULL, NULL, '2020-08-16 04:41:15', '2020-08-16 04:41:15'),
(184, '2020-Aug-Sun_1597578075385.jpeg', 26, NULL, NULL, '2020-08-16 04:41:15', '2020-08-16 04:41:15'),
(185, '2020-Aug-Sun_1597578075392.jpeg', 26, NULL, NULL, '2020-08-16 04:41:15', '2020-08-16 04:41:15'),
(186, '2020-Aug-Sun_1597578086695.jpg', 27, NULL, NULL, '2020-08-16 04:41:26', '2020-08-16 04:41:26'),
(187, '2020-Aug-Sun_1597578086704.jpeg', 27, NULL, NULL, '2020-08-16 04:41:26', '2020-08-16 04:41:26'),
(188, '2020-Aug-Sun_1597578086712.jpeg', 27, NULL, NULL, '2020-08-16 04:41:26', '2020-08-16 04:41:26'),
(189, '2020-Aug-Sun_1597578086719.jpeg', 27, NULL, NULL, '2020-08-16 04:41:26', '2020-08-16 04:41:26'),
(190, '2020-Aug-Sun_1597578097346.jpg', 28, NULL, NULL, '2020-08-16 04:41:37', '2020-08-16 04:41:37'),
(191, '2020-Aug-Sun_1597578097356.jpeg', 28, NULL, NULL, '2020-08-16 04:41:37', '2020-08-16 04:41:37'),
(192, '2020-Aug-Sun_1597578097362.jpeg', 28, NULL, NULL, '2020-08-16 04:41:37', '2020-08-16 04:41:37'),
(193, '2020-Aug-Sun_1597578107653.jpeg', 29, NULL, NULL, '2020-08-16 04:41:47', '2020-08-16 04:41:47'),
(194, '2020-Aug-Sun_1597578107661.jpeg', 29, NULL, NULL, '2020-08-16 04:41:47', '2020-08-16 04:41:47'),
(195, '2020-Aug-Sun_1597578107668.jpeg', 29, NULL, NULL, '2020-08-16 04:41:47', '2020-08-16 04:41:47'),
(196, '2020-Aug-Sun_1597578120259.jpeg', 30, NULL, NULL, '2020-08-16 04:42:00', '2020-08-16 04:42:00'),
(197, '2020-Aug-Sun_1597578120267.jpeg', 30, NULL, NULL, '2020-08-16 04:42:00', '2020-08-16 04:42:00'),
(198, '2020-Aug-Sun_1597578120273.jpeg', 30, NULL, NULL, '2020-08-16 04:42:00', '2020-08-16 04:42:00'),
(199, '2020-Aug-Sun_1597578131830.jpg', 31, NULL, NULL, '2020-08-16 04:42:11', '2020-08-16 04:42:11'),
(200, '2020-Aug-Sun_1597578131838.jpeg', 31, NULL, NULL, '2020-08-16 04:42:11', '2020-08-16 04:42:11'),
(201, '2020-Aug-Sun_1597578131844.jpeg', 31, NULL, NULL, '2020-08-16 04:42:11', '2020-08-16 04:42:11'),
(202, '2020-Aug-Sun_1597578131850.jpeg', 31, NULL, NULL, '2020-08-16 04:42:11', '2020-08-16 04:42:11'),
(203, '2020-Aug-Sun_1597578142886.jpeg', 32, NULL, NULL, '2020-08-16 04:42:22', '2020-08-16 04:42:22'),
(204, '2020-Aug-Sun_1597578142897.jpeg', 32, NULL, NULL, '2020-08-16 04:42:22', '2020-08-16 04:42:22'),
(205, '2020-Aug-Sun_1597578142904.jpeg', 32, NULL, NULL, '2020-08-16 04:42:22', '2020-08-16 04:42:22'),
(206, '2020-Aug-Sun_1597578153879.jpeg', 33, NULL, NULL, '2020-08-16 04:42:33', '2020-08-16 04:42:33'),
(207, '2020-Aug-Sun_1597578153889.jpeg', 33, NULL, NULL, '2020-08-16 04:42:33', '2020-08-16 04:42:33'),
(208, '2020-Aug-Sun_1597578165126.jpeg', 34, NULL, NULL, '2020-08-16 04:42:45', '2020-08-16 04:42:45'),
(209, '2020-Aug-Sun_1597578165136.jpeg', 34, NULL, NULL, '2020-08-16 04:42:45', '2020-08-16 04:42:45'),
(210, '2020-Aug-Sun_1597578176996.jpg', 35, NULL, NULL, '2020-08-16 04:42:57', '2020-08-16 04:42:57'),
(211, '2020-Aug-Sun_1597578177003.jpeg', 35, NULL, NULL, '2020-08-16 04:42:57', '2020-08-16 04:42:57'),
(212, '2020-Aug-Sun_1597578177009.jpeg', 35, NULL, NULL, '2020-08-16 04:42:57', '2020-08-16 04:42:57'),
(213, '2020-Aug-Sun_1597578177015.jpeg', 35, NULL, NULL, '2020-08-16 04:42:57', '2020-08-16 04:42:57'),
(214, '2020-Aug-Sun_1597588391903.jpeg', 81, NULL, NULL, '2020-08-16 07:33:11', '2020-08-16 07:33:11'),
(215, '2020-Aug-Sun_1597588391912.jpeg', 81, NULL, NULL, '2020-08-16 07:33:11', '2020-08-16 07:33:11'),
(216, '2020-Aug-Mon_1597655720818.jpeg', 86, NULL, NULL, '2020-08-17 02:15:20', '2020-08-17 02:15:20'),
(217, '2020-Aug-Mon_1597655720827.jpeg', 86, NULL, NULL, '2020-08-17 02:15:20', '2020-08-17 02:15:20'),
(218, '2020-Aug-Mon_1597655720833.jpeg', 86, NULL, NULL, '2020-08-17 02:15:20', '2020-08-17 02:15:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_service`
--

CREATE TABLE `room_service` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `room_service`
--

INSERT INTO `room_service` (`id`, `room_id`, `service_id`, `created_at`, `updated_at`) VALUES
(13, 21, 4, NULL, NULL),
(14, 21, 5, NULL, NULL),
(15, 21, 6, NULL, NULL),
(16, 21, 7, NULL, NULL),
(17, 21, 8, NULL, NULL),
(18, 22, 4, NULL, NULL),
(19, 22, 5, NULL, NULL),
(20, 22, 6, NULL, NULL),
(21, 22, 7, NULL, NULL),
(22, 22, 8, NULL, NULL),
(23, 22, 11, NULL, NULL),
(24, 22, 15, NULL, NULL),
(25, 23, 4, NULL, NULL),
(26, 23, 5, NULL, NULL),
(27, 23, 6, NULL, NULL),
(28, 23, 7, NULL, NULL),
(29, 23, 8, NULL, NULL),
(30, 23, 11, NULL, NULL),
(31, 24, 4, NULL, NULL),
(32, 24, 5, NULL, NULL),
(33, 24, 6, NULL, NULL),
(34, 24, 7, NULL, NULL),
(35, 24, 8, NULL, NULL),
(36, 24, 11, NULL, NULL),
(37, 25, 4, NULL, NULL),
(38, 25, 5, NULL, NULL),
(39, 25, 6, NULL, NULL),
(40, 25, 7, NULL, NULL),
(41, 25, 11, NULL, NULL),
(42, 81, 4, NULL, NULL),
(43, 81, 5, NULL, NULL),
(44, 81, 6, NULL, NULL),
(45, 82, 5, NULL, NULL),
(46, 82, 6, NULL, NULL),
(47, 82, 7, NULL, NULL),
(48, 86, 5, NULL, NULL),
(49, 86, 6, NULL, NULL),
(50, 83, 4, NULL, NULL),
(51, 83, 5, NULL, NULL),
(52, 83, 6, NULL, NULL),
(53, 83, 7, NULL, NULL),
(54, 84, 4, NULL, NULL),
(55, 84, 5, NULL, NULL),
(56, 84, 6, NULL, NULL),
(57, 84, 7, NULL, NULL),
(58, 76, 12, NULL, NULL),
(59, 76, 13, NULL, NULL),
(60, 76, 14, NULL, NULL),
(61, 78, 11, NULL, NULL),
(62, 78, 12, NULL, NULL),
(63, 78, 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_tag`
--

CREATE TABLE `room_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `room_tag`
--

INSERT INTO `room_tag` (`id`, `room_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(36, 21, 16, NULL, NULL),
(37, 21, 17, NULL, NULL),
(38, 21, 18, NULL, NULL),
(39, 21, 19, NULL, NULL),
(40, 21, 20, NULL, NULL),
(41, 22, 16, NULL, NULL),
(42, 22, 17, NULL, NULL),
(43, 22, 18, NULL, NULL),
(44, 22, 19, NULL, NULL),
(45, 22, 20, NULL, NULL),
(46, 22, 21, NULL, NULL),
(47, 22, 23, NULL, NULL),
(48, 24, 17, NULL, NULL),
(49, 24, 18, NULL, NULL),
(50, 24, 19, NULL, NULL),
(51, 24, 20, NULL, NULL),
(52, 24, 21, NULL, NULL),
(53, 25, 16, NULL, NULL),
(54, 25, 17, NULL, NULL),
(55, 25, 18, NULL, NULL),
(56, 25, 19, NULL, NULL),
(57, 25, 23, NULL, NULL),
(63, 82, 19, NULL, NULL),
(64, 86, 17, NULL, NULL),
(65, 86, 18, NULL, NULL),
(66, 82, 22, NULL, NULL),
(67, 82, 24, NULL, NULL),
(68, 83, 16, NULL, NULL),
(69, 83, 17, NULL, NULL),
(70, 83, 18, NULL, NULL),
(71, 83, 19, NULL, NULL),
(72, 84, 16, NULL, NULL),
(73, 84, 17, NULL, NULL),
(74, 84, 18, NULL, NULL),
(75, 84, 19, NULL, NULL),
(76, 76, 16, NULL, NULL),
(77, 76, 17, NULL, NULL),
(78, 76, 18, NULL, NULL),
(79, 76, 19, NULL, NULL),
(80, 78, 17, NULL, NULL),
(81, 78, 18, NULL, NULL),
(82, 78, 19, NULL, NULL),
(83, 78, 20, NULL, NULL),
(84, 78, 21, NULL, NULL),
(85, 78, 22, NULL, NULL),
(86, 78, 23, NULL, NULL),
(87, 81, 23, NULL, NULL),
(88, 81, 24, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_types`
--

CREATE TABLE `room_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `room_types`
--

INSERT INTO `room_types` (`id`, `name`, `star`, `description`, `isdeleted`, `image`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(10, 'Deluxe Double/ Twin', 4, 'Deluxe đôi / đôi, Phòng ở tối đa 2 người', 0, '2020-Aug-Thu_1597310493592.jpg', '2', '2', '2020-07-25 07:46:03', '2020-08-13 02:21:33'),
(11, 'Superior Double/ Twin', 5, 'Superior đôi /đôi, phòng ở tối đa 3 người', 0, '2020-Aug-Thu_1597310481657.jpg', '2', '2', '2020-07-25 07:48:19', '2020-08-13 02:21:21'),
(12, 'Superior single', 5, '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi \"', 0, '2020-Aug-Thu_1597310174183.jfif', '2', '2', '2020-08-13 02:16:14', '2020-08-13 02:16:14'),
(13, 'Superior double', 5, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident', 0, '2020-Aug-Thu_1597310228576.jpg', '2', '2', '2020-08-13 02:17:08', '2020-08-13 02:17:08'),
(14, 'Deluxe double', 4, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident', 0, '2020-Aug-Thu_1597310376300.jpg', '2', '2', '2020-08-13 02:19:36', '2020-08-13 02:19:36'),
(15, 'Deluxe single', 4, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident', 0, '2020-Aug-Thu_1597310458598.jpg', '2', '2', '2020-08-13 02:20:58', '2020-08-13 02:20:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `isdeleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(4, 'Wifi', 'Mạng 4g', 0, '2', '2', '2020-07-25 08:04:56', '2020-07-25 08:08:16'),
(5, 'Flat screen TV', 'TV màn hình phẳng', 0, '2', NULL, '2020-07-25 08:06:17', '2020-07-25 08:06:17'),
(6, 'Airport shuttle', 'Airport shuttle', 0, '2', NULL, '2020-07-25 08:06:42', '2020-07-25 08:06:42'),
(7, 'Non-smoking rooms', 'Non-smoking rooms', 0, '2', NULL, '2020-07-25 08:07:11', '2020-07-25 08:07:11'),
(8, 'Breakfast', 'Breakfast', 0, '2', NULL, '2020-07-25 08:07:31', '2020-07-25 08:07:31'),
(9, 'Quang1', 'Quang', 1, '2', '2', '2020-08-12 04:25:51', '2020-08-12 04:31:10'),
(10, 'Quang11', 'Quang', 1, '2', '2', '2020-08-12 04:33:33', '2020-08-12 04:33:48'),
(11, 'Transportation', 'Transfer from airport to hotel', 0, '2', '2', '2020-08-13 02:30:41', '2020-08-13 02:30:41'),
(12, 'Foreign wine', 'Foreign wine', 0, '2', '2', '2020-08-13 02:31:10', '2020-08-13 02:31:10'),
(13, 'Bathrobe', 'Bathrobe', 0, '2', '2', '2020-08-13 02:31:59', '2020-08-13 02:31:59'),
(14, 'Washing machine', 'Washing machine', 0, '2', '2', '2020-08-13 02:32:15', '2020-08-13 02:32:15'),
(15, 'Bath or Shower', 'Bath or Shower', 0, '2', '2', '2020-08-13 02:32:31', '2020-08-13 02:32:31'),
(16, 'Slippers', 'Slippers', 0, '2', '2', '2020-08-13 02:32:50', '2020-08-13 02:32:50'),
(17, 'Fan', 'Fan', 0, '2', '2', '2020-08-13 02:33:03', '2020-08-13 02:33:03'),
(18, 'Air conditioning', 'air conditioning', 0, '2', '2', '2020-08-13 02:33:17', '2020-08-13 02:33:17'),
(19, 'Clothes hanger', 'Clothes hanger', 0, '2', '2', '2020-08-13 02:33:38', '2020-08-13 02:33:38'),
(20, 'Private bathroom in room', 'Private bathroom in room', 0, '2', '2', '2020-08-13 02:34:13', '2020-08-13 02:34:13'),
(21, 'Wooden floor', 'Wooden floor', 0, '2', '2', '2020-08-13 02:34:40', '2020-08-13 02:34:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specialday_booking`
--

CREATE TABLE `specialday_booking` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `specialday_id` int(10) UNSIGNED NOT NULL,
  `percent` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`id`, `tag_name`, `slug`, `isdeleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(16, 'Pool', 'pool', 0, '2', '2', '2020-08-13 02:24:25', '2020-08-13 02:24:25'),
(17, 'Affordable', 'affordable', 0, '2', '2', '2020-08-13 02:25:35', '2020-08-13 02:25:35'),
(18, 'Silent', 'silent', 0, '2', '2', '2020-08-13 02:26:16', '2020-08-13 02:26:16'),
(19, 'Spa', 'spa', 0, '2', '2', '2020-08-13 02:26:49', '2020-08-13 02:26:49'),
(20, 'Family', 'family', 0, '2', '2', '2020-08-13 02:27:04', '2020-08-13 02:27:04'),
(21, 'Romany', 'romany', 0, '2', '2', '2020-08-13 02:27:31', '2020-08-13 02:27:31'),
(22, 'Pet', 'pet', 0, '2', '2', '2020-08-13 02:27:47', '2020-08-13 02:27:47'),
(23, 'Transportation', 'transportation', 0, '2', '2', '2020-08-13 02:28:58', '2020-08-13 02:28:58'),
(24, 'Appetizer', 'appetizer', 0, '2', '2', '2020-08-13 02:29:12', '2020-08-13 02:29:12'),
(25, 'Concert', 'concert', 0, '2', '2', '2020-08-13 02:29:31', '2020-08-13 02:29:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `isdeleted` tinyint(1) DEFAULT 0,
  `status` int(11) DEFAULT NULL,
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `password`, `gender`, `email`, `email_verified_at`, `image`, `street`, `state`, `city`, `phone`, `nationality`, `dateofbirth`, `isdeleted`, `status`, `google_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(19, 'Khách', 'Hàng', 'Khách Hàng', '$2a$12$Wk2nxW2Cy6ZdnWM4X2RGAOgU8EsdHuX.GCZ8hmGUnXXAAHb2uzVFe', '0', 'duachutthoinhe123@gmail.com', '2020-07-25 08:55:15', '2023-Jan-Mon_1673260675590.jpg', '14 Doãn uẩn', 'Khuê Mỹ Ngũ Hành Sơn', 'Đà Nẵng', '0868486885', 'VietName', '1998-08-15', 0, 0, NULL, 'EBaMRt2Gz5Oy4u5o6CrEvc0pCYvhn7MyrMAXsRnPag8ArtUmDsAEHvn7aY0R', '2020-07-25 08:54:33', '2023-01-09 03:37:55'),
(38, NULL, NULL, 'Ngô Long', NULL, NULL, 'longdinhngo98@gmail.com', '2023-01-10 02:21:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '115505770875882782065', NULL, '2023-01-10 02:21:44', '2023-01-10 02:21:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vote_booking`
--

CREATE TABLE `vote_booking` (
  `id` int(10) UNSIGNED NOT NULL,
  `star` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vote_booking`
--

INSERT INTO `vote_booking` (`id`, `star`, `title`, `comment`, `status`, `isdeleted`, `booking_id`, `created_at`, `updated_at`) VALUES
(5, 5, 'Dịch vụ tốt', 'Dịch vụ rất tốt', 0, 0, 69, '2023-01-11 04:22:45', '2023-01-11 04:22:45');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_admin_id_admin_type_index` (`user_id`,`user_type`);

--
-- Chỉ mục cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_detail_room_id_foreign` (`room_id`),
  ADD KEY `booking_detail_booking_id_foreign` (`booking_id`);

--
-- Chỉ mục cho bảng `cost_booking`
--
ALTER TABLE `cost_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cost_booking_booking_id_foreign` (`booking_id`),
  ADD KEY `cost_booking_cost_id_foreign` (`cost_id`);

--
-- Chỉ mục cho bảng `cost_overrun`
--
ALTER TABLE `cost_overrun`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `price_manager`
--
ALTER TABLE `price_manager`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_room_type_id_foreign` (`room_type_id`);

--
-- Chỉ mục cho bảng `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_images_room_id_foreign` (`room_id`);

--
-- Chỉ mục cho bảng `room_service`
--
ALTER TABLE `room_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_service_room_id_foreign` (`room_id`),
  ADD KEY `room_service_service_id_foreign` (`service_id`);

--
-- Chỉ mục cho bảng `room_tag`
--
ALTER TABLE `room_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_tag_room_id_foreign` (`room_id`),
  ADD KEY `room_tag_tag_id_foreign` (`tag_id`);

--
-- Chỉ mục cho bảng `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `specialday_booking`
--
ALTER TABLE `specialday_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialday_booking_booking_id_foreign` (`booking_id`),
  ADD KEY `specialday_booking_specialday_id_foreign` (`specialday_id`);

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vote_booking`
--
ALTER TABLE `vote_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote_booking_booking_id_foreign` (`booking_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `audits`
--
ALTER TABLE `audits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT cho bảng `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `booking_detail`
--
ALTER TABLE `booking_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `cost_booking`
--
ALTER TABLE `cost_booking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT cho bảng `cost_overrun`
--
ALTER TABLE `cost_overrun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `member`
--
ALTER TABLE `member`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT cho bảng `price_manager`
--
ALTER TABLE `price_manager`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT cho bảng `room_images`
--
ALTER TABLE `room_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT cho bảng `room_service`
--
ALTER TABLE `room_service`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `room_tag`
--
ALTER TABLE `room_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT cho bảng `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `specialday_booking`
--
ALTER TABLE `specialday_booking`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `vote_booking`
--
ALTER TABLE `vote_booking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD CONSTRAINT `booking_detail_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_detail_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `cost_booking`
--
ALTER TABLE `cost_booking`
  ADD CONSTRAINT `cost_booking_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cost_booking_cost_id_foreign` FOREIGN KEY (`cost_id`) REFERENCES `cost_overrun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `room_images`
--
ALTER TABLE `room_images`
  ADD CONSTRAINT `room_images_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `room_service`
--
ALTER TABLE `room_service`
  ADD CONSTRAINT `room_service_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `room_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `room_tag`
--
ALTER TABLE `room_tag`
  ADD CONSTRAINT `room_tag_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `room_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `specialday_booking`
--
ALTER TABLE `specialday_booking`
  ADD CONSTRAINT `specialday_booking_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specialday_booking_specialday_id_foreign` FOREIGN KEY (`specialday_id`) REFERENCES `price_manager` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `vote_booking`
--
ALTER TABLE `vote_booking`
  ADD CONSTRAINT `vote_booking_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
