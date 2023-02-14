-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2023 at 12:35 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dademd_yemdad`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'admin', '0777363554', 1, '2022-06-06-629e3f0892308.png', 'mhmdqds@gmail.com', NULL, '$2y$10$EDlQgSR4YYgpCXSUkrcc1uDdA/n8gO9hla6PJEuLMaYkfdSd.kQAK', 'qZ38LDYbmlmCn097brabfKEM1wqE9p586t7y8xu0AFgoM8E3ckhLcUHIWGgZ', '2022-05-23 04:29:58', '2022-06-07 00:53:12', 1),
(2, 'khaled', '0124663326', 1, 'def.png', 'khaled@gmail.com', NULL, '$2y$10$LfwFiPUetK.ChP7d1DjY7OPyNt8sIUXQV7OvER7sJ7hzULtj41.KK', NULL, '2022-10-29 21:01:12', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_commissions`
--

CREATE TABLE `admin_commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `percent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_commissions`
--

INSERT INTO `admin_commissions` (`id`, `percent`, `created_at`, `updated_at`) VALUES
(1, '20', '2022-12-15 08:55:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_access` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(7, 'نقاط البيع', '[\"order_management\",\"product_management\",\"pos_management\"]', 1, '2022-08-14 02:46:38', '2022-08-14 02:46:38'),
(8, 'الفروع كامل', '[\"order_management\",\"product_management\",\"marketing_section\",\"business_section\",\"user_section\",\"support_section\",\"report\",\"pos_management\"]', 1, '2022-08-14 02:47:16', '2022-08-14 02:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 212.06212068965, 0, NULL, '2022-10-16 23:31:21', 0.00, 5.00, 0.00, 0.00),
(2, 1, 0, 0, '2022-05-23 04:29:58', '2022-05-23 04:29:58', 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_logs`
--

CREATE TABLE `app_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `openAppCount` bigint(20) DEFAULT 0,
  `openAppTime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `closeAppTime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `pageName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `pageTime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `iconName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `catId` bigint(20) DEFAULT 0,
  `productId` bigint(20) DEFAULT 0,
  `productIdSeller` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sellerId` bigint(20) DEFAULT 0,
  `shopId` bigint(20) DEFAULT 0,
  `brandId` bigint(20) DEFAULT 0,
  `blogId` bigint(20) DEFAULT 0,
  `cityId` bigint(20) DEFAULT 0,
  `cartProducts` bigint(20) DEFAULT 0,
  `typLog` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `todaydate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(7, 'النكهة', '2022-05-28 20:55:15', '2022-05-28 20:55:15'),
(18, 'الكمية', '2022-05-31 22:12:14', '2022-05-31 22:12:14'),
(19, 'الحجم', '2022-05-31 22:12:24', '2022-05-31 22:12:24'),
(22, 'الكمية × الحجم × النكهه', '2022-08-29 01:27:19', '2022-08-29 01:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_purchasing` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`, `code`, `title`, `expire`, `min_purchasing`, `discount`) VALUES
(1, '2022-07-17-62d462b80677d.png', 'Main Banner', 1, '2022-05-25 14:20:05', '2022-12-15 09:28:53', 'www.emdadb2b.com', 'category', 14, '2022', 'اطلب اللي ناقص محلّك و وفّر من مختلف المنتجات وبالكمية اللي عايزها بخصم يصل الى 2% عند الطلب بـ 1000 جنيه أو أكثر استخدم كود: 2022', '2022-Dec-15', '1000', '7'),
(9, '1669394935.jpg', 'Main Banner', 1, '2022-11-26 03:48:55', '2022-11-26 03:48:55', 'discount1', 'product', NULL, '3000', 'اطلب اللي ناقص محلّك و وفّر من مختلف المنتجات وبالكمية اللي عايزها بخصم يصل الى 2% عند الطلب بـ 3000 جنيه أو أكثر استخدم كود: GO113', '2022-Nov-30', '3000', '60'),
(10, '1671057086.jpg', 'Main Banner', 1, '2022-12-15 09:31:26', '2022-12-15 09:31:26', 'khaled', 'category', 14, '2030', 'نورتنا', '2022-Dec-17', '1000', '8'),
(11, '1671916775.jpg', 'Main Banner', 1, '2022-12-25 08:19:35', '2022-12-25 08:19:35', 'khaled.com', 'product', 9, '2026', 'تجريبي', '2022-12-31', '500', '5'),
(12, '1671918681.jpg', 'Main Banner', 1, '2022-12-25 08:51:21', '2022-12-25 08:51:21', 'test', 'product', 12, '45464', 'test', '2022-12-30', '5000', '60');

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branche`
--

CREATE TABLE `branche` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `branche_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_branche_id` int(11) DEFAULT 0,
  `store_id` bigint(20) DEFAULT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `city_name` varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `state_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `seller_id` bigint(20) NOT NULL,
  `branche_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_home` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_phone` int(12) DEFAULT NULL,
  `menager_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branche_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `set_default` int(11) NOT NULL DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `status_seller` int(11) DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `map` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_delivery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sound` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whats_app_alert` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branche`
--

INSERT INTO `branche` (`id`, `user_id`, `branche_name`, `main_branche_id`, `store_id`, `shop_name`, `shop_id`, `city_id`, `city_name`, `state_id`, `state_name`, `country_id`, `seller_id`, `branche_address`, `phone_home`, `phone_mobile`, `manager_name`, `manager_phone`, `menager_password`, `email`, `branche_info`, `branch_photo`, `identity_number`, `identity_type`, `identity_image`, `longitude`, `latitude`, `set_default`, `status`, `status_seller`, `is_active`, `created_at`, `updated_at`, `map`, `default_delivery`, `order_sound`, `whats_app_alert`) VALUES
(1, 9, 'فرع عدن', 0, 5, 'محلات المقري لتجارة وتسويق الأسمنت', 5, 2, 'الوحدة', 4079, 'ذمار', 243, 9, 'gfdssssssgs', '4353', '5444442', 'ali ada', NULL, '12354', NULL, '<p>gssssssssssfs</p>', NULL, NULL, 'passport', '[\"2022-05-25-628e2a4425547.png\"]', NULL, NULL, 0, 1, NULL, 1, '2022-01-07 01:10:33', '2022-01-07 01:10:33', NULL, NULL, NULL, NULL),
(2, 9, 'فرع صنعاء', 0, 6, 'عمران للخرسانة الجاهزة', 6, 2, 'الوحدة', 4077, 'عدن', 243, 9, '85555555', '85555555', '85555555', 'fdsss', NULL, 'dsfaa', NULL, '<p>85555555<br></p>', NULL, NULL, 'passport', '[\"2022-05-25-628e2a4425547.png\"]', NULL, NULL, 0, 1, NULL, 1, '2022-01-07 01:15:24', '2022-01-07 01:15:24', NULL, NULL, NULL, NULL),
(3, 9, 'فرع عدن', 0, 4, 'محلات الحاوري لتجارة وتسويق الأسمنت', 4, 2, 'الوحدة', 4078, 'أبين', 243, 9, '077', '077', '077', 'fddsa', NULL, 'sdaf', NULL, '<p>077<br></p>', NULL, NULL, 'passport', '[\"2022-05-25-628e2a4425547.png\"]', NULL, NULL, 0, 1, NULL, 1, '2022-01-07 01:17:09', '2022-01-07 01:17:09', NULL, NULL, NULL, NULL),
(4, 57, 'فرع حجه', 3, 20, 'موسسة الغراسي للتجارة-UG', 56, 1, 'السبعين', 4077, 'عدن', NULL, 9, '121212121', '121212121', '+967121212121', 'احمد عبده', NULL, '121212121', NULL, '<p>121212121<br></p>', NULL, NULL, 'passport', '[\"2022-05-25-628e2a4425547.png\"]', NULL, NULL, 0, 1, NULL, 1, '2022-01-08 00:45:15', '2022-02-18 01:15:01', NULL, NULL, NULL, NULL),
(5, 57, 'فرع عدن', 3, 20, 'موسسة الغراسي للتجارة-UG', 56, 2, 'الوحدة', 4077, 'عدن', 243, 71, '121212122', '121212122', '+967121212122', 'اسماعيل', NULL, '3424', NULL, '<p>121212122<br></p>', NULL, NULL, 'passport', '[\"2022-05-25-628e2a4425547.png\"]', NULL, NULL, 0, 1, NULL, 1, '2022-01-08 02:04:07', '2022-01-08 02:04:07', NULL, NULL, NULL, NULL),
(6, 57, 'فرع عدن', 3, 20, 'موسسة الغراسي للتجارة-UG', 56, 4, 'بني الحارث', 4077, NULL, 243, 26, '456456456', '456456456', '+967+967456456456', 'هيثم', 967, '456456456', NULL, '<p>456456456<br></p>', NULL, NULL, 'passport', '[\"2022-05-25-628e2a4425547.png\"]', NULL, NULL, 0, 1, NULL, 1, '2022-01-09 19:17:41', '2022-01-09 19:17:41', NULL, NULL, NULL, NULL),
(7, 83, 'المفلحي للتجار فرع تعز', 82, 26, 'المفلحي للتجار الادارة العامة', 26, 48436, 'التعزية', 4090, 'تعز', 243, 34, 'عصيفرة', '777444111', '+967777444111', '777444111', 2147483647, '777444111', NULL, 'عصيفره&nbsp;', '625', NULL, 'passport', '[\"2022-05-25-628e2a4425547.png\"]', NULL, NULL, 0, 1, 1, 1, '2022-02-18 01:42:20', '2022-04-27 03:26:36', NULL, NULL, NULL, NULL),
(22, 146, 'الفرع الرئيسي', 0, 146, 'ادم و شركائه', 146, 4077, NULL, NULL, NULL, 243, 146, NULL, NULL, '0120101691', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 148, 'الفرع الرئيسي', 0, 148, 'ادم و شركائه', 148, 4077, NULL, NULL, NULL, 243, 148, NULL, NULL, '0120101691', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, NULL, NULL, NULL, '35', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `seller_parent` bigint(20) DEFAULT NULL,
  `branche_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `head_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_branche_id` int(11) DEFAULT 0,
  `store_id` bigint(20) DEFAULT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `city_name` varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  `state_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint(20) NOT NULL,
  `branche_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_home` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menager_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branche_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_longitude` float DEFAULT NULL,
  `address_latitude` float DEFAULT NULL,
  `set_default` int(11) NOT NULL DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `status_seller` int(11) DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `map` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commercial_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `user_id`, `seller_parent`, `branche_name`, `head_name`, `main_branche_id`, `store_id`, `shop_name`, `shop_id`, `city_id`, `city_name`, `state_id`, `state_name`, `country_id`, `country`, `seller_id`, `branche_address`, `phone_home`, `phone_mobile`, `manager_name`, `manager_phone`, `menager_password`, `email`, `branche_info`, `branch_photo`, `identity_number`, `identity_type`, `identity_image`, `image`, `address`, `address_longitude`, `address_latitude`, `set_default`, `status`, `status_seller`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `map`, `business_type`, `business_size`, `tax_no`, `commercial_no`, `building_no`, `floor_no`, `address_details`) VALUES
(69, NULL, NULL, 'yemen d', NULL, 27, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 'Hada Post office, Sana\'a, Yemen', '', '+967777363558', '', '+967777363558', '$2y$10$mbVh34Gtkh.Hon45gFwJ.eXMYxGyHMATf0sHraRN6b52C7wVbyy/a', '967777363558@emdadb2b.com', '', '2022-08-18-62fe8dcfb4f04.png', '+967777363558', 'passport', '2022-08-18-62fe8dcfb1190.png', NULL, 'Hada Post office, Sana\'a, Yemen', 44.1805, NULL, 0, 1, 1, 1, '2022-08-15 03:17:00', '2022-08-19 02:06:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, NULL, NULL, 'yemen d', NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 'بيت بوس، A19, صنعاء‎، Yemen', '', '+967777363555', NULL, '+967777363555', '$2y$10$C/Ob48SCMdc3vlBKxYsA2uANCUge60JOpck.4J.5UHMWZc3jXie46', '967777363555@emdadb2b.com', '', '2022-08-18-62fe8da41fa36.png', '+967777363555', 'passport', '2022-08-18-62fe8da41fa36.png', NULL, 'بيت بوس، A19, صنعاء‎، Yemen', 0, 0, 0, 1, 1, 0, '2022-08-15 03:18:04', '2022-08-19 06:40:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, NULL, NULL, 'فرع صنعاء', NULL, 0, NULL, NULL, NULL, 0, 'مديرية السبعين', 0, 'صنعاء‎', NULL, NULL, 0, 'مثلث بيت بوس، Sana\'a, Yemen', '', '+96777777777', NULL, '+967777777777', '$2y$10$rtsHebteKDA5e3o8dS.uAu.Ql3CeSlZBhoW./mg1GxnOr.Kd.8nq.', '967777777777@emdadb2b.com', '', '2022-08-15-62fa962487f48.png', '+967777777777', 'passport', '2022-08-15-62fa962487f48.png', NULL, 'مثلث بيت بوس، Sana\'a, Yemen', 0, 0, 0, 1, 1, 1, '2022-08-16 01:53:24', '2022-08-19 06:01:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, NULL, NULL, 'فرع عدن', NULL, 16, NULL, NULL, NULL, NULL, NULL, 0, 'Sana\'a', NULL, NULL, 0, 'برج التحرير للإدوية، صنعاء‎، Yemen', NULL, '+967778877887', 'علي احمد', '+967778877887', '$2y$10$riuORvQ4m.qawbm/B0KM8u4j2nshjK7X4hVmt0ABRNdj.eBdMWsnm', '967778877887@emdadb2b.com', NULL, '2022-08-18-62fe8f3028fa5.png', '+967778877887', 'passport', '2022-08-18-62fe8f3028fa5.png', NULL, 'برج التحرير للإدوية، صنعاء‎، Yemen', 0, 0, 0, 1, 1, 1, '2022-08-19 02:12:48', '2022-08-19 06:00:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, NULL, NULL, 'صنعاء', 'شركة بي إم سي المحضار وشركاؤه للتجارة المحدودة', 0, NULL, 'شركة بي إم سي المحضار وشركاؤه للتجارة المحدودة', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 'اليمن', NULL, '+967علي', 'علي', '+967777794438', '$2y$10$EqtK6NeaweYQ8ZNSslR1heRBg7P51.BkKT.L/TFgohlAUR9BmY7EO', '777794438@emdadb2b.com', NULL, '2022-08-19-62feb3a2822e7.png', '777794438', 'passport', '[]', NULL, 'اليمن', 0, 0, 0, 1, 1, 1, '2022-08-19 04:48:18', '2022-08-19 06:42:19', '2022-08-19 06:42:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 27, NULL, 'صنعاء', 'شركة بي إم سي المحضار وشركاؤه للتجارة المحدودة', 27, NULL, 'شركة بي إم سي المحضار وشركاؤه للتجارة المحدودة', NULL, NULL, NULL, 0, NULL, NULL, NULL, 27, 'اليمن صنعاء الحصبه، صنعاء‎،، Yemen', NULL, '+967علي', 'علي', '+967777794438', '$2y$10$QEgSRsBB9pnqzvrnwfscregeyEJ6ygKIoyY8lBckeS1wI5S01reUm', '967777794438@emdadb2b.com', NULL, '2022-08-19-62feb3b0e5818.png', '+967777794438', 'passport', '2022-08-19-62feb3b0e5818.png', NULL, 'اليمن صنعاء الحصبه، صنعاء‎،، Yemen', 0, 0, 0, 1, 1, 1, '2022-08-19 04:48:33', '2022-08-19 05:56:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, NULL, NULL, 'صنعاء', 'شركة بي إم سي المحضار وشركاؤه للتجارة المحدودة', 0, NULL, 'شركة بي إم سي المحضار وشركاؤه للتجارة المحدودة', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 'اليمن صنعاء الحصبه، صنعاء‎،، Yemen', NULL, '+967علي', 'علي', '+967777794438', '$2y$10$9L9BqezlpKwbOGp13jvRaeQlQ6BfjgCiHBa/ZGFDJUfIJYtmYxPN.', '777794438@emdadb2b.com', NULL, '2022-08-19-62feb45889e8f.png', '777794438', 'passport', '2022-08-26-6308025a067f6.png', NULL, 'اليمن صنعاء الحصبه، صنعاء‎،، Yemen', 44.2146, 15.3781, 0, 1, 1, 1, '2022-08-19 04:51:20', '2022-08-19 06:42:04', '2022-08-19 06:42:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, NULL, NULL, 'عفعهخح', 'محلات محمد محمد المرح', 16, NULL, 'محلات محمد محمد المرح', NULL, NULL, NULL, 0, NULL, NULL, NULL, 16, 'صنعاء‎، Yemen', NULL, '+96788غ6عخ', '88غ6عخ', '+967777794438', '$2y$10$PCkifGU6v6kj79dqwHHvCeY3hf8tfNFgHue3Za5POVhxffgESllxa', '777794438', NULL, '2022-08-21-63029a7cd27d7.png', '777794438', 'passport', '2022-08-26-6308025a067f6.png', NULL, 'صنعاء‎، Yemen', 44.191, 15.3694, 0, 1, 1, 1, '2022-08-22 03:50:05', '2022-08-22 03:50:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 16, NULL, 'عصام', 'محلات محمد محمد المرح', 16, NULL, 'محلات محمد محمد المرح', NULL, NULL, NULL, 0, NULL, NULL, NULL, 16, 'Yemen', NULL, '+967عصام', 'عصام', '+967عصام', '$2y$10$jcwsZ9yQ90CTbrzNkbh2y.1uR9YoS1hGRrj9SbzgUnXG..CgkCPrm', 'عصام قادر', NULL, '2022-08-21-63029b3c29d74.png', 'عصام', 'passport', '2022-08-26-6308025a067f6.png', NULL, 'Yemen', 48.5164, 15.5527, 0, 1, 1, 1, '2022-08-22 03:53:16', '2022-08-22 03:53:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 16, NULL, 'عصام', 'محلات محمد محمد المرح', 16, NULL, 'محلات محمد محمد المرح', NULL, NULL, NULL, 0, NULL, NULL, NULL, 16, 'Yemen', NULL, '+967علي', 'علي', '+967777794438', '$2y$10$L8DjDSoYDzeiOMMETTjg/ePZRaWt3NocK8yqUk6rAy9UEMB4wTyCm', '777794438', NULL, '2022-08-21-63029bf8d81bf.png', '777794438', 'passport', '2022-08-26-6308025a067f6.png', NULL, 'Yemen', 48.5164, 15.5527, 0, 1, 1, 1, '2022-08-22 03:56:24', '2022-08-22 03:56:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 39, NULL, 'عصام', 'محلات محمد محمد المرح', 39, NULL, 'محلات محمد محمد المرح', NULL, NULL, NULL, 0, NULL, NULL, NULL, 39, 'Yemen', NULL, '+967علي', 'علي', '+967777794438', '$2y$10$Hfvyalz2s2hCPQt4b.fMrO3h0cHEVkSg554M8EHOjA1F8XwUUsjsy', 'ESAMQADER@gmail.com', NULL, '2022-08-21-63029c2e1487d.png', '+967777794438', 'passport', '2022-08-21-63029c2e1487d.png', NULL, 'Yemen', 0, 0, 0, 1, 1, 1, '2022-08-22 03:57:18', '2022-08-26 06:41:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 66, 33, 'المفلحي فرع الجنه', 'مياه حده', 39, NULL, 'مياه حده', NULL, NULL, 'Al Sabeen District', 0, 'Sana\'a', NULL, NULL, 39, 'بيت بوس، شارع المحافضخ، Sana\'a, Yemen', NULL, '+967محمد', 'محمد', '+967777363557', '$2y$10$dOasYKBu3QAZ9S61hgDktu7xO1YsUr677gLDYAAyprTe.kqqFD3HK', 'appsdevye@gmail.com', NULL, '2022-08-26-6308025a067f6.png', '+967777363557', 'passport', '2022-08-26-6308025a067f6.png', NULL, 'بيت بوس، شارع المحافضخ، Sana\'a, Yemen', 0, 0, 0, 1, 1, 1, '2022-08-26 06:14:34', '2022-08-26 06:53:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 39, 39, 'اليمني للتموينات الاصلي', 'مياه حده', 39, NULL, 'مياه حده', NULL, NULL, NULL, 0, 'Hadda', NULL, NULL, 0, 'حدة Saudi Arabia', NULL, '+967حاتم', 'حاتم', '+967777877788', '$2y$10$m1t9YST5deEFIciQZZr41.oW7ux1xczCxcfUMrv0OsvAEy2j8I4k2', 'bb@bb.com', NULL, '2022-08-26-63081081d1ab2.png', '+967777877788', 'passport', '2022-08-26-63081081d1ab2.png', NULL, 'حدة Saudi Arabia', 0, 0, 0, 1, 1, 1, '2022-08-26 07:14:57', '2022-08-26 07:48:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 39, 39, 'فرع عدن للتجاره', 'مياه حده', 39, NULL, 'مياه حده', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 'التحرير، صنعاء‎، Yemen', NULL, '+967الفنان', 'الفنان', '+967777444111', '$2y$10$i0ZIzpIKCZlXNr//CWDG1ep30hTn61G1PWw3qmgGmFCFTVP80odbu', 'vv@vv.com', NULL, '2022-08-26-63081219b8e64.png', '777444111', 'passport', '2022-08-26-63081219b8e64.png', NULL, 'التحرير، صنعاء‎، Yemen', 44.2066, 15.354, 0, 1, 1, 1, '2022-08-26 07:21:45', '2022-08-26 07:33:21', '2022-08-26 07:33:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 39, 39, 'فرع عدن للتجاره', 'مياه حده', 39, NULL, 'مياه حده', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 'التحرير، صنعاء‎، Yemen', NULL, '+967الفنان', 'الفنان', '+967777444111', '$2y$10$vKzmgP7aXSIGknxz2NpXEeCnkW/8bulVJ0VbUh5gGRQ4T7dZ7VpeS', 'vv@vv.com', NULL, '2022-08-26-630812e1d08ad.png', '777444111', 'passport', '2022-08-26-630812e1d08ad.png', NULL, 'التحرير، صنعاء‎، Yemen', 44.2066, 15.354, 0, 1, 1, 1, '2022-08-26 07:25:05', '2022-08-26 07:33:25', '2022-08-26 07:33:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 74, 39, 'فرع عدن للتجاره', 'مياه حده', 39, 70, 'مياه حده', 70, NULL, NULL, 0, NULL, NULL, NULL, 74, 'Yemen', NULL, '+967الفنان', 'الفنان', '+967777444111', '$2y$10$gi1hIlLm.gLGAtJfz9bfi.KGn5.6sL7qF6B9tHQGoUXhPKZWFLrS2', 'ovv@ovv.com', NULL, '2022-08-26-63081477b49ed.png', '777444111', 'passport', '2022-08-26-63081477b49ed.png', NULL, 'Yemen', 48.5164, 15.5527, 0, 1, 1, 1, '2022-08-26 07:31:52', '2022-08-26 07:31:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 75, 11, 'صنعاءughd', 'QADERFOOD', 11, 71, 'QADERFOOD', 71, NULL, NULL, 0, 'Al Hudaydah', NULL, NULL, 75, 'الحديدة، Yemen', NULL, '+967علي', 'علي', '+967701000040', '$2y$10$fJbKT78WlWvgcqPOGZdgZOC4VNGvWDfMpY5qocUIQ7Lg4ltzF5Vwu', 'qaderesam@gmail.com', NULL, '2022-08-27-630a1e909eb0d.png', '+967701000040', 'passport', '2022-08-27-630a1e909eb0d.png', NULL, 'الحديدة، Yemen', 0, 0, 0, 1, 1, 1, '2022-08-27 20:39:28', '2022-08-28 02:31:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 76, 11, 'SANAA', 'QADERFOOD', 11, 72, 'QADERFOOD', 72, NULL, NULL, 0, NULL, NULL, NULL, 76, 'عدن، Yemen', NULL, '+967ALI', 'ALI', '+967779800010', '$2y$10$5tqGkFhJ8VKjyje27klYaur0JEb0HFfGwivsROaLQl4o18OJ06n6q', 'ahmedqader@gmail.com', NULL, '2022-08-27-630a719533c82.png', '779800010', 'passport', '2022-08-27-630a719533c82.png', NULL, 'عدن، Yemen', 45.0187, 12.7855, 0, 1, 1, 1, '2022-08-28 02:33:42', '2022-08-28 02:33:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 79, 79, 'ادم جروب', NULL, 79, 75, NULL, 75, NULL, NULL, 0, NULL, NULL, NULL, 83, 'Egypt', NULL, '0124663326', 'ادم', '+967012781000', '$2y$10$j3UwBfk7lgo50hcEQ1S5aOuWrWrpMpFZYkh.9lcpTPGzNOg5L0Ive', 'khaled2022@gmail.com', NULL, '2022-11-01-636061ef61519.png', '012781000', 'passport', '2022-11-01-636061ef61519.png', '1669069020.jpg', 'Egypt', 46.8184, 24.7504, 0, 1, 1, 1, '2022-11-01 10:01:51', '2022-11-22 09:17:00', NULL, NULL, 'البقالات', '1', '123456', '123456', '10', '5', 'الجيزة'),
(98, 97, 57, 'يوسف', NULL, 57, 78, NULL, 78, NULL, NULL, 0, NULL, NULL, NULL, 97, 'المنيل‎، Old Cairo, Egypt', NULL, '+967يوسف خالد', 'يوسف خالد', '+967967777864', '$2y$10$afxYuqHRPc5BpJ8fyx4CAe/U.kko9HpVIl/4it0UvBD.f6daOtlGm', 'yousef@gmail.com', NULL, '2022-12-01-6387df1f00b36.png', '967777864', 'passport', '2022-12-01-6387df1f00b36.png', NULL, 'المنيل‎، Old Cairo, Egypt', 31.2269, 30.0214, 0, 1, 1, 1, '2022-12-01 09:54:23', '2022-12-01 09:54:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `seller_id`, `category_id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(4, 0, '14', 'بيتي', '1669397911.png', '1', '2022-11-26 02:39:25', '2022-11-26 04:38:31'),
(5, 0, '15', 'المراعي', '1669397804.png', '1', '2022-11-26 04:36:44', '2023-01-07 00:16:36'),
(6, 0, '16', 'أوكسي', '1669397976.png', '1', '2022-11-26 04:39:36', '2022-11-26 04:39:36'),
(7, 57, '14', 'حبوبة', '1669398074.png', '1', '2022-11-26 04:41:14', '2022-11-26 04:41:14'),
(8, 0, '14', 'الضحى', '1669398101.png', '1', '2022-11-26 04:41:41', '2022-11-26 04:41:41'),
(9, 0, '15', 'كوكاكولا', '1669398139.png', '1', '2022-11-26 04:42:19', '2022-11-26 04:42:19');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '8', '2020-10-11 07:43:44', '2022-05-30 21:27:09'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":false},{\"id\":2,\"name\":\"\\u0639\\u0631\\u0628\\u064a\",\"direction\":\"rtl\",\"code\":\"ye\",\"status\":1,\"default\":true}]', '2020-10-11 07:53:02', '2022-08-18 04:45:09'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2022-04-23 13:05:05'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2022-04-23 13:05:05'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'امداد اطلب من سوق الجملة', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2022-06-20-62b0d4a963f4e.png', NULL, '2022-06-21 03:12:25'),
(13, 'company_mobile_logo', '2022-06-20-62b0d4a96561a.png', NULL, '2022-06-21 03:12:25'),
(14, 'terms_condition', '<p><strong>اتفاقية الاستخدام (الشروط والأحكام)</strong></p>\r\n<p>مقدمة:</p>\r\n<ul>\r\n<li>&nbsp;تخضع جميع المنتجات التي يتم عرضها عبر منصة \"امداد\" إلى اشتراطات ومواصفات منتجيها أو موزعيها المحليين أو الدوليين، ولا تتحمل \" امداد \" أي مسؤولية تجاه الأعمال التصنيعية، أو التخزينية، أو عمليات النقل والشحن.</li>\r\n<li>بخلاف ما يقدم من ضمان من قبل المورد/ البائع- إن وجد-، لا تقدم \" امداد \" أي مسؤولية أو ضمان تجاه أي من المنتجات التي يتم توفيرها عبر المنصة، ويتفهم المستخدم طبيعة هذه التعاقدات وما يتبعها من آثار.</li>\r\n<li>&nbsp;تهدف \" امداد \" من خلال الموقع والتطبيقات إلى صناعة رحلة عميل متميزة مع التسوق الإلكتروني؛ ولذلك دونا الشروط والأحكام المتعلقة بمحطات هذه الرحلة كما يلي:</li>\r\n</ul>\r\n<p>مصطلحاتنا:</p>\r\n<ol>\r\n<li>المستخدم/ العميل: هو الشخص الذي يقوم بطلب البضائع والسلع من تطبيق / موقع \" امداد \"، ويتوجب أن يتمتع بالأهلية النظامية الكافية للقيام بهذه العملية.</li>\r\n<li>\" امداد \" أو \"نحن\" تعني شركة/&nbsp; امداد لتقنية المعلومات&nbsp;</li>\r\n<li>\"الصفحة الرئيسية\" تعني الصفحة الرئيسية للـ التطبيق / الموقع ، والتي تبين عناوين و أقسام التطبيق / الموقع والعلامات التجارية التي نقوم بتسهيل عرضها للمستخدم.</li>\r\n<li>\"الأقسام\" تعني التصنيفات الرئيسية والفرعية التي لدينا في الموقع / التطبيق.</li>\r\n<li>\"الحساب\" يعني التفاصيل الخاصة بالمستخدم وتاريخ عمليات التسوق ويتم إنشاؤه عند التسجيل للتسوق من خلال موقع أو تطبيقات \" امداد \" .</li>\r\n<li>السعر التجاري\" يعني أسعار الأصناف التي يرغب المورد / مالك السلعة بيعها به، ويعرض في منصة وتطبيقات \" امداد \" و يشمل ما يضاف إلى قيمة المنتج من مصاريف إضافية (الضرائب، ما يستجد من مصاريف...)، بخلاف مصاريف النقل.</li>\r\n<li>\"الاسترداد النقدي\" يعني المبلغ الذي يجمعه عملاء \" امداد \" في محافظهم الإلكترونية في حساب العميل على الموقع / التطبيق، ويمكن للعميل استخدام رصيد الاسترداد النقدي في محفظته الإلكترونية للدفع مقابل مشترياته في أي وقت عن طريق اختيار الدفع باستخدام هذا الرصيد بدلاً من الدفع نقدًا أو ببطاقة الائتمان.</li>\r\n</ol>\r\n<p>شروطنا:</p>\r\n<p>&zwnj;أ.&nbsp;الوصول:</p>\r\n<ol>\r\n<li>قد يتوقف الموقع/ التطبيق عن العمل لبعض الوقت في حالات الصيانة الدورية أو الطارئة، أو لأسباب قاهرة خارجة عن الإرادة.</li>\r\n<li>سيتم دورياً إصلاح الأخطاء والأعطال وفق الإمكانيات المتاحة لدى \" امداد \".</li>\r\n<li>باستخدام العميل لنوافذنا الإلكترونية، فإنه يدرك تماماً أن هذا الاستخدام يقع ضمن مسؤوليته عن التصرفات العقدية التي يقوم بإبرامها وأن الهدف الذي يستخدم من أجله \" امداد \" هدف مشروع.</li>\r\n<li>يتحمل العميل بشكل منفرد تبعات مشاركته اسم المستخدم وكلمة المرور الخاصة به في تطبيق / موقع \" امداد \" أو البريد الإلكتروني أو رمز الدخول المرسل من امداد مع أي شخص، أو منشأة، أو جهة.</li>\r\n<li>لا يحق للمستخدم إستخدام أو استغلال أي ثغرة أو أخطاء برمجية للتأثير على خدمة امداد أو الحصول على فائدة غير مقدمة بشكل صريح ويلتزم المستخدم بالتعويض عند قيامه بذلك.</li>\r\n<li>يحق لـ \" امداد \" رفض التعامل مع العميل في حال أستخدم التهديد أو العنف الجسدي أو اللفظي إتجاه أي من موظفي خدمة العملاء أو التوصيل أو أيه شخص ذو مصلحة في التعامل مع المنصة.<span dir=\"LTR\">&zwnj;</span></li>\r\n</ol>\r\n<p>ب. المحتوى:</p>\r\n<ol>\r\n<li>دون التزام بوقت أو نوع أو كمية فإن \" امداد \" تقوم بتحديث محتوى منصاتها بشكل دوري.</li>\r\n<li>يتوجب على العميل بشكل منفرد ملاحظة تاريخ التحديث &ndash; إن وجد- مع ضرورة إدراك إمكانية وجود خطأ، أو سهو.</li>\r\n<li>قد نقوم بتحديث التطبيق / الموقع من وقت لآخر، ويمكن أن يغير المحتوى في أي وقت. ومع ذلك، يرجى ملاحظة أن أي محتوى على التطبيق / الموقع قد يكون قديمًا.</li>\r\n<li>حقوق الملكية الفكرية وجميع الحقوق، على التطبيق /موقع الويب، أو أي جزء من التطبيق / الموقع، سواء كانت بواسطة \" امداد \" أو بواسطة المستخدم، أو أي طرف ثالث، مثل ما تفضله من أصناف مملوكة لـ \" امداد \".</li>\r\n<li>يدرك المستخدم المسؤولية القانونية التي تقع حال استخدامه لأي بيانات تتبع لــ \" امداد \" دون إذن مكتوب، ويتعرض لما تفرضه \" امداد \" من عقوبات جراء ذلك.</li>\r\n<li>حال وجود نظام أو تشريع يمنع \" امداد \" من امتلاك أي حقوق أو بيانات متحصلة بشكل تلقائي من استخدام الموقع/ التطبيق، فإن العميل يوافق على منح \" امداد \" كافة الصلاحيات في حدود ما يسمح به القانون لجمع واستخدام ومشاركة تلك البيانات.</li>\r\n<li>يعتبر المستخدم مسؤولًا عن حماية بياناته الشخصية، واستخدام برمجيات الحماية اللازمة والكافية من أجل ذلك.</li>\r\n</ol>\r\n<p>&zwnj;ج. التعديل:</p>\r\n<ul>\r\n<li>من وقت لآخر سنقوم بإجراء تغييرات أو تعديلات تتعلق بهذه السياسة، وضمن ما تسمح به الأنظمة المعمول بها سنقوم بإعلام المستخدم بذلك.</li>\r\n</ul>\r\n<p>&zwnj;د.&nbsp; شروط&nbsp; الشراء: سيتم تطبيق شروط الشراء المذكورة أدناه حال قيام المستخدم بالبدء بالعملية عبر الموقع/ التطبيق:</p>\r\n<ol>\r\n<li>يجب أن تكون مؤهلاً التأهيل القانوني للقيام بعملية الشراء.</li>\r\n<li>يجب أن تمتلك الأدوات اللازمة لدفع القيم النقدية بشكل مباشر أو عن طريق البطاقات والمحافظ الإلكترونية المقبولة لدى \" امداد \"، وما تفرضه من رسوم لقاء أنواع عمليات الدفع النقدية أو الإلكترونية.</li>\r\n<li>يجب معاملة بيانات الدخول بأقصى درجات السرية من قبل المستخدم لقيام المسؤولية تجاهه بمجرد استخدام الحساب التابع لتلك البيانات من قبله أو من قبل أي شخص، أو جهة، او منشأة تمكنت من الدخول إليه عن طريق بيانات الدخول الخاصة بالحساب.</li>\r\n<li>حال وصولك إلى قناعة أوليه بأن بياناتك لم تعد آمنه بالقدر الكافي، أو إذا كنت تعتقد أن شخصًا آخر قد تعرف أو يقوم باستخدام بياناتك للدخول إلى حسابك في \" امداد \"، تواصل معنا على الفور.</li>\r\n<li>يوافق المستخدم على التنازل عن حقه في الوصول إلى حسابه في \" امداد \" حال قيامها بتعليق ذلك بسبب وجود شبهة أي نشاط احتيالي، وعند وجود سوء استخدام للخدمات، أو أي سبب تعتقد \" امداد \" أنه مناسب موضوعياً لإلغاء أو تعليق الحساب.</li>\r\n<li>وصول إشعار الطلب الخاص بك دون الإشارة إلى تأكيد الطلب من قبل \" امداد \" لا يعد قبولاً منتجاً لآثاره الشرعية او النظامية، كما يحق لــ\" امداد \" إلغاء الطلب متى ما رأت أنه مناسب موضوعياً للإلغاء.</li>\r\n<li>بعض السلع/ البضائع / الخدمات قد تتطلب شروط إضافية يتم الإشارة إليها بشكل مستقل.</li>\r\n</ol>\r\n<p>فيما يتعلق بالسعر:</p>\r\n<ol>\r\n<li>سيكون سعر السلعة/ المنتج المحدد التي قمت بطلبها هو السعر الموجود على الموقع /التطبيق وقت تقديم المستخدم لطلب الشراء أو تعديله.</li>\r\n<li>يبذل الفريق في امداد ما في وسعه لتقديم أفضل خدمة ممكنة، لكن قد تحدث أخطاء أثناء تقديم معلومات عن المنتجات والأسعار من قبل تطبيق/موقع \" امداد \"</li>\r\n<li>لا يمكننا تأكيد سعر المنتج إلا بعد تقديم طلب الشراء.</li>\r\n<li>في حالة إدراج منتج بسعر غير صحيح أو بمعلومات غير صحيحة بسبب خطأ في التسعير أو معلومات المنتج، سيكون لنا الحق، وفقًا لتقديرنا المنفرد، في الاتصال بك لغرض التوجيه أو إلغاء طلب الشراء الخاص بك وإخطارك بهذا الإلغاء.</li>\r\n<li>في كل الحالات يحق ل \" امداد \" تعديل الأسعار وإبلاغك حال وجود أي تعديل.</li>\r\n<li>في حالة قبول تطبيق/ موقع \" امداد \" لطلب الشراء الخاص بك، سيتم خصم نفس القيمة من حساب بطاقة الائتمان الخاصة بك وإخطارك عن طريق البريد الإلكتروني، أو الرسائل النصية،و ستكون ملتزمًا بالدفع نقدًا عند التسليم إذا تم اختيار الدفع النقدي أو عندما لا نتمكن من الخصم من البطاقة.</li>\r\n<li>يحق لـ \" امداد \" معالجة الدفع ببطاقة الائتمان قبل إرسال المنتج الذي طلبته.</li>\r\n<li>في كل الحالات إذا توجب علينا إلغاء طلب الشراء بعد معالجة المدفوعات، سيتم إعادة المبلغ المذكور إلى حساب بطاقة الائتمان/الخصم الخاصة بك، أو قد يتم توفير رصيد دائن يودع في محفظتك أو حسابك لدى الموقع/ التطبيق.</li>\r\n<li>يوافق المستخدم على أن الأسعار وتوافر المنتجات عرضة للتغيير دون أي إشعار مسبق. علاوة على ذلك ، يستند وصف / أداء المنتجات على الكتالوج والمطبوعات الفنية التي يطبعها الموردون / الوكيل. فبالتالي، فإن الكتابة المتوفرة على كل منتج لا تنتسب إلينا وتخضع للتغيير دون إشعار مسبق.</li>\r\n<li>إضافة إلى السعر، قد يتطلب أيضًا دفع رسوم التوصيل أو التحصيل.</li>\r\n</ol>\r\n<p>فيما يتعلق بقبول طلب الشراء:</p>\r\n<ol>\r\n<li>وفقًا لقرارنا المنفرد تحتفظ \" امداد \" بالحق في رفض أو إلغاء أي طلب شراء لأي سببٍ كان.</li>\r\n<li>تقيد عمليات الشراء أحياناً أو دائماً ببعض القيود:\r\n<ol>\r\n<li>قيود الكميات المتاحة للشراء.</li>\r\n<li>قيود عدم الدقة أو الأخطاء في معلومات المنتج أو التسعير.</li>\r\n<li>المشاكل التي يتم تحديدها من قبل قسم الائتمان والاحتيال الخاص بـ \" امداد \".</li>\r\n<li>أو ما يشبهها مما نحدده حسب الاحتياج وبإرادة منفردة هي بعض الحالات التي قد تؤدي إلى إلغاء الطلب.</li>\r\n</ol>\r\n</li>\r\n<li>قد يتم طلب المزيد من المعلومات قبل قبول أي طلب شراء.</li>\r\n<li>سوف نتواصل معك إذا تم إلغاء طلبك بالكامل أو أي جزء منه. أو إذا كانت هناك حاجة إلى معلومات إضافية لقبول طلبك.</li>\r\n<li>إذا تم إلغاء طلبك بعد خصم المبلغ من بطاقة الائتمان/الخصم الخاصة بك، ستتم إعادة المبلغ المذكور إلى&nbsp; محفظتك لدى منصة \" امداد \"، وفي حال رغبتك بتحويل المبلغ لحساب بطاقة الإئتمان يتوجب على العميل إبلاغ \" امداد \" بالمبالغ المطلوب تحويلها، ويقع هذا الإبلاغ ضمن حدود مسؤوليتك، دون أدنى تحمل من \" امداد \".</li>\r\n<li>تقع على عاتق المستخدم مسؤولية التأكد من فاعلية البطاقة الإئتمانية/الخصم عند تنفيذ عملية إعادة المبلغ.</li>\r\n</ol>\r\n<p>فيما يتعلق بعدم استلام الطلب:</p>\r\n<ol>\r\n<li>في حالة عدم وجود أي شخص مخول لاستلام الطلب في الموقع المحدد من المستخدم، سينتظر السائق لمدة 10 دقائق كحد أقصى قبل مغادرة الموقع المحدد.</li>\r\n<li>سيكون تواصل السائق مع المستخدم عبر الاتصال برقم الجوال المسجل فقط.</li>\r\n</ol>\r\n<p>فيما يتعلق بتعديل الطلب:</p>\r\n<ol>\r\n<li>يحق لــ \" امداد \" عدم قبول طلبات التعديل والإلغاء، وفي حال قبول تلك الطلبات سيتوجب عليك متابعة طلبك مع فريق الدعم الفني.</li>\r\n<li>بالنظر لكيفية عمل أنظمة \" امداد \"، إذا كنت ترغب في إضافة منتجات إلى طلبك الذي قمت بتقديمه، فيمكنك إعادة الطلب عن طريق الاتصال بخدمة العملاء</li>\r\n<li>الطلبات التي يتم إلغاءها بعد تسليمها أو إلغاؤها جزئيًا أثناء التوصيل، تخضع لرسوم إلغاء تحددها \" امداد \" على ألا تزيد في حدها الأعلى عن قيمة الطلب، على أن يتم خصمها من المبلغ المسترد مقابل التسليم والمعالجة.</li>\r\n<li>يوافق المستخدم ويتنازل عن حقه بعدم الاعتراض على القرار الذي اتخذ من \" امداد \" حيال استلامه للطلبات ويقبله كما وصل إليه.</li>\r\n<li>إذا قام المستخدم بطلب أصناف و تبين أنها غير متوفرة ، يمكنه اختيار استبدالها بأقرب صنف أو إلغاء الصنف كليا.</li>\r\n</ol>\r\n<p>فيما يتعلق بنقص المخزون من السلع:</p>\r\n<ol>\r\n<li>تبذل \" امداد \" كافة الجهود لضمان التوافر الدائم للسلع، وحال نقص أو عدم وجود المنتجات فسنقدم للمستخدم خيار/ خيارات الحصول على منتج/ منتجات بديلة، أو مماثلة، أو إلغاء الصنف تمامًا أو/و استبدال المنتج بمنتج مختلف الحجم من نفس العلامة التجارية، وفي جميع الحالات إذا كان سعر المنتج البديل اعلى من سعر المنتج المطلوب يتحمل العميل الفرق، وإذا كان ارخص يتم تحصيل سعر المنتج الجديد. وإذا تم الدفع المقدم سيتم إرجاع الفرق للعميل</li>\r\n<li>تحتفظ \" امداد \" بالحق، وفقًا لتقديرها الخاص، في وضع حد لكمية الأصناف المشتراه لكل شخص/ منشأة، / أو لكل طلب.</li>\r\n<li>يمكن فرض القيود المذكورة على الطلبات المقدمة من نفس الحساب، أو نفس بطاقة الائتمان، أو طلبات الشراء التي تستخدم نفس عنوان الفواتير و/أو التوصيل. وستقدم \" امداد \" بلاغاً للعميل في حالة تطبيق ذلك.</li>\r\n<li>لــ \" امداد \" الحق في حظر البيع للموزعين أو تجار التجزئة أو الجملة، او لأي طرف ينوي إعادة بيع المنتجات.</li>\r\n</ol>\r\n<p>فيما يتعلق باستخدام البطاقات الائتمانية:</p>\r\n<ol>\r\n<li>إذا لاحظ المستخدم أن بطاقة الائتمان الخاصة به قد تم استخدامها دون موافقته، يُرجى إبلاغ \" امداد \"على الفور وبحد أقصى 8 ساعات من اكتشاف ذلك. كما يجب على المستخدم إبلاغ الجهة المصدرة لبطاقة الائتمان الخاصة به في حدود الوقت الذي وافق عليه في النظام الخاص بالبطاقة.</li>\r\n<li>في حال إضافة مبالغ في محفظتك بالخطأ عن طريق \" امداد \" يحق ل امداد &nbsp;خصم المبلغ دون الإبلاغ وإلغاء الطلب، في حال تم استخدام تلك المبالغ لدفع قيمة الطلب.&nbsp;</li>\r\n</ol>\r\n<p>فيما يتعلق بانتهاء صلاحية المنتجات:</p>\r\n<ol>\r\n<li>نؤدي دورنا بعناية في انتقاء السلع / المنتجات ذات تاريخ الصلاحية المناسب.</li>\r\n<li>يُرجى ملاحظة أن المنتجات الطازجة يكون لها مدة صلاحية محدودة.</li>\r\n<li>في حالة وجود أي صنف منتهي الصلاحية، تقتصر مسؤولية \" امداد \" على رد المبالغ المتعلقة به مع استلامه لذا يرجى ابلاغنا فورًا.</li>\r\n</ol>\r\n<p>فيما يتعلق باستخدام كوبون الخصم أو الكوبون الترويجي:</p>\r\n<ol>\r\n<li>عند تفعيل المستخدم لكوبون \" امداد \"، سيتم استبدال هذا الكوبون بكامل المبلغ فقط، بما يعني عدم السماح بالاستخدام الجزئي للكوبون.</li>\r\n<li>يسمح باستخدام كوبون واحد فقط لكل عملية شراء، أو لكل حساب، أو لأي فترة محددة من قبل \" امداد \".</li>\r\n<li>استخدام الكوبونات يكون وقت تقديم طلب الشراء فقط.</li>\r\n<li>تخضع الكوبونات لشروط تحديد المدة والكمية وغيرها.</li>\r\n<li>تتم مراجعة جميع الطلبات من قبل فريق الدعم/خدمة العملاء في \" امداد \" قبل التنفيذ.</li>\r\n<li>إذا وجد ان بعض طلبات الشراء مخالفة لأي من شروط وأحكام الموقع، سيتم تعديل طلبات الشراء وفقًا لذلك.</li>\r\n<li>ليس للكوبونات الترويجية قيمة مالية. بل هي حق خصم مشروط بما تحدده \" امداد \" عند الإعلان عنها.</li>\r\n</ol>\r\n<p>فيما يتعلق بالاسترجاع والاستبدال والشكاوى:</p>\r\n<ol>\r\n<li>عند ملاحظتك وجود عيب في المنتج عند التسليم، يحق لك رفض الاستلام ويحق لك طلب الاستبدال، أو استرداد المبالغ على أن تخضع لما يلي ذكره:</li>\r\n<li>لا يمكن استبدال جميع البضائع القابلة للتلف كاللحوم والخضروات ونحوها، ويشمل أحكام هذا البند ما تحدده \" امداد \" كبضاعة مشمولة بهذا البند.</li>\r\n<li>في حالة لم يتم شحن الطلب، في حدود ( 24 ساعة&nbsp; ) بإمكان المستخدم التعديل أو الإلغاء بدون رسوم، أما في حالة تم الشحن، سيتم تحميل العميل برسوم إعادة المنتج بشرط أنه لم يتم فتح المنتج و بقي في حالته الأصلية.</li>\r\n<li>لأية أصناف تتطلب الاستبدال أو الاسترجاع، يرجى الاتصال بخدمة العملاء لموقع وتطبيق \" امداد \" في أقرب فرصة.</li>\r\n<li>في حالة ملاحظتك لتلف ظاهر في المنتجات الواردة في طلبك/ طلباتك، يحق لك رفض قبول الطلب ويمكنك رفع شكوى حول الطلب إلى عنوان البريد الإلكتروني الآتي <span dir=\"LTR\">emdad@gmail.com</span>، أو من خلال الدعم الفني للموقع أو التطبيق.</li>\r\n<li>فيما يتعلق بالمنتجات الفردية التالفة عند نقل محتويات الطلبية، يرجى إبلاغ خدمة العملاء في غضون 24 ساعة لاسترداد المبالغ المدفوعة أو الحصول على رصيد في حسابك لدى \" امداد \".</li>\r\n<li>يرجى التأكد في كل الحالات من إرفاق طلب الشكوى بصورة للمنتج التالف كي يتم التحقق من حالة المنتج، مع مراعاة عدم فتح المنتج أو غلافه المغلق.</li>\r\n<li>قبول الشكوى من قبل فريق خدمة العملاء لدى \" امداد \"، يعني بالضرورة استغراق معالجة المبالغ المستردة النقدية أو بطاقات الائتمان 14 يوماً من أيام العمل على أوسع مفهوم ممكن خاصة عند وجود طرف ثالث، وستزيد المدة حال وجود طارئ او عطلة رسمية أو عائق تقني.</li>\r\n<li>في كل حالات الإرجاع والاستبدال يجب أن يكون المنتج في عبوته الأصلية ولن يقبل أي منتج لا يستوفي هذه الشروط وأي شرط تحدده \" امداد \".</li>\r\n</ol>\r\n<p>&zwnj;التعديل على اتفاقية الاستخدام:</p>\r\n<ol>\r\n<li>يحق لـ \" امداد \" في كل وقت تعديل اتفاقية الاستخدام دون أي سابق إخطار.</li>\r\n<li>يمكن الوصول إلى أحدث إصدار من اتفاقية الاستخدام على الصفحات الخاصة بالموقع والتطبيق في أي وقت.</li>\r\n<li>إذا كانت التعديلات على الشروط والأحكام غير مقبولة للمستخدم، يرجى التوقف عن استخدام نوافذنا الإلكترونية فوراً.</li>\r\n<li>استخدامك لخدمات \" امداد \" عبر الموقع / التطبيق يعني موافقتك والتزامك بما ورد في اتفاقية الاستخدام وأي اتفاقية تصدرها \" امداد \" لاحقاً.</li>\r\n</ol>\r\n<p>&nbsp;</p>', NULL, '2022-12-20 06:56:46'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'Copy@emdadb2b.top', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#800080\",\"secondary\":\"#800080\"}', '2020-10-11 13:53:02', '2022-07-03 01:46:26'),
(19, 'company_footer_logo', '2022-06-20-62b0d4a97bf02.png', NULL, '2022-06-21 03:12:25'),
(20, 'company_copyright_text', 'CopyRight EMDAD@2022', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=com.souqbabye.store&hl=ar&gl=US\"}', NULL, '2022-05-23 01:28:31'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=com.souqbabye.store&hl=ar&gl=US\"}', NULL, '2022-05-23 01:28:35'),
(23, 'company_fav_icon', '2022-06-20-62b0d4a97f618.png', '2020-10-11 13:53:02', '2022-06-21 03:12:25'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'AAAAVgj2yBY:APA91bGp-H-n1ghOIG4WFe8B78lVs64w4uYcCSPM9Kwmyej7cDh7hkxiMzMbtEpiF97up4Loa6Wcq-uZ6wRnqTS02aN2aYFe7tykP1zbqjlus066FVJ_O7-DmFWmmtq3zrOqzxaPXA_H', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"\\u0637\\u0644\\u0628\\u0643 \\u0645\\u0639\\u0644\\u0642 \\u0644\\u062d\\u064a\\u0646 \\u0627\\u0644\\u0645\\u0648\\u0627\\u0641\\u0642\\u0647\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"\\u062a\\u0645 \\u0627\\u0644\\u0645\\u0648\\u0627\\u0641\\u0642\\u0647 \\u0639\\u0644\\u0649 \\u0637\\u0644\\u0628\\u064a\\u062a\\u0643\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"\\u064a\\u062a\\u0645 \\u0645\\u0639\\u0627\\u0644\\u062c\\u0647 \\u0637\\u0644\\u0628\\u0643\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"\\u0637\\u0644\\u0628\\u0643 \\u0627\\u0644\\u0627\\u0646 \\u0641\\u064a \\u0637\\u0631\\u064a\\u0642\\u0647 \\u0627\\u0644\\u064a\\u0643\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"\\u062a\\u0645 \\u062a\\u0648\\u0635\\u064a\\u0644 \\u0637\\u0644\\u0628\\u0643\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\",\"ye\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"\\u062a\\u0645 \\u0627\\u0631\\u062c\\u0627\\u0639 \\u0627\\u0644\\u0637\\u0644\\u0628\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":\"1\",\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":1,\"message\":\"\\u0647\\u0644 \\u062a\\u0631\\u064a\\u062f \\u0627\\u0644\\u062a\\u0648\\u0635\\u064a\\u0644\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":1,\"message\":\"Order fa Message\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":1,\"message\":\"Order fa Message\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>سياسة الخصوصية<br />\r\nمقدمة:<br />\r\nتوضح هذه السياسة من حيث الخصوص والعموم كيفية استخدام شركة: امداد&nbsp; لتقنية المعلومات مالكة العلامة التجارية &quot; امداد&nbsp; &quot; ويشار لها لاحقاً ب (امداد&nbsp; ) للبيانات.<br />\r\nتعنى هذه السياسة بالبيانات الشخصية أو المعنوية التي يقدمها المستخدم عن نفسه أو عن منشأته (مستخدم منتجات/خدمات) امداد&nbsp; الإلكترونية بالمسمى الذي يقدمه عن نفسه والبيانات الملحقة بذلك المسمى والمتعلقة به.<br />\r\nحرصاً من &quot; امداد&nbsp; &quot; على سرية بيانات ومعلوماتك التي نطلع عليها نأمل منكم&nbsp; قراءة سياسة الخصوصية بعناية قبل استخدام أي من (منتجات/خدمات) امداد&nbsp; الإلكترونية عبر الموقع أو التطبيق الإلكتروني.<br />\r\nإن زيارة المستخدم للموقع الإلكتروني، أو طلب الخدمات عبر أي نافذة إلكترونية تابعة يعتبر موافقة على أحكام هذه السياسة وما قد يطرأ عليها من تحديثات وما يتعلق بها من سياسات أو إجراءات مستقبلية.<br />\r\nلماذا نجمع بيانات المستخدمين؟<br />\r\nنقوم بذلك من أجل تقديم خدماتنا بالشكل والمستوى اللائق بما في ذلك خدمات الموقع الإلكتروني أو التطبيقات الإلكترونية، ولكي نزودكم بكافة العروض والبيانات، التي نعتقد أنكم تهتمون بها. على أننا لا نقوم بجمع بيانات ذات أوصاف حساسة عن المستخدمين تتعلق بالتحديد العيني لشخصية المستخدم كالإسم أو الصورة الشخصية.<br />\r\n&nbsp;<br />\r\nماذا نجمع عن المستخدمين؟<br />\r\nنقوم بجمع البيانات الشخصية عند استخدام منتجاتها وخدماتها أو عند طلب المستخدم من أي من النوافذ الإلكترونية (الموقع، التطبيق، ...)، كما نستفيد من بياناتكم عند المشاركة في استطلاعات الرأي، ونستخدم -عند الاقتضاء- ملفات تعريف الارتباط في ذلك.<br />\r\nيكون لشركة امداد&nbsp; لتقنية المعلومات أو علامتها التجارية &quot; امداد&nbsp; &quot; في سبيل تقديم خدماتها ومنتجاتها لعملائها أو لأي طرف آخر الحق الكامل في جمع واستخدام ومشاركة بياناتهم الشخصية التي تحدد أوصافهم كالجنس والعمر ونحوه وموقعهم الجغرافي وأرقام هواتفهم وعناوينهم وكل ما يرتبط بهم من بيانات دون أن يكون لذلك أثر في التحديد العيني لشخصية العملاء كأسمائهم وصورهم.<br />\r\nيجوز وفقاً لأحكام هذه السياسة جمع البيانات وفقاً للطرق المشار إليها سابقاً، وعبر أي من الوسائل المتعلقة بالتسويق والإعلانات والرسائل الدعائية بمختلف أشكالها وتشتمل كذلك الرسائل التي تحمل الأخبار والفعاليات، وأنواع المراسلات الأخرى، وكل وسيلة يمكننا من خلالها جمع المعلومات للأغراض المذكورة في هذه السياسة.<br />\r\nسياستنا حول ملفات تعريف الارتباط:<br />\r\nما نقوم به من أعمال في جمع البيانات لن تؤدي في أي وقت إلى تحديد الشخصية الرئيسة للمستخدم بتفاصيلها كالإسم أو الصورة الشخصية والتي يمكن لمن يحصل عليها أن يتمكن من المعلومات الكاملة عن ذات المستخدم وشخصيته. ولكننا سوف نتتبع النوافذ الإلكترونية حتى نتعرف على أفضل الطرق لاستخدام الموقع الإلكتروني أو التطبيق الإلكتروني، بما يؤدي للتحسين والتطوير لكافة الخدمات المقدمة، ووفقاً لأحكام هذه السياسة يعد قانونيا كل ما يتم الحصول عليه من بيانات عبر استخدام ملفات تعريف الارتباط للاستخدام لاحقاً أو مستقبلاً في الخدمات التي نقوم بتطويرها أو العمل على تطويرها على أن تلك الملفات لا تحتوي على ما يفصح عن شخصية المستخدم، ولا تستخدم من أجل جمع البيانات إبتداءاً.<br />\r\nتبعاً لأحكام هذه السياسة يُعد صحيحاً ومقبولاً من قبل جميع من يتعاملون مع الشركة الحصول على البيانات الشخصية حال تقديمها من قبلهم، على أنه يكون صحيحاً ومقبولاً كذلك الحصول على البيانات المتعلقة بشتى الأمور الفنية من كافة الأجهزة الإلكترونية التي يقوم المستخدم باستخدامها عند زيارة النوافذ الإلكترونية التابعة لنا ( الموقع ، التطبيق ، ...) وتشتمل على الخصائص المتعلقة بأداء الجهاز المستخدم والمواقع الجغرافية التي يرتادها وأنظمة النقل المشتملة نوع الجهاز نوع اتصاله وطرق الدفع والسداد المستخدمة من الجهاز أو ما ألحق به من أجهزة متنقلة أو نحوها، كما أنه يشتمل على بروتوكول الاتصال بالأنترنت وما يتبعه من بيانات.<br />\r\nتبين المعلومات التي نحصل عليها من ملفات تعريف الارتباط حدود ومعالم التفاعل مع تقنيات متعددة مثل استخدام الهواتف المحمولة، والرسائل السريعة لرموز الاستجابة، والتواصل قريب المدى، على أنه لا بد من التنويه أنه في حالة عدم رغبة المستخدم في ذلك، عليه تفعيل إعدادات الجهاز الذي يقوم باستخدامه ليرفض صلاحيات ملفات تعريف الارتباط، وتكون مسؤولية ذلك على المستخدم منفرداً.<br />\r\nكيف نخزن بياناتك الشخصية:<br />\r\nنتعهد ببذل الجهد الكافي والمعقول للحفاظ على بياناتكم الشخصية لنحميها من سوء الاستخدام، أو الفقدان، أو الدخول غير المصرح به، كما أننا نعتني بعدم الكشف عنها وسنعمل على إتلاف أي بيانات شخصية لم يعد ثم حاجة إلى الإبقاء عليها ضمن أماكن تخزين البيانات لدينا.<br />\r\nوننوه دائماً إلى أن المستخدم وحده هو المسؤول عن الحفاظ على كلمات المرور الخاصة به والتي يدخل من خلالها إلى نوافذ امداد&nbsp; الإلكترونية، ونشدد دائماً على عدم مشاركة كلمة المرور أو رمز/ رموز الدخول والتوثيق المؤقتة أو الدائمة مع الآخرين لأي سبب من الأسباب.<br />\r\nونحن هنا لا نضمن أو نقدم ضماناً في أي مرحلة من مراحل التعامل معنا فيما يتعلق بتأمين سلامة البيانات الشخصية أثناء النقل أو التخزين من أي من أطراف العلاقة الخاصة بخدمات/منتجات امداد&nbsp; الإلكترونية وغيرها، والمستخدم يقر بأنه مدرك للمسؤولية التي تقع على عاتقه في الحفاظ على بياناته وعدم كشفها للغير، كما يدرك من كل الجوانب الآثار المترتبة على توضيحه وكشفه للبيانات الشخصية المتعلقة به باختياره ورضاه. وفي حال علمه بأي مخالفة لذلك يتوجب عليه ابتداءاً التواصل مع امداد&nbsp; وإخطارها.<br />\r\nيكون لنا في سبيل تقديم الخدمة المناسبة لكم حق تخزين جميع أنواع البيانات داخل الجمهورية&nbsp; وخارجها وبحدود ما يسمح به النظام.<br />\r\nكيف نستخدم ما نجمعه من بيانات:<br />\r\nيوافق المستخدمون على ما نقوم به من أعمال جمع واستخدام البيانات الشخصية بغرض تقديم خدمات/منتجات امداد&nbsp; الإلكترونية وغيرها، وأي من الخدمات الأخرى، ويوافق المستخدم تحديداً على المعلومات التي تنص بشكل صريح وتفصح بشكل واضح عن أسمائهم وعناوين تواجدهم وأرقام التواصل معهم والبريد الإلكتروني الخاص بهم وهذه البيانات وما عداها تكون متاحة لمن يصرح له من قبلنا بالاطلاع عليها بما في ذلك مقدمي الخدمات والمتعاقدين والباحثين ومسؤولي العلاقات العامة ونحوهم.<br />\r\nيوافق المستخدم كذلك على استخدام امداد&nbsp; للبيانات الشخصية في الإعلان والترويج وأغراض التسويق المباشر بهدف الترويج أو الإعلان للخدمات والسلع التي تقدمها امداد&nbsp; أو أي طرف ثالث والتي نعتقد أن المستخدم قد يهتم بها، وتجيز لنا أحكام هذه السياسة الكشف عن هذه البيانات لكافة الكيانات أو الشركات التابعة أو الشقيقة أو الأطراف الأخرى التي نستفيد من خدماتها وتؤدي لنا وظائف أو منتجات أو خدمات نيابة عنا.<br />\r\nيوافق المستخدم على قيامنا باستخدام البيانات في تطوير خدمات ومنتجات شركة امداد&nbsp; ، وتمتلك الشركة جميع الحقوق المتعلقة بها والناتجة عنها وتخضع لعمليات الدراسة والتحليل لأغراض تحسين عمليات البيع، والبحث والتطوير، وشتى الأغراض المختلفة.<br />\r\nعند انتهاء إذن الوصول الذي نحصل عليه من قبل المستخدم أو سحبه فإننا لن نملك القدرة على إعطاء أو تقديم أي خدمة للمستخدمين ونحتفظ بحق الاطلاع أو الكشف أو المشاركة للبيانات الشخصية المتعلقة بمستخدمينا متى ما كان ذلك مستنداً في نزاع قانوني قائم أو محتمل أو تعاقد مبرم أو سيتم ابرامه وما يندرج ضمن حماية الحقوق الفكرية أو ملكيتها مضمن في ذلك، أو صرحت بذلك الأنظمة المعمول على أن يكون ذلك كله خاضع لتقدير (امداد&nbsp; ) بشكل منفرد.<br />\r\nعند بيع أو تصفية العمل التجاري القائم أو الاستحواذ عليه أو دمجه يكون صحيحاً تبعاً لأحكام هذه السياسة نقل بعض أو كل البيانات الشخصية لأي طرف.&nbsp; &nbsp;<br />\r\nحقوق مطالعة البيانات:<br />\r\nنبذل ما بوسعنا لحماية البيانات الشخصية لمستخدمينا بشكلها المتكامل وتحديثاتها الدائمة، ومعلوماتها المتكاملة الصحيحة، ونتيح الفرصة دائما للمستخدم الذي يرغب في معرفة بياناته الشخصية المسجلة لدينا على أن يراعى في ذلك التوقيت المناسب وإمكانية الرد عليه وبيان استفساراته وفقاً للأنظمة الداخلية للعمل لدينا. عليه، فإن للعميل طلب معرفة البيانات الخاصة به بحيث تتم معالجة طلبه خلال مدة لا تزيد على تسعين يوماً سواء كان هذا الطلب للاستفسار أو التعديل، كما يلتزم المستخدم بتقديم ما يثبت شخصيته للحصول على ذلك وعلى أن يقوم - حسب ما تراه امداد&nbsp; مناسباً - بدفع تكاليف جمع تلك البيانات وتقديمها له. تلتزم امداد&nbsp; دائماً بالأنظمة والتشريعات المعمول بها في الاحتفاظ بالسجلات والبيانات الشخصية وتقديمها للجهات المختصة عند الطلب.<br />\r\nصلاحية التعديل على سياسة الاستخدام:<br />\r\nنحتفظ بحق التعديل لبعض أو كل جزء من أجزاء هذه السياسة على أن يتم إخطار المستخدمين بذلك وفقاً لأي من بيانات التواصل المتوفرة لدى &quot; امداد&nbsp; &quot;.<br />\r\nالنوافذ الإلكترونية التابعة والشقيقة:<br />\r\nعند احتواء نوافذنا الإلكترونية على روابط للانتقال لنوافذ إلكترونية أخرى عندئذ تطبق هذه السياسة عليها، مالم يكن للنوافذ سياسات أخرى، لذلك يجب على المستخدم مطالعة ذلك والعناية به.<br />\r\nتواصل معنا<br />\r\nكل ما ورد في هذه السياسة مما يتعلق بالاستفسار أو الاستعلام أو التعديل أو الحذف أو أي مما لم ينص عليه يكون التواصل بخصوصه عبر العنوان الآتي: legal@emdad.com</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2022-12-19 14:56:05'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'multi_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, NULL),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '1', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '1', NULL, NULL),
(54, 'country_code', 'YE', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'sellerwise_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2022-04-23 13:05:05'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":\"0\",\"public_key\":null,\"secret_key\":null,\"hash\":null}', NULL, '2022-05-30 21:26:36'),
(63, 'mercadopago', '{\"status\":\"0\",\"public_key\":null,\"access_token\":null}', NULL, '2022-05-30 21:26:23'),
(64, 'announcement', '{\"status\":\"0\",\"color\":\"#800080\",\"text_color\":\"#2b0925\",\"announcement\":null}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(67, 'seller_pos', '1', NULL, '2022-08-18 03:49:48'),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2022-04-23 13:05:05'),
(70, 'refund_day_limit', '1', NULL, NULL),
(71, 'business_mode', 'multi', NULL, '2022-05-25 14:35:46'),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '0', NULL, NULL),
(74, 'timezone', 'Asia/Kuwait', NULL, NULL),
(75, 'shop_address', 'yemen', NULL, NULL),
(76, 'billing_input_by_customer', '0', NULL, NULL),
(77, 'default_location', '{\"lat\":\"15.298104015141742\",\"lng\":\"44.22910550738825\"}', NULL, NULL),
(78, 'currency_symbol_position', 'left', '2022-05-22 22:32:02', '2022-10-06 23:31:34'),
(79, 'shop_banner', '2022-06-20-62b0d4a95f3e0.png', NULL, NULL),
(80, 'loader_gif', '2022-06-20-62b0d4a981026.png', NULL, NULL),
(81, 'map_api_key', 'AIzaSyCZ1iVO7trjsVRjoKvEFQNHvuEsyDxlYlA', NULL, NULL),
(82, 'map_api_key_server', 'AIzaSyCZ1iVO7trjsVRjoKvEFQNHvuEsyDxlYlA', NULL, NULL),
(83, '2factor_sms', '{\"status\":\"1\",\"api_key\":\"27668838-ea56-11ec-9c12-0200cd936042\"}', '2022-06-14 01:30:26', '2022-06-14 01:30:26'),
(84, 'nexmo_sms', '{\"status\":0,\"api_key\":\"c6a19afc\",\"api_secret\":\"7Ezz9mndXxmlMmGN\",\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":\"Vonage APIs\",\"otp_template\":\"Vonage\"}', '2022-06-14 01:30:27', '2022-06-14 01:30:27'),
(85, 'msg91_sms', '{\"status\":0,\"template_id\":\"MSGIND\",\"authkey\":\"219571AuhqogaI25b1a764a\"}', '2022-06-14 01:30:27', '2022-06-14 01:30:27'),
(86, 'twilio_sms', '{\"status\":0,\"sid\":\"ACfa26c6b770d41d075f7445fdaf196999\",\"token\":\"8c175de93652735d6f079fdffaaeeda9\",\"from\":\"+918309278773\",\"otp_template\":\"\\u0631\\u0645\\u0632 \\u0627\\u0644\\u062a\\u062d\\u0642\\u0642 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0643 \\u0647\\u0648\"}', '2022-06-14 01:30:26', '2022-06-14 01:30:26'),
(87, 'default_location', '{\"lat\":\"15.298104015141742\",\"lng\":\"44.22910550738825\"}', '2022-06-14 01:30:26', '2022-06-14 01:30:26'),
(88, 'map_api_key', 'AIzaSyCz0Y8y319Mr7bi-7oj4hr4haPaiNqjrLU', '2022-06-14 01:30:26', '2022-06-14 01:30:26'),
(89, 'releans_sms', '{\"status\":\"0\",\"api_key\":\"f43f33dd07f7a18bc3a696518bf27390\",\"from\":\"f43f33dd07f7a18bc3a696518bf27390\",\"otp_template\":\"0f90a1696daa8b8165d5b8cbbb5075a8 8ac6646678a04124790854d2346546a4\"}', '2022-08-24 00:35:19', '2022-08-24 00:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'الاصلي',
  `brand_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choices` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_numbers` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double DEFAULT 1,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_sub_category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `cart_group_id`, `product_id`, `product_type`, `brand_id`, `category_id`, `color`, `choices`, `variations`, `variant`, `quantity`, `price`, `unit`, `unit_numbers`, `tax`, `discount`, `slug`, `name`, `thumbnail`, `seller_id`, `seller_is`, `created_at`, `updated_at`, `shop_info`, `shipping_cost`, `shipping_type`, `total`, `sub_category_id`, `sub_sub_category_id`) VALUES
(2, 353, NULL, 9, 'كامل الدسم', '5', '14', NULL, NULL, NULL, NULL, 5, 150, 'غرام', '1000', 0, 10, '', 'حليب بالموز', '1669423850.jpg', 57, 'admin', '2023-01-01 10:14:46', '2023-01-01 10:14:46', 'موسسة الغراسي للتجارة-UG', 5.00, NULL, '0', '14', '8'),
(9, 354, NULL, 9, 'كامل الدسم', '5', '14', NULL, NULL, NULL, NULL, 10, 150, 'غرام', '1000', 0, 10, '', 'حليب بالموز', '1669423850.jpg', 57, 'admin', '2023-01-04 08:06:19', '2023-01-04 08:06:19', 'موسسة الغراسي للتجارة-UG', 5.00, NULL, '1500', '14', '8'),
(10, 354, NULL, 9, 'كامل الدسم', '5', '14', NULL, NULL, NULL, NULL, 10, 150, 'غرام', '1000', 0, 10, '', 'حليب بالموز', '1669423850.jpg', 57, 'admin', '2023-01-04 08:06:40', '2023-01-04 08:06:40', 'موسسة الغراسي للتجارة-UG', 5.00, NULL, '1500', '14', '8'),
(12, 359, NULL, 9, 'كامل الدسم', '5', '14', NULL, NULL, NULL, NULL, 1, 150, 'غرام', '1000', 0, 10, NULL, 'حليب بالموز', '1669423850.jpg', 57, 'admin', '2023-01-18 20:20:36', '2023-01-18 20:20:36', 'موسسة الغراسي للتجارة-UG', 5.00, NULL, '150', '16', '8');

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shippings`
--

INSERT INTO `cart_shippings` (`id`, `cart_group_id`, `shipping_method_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(13, '282-eYFsk-1661710346', 12, 17.24, '2022-08-29 01:13:09', '2022-08-29 01:13:09'),
(14, '266-SI8d8-1661703339', 12, 17.24, '2022-08-29 01:44:03', '2022-08-29 01:44:03'),
(15, '12-jugMm-1662058753', 12, 17.24, '2022-09-02 01:59:25', '2022-09-02 01:59:25'),
(17, '34-sb0DU-1663048110', 12, 17.24, '2022-09-13 12:49:05', '2022-09-13 12:49:05'),
(18, '82-HAQ56-1664836622', 12, 17.24, '2022-10-04 05:40:56', '2022-10-04 05:40:56'),
(20, '348-8TzZ4-1665664082', 12, 17.24, '2022-10-13 19:28:14', '2022-10-13 19:28:14'),
(21, '348-X4OW8-1665836108', 12, 17.24, '2022-10-15 19:15:19', '2022-10-15 19:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(14, 'مواد غذائية', 'moad-ghthayy', '1669331158.png', 0, 0, '2022-11-25 10:05:58', '2022-11-25 10:06:03', 1, NULL),
(15, 'مشروبات', 'mshrobat', '1669331258.png', 0, 0, '2022-11-25 10:07:38', '2022-11-25 10:07:43', 1, NULL),
(16, 'منظفات', 'mnthfat', '1669331347.png', 0, 0, '2022-11-25 10:09:07', '2022-11-25 10:09:12', 1, NULL),
(17, 'طلبيات كبيرة', 'tlbyat-kbyr', '1669331494.jpg', 0, 0, '2022-11-25 10:11:34', '2022-11-25 10:11:38', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_deps`
--

CREATE TABLE `category_deps` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order_level` int(11) NOT NULL DEFAULT 0,
  `commision_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) DEFAULT 0,
  `top` int(1) DEFAULT 0,
  `digital` int(1) DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(10) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_dep_translations`
--

CREATE TABLE `category_dep_translations` (
  `id` bigint(20) NOT NULL,
  `category_dep_id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT 0,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_jobs`
--

CREATE TABLE `category_jobs` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order_level` int(11) NOT NULL DEFAULT 0,
  `commision_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) DEFAULT 0,
  `top` int(1) DEFAULT 0,
  `digital` int(1) DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(10) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_job_translations`
--

CREATE TABLE `category_job_translations` (
  `id` bigint(20) NOT NULL,
  `category_job_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(1, 0, 145, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(2, 0, 172, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(3, 0, 259, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(4, 0, 262, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(5, 0, 578, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(6, 0, 579, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(7, 0, 637, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(8, 0, 639, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(9, 0, 649, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(10, 0, 654, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(11, 0, 662, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(12, 0, 664, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(13, 0, 666, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(14, 0, 668, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(15, 0, 669, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(16, 0, 670, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(17, 0, 673, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(18, 0, 676, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(19, 0, 677, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(20, 0, 679, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(21, 0, 680, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(22, 0, 681, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(23, 0, 682, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(24, 0, 683, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(25, 0, 684, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(26, 0, 685, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(27, 0, 686, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(28, 0, 687, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(29, 0, 688, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(30, 0, 690, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(31, 0, 691, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(32, 0, 692, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(33, 0, 693, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(34, 0, 694, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(35, 0, 695, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(36, 0, 696, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(37, 0, 697, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(38, 0, 698, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(39, 0, 700, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(40, 0, 701, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(41, 0, 702, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(42, 0, 703, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(43, 0, 705, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(44, 0, 707, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(45, 0, 708, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(46, 0, 709, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(47, 0, 710, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(48, 0, 711, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(49, 0, 713, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(50, 0, 720, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(51, 0, 721, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(52, 0, 835, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(53, 0, 837, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(54, 0, 838, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(55, 0, 839, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(56, 0, 858, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(57, 0, 859, 0.00, NULL, '2022-05-25 14:36:03', '2022-05-25 14:36:03'),
(58, 0, 860, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(59, 0, 861, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(60, 0, 862, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(61, 0, 863, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(62, 0, 865, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(63, 0, 866, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(64, 0, 867, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(65, 0, 868, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(66, 0, 869, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(67, 0, 871, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(68, 0, 872, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(69, 0, 873, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(70, 0, 874, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(71, 0, 877, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(72, 0, 888, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(73, 0, 889, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(74, 0, 895, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(75, 0, 910, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(76, 0, 917, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(77, 0, 926, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(78, 0, 927, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(79, 0, 928, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(80, 0, 929, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(81, 0, 930, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(82, 0, 931, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(83, 0, 968, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(84, 0, 971, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(85, 0, 972, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(86, 0, 973, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(87, 0, 980, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(88, 0, 981, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(89, 0, 983, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(90, 0, 984, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(91, 0, 985, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(92, 0, 989, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(93, 0, 997, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(94, 0, 1006, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(95, 0, 1007, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(96, 0, 1008, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(97, 0, 1025, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(98, 0, 1060, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(99, 0, 1061, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(100, 0, 1062, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(101, 0, 1063, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(102, 0, 1064, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(103, 0, 1066, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(104, 0, 1067, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(105, 0, 1068, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(106, 0, 1069, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(107, 0, 1070, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(108, 0, 1090, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(109, 0, 1104, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(110, 0, 1105, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(111, 0, 1106, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(112, 0, 1107, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(113, 0, 1108, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(114, 0, 1109, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(115, 0, 1110, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(116, 0, 1113, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(117, 0, 1114, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(118, 0, 1127, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(119, 0, 1169, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(120, 0, 1184, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(121, 0, 1192, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(122, 0, 1195, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(123, 0, 1200, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(124, 0, 1201, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(125, 0, 1202, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(126, 0, 1203, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(127, 0, 1204, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(128, 0, 1205, 0.00, NULL, '2022-05-25 14:36:04', '2022-05-25 14:36:04'),
(129, 1, 145, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(130, 1, 172, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(131, 1, 259, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(132, 1, 262, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(133, 1, 578, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(134, 1, 579, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(135, 1, 637, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(136, 1, 639, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(137, 1, 649, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(138, 1, 654, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(139, 1, 662, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(140, 1, 664, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(141, 1, 666, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(142, 1, 668, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(143, 1, 669, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(144, 1, 670, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(145, 1, 673, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(146, 1, 676, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(147, 1, 677, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(148, 1, 679, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(149, 1, 680, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(150, 1, 681, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(151, 1, 682, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(152, 1, 683, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(153, 1, 684, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(154, 1, 685, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(155, 1, 686, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(156, 1, 687, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(157, 1, 688, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(158, 1, 690, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(159, 1, 691, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(160, 1, 692, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(161, 1, 693, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(162, 1, 694, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(163, 1, 695, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(164, 1, 696, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(165, 1, 697, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(166, 1, 698, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(167, 1, 700, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(168, 1, 701, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(169, 1, 702, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(170, 1, 703, 0.00, NULL, '2022-05-25 16:22:04', '2022-05-25 16:22:04'),
(171, 1, 705, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(172, 1, 707, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(173, 1, 708, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(174, 1, 709, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(175, 1, 710, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(176, 1, 711, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(177, 1, 713, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(178, 1, 720, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(179, 1, 721, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(180, 1, 835, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(181, 1, 837, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(182, 1, 838, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(183, 1, 839, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(184, 1, 858, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(185, 1, 859, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(186, 1, 860, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(187, 1, 861, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(188, 1, 862, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(189, 1, 863, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(190, 1, 865, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(191, 1, 866, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(192, 1, 867, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(193, 1, 868, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(194, 1, 869, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(195, 1, 871, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(196, 1, 872, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(197, 1, 873, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(198, 1, 874, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(199, 1, 877, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(200, 1, 888, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(201, 1, 889, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(202, 1, 895, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(203, 1, 910, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(204, 1, 917, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(205, 1, 926, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(206, 1, 927, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(207, 1, 928, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(208, 1, 929, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(209, 1, 930, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(210, 1, 931, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(211, 1, 968, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(212, 1, 971, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(213, 1, 972, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(214, 1, 973, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(215, 1, 980, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(216, 1, 981, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(217, 1, 983, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(218, 1, 984, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(219, 1, 985, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(220, 1, 989, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(221, 1, 997, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(222, 1, 1006, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(223, 1, 1007, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(224, 1, 1008, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(225, 1, 1025, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(226, 1, 1060, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(227, 1, 1061, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(228, 1, 1062, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(229, 1, 1063, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(230, 1, 1064, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(231, 1, 1066, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(232, 1, 1067, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(233, 1, 1068, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(234, 1, 1069, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(235, 1, 1070, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(236, 1, 1090, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(237, 1, 1104, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(238, 1, 1105, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(239, 1, 1106, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(240, 1, 1107, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(241, 1, 1108, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(242, 1, 1109, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(243, 1, 1110, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(244, 1, 1113, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(245, 1, 1114, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(246, 1, 1127, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(247, 1, 1169, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(248, 1, 1184, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(249, 1, 1192, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(250, 1, 1195, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(251, 1, 1200, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(252, 1, 1201, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(253, 1, 1202, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(254, 1, 1203, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(255, 1, 1204, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(256, 1, 1205, 0.00, NULL, '2022-05-25 16:22:05', '2022-05-25 16:22:05'),
(257, 1, 986, 0.00, NULL, '2022-05-26 06:04:28', '2022-05-26 06:04:28'),
(258, 1, 1206, 0.00, NULL, '2022-05-26 06:04:28', '2022-05-26 06:04:28'),
(259, 1, 1210, 0.00, NULL, '2022-05-26 06:04:28', '2022-05-26 06:04:28'),
(260, 1, 1228, 0.00, NULL, '2022-05-26 06:04:28', '2022-05-26 06:04:28'),
(261, 0, 986, 0.00, NULL, '2022-06-07 04:18:39', '2022-06-07 04:18:39'),
(262, 0, 1206, 0.00, NULL, '2022-06-07 04:18:39', '2022-06-07 04:18:39'),
(263, 0, 1210, 0.00, NULL, '2022-06-07 04:18:39', '2022-06-07 04:18:39'),
(264, 0, 1228, 0.00, NULL, '2022-06-07 04:18:39', '2022-06-07 04:18:39'),
(265, 0, 1257, 0.00, NULL, '2022-06-07 04:18:39', '2022-06-07 04:18:39'),
(266, 0, 1309, 0.00, NULL, '2022-06-14 03:32:11', '2022-06-14 03:32:11'),
(267, 0, 1310, 0.00, NULL, '2022-06-14 03:32:11', '2022-06-14 03:32:11'),
(268, 0, 1311, 0.00, NULL, '2022-06-14 03:32:11', '2022-06-14 03:32:11'),
(269, 0, 1312, 0.00, NULL, '2022-06-14 03:32:11', '2022-06-14 03:32:11'),
(270, 0, 1314, 0.00, NULL, '2022-06-14 03:32:11', '2022-06-14 03:32:11'),
(271, 39, 1206, 0.00, NULL, '2022-08-09 01:26:03', '2022-08-09 01:26:03'),
(272, 39, 1210, 0.00, NULL, '2022-08-09 01:26:03', '2022-08-09 01:26:03'),
(273, 39, 1228, 0.00, NULL, '2022-08-09 01:26:03', '2022-08-09 01:26:03'),
(274, 39, 1363, 0.00, NULL, '2022-08-09 01:26:03', '2022-08-09 01:26:03'),
(275, 45, 1206, 0.00, NULL, '2022-08-21 16:09:40', '2022-08-21 16:09:40'),
(276, 45, 1210, 0.00, NULL, '2022-08-21 16:09:40', '2022-08-21 16:09:40'),
(277, 45, 1210, 0.00, NULL, '2022-08-21 16:09:40', '2022-08-21 16:09:40'),
(278, 45, 1228, 0.00, NULL, '2022-08-21 16:09:40', '2022-08-21 16:09:40'),
(279, 45, 1228, 0.00, NULL, '2022-08-21 16:09:40', '2022-08-21 16:09:40'),
(280, 45, 1363, 0.00, NULL, '2022-08-21 16:09:40', '2022-08-21 16:09:40'),
(281, 45, 1363, 0.00, NULL, '2022-08-21 16:09:40', '2022-08-21 16:09:40'),
(282, 62, 1206, 0.00, NULL, '2022-08-25 04:04:42', '2022-08-25 04:04:42'),
(283, 62, 1210, 0.00, NULL, '2022-08-25 04:04:42', '2022-08-25 04:04:42'),
(284, 62, 1228, 0.00, NULL, '2022-08-25 04:04:42', '2022-08-25 04:04:42'),
(285, 62, 1363, 0.00, NULL, '2022-08-25 04:04:42', '2022-08-25 04:04:42'),
(286, 0, 1363, 0.00, NULL, '2022-08-28 02:16:55', '2022-08-28 02:16:55'),
(287, 13, 1206, 0.00, NULL, '2022-08-28 21:13:40', '2022-08-28 21:13:40'),
(288, 13, 1210, 0.00, NULL, '2022-08-28 21:13:40', '2022-08-28 21:13:40'),
(289, 13, 1228, 0.00, NULL, '2022-08-28 21:13:40', '2022-08-28 21:13:40'),
(290, 13, 1363, 0.00, NULL, '2022-08-28 21:13:40', '2022-08-28 21:13:40'),
(291, 11, 1206, 0.00, NULL, '2022-08-29 00:29:53', '2022-08-29 00:29:53'),
(292, 11, 1210, 0.00, NULL, '2022-08-29 00:29:53', '2022-08-29 00:29:53'),
(293, 11, 1228, 0.00, NULL, '2022-08-29 00:29:53', '2022-08-29 00:29:53'),
(294, 11, 1363, 0.00, NULL, '2022-08-29 00:29:53', '2022-08-29 00:29:53'),
(295, 78, 1206, 0.00, NULL, '2022-09-27 00:04:47', '2022-09-27 00:04:47'),
(296, 78, 1210, 0.00, NULL, '2022-09-27 00:04:47', '2022-09-27 00:04:47'),
(297, 78, 1228, 0.00, NULL, '2022-09-27 00:04:47', '2022-09-27 00:04:47'),
(298, 78, 1363, 0.00, NULL, '2022-09-27 00:04:47', '2022-09-27 00:04:47'),
(299, 79, 7, 0.00, NULL, '2022-11-15 08:47:53', '2022-11-15 08:47:53'),
(300, 79, 13, 0.00, NULL, '2022-11-20 15:27:22', '2022-11-20 15:27:22'),
(301, 57, 14, 0.00, NULL, '2022-11-29 07:53:23', '2022-11-29 07:53:23'),
(302, 57, 15, 0.00, NULL, '2022-11-29 07:53:24', '2022-11-29 07:53:24'),
(303, 57, 16, 0.00, NULL, '2022-11-29 07:53:24', '2022-11-29 07:53:24'),
(304, 57, 17, 0.00, NULL, '2022-11-29 07:53:24', '2022-11-29 07:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chattings`
--

INSERT INTO `chattings` (`id`, `user_id`, `seller_id`, `message`, `sent_by_customer`, `sent_by_seller`, `seen_by_customer`, `seen_by_seller`, `status`, `created_at`, `updated_at`, `shop_id`) VALUES
(1, 12, 1, 'سلام', 1, 0, 0, 1, 1, '2022-06-28 00:34:57', NULL, 1),
(2, 12, 1, 'كيفك السعر', 1, 0, 0, 1, 1, '2022-06-28 00:35:06', NULL, 1),
(3, 34, 11, 'اهلا', 1, 0, 0, 0, 1, '2022-07-11 21:52:28', '2022-07-18 02:47:06', 11),
(4, 348, 37, 'مكانك ؟', 1, 0, 0, 1, 1, '2022-10-15 19:20:27', NULL, 37),
(5, 348, 37, 'وينك', 1, 0, 0, 1, 1, '2022-10-15 19:20:34', NULL, 37),
(6, 346, 37, 'a', 1, 0, 0, 1, 1, '2022-10-16 00:18:45', NULL, 37);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `name`, `cost`, `created_at`, `updated_at`) VALUES
(1, '4086', 'السبعين', 0, NULL, NULL),
(2, '4086', 'الوحدة', 0, NULL, NULL),
(3, '4086', 'شعوب', 0, NULL, NULL),
(4, '4086', 'بني الحارث', 0, NULL, NULL),
(5, '4086', 'آزال', 0, NULL, NULL),
(6, '4086', 'التحرير', 0, NULL, NULL),
(7, '4086', 'الثورة', 0, NULL, NULL),
(8, '4086', 'الصافية', 0, NULL, NULL),
(9, '4086', 'معين', 0, NULL, NULL),
(10, '4086', 'المدينة القديمة', 0, NULL, NULL),
(11, '4088', 'أرحب', 0, NULL, NULL),
(12, '4088', 'الطيال', 0, NULL, NULL),
(13, '4088', 'بني ضبيان', 0, NULL, NULL),
(14, '4088', 'صعفان', 0, NULL, NULL),
(15, '4088', 'الحصن', 0, NULL, NULL),
(16, '4088', 'بني حشيش', 0, NULL, NULL),
(17, '4088', 'خولان', 0, NULL, NULL),
(18, '4088', 'نهم', 0, NULL, NULL),
(19, '4088', 'الحيمة الداخلية', 0, NULL, NULL),
(20, '4088', 'بني مطر', 0, NULL, NULL),
(21, '4088', 'سنحان وبني بهلول', 0, NULL, NULL),
(22, '4088', 'همدان', 0, NULL, NULL),
(23, '4084', 'السياني', 0, NULL, NULL),
(24, '4084', 'الشِّعر', 0, NULL, NULL),
(25, '4084', 'الظهار', 0, NULL, NULL),
(26, '4084', 'العدين', 0, NULL, NULL),
(27, '4084', 'القفر', 0, NULL, NULL),
(28, '4084', 'المخادر', 0, NULL, NULL),
(29, '4084', 'المشنة', 0, NULL, NULL),
(30, '4084', 'النادرة', 0, NULL, NULL),
(31, '4084', 'جبلة', 0, NULL, NULL),
(32, '4084', 'حبيش', 0, NULL, NULL),
(33, '4084', 'حزم العدين', 0, NULL, NULL),
(34, '4084', 'ذي السفال', 0, NULL, NULL),
(35, '4084', 'فرع العدين', 0, NULL, NULL),
(36, '4084', 'مذخيرة', 0, NULL, NULL),
(37, '4084', 'يريم', 0, NULL, NULL),
(48398, '4084', 'بعدان', 0, NULL, NULL),
(48399, '4084', 'إب', 0, NULL, NULL),
(48400, '4084', 'الرضمة', 0, NULL, NULL),
(48401, '4084', 'السبرة', 0, NULL, NULL),
(48402, '4084', 'السدة', 0, NULL, NULL),
(48403, '4084', 'مذيخرة', 0, NULL, NULL),
(48404, '4079', 'جبل الشرق', 0, NULL, NULL),
(48405, '4079', 'ضوران آنس', 0, NULL, NULL),
(48406, '4079', 'جهران', 0, NULL, NULL),
(48407, '4079', 'الحداء', 0, NULL, NULL),
(48408, '4079', 'عنس', 0, NULL, NULL),
(48409, '4079', 'مغرب عنس', 0, NULL, NULL),
(48410, '4079', 'عتمة', 0, NULL, NULL),
(48411, '4079', 'وصاب العالي', 0, NULL, NULL),
(48412, '4079', 'وصاب السافل', 0, NULL, NULL),
(48413, '4079', 'المنار', 0, NULL, NULL),
(48414, '4079', 'مدينة ذمار', 0, NULL, NULL),
(48415, '4079', 'ميفعة عنس', 0, NULL, NULL),
(48416, '4090', 'ماوية', 0, NULL, NULL),
(48417, '4090', 'شرعب الرونة', 0, NULL, NULL),
(48418, '4090', 'شرعب السلام', 0, NULL, NULL),
(48419, '4090', 'مقبنة', 0, NULL, NULL),
(48420, '4090', 'المخاء', 0, NULL, NULL),
(48421, '4090', 'ذباب', 0, NULL, NULL),
(48422, '4090', 'موزع', 0, NULL, NULL),
(48423, '4090', 'جبل حبشي', 0, NULL, NULL),
(48424, '4090', 'مشرعة وحدنان', 0, NULL, NULL),
(48425, '4090', 'صبر الموادم', 0, NULL, NULL),
(48426, '4090', 'المسراخ', 0, NULL, NULL),
(48427, '4090', 'دمنة خدير', 0, NULL, NULL),
(48428, '4090', 'الصلو', 0, NULL, NULL),
(48430, '4090', 'الشمايتين', 0, NULL, NULL),
(48431, '4090', 'الوازعية', 0, NULL, NULL),
(48432, '4090', 'حيفان', 0, NULL, NULL),
(48433, '4090', 'المظفر', 0, NULL, NULL),
(48434, '4090', 'القاهرة', 0, NULL, NULL),
(48435, '4090', 'صالة', 0, NULL, NULL),
(48436, '4090', 'التعزية', 0, NULL, NULL),
(48437, '4090', 'المعافر', 0, NULL, NULL),
(48438, '4090', 'المواسط', 0, NULL, NULL),
(48439, '4090', 'سامع', 0, NULL, NULL),
(48440, '4077', 'دار سعد', 0, NULL, NULL),
(48441, '4077', 'الشيخ عثمان', 0, NULL, NULL),
(48442, '4077', 'المنصورة', 0, NULL, NULL),
(48443, '4077', 'البريقة', 0, NULL, NULL),
(48444, '4077', 'التواهي', 0, NULL, NULL),
(48445, '4077', 'المعلا', 0, NULL, NULL),
(48446, '4077', 'صيرة', 0, NULL, NULL),
(48447, '4077', 'خور مكسر', 0, NULL, NULL),
(48448, '4080', 'الديس', 0, NULL, NULL),
(48449, '4080', 'الريدة وقصيعر', 0, NULL, NULL),
(48450, '4080', 'السوم', 0, NULL, NULL),
(48451, '4080', 'الشحر', 0, NULL, NULL),
(48452, '4080', 'الضليعة', 0, NULL, NULL),
(48453, '4080', 'العبر', 0, NULL, NULL),
(48454, '4080', 'القطن', 0, NULL, NULL),
(48455, '4080', 'القف', 0, NULL, NULL),
(48456, '4080', 'المكلا', 0, NULL, NULL),
(48457, '4080', 'بروم ميفع', 0, NULL, NULL),
(48458, '4080', 'تريم', 0, NULL, NULL),
(48459, '4080', 'ثمود', 0, NULL, NULL),
(48460, '4080', 'حجر', 0, NULL, NULL),
(48461, '4080', 'حجر الصيعر', 0, NULL, NULL),
(48462, '4080', 'حديبو', 0, NULL, NULL),
(48463, '4080', 'حريضة', 0, NULL, NULL),
(48464, '4080', 'دوعن', 0, NULL, NULL),
(48465, '4080', 'رخية', 0, NULL, NULL),
(48466, '4080', 'رماة', 0, NULL, NULL),
(48467, '4080', 'ساه', 0, NULL, NULL),
(48468, '4080', 'سيؤن', 0, NULL, NULL),
(48470, '4080', 'إسمنت أبيض', 0, NULL, NULL),
(48471, '4080', 'عمد', 0, NULL, NULL),
(48472, '4080', 'غيل با وزير', 0, NULL, NULL),
(48473, '4080', 'غيل بن يمين', 0, NULL, NULL),
(48474, '4080', 'قلنسية وعبد الكوري', 0, NULL, NULL),
(48475, '4080', 'مدينة المكلا', 0, NULL, NULL),
(48476, '4080', 'وادي العين', 0, NULL, NULL),
(48477, '4080', 'يبعث', 0, NULL, NULL),
(48478, '4089', 'عرماء', 0, NULL, NULL),
(48479, '4089', 'دهر', 0, NULL, NULL),
(48480, '4089', 'جردان', 0, NULL, NULL),
(48481, '4089', 'عسيلان', 0, NULL, NULL),
(48482, '4089', 'عين', 0, NULL, NULL),
(48483, '4089', 'بيحان', 0, NULL, NULL),
(48484, '4089', 'مرخة', 0, NULL, NULL),
(48485, '4089', 'نصاب', 0, NULL, NULL),
(48486, '4089', 'الطلع', 0, NULL, NULL),
(48487, '4089', 'حطيب', 0, NULL, NULL),
(48488, '4089', 'الصعيد', 0, NULL, NULL),
(48489, '4089', 'عتق', 0, NULL, NULL),
(48490, '4089', 'حبان', 0, NULL, NULL),
(48491, '4089', 'الروضة', 0, NULL, NULL),
(48492, '4089', 'ميفعة', 0, NULL, NULL),
(48493, '4089', 'رضوم', 0, NULL, NULL),
(48494, '4127', 'الحد', 0, NULL, NULL),
(48495, '4127', 'يافع', 0, NULL, NULL),
(48496, '4127', 'المفلحي', 0, NULL, NULL),
(48497, '4127', 'يهر', 0, NULL, NULL),
(48498, '4127', 'حبيل جبر', 0, NULL, NULL),
(48499, '4127', 'حالمين', 0, NULL, NULL),
(48500, '4127', 'ردفان', 0, NULL, NULL),
(48501, '4127', 'الملاح', 0, NULL, NULL),
(48502, '4127', 'المسيمر', 0, NULL, NULL),
(48503, '4127', 'القبيطة', 0, NULL, NULL),
(48504, '4127', 'تبن', 0, NULL, NULL),
(48505, '4127', 'طور البارحة', 0, NULL, NULL),
(48506, '4127', 'المقاطرة', 0, NULL, NULL),
(48507, '4127', 'المضاربة و رأس العارة', 0, NULL, NULL),
(48508, '4127', 'الحوطة', 0, NULL, NULL),
(48509, '4128', 'دمت', 0, NULL, NULL),
(48510, '4128', 'قعطبة', 0, NULL, NULL),
(48511, '4128', 'جبن', 0, NULL, NULL),
(48512, '4128', 'الشعيب', 0, NULL, NULL),
(48513, '4128', 'الحصين', 0, NULL, NULL),
(48514, '4128', 'الضالع', 0, NULL, NULL),
(48515, '4128', 'جحاف', 0, NULL, NULL),
(48516, '4128', 'الأزارق', 0, NULL, NULL),
(48517, '4128', 'الحشاء', 0, NULL, NULL),
(48518, '4091', 'نعمان', 0, NULL, NULL),
(48519, '4091', 'ناطع', 0, NULL, NULL),
(48520, '4091', 'مسورة', 0, NULL, NULL),
(48521, '4091', 'الصومعة', 0, NULL, NULL),
(48522, '4091', 'الزاهر', 0, NULL, NULL),
(48523, '4091', 'ذي ناعم', 0, NULL, NULL),
(48524, '4091', 'الطفة', 0, NULL, NULL),
(48525, '4091', 'مكيراس', 0, NULL, NULL),
(48526, '4091', 'مدينة البيضاء', 0, NULL, NULL),
(48527, '4091', 'البيضاء', 0, NULL, NULL),
(48528, '4091', 'السوادية', 0, NULL, NULL),
(48529, '4091', 'ردمان', 0, NULL, NULL),
(48530, '4091', 'رداع', 0, NULL, NULL),
(48531, '4091', 'القريشية', 0, NULL, NULL),
(48532, '4091', 'ولد ربيع', 0, NULL, NULL),
(48533, '4091', 'العرش', 0, NULL, NULL),
(48534, '4091', 'صباح', 0, NULL, NULL),
(48535, '4091', 'الرياشية', 0, NULL, NULL),
(48536, '4091', 'الشرية', 0, NULL, NULL),
(48537, '4091', 'الملاجم', 0, NULL, NULL),
(48538, '4085', 'بدبدة', 0, NULL, NULL),
(48539, '4085', 'حريب القراميش', 0, NULL, NULL),
(48540, '4085', 'صرواح', 0, NULL, NULL),
(48541, '4085', 'مدغل الجدعان', 0, NULL, NULL),
(48542, '4085', 'مجزر', 0, NULL, NULL),
(48543, '4085', 'رعوان', 0, NULL, NULL),
(48544, '4085', 'مأرب', 0, NULL, NULL),
(48545, '4085', 'الجوبة', 0, NULL, NULL),
(48546, '4085', 'رحبة', 0, NULL, NULL),
(48547, '4085', 'حريب', 0, NULL, NULL),
(48548, '4085', 'ماهلية', 0, NULL, NULL),
(48549, '4085', 'العبدية', 0, NULL, NULL),
(48550, '4093', 'خب والشعف', 0, NULL, NULL),
(48551, '4093', 'الحميدات', 0, NULL, NULL),
(48552, '4093', 'المطمة', 0, NULL, NULL),
(48553, '4093', 'الزاهر', 0, NULL, NULL),
(48554, '4093', 'الحزم', 0, NULL, NULL),
(48555, '4093', 'المتون', 0, NULL, NULL),
(48556, '4093', 'المصلوب', 0, NULL, NULL),
(48557, '4093', 'الغيل', 0, NULL, NULL),
(48558, '4093', 'الخلق', 0, NULL, NULL),
(48559, '4093', 'خراب المراشي', 0, NULL, NULL),
(48560, '4093', 'رجوزة', 0, NULL, NULL),
(48561, '4093', 'برط العنان', 0, NULL, NULL),
(48562, '4130', 'وشحة', 0, NULL, NULL),
(48563, '4130', 'بكيل المير', 0, NULL, NULL),
(48564, '4130', 'حرض', 0, NULL, NULL),
(48565, '4130', 'ميدي', 0, NULL, NULL),
(48566, '4130', 'حيران', 0, NULL, NULL),
(48567, '4130', 'مسباء', 0, NULL, NULL),
(48568, '4130', 'كشر', 0, NULL, NULL),
(48569, '4130', 'الجميمة', 0, NULL, NULL),
(48570, '4130', 'كحلان الشرف', 0, NULL, NULL),
(48571, '4130', 'أفلح الشام', 0, NULL, NULL),
(48572, '4130', 'خيران المحرق', 0, NULL, NULL),
(48573, '4130', 'أسلم', 0, NULL, NULL),
(48574, '4130', 'عبس', 0, NULL, NULL),
(48575, '4130', 'كعيدنة', 0, NULL, NULL),
(48576, '4130', 'قفل شمر', 0, NULL, NULL),
(48577, '4130', 'أفلح اليمن', 0, NULL, NULL),
(48578, '4130', 'المفتاح', 0, NULL, NULL),
(48579, '4130', 'المحابشة', 0, NULL, NULL),
(48580, '4130', 'الشاهل', 0, NULL, NULL),
(48581, '4130', 'المغربة', 0, NULL, NULL),
(48582, '4130', 'كحلان عفار', 0, NULL, NULL),
(48583, '4130', 'شرس', 0, NULL, NULL),
(48584, '4130', 'مبين', 0, NULL, NULL),
(48585, '4130', 'وضرة', 0, NULL, NULL),
(48586, '4130', 'بني قيس الطور', 0, NULL, NULL),
(48587, '4130', 'الشغادرة', 0, NULL, NULL),
(48588, '4130', 'نجرة', 0, NULL, NULL),
(48589, '4130', 'حجة', 0, NULL, NULL),
(48590, '4130', 'بني العوام', 0, NULL, NULL),
(48591, '4130', 'قارة', 0, NULL, NULL),
(48592, '4092', 'الزهرة', 0, NULL, NULL),
(48593, '4092', 'اللحية', 0, NULL, NULL),
(48594, '4092', 'كمران', 0, NULL, NULL),
(48595, '4092', 'الصليف', 0, NULL, NULL),
(48596, '4092', 'المنيرة', 0, NULL, NULL),
(48597, '4092', 'القناوص', 0, NULL, NULL),
(48598, '4092', 'الزيدية', 0, NULL, NULL),
(48599, '4092', 'المغلاف', 0, NULL, NULL),
(48600, '4092', 'الضحى', 0, NULL, NULL),
(48601, '4092', 'باجل', 0, NULL, NULL),
(48602, '4092', 'الحجيلة', 0, NULL, NULL),
(48603, '4092', 'برع', 0, NULL, NULL),
(48604, '4092', 'المراوعة', 0, NULL, NULL),
(48605, '4092', 'الدريهمي', 0, NULL, NULL),
(48606, '4092', 'السخنة', 0, NULL, NULL),
(48607, '4092', 'المنصورية', 0, NULL, NULL),
(48608, '4092', 'بيت الفقيه', 0, NULL, NULL),
(48609, '4092', 'جبــل راس', 0, NULL, NULL),
(48610, '4092', 'حيس', 0, NULL, NULL),
(48611, '4092', 'الخوخة', 0, NULL, NULL),
(48612, '4092', 'الحوك', 0, NULL, NULL),
(48613, '4092', 'الميناء', 0, NULL, NULL),
(48614, '4092', 'الحالي', 0, NULL, NULL),
(48615, '4092', 'زبيد', 0, NULL, NULL),
(48616, '4092', 'الجراحي', 0, NULL, NULL),
(48617, '4092', 'التحيتا', 0, NULL, NULL),
(48618, '4095', 'شبام كوكبان', 0, NULL, NULL),
(48619, '4095', 'الطويلة', 0, NULL, NULL),
(48620, '4095', 'الرجم', 0, NULL, NULL),
(48621, '4095', 'الخبت', 0, NULL, NULL),
(48622, '4095', 'ملحان', 0, NULL, NULL),
(48623, '4095', 'حفاش', 0, NULL, NULL),
(48624, '4095', 'بنى سعد', 0, NULL, NULL),
(48625, '4095', 'مدينة المحويت', 0, NULL, NULL),
(48626, '4095', 'المحويت', 0, NULL, NULL),
(48627, '4125', 'بلاد الطعام', 0, NULL, NULL),
(48628, '4125', 'السلفية', 0, NULL, NULL),
(48629, '4125', 'الجبين', 0, NULL, NULL),
(48630, '4125', 'مزهر', 0, NULL, NULL),
(48631, '4125', 'كسمة', 0, NULL, NULL),
(48632, '4125', 'الجعفرية', 0, NULL, NULL),
(48633, '4131', 'حرف سفيان', 0, NULL, NULL),
(48634, '4131', 'حوث', 0, NULL, NULL),
(48635, '4131', 'العشة', 0, NULL, NULL),
(48636, '4131', 'قفلة عذر', 0, NULL, NULL),
(48637, '4131', 'شهارة', 0, NULL, NULL),
(48638, '4131', 'المــدان', 0, NULL, NULL),
(48639, '4131', 'صـوير', 0, NULL, NULL),
(48640, '4131', 'ظليمة حبور', 0, NULL, NULL),
(48641, '4131', 'ذيبين', 0, NULL, NULL),
(48642, '4131', 'خارف', 0, NULL, NULL),
(48643, '4131', 'ريدة', 0, NULL, NULL),
(48644, '4131', 'جبل عيال يزيد', 0, NULL, NULL),
(48645, '4131', 'السودة', 0, NULL, NULL),
(48646, '4131', 'السود', 0, NULL, NULL),
(48647, '4131', 'عمران', 0, NULL, NULL),
(48648, '4131', 'مسور', 0, NULL, NULL),
(48649, '4131', 'ثلاء', 0, NULL, NULL),
(48650, '4131', 'عيال سريح', 0, NULL, NULL),
(48651, '4131', 'خمر', 0, NULL, NULL),
(48652, '4131', 'بني صريم', 0, NULL, NULL),
(48653, '4087', 'باقم', 0, NULL, NULL),
(48654, '4087', 'قطابر', 0, NULL, NULL),
(48655, '4087', 'منبه', 0, NULL, NULL),
(48656, '4087', 'غمر', 0, NULL, NULL),
(48657, '4087', 'رازح', 0, NULL, NULL),
(48658, '4087', 'شداء', 0, NULL, NULL),
(48659, '4087', 'الظاهر', 0, NULL, NULL),
(48660, '4087', 'حيدان', 0, NULL, NULL),
(48661, '4087', 'ساقين', 0, NULL, NULL),
(48662, '4087', 'مجز', 0, NULL, NULL),
(48663, '4087', 'سحار', 0, NULL, NULL),
(48664, '4087', 'الصفراء', 0, NULL, NULL),
(48665, '4087', 'الحشوة', 0, NULL, NULL),
(48666, '4087', 'كتاف والبقع', 0, NULL, NULL),
(48667, '4087', 'صعدة', 0, NULL, NULL),
(48668, '4094', 'الغيضة', 0, NULL, NULL),
(48669, '4094', 'المسيلة', 0, NULL, NULL),
(48670, '4094', 'حات', 0, NULL, NULL),
(48671, '4094', 'حصوين', 0, NULL, NULL),
(48672, '4094', 'حوف', 0, NULL, NULL),
(48673, '4094', 'سيحوت', 0, NULL, NULL),
(48674, '4094', 'شحن', 0, NULL, NULL),
(48675, '4094', 'قشن', 0, NULL, NULL),
(48676, '4094', 'منعر', 0, NULL, NULL),
(48677, '4078', 'سباح', 0, NULL, NULL),
(48678, '4078', 'رصد', 0, NULL, NULL),
(48679, '4078', 'سرار', 0, NULL, NULL),
(48680, '4078', 'لودر', 0, NULL, NULL),
(48681, '4078', 'جيشان', 0, NULL, NULL),
(48682, '4078', 'مودية', 0, NULL, NULL),
(48683, '4078', 'الوضيع', 0, NULL, NULL),
(48684, '4078', 'خنفر', 0, NULL, NULL),
(48685, '4078', 'أحور', 0, NULL, NULL),
(48686, '4078', 'المحفد', 0, NULL, NULL),
(48687, '4126', 'حديبو‏', 0, NULL, NULL),
(48688, '4126', 'قلنسية وعبد الكوري', 0, NULL, NULL),
(48689, '', 'السبعين', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_type`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`, `limit`) VALUES
(1, 'discount_on_purchase', 'كود العيد', 'كود العيد', '2022-07-06', '2022-11-18', '172.41', '0.00', '10.00', 'amount', 1, '2022-07-07 03:00:28', '2022-07-07 03:00:28', 2);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '0.0017241379310345', 1, NULL, '2022-06-22 01:04:25'),
(2, 'BDT', '৳', 'BDT', '0.1448275862069', 0, NULL, '2022-05-30 21:27:09'),
(3, 'Indian Rupi', '₹', 'INR', '0.10344827586207', 0, '2020-10-15 17:23:04', '2022-05-30 21:27:09'),
(4, 'Euro', '€', 'EUR', '0.17241379310345', 0, '2021-05-25 21:00:23', '2022-05-30 21:27:09'),
(5, 'YEN', '¥', 'JPY', '0.18965517241379', 0, '2021-06-10 22:08:31', '2022-05-30 21:27:09'),
(8, 'ريال يمني', 'ري', 'YER', '1', 1, '2022-05-25 14:32:24', '2022-06-07 00:56:48');

-- --------------------------------------------------------

--
-- Table structure for table `customer_locations`
--

CREATE TABLE `customer_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building_floor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_hours` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_locations`
--

INSERT INTO `customer_locations` (`id`, `name`, `user_id`, `country`, `city`, `building_type`, `building_no`, `building_floor`, `address_details`, `address_longitude`, `address_latitude`, `working_hours`, `delivery_phone`, `building_image`, `delivery_image`, `created_at`, `updated_at`) VALUES
(1, 'khaled group', '359', 'Egypt', 'Giza', 'البقالات', '277', 'الدور الارضي', 'giza', '31.2088526', '30.0130557', '', '0124663326', '1673825449.jpg', '1673825449.jpg', '2023-01-16 00:24:49', '2023-01-16 00:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_wallets`
--

INSERT INTO `customer_wallets` (`id`, `customer_id`, `balance`, `royality_points`, `created_at`, `updated_at`) VALUES
(1, 354, '0.00', '0.00', '2022-12-08 23:22:15', NULL),
(2, 359, '0.00', '0.00', '2023-01-14 21:33:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_wallet_histories`
--

INSERT INTO `customer_wallet_histories` (`id`, `customer_id`, `transaction_amount`, `transaction_type`, `transaction_method`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 354, '100.00', 'purchasing', 'cash', NULL, '2022-12-27 21:22:39', NULL),
(2, 354, '50.00', 'purchsaing', 'cash', NULL, '2022-12-27 21:28:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_requests`
--

CREATE TABLE `customer_wallet_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'الأثنين', '2022-08-15 13:58:01', '2022-08-15 13:58:01'),
(2, 'الثلاثاء', '2022-08-15 13:58:01', '2022-08-15 13:58:01'),
(3, 'الاربعاء', '2022-08-15 13:58:01', '2022-08-15 13:58:01'),
(4, 'الخمييس', '2022-08-15 13:58:01', '2022-08-15 13:58:01'),
(5, 'الجمعة', '2022-08-15 13:58:01', '2022-08-15 13:58:01'),
(6, 'السبت', '2022-08-15 13:58:01', '2022-08-15 13:58:01'),
(7, 'الاحد', '2022-08-15 13:58:01', '2022-08-15 13:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `day_shop`
--

CREATE TABLE `day_shop` (
  `id` bigint(6) UNSIGNED NOT NULL,
  `day_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `from_hours` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `am_pm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_minutes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_hours` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_minutes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_am` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deal_of_the_days`
--

INSERT INTO `deal_of_the_days` (`id`, `title`, `product_id`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'عرض حصري', 9, '0.00', 'flat', 1, '2022-05-28 21:11:37', '2022-08-02 03:00:18'),
(2, 'تخفيضات', 11, '1.00', 'flat', 0, '2022-05-28 21:15:07', '2022-05-28 21:15:07'),
(3, 'اشتري واحد واحصل على الثاني مجان', 12, '23.00', 'percent', 0, '2022-05-28 21:15:21', '2022-05-28 21:15:21');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `zone_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`zone_id`)),
  `NameCoordinates` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coordinates` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `seller_id`, `f_name`, `l_name`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `is_active`, `zone_id`, `NameCoordinates`, `coordinates`, `created_at`, `updated_at`, `auth_token`, `fcm_token`) VALUES
(1, 0, 'mohammed', 'moqbel', '0777363554', 'del@demo.com', '12345678', 'passport', '[\"2022-05-25-628e2a4425547.png\"]', '2022-05-25-628e2a442ffb9.png', '$2y$10$Y4V.impKFROLwrWtMQcjg.d08iYkeDam9hnj/s9FopsRToVts1qAy', 1, NULL, NULL, NULL, '2022-05-25 17:08:20', '2022-12-07 16:00:07', 'a8lqnS1qKGyPzF35d5tl28noR6AuSUl28xtS5F0jbqJuIQPFGj', 'fJvSuUyBTGaeHIyuSlQoqK:APA91bEqyOa3YZ657gIYTZeXLcpgRl8Qk4B8-lrM4zw3-9ye859KG7WjAcQ_qmir0pbfMoePRbB6s-yKs0FwTVboDniaqjdZ59pyaJyhwFaUtty0OHRtuSlknAu7lKmNsEuVnFMypx4A'),
(2, 0, 'المفلحي', 'للتوصيلات', '0777363594', 'mhmdqds@gmail.com', '12345678', 'passport', '[\"2022-08-20-63010df4c4577.png\"]', '2022-08-20-63010df4e4332.png', '$2y$10$kdC81OavPZ4U0XdP4pFOPeXzITDzF0gVyWTvXbI46KSOJgxrHDnK2', 1, NULL, NULL, NULL, '2022-08-20 23:38:13', '2022-10-15 20:01:23', 'Fer49Ho885u0qiBDk2SGaoI3kAZPQe9AbFX27EXPzzJ2yObP5S', 'no'),
(3, 39, 'سريع', 'التوصيلات', '777363555', 'info@alnahdain.com', '7777', 'passport', '[\"2022-08-20-63010e6199ffe.png\"]', '2022-08-20-63010e61a016a.png', '$2y$10$gX.zoavT1TKBwJLiLHTH.usTGRp/f1paAfm.jqG9LZqyxWOIJiDXK', 1, NULL, NULL, NULL, '2022-08-20 23:40:01', '2022-08-20 23:40:01', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL),
(4, 45, 'عصام قادر', 'قادر', '777794438', 'qaderesam@gmail.com', '232133243144', 'driving_license', '[\"2022-08-20-630137c0051ab.png\"]', '2022-08-20-630137c00e012.png', '$2y$10$HV1.cfcmG3mcutDeMvLbceTDK91wGfKYElLfSSd1BQKX1G7/tx6TG', 1, NULL, NULL, NULL, '2022-08-21 02:36:32', '2022-08-21 02:36:32', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL),
(5, 39, 'سريع', 'السريع', '777777777', 'info@hdain.com', '7777', 'driving_license', '[]', '2022-08-21-63026e6d0aee9.png', '$2y$10$7NDHe4oHCcX4kl5Aq.HTSOCfR8nB7xtiMXSowfjlyhLlwZvFuLway', 1, NULL, NULL, '(15.36134221023497, 44.18709288669432),(15.353562217950284, 44.18846617770995),(15.341477825033367, 44.2051173312744),(15.360017976719988, 44.210267172582995),(15.367963251676347, 44.20357237888182)', '2022-08-22 00:42:05', '2022-08-22 00:42:05', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL),
(6, 39, 'سريع', 'التوصيلات', '766666666', 'info@alna.com', '58777777', 'passport', '[]', '2022-08-21-630287d3f0779.png', '$2y$10$6EYb4AKTu8yS6p62j2TdCuuRY9EEtvHTAAWZ04J9s06ltWIVJJHfq', 1, NULL, 'fsd', '(15.274711313635063, 44.208253479809585),(15.271178714136271, 44.17837020275194),(15.268197892622938, 44.19519301769335),(15.263726580981764, 44.20463439342577),(15.268363494928767, 44.214762414666005)', '2022-08-22 02:30:28', '2022-08-22 02:30:28', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL),
(7, 11, 'علي', 'صالح', '77274947', 'alisallah@gmail.com', '5656655', 'passport', '[]', '2022-08-27-630a6c7b9dd34.png', '$2y$10$kdC81OavPZ4U0XdP4pFOPeXzITDzF0gVyWTvXbI46KSOJgxrHDnK2', 1, NULL, 'السبعين', '(15.28543885095624, 44.232841391916466),(15.2866807629851, 44.23155393158932),(15.286101204953855, 44.233141799326134)', '2022-08-28 02:11:55', '2022-09-06 08:39:16', 'JN9BcYvZQplerQbpt3obivrlV13JWJzU7rmLerKblw9ZNjDWi1', 'fhwvphT1Qaqll0oJCdeoMQ:APA91bEgofRjMfxl1ncEVCZFVlIVPPqvMwInYi4jzf1b7xRjXf4-HMFJbVsxjZa_MGP_6nkGYdOs7l7Lyr3kUHTTvpke5y3xYplc27jS-Qo2-H6s0SmUX2YSPv2uPc1VgEB-x6ifmGlE'),
(8, 57, 'khaled', 'ALI', '77777888', 'khaled@gmail.com', '12467776', 'passport', '[]', '2022-08-30-630e17e570c3f.png', '$2y$10$Y4V.impKFROLwrWtMQcjg.d08iYkeDam9hnj/s9FopsRToVts1qAy', 1, '1', 'UWHL', '(15.322835097605436, 44.133530762124444),(15.508178877465431, 44.229661133218194),(15.309589943183001, 44.254380371499444),(15.328132924518922, 44.196702148843194)', '2022-08-30 21:00:05', '2022-12-13 14:49:23', 'S5oCsEZ3mnFN1qDL4bHkuflHtawkIHGy3V7uv8GFj25VRamOKf', 'enJzEF7fTROy9Ln4ATIaFH:APA91bGuO7jGD_1vZG_b-ijUa1zhuECIt-xFbBOZHopugP_ejER9E7xk2nVIkaZGVHfzsBuLrFXqcMeG83lAwRbzLEfeqXKQmOAD4eBTtTY261sRxlXWQU9l9ta0_bqVYMckEsK_IVMs'),
(9, NULL, 'khaled', NULL, '0124663326', NULL, NULL, NULL, NULL, NULL, '', 1, '2', NULL, NULL, '2022-11-15 10:03:31', '2022-11-15 10:03:31', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL),
(12, 57, 'khaled', NULL, '01016628164', NULL, NULL, NULL, NULL, NULL, '', 1, '10', NULL, NULL, '2022-12-07 06:57:22', '2022-12-07 06:57:22', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL),
(19, 57, 'ahmed', NULL, '325656456', NULL, NULL, NULL, NULL, NULL, '', 1, '2', NULL, NULL, '2022-12-07 10:05:06', '2022-12-07 10:05:06', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL),
(33, 57, 'adam', 'khaled', '01201016628', NULL, NULL, NULL, NULL, NULL, '$2y$10$M6Brq0oEAfaW7cU8ZlDuxOMKj0zFXeQuGuWZ91B3u5WwqlYQe02Ki', 1, '[\"1\",\"2\",\"3\"]', NULL, NULL, '2022-12-18 10:34:05', NULL, '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL),
(35, 148, 'خالد', 'احمد', '0120101691', NULL, NULL, NULL, NULL, NULL, '$2y$10$1QsWgR6sdVQY.d0iu6x3JeJ6.X8DJLY2TLhfq8bxQasQhMdKqTV8W', 1, '[\"2\",\"4\",\"5\"]', NULL, NULL, '2023-01-25 23:46:52', NULL, '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department_typs`
--

CREATE TABLE `department_typs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `category_dep_id` int(11) DEFAULT 0,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `featured` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `department_typs`
--

INSERT INTO `department_typs` (`id`, `name`, `category_dep_id`, `icon`, `parent_id`, `featured`, `created_at`, `updated_at`) VALUES
(2, 'اخشاب', NULL, '593', 0, 1, '2022-01-03 13:05:24', '2022-01-11 08:46:23'),
(6, 'الحديد', NULL, '603', 0, 1, '2022-03-01 01:32:19', '2022-03-01 01:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `position`, `parent_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(6, 'khaled', 'khaled@gmail.com', '0124663326', 'اختر الصلاحية', '57', 'الفرع الرئيسي', '2022-12-06 10:32:02', '2023-01-23 23:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(1, 'تخفيضات', '2022-05-28', '2023-06-09', 0, 0, NULL, NULL, 'def.png', 'tkhfydat', '2022-05-28 21:11:03', '2022-08-02 03:08:44', NULL, 'feature_deal'),
(2, 'منتجات جديده', '2022-05-28', '2022-08-27', 0, 0, NULL, NULL, '2022-07-06-62c5e8d63d1ba.png', 'mntgat-gdydh', '2022-05-28 21:13:27', '2022-08-02 03:00:35', NULL, 'flash_deal'),
(3, 'عروض مؤقته', '2022-06-05', '2022-12-23', 1, 0, NULL, NULL, '2022-07-06-62c5e93784bd3.png', 'aarod-mokth', '2022-07-07 02:57:43', '2022-08-02 03:01:26', NULL, 'flash_deal'),
(4, 'عروض يوميه', '2022-07-05', '2024-06-21', 1, 0, NULL, NULL, 'def.png', 'aarod-yomyh', '2022-07-07 02:58:49', '2022-08-02 03:08:44', NULL, 'feature_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(1, 2, 4, '0.00', NULL, '2022-05-28 21:13:41', '2022-05-28 21:13:41'),
(2, 2, 6, '0.00', NULL, '2022-05-28 21:13:52', '2022-05-28 21:13:52'),
(4, 1, 8, '0.00', NULL, '2022-05-28 21:15:47', '2022-05-28 21:15:47'),
(5, 1, 5, '0.00', NULL, '2022-05-28 21:15:51', '2022-05-28 21:15:51'),
(7, 2, 115, '0.00', NULL, '2022-07-01 02:21:25', '2022-07-01 02:21:25'),
(12, 3, 448, '0.00', NULL, '2022-08-02 02:57:58', '2022-08-02 02:57:58'),
(14, 3, 318, '0.00', NULL, '2022-08-02 02:58:10', '2022-08-02 02:58:10'),
(15, 2, 404, '0.00', NULL, '2022-08-02 02:58:38', '2022-08-02 02:58:38'),
(16, 2, 450, '0.00', NULL, '2022-08-02 02:58:45', '2022-08-02 02:58:45'),
(17, 2, 343, '0.00', NULL, '2022-08-02 02:59:40', '2022-08-02 02:59:40'),
(18, 1, 448, '0.00', NULL, '2022-08-02 03:01:44', '2022-08-02 03:01:44'),
(20, 1, 381, '0.00', NULL, '2022-08-02 03:03:25', '2022-08-02 03:03:25'),
(21, 4, 448, '0.00', NULL, '2022-08-02 03:05:12', '2022-08-02 03:05:12'),
(23, 4, 288, '0.00', NULL, '2022-08-02 03:10:40', '2022-08-02 03:10:40'),
(24, 4, 277, '0.00', NULL, '2022-08-02 03:10:49', '2022-08-02 03:10:49'),
(25, 4, 294, '0.00', NULL, '2022-08-02 03:11:07', '2022-08-02 03:11:07'),
(26, 4, 493, '0.00', NULL, '2022-08-02 03:11:32', '2022-08-02 03:11:32'),
(27, 4, 348, '0.00', NULL, '2022-08-02 03:11:37', '2022-08-02 03:11:37'),
(28, 4, 424, '0.00', NULL, '2022-08-02 03:11:57', '2022-08-02 03:11:57'),
(29, 4, 425, '0.00', NULL, '2022-08-02 03:12:07', '2022-08-02 03:12:07'),
(30, 4, 425, '0.00', NULL, '2022-08-02 03:12:07', '2022-08-02 03:12:07');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `follow_id` int(11) NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_accepte` tinyint(1) NOT NULL DEFAULT 1,
  `viewed` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_names`
--

CREATE TABLE `job_names` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `category_job_id` int(11) DEFAULT 0,
  `parent_id` varchar(255) COLLATE utf32_unicode_ci DEFAULT '0',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(10) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `market_typs`
--

CREATE TABLE `market_typs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `featured` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(166, '2022_04_06_020313_create_subscriptions_table', 64),
(167, '2022_04_12_233704_change_column_to_products_table', 64),
(168, '2022_04_19_095926_create_jobs_table', 64),
(169, '2022_10_04_144257_create_seller_req_add_products_table', 65),
(170, '2022_10_05_215447_create_seller_req_product_files_table', 65),
(171, '2022_11_06_230017_create_brands_table', 66),
(172, '2022_11_17_020944_create_sub_categories_table', 67),
(173, '2022_11_18_003154_create_subs_categories_table', 67),
(174, '2022_11_20_113517_create_cities_table', 68),
(175, '2022_11_20_142644_create_states_table', 69),
(176, '2022_11_25_040207_create_sub_sub_categories_table', 70),
(177, '2022_12_04_011039_create_employees_table', 71),
(178, '2022_12_09_025146_create_customer_wallet_requests_table', 72),
(179, '2022_12_14_154322_create_admin_commissions_table', 73),
(180, '2022_12_30_171640_create_customer_locations_table', 74);

-- --------------------------------------------------------

--
-- Table structure for table `new_req_orders`
--

CREATE TABLE `new_req_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(244) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `new_req_orders`
--

INSERT INTO `new_req_orders` (`id`, `customer_id`, `subject`, `quantity`, `price`, `type`, `priority`, `description`, `reply`, `status`, `photo`, `created_at`, `updated_at`) VALUES
(1, 2, 'ffc', NULL, NULL, 'Website Problem', 'low', 'fcc', NULL, 'open', NULL, '2022-05-25 20:43:07', '2022-06-21 02:26:27'),
(2, 13, 'ناا', NULL, NULL, 'Website Problem', 'low', 'ناا', NULL, 'pending', NULL, '2022-07-03 02:20:21', '2022-07-03 02:20:21'),
(3, NULL, 'erer', '55', '765', 'fsd', 'low', NULL, NULL, 'pending', NULL, '2022-07-25 21:08:22', '2022-07-25 21:08:22'),
(4, NULL, 'تجربه', '54546', 'منفصله', 'طلب جديد', 'low', NULL, NULL, 'pending', NULL, '2022-07-25 21:10:09', '2022-07-25 21:10:09'),
(5, NULL, 'تجربه', '54546', 'منفصله', 'طلب جديد', 'low', NULL, NULL, 'pending', NULL, '2022-07-25 21:10:11', '2022-07-25 21:10:11'),
(6, 12, 'تجربه مساخدم', '64956', 'ةيوي', 'طلب جديد', 'low', '55626', NULL, 'pending', NULL, '2022-07-25 21:31:43', '2022-07-25 21:31:43'),
(7, NULL, 'شاهي الكبوس', NULL, 'شاهي نص كيلو', 'طلب جديد', 'low', '1', NULL, 'pending', NULL, '2022-07-27 02:15:43', '2022-07-27 02:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `new_req_order_convs`
--

CREATE TABLE `new_req_order_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'سلام ياوطني', 'سلام ياوطني', '2022-06-20-62b0c6d13fa84.png', 1, '2022-06-21 02:13:21', '2022-06-21 02:13:21'),
(3, 'اليمن بلادنا', 'اليمن بلادنا', '2022-06-20-62b0cce1949ec.png', 1, '2022-06-21 02:39:13', '2022-06-21 02:39:13'),
(6, 'اطلب واحد واحصل على الثاني مجانا', 'من منتجات الربيع الان وحصري اطلب كرتون واحصل على الكرتون الثاني مجانا ولفتره محدوده فقط', '2022-06-20-62b0d45a16fe5.png', 1, '2022-06-21 03:11:06', '2022-06-21 03:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('01fbdc2dfd4cfe88462bc63a65a961d3ba28b2f9168d210122d1416ba98ef8cc2898cdb7081918f7', 216, 1, 'LaravelAuthApp', '[]', 0, '2022-08-14 03:58:58', '2022-08-14 03:58:58', '2023-08-13 23:58:58'),
('02317e2766d6f354d98da12f2bc4d7e02fc68d331327878c4b23798d35d5411c5f9ec8db8771ab75', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 02:05:47', '2022-06-14 02:05:47', '2023-06-13 22:05:47'),
('07cba7386992aec35227fb2a08f949043a5643d4d36079bb4f1a6d96e97ad5b1db79b541c0dc4956', 158, 1, 'LaravelAuthApp', '[]', 0, '2022-08-08 04:14:29', '2022-08-08 04:14:29', '2023-08-08 00:14:29'),
('0819483c9fd58a4bc418ca474c03e0e4e0125e9c6bca4ca6a79700977f9265963cd3a05c09385954', 167, 1, 'LaravelAuthApp', '[]', 0, '2022-08-09 13:27:26', '2022-08-09 13:27:26', '2023-08-09 09:27:26'),
('088def6825d32ffbffdf3467ca0c9c30cbaff73cf3720f12093fa140aaee99632d02b9faa6126799', 311, 1, 'LaravelAuthApp', '[]', 0, '2022-09-03 17:10:00', '2022-09-03 17:10:00', '2023-09-03 13:10:00'),
('0898c2285cd213fa47d6342c5adb0016caebfdb1cf99c695d6d4929aeea1019151af9b6874dbfa38', 83, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 19:07:46', '2022-07-28 19:07:46', '2023-07-28 15:07:46'),
('08fd2c978e2299fbee33359b6e13927f4b98c9d9c79508a657c09fc5497e0e20a4371e8c23606ed2', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-20 20:42:34', '2022-06-20 20:42:34', '2023-06-20 16:42:34'),
('0977cc1b0006bc0b427d16402a3e6f8209fdbf5bbb463f4dba4b93e89519c50599dd31ba85c29289', 28, 1, 'LaravelAuthApp', '[]', 0, '2022-07-02 07:41:40', '2022-07-02 07:41:40', '2023-07-02 03:41:40'),
('0a132e5580c85f453aad5007a2eadf59c12cf02790320c5db3ac1a6579f8b9241fe18fccfe2d3b43', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-07 02:47:31', '2022-06-07 02:47:31', '2023-06-06 22:47:31'),
('0a4121affdbb9b279b9943b7d0b1aac00223ab8103ea2f55097e6f5d1bf9d8ad765d917e2d451cfc', 336, 1, 'LaravelAuthApp', '[]', 0, '2022-09-22 16:38:08', '2022-09-22 16:38:08', '2023-09-22 12:38:08'),
('0a780dc03869674e0732f1e2a96baafd5cdd7853c8c390162d6ec92132235f49694f25e59cd22520', 234, 1, 'LaravelAuthApp', '[]', 0, '2022-08-16 00:36:54', '2022-08-16 00:36:54', '2023-08-15 20:36:54'),
('0aa7eb76992788176337d20b5b2b53a8ef0106911a3276b70f7b4991bed7595eddf135ac01abe59f', 61, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 11:54:00', '2022-07-27 11:54:00', '2023-07-27 07:54:00'),
('0acb7f36e4cf4a62be0e43ebe97cb3eb4df2899022a512c802f90a84da1818dc595512f2fdfa2fb1', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-20 06:35:32', '2022-06-20 06:35:32', '2023-06-20 02:35:32'),
('0b079a2e6a4a7c02189dbeed5938717f86b98d043686e28e2e0685fa63ed84d10b56d8ab54d78e45', 34, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 15:37:49', '2022-09-02 15:37:49', '2023-09-02 11:37:49'),
('0b0b42b86be2e8ba9577ead347a5a730b86def08702afea7f7cf9c9ae60b6237daf2a36f8973a27c', 31, 1, 'LaravelAuthApp', '[]', 0, '2022-07-06 21:05:41', '2022-07-06 21:05:41', '2023-07-06 17:05:41'),
('0b0c66463708da3e5b982bd24a4afd1bafe409ac936c7e7a9fbca566533597086e5199a1708c6222', 20, 1, 'LaravelAuthApp', '[]', 0, '2022-06-27 00:30:20', '2022-06-27 00:30:20', '2023-06-26 20:30:20'),
('0c2aee770e2e22f4258a6fb0b1db544147a91b7d38a24e1e5b53318ec6f3f609cc72c830d1f316ae', 318, 1, 'LaravelAuthApp', '[]', 0, '2022-09-05 21:28:45', '2022-09-05 21:28:45', '2023-09-05 17:28:45'),
('0c2d2ad960cd72a47f2c5b7ec96a52c15b2ab2a5190d8a2e995af7a1a1237f796baaee86b25fdbc6', 72, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 04:47:14', '2022-07-28 04:47:14', '2023-07-28 00:47:14'),
('0cd9eca1af077861fc2340cc641ac70ce8897fc8d8d495679754ea0bf80ad18f23ac22f77fc592d2', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 19:17:11', '2022-10-12 19:17:11', '2023-10-12 15:17:11'),
('0d6a5bfcdccc5fb75c49dca7b0fb066bc740a631d3ae66eea342d0e65cec63d7e8338816743f6781', 79, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 06:26:58', '2022-07-28 06:26:58', '2023-07-28 02:26:58'),
('0d98c74e5e70c8dc5a786cd965e6f216945c40ced65272a1e69b3b24e9d209704dead615f15785a8', 330, 1, 'LaravelAuthApp', '[]', 0, '2022-09-11 04:25:40', '2022-09-11 04:25:40', '2023-09-11 00:25:40'),
('0e39940c194a362e74ffe512804abca2f799e086cf83974e2772d7aa1074f614ce7b71274fd6162e', 163, 1, 'LaravelAuthApp', '[]', 0, '2022-08-08 18:25:24', '2022-08-08 18:25:24', '2023-08-08 14:25:24'),
('0e4cd5324cb3cf7195699861cd524ee16b4e91c7f987105c91533cf9b4ac6901835d6abd944369b8', 257, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 13:58:56', '2022-08-19 13:58:56', '2023-08-19 09:58:56'),
('0e78ed9b31d00efa5a11243d60b0fcb9d5e104e5cfb9be836a043c7e8530dd1a279ee6eda575a031', 282, 1, 'LaravelAuthApp', '[]', 0, '2022-08-29 01:07:37', '2022-08-29 01:07:37', '2023-08-28 21:07:37'),
('0efe9b252673b6fe3373280bf2b8d3daa6358a32fb8476025e4f78e638ab75c7a0ccc7b5a6d2ea50', 68, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 02:01:16', '2022-07-28 02:01:16', '2023-07-27 22:01:16'),
('0f838103183ff4613e5c7a2d0f37dfa272e313fa53f3b7c32953a0cc736bdc0c503d333cb63d90bc', 196, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 07:33:56', '2022-08-11 07:33:56', '2023-08-11 03:33:56'),
('0fa056445d232ec75be9951dc9845b7b2751d599e1661ba365fd40662fb697a3061aca3224fc7cca', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-15 18:11:13', '2022-10-15 18:11:13', '2023-10-15 14:11:13'),
('10494910e4050b99f880bdab52c59405ad0f4f0821c978cbba682d31f674cad84bc6356682068c1d', 310, 1, 'LaravelAuthApp', '[]', 0, '2022-09-03 11:24:57', '2022-09-03 11:24:57', '2023-09-03 07:24:57'),
('10ac80ec8957141c3605a74005a3db85ec8a0714f7cb734a67d8fc29bf67f43bbe756392a8ef1372', 307, 1, 'LaravelAuthApp', '[]', 0, '2022-09-03 06:32:34', '2022-09-03 06:32:34', '2023-09-03 02:32:34'),
('10b2533eca9608a990c72a285d199f55a9e10f6ab6d7eb9f7fd0dc28c57bd83be1a9d61bf4308572', 261, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 02:53:37', '2022-08-20 02:53:37', '2023-08-19 22:53:37'),
('111c38dbb48e54fde471170dbf60cf4e3de58e18063caa57adfd88e70586ac6d4c88d329e4d1bbfd', 247, 1, 'LaravelAuthApp', '[]', 0, '2022-08-18 00:20:21', '2022-08-18 00:20:21', '2023-08-17 20:20:21'),
('116e6af41b24294d4c8e8c2acbcdbc9f74f2e909229134833a84d3e35e03a369369bfe6ecac82755', 67, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 22:44:43', '2022-07-27 22:44:43', '2023-07-27 18:44:43'),
('11b08904eaa2e6f43b1cc9001e73271471fac7f4cc12f22a641c6e3edf75bf87ebac3352134bbb2e', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 04:47:26', '2022-08-17 04:47:26', '2023-08-17 00:47:26'),
('11c5867221a1b5b3f274e0e848f1c4f5dde03073b38392f1e374087c5e5d3084e77d3db09d495f2b', 79, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 06:28:15', '2022-07-28 06:28:15', '2023-07-28 02:28:15'),
('11e23e6a6b8a33dcf58d26355fef09ef7efded07d1d3065d36bb7207d4836ed84eebecad93de88c1', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 02:16:37', '2022-06-14 02:16:37', '2023-06-13 22:16:37'),
('11ebf81833394a09756490598528a127f531dd8669f1082416b0e4c5482a799b04c7b785bc6bf795', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 23:48:33', '2022-08-17 23:48:33', '2023-08-17 19:48:33'),
('12932c9157ccb4fc1aff6cbd16229dc8fd011748655b8355d22b4b909fc6242b96ddc3c174415148', 116, 1, 'LaravelAuthApp', '[]', 0, '2022-08-04 03:13:53', '2022-08-04 03:13:53', '2023-08-03 23:13:53'),
('1294449992ec36f6019e3f40117ce84b8db49b5a0321a7e8627003630b0cdf672cfb02d49392d093', 265, 1, 'LaravelAuthApp', '[]', 0, '2022-08-21 18:46:22', '2022-08-21 18:46:22', '2023-08-21 14:46:22'),
('1297b0dd9e74c851c57b3055853d068c4109124d5486132b5bd51efa5d72ddf5bf62e743253d3811', 155, 1, 'LaravelAuthApp', '[]', 0, '2022-08-07 23:13:15', '2022-08-07 23:13:15', '2023-08-07 19:13:15'),
('13ccbf4d328328bbcfb05fde60784ede4881cceed592eb45745e292e78b08722f4e51c96cdff5a2c', 51, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 02:59:24', '2022-07-27 02:59:24', '2023-07-26 22:59:24'),
('141010a85af656b31262b27ed92c9aa8f89ea8d84b349bf1e8f83e2257aa12fd32bdd7d529067780', 60, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 11:21:06', '2022-07-27 11:21:06', '2023-07-27 07:21:06'),
('142612646473157bdfc499868f02b24671686a1339be7ee68480f1fd7013b296376dafeaf417c52e', 325, 1, 'LaravelAuthApp', '[]', 0, '2022-09-08 04:04:17', '2022-09-08 04:04:17', '2023-09-08 00:04:17'),
('1440c38c6ccce64fc7054f85921297711088dcf32e901341397a7e483ce5267458a1ec2f47da3a69', 278, 1, 'LaravelAuthApp', '[]', 0, '2022-08-27 10:09:17', '2022-08-27 10:09:17', '2023-08-27 06:09:17'),
('146259caeff32c00aba080d743ba09e96c9a4d6cbca726a58e4dc033eb26a560fc2ad1f753ffa685', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 20:34:50', '2022-10-12 20:34:50', '2023-10-12 16:34:50'),
('14bbc34d7461322a4d51d3e869ed612b893049c1ca62c05f397767b231e81dbd8acc9e33371a5497', 348, 1, 'LaravelAuthApp', '[]', 0, '2022-10-13 00:26:28', '2022-10-13 00:26:28', '2023-10-12 20:26:28'),
('1529b03b445fc1d1bdb5eb60fc9a8385fcd417df1675882b0e0c088a7155347c3d748481d4907f5d', 249, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 23:08:02', '2022-10-12 23:08:02', '2023-10-12 19:08:02'),
('157bb8efdc4fdef668ce19e5ca507db4ae614160bd6a93d4d15fb50740aeaf0b6d3e333a9e58ea46', 227, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 05:14:13', '2022-08-15 05:14:13', '2023-08-15 01:14:13'),
('159103fc2ddc3bc0d72e37bca5f0b095ab87f1eda5c806e2586d569c40860a5b96745b1ac5ad8aa8', 194, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 02:44:37', '2022-08-11 02:44:37', '2023-08-10 22:44:37'),
('15937fda68bd894cdff04bd0e5378f51b600705fd0d045197d87cf60a679e9ac31fb464b4f519abd', 151, 1, 'LaravelAuthApp', '[]', 0, '2022-08-07 00:58:13', '2022-08-07 00:58:13', '2023-08-06 20:58:13'),
('15c7874b912ab2b633d9669d7747fb38f240b58bfe6ec2cc936bdae93dddf589764300bbe48eb971', 214, 1, 'LaravelAuthApp', '[]', 0, '2022-08-13 22:31:54', '2022-08-13 22:31:54', '2023-08-13 18:31:54'),
('163522aacbeb3584d5b75ffa077b3bbc59a971ae428f42ee3200e51c6c9fe900154ed65fa9333fbe', 88, 1, 'LaravelAuthApp', '[]', 0, '2022-07-29 07:05:28', '2022-07-29 07:05:28', '2023-07-29 03:05:28'),
('165c6f23d085edbf04b6d5513de303e1fcab3cbaeb1fd20b76173361290424a06cd26630ea8512ab', 114, 1, 'LaravelAuthApp', '[]', 0, '2022-08-02 23:30:42', '2022-08-02 23:30:42', '2023-08-02 19:30:42'),
('166380ef2435e49f2e13490c8b296bbd0503a9a900b988e64101733b90fc5621e5eb2e92db9bc5e0', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-19 02:01:23', '2022-10-19 02:01:23', '2023-10-18 22:01:23'),
('17903e802794bb45c108191552e45da9959233998a1ffa21b452da8b84bf829ef797c1dcd8547950', 228, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 07:11:03', '2022-08-15 07:11:03', '2023-08-15 03:11:03'),
('18bda2e44cd1f09879eca1ad9cf47d87b708d9c4db448a49af23655a469a59a61ce7a0fcbeda6a87', 166, 1, 'LaravelAuthApp', '[]', 0, '2022-08-09 13:21:22', '2022-08-09 13:21:22', '2023-08-09 09:21:22'),
('18ebb7dbf6378bfccac7650e2595d994aca5dfb6ae3019c6f48590b8418c9d9523816bb750988d86', 348, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 21:16:29', '2022-10-12 21:16:29', '2023-10-12 17:16:29'),
('1913cc93b73ff950df18d5ea42ccd40fc5b6e3ac2175cf999747ee80ab531991e8fda0aa7ef37f51', 138, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 12:54:34', '2022-08-06 12:54:34', '2023-08-06 08:54:34'),
('19684e37ec054a0188a1a02edcaf10825356f4d2568555c86632d513ea8af18bf96ca6960fb53c08', 212, 1, 'LaravelAuthApp', '[]', 0, '2022-08-13 05:30:45', '2022-08-13 05:30:45', '2023-08-13 01:30:45'),
('1a4adcd33bd265f563eda6557eb0c72fa966b544dbe9d9d0f21519c10b2198a673b1bbf102c14aea', 254, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 05:59:41', '2022-08-19 05:59:41', '2023-08-19 01:59:41'),
('1ae6dcbfcfc02848e6c4653ae865a5fe094b809e21be6d5f67028ee40344247fb1e65f448168320f', 114, 1, 'LaravelAuthApp', '[]', 0, '2022-08-02 23:28:55', '2022-08-02 23:28:55', '2023-08-02 19:28:55'),
('1b49c0433df0da7f1660e5446e234c24237dfaf7f8466604bf6d2a0624dd6f830ad93212ed11a606', 279, 1, 'LaravelAuthApp', '[]', 0, '2022-08-27 23:04:57', '2022-08-27 23:04:57', '2023-08-27 19:04:57'),
('1b94b8d16689f581e45bd140b0de511445b31889580197e05a4b5e2cce3ce1db4b9fb95a4d144eb3', 114, 1, 'LaravelAuthApp', '[]', 0, '2022-08-02 23:31:03', '2022-08-02 23:31:03', '2023-08-02 19:31:03'),
('1be954857a917cf54469408913d65e7d7b50b396765832bb34fca0a8a9cfa133bc89b0bdc6f174c7', 203, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 03:26:12', '2022-08-12 03:26:12', '2023-08-11 23:26:12'),
('1d63e620e01c7ea7c55477eb618c8ae92aa1cb61f29421d13aea18d4eff8ae3675e07f316900a4c9', 65, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 17:22:40', '2022-07-27 17:22:40', '2023-07-27 13:22:40'),
('1d6ba93f337a3fe7a5d4441292bdac32b456f2326daa3c136750fb47bbc0e6a4506533f247310e0b', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 02:08:05', '2022-06-14 02:08:05', '2023-06-13 22:08:05'),
('1dc34ede3caab78bc194cd4b194b6ce2f070016db394308fc9168545264aeff4ba665edaf087e729', 12, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 02:23:38', '2022-09-02 02:23:38', '2023-09-01 22:23:38'),
('1de19315b4df4853120b0cc79cadc1a11890125f2b4609c3d2fd22660bf76c212318dbda7cb758fa', 315, 1, 'LaravelAuthApp', '[]', 0, '2022-09-04 02:01:12', '2022-09-04 02:01:12', '2023-09-03 22:01:12'),
('1e4b1ea13c971a0e3b58fc5f03c2bd16091827e4ec1f03f99dc29ad5edd099cb3a70c72077051522', 299, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 21:21:49', '2022-09-02 21:21:49', '2023-09-02 17:21:49'),
('1f1ae8fb3487e127a1aada1b55d4c446b9bd0767725054bc72fc653e28b274311e6572e4b566d6a8', 171, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 00:40:47', '2022-08-10 00:40:47', '2023-08-09 20:40:47'),
('1fd760351ad403805bd8d450fa2c00c00c4e922a77128b2c4b725989df6f4c3b370433c4b41690c6', 312, 1, 'LaravelAuthApp', '[]', 0, '2022-09-03 17:49:50', '2022-09-03 17:49:50', '2023-09-03 13:49:50'),
('2233205a600b31b24043898a721140d1a10a2e0174ee74de34a30a497ee665a2e5e2c9bf2c11a9ac', 187, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 19:54:14', '2022-08-10 19:54:14', '2023-08-10 15:54:14'),
('224246c1f49b78abb713f2e47c0225ad6b8e77dddda2c5af057a343e531577d7339605e8bde99703', 102, 1, 'LaravelAuthApp', '[]', 0, '2022-07-31 18:48:50', '2022-07-31 18:48:50', '2023-07-31 14:48:50'),
('2257215a6c5e6da5030781f005a7bc7462bdf97a88a20989431d82fc259645aa862f091fb51370f9', 178, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 05:11:12', '2022-08-10 05:11:12', '2023-08-10 01:11:12'),
('22f3b17e46c65e52c1661ffde4bd8a410a662938717423daecd4aca0c50f1aa523d575c1f0a89ad6', 108, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 16:12:12', '2022-08-11 16:12:12', '2023-08-11 12:12:12'),
('23243f6907220e90d5b30c8c707844148c0ebcb5dd7af30cba3d22860a6eeeb77337ee831291f006', 30, 1, 'LaravelAuthApp', '[]', 0, '2022-07-06 07:43:44', '2022-07-06 07:43:44', '2023-07-06 03:43:44'),
('23680adfdaa5ef79b458230cbe1dfd38cf0a6a58175c5eef43810e0db419912b1e96271001ad58f9', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 05:01:53', '2022-08-17 05:01:53', '2023-08-17 01:01:53'),
('239b49a929a2a2e26ac284a52330af4b9beb2be369015d6a5e685e4f8f04b9fb9348b3e1daf9a29f', 65, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 17:27:52', '2022-07-27 17:27:52', '2023-07-27 13:27:52'),
('23bce59716266f3e871c9a59bea1401af2de6aad646ea33f5dbf65cbea65d396a53d7ecea707f9c4', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-08-08 21:13:22', '2022-08-08 21:13:22', '2023-08-08 17:13:22'),
('245b3eeb9e828463a62911a51017ce4224eb44f774db1ea47c6dea11303ca2af2750f0a2fe630e45', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-08-01 22:42:25', '2022-08-01 22:42:25', '2023-08-01 18:42:25'),
('25a4a6141256a234c273d7c09b946e738d1016b2312e3cc98be85504e2f30bdcdf7de8f2f2bf6e4f', 348, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 21:51:55', '2022-10-12 21:51:55', '2023-10-12 17:51:55'),
('267e2204a6015d0bc094c5aecefb1b86ee7cceefe5b19c98eb804d69895e0b625d0eb6004a6a9ddc', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 23:48:04', '2022-08-17 23:48:04', '2023-08-17 19:48:04'),
('28238aceb1fb22bdf2d257f9ff391d51703779f0c08e1e86e097eb285dfa7275773f07ba8f48db86', 175, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 03:05:45', '2022-08-10 03:05:45', '2023-08-09 23:05:45'),
('2978159a334d3b20b48dfe288435707d4a780b021b25e56b7423d90b48a9eaf07fe8274d5853f619', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-20 03:10:48', '2022-10-20 03:10:48', '2023-10-19 23:10:48'),
('2a520cbc1f6e79a56b824111489c0da0a3d84bd22c5cbf6d050a05f235c4b28113ec31c7baf49683', 49, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 01:45:56', '2022-07-27 01:45:56', '2023-07-26 21:45:56'),
('2b45ec41bb2bac2025a0d5348b0cabec0cc1262e97d096a8dcef53cbdb6c6feb008b0c268595fd85', 263, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 08:04:20', '2022-08-20 08:04:20', '2023-08-20 04:04:20'),
('2c17c7260dbe952b4929a803769da8a77c3d457141b74da88379299cce595803df1fa11f508cba50', 131, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 01:11:02', '2022-08-06 01:11:02', '2023-08-05 21:11:02'),
('2cf07303033f6b9ca3c1a84956d3b651c80aa77d1426a1ad1ac1b9b5e18efc8a888dc5858189f4c6', 65, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 17:29:54', '2022-07-27 17:29:54', '2023-07-27 13:29:54'),
('2d235eb484ca8f5666ba3291bf5c1c0bd20e4345636d9e6f700d5f6ce0be680c942b963d758b6d67', 21, 1, 'LaravelAuthApp', '[]', 0, '2022-06-27 14:04:36', '2022-06-27 14:04:36', '2023-06-27 10:04:36'),
('2d973694188edbbc3ce31bba6883323e88005b55ec231d33a7b30e8b7676eac3392b74511b46932a', 157, 1, 'LaravelAuthApp', '[]', 0, '2022-09-07 10:22:32', '2022-09-07 10:22:32', '2023-09-07 06:22:32'),
('2da9b7d8d2dd763bcbc080de822ce2f99b5abb1bbbe8a5351fb4808e2e9a6785364ae51acc1ac338', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 05:02:13', '2022-08-17 05:02:13', '2023-08-17 01:02:13'),
('2e6774f34d91e22f982b37bba58147735b78cf7611bc179d1d969d30119b7cf838f5b7416d86091e', 145, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 07:39:13', '2022-08-06 07:39:13', '2023-08-06 03:39:13'),
('2f3ab578a0ef291ecbe82970318b48fc005b4cbcbf029ec9e1610bf880c068fb64037e285434d0fa', 186, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 17:25:14', '2022-08-10 17:25:14', '2023-08-10 13:25:14'),
('2f49340a1751429abd74e7e550addee40642e8ae299bd74c2d2e4d28b40b1ba2d1282fb804b1cb97', 223, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 00:41:40', '2022-08-15 00:41:40', '2023-08-14 20:41:40'),
('2f80106f24058fde0105df5f483e981570ba8044d3815ddc3d5fce9c104adb9006aaaa4cc482b160', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-21 22:44:50', '2022-10-21 22:44:50', '2023-10-21 18:44:50'),
('30cd743c33bb633d13e5ecf3f4b4266109045521c72bde3c0651ab600b5de885057ba22399787020', 207, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 22:49:46', '2022-08-12 22:49:46', '2023-08-12 18:49:46'),
('312f0c73c77563c00bac8f88da56264fdaaea56265870dd08b93e45056f87bdb6d89438f4502ae48', 23, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 19:18:44', '2022-08-19 19:18:44', '2023-08-19 15:18:44'),
('3174fc156f176966d938c4fb60ce3aa8dec9af185095daf41c1e94a65481aea79fe9d326bbe8c248', 271, 1, 'LaravelAuthApp', '[]', 0, '2022-08-25 05:34:43', '2022-08-25 05:34:43', '2023-08-25 01:34:43'),
('325055c70aea5e04de4082d918d445066b7d921390ac4a212fea952ec2ff506087afa083f314515b', 69, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 02:18:43', '2022-07-28 02:18:43', '2023-07-27 22:18:43'),
('329d741ea30c1edf004baf66f3ce530302f8c0226b439d7ca85fe7a4202c9b52a02198fae6346244', 337, 1, 'LaravelAuthApp', '[]', 0, '2022-09-22 18:45:45', '2022-09-22 18:45:45', '2023-09-22 14:45:45'),
('33a4efc4cb5848fb14957f6ea43c2d4e424a0340857076c8955fa048e57e7713acfa9aaafc76f74c', 350, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 22:32:43', '2022-10-12 22:32:43', '2023-10-12 18:32:43'),
('33ff86bbf88c25ab3d81346ecb8b94459820f29584195c75b4c871969d94b7c9ed6786ae6fdcf50d', 233, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 21:22:45', '2022-08-15 21:22:45', '2023-08-15 17:22:45'),
('3402efe903bbcad410c91e5bed12c2494a09b1e9bf06033ce616484791d346decd48caefdf0cbe98', 140, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 04:55:13', '2022-08-06 04:55:13', '2023-08-06 00:55:13'),
('340d1e7400b9c66f5978cc3bdddfad43d887b8c5bdbe251d4ad3de4c855b490f0a851a6395c3e8a4', 85, 1, 'LaravelAuthApp', '[]', 0, '2022-07-29 02:51:15', '2022-07-29 02:51:15', '2023-07-28 22:51:15'),
('34e55daeeaa6e2b33eac5240792da8ecf471c900d5e7d24b76095dc066605634bb646c8d2698c2cc', 144, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 06:29:54', '2022-08-06 06:29:54', '2023-08-06 02:29:54'),
('3502beaa2da86d8c79d8f03ad01b624d55e42bb03096b156feb9ec6f64999b09ad7cc3791e5d1e46', 124, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 01:11:37', '2022-08-05 01:11:37', '2023-08-04 21:11:37'),
('35148e4100e8669994cbb3e6f5bd15f527655fab7e9aad13a7ea3b0cd8adc1dec68798525ae9429b', 196, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 07:36:53', '2022-08-11 07:36:53', '2023-08-11 03:36:53'),
('352336e66a85aa70ec46ea3a4794d3f1852cc7c3a73d6da5ef41ad27311ff8b3da408e7176d44a98', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 03:38:48', '2022-08-17 03:38:48', '2023-08-16 23:38:48'),
('363c4f3736e9af4b39a296da41a68572ca8b83e4503eea30bdf8ac9a0b19e6cd8d447b34166b2ffd', 48, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 01:42:34', '2022-07-27 01:42:34', '2023-07-26 21:42:34'),
('3785810a09e2de9d316b7db5d838891ced2dc2cdbebad4d81586fcf74a141cc1d9ab265e30ea9a8d', 153, 1, 'LaravelAuthApp', '[]', 0, '2022-08-07 03:43:34', '2022-08-07 03:43:34', '2023-08-06 23:43:34'),
('37a7a27be98094124f3a0aac567a00a9a3f70364f08a6c51231dfb75644072c9c4d46a6b57f416bd', 157, 1, 'LaravelAuthApp', '[]', 0, '2022-08-08 03:51:42', '2022-08-08 03:51:42', '2023-08-07 23:51:42'),
('382932c9cad79e1485b9a33446eb59ad8eac54a7a5861e0016b49b0a804f7e1883555ce19d52b65f', 302, 1, 'LaravelAuthApp', '[]', 0, '2022-09-03 02:21:06', '2022-09-03 02:21:06', '2023-09-02 22:21:06'),
('3844eaf3928a0aeb873072f4774b7149f863757fdbe04058df0ae0cee2f5e1ef069fe829305738e6', 238, 1, 'LaravelAuthApp', '[]', 0, '2022-08-16 16:55:26', '2022-08-16 16:55:26', '2023-08-16 12:55:26'),
('39502dd463ba36508849cf709f472f1fb8cadd0f77cea33df6a9877c991538d7fc9a7415420a6403', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-16 00:02:16', '2022-06-16 00:02:16', '2023-06-15 20:02:16'),
('39b95ed1bdbed4e0c89471b4364adf381bc67ede25e543683acb49da4a8c5ca4f5b776c0d9b6337a', 292, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 01:34:42', '2022-09-02 01:34:42', '2023-09-01 21:34:42'),
('3ada884b4b4a25da769c2bc617fb62d3f378dee9b5aaf499c459f394cd27f2b5ebb8f4cf12ee5cec', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-19 19:05:24', '2022-10-19 19:05:24', '2023-10-19 15:05:24'),
('3ae4ab862c0e3c66690849f5ab6f6f2504478c082082bddbb826fafe1a573b95d1046eaf0774eda1', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-15 17:28:04', '2022-10-15 17:28:04', '2023-10-15 13:28:04'),
('3b095c88d3ce439308b3722f00f5b406f1a305a66664928bf3da4ac488f50ff6c97a1bad945173ae', 59, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 08:02:39', '2022-07-27 08:02:39', '2023-07-27 04:02:39'),
('3b3c51a8979e9073773203d3f442b96f99248540b6964fb27d80e644529f0da36e67a7f15ed5d495', 33, 1, 'LaravelAuthApp', '[]', 0, '2022-07-11 16:12:17', '2022-07-11 16:12:17', '2023-07-11 12:12:17'),
('3d9cd2e4fb6e8ca30926a0f8bbd30b3179dbf9e1ccd8339e006dc3ac06314d9ce9f28c42fcf84185', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-08-08 21:04:35', '2022-08-08 21:04:35', '2023-08-08 17:04:35'),
('4046e112ccf44bbf4f24d385bce4f32c22d0f84d55917eb51e11ea4155d1e72aa9624f1b84757a98', 152, 1, 'LaravelAuthApp', '[]', 0, '2022-08-07 01:44:44', '2022-08-07 01:44:44', '2023-08-06 21:44:44'),
('40a54d08b05d1a99d670bd2f3390d8ee7ffe1dc39749ff4e4ead33b6b3cbd9ab2466607378521e9e', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-08-01 22:43:53', '2022-08-01 22:43:53', '2023-08-01 18:43:53'),
('40ee6680776aea1876b1a4d182c2cd57e34690409898f68557b5034dec57faa227f21db8c73d0027', 34, 1, 'LaravelAuthApp', '[]', 0, '2022-07-11 21:04:54', '2022-07-11 21:04:54', '2023-07-11 17:04:54'),
('410091b95418da9e6dcfb2a73e042f21c43be7604d046664625dc7aa00565468b53800cda10d0be9', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-20 06:25:34', '2022-06-20 06:25:34', '2023-06-20 02:25:34'),
('448a401a469aa851db8b04376bac2b2f9dd38cd517ff643eaf19995e75644d49406fda04d0c78b75', 251, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 05:38:26', '2022-08-19 05:38:26', '2023-08-19 01:38:26'),
('4493d57f62486d540161cf3f121cc938b28787b8becacb65f27e83109c3322860f4897980e3242bf', 184, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 14:23:29', '2022-08-10 14:23:29', '2023-08-10 10:23:29'),
('44cefe74ca04a378e1cd666ba94ccfe32c538a569cb906036068c273c677e9999c9116732c30cc03', 113, 1, 'LaravelAuthApp', '[]', 0, '2022-08-02 01:04:17', '2022-08-02 01:04:17', '2023-08-01 21:04:17'),
('454c7c850fdd2526874120c2f36a30b6082d4364214c85661a1966ad1bb83324c39172e25a84ed02', 301, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 23:17:50', '2022-09-02 23:17:50', '2023-09-02 19:17:50'),
('4557f988388e7dca0865416dcb1899a1c80db0bd943d724a579f073d89063a291fb502c541e402b1', 223, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 00:42:39', '2022-08-15 00:42:39', '2023-08-14 20:42:39'),
('458d4d13c88c1f970d0892e553d1c7d96df1e2fde27404bda1d1b4841aa58e666aced00607f04117', 191, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 22:33:50', '2022-08-10 22:33:50', '2023-08-10 18:33:50'),
('46b64bd77e54bb44e3df35fd46ee45462dfe3b464d7467536fec0e0bda6657e036e9ba0aee7a1483', 120, 1, 'LaravelAuthApp', '[]', 0, '2022-08-04 04:38:44', '2022-08-04 04:38:44', '2023-08-04 00:38:44'),
('492aadd333dd2561f8bf8567cc2c40e4cd82c5af7a4088d67b510121f57e3675f631de7f595953e1', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 22:11:45', '2022-10-12 22:11:45', '2023-10-12 18:11:45'),
('494ffa40d996a9d63341724b2199f19d6e4bab80c0933455511e8d13219a860b7fd0c825030783c2', 106, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 23:22:57', '2022-08-12 23:22:57', '2023-08-12 19:22:57'),
('4a35c5085979acfd73df917e8fd7a30b6de02ea58f9b907ddb2a0163f4a7b19b84cf4df00772f531', 22, 1, 'LaravelAuthApp', '[]', 0, '2022-06-28 14:21:02', '2022-06-28 14:21:02', '2023-06-28 10:21:02'),
('4a56df0c02f84a423c775eb2661afc2f1ea82da3a9d2d54358692c7385cacf431dcd408b8ffff602', 364, 1, 'LaravelAuthApp', '[]', 0, '2022-10-19 22:01:20', '2022-10-19 22:01:20', '2023-10-19 18:01:20'),
('4b8e0aca3f68b7c515923a0b6d43116060c56ba10f0d5a00e18b95136fdf661ea28aa47f671329bf', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-11 20:20:54', '2022-06-11 20:20:54', '2023-06-11 16:20:54'),
('4be7e00200a027c62fa10087a7ca32936b1c3fd35e20934f2dfd19239e8b9db34ec4af54369540fb', 71, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 04:13:28', '2022-07-28 04:13:28', '2023-07-28 00:13:28'),
('4c2b4e352959b313f10c3cc1a02f8a15bba5a70020820b48e8667a731665fc16e2927383e592e7dd', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-19 02:55:00', '2022-10-19 02:55:00', '2023-10-18 22:55:00'),
('4e258906371e45653fed8b89ffe269f46c46f563a35641ca839e52c97149c604c79b741f54bf076f', 207, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 22:55:06', '2022-08-12 22:55:06', '2023-08-12 18:55:06'),
('4e2a7a24ca68318371ff69e40dcc05849ffaa5cbb9913dd49d8a712120fbce392783deecaa5d960a', 206, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 20:01:53', '2022-08-12 20:01:53', '2023-08-12 16:01:53'),
('4f81d9d13bd55534defee40b12b2390bf7242a1539dd9a619ab59ca8419f3fe87a338d7ffc2825d4', 159, 1, 'LaravelAuthApp', '[]', 0, '2022-08-08 07:03:56', '2022-08-08 07:03:56', '2023-08-08 03:03:56'),
('4feb87921c7590ca434acdae42c083f07c6f31c73576e422d2aa6c4d26defab1698667eece0fd180', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-13 14:56:12', '2022-10-13 14:56:12', '2023-10-13 10:56:12'),
('4ff6d54e8c436cf848095cc469ed3e62fb5abfb36c2a935a99e96641de0e31cc338de3a57e852d46', 168, 1, 'LaravelAuthApp', '[]', 0, '2022-08-09 21:46:35', '2022-08-09 21:46:35', '2023-08-09 17:46:35'),
('526073f9c79baeaf6e0600632a8da29633553fbf655fcf5e33389da22fb0cfa4581f4d853acd0241', 222, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 00:09:23', '2022-08-15 00:09:23', '2023-08-14 20:09:23'),
('528078b2bd107127900a65e1b99b3d8253093ec72e735ba84f9dae1b9df68655f86c5bb46638936c', 13, 1, 'LaravelAuthApp', '[]', 0, '2022-07-18 03:41:04', '2022-07-18 03:41:04', '2023-07-17 23:41:04'),
('52814670e19ea21ee97a4f0a2d5245ed4db5e60e8fffbb14d0e5cbea134d47bc22fc80dd4ca3ec40', 281, 1, 'LaravelAuthApp', '[]', 0, '2022-08-29 04:09:10', '2022-08-29 04:09:10', '2023-08-29 00:09:10'),
('5288a2c0e269c2e371eed3a2a3759d340ea0732e2865a8f6b9da5dd01b724db57a58ac11efd31c58', 32, 1, 'LaravelAuthApp', '[]', 0, '2022-07-09 22:08:48', '2022-07-09 22:08:48', '2023-07-09 18:08:48'),
('531db93e35b6ecf510e32f65de85129e8eaffdbd01cb7507f7f9f7ed1915b52a78a9e75d315fd150', 194, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 02:41:58', '2022-08-11 02:41:58', '2023-08-10 22:41:58'),
('5348f6ee0958a070e076f98761198ab06923061c3478383493ae82c6ab607d864c420b6b1c6664bc', 174, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 03:01:46', '2022-08-10 03:01:46', '2023-08-09 23:01:46'),
('53542392778a4ced1eabf51675ba739776dcdabb319d76839dc8d5f82675385111da600ea2630c44', 317, 1, 'LaravelAuthApp', '[]', 0, '2022-09-04 06:00:31', '2022-09-04 06:00:31', '2023-09-04 02:00:31'),
('53a296655106be7f797bf6976772624402a43394ebe69be51905097e0ac7f97f6a3e72a953921ced', 269, 1, 'LaravelAuthApp', '[]', 0, '2022-08-24 21:10:23', '2022-08-24 21:10:23', '2023-08-24 17:10:23'),
('5420c388eb864ae9dc1eb6e668e2212ca38cdc997209f398e05b9369b64824af787282a7c138bfec', 274, 1, 'LaravelAuthApp', '[]', 0, '2022-08-25 20:36:39', '2022-08-25 20:36:39', '2023-08-25 16:36:39'),
('542200c9281667ab922de3e8ba722cc08ad11e9c8bfe761a952d1bb0df23995e84f65e85c1667f5a', 255, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 06:14:25', '2022-08-19 06:14:25', '2023-08-19 02:14:25'),
('54f790fcf3cd48cd525e7fddcbd8805bc3c3ffae946f5c78978863c24ff7456c434381ec4b15d44a', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 19:55:27', '2022-10-12 19:55:27', '2023-10-12 15:55:27'),
('55845f0a70047ab573e2e24eba0bf5feb85fcb02428de70b65d53e2910740dda5aacfa2e2c3d857f', 233, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 21:26:05', '2022-08-15 21:26:05', '2023-08-15 17:26:05'),
('55d518fb33a6f22aa6f328ecfd17ee49b6c6df4c6967d04c23ade5f90e239dd0b2f8093dd33e9dbe', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-19 01:10:58', '2022-10-19 01:10:58', '2023-10-18 21:10:58'),
('55e94e37e78172f7e05c38f6e7a7439ed48d8d70f27bfc2b1cb7fbc75008a1c2053807fd6859987f', 18, 1, 'LaravelAuthApp', '[]', 0, '2022-06-25 05:35:10', '2022-06-25 05:35:10', '2023-06-25 01:35:10'),
('578f0e8cb0ed6c3fe5b7083b5704c73b90ca32c2dbd1a023d854b7e5f416c95ee35cb649da39d436', 50, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 06:53:51', '2022-07-27 06:53:51', '2023-07-27 02:53:51'),
('57999ac6e8d5b59f58aad78ed6f5f11f3fc079aa541e7842702a44022ea5019e42d8b928eb47e439', 279, 1, 'LaravelAuthApp', '[]', 0, '2022-08-27 23:03:13', '2022-08-27 23:03:13', '2023-08-27 19:03:13'),
('58883f5b1b572bd658c4fd46412d505c6a5c2a796b8a4673015faccb59165bc5d26a24bf25bc6790', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-05-25 20:38:14', '2022-05-25 20:38:14', '2023-05-25 16:38:14'),
('58bcb7671a728fb244faf8af105dbdbb307374671b121b1d0ddbd81d9ef0afebb2d690e7bddf66c4', 342, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 09:22:11', '2022-10-12 09:22:11', '2023-10-12 05:22:11'),
('58c87ad236ba35a20c735cf5976c8f49103e38a2cca722aac81b2d12ebb3e1282fcbe43b6d59214d', 91, 1, 'LaravelAuthApp', '[]', 0, '2022-07-29 07:25:59', '2022-07-29 07:25:59', '2023-07-29 03:25:59'),
('58cf82b067bb0f11db23c9b728e07c0fc41fc82f2ed0a01f5cae0679bafb17b89231be85229e1039', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 23:51:13', '2022-08-17 23:51:13', '2023-08-17 19:51:13'),
('58dfc09d857268d4ed41182bf5678dcba3cc75c04322c036a714a33595acfbfc34239550b05b9325', 55, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 05:12:25', '2022-07-27 05:12:25', '2023-07-27 01:12:25'),
('58eb3c2cf21b35e23fc5963563d18ef8e7a8f298e24056785894da01decce9406325792b17963cd4', 181, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 10:11:09', '2022-08-10 10:11:09', '2023-08-10 06:11:09'),
('593fc4c5d9bbff4c58562e75255c9c402233b1ef46f6c4815569975c90bdb443aaa7c7e900d4ea05', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-18 18:29:55', '2022-06-18 18:29:55', '2023-06-18 14:29:55'),
('5a3a6ac5ca0b3b90a63ebfe36151d2e2d7401e87e52f47742f22aa92232f4dd77a11c947744700f8', 27, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 00:21:12', '2022-08-12 00:21:12', '2023-08-11 20:21:12'),
('5b46294d24677bb88b68ecaeb762319d185ca1f2435047c478da8947e163cf1041452762eeeabffc', 148, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 22:45:50', '2022-08-06 22:45:50', '2023-08-06 18:45:50'),
('5b6307022dc9d6bb5dcd9bba710a2190fde1195423d124489cb5659da4de65b5a60046e3b2d703c8', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 01:35:28', '2022-06-14 01:35:28', '2023-06-13 21:35:28'),
('5ba9e4b79464b3aa670b6709b7df6bc3b23c9c8f1c4ac7e99aa6d7c95c6a8e606172115592178425', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 01:46:37', '2022-06-14 01:46:37', '2023-06-13 21:46:37'),
('5c8b3bdb29370dd6a8d9f3348098eadc6a7827877f0da269af825ca43e66e97a2e1f593a27169863', 375, 1, 'LaravelAuthApp', '[]', 0, '2022-10-20 01:44:51', '2022-10-20 01:44:51', '2023-10-19 21:44:51'),
('5d66fb320ce498bd7de824147d241678e447adfc85f4fd7560880ba2358a4eb6e4bdb6504afcadce', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 04:11:05', '2022-08-17 04:11:05', '2023-08-17 00:11:05'),
('5d85c14afde573b7ab56ed0fc2ddfb621aa1e3a1e490a4d4dcdc401640f08f7e44d4404ff2fed9d4', 291, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 01:23:53', '2022-09-02 01:23:53', '2023-09-01 21:23:53'),
('5e3c4efb822c3cf994f427eb0c6098b5364012506760b9db9c88eb7efe1fe16de26b600b96e6d63a', 366, 1, 'LaravelAuthApp', '[]', 0, '2022-10-16 21:42:57', '2022-10-16 21:42:57', '2023-10-16 17:42:57'),
('5faf676890c05b148428503e2fdc247163fc634a33fb7b977f61be5699568d087364f9e9cb44aecd', 225, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 03:23:02', '2022-08-15 03:23:02', '2023-08-14 23:23:02'),
('5fddf0e83ea6edd79baaad2e7f688b3a627d94bed405d525992a80a6170dcd4ad269dc5a8fae3f24', 331, 1, 'LaravelAuthApp', '[]', 0, '2022-09-11 17:05:36', '2022-09-11 17:05:36', '2023-09-11 13:05:36'),
('605f5618eec60cdb90b51d787b90b10a59522dfd20240db54a72b1f701f6bfe972301bd5c124dff5', 190, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 22:16:55', '2022-08-10 22:16:55', '2023-08-10 18:16:55'),
('612f14d71c539af3bc3e533ee868c358aa728ebf81ed3e4a8aad57326d9a1fc0d1407eb27a555cdb', 240, 1, 'LaravelAuthApp', '[]', 0, '2022-10-23 02:04:55', '2022-10-23 02:04:55', '2023-10-22 22:04:55'),
('621ff0601a735ece15243759acd3d305b1cec6ce0d9fee52b1f50718aadd99255c083e7337cac7f8', 239, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 02:31:22', '2022-08-17 02:31:22', '2023-08-16 22:31:22'),
('62a8eb9a9b6df63c73fddae747629d40e52c82f335402c1313878d8bf809bb2d1f50ffd256294e2c', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 19:42:17', '2022-10-12 19:42:17', '2023-10-12 15:42:17'),
('62eaa7d5e49847c6585fcc1297ef6d1c95158e34d62ed270bac786144b4f90ae58b9edaca07cadd5', 136, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 03:40:36', '2022-08-06 03:40:36', '2023-08-05 23:40:36'),
('63b14648e23c68cb5388726b3c3c654b02aac7c4e184e9e3e242b8148647f9727101906cf1467fac', 364, 1, 'LaravelAuthApp', '[]', 0, '2022-10-20 01:02:36', '2022-10-20 01:02:36', '2023-10-19 21:02:36'),
('63ea6d64eb71401b43776822a4b0bf502e7802e1a8376460fb9b64ebfc2e1fc8f64118303f5e0332', 52, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 03:01:54', '2022-07-27 03:01:54', '2023-07-26 23:01:54'),
('63f431e6eae4442afcf204a1baef5924d000e22a7285f905cd52b4dc4679ae678ddfd012d8af52aa', 87, 1, 'LaravelAuthApp', '[]', 0, '2022-07-29 06:20:54', '2022-07-29 06:20:54', '2023-07-29 02:20:54'),
('641544cc22272c857ff9a108218f833bc15f03fe9e7c69c0b97fbd44f5ad1c0399770b28f49a8fc6', 16, 1, 'LaravelAuthApp', '[]', 0, '2022-06-24 06:47:32', '2022-06-24 06:47:32', '2023-06-24 02:47:32'),
('6576d541d300f94f3356ac8e615b679962397f05daecf70b1c28c483c9af1614ca443275d5896068', 60, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 11:17:03', '2022-07-27 11:17:03', '2023-07-27 07:17:03'),
('664ba42b5362e68204632463c70008cca2bf838d574ec36f1abe124336418064d517c86d5488b115', 139, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 04:54:38', '2022-08-06 04:54:38', '2023-08-06 00:54:38'),
('667df089fd1515bad5df04334cbe2c67d23f9116646b229dbe705cf5ec2f221d51ba03cf57c4f9ae', 13, 1, 'LaravelAuthApp', '[]', 0, '2022-07-18 01:33:11', '2022-07-18 01:33:11', '2023-07-17 21:33:11'),
('67ac041a6f7bd4524b92a644f822884ea17a77b4e6e239643dd1f91d33e42e72c8d7aa3024436b3c', 322, 1, 'LaravelAuthApp', '[]', 0, '2022-09-06 23:06:20', '2022-09-06 23:06:20', '2023-09-06 19:06:20'),
('67e2d2e49db9a2a3fc873f6ce07e7b02eb97e4f14cec079bda9f8f25df2add82cdb31493df2f9ca8', 249, 1, 'LaravelAuthApp', '[]', 0, '2022-08-27 21:08:53', '2022-08-27 21:08:53', '2023-08-27 17:08:53'),
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('689aa32cda4421ca118d836b1781ab5f9a5b1fa175bfe24a8c149398f56375acdcca5ae392f20d7e', 54, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 04:45:28', '2022-07-27 04:45:28', '2023-07-27 00:45:28'),
('696c64f539ed3db85238be030fde5a9905eedc7dab8868ffb3f3c4c1779c117d795c721dc957e800', 177, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 03:36:14', '2022-08-10 03:36:14', '2023-08-09 23:36:14'),
('697a1c6e72389bcec1bd34e9b8e1233b80c2bb67a0dda20137cfba0696d8cf87b9aea4fbffceb2ee', 121, 1, 'LaravelAuthApp', '[]', 0, '2022-08-04 06:30:00', '2022-08-04 06:30:00', '2023-08-04 02:30:00'),
('69f7ebb645e0a42ffd29ffe12c97ee3c6450ec8729dbae20be9346b6816c8ae38cd3d9687f20952a', 96, 1, 'LaravelAuthApp', '[]', 0, '2022-07-31 16:24:00', '2022-07-31 16:24:00', '2023-07-31 12:24:00'),
('6a895025922c6a13d9cdb1528377610ffe61a6aa32ef8af92bad42481a7d1bbf9d361f56cbd942f1', 201, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 00:46:10', '2022-08-12 00:46:10', '2023-08-11 20:46:10'),
('6bca131eba2b686aec11f2874e680a4de29ccbd33fabb29f2b0ff66db6cf0e17f9769dd1a211f14b', 279, 1, 'LaravelAuthApp', '[]', 0, '2022-08-27 23:06:57', '2022-08-27 23:06:57', '2023-08-27 19:06:57'),
('6c332f29f0bf343562c80a45aca8b4be00544c15e5526a5d6ef94f4c488fef3e531cc46b8d275029', 218, 1, 'LaravelAuthApp', '[]', 0, '2022-08-14 05:56:28', '2022-08-14 05:56:28', '2023-08-14 01:56:28'),
('6c86eb74d02967a91956eb6194fb8d5f1abe537eb6a7218a0e9c36a7ee5c8ebf06e118e2287d756a', 274, 1, 'LaravelAuthApp', '[]', 0, '2022-08-25 20:36:09', '2022-08-25 20:36:09', '2023-08-25 16:36:09'),
('6d3c842050ab1d8809ebe48e00bdb60e0de648d5d29e3d0f9cd975c770c97152781f7fc7b43ce25c', 289, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 00:15:32', '2022-09-02 00:15:32', '2023-09-01 20:15:32'),
('6d641f64cae9fea857ffcf23a46f9a223c2ab3e4ee0d8eba8abba0d5a6d891d67ff7632ae0b5f20c', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-14 02:17:30', '2022-10-14 02:17:30', '2023-10-13 22:17:30'),
('6ebb193687d30c4abcaa32a8d863932f410cf0ecf8a6b542d7d54672b602e11a0acf8d74fc9b4c45', 348, 1, 'LaravelAuthApp', '[]', 0, '2022-10-13 15:11:51', '2022-10-13 15:11:51', '2023-10-13 11:11:51'),
('6f051df13644400db23fe3cf3f784edf84b7355d256e10fe6c18f77bfc6da9437b468d99f7027391', 231, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 19:07:38', '2022-08-15 19:07:38', '2023-08-15 15:07:38'),
('6f3bb6a36014750130e98d07f7fa830cb9c0d0b65530ff1186dbf4283111ef0650455e78904cc2b9', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-20 21:29:36', '2022-06-20 21:29:36', '2023-06-20 17:29:36'),
('6f5a5251b7d67ab9d392f15925a77fc3eaaf582c50ab66b3d20a76c684ae1b8bf37e6b92f9769671', 348, 1, 'LaravelAuthApp', '[]', 0, '2022-10-13 00:00:47', '2022-10-13 00:00:47', '2023-10-12 20:00:47'),
('6fa3d998f188dd37beb125984eef08782e7d97f9922622723cbeb1d3dcd94c5ac0552e266301ae98', 353, 1, 'LaravelAuthApp', '[]', 0, '2022-10-15 08:43:23', '2022-10-15 08:43:23', '2023-10-15 04:43:23'),
('7036f9af6f224c67e27d6742b0954c98fbc6d1381d6c71c578230739add6d8952b9f1ae6c75c76be', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-07-23 02:28:43', '2022-07-23 02:28:43', '2023-07-22 22:28:43'),
('709fa1da31f900f2acdb746d33cd3a3fc00e5ad756487f2ba88d7e4245070be37d7fd55f2ce04c82', 34, 1, 'LaravelAuthApp', '[]', 0, '2022-07-11 21:38:22', '2022-07-11 21:38:22', '2023-07-11 17:38:22'),
('71b1dbfbb4732f603089c126f9fabb18773efeeeefd3a5aeedf374ac0ed1efcc5960e901db945a38', 95, 1, 'LaravelAuthApp', '[]', 0, '2022-07-31 01:45:55', '2022-07-31 01:45:55', '2023-07-30 21:45:55'),
('723d32569a4c53b9842bcce54c5be4386e75dddd218c89c5f3be58cd5b112553b23bf11439784374', 170, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 00:23:59', '2022-08-10 00:23:59', '2023-08-09 20:23:59'),
('731cefaf091383392a08fdf47bbb33cf829380f9724d53627e66c01d24de73793a41980524de5604', 115, 1, 'LaravelAuthApp', '[]', 0, '2022-08-07 02:59:44', '2022-08-07 02:59:44', '2023-08-06 22:59:44'),
('736e611fb3d29d24e322439643abac775c77fadb60b0658882f5b430e85d2c084ce2478de55a2d37', 224, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 04:10:38', '2022-08-15 04:10:38', '2023-08-15 00:10:38'),
('74209aa5df3afa8b93cb3e4e0267f30b844c7822f7989d8731ca3c2bd25c6e04c0f88fb4623865c8', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-20 20:47:28', '2022-06-20 20:47:28', '2023-06-20 16:47:28'),
('7467db2dce738a86d80d97ecd9f8b7ba515b097a8178d5075bf11be1534aa9db40f3b7144b883357', 98, 1, 'LaravelAuthApp', '[]', 0, '2022-07-31 03:52:16', '2022-07-31 03:52:16', '2023-07-30 23:52:16'),
('74b6649d6276b1289a468e8b509cf316c059627452416410bd51c52416c07f56d8761145b2044c9b', 215, 1, 'LaravelAuthApp', '[]', 0, '2022-08-29 18:55:03', '2022-08-29 18:55:03', '2023-08-29 14:55:03'),
('74d16f6d59e05815749984b6880bb3b6ca32e27408bb43a6646db5c73c4f5707151c57fd770f932e', 364, 1, 'LaravelAuthApp', '[]', 0, '2022-10-20 03:54:51', '2022-10-20 03:54:51', '2023-10-19 23:54:51'),
('750fba8c9b97fc967cbd379106dc2b88bba8a3146ba061ad8d89ce182b6a78aac0d2d22529abe500', 60, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 11:19:57', '2022-07-27 11:19:57', '2023-07-27 07:19:57'),
('75b09b62bc23d11505f7d34eab30516ba0a30c7164833a68e7d2896b3865cc76315ffc2f9e4276a4', 65, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 17:32:20', '2022-07-27 17:32:20', '2023-07-27 13:32:20'),
('7711c60fd999bb19da3632e1ec6c33113ec7e9d0ba443c78de3ab53c5d606d0b6b87d6e77a11bf2e', 207, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 22:51:18', '2022-08-12 22:51:18', '2023-08-12 18:51:18'),
('7718dc27b46ccb3cc2742518f39a7b5eb045aa1ef9298f669c0ad83104ab4a94987b64e7a0a5394c', 262, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 05:36:35', '2022-08-20 05:36:35', '2023-08-20 01:36:35'),
('777045f026a864a24a18119bb3454e8ee614576a9d7e08df5acf690f98be78a6aaaf21e6c24792ad', 323, 1, 'LaravelAuthApp', '[]', 0, '2022-09-07 02:08:00', '2022-09-07 02:08:00', '2023-09-06 22:08:00'),
('7842a52b64d5cfe27f94a5f68ead244ff5d782f872758d3f2c8acb4539bdd06ba74df1691d98c81c', 281, 1, 'LaravelAuthApp', '[]', 0, '2022-08-29 00:34:23', '2022-08-29 00:34:23', '2023-08-28 20:34:23'),
('785d138d0fa5f587861a1dbc15c111858122e907293141608bd292ede7484f45abb83154f338ab12', 47, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 01:41:05', '2022-07-27 01:41:05', '2023-07-26 21:41:05'),
('78f077dc87575bbd7d8cb39f223e2718748e9c87ae0d2057a84c6c7821b446198f460fcd190d2f8a', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-07-12 16:51:13', '2022-07-12 16:51:13', '2023-07-12 12:51:13'),
('7906d7976c965c170ed1971a8844c76a6371f35efbb202cca0b32819042cbbd5c102afa6f0305960', 50, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 06:52:34', '2022-07-27 06:52:34', '2023-07-27 02:52:34'),
('798b668ec97051dbc3451908e39ddbd0d0f74ac0be5ece69648fc7c55e38a98aabf29931d7030b10', 326, 1, 'LaravelAuthApp', '[]', 0, '2022-09-09 02:05:23', '2022-09-09 02:05:23', '2023-09-08 22:05:23'),
('7994ed986729e9358fdaba21ea5f7d24143ed4208c9feca402fa0b0978eda9bab03510af73582508', 249, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 23:08:56', '2022-10-12 23:08:56', '2023-10-12 19:08:56'),
('7a2a21bc341df2253458ec878bfc67db4a389f55d212dcb34063fa5f1bd71797eea687d2a23328e5', 205, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 03:30:47', '2022-08-12 03:30:47', '2023-08-11 23:30:47'),
('7a9b499071ace1320ceb2f6328e0e80575fb445a4019d52752eeca57638ed98ae50baece84abca77', 28, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 07:42:02', '2022-07-27 07:42:02', '2023-07-27 03:42:02'),
('7af0e52e98800a247953933b97cde595bd1c547a205856fa9bcbcefe708762868c398002a1f445dd', 56, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 05:44:42', '2022-07-27 05:44:42', '2023-07-27 01:44:42'),
('7cab88c318d077a3fbfdb2b89941eb798529514b3fd5b5a2fe3ab40326843747ebc5104389dec185', 332, 1, 'LaravelAuthApp', '[]', 0, '2022-09-17 06:49:43', '2022-09-17 06:49:43', '2023-09-17 02:49:43'),
('7d5388f0a131ba5e4e343faca5e292bf2c191860ec84fc751103101fa8a31d33c6ec7ae4a089573f', 135, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 03:19:14', '2022-08-06 03:19:14', '2023-08-05 23:19:14'),
('7dd091aaaef0c0a2fedf5f16d7f2ae5a151f62fd265469d9d679caa5d89c370c6b030c8c67473e79', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-22 00:52:09', '2022-10-22 00:52:09', '2023-10-21 20:52:09'),
('7fc7cc03a2cd1402a4d2647426710aa0f2822e27e10dc16a3c8bb7c23118120a41c45274780004ad', 63, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 13:09:09', '2022-07-27 13:09:09', '2023-07-27 09:09:09'),
('800d67fb2bb6a9ae1b4c50df129ebd3760dbae85189c7e7db218ea0d377db7bc5430e116e29cee61', 138, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 12:55:23', '2022-08-06 12:55:23', '2023-08-06 08:55:23'),
('802a827430c7ffca8476dcfbe46a0c5545301f4f4123101e00b970580d43dc13e2b337a9a67d0b3b', 158, 1, 'LaravelAuthApp', '[]', 0, '2022-09-23 04:52:48', '2022-09-23 04:52:48', '2023-09-23 00:52:48'),
('804698b494fab3f62a206e18bc64e92a435a492ac2d110dc189204ebdc629b84cab51b512e88169a', 73, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 05:00:01', '2022-07-28 05:00:01', '2023-07-28 01:00:01'),
('808ffabe3fca8e16ed353cbc6ccd69d2f201a58613417a101f672891d207dfc3058e26f29d83cebb', 248, 1, 'LaravelAuthApp', '[]', 0, '2022-08-18 13:59:24', '2022-08-18 13:59:24', '2023-08-18 09:59:24'),
('812dc22029f0806de400f679b747e81f4c08c5a0785fc60b6fe674c9f9be05b9afef4efc4d8570e0', 319, 1, 'LaravelAuthApp', '[]', 0, '2022-09-06 02:58:05', '2022-09-06 02:58:05', '2023-09-05 22:58:05'),
('8229a75829c576b2d8f0115c05c74974c826510e893ac5f2d3542cb5a860cd13b147351fe4f3d853', 162, 1, 'LaravelAuthApp', '[]', 0, '2022-08-08 16:10:48', '2022-08-08 16:10:48', '2023-08-08 12:10:48'),
('82456890810377fd92f299ac19cdde6a8f7c298b0ec52de3962d400308a3ba9e20e4470928f55166', 53, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 04:01:20', '2022-07-27 04:01:20', '2023-07-27 00:01:20'),
('840d1d3d529ee1fd63863211f7f5b570daa162f5ed7db51099c4e22d94beb26265a3e580b80ad4b7', 90, 1, 'LaravelAuthApp', '[]', 0, '2022-07-29 07:19:38', '2022-07-29 07:19:38', '2023-07-29 03:19:38'),
('84ddd946195b3ac5efc74fc379fc62d124cf7e75834e2210c3d62c3ea295d7f89d034b5c738db3e6', 110, 1, 'LaravelAuthApp', '[]', 0, '2022-08-03 23:06:22', '2022-08-03 23:06:22', '2023-08-03 19:06:22'),
('84fa88713843581fefab25f00e89702d105052467d1345a6fa41904853b46b4a0a1518eda8aa1440', 59, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 08:03:55', '2022-07-27 08:03:55', '2023-07-27 04:03:55'),
('8507e544fba16cc1e422569ba2cd4af1c254411e279755987b3d13d4b28c643ad0ec7c9e56cbe681', 188, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 19:17:03', '2022-08-10 19:17:03', '2023-08-10 15:17:03'),
('862a99a25b2d5221651b400dc54a47f903674f19cf21f9dd9808eefd731103fbf7cc788b6af0c8dd', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-13 15:11:19', '2022-10-13 15:11:19', '2023-10-13 11:11:19'),
('8718eaf6559a3fc9d0fb111dec4439587f1621d6177700ee0235feb788904e0441be77d7a993e78e', 193, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 01:41:24', '2022-08-11 01:41:24', '2023-08-10 21:41:24'),
('872e9902a27759a3f013e0716ad3c6d7e6592dcac1aa60d97aaaec3dbc59129abdbfaa7109b38be5', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-19 04:48:07', '2022-10-19 04:48:07', '2023-10-19 00:48:07'),
('8771c9f0fe106f504c6cb87738ce27a5ab5490dda3ab383e37c2b687537aa4a8d049ac9a754f369a', 281, 1, 'LaravelAuthApp', '[]', 0, '2022-08-30 14:23:50', '2022-08-30 14:23:50', '2023-08-30 10:23:50'),
('87e5f04b01ca0f40024a97f65532bb419a4925c9e878d91ac39f694573a90cbc95bced52c8d844a0', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-25 00:13:30', '2022-10-25 00:13:30', '2023-10-24 20:13:30'),
('8838011f2ab989bdbb182e488ebc9c87b41186ef5fe309c535fd61579669e6204d84236458fbe1ae', 182, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 11:47:31', '2022-08-10 11:47:31', '2023-08-10 07:47:31'),
('88c6e589476252d61e8a78fc6231160c8055c82b344a0fe1596830c8cd6b34b332d4b6b12055e70c', 235, 1, 'LaravelAuthApp', '[]', 0, '2022-08-16 02:33:20', '2022-08-16 02:33:20', '2023-08-15 22:33:20'),
('8a1b1f5b33fab561e9dd6eed9172d0aa605763e0fcd74a16430a9f7325d93a14c2f40774002a88a8', 198, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 15:34:29', '2022-08-11 15:34:29', '2023-08-11 11:34:29'),
('8a26fe3704361e5158ac66db3b25222f65741c44bec472652fe46613ae780cafbf497003f8d1dd28', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-08-02 00:44:00', '2022-08-02 00:44:00', '2023-08-01 20:44:00'),
('8b18e1ff6d63cf5584dbd1750ed12cfdef8ac6053c74dda8d2208c3c9225515dde0c1628b2dba59a', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-21 17:49:16', '2022-06-21 17:49:16', '2023-06-21 13:49:16'),
('8b3a813c7b6684f6968fa1cd8874c75b21d9600195011cadad94a3eca0dde8199153098b38bb5895', 101, 1, 'LaravelAuthApp', '[]', 0, '2022-07-31 18:26:44', '2022-07-31 18:26:44', '2023-07-31 14:26:44'),
('8b6650f60f5b2cbd004758da03f055109076422e8ecaa5565753b05133fe396e68dac9d23856a78f', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 04:10:01', '2022-08-17 04:10:01', '2023-08-17 00:10:01'),
('8c8a0bcc7d95f51f4128ec6d1ac639f517b016f65cb66c047dd05787a167321ad0e36b68ece834f7', 294, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 05:33:38', '2022-09-02 05:33:38', '2023-09-02 01:33:38'),
('8ca2436fe9b424c0994ae8bcee0b6f53a679bffc96bc03f375b2a51bf1ccabde4d1592efee89de75', 236, 1, 'LaravelAuthApp', '[]', 0, '2022-08-16 10:49:44', '2022-08-16 10:49:44', '2023-08-16 06:49:44'),
('8d4ede7929467791f22f3f10fee59b0833e86b3de64ce99e8b98da2d740ebd2939025795e60ff231', 253, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 05:41:47', '2022-08-19 05:41:47', '2023-08-19 01:41:47'),
('8e12038316b44a9e6023ab53030c630ae6a9a8e1bf0de4c52152c3d4e0fb073bc47ab553fb58d499', 77, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 06:04:47', '2022-07-28 06:04:47', '2023-07-28 02:04:47'),
('8e593687bc7730fc8396703c052ce0fd535f9cd0329c215a26481f45278664e6a3423a7c8ed14718', 127, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 04:50:11', '2022-08-05 04:50:11', '2023-08-05 00:50:11'),
('8ea9630b9f7777d04b780c78d0839f5ebd937dd2f8f6a0738cd6f949a3a3338c87925ea8c246198b', 273, 1, 'LaravelAuthApp', '[]', 0, '2022-08-25 20:12:25', '2022-08-25 20:12:25', '2023-08-25 16:12:25'),
('8fbf2c4a1a339c4facd67e5d146c71768188843524b8eefc42a17d991eb13d3c4886c151ef2396a2', 250, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 05:17:47', '2022-08-19 05:17:47', '2023-08-19 01:17:47'),
('8fe9d7da0c4ed90fd582e5e76c8341b71a8672494dd8e5bf40a9cc6b2bca9ba7f7d81a74f70bb250', 27, 1, 'LaravelAuthApp', '[]', 0, '2022-07-04 02:13:47', '2022-07-04 02:13:47', '2023-07-03 22:13:47'),
('901dd4a8e9f051d936a2a06b26985faaa378e5edbb4f5763504b0bae8d75eb5fddd02363a746817d', 266, 1, 'LaravelAuthApp', '[]', 0, '2022-08-23 21:29:33', '2022-08-23 21:29:33', '2023-08-23 17:29:33');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('9074c1bc3ae834c299e643ab61ccaefa7f79490c6158b9013ee66f3ae87545ea08ee144a4ba41412', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-19 03:19:46', '2022-10-19 03:19:46', '2023-10-18 23:19:46'),
('90a087a6a99192512274489151734e44e4ad99b0790caff8b0244241b3a08860cd7aea5810cb86b2', 34, 1, 'LaravelAuthApp', '[]', 0, '2022-07-11 20:52:41', '2022-07-11 20:52:41', '2023-07-11 16:52:41'),
('90cf54dc18627f5859f11f303bfaba07c90125c8e59b826bc42afed81dfe9292d9c26828dfdc1e71', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 04:30:54', '2022-08-17 04:30:54', '2023-08-17 00:30:54'),
('9103a8a091cba2ed3292dcbdc94574d83811c331f34e553effa8528b7b5362d980bf4f1609339e96', 196, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 07:35:50', '2022-08-11 07:35:50', '2023-08-11 03:35:50'),
('9202791107af8040d5278d2e2f2527004b4e96028fa39d5ac9acaf4179d5e052198fddea408682b1', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-19 01:47:47', '2022-10-19 01:47:47', '2023-10-18 21:47:47'),
('921ccdae18dba6dbfc8993104a8af40aa1f715042c095cd80c20b944075463669f73dbe995b8d591', 156, 1, 'LaravelAuthApp', '[]', 0, '2022-08-08 00:44:43', '2022-08-08 00:44:43', '2023-08-07 20:44:43'),
('92b9c74d9b125b3989624b5a9b1cca9c38185d18e8d2c1f2324bf1a16121a4afd4d147c4e29c9f8a', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-24 02:09:46', '2022-10-24 02:09:46', '2023-10-23 22:09:46'),
('92e2cf42b8e5d4943d4faeec3ce900ecc0934ce2870fa7c4a030925cac7cffe97a9f4c91159e03a1', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-07-26 03:14:48', '2022-07-26 03:14:48', '2023-07-25 23:14:48'),
('93d58919e8f9465d2d5c3c6c2e06f78659dcd0fe9d52577ac59b450762ce29271639e1bd8ecd2c15', 69, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 02:13:57', '2022-07-28 02:13:57', '2023-07-27 22:13:57'),
('94b0001572fce5830c3f59d259012935b71efd6326631e3837a5c42595a93ef473c6f8d43f234acc', 212, 1, 'LaravelAuthApp', '[]', 0, '2022-08-26 23:51:14', '2022-08-26 23:51:14', '2023-08-26 19:51:14'),
('952caed4f478c9597b45d0c6c8cb2d0d696e264ed357851018215f2a180b03edbc2ff12735f0b77f', 348, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 23:50:50', '2022-10-12 23:50:50', '2023-10-12 19:50:50'),
('95db62e33fec89f00bc4bd9c409fb03cad1bf0124642b1e474a0e7cb4f246fb584c37c970f5f6a6a', 76, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 05:45:27', '2022-07-28 05:45:27', '2023-07-28 01:45:27'),
('96b588f8071d1722b190a335a2f62360a8d00904850222302232e219f010114ca29bb082a77ecc86', 126, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 02:12:39', '2022-08-05 02:12:39', '2023-08-04 22:12:39'),
('96ca1d4a0e06a9b724a9e18408b6cee79cb1658dd6639e9afc5861f5acf018a97a892e9749aee7a6', 208, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 23:08:39', '2022-08-12 23:08:39', '2023-08-12 19:08:39'),
('97589c4ef7375eb746857bc15a02daaf134510fd9ba345039fadcc77d636fe8948f77bdfc374a1c9', 316, 1, 'LaravelAuthApp', '[]', 0, '2022-09-04 04:40:37', '2022-09-04 04:40:37', '2023-09-04 00:40:37'),
('9766860b99f30cbb37598a6086b97de4dd7364e2834d150ab10ef9f8d5d766bfac044e6ea1b3e339', 275, 1, 'LaravelAuthApp', '[]', 0, '2022-08-25 21:01:55', '2022-08-25 21:01:55', '2023-08-25 17:01:55'),
('980c9d1926a3954cb831990882ee1eedcac6fc38a98992459e3ab0c9aee17b19e0fa297282535a3c', 86, 1, 'LaravelAuthApp', '[]', 0, '2022-07-29 05:36:16', '2022-07-29 05:36:16', '2023-07-29 01:36:16'),
('98645a9edee7cc25ad6f298cc8c42410aa096c0819d9678e41d346fe5db56b53f747b8586318bda2', 58, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 06:38:11', '2022-07-27 06:38:11', '2023-07-27 02:38:11'),
('9a8d71fd5c7eb5d28daa468ea51373c7542842e6253f95b5308280d988d2dfc0989fdd0c7174c65a', 169, 1, 'LaravelAuthApp', '[]', 0, '2022-08-09 22:19:05', '2022-08-09 22:19:05', '2023-08-09 18:19:05'),
('9a97dce83ddcf872c6050f58c83188eeab50cc16cbc9633346ce7fc46e52f4b2112ddff104fd9d98', 82, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 16:31:38', '2022-07-28 16:31:38', '2023-07-28 12:31:38'),
('9ab08ef9dd993eeda2cf383bf1957d39925b805650726ee417a7e5ad86613211181b2a86bab9caa6', 84, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 23:06:06', '2022-07-28 23:06:06', '2023-07-28 19:06:06'),
('9abd39da7a6310694d2547cd80e0de5b41395c1557272f2823961ecfc769010db2bda3353d7e9b22', 352, 1, 'LaravelAuthApp', '[]', 0, '2022-10-13 23:37:01', '2022-10-13 23:37:01', '2023-10-13 19:37:01'),
('9b14dec01e150e8bc3dce9ed47d4f2f5c04759c5817eb4e942f22ad7f0cc9e49794bf6910bd1db62', 118, 1, 'LaravelAuthApp', '[]', 0, '2022-08-04 04:20:09', '2022-08-04 04:20:09', '2023-08-04 00:20:09'),
('9c0404ac79c8ff825125bd85eace7e04f2ff8bf18d18d4ed60919ee34c729f5eae78d2ba5784c5ed', 13, 1, 'LaravelAuthApp', '[]', 0, '2022-07-02 23:23:09', '2022-07-02 23:23:09', '2023-07-02 19:23:09'),
('9e49619cf28efe2155aeacfc6fc34028359f4a7e159d96248ad8cfce7dab17ed09ed3c42165d8027', 64, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 14:25:31', '2022-07-27 14:25:31', '2023-07-27 10:25:31'),
('9f811671fb25004127a41b1dbd3e9530207961b26f1be819aae9860923ecb0fa7197223dcacdf3ad', 308, 1, 'LaravelAuthApp', '[]', 0, '2022-09-03 09:10:11', '2022-09-03 09:10:11', '2023-09-03 05:10:11'),
('a00a869bc66d3df7f5806ec2fa50277bd90e489f36866172e0f93f86ef84ea6f5c3e4fe5e6a31b47', 78, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 06:08:30', '2022-07-28 06:08:30', '2023-07-28 02:08:30'),
('a0afed867a40f42f23afb34bc3bc225aa581ab44227b5d099abec76f56b6bbcbe915c573c298d512', 245, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 22:13:18', '2022-08-17 22:13:18', '2023-08-17 18:13:18'),
('a1a27c21c0c6c971528b2ca29e1fef83c26f5c3fdb1cd2581ecc52265540787d99c637e9526b1872', 319, 1, 'LaravelAuthApp', '[]', 0, '2022-09-06 03:00:07', '2022-09-06 03:00:07', '2023-09-05 23:00:07'),
('a1da0bcdff0c2becef7f01de8f4dd11076d79ab5b7e36fa414932110d5dd0dc0bf100f6fc16a0cb4', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-25 03:48:18', '2022-10-25 03:48:18', '2023-10-24 23:48:18'),
('a272d675bfa0c66766ff790ca2bddb76ea3b20313b25e8b8336114d91f2fd84c0699eb02369ddea8', 249, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 23:07:52', '2022-10-12 23:07:52', '2023-10-12 19:07:52'),
('a27cef92586893b500408ba3f83100f641c4cedd3845109712e47ff020b647c070ba6aac5d437c5e', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-22 00:32:52', '2022-10-22 00:32:52', '2023-10-21 20:32:52'),
('a28e6bcc67092128d27551d871bda018d5473bcf84562d551455ef022d498fce113304f64f17f8ad', 303, 1, 'LaravelAuthApp', '[]', 0, '2022-09-03 02:41:16', '2022-09-03 02:41:16', '2023-09-02 22:41:16'),
('a30e736b0f1d2e5796b442971d4ed01d32c33918dcd4551a1a18c9ea282f53e6209473afec1ec4fd', 150, 1, 'LaravelAuthApp', '[]', 0, '2022-08-07 00:01:58', '2022-08-07 00:01:58', '2023-08-06 20:01:58'),
('a37f103701b4686e47ea4445c09c953ce9cccadbe836364654b8743afe0dc59fb7eec859d49398d5', 241, 1, 'LaravelAuthApp', '[]', 0, '2022-09-05 01:33:48', '2022-09-05 01:33:48', '2023-09-04 21:33:48'),
('a3dbee32ec1adf15545f25ffd0fb9424295083a0b065aa2f9db9b034511f8fc2a209ae693b8e1a98', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-25 00:19:31', '2022-10-25 00:19:31', '2023-10-24 20:19:31'),
('a46ae956cdca7774a8ea1b8f26a179d061fbb349ebb498f09c62f5da90c14eb0c173c5b19f1c1f44', 165, 1, 'LaravelAuthApp', '[]', 0, '2022-08-09 06:01:10', '2022-08-09 06:01:10', '2023-08-09 02:01:10'),
('a50acf91de57d3f8adcc76997a5f433f0916cbd7b03e7f61bfa09809570decb8d087af6f442dac4d', 262, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 03:42:33', '2022-08-20 03:42:33', '2023-08-19 23:42:33'),
('a616928104fc29be3b08415bcdb2a706f7fbb0be29bb5d91ce82a358202362b5535e9b50caa3bb29', 244, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 17:08:40', '2022-08-17 17:08:40', '2023-08-17 13:08:40'),
('a6433d35098007bd8cfa26f68ae93d6e3fd1af1718f6b2a7ef40fa3a90c5287fc9235892fbfb36c9', 132, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 00:59:45', '2022-08-06 00:59:45', '2023-08-05 20:59:45'),
('a7c87d510ad2f764d91b7f2d019b0fce7b6f987126181a755661b3af869dff0449cd4bf146399a6a', 284, 1, 'LaravelAuthApp', '[]', 0, '2022-08-31 07:06:08', '2022-08-31 07:06:08', '2023-08-31 03:06:08'),
('a7f79e98065142fad48076c2faa7582b6fdcd7cfa88fb57c4535839824ea6a051e8d8a0596bcc975', 294, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 05:28:39', '2022-09-02 05:28:39', '2023-09-02 01:28:39'),
('a829cccb67c406a637702dccbbdb39f95fa285cc1feb74f0629272dfb2ccbc096b12a908176ea77e', 12, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 02:24:31', '2022-09-02 02:24:31', '2023-09-01 22:24:31'),
('a8a117711fc9ef98f7625f99e7537250ab622e78d7828b30fee9ce7931b4c5e8ab92a8b70766d652', 67, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 22:50:33', '2022-07-27 22:50:33', '2023-07-27 18:50:33'),
('a8f96463c8c818c3a49232fbd31ee8bb5e2a3b5a801486b8081d0e2093f5a6aeccc6a0e15d4232ae', 91, 1, 'LaravelAuthApp', '[]', 0, '2022-07-29 07:19:10', '2022-07-29 07:19:10', '2023-07-29 03:19:10'),
('a9d09b422511221aa66482a03138d6f13fe05807662c18f0bec258c7c6d7c19b8dbbea15be4842a4', 45, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 01:33:25', '2022-07-27 01:33:25', '2023-07-26 21:33:25'),
('a9fbfb0952814c73ce34ac5a9f26652e463f3f0122efa85ca7f3eb83f8b685698a7a63471aadbf23', 160, 1, 'LaravelAuthApp', '[]', 0, '2022-08-08 08:03:09', '2022-08-08 08:03:09', '2023-08-08 04:03:09'),
('aa7310f808996751b50bfe3c0a9f65aa6f118f8f18cffcd6f19d92ab726fc451328368e2e941f6b7', 143, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 05:32:47', '2022-08-06 05:32:47', '2023-08-06 01:32:47'),
('aba702135c4f41f8652f9346a71db67450c22817fac656438f45c87117e1ea2a8c8fabd3407c1a85', 173, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 02:51:09', '2022-08-10 02:51:09', '2023-08-09 22:51:09'),
('ac0a8de5aeeb5c28823b5493ff017f8803a39e8e6180b57600c7883d0b78f1fd121b4f07ee611491', 297, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 15:19:01', '2022-09-02 15:19:01', '2023-09-02 11:19:01'),
('ac5d029949e6e3fd811b653b08ed5f1a4bf9d5c0e49a2e64dcab4acdede0bce68262907b883b6bea', 130, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 19:45:42', '2022-08-05 19:45:42', '2023-08-05 15:45:42'),
('ade4a89d7ff061a81ababd7eb00099513c8df2003f0cef9575e0a66835483d53454607b229e86479', 35, 1, 'LaravelAuthApp', '[]', 0, '2022-07-11 21:13:50', '2022-07-11 21:13:50', '2023-07-11 17:13:50'),
('ae29c107f1ce285b2cfb87150d3078ebbd6fe4e67316efff7a5541582d2f87869acf16d922a7f357', 226, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 05:00:20', '2022-08-15 05:00:20', '2023-08-15 01:00:20'),
('ae3a20fcc8da56223a48c58c6e8f35d2e8c41136301eac055cd788ffb56416b6409a586c78203c6b', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-18 22:21:30', '2022-10-18 22:21:30', '2023-10-18 18:21:30'),
('b0070e58f1575877d433daebcfb14440913ac40b8e7032dec770046241fb954c8c484c1645e21309', 213, 1, 'LaravelAuthApp', '[]', 0, '2022-08-13 05:54:57', '2022-08-13 05:54:57', '2023-08-13 01:54:57'),
('b09604b424fd44ffeeb5f3d5f0892d8701ed29b956d2d91f701d7cc925390336c57463eb85721234', 59, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 08:04:48', '2022-07-27 08:04:48', '2023-07-27 04:04:48'),
('b186c5f9a69ef7d033d13572c69bf0248e98017330b856d0397a5d68b3b31c700ea808bf8c4f438b', 123, 1, 'LaravelAuthApp', '[]', 0, '2022-08-04 21:37:01', '2022-08-04 21:37:01', '2023-08-04 17:37:01'),
('b196bd48e60dd5eaa82f78bcbcd812a57a55448d7e11bbe889ba33b94ce60795a28677ded67b913b', 65, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 17:26:09', '2022-07-27 17:26:09', '2023-07-27 13:26:09'),
('b2ea1c23856761ce873cb5bbf132d0138913a7f2376d673e9d172d44922f0354bbf1a9d13c9ec91e', 192, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 23:04:52', '2022-08-10 23:04:52', '2023-08-10 19:04:52'),
('b33054e7b5e3724ddacbc0361de75d7b1f7835ecd77786f5b2dfbf9d2f4cb099f4b5fdce399e3ae4', 249, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 01:56:54', '2022-08-19 01:56:54', '2023-08-18 21:56:54'),
('b3afe673457e5d94d35735ebc43c38c94ee91043b570abfc5110ce84af6ff6c50fad8b4e117dd71e', 100, 1, 'LaravelAuthApp', '[]', 0, '2022-07-31 08:51:16', '2022-07-31 08:51:16', '2023-07-31 04:51:16'),
('b64afa46aeebabc24cb14e855eb77eb1c1f0dd1a9842b4dd10216f4e886dc888d8d4effd67b43873', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 04:38:08', '2022-08-17 04:38:08', '2023-08-17 00:38:08'),
('b84e541b0ffc81f44741ced7601dff0f0f4846a367a1afc3014a109c660ca7d1be4a212f106630d1', 44, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 08:22:35', '2022-07-28 08:22:35', '2023-07-28 04:22:35'),
('b91360ec11decd2b69fccec45b815ba97b1d7790a9b31fd7adce3152c9d69c76053eda1077506ab2', 94, 1, 'LaravelAuthApp', '[]', 0, '2022-07-31 01:30:07', '2022-07-31 01:30:07', '2023-07-30 21:30:07'),
('b9a483405908898878f9699f20e1827c0eabce260be8a7a8fb407004ba9e5cfec6b4919423e232a3', 348, 1, 'LaravelAuthApp', '[]', 0, '2022-10-13 00:25:16', '2022-10-13 00:25:16', '2023-10-12 20:25:16'),
('ba7e948e9ff8da201dee7ff211d2a28e214690868ca090cbf76c491adf9f88fc6efd3c6dc0f93b8c', 329, 1, 'LaravelAuthApp', '[]', 0, '2022-09-10 04:23:04', '2022-09-10 04:23:04', '2023-09-10 00:23:04'),
('ba83e0f109dbef6a6d08d853c665141bbcc27fcb9a5dc4a58452bdd3e4b37c43e91449678840f23c', 246, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 22:40:31', '2022-08-17 22:40:31', '2023-08-17 18:40:31'),
('ba9a6c8cf2e5ba77e928618da8f84c5b3a70840069f3c85495436d3da3b2a67b57d9a01bbd2e9b8e', 295, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 05:34:44', '2022-09-02 05:34:44', '2023-09-02 01:34:44'),
('bb2da0da1758fa76fd51424e0c23c12ff470eb6f3cdbebe2d65af2a3f174d742ee4cb79e928f88f7', 134, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 03:14:11', '2022-08-06 03:14:11', '2023-08-05 23:14:11'),
('bb5281f9cb9c457f1e41cc8f27ecf1ed1f8b08aea1d1f5a5bd25c18e6f4a9a9986a84950eabc2a12', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 23:36:33', '2022-10-12 23:36:33', '2023-10-12 19:36:33'),
('bbcbeeb3c6b7162738ec0eb59f67008a565c9cbe5282e5cfb9e9c09986e956b0e7be9a77b8189c46', 50, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 07:22:29', '2022-09-02 07:22:29', '2023-09-02 03:22:29'),
('bcd18faebff040e86f7a2daa7933b26533a45171e230fcbb633067cb5946f7974166b793e14f1866', 99, 1, 'LaravelAuthApp', '[]', 0, '2022-07-31 06:19:07', '2022-07-31 06:19:07', '2023-07-31 02:19:07'),
('be88a8cc96db5db53426f124f24b295004a252ba3faebb835565bd93596ef3e9158b809df2457e1c', 333, 1, 'LaravelAuthApp', '[]', 0, '2022-09-17 07:05:37', '2022-09-17 07:05:37', '2023-09-17 03:05:37'),
('befb93a0ee5d8a3b430fcc25fa0aa9383da2560a076acfc3aceab673fdce31c8e2f18dfb6bd504a6', 270, 1, 'LaravelAuthApp', '[]', 0, '2022-08-24 21:39:35', '2022-08-24 21:39:35', '2023-08-24 17:39:35'),
('bf4ec2ce823836e318d7f221f09df2f9fba8217378ee4aed4a82a55e50226ee3fbb8fcda0d6e398c', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-22 00:41:47', '2022-10-22 00:41:47', '2023-10-21 20:41:47'),
('bfc9f944fa5fff9b93a424181917b2596adb36f09cd5693e35b25880f1fa192cb95e0736540edb6c', 114, 1, 'LaravelAuthApp', '[]', 0, '2022-08-02 23:27:28', '2022-08-02 23:27:28', '2023-08-02 19:27:28'),
('bfda88b85d0979a01066c5c920bc17e8aff4edd1609e6a9b1e668853f400e6afd4823ca550110ee1', 146, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 11:37:05', '2022-08-06 11:37:05', '2023-08-06 07:37:05'),
('bfdd1bdd8b1acab3c2655d9c18097d8005e5e32f1c8e3ffae65d7291c6af15abfe68ee9b37cb860b', 348, 1, 'LaravelAuthApp', '[]', 0, '2022-10-13 14:50:30', '2022-10-13 14:50:30', '2023-10-13 10:50:30'),
('c0941e851991198551b6d59c813b333bd4b2410645d34161db456cab370f519db516c05d864ee304', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-19 04:37:20', '2022-10-19 04:37:20', '2023-10-19 00:37:20'),
('c16c09e55864c039d21ae4080ac7cc93b62f71437e8c2c084bf30f34a46523bdd17fd3e0cb161053', 247, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 23:55:29', '2022-08-17 23:55:29', '2023-08-17 19:55:29'),
('c1b6adf9bca706368551faaa3e153e5daba5039f7e3b9ab91914f0ff51d930f3d6a2abe1e8123ad3', 327, 1, 'LaravelAuthApp', '[]', 0, '2022-09-09 05:52:37', '2022-09-09 05:52:37', '2023-09-09 01:52:37'),
('c215fb518b16828dc73c683aaaa66e189d5f262779f096ef50effb466f11b2691df5aef84bec2377', 141, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 05:12:17', '2022-08-06 05:12:17', '2023-08-06 01:12:17'),
('c21c453f0878302627f84d524938d4599572a34c0ff6de98276229d581e4d59adefa2c2622c1e662', 212, 1, 'LaravelAuthApp', '[]', 0, '2022-08-26 23:39:41', '2022-08-26 23:39:41', '2023-08-26 19:39:41'),
('c3738d23e2bbc333c409a22aa375dd148c3262881a700af7a8eb7b7ef6837074716c3d045db625fb', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-07-26 09:28:15', '2022-07-26 09:28:15', '2023-07-26 05:28:15'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36'),
('c42e6564d86b1210611916983137d07f3ca8a7273680422440a7171f21050971876c8c9fa1330b4f', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-20 02:37:46', '2022-10-20 02:37:46', '2023-10-19 22:37:46'),
('c4df9e3050b42cc8e8ae50b8a8aaf23de1adb3bea7942d59a926e41c1e7cffdd75b75a70534edf54', 204, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 03:27:04', '2022-08-12 03:27:04', '2023-08-11 23:27:04'),
('c5cc52022aad19fc3395ea8a282d1b4fbc81240b27e6f9adb177fe88f8f592fc75a18815d52129c9', 197, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 11:27:34', '2022-08-11 11:27:34', '2023-08-11 07:27:34'),
('c5d9c0f1ff55134cd9356e9fa601b0de17f6d8145494e64f50249dab12682d570d1add582433df4b', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-13 00:24:45', '2022-10-13 00:24:45', '2023-10-12 20:24:45'),
('c5fcbd77108a909d632b8688055092340365457c4c5a03931dc31cc649578b365260dcdb051d9303', 364, 1, 'LaravelAuthApp', '[]', 0, '2022-10-16 04:20:09', '2022-10-16 04:20:09', '2023-10-16 00:20:09'),
('c69b3a1e957bf99b35df31e8c522d5c1ff4f72eae7e14f7581fda67e83cb169ffaeb3f0a46b0d066', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-06-24 22:04:05', '2022-06-24 22:04:05', '2023-06-24 18:04:05'),
('c7d9566d7cd3935ac4d0965d37bcb89e01d575acab80bd89a05db4fe8235c89c83c50a1c27a45f3b', 65, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 17:25:02', '2022-07-27 17:25:02', '2023-07-27 13:25:02'),
('c7f46f171a4e9bee3560b1e9efa38268c78d0b73e286f63fa2f5de9da2c72bb9b5c6f0018428ef05', 13, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 04:30:18', '2022-07-28 04:30:18', '2023-07-28 00:30:18'),
('c8bdf0945cbc1405aeb2cb8e72c7229e7b85937bb1f107efe9716e8e0ee951a07853fc2dd435ace9', 105, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 02:26:50', '2022-08-06 02:26:50', '2023-08-05 22:26:50'),
('c962b3c0b5057f3550c03a9c991c118e208ee60b1e3aa3e5d8f0476d1fd27b9874bb4c6676589924', 341, 1, 'LaravelAuthApp', '[]', 0, '2022-10-11 21:04:01', '2022-10-11 21:04:01', '2023-10-11 17:04:01'),
('c9770a6c5b1c643a045fe2147f3d364dae46266ca357be437494e83fe2fed4ebcf32723e7777eccb', 221, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 01:39:10', '2022-08-15 01:39:10', '2023-08-14 21:39:10'),
('ca8716c0283f0dcb1bd932b56824ad895da2dcac6b4cfd2d158db1fdf1af865b9d2b011b430496a3', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-19 05:13:37', '2022-10-19 05:13:37', '2023-10-19 01:13:37'),
('cba5bf85d7f06ed99d739feb3886570c1d3362918cc3627c1513252b87ac82a3e5359be4accdcba5', 66, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 19:21:17', '2022-07-27 19:21:17', '2023-07-27 15:21:17'),
('cc03784c2c123c0accdee0920e0518298c0d9b32ecc98ea15b496d996998a715490f783ee4605550', 306, 1, 'LaravelAuthApp', '[]', 0, '2022-09-03 05:50:13', '2022-09-03 05:50:13', '2023-09-03 01:50:13'),
('cd4c00141afc11ed5598b7f50f6ad64f86e08d86bcd94285925f8572a583965ebbe79398d85ff2fa', 27, 1, 'LaravelAuthApp', '[]', 0, '2022-07-02 07:40:06', '2022-07-02 07:40:06', '2023-07-02 03:40:06'),
('ce50641cf56f0d10074e383d04e2be1a27cd3c85d4dc1c33600823833f2e74c7338a0be26aac785b', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-21 10:25:26', '2022-06-21 10:25:26', '2023-06-21 06:25:26'),
('ceb4171da9cf8b0a525264d3c2b041c554fe647a760596a808249c65d6554d5ccb4679e20b7bc938', 104, 1, 'LaravelAuthApp', '[]', 0, '2022-08-04 20:57:25', '2022-08-04 20:57:25', '2023-08-04 16:57:25'),
('cf5ba46b501c2153f50e36c82a2b15646042a17111da37532b38ae54daf2c8f028bea594e2ee2451', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-15 00:51:53', '2022-06-15 00:51:53', '2023-06-14 20:51:53'),
('d0d26d8088c82681a1620fd88d7d82e2e94a5329135e556d8b73588abb2064307ff61d802e092780', 212, 1, 'LaravelAuthApp', '[]', 0, '2022-08-27 13:11:19', '2022-08-27 13:11:19', '2023-08-27 09:11:19'),
('d221317d57a93d49c47e20ebaaed1c37192f6cbe58bb363bc0d4f4f6e9413eb8eeacd57727c994a5', 176, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 03:36:57', '2022-08-10 03:36:57', '2023-08-09 23:36:57'),
('d24e438ac21a8c2c031e2468b4ced827142b7ee4ca6d4a23932beded567886156e3ef3a0c6aa2e98', 180, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 07:53:20', '2022-08-10 07:53:20', '2023-08-10 03:53:20'),
('d28a3239455ba3310d16173813372309004669a2668e0c083f457e7f47aff1863677e031b6642c09', 183, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 11:49:39', '2022-08-10 11:49:39', '2023-08-10 07:49:39'),
('d2f64fe2e89a1d79717088b49caf3fba7126c04c00a2dd7ddb97d7bb0678b60c26f8b30f56b72cc2', 290, 1, 'LaravelAuthApp', '[]', 0, '2022-09-01 22:11:18', '2022-09-01 22:11:18', '2023-09-01 18:11:18'),
('d3944fa61ba4fe86895a4bedf5101b1eeff7eb6cf5e0435d5350ba8dd0e3186fe16cece240b105d8', 62, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 11:55:09', '2022-07-27 11:55:09', '2023-07-27 07:55:09'),
('d477af421f2a4ae3a2820cfc5bc99dfa8ccbf5167766acaa13d11d3e63afc6fd648325cdd666bc8f', 258, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 19:56:45', '2022-08-19 19:56:45', '2023-08-19 15:56:45'),
('d4cccec4d022ac980d20f3e1ead4d2373399575caadc56124a73224dabe28556480603eb2da44a88', 334, 1, 'LaravelAuthApp', '[]', 0, '2022-09-17 18:33:36', '2022-09-17 18:33:36', '2023-09-17 14:33:36'),
('d5e4c690f91f4a975f2c1b51cd3aecbb125394ac6870d7a9a5df3e5fa2a020a543e31489ea3efba8', 194, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 02:52:18', '2022-08-11 02:52:18', '2023-08-10 22:52:18'),
('d651cfd5917e7842e8cd8348be043bf6f8a82e9ee54c5aa0aafae6b3af2390308c2c629ebec5919c', 228, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 07:14:35', '2022-08-15 07:14:35', '2023-08-15 03:14:35'),
('d72f7c6e3f40766916cbc672b8cb00109b396a6fa6ab945e8e67708f36ad6d7d13866297fd07e3fd', 228, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 07:07:48', '2022-08-15 07:07:48', '2023-08-15 03:07:48'),
('d900dcd30e7c733ffceb143580fe0e8103dd91d69ed041e4825e61157c1a97aa1aea85ba7a6702cc', 325, 1, 'LaravelAuthApp', '[]', 0, '2022-09-08 04:04:59', '2022-09-08 04:04:59', '2023-09-08 00:04:59'),
('d9a81868cab15f53162639798b40df5c0be7b348c5c4b4d6401d1229f9d30cd7dbcf6fad7ed84d4b', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-13 15:20:23', '2022-10-13 15:20:23', '2023-10-13 11:20:23'),
('dbf2a74193aee5b5f2a42f607116b6231dbb77811b05b11709e3d0af0ffe4df447f4bee07f1fadbc', 133, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 01:41:25', '2022-08-06 01:41:25', '2023-08-05 21:41:25'),
('dc9ea8abcad0560c8488399085313e0096fcb655cdf905373fde97e46f7003c73146d61a15000311', 276, 1, 'LaravelAuthApp', '[]', 0, '2022-08-26 18:58:55', '2022-08-26 18:58:55', '2023-08-26 14:58:55'),
('dd645c83df818a76ecc54db8357f3277033eb5aac53d3fb01ec260e8d8e8575e4003ac8bf28ac616', 137, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 04:40:17', '2022-08-06 04:40:17', '2023-08-06 00:40:17'),
('ddda369ebb538c6f4ce208da22f22b2d1738da1827b2354ea2fe229d2221fe8588ac63b964c10588', 247, 1, 'LaravelAuthApp', '[]', 0, '2022-08-18 00:20:05', '2022-08-18 00:20:05', '2023-08-17 20:20:05'),
('dddd5abcfa992c1059e3bb6fc617562369bacde946859dc89b1f592cdffcba6fc7550e23022ce895', 267, 1, 'LaravelAuthApp', '[]', 0, '2022-08-23 21:53:44', '2022-08-23 21:53:44', '2023-08-23 17:53:44'),
('de7e1869c01e57c555258083cfaf28d9199d426d5c06a116938c75eb3e749135321076f26dcfa72a', 340, 1, 'LaravelAuthApp', '[]', 0, '2022-10-08 02:17:22', '2022-10-08 02:17:22', '2023-10-07 22:17:22'),
('dea872a64e4b6601347fb254607ad825582931487147118dbcdde9ed48b68e96141ec331caa171ea', 26, 1, 'LaravelAuthApp', '[]', 0, '2022-07-01 05:10:28', '2022-07-01 05:10:28', '2023-07-01 01:10:28'),
('ded252d681da0929be03860f8bd32f40eb58b2fb98f402d1948202d35ede37e15ffd0432689735bd', 293, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 05:10:54', '2022-09-02 05:10:54', '2023-09-02 01:10:54'),
('e03ea4397a8f3e710132ddad1ea7ba6f1c439c9ea47793a7f1fa6711dc563c083af07dff58145a6a', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-06-23 19:49:30', '2022-06-23 19:49:30', '2023-06-23 15:49:30'),
('e0417cfc94be58206a1da505101fccac744e433f068fd8e31586ceec86c66f2ccc08a861a4034180', 256, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 07:21:35', '2022-08-19 07:21:35', '2023-08-19 03:21:35'),
('e08a1359c5d0bee3213684e2af21a69d10df8d606aa2b79290eced5dbc920b4e516dc6d86a59feef', 77, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 06:02:23', '2022-07-28 06:02:23', '2023-07-28 02:02:23'),
('e1c350ed83ca70fb7dda7a561b22992b811182ecfddadc67542447ac8459a00d7b6c61b5f5ee298a', 56, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 05:42:14', '2022-07-27 05:42:14', '2023-07-27 01:42:14'),
('e1c94b6c82255714753953ab8c16117572631ab10561ca83f1024ef4af44080042d9404ec7b899a3', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-19 03:29:55', '2022-10-19 03:29:55', '2023-10-18 23:29:55'),
('e3e896c4826aef9f519dbfe9eeae7b4524cdd6d405c7f283ecbfc533737320de25cce900e71d42b7', 364, 1, 'LaravelAuthApp', '[]', 0, '2022-10-16 04:25:25', '2022-10-16 04:25:25', '2023-10-16 00:25:25'),
('e43d73a90b3d6caae424131258d6fd4fad5b134bb0ab789e55ac4e5846c5bb88783bf5cada573138', 268, 1, 'LaravelAuthApp', '[]', 0, '2022-08-24 00:28:14', '2022-08-24 00:28:14', '2023-08-23 20:28:14'),
('e56a18b6c0d24924afd6ca6051244958401cfe9448037a7430b95aaf2b3ba891168e1804be95c099', 184, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 14:33:47', '2022-08-10 14:33:47', '2023-08-10 10:33:47'),
('e57da52c3c3b4defa14a30a1a0f394b9a2d652be2a2715ff736097fff3e63f87d25c2bc09bccb11a', 142, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 05:28:25', '2022-08-06 05:28:25', '2023-08-06 01:28:25'),
('e59ab24f971353971d69e039a7be4847be23f72f6f17cd89fb184fc5a451c77d4909fadefdf15c77', 272, 1, 'LaravelAuthApp', '[]', 0, '2022-08-25 06:31:59', '2022-08-25 06:31:59', '2023-08-25 02:31:59'),
('e5a4eeed96e579f71b10542d26e726a31ec4e61421a160a6deb6aac99d5a41931c39c9bbe2f43d69', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 23:45:04', '2022-06-14 23:45:04', '2023-06-14 19:45:04'),
('e63467820e44eb2aa100f6a387ccf2d33ad261215a2b70cab7ed3066a7eb29592157d1aed9b52e24', 298, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 18:32:39', '2022-09-02 18:32:39', '2023-09-02 14:32:39'),
('e637fbfbfa3c578d70ae0c88623a65e1dee527c10c80f0ac4d83d8b5ad5d2d45f54123de94fc111a', 243, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 11:34:47', '2022-08-17 11:34:47', '2023-08-17 07:34:47'),
('e798253ec0c32a8a0ac76c0f26c438d16c93ca47e8c87b725d34967688a4ed6b68a617343c5b8945', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-16 04:48:41', '2022-10-16 04:48:41', '2023-10-16 00:48:41'),
('e7aa74f8927e8d5602bded4dd7bd0de46d400f0f5f16a4a1f9da5dad555264c2aeb06f69173dbe91', 189, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 21:17:04', '2022-08-10 21:17:04', '2023-08-10 17:17:04'),
('e7d5d273f7f4158fdd97a05721c5fdaf89ac97c0f7e92366323744df901986bb6beebbd2905a43a7', 219, 1, 'LaravelAuthApp', '[]', 0, '2022-08-14 06:07:42', '2022-08-14 06:07:42', '2023-08-14 02:07:42'),
('e7e5df58f4985fb2eb34ca263d89bcd87d5ec1b1b35195d3fdad36156673ec73dc375932072953ea', 286, 1, 'LaravelAuthApp', '[]', 0, '2022-09-01 16:50:20', '2022-09-01 16:50:20', '2023-09-01 12:50:20'),
('e8331d0682357be59c0d08c6866550e5f64c0f78baa0a2f1be16d83b2e0aaa404fd87132edc59773', 187, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 19:01:59', '2022-08-10 19:01:59', '2023-08-10 15:01:59'),
('e854fe1b8f8dcfe9ce4c5b9c4c043bf0635dd708c850d06af5562277be5003589586b54c2f41d601', 296, 1, 'LaravelAuthApp', '[]', 0, '2022-09-02 06:03:20', '2022-09-02 06:03:20', '2023-09-02 02:03:20'),
('e9dcec076cbdbc4184897f28980dfcdaca0719145b8a40c2d5783f401e81f67ecddfe0960f01ed10', 97, 1, 'LaravelAuthApp', '[]', 0, '2022-07-31 03:22:54', '2022-07-31 03:22:54', '2023-07-30 23:22:54'),
('ea1860183fb187ace5c5b1d9662dfb21ba2c6826cf7977d955e7b92990ca2848d67622364c5594b5', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 04:25:22', '2022-08-17 04:25:22', '2023-08-17 00:25:22'),
('ea51a9f248e5868c7767d02cd24ebe56b4c7f7c72b9919abc7db067c6be44ceec98acb59eb4a12b1', 117, 1, 'LaravelAuthApp', '[]', 0, '2022-08-04 04:11:38', '2022-08-04 04:11:38', '2023-08-04 00:11:38'),
('eb2fcc443d3ccec16a577376b775c5d11f5f583b79c6d843e1616d2dd6340154a2dab7f1e4766932', 185, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 17:25:21', '2022-08-10 17:25:21', '2023-08-10 13:25:21'),
('ecfb85bcbbb012cf66b9532d6e93f9d6936fb55099f16a904616aa61875816cafdfd322dbb606a8f', 249, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 01:56:50', '2022-08-19 01:56:50', '2023-08-18 21:56:50'),
('ed43cd5a2a693a6d61ca167282a3942da56cd41a5b438b35d5e9fc920448997447d6d55f5da843cb', 56, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 05:44:03', '2022-07-27 05:44:03', '2023-07-27 01:44:03'),
('ee485a085f01f114c13e3da0e75e1abd15b8c9fd2511d86d1146584d8286bfa61559c0e687896871', 278, 1, 'LaravelAuthApp', '[]', 0, '2022-08-27 10:10:25', '2022-08-27 10:10:25', '2023-08-27 06:10:25'),
('eea35fcd31c1b996e56d3ed69bee92b99773aed4c597e11c84b20377ad387469a14cb4d0454fef84', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 02:12:33', '2022-06-14 02:12:33', '2023-06-13 22:12:33'),
('eed6a9cfd3755aca838e5cb66bcadfa3ac0d2034fafc5671a86a693067877bef7ec780c46f37de0a', 199, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 23:15:51', '2022-08-11 23:15:51', '2023-08-11 19:15:51'),
('ef39ff40ab2f2f06ddbfb94e7380fd761d283ae773b090b38a8f9c8485330d2d4611d712ac345389', 242, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 11:54:13', '2022-08-17 11:54:13', '2023-08-17 07:54:13'),
('ef41ca8493ac4f3f9ac413ee457529015567a94261b19b172aea057ac9bf3923d257322e26141302', 324, 1, 'LaravelAuthApp', '[]', 0, '2022-09-07 15:01:43', '2022-09-07 15:01:43', '2023-09-07 11:01:43'),
('f08a876c4fb12b455ac9a42b6c17343491f9ef6691623904b3571a3384d24209a7aa6f86566a7cc0', 260, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 02:50:33', '2022-08-20 02:50:33', '2023-08-19 22:50:33'),
('f23234b64ad1d711b7ee27ff462a705ed728463c234ec74e65afb51b3cc777587d7f6f488b73555d', 81, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 14:43:02', '2022-07-28 14:43:02', '2023-07-28 10:43:02'),
('f280e3c550a131baef6ce47ff8d58059149b82b6a14e7372091fd56aadc8846aa3b3820c33b1b052', 249, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 23:09:14', '2022-10-12 23:09:14', '2023-10-12 19:09:14'),
('f298aec142dae1016e9e1c48787cc256d55632fbae39d440b4de892a61c44c162bf142058d82970a', 348, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 21:51:17', '2022-10-12 21:51:17', '2023-10-12 17:51:17'),
('f3febfc049e876ecfe1ce940d94adfb5c2b313f2ae069111ff9984ca910d43729ddb1559c9abbbaf', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-20 02:50:50', '2022-10-20 02:50:50', '2023-10-19 22:50:50'),
('f443bad3f2a74f56c6ee68047d63a0cf004d30ca4fc6ff389f0ef0d2c6732ae7dbedd2aaa38380e4', 147, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 15:57:40', '2022-08-06 15:57:40', '2023-08-06 11:57:40'),
('f48b6c7fe573bbc46ff82d01dbaf2180e33a9ba09d42912449f1b06e9ad45a7b18b7ad4e19c9aaed', 248, 1, 'LaravelAuthApp', '[]', 0, '2022-08-18 14:00:22', '2022-08-18 14:00:22', '2023-08-18 10:00:22'),
('f49d11ddb902e7820abc8c4bf4238df2ea00c0d3d3e443f43054452953341337ef94c61f6a8d6aff', 328, 1, 'LaravelAuthApp', '[]', 0, '2022-09-09 22:55:19', '2022-09-09 22:55:19', '2023-09-09 18:55:19'),
('f6e2d78b947aaefda449f4faeb1036f45433227280e615b909f5fc93b7584dbacef996c315e24d94', 348, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 23:21:26', '2022-10-12 23:21:26', '2023-10-12 19:21:26'),
('f749900b4bc5c87987f45441319829dfbba6008c9825f4a02a73c6a3446326b45fd4b8f393733279', 129, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 07:03:42', '2022-08-05 07:03:42', '2023-08-05 03:03:42'),
('f87e1fda328d6e5bd8e3d3283ad27f9df8c729e709b34037675018bbaf9648b74df201c2e34c5dd6', 179, 1, 'LaravelAuthApp', '[]', 0, '2022-08-10 07:39:35', '2022-08-10 07:39:35', '2023-08-10 03:39:35'),
('f9f788d588e7e0de4000641462271da7859b3b399fc496ea5deff55823c3f59cac8306be700cfd5d', 80, 1, 'LaravelAuthApp', '[]', 0, '2022-07-28 13:59:23', '2022-07-28 13:59:23', '2023-07-28 09:59:23'),
('fb0c96c6f167b72ea463270914f87dbafcc205657109e3e6cf7a8977df73d1bc5e5f0c3a7c7a1c5e', 136, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 03:41:23', '2022-08-06 03:41:23', '2023-08-05 23:41:23'),
('fb5cd3f973f86aaf82878d652f679efd9ef7a4f8bf9b280ec2a9a0c8eee2a811abf6b24effd0498f', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-06-24 08:54:57', '2022-06-24 08:54:57', '2023-06-24 04:54:57'),
('fbd0d14380cc7d95e6614a192f6bf342aa391661714238324f2010b928a3f4511f4062a7b21e3f57', 305, 1, 'LaravelAuthApp', '[]', 0, '2022-09-03 03:42:41', '2022-09-03 03:42:41', '2023-09-02 23:42:41'),
('fbf8268a60402b3da186cc5fd55e070103c224be62c8c93abe2de38f68f04d72d605003288313c03', 209, 1, 'LaravelAuthApp', '[]', 0, '2022-08-13 03:25:46', '2022-08-13 03:25:46', '2023-08-12 23:25:46'),
('fc141457877c65cfc7c467f67572623e33bcc733acda0169f2cf0b312fac5b89c6dd4342f58fe396', 237, 1, 'LaravelAuthApp', '[]', 0, '2022-08-16 16:20:15', '2022-08-16 16:20:15', '2023-08-16 12:20:15'),
('fc2e6def3d3c15995200fef7a462973a76891929822175553f7a22fcda703c82fb557d2a89492373', 313, 1, 'LaravelAuthApp', '[]', 0, '2022-09-04 00:30:43', '2022-09-04 00:30:43', '2023-09-03 20:30:43'),
('fceda76ca71d3db0ea5b7806da842c9448203c506d0ce9a6b6b936c4d80296e753ce340936e375ab', 346, 1, 'LaravelAuthApp', '[]', 0, '2022-10-18 18:31:58', '2022-10-18 18:31:58', '2023-10-18 14:31:58'),
('fd03d3029cf72e6570c2889a23674b94cf44b896d5d904b0c911621273b7f20c3da51a261bcb5fc9', 348, 1, 'LaravelAuthApp', '[]', 0, '2022-10-12 23:54:43', '2022-10-12 23:54:43', '2023-10-12 19:54:43'),
('feafae747b502073825441da953126767c1a8f9e506b8163b1bcac8a50cf52961dd482945d09d7c7', 55, 1, 'LaravelAuthApp', '[]', 0, '2022-07-27 05:10:58', '2022-07-27 05:10:58', '2023-07-27 01:10:58'),
('ffaf18b6f2254fe6c560ece116a40aae2759003245683a4fd03bec1287d46b4851ad0c9e662e9ae1', 164, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 04:51:15', '2022-08-17 04:51:15', '2023-08-17 00:51:15'),
('ffbcdbb41f4f162c5a1893403fdad6a1d6c5a6c0bcc8cc6f3d3acec548352b19c0e8bd024d5fc78c', 20, 1, 'LaravelAuthApp', '[]', 0, '2022-08-11 16:06:23', '2022-08-11 16:06:23', '2023-08-11 12:06:23'),
('ffedf6f2a4020be5f81f42bc7cfd86ab3d192591835b5ebfbe4e9981f9512f1e855ead43b61a837f', 231, 1, 'LaravelAuthApp', '[]', 0, '2022-08-15 19:08:51', '2022-08-15 19:08:51', '2023-08-15 15:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `payment_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeToDelivery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `daysToDelivery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_service_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deferred` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `payment_date`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `timeToDelivery`, `daysToDelivery`, `delivery_service_name`, `third_party_delivery_tracking_id`, `order_delivery_status`, `deferred`) VALUES
(100014, '354', 'customer', 'paid', NULL, 'delivered', 'cash_on_delivery', '', 115.34137931034, '2', '2022-06-30 04:16:51', '2022-12-06 07:55:15', 0, NULL, NULL, 2, 5.00, '12-152150-1656537411', '616271', 1, 'admin', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 2, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, 'confirmed', 0),
(100015, '12', 'customer', 'unpaid', NULL, 'confirmed', 'cash_on_delivery', '', 96.000000000002, '2', '2022-07-01 01:33:03', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-933765-1656613983', '403055', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 7, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, 'confirmed', 0),
(100019, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 37.241379310345, '2', '2022-07-03 03:24:43', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-845511-1656793483', '388468', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 7, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, 'confirmed', 0),
(100020, '12', 'customer', 'paid', NULL, 'delivered', 'cash_on_delivery', '', 79.306948275864, '2', '2022-07-03 03:24:43', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-845511-1656793483', '125261', 1, 'admin', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 2, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, 'confirmed', 0),
(100021, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 344.8275862069, '2', '2022-07-04 00:31:11', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-451671-1656869471', '903945', 1, 'admin', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 2, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, 'confirmed', 0),
(100022, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 11.793103448276, '2', '2022-07-04 00:31:12', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-451671-1656869471', '625869', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100033, '34', 'customer', 'paid', NULL, 'delivered', 'cash_on_delivery', '', 4.6551724137933, '13', '2022-07-11 21:12:54', '2022-12-08 09:20:14', 0, NULL, NULL, 0, 0.00, '34-934903-1657548774', '901224', 11, 'seller', '{\"id\":13,\"customer_id\":34,\"contact_person_name\":\"+967771900009 +967771900009\",\"address_type\":\"Home\",\"address\":\"C5CX+CQP, 60, Sana\'a, Yemen\",\"city\":\"\\u0627\\u0644\\u0645\\u0637\\u0627\\u0631\",\"zip\":\"0222856\",\"phone\":\"+967771900009\",\"created_at\":\"2022-07-11T14:11:55.000000Z\",\"updated_at\":\"2022-07-11T14:11:55.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.4206758\",\"longitude\":\"44.1994567\",\"is_billing\":0}', 8, NULL, 13, '{\"id\":13,\"customer_id\":34,\"contact_person_name\":\"+967771900009 +967771900009\",\"address_type\":\"Home\",\"address\":\"C5CX+CQP, 60, Sana\'a, Yemen\",\"city\":\"\\u0627\\u0644\\u0645\\u0637\\u0627\\u0631\",\"zip\":\"0222856\",\"phone\":\"+967771900009\",\"created_at\":\"2022-07-11T14:11:55.000000Z\",\"updated_at\":\"2022-07-11T14:11:55.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.4206758\",\"longitude\":\"44.1994567\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, 'confirmed', 0),
(100034, '34', 'customer', 'paid', NULL, 'canceled', 'cash_on_delivery', '', 38.758620689656, '13', '2022-07-11 21:15:54', '2022-12-08 09:20:14', 0, NULL, NULL, 0, 0.00, '34-272935-1657548954', '472668', 11, 'seller', '{\"id\":13,\"customer_id\":34,\"contact_person_name\":\"+967771900009 +967771900009\",\"address_type\":\"Home\",\"address\":\"C5CX+CQP, 60, Sana\'a, Yemen\",\"city\":\"\\u0627\\u0644\\u0645\\u0637\\u0627\\u0631\",\"zip\":\"0222856\",\"phone\":\"+967771900009\",\"created_at\":\"2022-07-11T14:11:55.000000Z\",\"updated_at\":\"2022-07-11T14:11:55.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.4206758\",\"longitude\":\"44.1994567\",\"is_billing\":0}', 8, NULL, 13, '{\"id\":13,\"customer_id\":34,\"contact_person_name\":\"+967771900009 +967771900009\",\"address_type\":\"Home\",\"address\":\"C5CX+CQP, 60, Sana\'a, Yemen\",\"city\":\"\\u0627\\u0644\\u0645\\u0637\\u0627\\u0631\",\"zip\":\"0222856\",\"phone\":\"+967771900009\",\"created_at\":\"2022-07-11T14:11:55.000000Z\",\"updated_at\":\"2022-07-11T14:11:55.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.4206758\",\"longitude\":\"44.1994567\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, 'confirmed', 0),
(100036, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 5.1724137931035, '2', '2022-07-22 20:19:13', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-288508-1658495953', '813243', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, 'تمام', 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100037, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 14.48275862069, '2', '2022-07-22 20:19:13', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-288508-1658495953', '782114', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 7, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, 'confirmed', 0),
(100038, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 5.1724137931035, '2', '2022-07-22 20:19:21', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-588043-1658495961', '574791', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, 'تمام', 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100039, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 14.48275862069, '2', '2022-07-22 20:19:21', '2022-08-31 02:28:45', 0, NULL, NULL, 0, 0.00, '12-588043-1658495961', '367522', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, NULL, 0),
(100040, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 5.1724137931035, '2', '2022-07-22 20:19:29', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-440279-1658495969', '152256', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, 'تمام', 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100041, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 14.48275862069, '2', '2022-07-22 20:19:29', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-440279-1658495969', '461150', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100042, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 5.1724137931035, '2', '2022-07-22 20:19:35', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-920470-1658495975', '328459', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, 'تمام', 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100043, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 14.48275862069, '2', '2022-07-22 20:19:36', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-920470-1658495975', '637679', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100044, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 15.51724137931, '2', '2022-07-22 20:19:51', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-436062-1658495991', '455214', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100045, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 14.48275862069, '2', '2022-07-22 20:19:51', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-436062-1658495991', '673373', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100046, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 15.51724137931, '2', '2022-07-22 20:20:00', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-924332-1658496000', '616536', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100047, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 14.48275862069, '2', '2022-07-22 20:20:00', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-924332-1658496000', '560544', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100049, '28', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 20, '4', '2022-07-27 07:54:55', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '28-569877-1658883295', '160849', 11, 'seller', '{\"id\":4,\"customer_id\":28,\"contact_person_name\":\"+967778900010\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u064a\\u0645\\u0646\",\"city\":\"\\u0646\\u064a\\u0646\\u064a\\u064a\\u0646\\u064a\\u0646\\u064a\\u0646\",\"zip\":\"777784846\",\"phone\":\"+967778900010\",\"created_at\":\"2022-07-02T00:43:36.000000Z\",\"updated_at\":\"2022-07-02T00:43:36.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, NULL, 4, '{\"id\":4,\"customer_id\":28,\"contact_person_name\":\"+967778900010\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u064a\\u0645\\u0646\",\"city\":\"\\u0646\\u064a\\u0646\\u064a\\u064a\\u0646\\u064a\\u0646\\u064a\\u0646\",\"zip\":\"777784846\",\"phone\":\"+967778900010\",\"created_at\":\"2022-07-02T00:43:36.000000Z\",\"updated_at\":\"2022-07-02T00:43:36.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100050, '28', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 224.06896551724, '4', '2022-07-27 07:56:53', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '28-12859-1658883413', '692679', 11, 'seller', '{\"id\":4,\"customer_id\":28,\"contact_person_name\":\"+967778900010\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u064a\\u0645\\u0646\",\"city\":\"\\u0646\\u064a\\u0646\\u064a\\u064a\\u0646\\u064a\\u0646\\u064a\\u0646\",\"zip\":\"777784846\",\"phone\":\"+967778900010\",\"created_at\":\"2022-07-02T00:43:36.000000Z\",\"updated_at\":\"2022-07-02T00:43:36.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, NULL, 4, '{\"id\":4,\"customer_id\":28,\"contact_person_name\":\"+967778900010\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u064a\\u0645\\u0646\",\"city\":\"\\u0646\\u064a\\u0646\\u064a\\u064a\\u0646\\u064a\\u0646\\u064a\\u0646\",\"zip\":\"777784846\",\"phone\":\"+967778900010\",\"created_at\":\"2022-07-02T00:43:36.000000Z\",\"updated_at\":\"2022-07-02T00:43:36.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100051, '28', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 36206.896551725, '4', '2022-07-27 21:00:52', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '28-259753-1658930452', '126737', 13, 'seller', '{\"id\":4,\"customer_id\":28,\"contact_person_name\":\"+967778900010\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u064a\\u0645\\u0646\",\"city\":\"\\u0646\\u064a\\u0646\\u064a\\u064a\\u0646\\u064a\\u0646\\u064a\\u0646\",\"zip\":\"777784846\",\"phone\":\"+967778900010\",\"created_at\":\"2022-07-02T00:43:36.000000Z\",\"updated_at\":\"2022-07-02T00:43:36.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, NULL, 4, '{\"id\":4,\"customer_id\":28,\"contact_person_name\":\"+967778900010\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u064a\\u0645\\u0646\",\"city\":\"\\u0646\\u064a\\u0646\\u064a\\u064a\\u0646\\u064a\\u0646\\u064a\\u0646\",\"zip\":\"777784846\",\"phone\":\"+967778900010\",\"created_at\":\"2022-07-02T00:43:36.000000Z\",\"updated_at\":\"2022-07-02T00:43:36.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100052, '28', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 10.51724137931, '4', '2022-07-27 21:00:53', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '28-259753-1658930452', '467650', 11, 'seller', '{\"id\":4,\"customer_id\":28,\"contact_person_name\":\"+967778900010\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u064a\\u0645\\u0646\",\"city\":\"\\u0646\\u064a\\u0646\\u064a\\u064a\\u0646\\u064a\\u0646\\u064a\\u0646\",\"zip\":\"777784846\",\"phone\":\"+967778900010\",\"created_at\":\"2022-07-02T00:43:36.000000Z\",\"updated_at\":\"2022-07-02T00:43:36.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, NULL, 4, '{\"id\":4,\"customer_id\":28,\"contact_person_name\":\"+967778900010\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u064a\\u0645\\u0646\",\"city\":\"\\u0646\\u064a\\u0646\\u064a\\u064a\\u0646\\u064a\\u0646\\u064a\\u0646\",\"zip\":\"777784846\",\"phone\":\"+967778900010\",\"created_at\":\"2022-07-02T00:43:36.000000Z\",\"updated_at\":\"2022-07-02T00:43:36.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100053, '341', 'customer', 'unpaid', NULL, 'canceled', 'cash_on_delivery', '', 29.48275862069, '157', '2022-10-11 22:03:12', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '341-69423-1665500591', '499128', 11, 'seller', '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', NULL, NULL, 157, '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, NULL, 0),
(100054, '341', 'customer', 'unpaid', NULL, 'canceled', 'cash_on_delivery', '', 13.793103448276, '157', '2022-10-11 22:03:12', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '341-69423-1665500591', '771541', 17, 'seller', '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', NULL, NULL, 157, '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100055, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 15.51724137931, '2', '2022-07-28 05:38:12', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-474473-1658961492', '323003', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100056, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 62.379310344828, '2', '2022-07-28 05:38:13', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-474473-1658961492', '273187', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100057, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 15.51724137931, '2', '2022-07-28 05:39:36', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-340732-1658961576', '458626', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100058, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 62.379310344828, '2', '2022-07-28 05:39:36', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-340732-1658961576', '304865', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100059, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 15.51724137931, '2', '2022-07-30 04:54:52', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-685672-1659131692', '520627', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100060, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 62.379310344828, '2', '2022-07-30 04:54:53', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-685672-1659131692', '392183', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100061, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 15.51724137931, '2', '2022-07-30 04:59:25', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-896924-1659131965', '452724', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100062, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 62.379310344828, '2', '2022-07-30 04:59:25', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-896924-1659131965', '751281', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0);
INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `payment_date`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `timeToDelivery`, `daysToDelivery`, `delivery_service_name`, `third_party_delivery_tracking_id`, `order_delivery_status`, `deferred`) VALUES
(100063, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 15.51724137931, '2', '2022-07-30 05:00:39', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-661836-1659132039', '772639', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100064, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 62.379310344828, '2', '2022-07-30 05:00:40', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-661836-1659132039', '285162', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100065, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 15.51724137931, '2', '2022-07-30 05:02:44', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-583370-1659132164', '418117', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100066, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 62.379310344828, '2', '2022-07-30 05:02:45', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-583370-1659132164', '265615', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100067, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 15.51724137931, '2', '2022-07-30 05:03:26', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-965169-1659132206', '214754', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, 'ok', 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100068, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 62.379310344828, '2', '2022-07-30 05:03:26', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-965169-1659132206', '588847', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100069, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 55.172413793104, '2', '2022-07-30 05:06:41', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-516019-1659132401', '884123', 25, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100070, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 117.93103448276, '2', '2022-07-31 01:27:30', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-603475-1659205650', '938390', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100071, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 2.7586206896552, '2', '2022-07-31 01:27:31', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-603475-1659205650', '783537', 19, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100072, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 100.34482758621, '2', '2022-08-01 22:49:47', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-86358-1659368987', '393741', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100073, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 8.6206896551725, '2', '2022-08-01 22:49:48', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-86358-1659368987', '218797', 15, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100074, '12', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 13.448275862069, '2', '2022-08-01 22:49:48', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-86358-1659368987', '194856', 17, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', NULL, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100075, '12', 'customer', 'paid', NULL, 'out_for_delivery', 'cash_on_delivery', '', 168.79310344828, '2', '2022-08-03 02:32:56', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '12-752418-1659468776', '279224', 11, 'seller', '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 1, NULL, 2, '{\"id\":2,\"customer_id\":12,\"contact_person_name\":\"\\u0633\\u0648\\u0628\\u0631\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"\\u062a\\u0645\\u0627\\u0645\",\"zip\":\"777363554\",\"phone\":\"+967779132016\",\"created_at\":\"2022-06-23T16:12:30.000000Z\",\"updated_at\":\"2022-06-23T16:12:30.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2789014\",\"longitude\":\"44.2195414\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, 'confirmed', 0),
(100076, '364', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 176.03448275862, '174', '2022-10-18 23:59:23', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-503300-1666112363', '331248', 11, 'seller', '{\"id\":174,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0631\\u0639 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0639\\u0632\\u064a\\u0632 \\u0627\\u0644\\u0643\\u0631\\u062f\\u0649\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-17T13:19:13.000000Z\",\"updated_at\":\"2022-10-17T13:19:13.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, NULL, 174, '{\"id\":174,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0631\\u0639 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0639\\u0632\\u064a\\u0632 \\u0627\\u0644\\u0643\\u0631\\u062f\\u0649\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-17T13:19:13.000000Z\",\"updated_at\":\"2022-10-17T13:19:13.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100077, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 81.033103448276, '160', '2022-10-19 02:46:49', '2022-12-06 07:55:15', 0, NULL, NULL, 12, 17.24, '346-256618-1666122409', '636965', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100078, '50', 'customer', 'paid', NULL, 'out_for_delivery', 'cash_on_delivery', '', 48.275862068964, '20', '2022-08-10 07:33:51', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '50-270975-1660091631', '507109', 27, 'seller', '{\"id\":20,\"customer_id\":50,\"contact_person_name\":\"+967775451467 +967775451467\",\"address_type\":\"Home\",\"address\":\"96MX+JPV\\u060c \\u0635\\u0646\\u0639\\u0627\\u0621\\u200e\\u060c\\u060c Yemen\",\"city\":\"Home\",\"zip\":\"+967775451\",\"phone\":\"+967775451467\",\"created_at\":\"2022-07-26T23:54:42.000000Z\",\"updated_at\":\"2022-07-26T23:54:42.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, NULL, 20, '{\"id\":20,\"customer_id\":50,\"contact_person_name\":\"+967775451467 +967775451467\",\"address_type\":\"Home\",\"address\":\"96MX+JPV\\u060c \\u0635\\u0646\\u0639\\u0627\\u0621\\u200e\\u060c\\u060c Yemen\",\"city\":\"Home\",\"zip\":\"+967775451\",\"phone\":\"+967775451467\",\"created_at\":\"2022-07-26T23:54:42.000000Z\",\"updated_at\":\"2022-07-26T23:54:42.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100079, '50', 'customer', 'unpaid', NULL, 'out_for_delivery', 'cash_on_delivery', '', 30.187931034483, '20', '2022-08-10 07:33:51', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '50-270975-1660091631', '190533', 25, 'seller', '{\"id\":20,\"customer_id\":50,\"contact_person_name\":\"+967775451467 +967775451467\",\"address_type\":\"Home\",\"address\":\"96MX+JPV\\u060c \\u0635\\u0646\\u0639\\u0627\\u0621\\u200e\\u060c\\u060c Yemen\",\"city\":\"Home\",\"zip\":\"+967775451\",\"phone\":\"+967775451467\",\"created_at\":\"2022-07-26T23:54:42.000000Z\",\"updated_at\":\"2022-07-26T23:54:42.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, NULL, 20, '{\"id\":20,\"customer_id\":50,\"contact_person_name\":\"+967775451467 +967775451467\",\"address_type\":\"Home\",\"address\":\"96MX+JPV\\u060c \\u0635\\u0646\\u0639\\u0627\\u0621\\u200e\\u060c\\u060c Yemen\",\"city\":\"Home\",\"zip\":\"+967775451\",\"phone\":\"+967775451467\",\"created_at\":\"2022-07-26T23:54:42.000000Z\",\"updated_at\":\"2022-07-26T23:54:42.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100080, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 126.27448275862, '160', '2022-10-20 17:40:59', '2022-12-06 07:55:15', 0, NULL, NULL, 12, 17.24, '346-188100-1666262459', '325494', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100081, '241', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 129.72413793104, '103', '2022-08-26 01:23:20', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '241-515572-1661451800', '998659', 11, 'seller', '{\"id\":103,\"customer_id\":241,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"Home\",\"zip\":\"+967701000\",\"phone\":\"+967701000040\",\"created_at\":\"2022-08-16T19:43:01.000000Z\",\"updated_at\":\"2022-08-16T19:43:01.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2788776\",\"longitude\":\"44.2196225\",\"is_billing\":0}', NULL, NULL, 103, '{\"id\":103,\"customer_id\":241,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"Home\",\"zip\":\"+967701000\",\"phone\":\"+967701000040\",\"created_at\":\"2022-08-16T19:43:01.000000Z\",\"updated_at\":\"2022-08-16T19:43:01.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2788776\",\"longitude\":\"44.2196225\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100082, '241', 'customer', 'paid', NULL, 'delivered', 'cash_on_delivery', '', 144.03448275862, '103', '2022-08-28 02:00:03', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '241-168524-1661626803', '941907', 11, 'seller', '{\"id\":103,\"customer_id\":241,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"Home\",\"zip\":\"+967701000\",\"phone\":\"+967701000040\",\"created_at\":\"2022-08-16T19:43:01.000000Z\",\"updated_at\":\"2022-08-16T19:43:01.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2788776\",\"longitude\":\"44.2196225\",\"is_billing\":0}', 7, NULL, 103, '{\"id\":103,\"customer_id\":241,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"Home\",\"zip\":\"+967701000\",\"phone\":\"+967701000040\",\"created_at\":\"2022-08-16T19:43:01.000000Z\",\"updated_at\":\"2022-08-16T19:43:01.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2788776\",\"longitude\":\"44.2196225\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, 'confirmed', 0),
(100083, '241', 'customer', 'paid', NULL, 'delivered', 'cash_on_delivery', '', 3.5344827586207, '103', '2022-08-28 02:00:05', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '241-168524-1661626803', '141780', 39, 'seller', '{\"id\":103,\"customer_id\":241,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"Home\",\"zip\":\"+967701000\",\"phone\":\"+967701000040\",\"created_at\":\"2022-08-16T19:43:01.000000Z\",\"updated_at\":\"2022-08-16T19:43:01.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2788776\",\"longitude\":\"44.2196225\",\"is_billing\":0}', 3, NULL, 103, '{\"id\":103,\"customer_id\":241,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"Home\",\"zip\":\"+967701000\",\"phone\":\"+967701000040\",\"created_at\":\"2022-08-16T19:43:01.000000Z\",\"updated_at\":\"2022-08-16T19:43:01.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2788776\",\"longitude\":\"44.2196225\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', 'self_delivery', '0', '0', NULL, NULL, 'confirmed', 0),
(100084, '241', 'customer', 'paid', NULL, 'processing', 'cash_on_delivery', '', 159.37793103449, '103', '2022-09-04 02:01:55', '2022-12-06 07:55:15', 0, NULL, NULL, 12, 17.24, '241-864839-1662231715', '430513', 11, 'seller', '{\"id\":103,\"customer_id\":241,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"Home\",\"zip\":\"+967701000\",\"phone\":\"+967701000040\",\"created_at\":\"2022-08-16T19:43:01.000000Z\",\"updated_at\":\"2022-08-16T19:43:01.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2788776\",\"longitude\":\"44.2196225\",\"is_billing\":0}', NULL, NULL, 103, '{\"id\":103,\"customer_id\":241,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u062c\\u0648\\u0644\\u0629 \\u0628\\u064a\\u062a \\u0628\\u0648\\u0633 \\u0628\\u0631\\u062c \\u0627\\u0644\\u0645\\u062c\\u062f \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0639 \\u0634\\u0642\\u0647 \\u0631\\u0642\\u0645(\\u0661\\u0667\\u060c Sana\'a, Yemen\",\"city\":\"Home\",\"zip\":\"+967701000\",\"phone\":\"+967701000040\",\"created_at\":\"2022-08-16T19:43:01.000000Z\",\"updated_at\":\"2022-08-16T19:43:01.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.2788776\",\"longitude\":\"44.2196225\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100085, '341', 'customer', 'unpaid', NULL, 'canceled', 'cash_on_delivery', '', 12.068965517241, '157', '2022-10-11 22:03:12', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '341-69423-1665500591', '568687', 27, 'seller', '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', NULL, NULL, 157, '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100086, '341', 'customer', 'unpaid', NULL, 'canceled', 'cash_on_delivery', '', 8.1034482758622, '157', '2022-10-11 22:03:13', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '341-69423-1665500591', '822402', 37, 'seller', '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', NULL, NULL, 157, '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100087, '341', 'customer', 'unpaid', NULL, 'canceled', 'cash_on_delivery', '', 3.5344827586207, '157', '2022-10-11 22:03:13', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '341-69423-1665500591', '439250', 39, 'seller', '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', NULL, NULL, 157, '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100088, '341', 'customer', 'paid', NULL, 'delivered', 'cash_on_delivery', '', 22.413793103449, '157', '2022-10-11 22:03:13', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '341-69423-1665500591', '993589', 1, 'admin', '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', NULL, NULL, 157, '{\"id\":157,\"customer_id\":341,\"contact_person_name\":\"Kare company Kareem\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+20111635907\",\"phone\":\"+20111635907\",\"created_at\":\"2022-10-11T15:02:57.000000Z\",\"updated_at\":\"2022-10-11T15:02:57.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.2988477\",\"longitude\":\"31.7134214\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100089, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 68.689655172414, '160', '2022-10-13 02:14:15', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-864333-1665602054', '574063', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100090, '346', 'customer', 'unpaid', NULL, 'canceled', 'cash_on_delivery', '', 19.48275862069, '160', '2022-10-13 02:14:15', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-864333-1665602054', '442419', 37, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100091, '348', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 77.653793103449, '163', '2022-10-13 15:16:13', '2022-12-06 07:55:15', 0, NULL, NULL, 12, 17.24, '348-442272-1665648973', '503960', 11, 'seller', '{\"id\":163,\"customer_id\":348,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\",\"city\":\"Home\",\"zip\":\"+201116359075\",\"phone\":\"+201116359075\",\"created_at\":\"2022-10-13T08:12:20.000000Z\",\"updated_at\":\"2022-10-13T08:12:20.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, NULL, 163, '{\"id\":163,\"customer_id\":348,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\",\"city\":\"Home\",\"zip\":\"+201116359075\",\"phone\":\"+201116359075\",\"created_at\":\"2022-10-13T08:12:20.000000Z\",\"updated_at\":\"2022-10-13T08:12:20.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100092, '348', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 4.0517241379311, '163', '2022-10-13 15:16:13', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '348-442272-1665648973', '345096', 37, 'seller', '{\"id\":163,\"customer_id\":348,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\",\"city\":\"Home\",\"zip\":\"+201116359075\",\"phone\":\"+201116359075\",\"created_at\":\"2022-10-13T08:12:20.000000Z\",\"updated_at\":\"2022-10-13T08:12:20.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, NULL, 163, '{\"id\":163,\"customer_id\":348,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\",\"city\":\"Home\",\"zip\":\"+201116359075\",\"phone\":\"+201116359075\",\"created_at\":\"2022-10-13T08:12:20.000000Z\",\"updated_at\":\"2022-10-13T08:12:20.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100093, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 164.86206896552, '160', '2022-10-16 02:33:23', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-77016-1665862403', '627688', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100094, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 22.413793103449, '160', '2022-10-16 02:33:24', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-77016-1665862403', '665640', 1, 'admin', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100095, '366', 'customer', 'paid', NULL, 'delivered', 'cash_on_delivery', '', 84.482758620687, '172', '2022-10-16 21:53:45', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '366-123152-1665932025', '302786', 27, 'seller', '{\"id\":172,\"customer_id\":366,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u062f\\u0633\\u064a\\u0629\\u060c \\u0635\\u0646\\u0639\\u0627\\u0621\\u200e\\u060c\\u060c 866J+5Q6, Sana\'a, Yemen\",\"city\":\"Home\",\"zip\":\"+967771554666\",\"phone\":\"+967771554666\",\"created_at\":\"2022-10-16T14:43:20.000000Z\",\"updated_at\":\"2022-10-16T14:43:20.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.3105509\",\"longitude\":\"44.2318064\",\"is_billing\":0}', NULL, NULL, 172, '{\"id\":172,\"customer_id\":366,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u062f\\u0633\\u064a\\u0629\\u060c \\u0635\\u0646\\u0639\\u0627\\u0621\\u200e\\u060c\\u060c 866J+5Q6, Sana\'a, Yemen\",\"city\":\"Home\",\"zip\":\"+967771554666\",\"phone\":\"+967771554666\",\"created_at\":\"2022-10-16T14:43:20.000000Z\",\"updated_at\":\"2022-10-16T14:43:20.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"15.3105509\",\"longitude\":\"44.2318064\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0);
INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `payment_date`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `timeToDelivery`, `daysToDelivery`, `delivery_service_name`, `third_party_delivery_tracking_id`, `order_delivery_status`, `deferred`) VALUES
(100096, '364', 'customer', 'unpaid', NULL, 'delivered', 'cash_on_delivery', '', 54.655172413793, '170', '2022-10-16 22:57:34', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-22763-1665935854', '878411', 11, 'seller', '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', NULL, NULL, 170, '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100097, '364', 'customer', 'paid', NULL, 'delivered', 'cash_on_delivery', '', 75.586206896552, '170', '2022-10-17 00:40:03', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-727786-1665942003', '933997', 11, 'seller', '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', NULL, NULL, 170, '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100098, '364', 'customer', 'unpaid', NULL, 'delivered', 'cash_on_delivery', '', 238.1724137931, '170', '2022-10-17 00:47:34', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-485188-1665942454', '605934', 11, 'seller', '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', NULL, NULL, 170, '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100099, '364', 'customer', 'unpaid', NULL, 'canceled', 'cash_on_delivery', '', 177.75862068966, '170', '2022-10-17 02:12:24', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-425101-1665947544', '990573', 11, 'seller', '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', NULL, NULL, 170, '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100100, '364', 'customer', 'paid', NULL, 'confirmed', 'cash_on_delivery', '', 94.344827586208, '170', '2022-10-17 03:00:22', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-749930-1665950422', '317578', 11, 'seller', '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', NULL, NULL, 170, '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100101, '364', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 223.27586206897, '170', '2022-10-17 07:22:20', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-162733-1665966140', '502299', 11, 'seller', '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', NULL, NULL, 170, '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100102, '364', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 94.344827586208, '170', '2022-10-17 20:14:06', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-366884-1666012446', '119789', 11, 'seller', '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', NULL, NULL, 170, '{\"id\":170,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-15T21:26:08.000000Z\",\"updated_at\":\"2022-10-15T21:26:08.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"31.7423434\",\"longitude\":\"30.2926655\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100103, '364', 'customer', 'paid', NULL, 'pending', 'cash_on_delivery', '', 191.37931034483, '174', '2022-10-17 20:34:45', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-106507-1666013685', '263876', 11, 'seller', '{\"id\":174,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0631\\u0639 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0639\\u0632\\u064a\\u0632 \\u0627\\u0644\\u0643\\u0631\\u062f\\u0649\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-17T13:19:13.000000Z\",\"updated_at\":\"2022-10-17T13:19:13.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, NULL, 174, '{\"id\":174,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0631\\u0639 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0639\\u0632\\u064a\\u0632 \\u0627\\u0644\\u0643\\u0631\\u062f\\u0649\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-17T13:19:13.000000Z\",\"updated_at\":\"2022-10-17T13:19:13.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100104, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 65.344827586208, '160', '2022-10-18 23:53:03', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-510043-1666111983', '630407', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100105, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 94.344827586208, '160', '2022-10-18 23:54:31', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-274272-1666112071', '954330', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100106, '364', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 287.06896551724, '174', '2022-10-18 23:56:08', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-296592-1666112168', '598275', 11, 'seller', '{\"id\":174,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0631\\u0639 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0639\\u0632\\u064a\\u0632 \\u0627\\u0644\\u0643\\u0631\\u062f\\u0649\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-17T13:19:13.000000Z\",\"updated_at\":\"2022-10-17T13:19:13.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, NULL, 174, '{\"id\":174,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0631\\u0639 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0639\\u0632\\u064a\\u0632 \\u0627\\u0644\\u0643\\u0631\\u062f\\u0649\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-17T13:19:13.000000Z\",\"updated_at\":\"2022-10-17T13:19:13.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100107, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 19.48275862069, '160', '2022-10-19 19:09:44', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-492791-1666181384', '570214', 37, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100108, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 70.758620689656, '160', '2022-10-19 19:09:44', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-492791-1666181384', '593341', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100109, '364', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 50.172413793105, '192', '2022-10-20 17:42:57', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-23846-1666262577', '358401', 11, 'seller', '{\"id\":192,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-18T22:19:05.000000Z\",\"updated_at\":\"2022-10-18T22:19:05.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.298854936197028\",\"longitude\":\"31.713447645306584\",\"is_billing\":0}', NULL, NULL, 192, '{\"id\":192,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-18T22:19:05.000000Z\",\"updated_at\":\"2022-10-18T22:19:05.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.298854936197028\",\"longitude\":\"31.713447645306584\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100110, '364', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 284.31034482759, '192', '2022-10-21 00:50:06', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '364-444279-1666288206', '601295', 11, 'seller', '{\"id\":192,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-18T22:19:05.000000Z\",\"updated_at\":\"2022-10-18T22:19:05.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.298854936197028\",\"longitude\":\"31.713447645306584\",\"is_billing\":0}', NULL, NULL, 192, '{\"id\":192,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-18T22:19:05.000000Z\",\"updated_at\":\"2022-10-18T22:19:05.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.298854936197028\",\"longitude\":\"31.713447645306584\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100111, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 880.75862068966, '160', '2022-10-21 18:15:22', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-522025-1666350922', '796954', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100112, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 154.65517241379, '160', '2022-10-21 21:41:21', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-431058-1666363281', '467015', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100113, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 117.93103448276, '160', '2022-10-21 21:42:10', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-401298-1666363330', '404628', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100114, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 211.58620689655, '160', '2022-10-22 17:50:16', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-482357-1666435816', '168478', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100115, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 69.103448275863, '160', '2022-10-24 00:30:23', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-71264-1666546222', '920410', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100116, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 119.27586206897, '160', '2022-10-24 01:03:24', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-884477-1666548204', '983897', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100117, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 200.68965517242, '160', '2022-10-24 01:09:33', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-320813-1666548573', '293175', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100118, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 300.89655172414, '160', '2022-10-24 01:39:41', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-886278-1666550381', '915896', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100119, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 0.053275862068966, '160', '2022-10-24 01:39:41', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-886278-1666550381', '164551', 78, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100120, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 3.5344827586207, '160', '2022-10-24 01:39:41', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-886278-1666550381', '593940', 39, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100121, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 19.48275862069, '160', '2022-10-24 01:39:42', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-886278-1666550381', '126291', 37, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100122, '346', 'customer', 'unpaid', NULL, 'pending', 'cash_on_delivery', '', 60.413793103449, '160', '2022-10-24 02:00:43', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-760127-1666551643', '391845', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', NULL, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100123, '354', 'customer', 'unpaid', NULL, 'canceled', 'cash_on_delivery', '', 19.48275862069, '160', '2022-10-24 02:00:43', '2022-12-09 22:01:52', 0, NULL, NULL, 0, 0.00, '346-760127-1666551643', '735837', 37, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 8, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100124, '354', 'customer', 'paid', NULL, 'delivered', 'cash_on_delivery', '', 144.31034482759, '160', '2022-10-24 02:03:40', '2022-12-06 07:55:15', 0, NULL, NULL, 0, 0.00, '346-288283-1666551820', '781653', 11, 'seller', '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 8, NULL, 160, '{\"id\":160,\"customer_id\":346,\"contact_person_name\":\"\\u0627\\u0644\\u0627\\u0633\\u0627\\u0633\\u064a\\u0633\",\"address_type\":\"Home\",\"address\":\"18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt\",\"city\":\"Home\",\"zip\":\"+201118522180\",\"phone\":\"+201118522180\",\"created_at\":\"2022-10-12T17:25:17.000000Z\",\"updated_at\":\"2022-10-12T17:25:17.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"29.9839128\",\"longitude\":\"30.9342861\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0),
(100125, '354\n', 'customer', 'paid', NULL, 'delivered', 'cash_on_delivery', '', 727.96551724139, '160', '2022-12-10 20:44:22', '2022-12-14 10:26:43', 0, NULL, NULL, 0, 0.00, '364-881591-1666705462', '904194', 79, 'seller', '{\"id\":201,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-21T09:02:14.000000Z\",\"updated_at\":\"2022-10-21T09:02:14.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.29266538402099\",\"longitude\":\"31.742343418300155\",\"is_billing\":0}', 8, NULL, 201, '{\"id\":201,\"customer_id\":364,\"contact_person_name\":\"\\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0643\\u0631\\u064a\\u0645\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u0639\\u0627\\u0634\\u0631 \\u0645\\u0646 \\u0631\\u0645\\u0636\\u0627\\u0646\\u060c Egypt\",\"city\":\"Home\",\"zip\":\"+201552606425\",\"phone\":\"+201552606425\",\"created_at\":\"2022-10-21T09:02:14.000000Z\",\"updated_at\":\"2022-10-21T09:02:14.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.29266538402099\",\"longitude\":\"31.742343418300155\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, '0', '0', NULL, NULL, 'confirmed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `payment_date` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0,
  `deffered` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `payment_date`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`, `deffered`) VALUES
(206, 100125, 12, 148, '{\"id\":12,\"added_by\":\"seller\",\"user_id\":11,\"child_seller_id\":\"0\",\"name\":\"\",\"product_type\":\"عصير تفاح\",\"slug\":\"\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":5,\"unit\":\"\\u062d\\u0628\\u0629\",\"unit_numbers\":\"30\",\"min_qty\":1,\"refundable\":1,\"images\":\"1669677042.jpg\",\"thumbnail\":\"1669677042.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"[\\\"19\\\",\\\"18\\\",\\\"7\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_19\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"250\\\\u0645\\\\u0644\\\"]},{\\\"name\\\":\\\"choice_18\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u0643\\\\u0645\\\\u064a\\\\u0629\\\",\\\"options\\\":[\\\"30\\\"]},{\\\"name\\\":\\\"choice_7\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u0646\\\\u0643\\\\u0647\\\\u0629\\\",\\\"options\\\":[\\\"\\\\u0627\\\\u0644\\\\u0627\\\\u0635\\\\u0644\\\\u064a\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"250\\\\u0645\\\\u0644-30-\\\\u0627\\\\u0644\\\\u0627\\\\u0635\\\\u0644\\\\u064a\\\",\\\"price\\\":16.724137931034650961237275623716413974761962890625,\\\"sku\\\":null,\\\"qty\\\":5}]\",\"published\":1,\"unit_price\":180,\"purchase_price\":60,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":430,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-10-23T19:03:40.000000Z\",\"status\":1,\"status_branch\":\"1\",\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-06-62c59caf7f222.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 7, 180, 0, 0, 'delivered', 'paid', NULL, '2023-01-18 19:54:36', '2022-12-14 10:26:43', NULL, ' جرام 165  * 56', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"250\\u0645\\u0644\",\"\\u0627\\u0644\\u0643\\u0645\\u064a\\u0629\":\"30\",\"\\u0627\\u0644\\u0646\\u0643\\u0647\\u0629\":\"\\u0627\\u0644\\u0627\\u0635\\u0644\\u064a\"}', 'discount_on_product', 1, 0, 0),
(208, 100123, 11, 148, '{\"id\":11,\"added_by\":\"seller\",\"user_id\":11,\"child_seller_id\":\"0\",\"name\":\"\",\"product_type\":\"عصير تفاح\",\"slug\":\"\",\"category_ids\":\"[{\\\"id\\\":\\\"1206\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2},{\\\"id\\\":\\\"2\\\",\\\"position\\\":3}]\",\"brand_id\":5,\"unit\":\"\\u062d\\u0628\\u0629\",\"unit_numbers\":\"24\",\"min_qty\":1,\"refundable\":1,\"images\":\"1669677042.jpg\",\"thumbnail\":\"1669677042.jpg\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"[\\\"19\\\",\\\"18\\\",\\\"7\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_19\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"400\\\\u062c\\\\u0631\\\\u0627\\\\u0645\\\"]},{\\\"name\\\":\\\"choice_18\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u0643\\\\u0645\\\\u064a\\\\u0629\\\",\\\"options\\\":[\\\"24\\\"]},{\\\"name\\\":\\\"choice_7\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u0646\\\\u0643\\\\u0647\\\\u0629\\\",\\\"options\\\":[\\\"\\\\u0627\\\\u0644\\\\u0627\\\\u0635\\\\u0644\\\\u064a\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"400\\\\u062c\\\\u0631\\\\u0627\\\\u0645-24-\\\\u0627\\\\u0644\\\\u0627\\\\u0635\\\\u0644\\\\u064a\\\",\\\"price\\\":180,\\\"sku\\\":null,\\\"qty\\\":10}]\",\"published\":1,\"unit_price\":180,\"purchase_price\":60,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":4410,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-10-23T19:00:43.000000Z\",\"status\":1,\"status_branch\":\"1\",\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-06-62c5a7d445959.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 5, 180, 0, 0, 'delivered', 'unpaid', NULL, '2023-01-18 22:00:00', '2022-12-14 10:26:43', NULL, ' جرام 165  * 56', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"400\\u062c\\u0631\\u0627\\u0645\",\"\\u0627\\u0644\\u0643\\u0645\\u064a\\u0629\":\"24\",\"\\u0627\\u0644\\u0646\\u0643\\u0647\\u0629\":\"\\u0627\\u0644\\u0627\\u0635\\u0644\\u064a\"}', 'discount_on_product', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`seller_id`, `order_id`, `order_amount`, `seller_amount`, `admin_commission`, `received_by`, `status`, `delivery_charge`, `tax`, `created_at`, `updated_at`, `customer_id`, `seller_is`, `delivered_by`, `payment_method`, `transaction_id`, `id`) VALUES
(1, 100014, '110.34', '110.34', '0.00', 'delivery man', 'disburse', '5.00', '0.00', '2022-08-31 02:20:24', '2022-08-31 02:20:24', 12, 'admin', 'delivery man', 'cash_on_delivery', '1576-79JY1-1661887224', 5),
(1, 100020, '79.31', '79.31', '0.00', 'delivery man', 'disburse', '0.00', '0.00', '2022-08-31 02:23:38', '2022-08-31 02:23:38', 12, 'admin', 'delivery man', 'cash_on_delivery', '3652-8xUKY-1661887418', 6),
(39, 100083, '3.53', '3.53', '0.00', 'admin', 'disburse', '0.00', '0.00', '2022-09-04 02:12:25', '2022-09-04 02:12:25', 241, 'seller', 'admin', 'cash_on_delivery', '8443-nqEGZ-1662232345', 7),
(11, 100033, '4.66', '4.66', '0.00', 'delivery man', 'disburse', '0.00', '0.00', '2022-09-06 01:43:56', '2022-09-06 01:43:56', 34, 'seller', 'delivery man', 'cash_on_delivery', '4031-oIVk9-1662403436', 8),
(11, 100082, '144.03', '144.03', '0.00', 'delivery man', 'disburse', '0.00', '0.00', '2022-09-06 08:42:20', '2022-09-06 08:42:20', 241, 'seller', 'delivery man', 'cash_on_delivery', '7161-de9dj-1662428540', 9),
(11, 100096, '54.66', '54.66', '0.00', 'admin', 'disburse', '0.00', '0.00', '2022-10-16 23:29:05', '2022-10-16 23:29:05', 364, 'seller', 'admin', 'cash_on_delivery', '9155-qzeju-1665937745', 10),
(27, 100095, '84.48', '84.48', '0.00', 'admin', 'disburse', '0.00', '0.00', '2022-10-16 23:29:48', '2022-10-16 23:29:48', 366, 'seller', 'admin', 'cash_on_delivery', '1868-5oyw3-1665937788', 11),
(1, 100088, '22.41', '22.41', '0.00', 'admin', 'disburse', '0.00', '0.00', '2022-10-16 23:31:21', '2022-10-16 23:31:21', 341, 'admin', 'admin', 'cash_on_delivery', '9158-QG6g9-1665937881', 12),
(11, 100097, '75.59', '75.59', '0.00', 'admin', 'disburse', '0.00', '0.00', '2022-10-17 00:41:13', '2022-10-17 00:41:13', 364, 'seller', 'admin', 'cash_on_delivery', '9983-CGqGD-1665942073', 13),
(11, 100098, '238.17', '238.17', '0.00', 'admin', 'disburse', '0.00', '0.00', '2022-10-17 00:48:06', '2022-10-17 00:48:06', 364, 'seller', 'admin', 'cash_on_delivery', '3091-jPrby-1665942486', 14);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`identity`, `token`, `created_at`) VALUES
('qaderfood@gmail.com', 'pEpTswQjgJs4PZVrk1QLQxotDS5fjkMBFO4a1mgRFKxCfXyz5fF5QngdPtujsj0wzJIxMLhmNfzcD8u6tSgo2t9DzZmIyVcyGNr4tjMKYv8YgBRhRKaMvOGQ', '2022-06-17 01:44:23'),
('qaderfood@gmail.com', 'tfnHDU9x01n3K0SmXWLSiesz4o8wns1PGxgLasmyCm90MrzxMhm6I6NLFywwwJmXDMqgyok1uSjyhmDBkA54STNcomLkIJe2ebG6xvGfHIl8nqyUvg78BLX4', '2022-06-17 01:44:37'),
('qaderfood@gmail.com', 'gByPbSK7dXvOEr0sCfFNlpQIgTofBQDyJBTBSH5L6cWW7hjIf2gwvZp1DntvU8GpRCFztxwIhsE1OxrVJnbktNoBFdWTtaJRUi6hzKcFUMAYJLKCclJb5yap', '2022-06-17 02:40:27');

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_or_email_verifications`
--

INSERT INTO `phone_or_email_verifications` (`id`, `phone_or_email`, `token`, `created_at`, `updated_at`) VALUES
(1, '+967770500017', '1899', '2022-06-04 07:50:03', '2022-06-04 07:50:03'),
(2, '+967770500017', '9899', '2022-06-04 07:50:16', '2022-06-04 07:50:16'),
(3, '+967776890272', '9776', '2022-06-05 21:32:15', '2022-06-05 21:32:15'),
(4, '+967776890272', '6836', '2022-06-05 21:32:52', '2022-06-05 21:32:52'),
(5, '+967776800218', '1737', '2022-06-05 21:35:22', '2022-06-05 21:35:22'),
(6, '+967776800218', '7337', '2022-06-05 21:35:37', '2022-06-05 21:35:37'),
(7, '+967776800218', '3288', '2022-06-05 21:35:38', '2022-06-05 21:35:38'),
(25, '+967777363554', '3942', '2022-06-13 01:34:44', '2022-06-13 01:34:44'),
(92, '+967735594755', '3751', '2022-06-14 12:56:12', '2022-06-14 12:56:12'),
(93, '+967735594755', '3411', '2022-06-14 12:56:58', '2022-06-14 12:56:58'),
(94, '+967735594755', '8962', '2022-06-14 12:57:35', '2022-06-14 12:57:35'),
(117, '+37673296407-', '5543', '2022-06-20 07:53:23', '2022-06-20 07:53:23'),
(118, '+37673296407-', '1250', '2022-06-20 07:53:46', '2022-06-20 07:53:46'),
(119, '+37673296407-', '2873', '2022-06-20 07:53:59', '2022-06-20 07:53:59'),
(120, '+37673296407-', '7688', '2022-06-20 07:54:11', '2022-06-20 07:54:11'),
(121, '+355048560906', '2275', '2022-06-20 09:33:05', '2022-06-20 09:33:05'),
(122, '+355048560906', '2881', '2022-06-20 09:33:35', '2022-06-20 09:33:35'),
(123, '+355048560906', '3720', '2022-06-20 09:34:00', '2022-06-20 09:34:00'),
(124, '+355048560906', '9360', '2022-06-20 09:34:10', '2022-06-20 09:34:10'),
(165, '+967701000040', '4770', '2022-06-22 00:46:07', '2022-06-22 00:46:07'),
(166, '+967779800010', '9089', '2022-06-23 06:29:51', '2022-06-23 06:29:51'),
(167, '+967779800010', '3259', '2022-06-23 06:31:14', '2022-06-23 06:31:14'),
(168, '+967779800010', '7748', '2022-06-23 06:31:20', '2022-06-23 06:31:20'),
(169, '+967779800010', '3737', '2022-06-23 06:31:22', '2022-06-23 06:31:22'),
(177, 'Mralaalhaj3@gmail.com', '6208', '2022-06-26 13:54:11', '2022-06-26 13:54:11'),
(182, '+967714040704', '4330', '2022-06-29 07:37:51', '2022-06-29 07:37:51'),
(183, '+967714040704', '2477', '2022-06-29 07:38:27', '2022-06-29 07:38:27'),
(184, '+967714040704', '9677', '2022-06-29 07:38:36', '2022-06-29 07:38:36'),
(185, '+967714040704', '9185', '2022-06-29 07:38:38', '2022-06-29 07:38:38'),
(186, '+967774233959', '7140', '2022-06-29 07:40:38', '2022-06-29 07:40:38'),
(187, '+967774233959', '1564', '2022-06-29 07:40:50', '2022-06-29 07:40:50'),
(188, '+358774233959', '5819', '2022-06-29 07:41:02', '2022-06-29 07:41:02'),
(189, '+967774233959', '6482', '2022-06-29 07:41:56', '2022-06-29 07:41:56'),
(220, '+967779800010', '7290', '2022-07-02 07:36:23', '2022-07-02 07:36:23'),
(221, '+967779800010', '5645', '2022-07-02 07:37:12', '2022-07-02 07:37:12'),
(222, '+967779800010', '6488', '2022-07-02 07:37:15', '2022-07-02 07:37:15'),
(223, '+967779800010', '9749', '2022-07-02 07:37:54', '2022-07-02 07:37:54'),
(224, '+967779800010', '1429', '2022-07-02 07:37:58', '2022-07-02 07:37:58'),
(225, '+967779800010', '3914', '2022-07-02 07:38:36', '2022-07-02 07:38:36'),
(231, '+967030419941', '3601', '2022-07-03 18:40:07', '2022-07-03 18:40:07'),
(236, '+967772606827', '2159', '2022-07-06 21:04:57', '2022-07-06 21:04:57'),
(243, '+967774574614', '9997', '2022-07-11 21:10:51', '2022-07-11 21:10:51'),
(244, '+967774574614', '6222', '2022-07-11 21:13:17', '2022-07-11 21:13:17'),
(246, '+967777777777', '9111', '2022-07-11 21:24:10', '2022-07-11 21:24:10'),
(247, '+967771 900 0', '7391', '2022-07-11 21:26:08', '2022-07-11 21:26:08'),
(251, '+967026512206', '6343', '2022-07-16 08:46:49', '2022-07-16 08:46:49'),
(252, '+967026512206', '7012', '2022-07-16 08:47:03', '2022-07-16 08:47:03'),
(253, '+967026512206', '8647', '2022-07-16 08:47:15', '2022-07-16 08:47:15'),
(254, '+967026512206', '5129', '2022-07-16 08:47:22', '2022-07-16 08:47:22'),
(255, '+967026512206', '3844', '2022-07-16 08:47:51', '2022-07-16 08:47:51'),
(256, '+967026512206', '8325', '2022-07-16 08:49:47', '2022-07-16 08:49:47'),
(257, '+3583340463 2', '8933', '2022-07-16 09:21:02', '2022-07-16 09:21:02'),
(258, '+3583340463 2', '6930', '2022-07-16 09:21:35', '2022-07-16 09:21:35'),
(259, '+3583340463 2', '1139', '2022-07-16 09:21:46', '2022-07-16 09:21:46'),
(260, '+355-7 897603', '5143', '2022-07-16 10:03:36', '2022-07-16 10:03:36'),
(261, '+355-7 897603', '7605', '2022-07-16 10:04:05', '2022-07-16 10:04:05'),
(262, '+355-7 897603', '2314', '2022-07-16 10:04:23', '2022-07-16 10:04:23'),
(263, '+355-7 897603', '6509', '2022-07-16 10:04:37', '2022-07-16 10:04:37'),
(266, '+967701000040', '7371', '2022-07-20 00:40:45', '2022-07-20 00:40:45'),
(286, 'eng.aldhamdy@gmail.com', '1626', '2022-07-26 04:01:26', '2022-07-26 04:01:26'),
(290, '+967701000040', '5966', '2022-07-26 20:54:02', '2022-07-26 20:54:02'),
(291, '+967772659173', '2799', '2022-07-26 21:42:02', '2022-07-26 21:42:02'),
(292, '+967772659173', '1100', '2022-07-26 21:43:16', '2022-07-26 21:43:16'),
(293, '+967772659173', '6686', '2022-07-26 21:43:16', '2022-07-26 21:43:16'),
(294, '+967772659173', '3971', '2022-07-26 21:43:16', '2022-07-26 21:43:16'),
(295, '+967772659173', '5157', '2022-07-26 21:43:17', '2022-07-26 21:43:17'),
(296, '+967772659173', '2626', '2022-07-26 21:43:17', '2022-07-26 21:43:17'),
(297, '+967772659173', '4611', '2022-07-26 21:43:17', '2022-07-26 21:43:17'),
(298, '+967772659173', '5623', '2022-07-26 21:43:17', '2022-07-26 21:43:17'),
(299, '+967772659173', '4095', '2022-07-26 21:49:14', '2022-07-26 21:49:14'),
(300, '+967772659173', '2048', '2022-07-26 21:56:19', '2022-07-26 21:56:19'),
(301, '+967772659173', '2185', '2022-07-26 21:56:20', '2022-07-26 21:56:20'),
(302, '+967779824442', '2683', '2022-07-26 21:56:36', '2022-07-26 21:56:36'),
(303, '+967779824442', '6359', '2022-07-26 22:07:25', '2022-07-26 22:07:25'),
(304, '+967779824442', '1915', '2022-07-26 22:07:27', '2022-07-26 22:07:27'),
(305, '+967779824442', '8489', '2022-07-26 22:07:27', '2022-07-26 22:07:27'),
(306, '+967779824442', '7048', '2022-07-26 22:07:27', '2022-07-26 22:07:27'),
(307, '+967779824442', '7837', '2022-07-26 22:07:28', '2022-07-26 22:07:28'),
(308, '+967779824442', '1937', '2022-07-26 22:07:28', '2022-07-26 22:07:28'),
(309, '+967779824442', '3341', '2022-07-26 22:07:28', '2022-07-26 22:07:28'),
(310, '+967779824442', '5307', '2022-07-26 22:07:28', '2022-07-26 22:07:28'),
(311, '+967779824442', '1831', '2022-07-26 22:07:28', '2022-07-26 22:07:28'),
(312, '+967772088066', '5887', '2022-07-26 23:56:51', '2022-07-26 23:56:51'),
(313, '+967772088066', '1425', '2022-07-27 00:03:02', '2022-07-27 00:03:02'),
(314, '+967772088066', '3157', '2022-07-27 00:04:47', '2022-07-27 00:04:47'),
(316, '+967770779451', '8173', '2022-07-27 01:38:16', '2022-07-27 01:38:16'),
(317, '+967770779451', '1634', '2022-07-27 01:39:30', '2022-07-27 01:39:30'),
(318, '+967770779451', '5186', '2022-07-27 01:39:32', '2022-07-27 01:39:32'),
(320, '+967770779451', '3680', '2022-07-27 01:41:13', '2022-07-27 01:41:13'),
(323, '+967775451467', '5568', '2022-07-27 02:12:03', '2022-07-27 02:12:03'),
(324, '+967775451467', '1787', '2022-07-27 02:13:29', '2022-07-27 02:13:29'),
(325, '+967775451467', '6932', '2022-07-27 02:13:29', '2022-07-27 02:13:29'),
(329, '+967777785865', '9646', '2022-07-27 03:01:21', '2022-07-27 03:01:21'),
(343, '+967773560440', '3448', '2022-07-27 04:30:23', '2022-07-27 04:30:23'),
(345, '+967773988679', '1516', '2022-07-27 05:10:12', '2022-07-27 05:10:12'),
(349, '+967712222150', '7492', '2022-07-27 05:41:14', '2022-07-27 05:41:14'),
(355, '+967772014692', '7812', '2022-07-27 08:01:38', '2022-07-27 08:01:38'),
(361, '+967777737940', '3733', '2022-07-27 11:20:50', '2022-07-27 11:20:50'),
(368, '+967770022395', '2474', '2022-07-27 17:24:43', '2022-07-27 17:24:43'),
(369, '+967770022395', '4416', '2022-07-27 17:24:45', '2022-07-27 17:24:45'),
(381, '+967730140241', '9214', '2022-07-28 02:34:35', '2022-07-28 02:34:35'),
(382, '+967730140241', '8607', '2022-07-28 02:35:21', '2022-07-28 02:35:21'),
(383, '+967730140241', '9081', '2022-07-28 02:35:38', '2022-07-28 02:35:38'),
(384, '+967730140241', '3116', '2022-07-28 03:51:00', '2022-07-28 03:51:00'),
(386, '+967777794438', '2575', '2022-07-28 04:28:32', '2022-07-28 04:28:32'),
(387, '+967777794438', '1041', '2022-07-28 04:29:01', '2022-07-28 04:29:01'),
(390, '+967701000040', '1928', '2022-07-28 04:59:23', '2022-07-28 04:59:23'),
(392, '+967777913980', '5360', '2022-07-28 05:02:02', '2022-07-28 05:02:02'),
(393, '+967777913980', '1093', '2022-07-28 05:02:30', '2022-07-28 05:02:30'),
(394, '+967777913980', '6318', '2022-07-28 05:16:45', '2022-07-28 05:16:45'),
(395, '+967777913980', '7015', '2022-07-28 05:16:46', '2022-07-28 05:16:46'),
(396, '+967733058302', '9693', '2022-07-28 05:24:54', '2022-07-28 05:24:54'),
(398, '+967777913980', '2384', '2022-07-28 05:57:22', '2022-07-28 05:57:22'),
(399, '+967777913980', '7860', '2022-07-28 05:58:16', '2022-07-28 05:58:16'),
(403, '+967777913980', '6274', '2022-07-28 06:26:25', '2022-07-28 06:26:25'),
(419, '+967730140241', '3055', '2022-07-28 15:01:52', '2022-07-28 15:01:52'),
(420, '+967730140241', '6027', '2022-07-28 15:34:39', '2022-07-28 15:34:39'),
(421, '+967730140241', '7060', '2022-07-28 15:35:02', '2022-07-28 15:35:02'),
(422, '+967730140241', '9201', '2022-07-28 15:35:14', '2022-07-28 15:35:14'),
(423, '+967730140241', '1019', '2022-07-28 15:35:47', '2022-07-28 15:35:47'),
(424, '+967730140241', '7167', '2022-07-28 15:35:49', '2022-07-28 15:35:49'),
(425, '+967730140241', '9869', '2022-07-28 15:35:50', '2022-07-28 15:35:50'),
(426, '+967730140241', '1543', '2022-07-28 15:35:50', '2022-07-28 15:35:50'),
(427, '+967730140241', '9361', '2022-07-28 15:36:47', '2022-07-28 15:36:47'),
(428, '+967730140241', '7020', '2022-07-28 15:36:59', '2022-07-28 15:36:59'),
(434, '+967736314942', '6265', '2022-07-29 06:14:18', '2022-07-29 06:14:18'),
(435, '+967736314942', '2942', '2022-07-29 06:18:07', '2022-07-29 06:18:07'),
(437, '+967736314942', '3055', '2022-07-29 06:21:04', '2022-07-29 06:21:04'),
(439, '+967771577546', '5351', '2022-07-29 07:12:24', '2022-07-29 07:12:24'),
(440, '+967771577546', '7380', '2022-07-29 07:13:02', '2022-07-29 07:13:02'),
(441, '+967771577546', '5143', '2022-07-29 07:14:20', '2022-07-29 07:14:20'),
(444, '+967712172465', '4859', '2022-07-29 07:19:07', '2022-07-29 07:19:07'),
(446, '96777913201', '2520', '2022-07-31 01:24:23', '2022-07-31 01:24:23'),
(449, '+967774417012', '6095', '2022-07-31 01:29:39', '2022-07-31 01:29:39'),
(451, '+967773964066', '8737', '2022-07-31 01:47:48', '2022-07-31 01:47:48'),
(452, '+967773964066', '7600', '2022-07-31 01:48:39', '2022-07-31 01:48:39'),
(454, '+967770533838', '6188', '2022-07-31 03:47:36', '2022-07-31 03:47:36'),
(455, '+967770533838', '4413', '2022-07-31 03:49:04', '2022-07-31 03:49:04'),
(456, '+967770533838', '5473', '2022-07-31 03:49:33', '2022-07-31 03:49:33'),
(457, '+967770533838', '3342', '2022-07-31 03:51:34', '2022-07-31 03:51:34'),
(459, '+967773964066', '1189', '2022-07-31 05:07:48', '2022-07-31 05:07:48'),
(462, '+967773964066', '4198', '2022-07-31 14:14:38', '2022-07-31 14:14:38'),
(466, '+967774040775', '3167', '2022-07-31 18:47:18', '2022-07-31 18:47:18'),
(468, '+967734833361', '7189', '2022-07-31 23:20:29', '2022-07-31 23:20:29'),
(469, '+967734833361', '6239', '2022-07-31 23:22:16', '2022-07-31 23:22:16'),
(470, '+967734833361', '9965', '2022-07-31 23:22:16', '2022-07-31 23:22:16'),
(471, '+967734833361', '3258', '2022-07-31 23:22:57', '2022-07-31 23:22:57'),
(472, '+967737437906', '7785', '2022-07-31 23:24:09', '2022-07-31 23:24:09'),
(473, '+967774458061', '2861', '2022-07-31 23:52:26', '2022-07-31 23:52:26'),
(474, '+967774458061', '2101', '2022-07-31 23:55:14', '2022-07-31 23:55:14'),
(475, '+967774458061', '5562', '2022-07-31 23:55:15', '2022-07-31 23:55:15'),
(476, '+967774458061', '8833', '2022-08-01 00:11:59', '2022-08-01 00:11:59'),
(477, '+967737437906', '7390', '2022-08-01 01:19:03', '2022-08-01 01:19:03'),
(478, '+967737437906', '8332', '2022-08-01 01:19:58', '2022-08-01 01:19:58'),
(479, '+967771800017', '7832', '2022-08-01 01:55:51', '2022-08-01 01:55:51'),
(480, '+967771800017', '1069', '2022-08-01 01:57:13', '2022-08-01 01:57:13'),
(481, '+967771800017', '6587', '2022-08-01 01:57:27', '2022-08-01 01:57:27'),
(482, '+967771800017', '1967', '2022-08-01 02:00:27', '2022-08-01 02:00:27'),
(483, '+967777750550', '9085', '2022-08-01 02:01:49', '2022-08-01 02:01:49'),
(484, '+967777750550', '9253', '2022-08-01 02:03:37', '2022-08-01 02:03:37'),
(485, '+967777750550', '3890', '2022-08-01 02:04:58', '2022-08-01 02:04:58'),
(486, '+967777609376', '4899', '2022-08-01 06:03:53', '2022-08-01 06:03:53'),
(487, '+967777609376', '3222', '2022-08-01 06:04:39', '2022-08-01 06:04:39'),
(488, '+967777609376', '4447', '2022-08-01 06:04:51', '2022-08-01 06:04:51'),
(489, '+967777609376', '3179', '2022-08-01 06:05:49', '2022-08-01 06:05:49'),
(490, '+967777609376', '9238', '2022-08-01 06:06:01', '2022-08-01 06:06:01'),
(491, '+967779068092', '5705', '2022-08-01 13:31:28', '2022-08-01 13:31:28'),
(492, '+967779068092', '2355', '2022-08-01 13:35:58', '2022-08-01 13:35:58'),
(493, '+967779068092', '2533', '2022-08-01 13:36:00', '2022-08-01 13:36:00'),
(494, '+967774458061', '6853', '2022-08-01 15:14:20', '2022-08-01 15:14:20'),
(495, '+967774458061', '9705', '2022-08-01 15:17:46', '2022-08-01 15:17:46'),
(496, '+967774458061', '8934', '2022-08-01 15:25:56', '2022-08-01 15:25:56'),
(497, '+967777790484', '2700', '2022-08-01 15:49:45', '2022-08-01 15:49:45'),
(498, '+967777790484', '6158', '2022-08-01 15:50:19', '2022-08-01 15:50:19'),
(499, '+967771143771', '2118', '2022-08-01 21:20:38', '2022-08-01 21:20:38'),
(500, '+967771143771', '2368', '2022-08-01 21:21:22', '2022-08-01 21:21:22'),
(501, '+967771143771', '6708', '2022-08-01 21:21:46', '2022-08-01 21:21:46'),
(502, '+967776272554', '7050', '2022-08-01 21:24:41', '2022-08-01 21:24:41'),
(503, '+967776272554', '3328', '2022-08-01 21:26:05', '2022-08-01 21:26:05'),
(504, '+967776272554', '2151', '2022-08-01 21:26:17', '2022-08-01 21:26:17'),
(505, '+967737437906', '2056', '2022-08-01 22:29:03', '2022-08-01 22:29:03'),
(506, '+967737437906', '2112', '2022-08-01 22:31:03', '2022-08-01 22:31:03'),
(514, '+967776222279', '9031', '2022-08-02 00:26:12', '2022-08-02 00:26:12'),
(515, '+967776222279', '5963', '2022-08-02 00:28:46', '2022-08-02 00:28:46'),
(516, '+967776222279', '1283', '2022-08-02 00:33:28', '2022-08-02 00:33:28'),
(521, '+967776222279', '9741', '2022-08-02 01:01:05', '2022-08-02 01:01:05'),
(522, '+967776222279', '7947', '2022-08-02 01:02:02', '2022-08-02 01:02:02'),
(523, '+967776222279', '3179', '2022-08-02 01:03:40', '2022-08-02 01:03:40'),
(525, '967777363554', '4321', '2022-08-02 23:17:35', '2022-08-02 23:17:35'),
(526, '967777363554', '4321', '2022-08-02 23:18:51', '2022-08-02 23:18:51'),
(527, '967777363554', '4321', '2022-08-02 23:19:28', '2022-08-02 23:19:28'),
(528, '967777363554', '4321', '2022-08-02 23:20:07', '2022-08-02 23:20:07'),
(529, '967777363554', '4321', '2022-08-02 23:24:26', '2022-08-02 23:24:26'),
(530, '967777363554', '4321', '2022-08-02 23:25:43', '2022-08-02 23:25:43'),
(531, '967777363554', '4321', '2022-08-02 23:27:26', '2022-08-02 23:27:26'),
(532, '967777363554', '4321', '2022-08-02 23:28:54', '2022-08-02 23:28:54'),
(533, '967777363554', '4321', '2022-08-02 23:30:40', '2022-08-02 23:30:40'),
(534, '967777363554', '4321', '2022-08-02 23:31:02', '2022-08-02 23:31:02'),
(535, '967777363554', '4321', '2022-08-02 23:46:19', '2022-08-02 23:46:19'),
(536, '967777363554', '4321', '2022-08-02 23:46:57', '2022-08-02 23:46:57'),
(537, '967777363554', '4321', '2022-08-02 23:47:31', '2022-08-02 23:47:31'),
(538, '967777363554', '4321', '2022-08-02 23:49:22', '2022-08-02 23:49:22'),
(539, '967777363554', '4321', '2022-08-02 23:50:01', '2022-08-02 23:50:01'),
(540, '967777363554', '4321', '2022-08-02 23:50:45', '2022-08-02 23:50:45'),
(541, '967777363554', '4321', '2022-08-02 23:51:27', '2022-08-02 23:51:27'),
(542, '967777363554', '4321', '2022-08-02 23:57:36', '2022-08-02 23:57:36'),
(543, '+967779132016', '5403', '2022-08-03 00:30:50', '2022-08-03 00:30:50'),
(544, '+967779132016', '2277', '2022-08-03 00:35:15', '2022-08-03 00:35:15'),
(545, '+967779132016', '3094', '2022-08-03 00:47:02', '2022-08-03 00:47:02'),
(557, '+967773769681', '2062', '2022-08-03 04:54:37', '2022-08-03 04:54:37'),
(558, '+967773769681', '9612', '2022-08-03 04:55:11', '2022-08-03 04:55:11'),
(559, '+967773769681', '5643', '2022-08-03 04:57:19', '2022-08-03 04:57:19'),
(560, '+967773769681', '5543', '2022-08-03 04:57:29', '2022-08-03 04:57:29'),
(561, '+967773769681', '5979', '2022-08-03 04:57:31', '2022-08-03 04:57:31'),
(562, '+967773769681', '6248', '2022-08-03 04:57:34', '2022-08-03 04:57:34'),
(565, '+967777790484', '9528', '2022-08-03 22:47:47', '2022-08-03 22:47:47'),
(567, '+967770150994', '9938', '2022-08-04 03:12:06', '2022-08-04 03:12:06'),
(571, '+967737519646', '2308', '2022-08-04 04:36:52', '2022-08-04 04:36:52'),
(574, '+967776631056', '7119', '2022-08-04 06:29:47', '2022-08-04 06:29:47'),
(575, '+967779132016', '9270', '2022-08-04 06:37:07', '2022-08-04 06:37:07'),
(576, '+967779132016', '3364', '2022-08-04 07:04:38', '2022-08-04 07:04:38'),
(577, '+967779132016', '8367', '2022-08-04 07:05:15', '2022-08-04 07:05:15'),
(578, '+967779132016', '9173', '2022-08-04 07:08:55', '2022-08-04 07:08:55'),
(579, '+967779132016', '9609', '2022-08-04 07:21:51', '2022-08-04 07:21:51'),
(580, '967777363554', '4321', '2022-08-04 07:27:11', '2022-08-04 07:27:11'),
(581, '967777363554', '4321', '2022-08-04 07:29:25', '2022-08-04 07:29:25'),
(582, '967777363554', '4321', '2022-08-04 07:30:50', '2022-08-04 07:30:50'),
(583, '967777363554', '4321', '2022-08-04 07:33:13', '2022-08-04 07:33:13'),
(584, '967777363554', '4321', '2022-08-04 07:37:17', '2022-08-04 07:37:17'),
(585, '+967779132016', '7000', '2022-08-04 07:38:35', '2022-08-04 07:38:35'),
(586, '967777363554', '4321', '2022-08-04 07:39:10', '2022-08-04 07:39:10'),
(587, '967777363554', '4321', '2022-08-04 07:39:43', '2022-08-04 07:39:43'),
(588, '967777363554', '4321', '2022-08-04 07:44:02', '2022-08-04 07:44:02'),
(589, '967777363554', '4321', '2022-08-04 07:45:48', '2022-08-04 07:45:48'),
(590, '967777363554', '4321', '2022-08-04 07:48:18', '2022-08-04 07:48:18'),
(591, '967777363554', '4321', '2022-08-04 07:49:06', '2022-08-04 07:49:06'),
(592, '967777363554', '4321', '2022-08-04 07:49:42', '2022-08-04 07:49:42'),
(593, '967777363554', '4321', '2022-08-04 07:50:29', '2022-08-04 07:50:29'),
(594, '967777363554', '4321', '2022-08-04 07:50:53', '2022-08-04 07:50:53'),
(595, '967777363554', '4321', '2022-08-04 07:52:26', '2022-08-04 07:52:26'),
(596, '967777363554', '4321', '2022-08-04 07:54:11', '2022-08-04 07:54:11'),
(597, '967777363554', '4321', '2022-08-04 07:55:21', '2022-08-04 07:55:21'),
(598, '967777363554', '4321', '2022-08-04 07:55:32', '2022-08-04 07:55:32'),
(599, '967777363554', '4321', '2022-08-04 07:55:46', '2022-08-04 07:55:46'),
(600, '967777363554', '4321', '2022-08-04 07:56:35', '2022-08-04 07:56:35'),
(601, '967777363554', '4321', '2022-08-04 07:59:17', '2022-08-04 07:59:17'),
(602, '967777363554', '4321', '2022-08-04 08:17:12', '2022-08-04 08:17:12'),
(603, '967777363554', '4321', '2022-08-04 08:19:05', '2022-08-04 08:19:05'),
(604, '967777363554', '4321', '2022-08-04 08:19:54', '2022-08-04 08:19:54'),
(605, '967777363554', '4321', '2022-08-04 08:20:05', '2022-08-04 08:20:05'),
(606, '+967779132016', '4284', '2022-08-04 08:21:45', '2022-08-04 08:21:45'),
(607, '+967779132016', '3422', '2022-08-04 08:25:27', '2022-08-04 08:25:27'),
(608, '+967779132016', '2769', '2022-08-04 08:28:05', '2022-08-04 08:28:05'),
(609, '967777363554', '4321', '2022-08-04 08:29:05', '2022-08-04 08:29:05'),
(610, '+967779132016', '6838', '2022-08-04 08:31:08', '2022-08-04 08:31:08'),
(611, '967777363554', '4321', '2022-08-04 08:32:05', '2022-08-04 08:32:05'),
(612, '967777363554', '4321', '2022-08-04 08:32:56', '2022-08-04 08:32:56'),
(613, '+967779132016', '7919', '2022-08-04 08:35:14', '2022-08-04 08:35:14'),
(614, '967777363554', '4321', '2022-08-04 08:36:04', '2022-08-04 08:36:04'),
(615, '967777363554', '4321', '2022-08-04 08:37:26', '2022-08-04 08:37:26'),
(616, '967777363554', '4321', '2022-08-04 08:37:41', '2022-08-04 08:37:41'),
(617, '+967779132016', '8667', '2022-08-04 08:38:40', '2022-08-04 08:38:40'),
(618, '967777363554', '4321', '2022-08-04 08:40:20', '2022-08-04 08:40:20'),
(619, '967777363554', '4321', '2022-08-04 08:43:30', '2022-08-04 08:43:30'),
(620, '+967779132016', '9223', '2022-08-04 08:44:13', '2022-08-04 08:44:13'),
(621, '967777363554', '4321', '2022-08-04 08:44:53', '2022-08-04 08:44:53'),
(622, '+967779132016', '9614', '2022-08-04 08:44:59', '2022-08-04 08:44:59'),
(623, '967777363554', '4321', '2022-08-04 08:48:19', '2022-08-04 08:48:19'),
(624, '+967779132016', '1270', '2022-08-04 08:52:51', '2022-08-04 08:52:51'),
(625, '967777363554', '4321', '2022-08-04 09:17:46', '2022-08-04 09:17:46'),
(626, '+967774491992', '5458', '2022-08-04 10:55:19', '2022-08-04 10:55:19'),
(630, '+967735431099', '7486', '2022-08-05 02:11:12', '2022-08-05 02:11:12'),
(633, '+967770077713', '1580', '2022-08-05 07:01:52', '2022-08-05 07:01:52'),
(634, '+967770077713', '7194', '2022-08-05 07:02:22', '2022-08-05 07:02:22'),
(637, '+967733083757', '8284', '2022-08-05 23:52:51', '2022-08-05 23:52:51'),
(638, '+967733083757', '6957', '2022-08-06 00:46:52', '2022-08-06 00:46:52'),
(655, '+967777155053', '1349', '2022-08-06 07:38:19', '2022-08-06 07:38:19'),
(660, '+967772420214', '3916', '2022-08-06 22:32:07', '2022-08-06 22:32:07'),
(661, '+967772420214', '1044', '2022-08-06 22:32:23', '2022-08-06 22:32:23'),
(662, '+967772420214', '9396', '2022-08-06 22:32:46', '2022-08-06 22:32:46'),
(664, '+967772420214', '3526', '2022-08-06 22:45:35', '2022-08-06 22:45:35'),
(665, '+967779642223', '9016', '2022-08-06 23:57:11', '2022-08-06 23:57:11'),
(671, '+29732515305', '2056', '2022-08-07 04:23:18', '2022-08-07 04:23:18'),
(678, '+967777878717', '8573', '2022-08-08 08:14:23', '2022-08-08 08:14:23'),
(679, '+967777878717', '4056', '2022-08-08 08:18:28', '2022-08-08 08:18:28'),
(680, '+967777878717', '8037', '2022-08-08 08:19:14', '2022-08-08 08:19:14'),
(681, '+967777878717', '8330', '2022-08-08 08:20:25', '2022-08-08 08:20:25'),
(682, '+967777878717', '9244', '2022-08-08 08:20:59', '2022-08-08 08:20:59'),
(683, '+967777878717', '4104', '2022-08-08 08:22:07', '2022-08-08 08:22:07'),
(684, '+967779132016', '7813', '2022-08-08 09:20:39', '2022-08-08 09:20:39'),
(685, '+967779132016', '3937', '2022-08-08 09:22:23', '2022-08-08 09:22:23'),
(686, '+967779132016', '1838', '2022-08-08 09:26:13', '2022-08-08 09:26:13'),
(687, '+967779132016', '5748', '2022-08-08 09:27:00', '2022-08-08 09:27:00'),
(688, '+967779132016', '7236', '2022-08-08 09:30:08', '2022-08-08 09:30:08'),
(689, '+967779132016', '5995', '2022-08-08 09:30:41', '2022-08-08 09:30:41'),
(692, '+967779132016', '4349', '2022-08-08 21:03:21', '2022-08-08 21:03:21'),
(701, '+967776981183', '3217', '2022-08-09 13:19:10', '2022-08-09 13:19:10'),
(706, '+967779506035', '3023', '2022-08-10 00:21:39', '2022-08-10 00:21:39'),
(709, '+967770137078', '8507', '2022-08-10 02:50:10', '2022-08-10 02:50:10'),
(713, '+967772359493', '8980', '2022-08-10 03:05:06', '2022-08-10 03:05:06'),
(714, '+967778351000', '9810', '2022-08-10 03:35:25', '2022-08-10 03:35:25'),
(718, '+967777735805', '5493', '2022-08-10 07:26:17', '2022-08-10 07:26:17'),
(719, '+967777735805', '3046', '2022-08-10 07:32:02', '2022-08-10 07:32:02'),
(727, '+967774106321', '4477', '2022-08-10 17:22:47', '2022-08-10 17:22:47'),
(736, '+967774841270', '8346', '2022-08-10 22:37:04', '2022-08-10 22:37:04'),
(742, '+967775465470', '7474', '2022-08-11 03:23:47', '2022-08-11 03:23:47'),
(743, '+967775465470', '1543', '2022-08-11 03:24:36', '2022-08-11 03:24:36'),
(744, '+967775465470', '3148', '2022-08-11 03:25:00', '2022-08-11 03:25:00'),
(745, '+967775465470', '4235', '2022-08-11 03:26:52', '2022-08-11 03:26:52'),
(746, '+967775465470', '3729', '2022-08-11 03:27:16', '2022-08-11 03:27:16'),
(747, '+967738987163', '4019', '2022-08-11 07:32:14', '2022-08-11 07:32:14'),
(755, '+967772660601', '6098', '2022-08-11 23:14:03', '2022-08-11 23:14:03'),
(758, '+967776298401', '4101', '2022-08-12 00:44:02', '2022-08-12 00:44:02'),
(760, '+967770070220', '3672', '2022-08-12 03:23:11', '2022-08-12 03:23:11'),
(771, 'eeedddrrr31@gmail.com', '9571', '2022-08-13 05:23:57', '2022-08-13 05:23:57'),
(772, 'eeedddrrr314@gmail.com', '7464', '2022-08-13 05:29:01', '2022-08-13 05:29:01'),
(776, '+967777820281', '4778', '2022-08-13 23:45:17', '2022-08-13 23:45:17'),
(777, '+967777820281', '9247', '2022-08-13 23:46:47', '2022-08-13 23:46:47'),
(778, '+967777820281', '6693', '2022-08-13 23:46:54', '2022-08-13 23:46:54'),
(779, '+967777820281', '2365', '2022-08-13 23:46:55', '2022-08-13 23:46:55'),
(781, '+967774999174', '2644', '2022-08-14 05:53:49', '2022-08-14 05:53:49'),
(784, '+967738449903', '9109', '2022-08-14 14:14:44', '2022-08-14 14:14:44'),
(785, '+967711594324', '8415', '2022-08-14 16:24:21', '2022-08-14 16:24:21'),
(786, '+967711594324', '4155', '2022-08-14 16:25:03', '2022-08-14 16:25:03'),
(787, '+967711594324', '1872', '2022-08-14 17:42:01', '2022-08-14 17:42:01'),
(788, '+967777963614', '3299', '2022-08-15 00:00:32', '2022-08-15 00:00:32'),
(789, '+967777963614', '5060', '2022-08-15 00:01:01', '2022-08-15 00:01:01'),
(790, '+967777963614', '5247', '2022-08-15 00:01:02', '2022-08-15 00:01:02'),
(791, '+967777963614', '9351', '2022-08-15 00:01:30', '2022-08-15 00:01:30'),
(792, '+967777963614', '6272', '2022-08-15 00:02:09', '2022-08-15 00:02:09'),
(793, '+967777963614', '7893', '2022-08-15 00:02:09', '2022-08-15 00:02:09'),
(794, '+967777963614', '7233', '2022-08-15 00:02:45', '2022-08-15 00:02:45'),
(795, '+967777963614', '2144', '2022-08-15 00:04:32', '2022-08-15 00:04:32'),
(796, '+967777963614', '8583', '2022-08-15 00:05:52', '2022-08-15 00:05:52'),
(797, '+967777963614', '3322', '2022-08-15 00:06:25', '2022-08-15 00:06:25'),
(798, '+967777963614', '2953', '2022-08-15 00:06:47', '2022-08-15 00:06:47'),
(800, '+967777963614', '3025', '2022-08-15 00:08:48', '2022-08-15 00:08:48'),
(801, '+967777963614', '7396', '2022-08-15 00:09:00', '2022-08-15 00:09:00'),
(805, '+967772263333', '5688', '2022-08-15 02:16:46', '2022-08-15 02:16:46'),
(813, '+967775409842', '9492', '2022-08-15 07:46:50', '2022-08-15 07:46:50'),
(814, '+967775409842', '4379', '2022-08-15 07:47:26', '2022-08-15 07:47:26'),
(815, '+967775409842', '4933', '2022-08-15 07:49:01', '2022-08-15 07:49:01'),
(816, '+967775409842', '2259', '2022-08-15 07:58:25', '2022-08-15 07:58:25'),
(817, 'mralaalhaj2@gmail.com', '4659', '2022-08-15 13:24:32', '2022-08-15 13:24:32'),
(818, 'mralaalhaj2@gmail.com', '2243', '2022-08-15 14:33:38', '2022-08-15 14:33:38'),
(821, '+967773816882', '6848', '2022-08-15 19:27:50', '2022-08-15 19:27:50'),
(822, '+967775409842', '5604', '2022-08-15 20:44:43', '2022-08-15 20:44:43'),
(823, '+967775409842', '6078', '2022-08-15 20:57:29', '2022-08-15 20:57:29'),
(832, '+967777794438', '5579', '2022-08-17 02:40:42', '2022-08-17 02:40:42'),
(845, '+967776120963', '7013', '2022-08-17 07:21:38', '2022-08-17 07:21:38'),
(846, '+967776120963', '5377', '2022-08-17 07:23:06', '2022-08-17 07:23:06'),
(849, '+967776120963', '6027', '2022-08-17 11:53:49', '2022-08-17 11:53:49'),
(851, '+967777363554', '4321', '2022-08-17 15:04:53', '2022-08-17 15:04:53'),
(852, '+967777363554', '4321', '2022-08-17 15:05:51', '2022-08-17 15:05:51'),
(856, '+967701000040', '6153', '2022-08-17 23:27:32', '2022-08-17 23:27:32'),
(857, '+967701000040', '3874', '2022-08-17 23:28:30', '2022-08-17 23:28:30'),
(858, '+967701000040', '7647', '2022-08-17 23:28:51', '2022-08-17 23:28:51'),
(860, '+967777363554', '4321', '2022-08-17 23:47:25', '2022-08-17 23:47:25'),
(861, '+967777363554', '4321', '2022-08-17 23:51:03', '2022-08-17 23:51:03'),
(862, '+967777363554', '4321', '2022-08-17 23:55:04', '2022-08-17 23:55:04'),
(863, '+967777363554', '4321', '2022-08-18 00:19:13', '2022-08-18 00:19:13'),
(864, '+967777363554', '4321', '2022-08-18 03:28:31', '2022-08-18 03:28:31'),
(865, '+967777363554', '4321', '2022-08-18 03:29:13', '2022-08-18 03:29:13'),
(866, '+967777363554', '4321', '2022-08-18 03:32:39', '2022-08-18 03:32:39'),
(867, '+967777363554', '4321', '2022-08-18 03:33:24', '2022-08-18 03:33:24'),
(868, '+967777363554', '4321', '2022-08-18 03:34:16', '2022-08-18 03:34:16'),
(869, '+967777363554', '4321', '2022-08-18 03:34:49', '2022-08-18 03:34:49'),
(870, '+967777363554', '4321', '2022-08-18 03:35:37', '2022-08-18 03:35:37'),
(873, '+967777363554', '4321', '2022-08-19 01:56:17', '2022-08-19 01:56:17'),
(876, '+967775165304', '9303', '2022-08-19 05:40:24', '2022-08-19 05:40:24'),
(883, '+967714040704', '5776', '2022-08-19 19:18:14', '2022-08-19 19:18:14'),
(885, '+967777750550', '5036', '2022-08-19 22:08:55', '2022-08-19 22:08:55'),
(886, '+967771701416', '1346', '2022-08-20 02:25:05', '2022-08-20 02:25:05'),
(887, '+967771666799', '4906', '2022-08-20 02:46:42', '2022-08-20 02:46:42'),
(891, '+967770616146', '4616', '2022-08-20 05:35:07', '2022-08-20 05:35:07'),
(893, '+967770616146', '4779', '2022-08-20 05:36:22', '2022-08-20 05:36:22'),
(895, '+967773034701', '5163', '2022-08-21 14:26:17', '2022-08-21 14:26:17'),
(897, '+967775537146', '6068', '2022-08-21 18:44:40', '2022-08-21 18:44:40'),
(898, '+967775537146', '8039', '2022-08-21 18:45:20', '2022-08-21 18:45:20'),
(900, '+967734166499', '6932', '2022-08-23 21:51:37', '2022-08-23 21:51:37'),
(901, '+967734166499', '6851', '2022-08-23 21:52:25', '2022-08-23 21:52:25'),
(903, '+967734166499', '7576', '2022-08-23 21:54:47', '2022-08-23 21:54:47'),
(907, '+967701000040', '6100', '2022-08-24 21:58:31', '2022-08-24 21:58:31'),
(910, '+967778955553', '4255', '2022-08-25 06:31:13', '2022-08-25 06:31:13'),
(915, '+967٧٧٥٧٢٠٧٤٩', '3858', '2022-08-25 20:53:25', '2022-08-25 20:53:25'),
(916, '+967٧٧٥٧٢٠٧٤٩', '3257', '2022-08-25 20:55:26', '2022-08-25 20:55:26'),
(917, '+967٧٧٥٧٢٠٧٤٩', '2010', '2022-08-25 20:55:57', '2022-08-25 20:55:57'),
(919, '+967٧٧٥٧٢٠٧٤٩', '7742', '2022-08-25 21:01:24', '2022-08-25 21:01:24'),
(923, 'eeedddrrr77431@gmail.com', '3630', '2022-08-27 01:33:34', '2022-08-27 01:33:34'),
(924, 'eeedddrrr77431@gmail.com', '2863', '2022-08-27 01:34:27', '2022-08-27 01:34:27'),
(928, '+967777363554', '4321', '2022-08-27 21:08:27', '2022-08-27 21:08:27'),
(932, '+967773735076', '4362', '2022-08-28 19:14:36', '2022-08-28 19:14:36'),
(933, '+967773735076', '9527', '2022-08-28 19:19:19', '2022-08-28 19:19:19'),
(937, '+967777820281', '3198', '2022-08-29 18:54:39', '2022-08-29 18:54:39'),
(939, '+967776800827', '4739', '2022-08-29 23:53:18', '2022-08-29 23:53:18'),
(940, '+967776800827', '1451', '2022-08-29 23:53:46', '2022-08-29 23:53:46'),
(943, '+967770290260', '3925', '2022-08-31 21:59:54', '2022-08-31 21:59:54'),
(944, '+967770290260', '9208', '2022-08-31 22:00:38', '2022-08-31 22:00:38'),
(945, '+967770290260', '9432', '2022-08-31 22:01:43', '2022-08-31 22:01:43'),
(946, '+967770290260', '3832', '2022-08-31 22:08:01', '2022-08-31 22:08:01'),
(948, '+967776176485', '6831', '2022-09-01 17:18:49', '2022-09-01 17:18:49'),
(949, '+967737877273', '7940', '2022-09-01 20:54:47', '2022-09-01 20:54:47'),
(950, '+967775534147', '3029', '2022-09-01 20:57:31', '2022-09-01 20:57:31'),
(951, '+967737877273', '5166', '2022-09-01 21:01:35', '2022-09-01 21:01:35'),
(952, '+967775534147', '2247', '2022-09-01 21:05:49', '2022-09-01 21:05:49'),
(953, '+967779937588', '1547', '2022-09-01 22:07:04', '2022-09-01 22:07:04'),
(963, '+967777363554', '4321', '2022-09-02 03:26:56', '2022-09-02 03:26:56'),
(964, '+967777363554', '4321', '2022-09-02 03:27:11', '2022-09-02 03:27:11'),
(965, '+967777363554', '4321', '2022-09-02 03:27:39', '2022-09-02 03:27:39'),
(966, '+967777363554', '4321', '2022-09-02 03:27:50', '2022-09-02 03:27:50'),
(967, '+967777363554', '4321', '2022-09-02 03:27:54', '2022-09-02 03:27:54'),
(968, '+967777363554', '4321', '2022-09-02 03:28:36', '2022-09-02 03:28:36'),
(978, '+967777363554', '4321', '2022-09-02 18:47:29', '2022-09-02 18:47:29'),
(979, '+967777363554', '4321', '2022-09-02 18:48:10', '2022-09-02 18:48:10'),
(980, '+967777363554', '4321', '2022-09-02 18:49:09', '2022-09-02 18:49:09'),
(981, '+967777363554', '4321', '2022-09-02 18:50:00', '2022-09-02 18:50:00'),
(983, '+967737888011', '4897', '2022-09-02 21:21:35', '2022-09-02 21:21:35'),
(984, '+967711765657', '6020', '2022-09-02 23:09:02', '2022-09-02 23:09:02'),
(986, '+967771009604', '8210', '2022-09-03 01:43:31', '2022-09-03 01:43:31'),
(987, '+967771009604', '3219', '2022-09-03 01:44:05', '2022-09-03 01:44:05'),
(988, '+967771009604', '3147', '2022-09-03 01:45:18', '2022-09-03 01:45:18'),
(990, '+967771009604', '8409', '2022-09-03 02:20:54', '2022-09-03 02:20:54'),
(992, '+967774408222', '9507', '2022-09-03 03:23:11', '2022-09-03 03:23:11'),
(993, '+967774408222', '6175', '2022-09-03 03:26:27', '2022-09-03 03:26:27'),
(995, '+967776176485', '9672', '2022-09-03 04:43:06', '2022-09-03 04:43:06'),
(996, '+967773777986', '8036', '2022-09-03 05:46:21', '2022-09-03 05:46:21'),
(997, '+967773777986', '8601', '2022-09-03 05:47:28', '2022-09-03 05:47:28'),
(1001, '+1649770798664', '8630', '2022-09-03 11:16:53', '2022-09-03 11:16:53'),
(1002, '+967770798664', '7368', '2022-09-03 11:18:13', '2022-09-03 11:18:13'),
(1007, '+967777363554', '4321', '2022-09-03 19:18:56', '2022-09-03 19:18:56'),
(1008, '+967777363554', '4321', '2022-09-03 19:19:29', '2022-09-03 19:19:29'),
(1009, '+967777363554', '4321', '2022-09-03 19:19:45', '2022-09-03 19:19:45'),
(1010, '+967777363554', '4321', '2022-09-03 19:20:05', '2022-09-03 19:20:05'),
(1011, '+967777363554', '4321', '2022-09-03 19:20:24', '2022-09-03 19:20:24'),
(1012, '+967777363554', '4321', '2022-09-03 19:20:54', '2022-09-03 19:20:54'),
(1013, '+967777363554', '4321', '2022-09-03 19:21:11', '2022-09-03 19:21:11'),
(1014, '+967777363554', '4321', '2022-09-03 19:21:30', '2022-09-03 19:21:30'),
(1015, '+967777363554', '4321', '2022-09-03 19:21:49', '2022-09-03 19:21:49'),
(1016, '+93777363554', '5054', '2022-09-03 19:22:09', '2022-09-03 19:22:09'),
(1017, '+967775212129', '5655', '2022-09-04 00:30:28', '2022-09-04 00:30:28'),
(1018, '+967775212129', '2395', '2022-09-04 00:31:05', '2022-09-04 00:31:05'),
(1020, '+967778443216', '9682', '2022-09-04 02:01:01', '2022-09-04 02:01:01'),
(1028, '+20011166892', '6689', '2022-09-06 21:03:03', '2022-09-06 21:03:03'),
(1029, '+20116689295', '1524', '2022-09-06 21:03:45', '2022-09-06 21:03:45'),
(1030, '+20116689295', '6087', '2022-09-06 21:04:38', '2022-09-06 21:04:38'),
(1037, '+967701000040', '6002', '2022-09-08 23:32:32', '2022-09-08 23:32:32'),
(1038, '+967701000040', '8294', '2022-09-08 23:33:18', '2022-09-08 23:33:18'),
(1039, '+967778900010', '2377', '2022-09-08 23:36:26', '2022-09-08 23:36:26'),
(1049, '+967776843535', '9664', '2022-09-21 03:45:27', '2022-09-21 03:45:27'),
(1053, '+967775901115', '9545', '2022-09-27 17:30:55', '2022-09-27 17:30:55'),
(1054, '+967772266777', '6707', '2022-09-28 15:49:16', '2022-09-28 15:49:16'),
(1055, '+967777363554', '4321', '2022-10-05 11:43:21', '2022-10-05 11:43:21'),
(1056, '+967777363554', '4321', '2022-10-05 11:44:59', '2022-10-05 11:44:59'),
(1059, '+20111635907', '5961', '2022-10-11 21:03:32', '2022-10-11 21:03:32'),
(1061, '+20109114216', '1392', '2022-10-12 15:55:22', '2022-10-12 15:55:22'),
(1062, '+20109114161', '2023', '2022-10-12 19:08:09', '2022-10-12 19:08:09'),
(1063, '+201091142161', '3860', '2022-10-12 19:14:59', '2022-10-12 19:14:59'),
(1065, '+201118522180', '3565', '2022-10-12 19:17:26', '2022-10-12 19:17:26'),
(1066, '+9671118522180', '9710', '2022-10-12 19:40:34', '2022-10-12 19:40:34'),
(1068, '+201118522180', '4454', '2022-10-12 19:42:44', '2022-10-12 19:42:44'),
(1075, '+967058869999', '5406', '2022-10-12 22:30:22', '2022-10-12 22:30:22'),
(1077, '+967777363554', '4321', '2022-10-12 23:07:40', '2022-10-12 23:07:40'),
(1079, '+9671118522180', '9517', '2022-10-12 23:35:14', '2022-10-12 23:35:14'),
(1087, '+967858845565', '4307', '2022-10-13 13:55:32', '2022-10-13 13:55:32'),
(1090, '+9671118522180', '4152', '2022-10-13 15:10:18', '2022-10-13 15:10:18'),
(1091, '+201116359075', '3914', '2022-10-13 15:10:55', '2022-10-13 15:10:55'),
(1096, '+967713515255', '1990', '2022-10-13 23:36:46', '2022-10-13 23:36:46'),
(1098, '+967771277728', '3020', '2022-10-15 08:42:28', '2022-10-15 08:42:28'),
(1102, '+967096808453', '8410', '2022-10-15 21:22:46', '2022-10-15 21:22:46'),
(1103, '+9671116359075', '7370', '2022-10-16 04:16:00', '2022-10-16 04:16:00'),
(1105, '+201552606425', '9102', '2022-10-16 04:20:29', '2022-10-16 04:20:29'),
(1109, '+967010902855', '9341', '2022-10-18 02:27:29', '2022-10-18 02:27:29'),
(1110, '+20111197134', '5700', '2022-10-18 16:47:34', '2022-10-18 16:47:34'),
(1111, '+20111971342', '6437', '2022-10-18 16:48:25', '2022-10-18 16:48:25'),
(1112, '+9671118522180', '9635', '2022-10-18 18:30:41', '2022-10-18 18:30:41'),
(1114, '+20225328776', '6277', '2022-10-18 18:37:54', '2022-10-18 18:37:54'),
(1115, '+967225328776', '4610', '2022-10-18 18:45:01', '2022-10-18 18:45:01'),
(1117, '+967225328776', '7084', '2022-10-18 22:24:59', '2022-10-18 22:24:59'),
(1126, '+201118522180', '8157', '2022-10-19 05:12:49', '2022-10-19 05:12:49'),
(1128, '+201118522180', '9244', '2022-10-19 19:03:11', '2022-10-19 19:03:11'),
(1131, '+9671552606428', '9901', '2022-10-20 01:00:58', '2022-10-20 01:00:58'),
(1132, '+201552606428', '5111', '2022-10-20 01:01:47', '2022-10-20 01:01:47'),
(1144, '+20069011344', '7681', '2022-10-23 12:32:06', '2022-10-23 12:32:06'),
(1145, '+20069011344', '6441', '2022-10-23 12:32:42', '2022-10-23 12:32:42'),
(1146, '+20106901134', '4983', '2022-10-23 12:34:06', '2022-10-23 12:34:06'),
(1147, '+967225328776', '6304', '2022-10-23 21:07:40', '2022-10-23 21:07:40'),
(1152, 'khaled@gmail.com', '6528', '2022-10-30 07:25:06', '2022-10-30 07:25:06'),
(1153, 'khaled@gmail.com', '5034', '2022-10-30 07:27:06', '2022-10-30 07:27:06'),
(1154, 'khaled2020@gmail.com', '4466', '2022-11-22 12:38:01', '2022-11-22 12:38:01'),
(1155, 'khaled2025@gmail.com', '8142', '2022-12-28 05:47:13', '2022-12-28 05:47:13'),
(1156, NULL, '1286', '2023-01-03 07:05:51', '2023-01-03 07:05:51'),
(1157, '0124663326', '2723', '2023-01-03 07:48:28', '2023-01-03 07:48:28'),
(1158, '0124663326', '8584', '2023-01-03 07:50:05', '2023-01-03 07:50:05'),
(1159, 'khaled2020@gmail.com', '2577', '2023-01-12 21:08:51', '2023-01-12 21:08:51'),
(1160, 'khaled2020@gmail.com', '1812', '2023-01-13 00:59:37', '2023-01-13 00:59:37'),
(1161, 'khaled2020@gmail.com', '8709', '2023-01-13 01:06:16', '2023-01-13 01:06:16'),
(1162, '0124663326', '7283', '2023-01-13 22:50:24', '2023-01-13 22:50:24'),
(1163, '0124663326', '1480', '2023-01-13 22:51:23', '2023-01-13 22:51:23'),
(1164, '0124663326', '9655', '2023-01-13 22:52:39', '2023-01-13 22:52:39'),
(1165, '0124663326', '9248', '2023-01-13 22:53:34', '2023-01-13 22:53:34'),
(1166, '0124663326', '7728', '2023-01-13 22:54:03', '2023-01-13 22:54:03'),
(1167, '0124663326', '3363', '2023-01-13 22:56:34', '2023-01-13 22:56:34');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `child_seller_id` bigint(11) DEFAULT 0,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'الاصلي',
  `product_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carton_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multi_unit_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `sub_category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_sub_category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_numbers` double DEFAULT 1,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `images` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_deal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_provider` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0.00',
  `discount_percent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_start` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_end` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_start` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_end` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_stock` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `status_branch` tinyint(1) NOT NULL DEFAULT 0,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `branche_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deferred` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commissions_min_delivery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commissions_delivery_percent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_commissions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_qty_sales_commissions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `child_seller_id`, `sku`, `name`, `slug`, `product_type`, `product_size`, `carton_unit`, `multi_unit_price`, `category_ids`, `brand_id`, `sub_category_id`, `sub_sub_category_id`, `unit`, `unit_numbers`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_percent`, `discount_type`, `discount_start`, `discount_end`, `offer_price`, `offer_start`, `offer_end`, `current_stock`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `status_branch`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `branche_id`, `address_longitude`, `address_latitude`, `deferred`, `commissions_min_delivery`, `commissions_delivery_percent`, `sales_commissions`, `min_qty_sales_commissions`, `payment_in`) VALUES
(9, 'seller', 57, 57, '1750517783903872', 'حليب بالموز', '', 'كامل الدسم', NULL, '12', '{\"from_qty\":\"100\",\"to_qty\":\"200\",\"unit_price\":\"1000\",\"purchase_price\":\"500\"}', '14', 5, '16', '8', 'غرام', 1000, 1, 1, '1669423850.jpg', '1669423850.jpg', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1000, 500, '0', NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '80', NULL, 0, NULL, '2022-11-26 11:50:50', '2023-01-18 21:36:15', 1, 0, 1, NULL, NULL, NULL, 0, NULL, 5.00, NULL, NULL, NULL, '6', '46.8184', '24.7504', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'seller', 57, 57, '1750784038509055', 'عصير تفاح', 'aasyr-tfah', 'بنكهة التفاح', NULL, '56', NULL, '14', 7, '23', NULL, 'حبة', 165, 1, 1, '1669677042.jpg', '1669677042.jpg', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 100, 60, '0.00', NULL, '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '70', NULL, 0, NULL, '2022-11-29 10:22:51', '2022-12-27 09:30:36', 1, 0, 1, NULL, NULL, NULL, 0, NULL, 5.00, NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'seller', 85, NULL, '1751315661703557', 'حليب بالفراولة', 'hlyb-balfraol', 'بالفرولة', NULL, '50', NULL, '15', 5, '16', '10', 'حبة', 1, 1, 1, '1673018106.jpg', '1673018106.jpg', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 100, 65, '10', NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '45', NULL, 0, NULL, '2022-12-05 07:12:46', '2023-01-07 02:15:06', 1, 0, 1, NULL, NULL, NULL, 0, NULL, 5.00, NULL, NULL, NULL, '97', '46.8184', '24.7504', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'seller', 57, 0, '5624892163c851aa54eaa', 'عصير تفاح', 'aasyr-tfah', 'الاصلي', NULL, NULL, NULL, '14', 7, NULL, NULL, 'حبة', 165, 1, 1, '1669677042.jpg', '1669677042.jpg', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 100, 500, '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '70', NULL, 0, NULL, '2023-01-18 21:08:10', '2023-01-18 21:08:10', 1, 0, 1, NULL, NULL, NULL, 0, NULL, 5.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'seller', 57, 0, '70867515963c851ac9ec5b', 'عصير تفاح', 'aasyr-tfah', 'الاصلي', NULL, NULL, NULL, '14', 7, NULL, NULL, 'حبة', 165, 1, 1, '1669677042.jpg', '1669677042.jpg', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 100, 500, '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '70', NULL, 0, NULL, '2023-01-18 21:08:12', '2023-01-18 21:08:12', 1, 0, 1, NULL, NULL, NULL, 0, NULL, 5.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejected_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `comment`, `attachment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 12, 354, 'good', NULL, 5, 1, '2022-12-23 17:27:07', NULL),
(2, 11, 354, 'good', NULL, 5, 1, '2022-12-23 17:28:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sale_typs`
--

CREATE TABLE `sale_typs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `featured` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_parent` bigint(20) DEFAULT 0,
  `f_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whats` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `places` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regiseration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regist_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `seller_parent`, `f_name`, `l_name`, `brand_id`, `phone`, `image`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `sales_commission_percentage`, `gst`, `cm_firebase_token`, `pos_status`, `position`, `whats`, `company_name_en`, `company_name_ar`, `company_type`, `country`, `city_id`, `places`, `regiseration_number`, `start_date`, `end_date`, `regist_image`, `categories`) VALUES
(11, 0, 'qader', 'food', NULL, '773333836', '2022-06-16-62ab88c5ab944.png', 'info@qadergroup.com', '$2y$10$.D.mEUgnN.E1HsidX9eUvePSxVu1X1oZgCsBlXge6pgtlJzIczxcW', 'approved', 'q5gtWrx39F2DCAN2mnoJmgxjflw27F1e8ewsC4SpzOKOb6r4IVuqoWAk5rpZ', '2022-06-17 02:47:17', '2022-06-17 02:47:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(12, 0, 'السنحاني', 'للتجارة', NULL, '775626237', 'def.png', 'mohmmedshif@gmail.com', '$2y$10$rwt4GLyxxSTp9B8fpQ299eSuNGPHTOWgj7R3C3f1W5ggF3zju63bW', 'approved', NULL, '2022-07-16 22:12:12', '2022-07-16 22:12:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(13, 0, 'شركة الروضة للتجارة', 'العامة والتوكيلات', NULL, '772233447', '2022-08-04-62ebe4ee8c43c.png', 'info@alrawdahco.com', '$2y$10$1/mj9gRXqppTdFgVV0v5FuQSIbt6XindXXMFwPCVRU/OSmvBAuUQW', 'approved', NULL, '2022-07-18 01:22:36', '2022-08-04 22:25:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(14, 0, 'حفظ الله حسن', 'للتجارة والإستيراد', NULL, '773772222', '2022-07-17-62d4572d1d86c.png', 'asem@hhbyemen.com', '$2y$10$THMchc0q/vtX0NDfMb1Ro.dtXXyxDlVt4QoBZhRm9kxlgH1PZsd6K', 'approved', NULL, '2022-07-18 01:38:37', '2022-07-18 01:38:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(15, 0, 'شركة درهم للصناعات المحدودة', '(ديكو)', NULL, '73311074', '2022-08-01-62e8048cbfd47.png', 'dico@dico-ye.com', '$2y$10$e4jTG8QWeKAiOU/Ul/U7GuntII1zqC6w5mBVV3dFFtD4iidrc7KGO', 'approved', NULL, '2022-07-20 21:03:43', '2022-08-01 23:51:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(16, 0, 'محلات محمد محمد', 'المرح', NULL, '771500090', '2022-08-04-62ebfb5523516.png', 'mohmmedalmarah@gmail.com', '$2y$10$wm1x/fqtxeniSvpbPNpPOeRkaKWtENXEn.4INMcGAyuxbf6K0pSaK', 'approved', NULL, '2022-07-23 21:00:26', '2022-08-05 00:01:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(17, 0, 'شركة الفجيحي للتجارة و التموين', 'المحدودة', NULL, '771944970', '2022-07-23-62dc46521424b.png', 'alfajahico@gmail.com', '$2y$10$EMhE2R8QOIjaKi1DqNtDX.Q1bhxjoCumPrdjdVp361vnGAdRqMpuK', 'approved', NULL, '2022-07-23 22:13:16', '2022-07-24 02:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(18, 0, 'موسسة الغراسي', 'للتجارة', NULL, '1683179', '2022-07-26-62e01e2ce286a.png', 'info@algharasi.com', '$2y$10$gsVB4l9zmxeJG.Sv68Q3Z.iaYdBbais.OrkY1Oq2YC7fKx60pMT5q', 'approved', NULL, '2022-07-27 00:02:37', '2022-07-27 00:02:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(19, 0, 'شركة جلب اخوان', 'للتجارة', NULL, '773333033', 'def.png', 'salah.jalap@gmail.com', '$2y$10$AQgVXxEKhcT3SFz3Vhq3p.Z7XMMsFYTXMiEJF0SMO/xJJAh/aZj3G', 'approved', NULL, '2022-07-28 02:18:12', '2022-07-28 02:18:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(20, 0, 'مجموعة شركات إخوان', 'ثابت', NULL, '779300340', '2022-07-28-62e28c2f9456f.png', 'info@yemany.com', '$2y$10$uA1l1YEeglzz/ZbcvfrIzOpL0Z0SaUrI1ylwrd5jPHHD12dSXD1Ii', 'approved', NULL, '2022-07-28 20:16:31', '2022-07-28 20:16:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(21, 0, 'الحبيشي لاستيرادوتسويق', 'الاغذية', NULL, '1234567', 'def.png', 'alnor@yemen.net.ye', '$2y$10$KxxQrTjJhUs8YwvONycsdO5FbBiNUm7AkJQA.N.biBwcjTzAHwClu', 'approved', NULL, '2022-07-28 21:09:06', '2022-07-28 21:09:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(22, 0, 'بيتي فود-شركة', 'الخولاني', NULL, '774111466', 'def.png', 'info@alkholany.com', '$2y$10$51Bz7Ks8jpjgk0g0NS1UJ.QaxHZ015qy9xI5CCsCjor6fxe4y8PdS', 'approved', NULL, '2022-07-28 21:13:42', '2022-07-28 21:13:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(23, 0, 'الشركة اليمنية لصناعة الاغذيه', 'الخفيفه', NULL, '770000506', '2022-07-28-62e29a62b26f8.png', 'info.ysf@elaghil.com', '$2y$10$EEPJ8HK0pyjlbmizQ9dpj.XYoY2B5W2DmHQhsyht4tGwe5Nkh8FFe', 'approved', NULL, '2022-07-28 21:17:06', '2022-12-09 08:38:41', NULL, NULL, NULL, NULL, 'BiBM8pvSAaysUyLOysqF85olXouOw7IK0cHHEhGr3r0oJehAwFoRZp6H7s4aF4tU7doVPfEauDLZfCkf', NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(24, 0, 'شركة شارب للتجارة', 'والتسويق', NULL, '1450930', '2022-07-28-62e29d10bb274.png', 'mail@sharebbrothers.com', '$2y$10$0VLKn/paqZ5OUEXsvwddfOhYptaIrNhnDnZi2nL/8ZRaGpn7n9qDe', 'approved', NULL, '2022-07-28 21:28:32', '2022-07-28 21:28:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(25, 0, 'مجموعة شركات هائل سعيد', 'انعم', NULL, '42434001', '2022-07-28-62e2a0895f509.png', 'Info@hsayemen.com', '$2y$10$8wwv9FsvznJygnYTkGhrNuqJw6upcsCBBqRRZKCPY3kbpFFGy88LO', 'approved', NULL, '2022-07-28 21:43:21', '2022-07-28 21:43:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(26, 0, 'شركة المنتاب اخوان للتجارة', 'المحدودة', NULL, '776036666', '2022-07-28-62e2cc12d977a.png', 'al-montab@hotmail.com', '$2y$10$RWIiAhLUo0.KKBlY6/tFS.xZYFC4GXy9ymXfAJngv8Ofy1I7NuAO.', 'approved', NULL, '2022-07-29 00:49:07', '2022-07-29 00:49:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(27, 0, 'شركة بن عوض', 'النقيب', NULL, '77966661', '2022-07-30-62e53b19409aa.png', 'info@alnaqeeb.com', '$2y$10$n.saFic0xw1/Rcl2TyXaIe5mHzXgPIIHGOK6tp5eemJ1mb8ZOWuu6', 'approved', NULL, '2022-07-30 21:07:21', '2022-07-30 21:07:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(28, 0, 'حيدر الجعدي للتجارة', 'والاستيراد', NULL, '01222963', '2022-07-30-62e57bc60c17a.png', 'hadderalgaday@gmail.com', '$2y$10$gmoVjbAbq8vf4xrN6QF9COE3txXaR8S0yI/dpFzF98qUycwUzwpy2', 'approved', NULL, '2022-07-31 01:43:18', '2022-07-31 01:43:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(29, 0, 'شركة المجهلي للتجارة', 'المحدودة', NULL, '123456', '2022-08-01-62e809810c79f.png', 'info@almaghali.com', '$2y$10$Twq8vdPCD4ORC44sO1SktOWCnNpUoMLYu9H9AWRrQdQ3evE6lof36', 'approved', NULL, '2022-08-02 00:09:57', '2022-08-02 00:12:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(30, 0, 'شركة الصناعات المتنوعة ومواد ا', 'التعبئة', NULL, '4218027', '2022-08-01-62e83776e13cd.png', 'crm@genpackhsa.com', '$2y$10$8cvJtDqBDarkxFFXw838Oe3B9thup9bZN./EbVGPdwONsFwejL6ze', 'approved', NULL, '2022-08-02 03:28:38', '2022-08-02 03:28:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(31, 0, 'سايكو - sico', 'sico', NULL, '777259089', '2022-08-02-62e92ad11d0b7.png', 'sico.gtm@gmail.com', '$2y$10$u/QN.WeXX2ELleTfyndYQOc3VNLnJaNONld7xgJnOG/2gNqLq/1Pa', 'approved', NULL, '2022-08-02 20:46:57', '2022-08-02 20:46:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(32, 0, 'الجوزي للتجارة العامة', 'العامة', NULL, '771014411', '2022-08-03-62ea80c5c75f8.png', 'info@algawzi.com', '$2y$10$Nqr8kQdm20wVmknmF2RYiengRvaetCZ331xyfQr7FZW4dyqUPDBSm', 'approved', '0QjzWq9XvGosAMVr6zQ2q0ucqf8cjbPTeX7CDHMLzjuC2QXENPjagwEzd67P', '2022-08-03 21:05:57', '2022-08-03 21:05:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(33, 0, 'مؤسسة الرجوي للتجارة العامة', 'العامة', NULL, '10255358', '2022-08-04-62ebff64aa54a.png', 'info@alragawi.org', '$2y$10$rh2gQNf1HSW13XKHxAX/iuRciUg6xwwsolge3B5fbxR65xKQ.qc1C', 'approved', NULL, '2022-08-05 00:18:28', '2022-08-05 00:18:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(34, 0, 'محمد عبدالوهاب الزبيري و اخيه', 'اخيه', NULL, '240698', '2022-08-06-62ee6f6fc8a04.png', 'info@alzubairi.com', '$2y$10$BL/xSfORZC/nHRhWLL/GguQonC8PIW/kQxD2rZFCuYjNtSIdIH3ye', 'approved', NULL, '2022-08-06 20:41:03', '2022-08-06 20:41:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(35, 0, 'جو برايم - Go Prime', 'Go', NULL, '779888816', '2022-08-06-62ee894781fc7.png', 'info@goprime.co', '$2y$10$ZHD4Ot.bVjl4.3H/ojy0Q.3v4RaNeQPp8ZT5ALO1gVJyrKvFgNv1e', 'approved', NULL, '2022-08-06 22:31:19', '2022-08-06 22:31:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(36, 0, 'مجموعة الكبوس', 'الكبوس', NULL, '270800', '2022-08-07-62efeca30a7b7.png', 'info@alkbousgroup.com', '$2y$10$KBf80NTH79G3hjJLqUTTter7d0OQQiOXyFhNVB491r/VRPQsM7Vmq', 'approved', NULL, '2022-08-07 23:47:31', '2022-08-07 23:47:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(37, 0, 'شركة بن ربيع التجارية', 'التجارية', NULL, '771222745', 'def.png', 'info@binrabie.com', '$2y$10$nkDg6TyGlEKNoSnJe0SKue.xU3epOub.AU5fr/gHWUUg1VHe9cztC', 'approved', NULL, '2022-08-08 07:59:06', '2022-08-08 07:59:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(38, 0, 'A&M Dent', 'Dent', NULL, '779400661', '2022-08-08-62f12c68aebaa.png', 'saheltrading.est@gmail.com', '$2y$10$9rk6/CybFbrXOqZV2B9JF.kMJblYuJQ8wLAcUmEQFDWfk.uI3MgOW', 'approved', NULL, '2022-08-08 22:31:52', '2022-08-08 22:31:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(39, 0, 'Haddah Water - مياه حده', 'حده', NULL, '776665003', '2022-08-08-62f140ed0ade5.png', 'info@alnahdain.com', '12345678', 'approved', 'jmvUdGq9CKQeK5BOvRsj5TqCYslmMSOqdLipnHvvlLIEQSRJHkBSQIG48vcL', '2022-08-08 23:59:25', '2022-08-26 07:48:08', NULL, NULL, NULL, NULL, '6IrK9H9fnv9r1lvI5g7bSjv49HgEnI8y8Zibcb5zjOZM0kAPeC', NULL, NULL, 'dUFOblAsSUKCjhpuUAMF7J:APA91bEwfCBOGFES4MfS8vy_M627fesbccXQaGmwnTRf1Fj06lTAFIoOE6FKw5dQmOlWsadjeR0Drpc8zts8d50Qb1iNBWKPsWhkJnFMlqMwqBzY-U_Gh3PH28Qf-kv7vC_2-Bjueea1', 1, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(40, 0, 'ﺷﺮﻛﺔ ﺣﻨﻈﻞ ﺇﺧﻮﺍﻥ ﻟﻠﺘﺠﺎﺭﺓ ﺍﻟﻌﺎﻣﺔ', 'ﺍﻟﻌﺎﻣﺔ', NULL, '1612197', '2022-08-10-62f3cb1523976.png', 'info@handhal.com', '$2y$10$JjaN2udjxrTeOaz7YhalNOjg55Wgt4hEPX8ns1xF1Z2jY6GzSfojq', 'approved', NULL, '2022-08-10 22:13:25', '2022-08-14 03:32:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(41, 0, 'شركة يحيى سهيل وإخوانه للتجارة', 'المحدودة', NULL, '01372663', '2022-08-15-62fa50a9158db.png', 'ysb@y.net.ye', '$2y$10$zdHjLYdOou7YG29Q/6Drj.r5Q.Yf2zCFgMshsBS55Y8JCt/yjjuy.', 'approved', NULL, '2022-08-15 20:56:57', '2022-08-15 20:56:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(42, 0, 'شركة جلب للتجارة العامة والاست', 'جلب', NULL, '01601613', '2022-08-15-62fa94023e49d.png', 'jalapco@jalapco.com', '$2y$10$dmMWuE/5cPEA1DWqQX1eA.tjpXNdKijtOazIrxmWi3eHsVc6E9wkK', 'approved', NULL, '2022-08-16 01:44:18', '2022-08-16 01:44:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(43, 0, 'مصنع الاغذية الخفيفة', 'الخفيفة', NULL, '777400604', '2022-08-16-62fbfd0fb5af0.png', 'alajji53@gmail.com', '$2y$10$PwKBkqHEUcIpt6.cTsZftu4UO3z3wzP6S7h5vf.BDVSCHXKBx4SV.', 'approved', 'DDfZIHCBYYE4xv8e3YJKi2wZmqPRIIvIl78dFjeW5nbiBHODgPJBarUdEdCC', '2022-08-17 03:24:47', '2022-08-17 03:24:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(44, 0, 'KDD Yemen', 'KDD Yemen', NULL, '773868752', '2022-08-17-62fc0b4dd0b86.png', 'kddyemen@gmail.com', '$2y$10$GbmVAn0Q/7A0GsDr27RsPuyfYCPvvWYJh9pS2nTGdSKe0DuR27EgS', 'approved', NULL, '2022-08-17 04:25:33', '2022-08-17 04:25:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(45, 0, 'شركة ميدو للصناعة والتجارة', 'والتجارة', NULL, '733441358', '2022-08-17-62fd4363e701c.png', 'medo@medoye.com', '$2y$10$ML5PdjTT/Bc9rp1EmRMV3.M2qd5wZq/Bv6BogtMKbNTjNQEvkchuO', 'approved', NULL, '2022-08-18 02:37:08', '2022-08-21 16:09:38', NULL, NULL, NULL, NULL, 'AfDAAzK7EWJ5zDOtjuUYrPKZpzTNdj26cNnAyCREnqDyz0NWaX', NULL, NULL, 'enQZGZedSLK1BmhAuwhif_:APA91bEiS6HGJRTI6EtGyWpBPZ66Rwb-G5-Q5CGBXeIz4eiTGzUwSBV6HhyW8NmGnDOEQQIRtoP93nyXEyb7RBlp37Zk72gq1uLzoUNxgvWBMW3s-vdggUw_FJ1KNbisQKApMxfRP23b', 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(46, 0, 'شركة سهول كندة', 'كندة', NULL, '776800985', '2022-08-18-62fe8dce3c88b.png', 'info@kendafields.ye', '$2y$10$V.jCQXzqcIjQ40FV5e03tOMnyQrBdF3TbDI1bfWko7Gua9.VIfGWO', 'approved', NULL, '2022-08-19 02:06:54', '2022-08-19 02:06:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(47, 0, 'شركة بي إم سي المحضار وشركاؤه ', 'المحدودة', NULL, '05305420', '2022-08-18-62fe91eeaf689.png', 'info@bmc-ye.com', '$2y$10$i8nZ8gmKEpoyoU6LLN2kbu6d12JbUag2y9EWpXR23bXkyMl5u7aya', 'approved', NULL, '2022-08-19 02:24:30', '2022-08-19 02:24:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(50, 39, 'Haddah Water - مياه حده', 'اليمني للتموينات', NULL, '777777777', '2022-08-18-62fe977c43071.png', '777777777@emdadb2b.com', '$2y$10$o3HRtpjjCHaekjQaVuRguO8FcMbjqebzbSJ3zCAdfNlMYUtgv2CxS', 'approved', NULL, '2022-08-19 02:48:12', '2022-08-19 02:48:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(57, 18, 'موسسة الغراسي للتجارة', 'UG', NULL, '777794438', '2022-08-19-62fecdcf25e07.png', '777794438@emdadb2b.com', '$2y$10$E8qtPuTaPT/oMQ/ihKsv5OOlmX3..TXEklXv/CKNd65eSbIDRKoP6', 'approved', NULL, '2022-08-19 06:39:59', '2022-08-19 06:39:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', 'yemen', '4078', '[\"4\"]', '', '', '', '', 'البقالات'),
(58, 16, 'محلات محمد محمد المرح', 'عفعهخح', NULL, '777794438', '2022-08-21-63029a7d09b06.png', '777794438', '$2y$10$O8iC9lGG6ETRT7OHhNbaXuvqiqNVWUmhNjd7PZVdjvoQPXt/comPi', 'approved', NULL, '2022-08-22 03:50:05', '2022-08-22 03:50:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(59, 16, 'محلات محمد محمد المرح', 'عصام', NULL, 'عصام', '2022-08-21-63029b3c49843.png', 'عصام قادر', '$2y$10$jNR0nnPPdbvEMX5l2CiNwunNKehKQ3NsW/p44uYC.QyHU6w19Zope', 'approved', NULL, '2022-08-22 03:53:16', '2022-08-22 03:53:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(61, 16, 'محلات محمد محمد المرح', 'عصام', NULL, '777794438', '2022-08-21-63029c2e2dc7c.png', 'ESAMQADER@gmail.com', '$2y$10$Hk5HtK4pvnEy4fEXMdCsJeibdMAXOD4cysvF1n/56AmToJZ8QFrJe', 'approved', NULL, '2022-08-22 03:57:18', '2022-08-22 03:57:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(62, 0, 'بنك الشوكولاته', 'الشوكولاته', NULL, '776669901', '2022-08-23-63050c9dbf9ed.png', 'chocolatebanky@gmail.com', '$2y$10$OzB86jY8hLhlBhTSgK/GW.LPlD/E44GnNNh2D08KJFJ39B26IHGDG', 'approved', NULL, '2022-08-24 00:21:34', '2022-08-25 22:44:43', NULL, NULL, NULL, NULL, '1UvWYjM7qtyULw9aVYcMmv55p3Ev4HMakDjtGJRZxqDJleh2Av', NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(67, 39, 'مياه حده', 'اليمني للتموينات الاصلي', NULL, '777877788', '2022-08-26-630810825567b.png', 'bb@bb.com', '$2y$10$QcV60vX1CjGS46WZ0PTFvOVeWy/mO6asJtzI43m1HgkAtYQ1kPTQ6', 'approved', 'LAi9sLJs8p45IoHczyDpYOZPk2Dmu21xcDKhhN05Wqi0DE0dYiSBstn9584Q', '2022-08-26 07:14:58', '2022-08-26 07:16:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(75, 11, 'QADERFOOD', 'صنعاءughd', NULL, '701000040', '2022-08-27-630a1e90c5b8b.png', 'qaderesam@gmail.com', 'QADER2020', 'approved', NULL, '2022-08-27 20:39:28', '2022-08-28 02:31:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(76, 11, 'QADERFOOD', 'SANAA', NULL, '779800010', '2022-08-27-630a719592278.png', 'ahmedqader@gmail.com', '$2y$10$U4cAALpnfTfLM6OTO0RMguAnmYbmSF6tj06uwVCxHjuNr4mDaOMgG', 'approved', NULL, '2022-08-28 02:33:41', '2022-08-28 02:33:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(77, 0, 'LEGADOR', 'YE', NULL, '711765656', '2022-09-05-63160569c2898.png', 'hayel.alghfari@has.com.ye', '$2y$10$SKUbhJg0v60bMygXWNjnhuDG6bZWivPNpmCcfTb4WCFPGMUE3Tqgq', 'approved', NULL, '2022-09-05 21:19:22', '2022-09-05 21:19:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(78, 0, 'علي', 'حسين', NULL, '777794438', '2022-09-26-6331d4c6ddf50.png', 'alihasen@gmail.com', '$2y$10$QeZcR6ri2DcxsEBfjFZb4uGB008uuBHNkZkVxHc6KG215Zml.QCG2', 'approved', 'fezUYqpr9iXrwbKjKX2AYFYZ2c4gy6IpeCkou597F9vQxs7Pb1Xk596pWbya', '2022-09-26 23:35:19', '2022-09-26 23:35:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(79, 0, 'خالد', 'محمود', NULL, '0124663326', 'def.png', 'khaled@gmail.com', '$2y$10$LfwFiPUetK.ChP7d1DjY7OPyNt8sIUXQV7OvER7sJ7hzULtj41.KK', 'approved', NULL, '2022-10-29 21:07:02', '2022-11-21 10:01:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'مدير مشتريات', '0124663326', '', '', '', '', '', '', '', '', '', '', ''),
(83, 79, 'ادم', 'ادم جروب', NULL, '012781000', '2022-11-01-636061ef76c72.png', 'khaled2022@gmail.com', '$2y$10$jq5vJNM8wX8bbOF1OwvT6umiV.eHDVEO9mFGr2DgEz8W8rX7urZ6u', 'approved', NULL, '2022-11-01 10:01:51', '2022-11-01 10:01:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(84, 0, 'احمد سعد', 'احمد سعد', '3', '0124663326', '2022-11-20-6379692a50b4c.png', 'ahmedsaad@gmail.com', '$2y$10$T5LZJ4p4PeI8IMxtTLocRuavEyv.Yb5tnYUUXg18qnyKVjFQ5EwWa', 'approved', NULL, '2022-11-20 10:39:22', '2022-11-20 10:39:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(85, 0, 'ادم', 'خالد', NULL, '0124663326', '2022-11-20-637969a95e2d0.png', 'adam@gmail.com', '$2y$10$hSMourerOiSq64ylH/00eeZ96KinrMMlqxNwnA9Okc27Jt4t/NwKK', 'approved', NULL, '2022-11-20 10:41:29', '2022-11-22 06:35:37', NULL, NULL, NULL, NULL, 'XJIMFqp45GvPrWqSWQVUJ9bX1T6yTfFIjrEQqlvhbqVz1F1pKHznA3BUd2e3EgGIpUcy0Dtp1PvNcbMQ', NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', '', '', '', '', ''),
(97, 57, NULL, 'يوسف', NULL, '967777864', '2022-12-01-6387df1f1a7c3.png', 'yousef@gmail.com', '$2y$10$amXh.5F1lqcLnMzNb.RX2./bIDsWcgJ1fOs9rew245pNT.6btga1K', 'approved', NULL, '2022-12-01 09:54:23', '2022-12-01 09:54:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '', '', '', '', '', NULL, '', '', '', ''),
(110, 0, 'ادم و شركائه', NULL, NULL, '01201016954', 'def.png', 'adam2026@gmail.com', NULL, 'pending', NULL, '2023-01-25 21:32:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'adam with parenters', 'ادم و شركائه', 'factory', 'yemen', '4077', '[\"1\",\"3\"]', NULL, '01/25/2023', '01/25/2029', '202301252302New Microsoft Excel Worksheet.xlsx', '[\"10\",\"21\",\"27\",\"32\"]'),
(148, 0, 'ادم و شركائه', NULL, NULL, '0120101691', 'def.png', 'adam2023@gmail.com', NULL, 'approved', NULL, '2023-01-25 23:05:57', '2023-01-25 23:19:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'adam with parenters', 'ادم و شركائه', 'factory', 'yemen', '4077', '[\"1\",\"3\"]', NULL, '01/25/2023', '01/25/2029', '202301252302New Microsoft Excel Worksheet.xlsx', '[\"27\",\"32\",\"35\"]');

-- --------------------------------------------------------

--
-- Table structure for table `seller_req_add_products`
--

CREATE TABLE `seller_req_add_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indastry_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty_in_unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double NOT NULL,
  `qty_in_stock` int(11) NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carton_unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_sub_category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branche_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_req_add_products`
--

INSERT INTO `seller_req_add_products` (`id`, `seller_id`, `product_id`, `indastry_name`, `product_name`, `product_type`, `product_size`, `qty_in_unit`, `purchase_price`, `product_price`, `qty_in_stock`, `product_image`, `carton_unit`, `brand_id`, `category_id`, `sub_category_id`, `sub_sub_category_id`, `branche_id`, `created_at`, `updated_at`) VALUES
(1, 85, NULL, NULL, 'فيتا بلس', 'الاصلي', 'غرام', '190', '60', 195, 45, '1668903706.jpg', '45', '3', '13', '8', NULL, '', '2022-11-20 11:21:46', '2022-11-20 11:21:46'),
(8, 57, '9', 'المراعي', 'حليب بالموز', 'كامل الدسم', 'غرام', '1000', '140', 200, 50, '1674077917.jpg', '150', NULL, NULL, NULL, NULL, '', '2023-01-18 22:38:37', '2023-01-18 22:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `seller_req_product_files`
--

CREATE TABLE `seller_req_product_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_req_product_files`
--

INSERT INTO `seller_req_product_files` (`id`, `seller_id`, `file_name`, `created_at`, `updated_at`) VALUES
(13, 110, '2023-01-25-63d19631b88a0.xlsx', '2023-01-25 21:50:57', '2023-01-25 21:50:57'),
(14, 110, '2023-01-25-63d19717939a6.xlsx', '2023-01-25 21:54:47', '2023-01-25 21:54:47'),
(15, 110, '2023-01-25-63d19753b7826.xlsx', '2023-01-25 21:55:47', '2023-01-25 21:55:47'),
(16, 110, '2023-01-25-63d197e2264d6.xlsx', '2023-01-25 21:58:10', '2023-01-25 21:58:10'),
(17, 110, '2023-01-25-63d1982892654.xlsx', '2023-01-25 21:59:20', '2023-01-25 21:59:20'),
(18, 110, '2023-01-26-63d1988a60bc4.xlsx', '2023-01-25 22:00:58', '2023-01-25 22:00:58'),
(19, 110, '2023-01-26-63d19b31ea32e.xlsx', '2023-01-25 22:12:18', '2023-01-25 22:12:18'),
(20, 110, '2023-01-26-63d19dfab9b6b.xlsx', '2023-01-25 22:24:10', '2023-01-25 22:24:10'),
(21, 110, '2023-01-26-63d19e7f3f386.xlsx', '2023-01-25 22:26:23', '2023-01-25 22:26:23'),
(22, 110, '2023-01-26-63d1a09d7bddb.xlsx', '2023-01-25 22:35:25', '2023-01-25 22:35:25'),
(23, 148, '2023-01-26-63d1a7c55d53e.xlsx', '2023-01-25 23:05:57', '2023-01-25 23:05:57');

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(1, 1, 0, 0, '2022-05-25 14:40:19', '2022-05-25 14:40:19', 0.00, 0.00, 0.00, 0.00, 0.00),
(2, 2, 0, 0, '2022-06-07 06:56:15', '2022-06-07 06:56:15', 0.00, 0.00, 0.00, 0.00, 0.00),
(3, 3, 0, 0, '2022-06-12 02:48:44', '2022-06-12 02:48:44', 0.00, 0.00, 0.00, 0.00, 0.00),
(4, 4, 0, 0, '2022-06-13 20:41:28', '2022-06-13 20:41:28', 0.00, 0.00, 0.00, 0.00, 0.00),
(5, 5, 0, 0, '2022-06-13 20:46:25', '2022-06-13 20:46:25', 0.00, 0.00, 0.00, 0.00, 0.00),
(6, 6, 0, 0, '2022-06-13 21:41:37', '2022-06-13 21:41:37', 0.00, 0.00, 0.00, 0.00, 0.00),
(7, 7, 0, 0, '2022-06-13 21:49:43', '2022-06-13 21:49:43', 0.00, 0.00, 0.00, 0.00, 0.00),
(8, 8, 0, 0, '2022-06-13 21:53:15', '2022-06-13 21:53:15', 0.00, 0.00, 0.00, 0.00, 0.00),
(9, 9, 0, 0, '2022-06-13 22:01:44', '2022-06-13 22:01:44', 0.00, 0.00, 0.00, 0.00, 0.00),
(10, 10, 0, 0, '2022-06-13 22:07:03', '2022-06-13 22:07:03', 0.00, 0.00, 0.00, 0.00, 0.00),
(11, 11, 267.20689655172, 0, '2022-06-17 02:47:17', '2022-10-17 00:48:06', 0.00, 0.00, 0.00, 517.11, 0.00),
(12, 12, 0, 0, '2022-07-16 22:12:12', '2022-07-16 22:12:12', 0.00, 0.00, 0.00, 0.00, 0.00),
(13, 13, 0, 0, '2022-07-18 01:22:36', '2022-07-18 01:22:36', 0.00, 0.00, 0.00, 0.00, 0.00),
(14, 14, 0, 0, '2022-07-18 01:38:37', '2022-07-18 01:38:37', 0.00, 0.00, 0.00, 0.00, 0.00),
(15, 15, 0, 0, '2022-07-20 21:03:43', '2022-07-20 21:03:43', 0.00, 0.00, 0.00, 0.00, 0.00),
(16, 16, 0, 0, '2022-07-23 21:00:26', '2022-07-23 21:00:26', 0.00, 0.00, 0.00, 0.00, 0.00),
(17, 17, 0, 0, '2022-07-23 22:13:16', '2022-07-23 22:13:16', 0.00, 0.00, 0.00, 0.00, 0.00),
(18, 18, 0, 0, '2022-07-27 00:02:37', '2022-07-27 00:02:37', 0.00, 0.00, 0.00, 0.00, 0.00),
(19, 19, 0, 0, '2022-07-28 02:18:12', '2022-07-28 02:18:12', 0.00, 0.00, 0.00, 0.00, 0.00),
(20, 20, 0, 0, '2022-07-28 20:16:31', '2022-07-28 20:16:31', 0.00, 0.00, 0.00, 0.00, 0.00),
(21, 21, 0, 0, '2022-07-28 21:09:06', '2022-07-28 21:09:06', 0.00, 0.00, 0.00, 0.00, 0.00),
(22, 22, 0, 0, '2022-07-28 21:13:42', '2022-07-28 21:13:42', 0.00, 0.00, 0.00, 0.00, 0.00),
(23, 23, 0, 0, '2022-07-28 21:17:06', '2022-07-28 21:17:06', 0.00, 0.00, 0.00, 0.00, 0.00),
(24, 24, 0, 0, '2022-07-28 21:28:32', '2022-07-28 21:28:32', 0.00, 0.00, 0.00, 0.00, 0.00),
(25, 25, 0, 0, '2022-07-28 21:43:21', '2022-07-28 21:43:21', 0.00, 0.00, 0.00, 0.00, 0.00),
(26, 26, 0, 0, '2022-07-29 00:49:07', '2022-07-29 00:49:07', 0.00, 0.00, 0.00, 0.00, 0.00),
(27, 27, 0, 0, '2022-07-30 21:07:21', '2022-10-16 23:29:48', 0.00, 0.00, 0.00, 84.48, 0.00),
(28, 28, 0, 0, '2022-07-31 01:43:18', '2022-07-31 01:43:18', 0.00, 0.00, 0.00, 0.00, 0.00),
(29, 29, 0, 0, '2022-08-02 00:09:57', '2022-08-02 00:09:57', 0.00, 0.00, 0.00, 0.00, 0.00),
(30, 30, 0, 0, '2022-08-02 03:28:39', '2022-08-02 03:28:39', 0.00, 0.00, 0.00, 0.00, 0.00),
(31, 31, 0, 0, '2022-08-02 20:46:57', '2022-08-02 20:46:57', 0.00, 0.00, 0.00, 0.00, 0.00),
(32, 32, 0, 0, '2022-08-03 21:05:58', '2022-08-03 21:05:58', 0.00, 0.00, 0.00, 0.00, 0.00),
(33, 33, 0, 0, '2022-08-05 00:18:28', '2022-08-05 00:18:28', 0.00, 0.00, 0.00, 0.00, 0.00),
(34, 34, 0, 0, '2022-08-06 20:41:03', '2022-08-06 20:41:03', 0.00, 0.00, 0.00, 0.00, 0.00),
(35, 35, 0, 0, '2022-08-06 22:31:19', '2022-08-06 22:31:19', 0.00, 0.00, 0.00, 0.00, 0.00),
(36, 36, 0, 0, '2022-08-07 23:47:31', '2022-08-07 23:47:31', 0.00, 0.00, 0.00, 0.00, 0.00),
(37, 37, 0, 0, '2022-08-08 07:59:06', '2022-08-08 07:59:06', 0.00, 0.00, 0.00, 0.00, 0.00),
(38, 38, 0, 0, '2022-08-08 22:31:52', '2022-08-08 22:31:52', 0.00, 0.00, 0.00, 0.00, 0.00),
(39, 39, 0, 0, '2022-08-08 23:59:25', '2022-09-04 02:12:25', 0.00, 0.00, 0.00, 3.53, 0.00),
(40, 40, 0, 0, '2022-08-10 22:13:25', '2022-08-10 22:13:25', 0.00, 0.00, 0.00, 0.00, 0.00),
(41, 41, 0, 0, '2022-08-15 20:56:57', '2022-08-15 20:56:57', 0.00, 0.00, 0.00, 0.00, 0.00),
(42, 42, 0, 0, '2022-08-16 01:44:18', '2022-08-16 01:44:18', 0.00, 0.00, 0.00, 0.00, 0.00),
(43, 43, 0, 0, '2022-08-17 03:24:47', '2022-08-17 03:24:47', 0.00, 0.00, 0.00, 0.00, 0.00),
(44, 44, 0, 0, '2022-08-17 04:25:34', '2022-08-17 04:25:34', 0.00, 0.00, 0.00, 0.00, 0.00),
(45, 45, 0, 0, '2022-08-18 02:37:08', '2022-08-18 02:37:08', 0.00, 0.00, 0.00, 0.00, 0.00),
(46, 46, 0, 0, '2022-08-19 02:06:54', '2022-08-19 02:06:54', 0.00, 0.00, 0.00, 0.00, 0.00),
(47, 47, 0, 0, '2022-08-19 02:24:30', '2022-08-19 02:24:30', 0.00, 0.00, 0.00, 0.00, 0.00),
(48, 49, 0, 0, '2022-08-19 02:44:55', '2022-08-19 02:44:55', 0.00, 0.00, 0.00, 0.00, 0.00),
(49, 50, 0, 0, '2022-08-19 02:48:12', '2022-08-19 02:48:12', 0.00, 0.00, 0.00, 0.00, 0.00),
(55, 57, 0, 0, '2022-08-19 06:39:59', '2022-08-19 06:39:59', 0.00, 0.00, 0.00, 0.00, 0.00),
(56, 58, 0, 0, '2022-08-22 03:50:05', '2022-08-22 03:50:05', 0.00, 0.00, 0.00, 0.00, 0.00),
(57, 59, 0, 0, '2022-08-22 03:53:16', '2022-08-22 03:53:16', 0.00, 0.00, 0.00, 0.00, 0.00),
(58, 61, 0, 0, '2022-08-22 03:57:18', '2022-08-22 03:57:18', 0.00, 0.00, 0.00, 0.00, 0.00),
(59, 62, 0, 0, '2022-08-24 00:21:34', '2022-08-24 00:21:34', 0.00, 0.00, 0.00, 0.00, 0.00),
(60, 63, 0, 0, '2022-08-26 04:17:56', '2022-08-26 04:17:56', 0.00, 0.00, 0.00, 0.00, 0.00),
(61, 64, 0, 0, '2022-08-26 04:18:55', '2022-08-26 04:18:55', 0.00, 0.00, 0.00, 0.00, 0.00),
(62, 65, 0, 0, '2022-08-26 04:22:07', '2022-08-26 04:22:07', 0.00, 0.00, 0.00, 0.00, 0.00),
(63, 66, 0, 0, '2022-08-26 06:14:35', '2022-08-26 06:14:35', 0.00, 0.00, 0.00, 0.00, 0.00),
(64, 67, 0, 0, '2022-08-26 07:14:58', '2022-08-26 07:14:58', 0.00, 0.00, 0.00, 0.00, 0.00),
(65, 71, 0, 0, '2022-08-26 07:25:06', '2022-08-26 07:25:06', 0.00, 0.00, 0.00, 0.00, 0.00),
(66, 74, 0, 0, '2022-08-26 07:31:52', '2022-08-26 07:31:52', 0.00, 0.00, 0.00, 0.00, 0.00),
(67, 75, 0, 0, '2022-08-27 20:39:28', '2022-08-27 20:39:28', 0.00, 0.00, 0.00, 0.00, 0.00),
(68, 76, 0, 0, '2022-08-28 02:33:42', '2022-08-28 02:33:42', 0.00, 0.00, 0.00, 0.00, 0.00),
(69, 77, 0, 0, '2022-09-05 21:19:22', '2022-09-05 21:19:22', 0.00, 0.00, 0.00, 0.00, 0.00),
(70, 78, 0, 0, '2022-09-26 23:35:19', '2022-09-26 23:35:19', 0.00, 0.00, 0.00, 0.00, 0.00),
(71, 79, 0, 0, '2022-10-30 07:09:51', '2022-10-30 07:09:51', 0.00, 0.00, 0.00, 0.00, 0.00),
(72, 83, 0, 0, '2022-11-01 10:01:51', '2022-11-01 10:01:51', 0.00, 0.00, 0.00, 0.00, 0.00),
(73, 84, 0, 0, '2022-11-20 10:39:22', '2022-11-20 10:39:22', 0.00, 0.00, 0.00, 0.00, 0.00),
(74, 85, 0, 0, '2022-11-20 10:41:29', '2022-11-20 10:41:29', 0.00, 0.00, 0.00, 0.00, 0.00),
(75, 97, 0, 0, '2022-12-01 09:54:23', '2022-12-01 09:54:23', 0.00, 0.00, 0.00, 0.00, 0.00),
(76, 57, 0, 0, '2022-12-09 08:33:06', '2022-12-09 08:33:06', 0.00, 0.00, 0.00, 0.00, 0.00),
(77, 57, 0, 0, '2022-12-09 08:33:29', '2022-12-09 08:33:29', 0.00, 0.00, 0.00, 0.00, 0.00),
(78, 57, 0, 0, '2022-12-09 08:33:42', '2022-12-09 08:33:42', 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '2', 'Mohm Ali', 'Home', 'الاربعين جولةبيت بوس صنعاء‎،، Sana\'a, Yemen', 'الحربي', '777363554', '+967777363554', '2022-06-15 01:18:05', '2022-06-15 01:18:05', NULL, NULL, '15.278779', '44.219536', 0),
(2, '12', 'سوبر', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'تمام', '777363554', '+967779132016', '2022-06-23 23:12:30', '2022-06-23 23:12:30', NULL, NULL, '15.2789014', '44.2195414', 0),
(3, '27', '+967777794438', 'Home', '7794+G3J، المقالح، Yemen', 'fdurerr', '74557444', '+967777794438', '2022-07-02 07:40:40', '2022-07-02 07:40:40', NULL, NULL, '15.2691616', '44.2549694', 0),
(4, '28', '+967778900010', 'Home', 'اليمن', 'نينيينينين', '777784846', '+967778900010', '2022-07-02 07:43:36', '2022-07-02 07:43:36', NULL, NULL, '0.0', '0.0', 0),
(5, '13', 'الرئد علي', 'Home', '76H9+FP9, Sana\'a, Yemen', 'علي', '777794438', '+967701000040', '2022-07-03 02:01:09', '2022-07-03 02:01:09', NULL, NULL, '15.2789632', '44.2190475', 0),
(6, '12', 'بقاله المجد المفلحي', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'يوم', '+967779132', '+967779132016', '2022-07-04 01:54:32', '2022-07-04 01:54:32', NULL, NULL, '15.278929', '44.2195106', 0),
(7, '12', 'بقاله المجد المفلحي', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'اليمن', '+967779132', '+967779132016', '2022-07-04 02:02:11', '2022-07-04 02:02:11', NULL, NULL, '15.2789322', '44.2195082', 0),
(8, '27', '+967777794438 +967777794438', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'ابى', '+967777794', '+967777794438', '2022-07-04 02:22:10', '2022-07-04 02:22:10', NULL, NULL, '15.2789317', '44.219509', 0),
(9, '27', 'بقاله المجد', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'بيت بوس', '+967777794', '+967777794438', '2022-07-04 02:26:07', '2022-07-04 02:26:07', NULL, NULL, '15.2789317', '44.219509', 0),
(10, '12', 'بقاله المجد المفلحي', 'Home', 'Yemen', 'Home', '+967779132', '+967779132016', '2022-07-05 02:28:47', '2022-07-05 02:28:47', NULL, NULL, '48.516388', '15.552727', 0),
(11, '12', 'بقاله المجد المفلحي', 'Home', '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', 'Home', '+967779132', '+967779132016', '2022-07-05 02:29:12', '2022-07-05 02:29:12', NULL, NULL, '37.4219983', '-122.084', 0),
(12, '32', 'محمد شايف', 'Home', 'شارع الجامعه العربية، Sana\'a, Yemen', 'صنعاء الحصبة', '0000', '+967775626237،', '2022-07-09 22:10:40', '2022-07-09 22:10:40', NULL, NULL, '15.3784714', '44.2107433', 0),
(15, '47', 'بقاله', 'Home', 'بيت بوس، صنعاء‎،، 76H9+FRH, Sana\'a, Yemen', 'Home', '+967770799', '+967770799451', '2022-07-27 01:41:52', '2022-07-27 01:41:52', NULL, NULL, '15.2787188', '44.2195353', 0),
(16, '54', '+967773560440 +967773560440', 'Home', 'البريقة، Little Aden, عدن، Yemen', 'Home', '+967773560', '+967773560440', '2022-07-27 04:52:05', '2022-07-27 04:52:05', NULL, NULL, '44.8926315', '12.7562264', 0),
(17, '55', '+967773988679 +967773988679', 'Home', '959G+WG Sana\'a, Yemen', 'Home', '+967773988', '+967773988679', '2022-07-27 05:11:47', '2022-07-27 05:11:47', NULL, NULL, '15.3698149', '44.1763274', 0),
(18, '56', '+967770750901 +967770750901', 'Home', 'hhhhj', 'Home', '+967770750', '+967770750901', '2022-07-27 05:43:38', '2022-07-27 05:43:38', NULL, NULL, '0.0', '0.0', 0),
(19, '56', '+967770750901 +967770750901', 'Home', '8559+8F6, Sana\'a, Yemen', 'Home', '+967770750', '+967770750901', '2022-07-27 05:44:08', '2022-07-27 05:44:08', NULL, NULL, '15.308932', '44.1685682', 0),
(20, '50', '+967775451467 +967775451467', 'Home', '96MX+JPV، صنعاء‎،، Yemen', 'Home', '+967775451', '+967775451467', '2022-07-27 06:54:42', '2022-07-27 06:54:42', NULL, NULL, '0.0', '0.0', 0),
(21, '28', 'بقالة عصام', 'Home', 'شارع اسماعيل المقالح، شارع المقالح، Sana\'a, Yemen', 'Home', '+967778900', '+967778900010', '2022-07-27 07:43:18', '2022-07-27 07:43:18', NULL, NULL, '15.267192', '44.253552', 0),
(22, '59', '+967772014692 +967772014692', 'Home', 'GCG4+656، ذمار،، Yemen', 'Home', '+967772014', '+967772014692', '2022-07-27 08:04:16', '2022-07-27 08:04:16', NULL, NULL, '14.5250064', '44.4047372', 0),
(23, '59', '+967772014692 +967772014692', 'Home', 'GCG4+656، ذمار،، Yemen', 'Home', '+967772014', '+967772014692', '2022-07-27 08:05:42', '2022-07-27 08:05:42', NULL, NULL, '14.5263924', '44.4049699', 0),
(24, '60', '+967777737940 +967777737940', 'Home', 'M62H+WMC، الحزم، Yemen', 'Home', '+967777737', '+967777737940', '2022-07-27 11:20:24', '2022-07-27 11:20:24', NULL, NULL, '13.6521164', '44.2293884', 0),
(25, '60', '+967777737940 +967777737940', 'Home', 'M63F+WV الحزم، Yemen', 'Home', '+967777737', '+967777737940', '2022-07-27 11:21:52', '2022-07-27 11:21:52', NULL, NULL, '13.6548551', '44.2246479', 0),
(26, '64', 'بقالة', 'Home', 'صنعاء', 'Home', '+967735239', '+967735239666', '2022-07-27 14:28:31', '2022-07-27 14:28:31', NULL, NULL, '0.0', '0.0', 0),
(27, '65', 'بقاله النجار', 'Home', '9656+2FR, Sana\'a, Yemen', 'Home', '+967770022', '+967770022395', '2022-07-27 17:24:10', '2022-07-27 17:24:10', NULL, NULL, '15.357363', '44.2105928', 0),
(28, '65', 'بقاله النجار', 'Home', '9646+C36، شمال السايلة، صنعاء‎،, Yemen', 'Home', '+967770022', '+967770022395', '2022-07-27 17:25:31', '2022-07-27 17:25:31', NULL, NULL, '15.356717', '44.2103852', 0),
(29, '65', '+967770022395 +967770022395', 'Home', '9646+JGP بستان الجوزه، شمال السايلة، صنعاء‎،، صنعاء‎،، Sana\'a, Yemen', 'Home', '+967770022', '+967770022395', '2022-07-27 17:28:05', '2022-07-27 17:28:05', NULL, NULL, '15.3568813', '44.2105868', 0),
(30, '65', 'بقاله مامون', 'Home', 'بقالة مامون، شمال السايلة، صنعاء‎،, Yemen', 'Home', '+967770022', '+967770022395', '2022-07-27 17:31:05', '2022-07-27 17:31:05', NULL, NULL, '44.2101478', '15.3560252', 0),
(31, '67', 'بقالة نجم', 'Home', 'حده عمارة النزيلي،, 85CX+JMV، صنعاء‎، Yemen', 'Home', '+967777399', '+967777399100', '2022-07-27 22:49:52', '2022-07-27 22:49:52', NULL, NULL, '15.3216155', '44.1992071', 0),
(32, '67', '+967777399100 +967777399100', 'Home', 'حده عمارة النزيلي،, 85CX+JMV، صنعاء‎، Yemen', 'Home', '+967777399', '+967777399100', '2022-07-27 22:50:41', '2022-07-27 22:50:41', NULL, NULL, '15.3216182', '44.1992014', 0),
(33, '28', 'بقاله عصام قادر', 'Home', 'بيت بوس، صنعاء‎،، 76H9+FRH, Sana\'a, Yemen', 'Home', '+967778900', '+967778900010', '2022-07-28 01:04:06', '2022-07-28 01:04:06', NULL, NULL, '15.2787361', '44.2195324', 0),
(34, '68', 'زمزم بقالة', 'Home', 'RXP4+GJ7, Shaykh Uthman, Yemen', 'Home', '+967777913', '+967777913865', '2022-07-28 02:04:47', '2022-07-28 02:04:47', NULL, NULL, '12.8364261', '44.9567647', 0),
(35, '69', '+967774560258 +967774560258', 'Home', 'G2HX+6R Al Qurayshi, Yemen', 'Home', '+967774560', '+967774560258', '2022-07-28 02:18:57', '2022-07-28 02:18:57', NULL, NULL, '15.5280729', '44.0495136', 0),
(36, '73', 'علي', 'Home', 'الاربعين جولةبيت بوس صنعاء‎،، Sana\'a, Yemen', 'Home', '+967701000', '+967701000040', '2022-07-28 05:05:08', '2022-07-28 05:05:08', NULL, NULL, '15.2787445', '44.2195558', 0),
(37, '12', 'بقاله المجد', 'Home', 'جولة بيت بوس برج المجد الدور الرابع، Sana\'a, Yemen', 'Home', '+967779132', '+967779132016', '2022-08-03 01:44:19', '2022-08-03 01:44:19', NULL, NULL, '15.2788524', '44.2196174', 0),
(38, '12', 'بقاله المجد', 'Home', 'جولة بيت بوس برج المجد الدور الرابع، Sana\'a, Yemen', 'Home', '+967779132', '+967779132016', '2022-08-03 01:44:43', '2022-08-03 01:44:43', NULL, NULL, '15.2788524', '44.2196174', 0),
(39, '12', 'بقاله المجد المفلحي', 'Home', 'جولة بيت بوس برج المجد الدور الرابع، Sana\'a, Yemen', 'Home', '+967779132', '+967779132016', '2022-08-03 01:51:18', '2022-08-03 01:51:18', NULL, NULL, '15.2788524', '44.2196174', 0),
(40, '12', 'بقاله المجد المفلحي', 'Home', 'جولة بيت بوس برج المجد الدور الرابع، Sana\'a, Yemen', 'Home', '+967779132', '+967779132016', '2022-08-03 01:52:24', '2022-08-03 01:52:24', NULL, NULL, '15.2788524', '44.2196174', 0),
(41, '12', 'الاساسيس', 'Home', '76H9+V8P, Sana\'a, Yemen', 'Home', '+967779132', '+967779132016', '2022-08-03 02:09:44', '2022-08-03 02:09:44', NULL, NULL, '15.280224', '44.2184253', 0),
(42, '12', 'الاساسيس', 'Home', 'جولة بيت بوس برج المجد الدور الرابع، Sana\'a, Yemen', 'Home', '+967779132', '+967779132016', '2022-08-03 02:21:36', '2022-08-03 02:21:36', NULL, NULL, '15.2788536', '44.2196195', 0),
(43, '12', 'الاساسيس', 'Home', 'الاربعين جولةبيت بوس صنعاء‎،، Sana\'a, Yemen', 'Home', '+967779132', '+967779132016', '2022-08-03 02:31:43', '2022-08-03 02:31:43', NULL, NULL, '15.2788301', '44.2194869', 0),
(44, '48', '+967711086222 +967711086222', 'Home', 'بيت بوس، صنعاء‎،، 76H9+FVJ, Sana\'a, Yemen', 'Home', '+967711086', '+967711086222', '2022-08-03 20:46:18', '2022-08-03 20:46:18', NULL, NULL, '15.2787084', '44.2196962', 0),
(45, '123', 'الاساسيس', 'Home', 'مديرية السبعين، صنعاء‎، دارسلم، صنعاء‎،، 77J7+P7Q, Sana\'a, Yemen', 'Home', '+967771277', '+967771277728', '2022-08-04 21:38:49', '2022-08-04 21:38:49', NULL, NULL, '15.281883', '44.2632647', 0),
(46, '132', 'الاساسيس', 'Home', '959W+4RW, Sana\'a, Yemen', 'Home', '+967739946', '+967739946855', '2022-08-06 01:00:20', '2022-08-06 01:00:20', NULL, NULL, '15.3679095', '44.1972346', 0),
(47, '131', 'الاساسيس', 'Home', '68F3+GM6, Ja\'ar, Yemen', 'Home', '+967733083', '+967733083757', '2022-08-06 01:13:00', '2022-08-06 01:13:00', NULL, NULL, '13.2237606', '45.3041405', 0),
(48, '134', 'الاساسيس', 'Home', 'ش عشرين', 'Home', '+967770888', '+967770888778', '2022-08-06 03:16:03', '2022-08-06 03:16:03', NULL, NULL, '0.0', '0.0', 0),
(49, '136', 'الاساسيس', 'Home', '٩ مربع وادي حده، صنعاء‎،، Sana\'a, Yemen', 'Home', '+967779400', '+967779400661', '2022-08-06 03:41:28', '2022-08-06 03:41:28', NULL, NULL, '15.3262584', '44.1857339', 0),
(51, '142', 'الاساسيس', 'Home', 'الجرداء، شارع تعز صنعاء‎،، 862P+CP6, Sana\'a, Yemen', 'Home', '+967773767', '+967773767450', '2022-08-06 05:28:52', '2022-08-06 05:28:52', NULL, NULL, '15.3009876', '44.2368672', 0),
(52, '143', 'الاساسيس', 'Home', 'F6WR+C55, Sana\'a, Yemen', 'Home', '+967776082', '+967776082100', '2022-08-06 05:34:55', '2022-08-06 05:34:55', NULL, NULL, '15.4951687', '44.2394282', 0),
(53, '144', 'الاساسيس', 'Home', 'شارع الجزائر، Sana\'a, Yemen', 'Home', '+967774993', '+967774993997', '2022-08-06 06:32:33', '2022-08-06 06:32:33', NULL, NULL, '44.1897372', '15.3351029', 0),
(54, '146', 'الاساسيس', 'Home', '76RV+97Q, Sana\'a, Yemen', 'Home', '+967777715', '+967777715823', '2022-08-06 11:39:01', '2022-08-06 11:39:01', NULL, NULL, '15.2912866', '44.2431147', 0),
(55, '151', 'الاساسيس', 'Home', 'الحصبه', 'Home', '+967777772', '+967777772381', '2022-08-07 00:59:23', '2022-08-07 00:59:23', NULL, NULL, '0.0', '0.0', 0),
(56, '115', 'الاساسيس', 'Home', 'شارع الخمسين بعد تقاطع شارع 14 اكتوبر بحده قبل مدخل القاعه الكبرى، Sana\'a, Yemen', 'Home', '+967773769', '+967773769681', '2022-08-07 03:00:43', '2022-08-07 03:00:43', NULL, NULL, '15.2907464', '44.2000491', 0),
(57, '153', 'الاساسيس', 'Home', 'QH7W+H6 Ash Shihr, Yemen', 'Home', '+967770885', '+967770885665', '2022-08-07 03:45:12', '2022-08-07 03:45:12', NULL, NULL, '14.7638802', '49.5955122', 0),
(58, '157', 'الاساسيس', 'Home', '64G8+6XH, At Turbah, Yemen', 'Home', '+967771359', '+967771359378', '2022-08-08 03:51:59', '2022-08-08 03:51:59', NULL, NULL, '13.225489', '44.1173859', 0),
(59, '158', 'الاساسيس', 'Home', '86R6+FP5, Sana\'a, Yemen', 'Home', '+967775551', '+967775551416', '2022-08-08 04:16:13', '2022-08-08 04:16:13', NULL, NULL, '15.3412091', '44.2120482', 0),
(61, '160', 'الاساسيس', 'Home', '85WJ+7P2, Sana\'a, Yemen', 'Home', '+967775156', '+967775156003', '2022-08-08 08:03:40', '2022-08-08 08:03:40', NULL, NULL, '15.345612', '44.1815993', 0),
(62, '2', 'الاساسيس', 'Home', 'جولة بيت بوس برج المجد الدور الرابع، Sana\'a, Yemen', 'Home', '+967777363', '+967777363554', '2022-08-08 21:13:49', '2022-08-08 21:13:49', NULL, NULL, '15.2788554', '44.2196215', 0),
(63, '165', 'الاساسيس', 'Home', '579W+72P, Zalom 72210, Saudi Arabia', 'Home', '+966557373', '+966557373381', '2022-08-09 06:01:33', '2022-08-09 06:01:33', NULL, NULL, '30.1682267', '40.29518', 0),
(64, '50', '+967775451467 +967775451467', 'Home', '96MX+JPV، صنعاء‎،،، صنعاء.سعوان، Sana\'a, Yemen', 'Home', '+967775451', '+967775451467', '2022-08-09 07:59:28', '2022-08-09 07:59:28', NULL, NULL, '15.3837896', '44.2495302', 0),
(65, '168', 'الاساسيس', 'Home', 'F549+VM9، الحضن، Yemen', 'Home', '+967776644', '+967776644144', '2022-08-09 21:48:36', '2022-08-09 21:48:36', NULL, NULL, '15.4568724', '44.1699196', 0),
(66, '171', 'الاساسيس', 'Home', '86HH+7W9، صنعاء‎،، Yemen', 'Home', '+967776650', '+967776650333', '2022-08-10 00:42:29', '2022-08-10 00:42:29', NULL, NULL, '15.3281385', '44.2298147', 0),
(67, '173', 'الاساسيس', 'Home', 'CP9W+FP النظيم، Yemen', 'Home', '+967773746', '+967773746811', '2022-08-10 02:52:04', '2022-08-10 02:52:04', NULL, NULL, '14.4186353', '44.7467882', 0),
(68, '175', 'الاساسيس', 'Home', 'شارع الكهرباء السكنية، Madinat Asha\'ab, Yemen', 'Home', '+967772359', '+967772359493', '2022-08-10 03:08:55', '2022-08-10 03:08:55', NULL, NULL, '12.8312445', '44.9209396', 0),
(69, '176', 'بقاله المحجب', 'Home', 'F4RP+4FP، القناوص،، Yemen', 'Home', '+967778351', '+967778351000', '2022-08-10 03:43:20', '2022-08-10 03:43:20', NULL, NULL, '15.4911329', '43.1364607', 0),
(70, '182', 'الاساسيس', 'Home', '854J+82X, Dar Alhayat St, Sana\'a, Yemen', 'Home', '+967777730', '+967777730385', '2022-08-10 11:47:59', '2022-08-10 11:47:59', NULL, NULL, '15.3056221', '44.1803282', 0),
(71, '183', 'الاساسيس', 'Home', '9644+QJM, Ali Abdul Moghni St, Sana\'a, Yemen', 'Home', '+967770474', '+967770474228', '2022-08-10 11:50:54', '2022-08-10 11:50:54', NULL, NULL, '15.3568186', '44.2068614', 0),
(72, '184', 'الاساسيس', 'Home', '86Q2+8MP, Mujahed St, Sana\'a, Yemen', 'Home', '+967770266', '+967770266547', '2022-08-10 14:32:42', '2022-08-10 14:32:42', NULL, NULL, '15.3383821', '44.201768', 0),
(73, '184', 'الاساسيس', 'Home', '86Q2+8MP, Mujahed St, Sana\'a, Yemen', 'Home', '+967770266', '+967770266547', '2022-08-10 14:34:02', '2022-08-10 14:34:02', NULL, NULL, '15.33838', '44.2017706', 0),
(74, '188', 'الاساسيس', 'Home', '6C47+47 Mhwash, Yemen', 'Home', '+967774761', '+967774761397', '2022-08-10 19:18:13', '2022-08-10 19:18:13', NULL, NULL, '15.2052795', '44.4131336', 0),
(75, '187', 'الاساسيس', 'Home', 'إب،، X58J+WP2, Ibb, Yemen', 'Home', '+967772873', '+967772873361', '2022-08-10 20:07:01', '2022-08-10 20:07:01', NULL, NULL, '13.9672623', '44.1817371', 0),
(76, '190', 'الاساسيس', 'Home', 'مستشفى النبلاء الحديث د عمر عبدالرحمن، صنعاء‎،، Yemen', 'Home', '+967772619', '+967772619976', '2022-08-10 22:25:55', '2022-08-10 22:25:55', NULL, NULL, '44.2441895', '15.3840666', 0),
(77, '192', 'الاساسيس', 'Home', '8W3V+7J7, Al-Shabah, Yemen', 'Home', '+967774841', '+967774841270', '2022-08-10 23:06:13', '2022-08-10 23:06:13', NULL, NULL, '14.3025474', '46.9435743', 0),
(78, '194', 'الاساسيس', 'Home', 'تعز الحوبان', 'Home', '+967730172', '+967730172101', '2022-08-11 02:43:26', '2022-08-11 02:43:26', NULL, NULL, '13.5890644', '44.0477966', 0),
(79, '194', 'الاساسيس', 'Home', 'طريق صنعاء، مديرية التعزية،، H2QW+Q5G, Taizz, Yemen', 'Home', '+967730172', '+967730172101', '2022-08-11 02:44:59', '2022-08-11 02:44:59', NULL, NULL, '13.5894775', '44.0454736', 0),
(80, '194', 'الاساسيس', 'Home', 'صنعاء شارع هائل جوار مدارس الريادة، Sana\'a, Yemen', 'Home', '+967730172', '+967730172101', '2022-08-11 02:53:19', '2022-08-11 02:53:19', NULL, NULL, '44.18212130000001', '15.355434', 0),
(81, '196', 'الاساسيس', 'Home', '85WQ+R2H، صنعاء‎،، Yemen', 'Home', '+967738987', '+967738987163', '2022-08-11 07:36:09', '2022-08-11 07:36:09', NULL, NULL, '15.3469928', '44.1875062', 0),
(82, '196', 'الاساسيس', 'Home', '85WP+PRQ، صنعاء‎،، Sana\'a, Yemen', 'Home', '+967738987', '+967738987163', '2022-08-11 07:36:58', '2022-08-11 07:36:58', NULL, NULL, '15.3469906', '44.1875401', 0),
(83, '199', 'الاساسيس', 'Home', 'شارع 16، صنعاء‎،، Sana\'a, Yemen', 'Home', '+967772660', '+967772660601', '2022-08-11 23:17:01', '2022-08-11 23:17:01', NULL, NULL, '15.346712', '44.1843805', 0),
(85, '207', 'الاساسيس', 'Home', '76QJ+6MR, Sana\'a, Yemen', 'Home', '+967772765', '+967772765421', '2022-08-12 22:50:49', '2022-08-12 22:50:49', NULL, NULL, '15.2882472', '44.2317567', 0),
(86, '207', 'الاساسيس', 'Home', '76QJ+6MR, Sana\'a, Yemen', 'Home', '+967772765', '+967772765421', '2022-08-12 22:51:24', '2022-08-12 22:51:24', NULL, NULL, '15.2882478', '44.2318005', 0),
(87, '207', 'الاساسيس', 'Home', '76QJ+6MR, Sana\'a, Yemen', 'Home', '+967772765', '+967772765421', '2022-08-12 22:55:49', '2022-08-12 22:55:49', NULL, NULL, '15.2882533', '44.2317165', 0),
(88, '212', 'الاساسيس', 'Home', 'نC544+8XM, SH23, Sana\'a, Yemen', 'Home', '+967774319', '+967774319232', '2022-08-13 05:31:10', '2022-08-13 05:31:10', NULL, NULL, '15.4059503', '44.1581696', 0),
(89, '213', 'الاساسيس', 'Home', '86HH+CM9، صنعاء‎،، Yemen', 'Home', '+967773177', '+967773177210', '2022-08-13 05:55:11', '2022-08-13 05:55:11', NULL, NULL, '15.3283118', '44.2287959', 0),
(90, '218', 'الاساسيس', 'Home', 'عمارة فارس زعوري، الكيبنية، Yemen', 'Home', '+967734146', '+967734146791', '2022-08-14 05:59:15', '2022-08-14 05:59:15', NULL, NULL, '43.24930310000001', '14.7003893', 0),
(91, '223', 'الاساسيس', 'Home', '86QH+M7Q, Sana\'a, Yemen', 'Home', '+967772443', '+967772443334', '2022-08-15 00:42:44', '2022-08-15 00:42:44', NULL, NULL, '15.3393295', '44.2285922', 0),
(92, '221', 'الاساسيس', 'Home', '85PX+WPQ, Sana\'a, Yemen', 'Home', '+967711594', '+967711594324', '2022-08-15 01:41:01', '2022-08-15 01:41:01', NULL, NULL, '15.3374511', '44.1994598', 0),
(93, '225', 'الاساسيس', 'Home', 'FXHX+PX6, Haz, Yemen', 'Home', '+967776028', '+967776028892', '2022-08-15 03:25:58', '2022-08-15 03:25:58', NULL, NULL, '15.4787013', '44.0003611', 0),
(94, '227', 'الاساسيس', 'Home', 'MW5V+H8Q, \'Amran, Yemen', 'Home', '+967777705', '+967777705561', '2022-08-15 05:15:09', '2022-08-15 05:15:09', NULL, NULL, '15.6595517', '43.9427955', 0),
(95, '228', 'الاساسيس', 'Home', 'مدينة عدن الجديدة،، RWV6+8W8، بئرأحمد،، Yemen', 'Home', '+967733115', '+967733115937', '2022-08-15 07:12:04', '2022-08-15 07:12:04', NULL, NULL, '12.8441684', '44.9120066', 0),
(96, '228', 'الاساسيس', 'Home', 'مدينة عدن الجديدة،، RWV6+8W8، بئرأحمد،، Yemen', 'Home', '+967733115', '+967733115937', '2022-08-15 07:14:59', '2022-08-15 07:14:59', NULL, NULL, '12.8441822', '44.9120197', 0),
(97, '231', 'الاساسيس', 'Home', 'QXQ5+J5P, Al Hudaydah, Yemen', 'Home', '+967734806', '+967734806561', '2022-08-15 19:09:04', '2022-08-15 19:09:04', NULL, NULL, '14.7886346', '42.9584825', 0),
(98, '233', 'الاساسيس', 'Home', '3MR8+6XF, Damt, Yemen', 'Home', '+967777782', '+967777782210', '2022-08-15 21:23:41', '2022-08-15 21:23:41', NULL, NULL, '14.0905695', '44.6675672', 0),
(99, '233', 'الاساسيس', 'Home', '3MR8+6XF, Damt, Yemen', 'Home', '+967777782', '+967777782210', '2022-08-15 21:26:09', '2022-08-15 21:26:09', NULL, NULL, '14.0905711', '44.6675659', 0),
(100, '234', 'الاساسيس', 'Home', 'صنعاء، شارع القاهرة الرئيسي جوار فرع بنك الكريمي امام عمارة الحاشدي', 'Home', '+967772568', '+967772568065', '2022-08-16 00:37:58', '2022-08-16 00:37:58', NULL, NULL, '15.3698186', '44.1986813', 0),
(101, '238', 'الاساسيس', 'Home', 'Q7XR+2X9، معبر،، Yemen', 'Home', '+967772134', '+967772134039', '2022-08-16 16:56:40', '2022-08-16 16:56:40', NULL, NULL, '14.7979869', '44.293043', 0),
(102, '239', 'الاساسيس', 'Home', '96C7+8PM, A5, صنعاء‎،، Yemen', 'Home', '+967774158', '+967774158866', '2022-08-17 02:32:05', '2022-08-17 02:32:05', NULL, NULL, '15.3705681', '44.2142792', 0),
(103, '241', 'الاساسيس', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'Home', '+967701000', '+967701000040', '2022-08-17 02:43:01', '2022-08-17 02:43:01', NULL, NULL, '15.2788776', '44.2196225', 0),
(104, '164', 'الاساسيس', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'Home', '+967777363', '+967777363554', '2022-08-17 04:35:04', '2022-08-17 04:35:04', NULL, NULL, '15.27888', '44.2196208', 0),
(105, '164', 'الاساسيس', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'Home', '+967777363', '+967777363554', '2022-08-17 05:03:44', '2022-08-17 05:03:44', NULL, NULL, '15.2788796', '44.219621', 0),
(106, '242', 'الاساسيس', 'Home', 'PXXR+JR \'Amran, Yemen', 'Home', '+967776120', '+967776120963', '2022-08-17 11:55:47', '2022-08-17 11:55:47', NULL, NULL, '15.7490606', '43.9920849', 0),
(107, '246', 'الاساسيس', 'Home', '85RH+3G3, Sana\'a, Yemen', 'Home', '+967773962', '+967773962773', '2022-08-17 22:42:20', '2022-08-17 22:42:20', NULL, NULL, '15.3403105', '44.1787589', 0),
(108, '241', 'الاساسيس', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'Home', '+967701000', '+967701000040', '2022-08-17 23:31:47', '2022-08-17 23:31:47', NULL, NULL, '15.2788799', '44.2196208', 0),
(109, '247', 'الاساسيس', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'Home', '+967777363', '+967777363554', '2022-08-18 00:28:51', '2022-08-18 00:28:51', NULL, NULL, '15.27888', '44.2196205', 0),
(110, '248', 'الاساسيس', 'Home', 'شارع الرقاص، صنعاء‎،، 955P+33V, Sana\'a, Yemen', 'Home', '+967778977', '+967778977733', '2022-08-18 14:00:27', '2022-08-18 14:00:27', NULL, NULL, '15.3577767', '44.185209', 0),
(111, '249', 'الاساسيس', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'Home', '+967777363', '+967777363554', '2022-08-19 01:57:31', '2022-08-19 01:57:31', NULL, NULL, '15.2789049', '44.2196234', 0),
(112, '249', 'الاساسيس', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'Home', '+967777363', '+967777363554', '2022-08-19 02:07:10', '2022-08-19 02:07:10', NULL, NULL, '15.2789049', '44.2196234', 0),
(113, '251', 'الاساسيس', 'Home', 'بيت بوس', 'Home', '+967772568', '+967772568728', '2022-08-19 05:39:19', '2022-08-19 05:39:19', NULL, NULL, '0.0', '0.0', 0),
(114, '253', 'الاساسيس', 'Home', 'شارع تعز، صنعاء‎،، 86J9+8C7, Sana\'a, Yemen', 'Home', '+967733258', '+967733258378', '2022-08-19 05:42:55', '2022-08-19 05:42:55', NULL, NULL, '15.330899', '44.2184525', 0),
(115, '256', 'الاساسيس', 'Home', 'النصر جوار الكليه الحربي علا شارع 20،, صنعاء‎، Yemen', 'Home', '+967773663', '+967773663636', '2022-08-19 07:23:54', '2022-08-19 07:23:54', NULL, NULL, '15.410542', '44.2231261', 0),
(116, '257', 'الاساسيس', 'Home', 'سوق الروني امام قاهر الاسعار', 'Home', '+967773699', '+967773699500', '2022-08-19 13:59:57', '2022-08-19 13:59:57', NULL, NULL, '0.0', '0.0', 0),
(117, '23', 'الاساسيس', 'Home', '86HH+7W9، صنعاء‎،، Yemen', 'Home', '+967714040', '+967714040704', '2022-08-19 19:19:32', '2022-08-19 19:19:32', NULL, NULL, '15.3281801', '44.2299521', 0),
(118, '261', 'الاساسيس', 'Home', 'شارع تعز', 'Home', '+967773311', '+967773311650', '2022-08-20 02:54:16', '2022-08-20 02:54:16', NULL, NULL, '0.0', '0.0', 0),
(119, '262', 'الاساسيس', 'Home', 'صنعاء شملان', 'Home', '+967770616', '+967770616146', '2022-08-20 03:56:24', '2022-08-20 03:56:24', NULL, NULL, '0.0', '0.0', 0),
(120, '262', 'الاساسيس', 'Home', 'C536+96W, Sana\'a, Yemen', 'Home', '+967770616', '+967770616146', '2022-08-20 05:39:01', '2022-08-20 05:39:01', NULL, NULL, '15.4034971', '44.1610745', 0),
(121, '265', 'الاساسيس', 'Home', '95Q5+MMF, Wadi Zahr Rd (Madbah), صنعاء‎،، Yemen', 'Home', '+967775537', '+967775537146', '2022-08-21 18:46:54', '2022-08-21 18:46:54', NULL, NULL, '15.3892186', '44.1593959', 0),
(122, '139', 'ح سواح', 'Home', '75W6+J8 Sana\'a, Yemen', 'Home', '+967774421', '+967774421066', '2022-08-21 22:54:59', '2022-08-21 22:54:59', NULL, NULL, '15.2965374', '44.1607596', 0),
(123, '268', 'الاساسيس', 'Home', 'الشاعري للتجارة والاستيراد', 'Home', '+967772441', '+967772441214', '2022-08-24 00:29:02', '2022-08-24 00:29:02', NULL, NULL, '0.0', '0.0', 0),
(124, '269', 'الاساسيس', 'Home', 'صعده الشارع العام', 'Home', '+967716606', '+967716606606', '2022-08-24 21:10:54', '2022-08-24 21:10:54', NULL, NULL, '0.0', '0.0', 0),
(125, '271', 'الاساسيس', 'Home', 'ذمار حاره فرح', 'Home', '+967777601', '+967777601800', '2022-08-25 05:35:25', '2022-08-25 05:35:25', NULL, NULL, '0.0', '0.0', 0),
(126, '274', 'الاساسيس', 'Home', 'شارع 11، صنعاء‎،، Sana\'a, Yemen', 'Home', '+967733495', '+967733495424', '2022-08-25 20:36:51', '2022-08-25 20:36:51', NULL, NULL, '15.327534', '44.1947934', 0),
(127, '275', 'الاساسيس', 'Home', 'FQ6M+MG بيت قطينه، Yemen', 'Home', '+967٧٧٥٧٢٠', '+967٧٧٥٧٢٠٧٤٩', '2022-08-25 21:03:32', '2022-08-25 21:03:32', NULL, NULL, '15.4617369', '43.7838189', 0),
(128, '275', 'الماوري عبدالله محمد صالح الماوري', 'Home', 'FQ6M+MG بيت قطينه، Yemen  الماوره', 'Home', '+967٧٧٥٧٢٠', '+967٧٧٥٧٢٠٧٤٩', '2022-08-25 21:08:38', '2022-08-25 21:08:38', NULL, NULL, '15.4617369', '43.7838189', 0),
(129, '275', 'الماوري عبدالله محمد صالح الماوري', 'Home', 'CQQJ+QF بيت قطينه، Yemen', 'Home', '+967٧٧٥٧٢٠', '+967٧٧٥٧٢٠٧٤٩', '2022-08-25 21:51:18', '2022-08-25 21:51:18', NULL, NULL, '15.4394785', '43.7811277', 0),
(130, '212', 'الاساسيس', 'Home', 'شملان', 'Home', '+967774319', '+967774319232', '2022-08-26 23:40:34', '2022-08-26 23:40:34', NULL, NULL, '0.0', '0.0', 0),
(131, '212', 'الاساسيس', 'Home', 'شملان', 'Home', '+967774319', '+967774319232', '2022-08-26 23:51:29', '2022-08-26 23:51:29', NULL, NULL, '0.0', '0.0', 0),
(132, '278', 'الاساسيس', 'Home', 'GSMB2382، 2382 ابو حجر الاسفل 50، 6525، ابو حجر الاسفل 86788, Saudi Arabia', 'Home', '+966507325', '+966507325968', '2022-08-27 10:10:33', '2022-08-27 10:10:33', NULL, NULL, '16.6755503', '43.010238', 0),
(133, '212', 'الاساسيس', 'Home', 'شملان', 'Home', '+967774319', '+967774319232', '2022-08-27 13:11:55', '2022-08-27 13:11:55', NULL, NULL, '0.0', '0.0', 0),
(134, '279', 'الاساسيس', 'Home', 'الصالع', 'Home', '+967771621', '+967771621883', '2022-08-27 23:03:47', '2022-08-27 23:03:47', NULL, NULL, '0.0', '0.0', 0),
(135, '279', 'الاساسيس', 'Home', 'RVM7+MHM، الشعيب، Yemen', 'Home', '+967771621', '+967771621883', '2022-08-27 23:05:18', '2022-08-27 23:05:18', NULL, NULL, '13.8350194', '44.8639291', 0),
(136, '279', 'الاساسيس', 'Home', 'RVM7+MHM، الشعيب، Yemen', 'Home', '+967771621', '+967771621883', '2022-08-27 23:07:10', '2022-08-27 23:07:10', NULL, NULL, '13.8350238', '44.8639266', 0),
(137, '266', 'بقالة التعارن صالح', 'Home', 'تعز، Yemen', 'Home', '+967776077', '+967776077992', '2022-08-29 01:43:37', '2022-08-29 01:43:37', NULL, NULL, '44.0177989', '13.5775886', 0),
(138, '281', 'الاساسيس', 'Home', 'Sana\'a', 'Home', '+967770006', '+967770006791', '2022-08-29 04:09:34', '2022-08-29 04:09:34', NULL, NULL, '0.0', '0.0', 0),
(139, '281', 'الاساسيس', 'Home', '76J7+GQ5, Sana\'a, Yemen', 'Home', '+967770006', '+967770006791', '2022-08-30 14:25:03', '2022-08-30 14:25:03', NULL, NULL, '15.2811322', '44.2146539', 0),
(140, '286', 'الاساسيس', 'Home', 'بيت معياد، صنعاء‎،، 86CH+F5H, Sana\'a, Yemen', 'Home', '+967733361', '+967733361085', '2022-09-01 16:51:08', '2022-09-01 16:51:08', NULL, NULL, '15.3210586', '44.2282033', 0),
(141, '290', 'الاساسيس', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'Home', '+967779937', '+967779937588', '2022-09-01 22:12:21', '2022-09-01 22:12:21', NULL, NULL, '15.2789258', '44.2195893', 0),
(142, '294', 'الاساسيس', 'Home', 'تعز، Yemen', 'Home', '+967733097', '+967733097472', '2022-09-02 05:32:19', '2022-09-02 05:32:19', NULL, NULL, '44.0177989', '13.5775886', 0),
(143, '294', 'الاساسيس', 'Home', 'H2G4+G3V, Taizz, Yemen', 'Home', '+967733097', '+967733097472', '2022-09-02 05:33:51', '2022-09-02 05:33:51', NULL, NULL, '13.5766203', '44.0051956', 0),
(144, '295', 'الاساسيس', 'Home', 'اون تايم مول، Sana\'a, Yemen', 'Home', '+967777250', '+967777250228', '2022-09-02 05:35:48', '2022-09-02 05:35:48', NULL, NULL, '44.17312489999999', '15.375913', 0),
(145, '296', 'الاساسيس', 'Home', 'بيت الفقيه', 'Home', '+967776189', '+967776189232', '2022-09-02 06:04:00', '2022-09-02 06:04:00', NULL, NULL, '0.0', '0.0', 0),
(147, '312', 'الاساسيس', 'Home', 'سعوان', 'Home', '+967770714', '+967770714794', '2022-09-03 17:51:40', '2022-09-03 17:51:40', NULL, NULL, '0.0', '0.0', 0),
(148, '317', 'الاساسيس', 'Home', '80, صنعاء‎،، Sana\'a, Yemen', 'Home', '+967779229', '+967779229922', '2022-09-04 06:02:20', '2022-09-04 06:02:20', NULL, NULL, '15.3994454', '44.1693938', 0),
(149, '319', 'الاساسيس', 'Home', '96C4+493 جسر جولة سباء، شارع القاهرة، صنعاء‎،، Sana\'a, Yemen', 'Home', '+967772258666', '+967772258666', '2022-09-06 03:00:23', '2022-09-06 03:00:23', NULL, NULL, '15.3703685', '44.2059044', 0),
(150, '323', 'الاساسيس', 'Home', 'شارع24، السبل، إب،، Ibb, Yemen', 'Home', '+967702070230', '+967702070230', '2022-09-07 02:09:02', '2022-09-07 02:09:02', NULL, NULL, '13.9753165', '44.1502199', 0),
(151, '157', 'الاساسيس', 'Home', '64G8+6XH, At Turbah, Yemen', 'Home', '+967771359378', '+967771359378', '2022-09-07 10:23:40', '2022-09-07 10:23:40', NULL, NULL, '13.2255029', '44.1173827', 0),
(152, '324', 'الاساسيس', 'Home', '79VJ+HG4، يريم،، Yemen', 'Home', '+967777377367', '+967777377367', '2022-09-07 15:02:43', '2022-09-07 15:02:43', NULL, NULL, '14.2939177', '44.3813359', 0),
(153, '328', 'الاساسيس', 'Home', 'جلوبال للتأمين، Main Street, الرئيسي، Yemen', 'Home', '+967774313550', '+967774313550', '2022-09-09 22:56:06', '2022-09-09 22:56:06', NULL, NULL, '45.01640759999999', '12.7908567', 0),
(154, '329', 'الاساسيس', 'Home', '95XC+WC6, Sana\'a, Yemen', 'Home', '+967775004144', '+967775004144', '2022-09-10 04:26:37', '2022-09-10 04:26:37', NULL, NULL, '15.3996644', '44.1707445', 0),
(155, '223', 'اللا', 'Home', '86QH+M7Q, Sana\'a, Yemen', 'Home', '+967772443334', '+967772443334', '2022-09-14 06:27:01', '2022-09-14 06:27:01', NULL, NULL, '15.3393546', '44.2285531', 0),
(156, '333', 'الاساسيس', 'Home', 'البليلي', 'Home', '+967777390115', '+967777390115', '2022-09-17 07:05:52', '2022-09-17 07:05:52', NULL, NULL, '0.0', '0.0', 0),
(158, '342', 'الاساسيس', 'Home', 'QODA2743، 2743 التجاره، 6776، حي قصر بن عقيل، Ar Rass 58825, Saudi Arabia', 'Home', '+966507340617', '+966507340617', '2022-10-12 09:22:23', '2022-10-12 09:22:23', NULL, NULL, '25.8424651', '43.3670712', 0),
(159, '249', 'الاساسيس', 'Home', 'جولة بيت بوس برج المجد الدور السابع شقه رقم(١٧، Sana\'a, Yemen', 'Home', '+967777363554', '+967777363554', '2022-10-12 23:09:28', '2022-10-12 23:09:28', NULL, NULL, '15.2789188', '44.2196011', 0),
(160, '346', 'الاساسيس', 'Home', '18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-13 00:25:17', '2022-10-13 00:25:17', NULL, NULL, '29.9839128', '30.9342861', 0),
(161, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-13 14:56:34', '2022-10-13 14:56:34', NULL, NULL, '29.9839512', '30.9342949', 0),
(162, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-13 15:11:30', '2022-10-13 15:11:30', NULL, NULL, '29.9839145', '30.9342902', 0),
(163, '348', 'الاساسيس', 'Home', 'العاشر من رمضان', 'Home', '+201116359075', '+201116359075', '2022-10-13 15:12:20', '2022-10-13 15:12:20', NULL, NULL, '0.0', '0.0', 0),
(165, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-14 02:17:39', '2022-10-14 02:17:39', NULL, NULL, '29.9839206', '30.9343044', 0),
(166, '348', 'الكريم Kareem', 'Home', 'Cairo, Egypt', 'Home', '+201116359075', '+201116359075', '2022-10-15 06:44:04', '2022-10-15 06:44:04', NULL, NULL, '31.2357116', '30.0444196', 0),
(167, '348', 'الكريم Kareem', 'Home', 'Alexandria', 'Home', '+201116359075', '+201116359075', '2022-10-15 06:45:07', '2022-10-15 06:45:07', NULL, NULL, '31.2357116', '30.0444196', 0),
(168, '353', 'الاساسيس', 'Home', '76VX+3PR، شارع تعز، Sana\'a, Yemen', 'Home', '+967717222357', '+967717222357', '2022-10-15 08:44:18', '2022-10-15 08:44:18', NULL, NULL, '15.2932244', '44.2490112', 0),
(169, '346', 'العبد عبد الله', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-15 19:14:11', '2022-10-15 19:14:11', NULL, NULL, '29.983992023535546', '30.934238769114017', 0),
(171, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-16 04:48:56', '2022-10-16 04:48:56', NULL, NULL, '29.9839196', '30.9342898', 0),
(172, '366', 'الاساسيس', 'Home', 'القادسية، صنعاء‎،، 866J+5Q6, Sana\'a, Yemen', 'Home', '+967771554666', '+967771554666', '2022-10-16 21:43:20', '2022-10-16 21:43:20', NULL, NULL, '15.3105509', '44.2318064', 0),
(176, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-18 18:32:28', '2022-10-18 18:32:28', NULL, NULL, '29.9839366', '30.9342717', 0),
(177, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-18 22:21:40', '2022-10-18 22:21:40', NULL, NULL, '29.9839279', '30.9343019', 0),
(178, '346', 'الاساسيس', 'Home', '18 Gamal Abd El-Nasir, Al Giza Desert, Giza Governorate 3232202, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-19 01:11:10', '2022-10-19 01:11:10', NULL, NULL, '29.9839121', '30.9342829', 0),
(179, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-19 01:47:54', '2022-10-19 01:47:54', NULL, NULL, '29.9839723', '30.9342646', 0),
(180, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-19 02:01:33', '2022-10-19 02:01:33', NULL, NULL, '29.9839308', '30.934311', 0),
(181, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-19 02:55:10', '2022-10-19 02:55:10', NULL, NULL, '29.9839214', '30.9342864', 0),
(182, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-19 03:19:56', '2022-10-19 03:19:56', NULL, NULL, '29.983927', '30.9342947', 0),
(183, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-19 03:30:11', '2022-10-19 03:30:11', NULL, NULL, '29.98392', '30.9342789', 0),
(189, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-19 04:37:31', '2022-10-19 04:37:31', NULL, NULL, '29.9839239', '30.9343186', 0),
(190, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-19 04:48:22', '2022-10-19 04:48:22', NULL, NULL, '29.9839538', '30.9342846', 0),
(191, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-19 05:13:45', '2022-10-19 05:13:45', NULL, NULL, '29.9839369', '30.9343062', 0),
(193, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-19 19:05:54', '2022-10-19 19:05:54', NULL, NULL, '29.9839245', '30.9343142', 0),
(195, '375', 'الاساسيس', 'Home', 'إب', 'Home', '+967777550061', '+967777550061', '2022-10-20 01:45:56', '2022-10-20 01:45:56', NULL, NULL, '0.0', '0.0', 0),
(196, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-20 02:38:01', '2022-10-20 02:38:01', NULL, NULL, '29.9839376', '30.9342908', 0),
(197, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-20 02:51:11', '2022-10-20 02:51:11', NULL, NULL, '29.9839222', '30.9342989', 0),
(198, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-20 03:11:00', '2022-10-20 03:11:00', NULL, NULL, '29.9839253', '30.934311', 0),
(201, '364', 'الرائد كريم', 'Home', 'العاشر من رمضان، Egypt', 'Home', '+201552606425', '+201552606425', '2022-10-21 16:02:14', '2022-10-21 16:02:14', NULL, NULL, '30.29266538402099', '31.742343418300155', 0),
(202, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-21 22:45:29', '2022-10-21 22:45:29', NULL, NULL, '29.9839122', '30.9343107', 0),
(203, '346', 'الاساسيس', 'Home', 'XWMM+RJ9, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-22 00:33:02', '2022-10-22 00:33:02', NULL, NULL, '29.9842151', '30.9340768', 0),
(204, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-22 00:41:57', '2022-10-22 00:41:57', NULL, NULL, '29.9839441', '30.9342526', 0),
(205, '346', 'الاساسيس', 'Home', '19 Street 4, Al Giza Desert, Giza Governorate 3232202, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-22 00:52:18', '2022-10-22 00:52:18', NULL, NULL, '29.9839072', '30.9343126', 0),
(206, '364', 'الرائد كريم', 'Home', 'مول العرب، Al Giza Desert, Egypt', 'Home', '+201552606425', '+201552606425', '2022-10-22 02:53:37', '2022-10-22 02:53:37', NULL, NULL, '30.006585823948694', '30.97539559006691', 0),
(207, '364', 'الرائد كريم', 'Home', '7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt', '7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Gove', '+201552606425', '+201552606425', '2022-10-23 23:39:17', '2022-10-23 23:39:17', NULL, NULL, '30.298847120255697', '31.713444963097572', 0),
(208, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-24 02:10:09', '2022-10-24 02:10:09', NULL, NULL, '29.9839391', '30.9342453', 0),
(209, '364', 'الرائد كريم', 'Home', '7PX7+PJW, 10th of Ramadan City 1, Ash Sharqia Governorate 7061310, Egypt', 'Home', '+201552606425', '+201552606425', '2022-10-24 18:37:25', '2022-10-24 18:37:25', NULL, NULL, '30.298845672859102', '31.713422164320946', 0),
(210, '364', 'الرائد كريم', 'Home', 'مدينة الشروق، El Shorouk, Egypt', 'Home', '+201552606425', '+201552606425', '2022-10-24 19:05:31', '2022-10-24 19:05:31', NULL, NULL, '31.6285105', '30.1418839', 0),
(211, '364', 'الرائد كريم', 'Home', 'السلوم', 'Home', '+201552606425', '+201552606425', '2022-10-24 19:06:18', '2022-10-24 19:06:18', NULL, NULL, '30.29884798869366', '31.71342585235834', 0),
(212, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-25 00:13:37', '2022-10-25 00:13:37', NULL, NULL, '29.9839231', '30.9343112', 0),
(213, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-25 00:19:46', '2022-10-25 00:19:46', NULL, NULL, '29.9839274', '30.9343046', 0),
(214, '346', 'الاساسيس', 'Home', 'XWMM+MQH, Al Giza Desert, Giza Governorate 3230924, Egypt', 'Home', '+201118522180', '+201118522180', '2022-10-25 03:48:32', '2022-10-25 03:48:32', NULL, NULL, '29.9839174', '30.9343324', 0),
(215, '364', 'الرائد كريم', 'Home', 'جده', 'Home', '+201552606425', '+201552606425', '2022-10-26 03:49:38', '2022-10-26 03:49:38', NULL, NULL, '15.55217400357018', '48.51664088666439', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'شاحنات الشركة', '5.00', 'يومان', 1, '2022-06-07 04:19:11', '2022-06-07 04:19:11'),
(9, 1, 'admin', 'المقطري', '8.62', '2', 1, '2022-06-07 04:19:43', '2022-06-07 04:19:43'),
(10, 1, 'admin', 'راحه', '2.59', '2', 1, '2022-06-07 04:19:54', '2022-06-07 04:19:54'),
(11, 1, 'admin', 'سيتم استلامها من محلكم', '0.00', 'يومان', 1, '2022-06-07 06:35:34', '2022-06-07 06:35:34'),
(12, 11, 'seller', 'طلبية اكثر من 100 الف', '17.24', '1', 1, '2022-08-29 00:30:30', '2022-08-29 00:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_types`
--

INSERT INTO `shipping_types` (`id`, `seller_id`, `shipping_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'order_wise', '2022-05-26 06:06:31', '2022-05-26 06:06:31'),
(2, 0, 'product_wise', '2022-06-26 21:32:27', '2022-08-28 02:17:18'),
(3, 11, 'order_wise', '2022-08-29 00:30:04', '2022-08-29 00:30:10'),
(4, 79, 'order_wise', '2022-11-15 08:48:01', '2022-11-15 09:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `seller_parent` bigint(20) DEFAULT 0,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_latitude` float DEFAULT NULL,
  `address_longitude` float DEFAULT NULL,
  `contact` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `zone_id` bigint(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_delivery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `seller_parent`, `name`, `address`, `address_latitude`, `address_longitude`, `contact`, `image`, `zone_id`, `created_at`, `updated_at`, `banner`, `default_delivery`) VALUES
(1, 1, 0, 'yemen', 'sanaa, yemen\r\nyemen', NULL, NULL, '777363554', '2022-05-25-628e0793d3d7d.png', NULL, '2022-05-25 14:40:19', '2022-05-25 14:40:19', '2022-05-25-628e0793d51f8.png', NULL),
(2, 2, 0, 'المجهلي للتجاره العامة', 'sanaa, yemen\r\nyemen', NULL, NULL, '967777363555', '2022-06-07-629e941f5d470.png', NULL, '2022-06-07 06:56:15', '2022-06-07 06:56:15', '2022-06-07-629e941f5d80b.png', NULL),
(3, 3, 0, 'اليمن', 'صنعاء', NULL, NULL, '00967771014411', '2022-06-11-62a4f19c8fc89.png', NULL, '2022-06-12 02:48:44', '2022-06-12 02:48:44', '2022-06-11-62a4f19c90b1f.png', NULL),
(4, 4, 0, 'Qaderfood', 'Sanaa', NULL, NULL, '773333836', 'def.png', NULL, '2022-06-13 20:41:28', '2022-06-13 20:41:28', 'def.png', NULL),
(5, 5, 0, 'شركة جلب اخوان للتجارة والستثمار', 'صنعاء', NULL, NULL, '773331050', '2022-06-13-62a73fb1582d4.png', NULL, '2022-06-13 20:46:25', '2022-06-13 20:46:25', '2022-06-13-62a73fb1585cc.png', NULL),
(6, 6, 0, 'حفظ الله حسن وإخوانه للتجارة', 'صنعاء', NULL, NULL, '773772222', '2022-06-13-62a74ca1bdc12.png', NULL, '2022-06-13 21:41:37', '2022-06-13 21:41:37', '2022-06-13-62a74ca1c0824.png', NULL),
(7, 7, 0, 'شركة المجهلي للتجارة المحدودة', 'صنعاء', NULL, NULL, '01540087', '2022-06-13-62a74e87618e7.png', NULL, '2022-06-13 21:49:43', '2022-06-13 21:49:43', '2022-06-13-62a74e8762045.png', NULL),
(8, 8, 0, 'شركة الروضة للتجارة العامة والتوكيلات', 'صنعاء', NULL, NULL, '01282412', '2022-06-13-62a74f5b53500.png', NULL, '2022-06-13 21:53:15', '2022-06-13 21:53:15', '2022-06-13-62a74f5b5439c.png', NULL),
(9, 9, 0, 'نادفوود، شركة الألبان والاغذية الوطنية', 'صنعاء', NULL, NULL, '775444777', '2022-06-13-62a751589e3ee.png', NULL, '2022-06-13 22:01:44', '2022-06-13 22:01:44', '2022-06-13-62a751589f9bc.png', NULL),
(10, 10, 0, 'شركة بي إم سي المحضار وشركاؤه للتجارة المحدودة', 'صنعاء', NULL, NULL, '5305420', '2022-06-13-62a75297e1aa9.png', NULL, '2022-06-13 22:07:03', '2022-06-13 22:07:03', '2022-06-13-62a75297e1da7.png', NULL),
(11, 11, 0, 'QADERFOOD', 'SANAA', NULL, NULL, '773333836', '2022-06-16-62ab88c5df072.png', NULL, '2022-06-17 02:47:17', '2022-06-17 02:47:17', '2022-06-16-62ab88c5e16ca.png', NULL),
(12, 12, 0, 'السنحاني لتجارة', 'الملعب', NULL, NULL, '775626237', 'def.png', NULL, '2022-07-16 22:12:12', '2022-07-16 22:12:12', 'def.png', NULL),
(13, 13, 0, 'شركة الروضة للتجارة العامة والتوكيلات', 'صنعاء‎، Yemen', NULL, NULL, '772233447', '2022-08-28-630b7887462ac.png', NULL, '2022-07-18 01:22:36', '2022-08-28 21:33:58', '2022-08-28-630b78876f2e6.png', NULL),
(14, 14, 0, 'حفظ الله حسن للتجارة والإستيراد', 'صنعاء', NULL, NULL, '773772222', '2022-07-17-62d4572d3a930.png', NULL, '2022-07-18 01:38:37', '2022-07-18 01:38:37', '2022-07-17-62d4572d3f4c3.png', NULL),
(15, 15, 0, 'شانع واولادة للتجارة', 'صعدة', NULL, NULL, '771765552', '2022-07-20-62d80b3fbdb42.png', NULL, '2022-07-20 21:03:43', '2022-07-20 21:03:43', '2022-07-20-62d80b3fc93d8.png', NULL),
(16, 16, 0, 'محلات محمد محمد المرح', 'صنعاء', NULL, NULL, '771500090', 'def.png', NULL, '2022-07-23 21:00:26', '2022-07-23 21:00:26', 'def.png', NULL),
(17, 17, 0, 'شركة الفجيحي للتجارة و التموينات المحدودة', 'صنعاء', NULL, NULL, '771944970', 'def.png', NULL, '2022-07-23 22:13:16', '2022-07-23 22:13:16', 'def.png', NULL),
(18, 18, 0, 'موسسة الغراسي للتجارة', 'صنعاء', NULL, NULL, '1683179', '2022-07-26-62e01e2d42313.png', NULL, '2022-07-27 00:02:37', '2022-07-27 00:02:37', '2022-07-26-62e01e2d436ee.png', NULL),
(19, 19, 0, 'شركة جلب اخوان للتجارة', 'صنعاء', NULL, NULL, '773333033', 'def.png', NULL, '2022-07-28 02:18:12', '2022-07-28 02:18:12', 'def.png', NULL),
(20, 20, 0, 'مجموعة شركات إخوان ثابت', 'صنعاء', NULL, NULL, '779300340', '2022-07-28-62e28c2fa89fe.png', NULL, '2022-07-28 20:16:31', '2022-07-28 20:16:31', '2022-07-28-62e28c2fa92ca.png', NULL),
(21, 21, 0, 'الحبيشي لاستيرادوتسويق الاغذية', 'صنعاء', NULL, NULL, '1234567', 'def.png', NULL, '2022-07-28 21:09:06', '2022-07-28 21:09:06', 'def.png', NULL),
(22, 22, 0, 'بيتي فود-شركة الخولاني', 'صتعاء', NULL, NULL, '774111466', 'def.png', NULL, '2022-07-28 21:13:42', '2022-07-28 21:13:42', 'def.png', NULL),
(23, 23, 0, 'الشركة اليمنية لصناعة الاغذيه الخفيفه', 'صنعاء', NULL, NULL, '770000506', '2022-07-28-62e29a62cb61a.png', NULL, '2022-07-28 21:17:06', '2022-07-28 21:17:06', '2022-07-28-62e29a62cba4d.png', NULL),
(24, 24, 0, 'شركة شارب للتجارة والتسويق', 'صنعائ', NULL, NULL, '1450930', '2022-07-28-62e29d10d290f.png', NULL, '2022-07-28 21:28:32', '2022-07-28 21:28:32', '2022-07-28-62e29d10d2f8c.png', NULL),
(25, 25, 0, 'مجموعة شركات هائل سعيد انعم', 'صنعاء', NULL, NULL, '42434001', '2022-07-28-62e2a08975d35.png', NULL, '2022-07-28 21:43:21', '2022-07-28 21:43:21', '2022-07-28-62e2a08976efb.png', NULL),
(26, 26, 0, 'شركة المنتاب اخوان للتجارة المحدودة', 'صنعاء', NULL, NULL, '776036666', '2022-07-28-62e2cc131acce.png', NULL, '2022-07-29 00:49:07', '2022-07-29 00:49:07', '2022-07-28-62e2cc135295b.png', NULL),
(27, 27, 0, 'شركة بن عوض النقيب', 'صنعاء', NULL, NULL, '77966661', '2022-07-30-62e53b198bccb.png', NULL, '2022-07-30 21:07:21', '2022-07-30 21:07:21', '2022-07-30-62e53b198ce9f.png', NULL),
(28, 28, 0, 'حيدر الجعدي للتجارة والاستيراد', 'صنعاء', NULL, NULL, '01222963', '2022-07-30-62e57bc6244ba.png', NULL, '2022-07-31 01:43:18', '2022-07-31 01:43:18', '2022-07-30-62e57bc625a10.png', NULL),
(29, 29, 0, 'شركة المجهلي للتجارة المحدودة', 'sanaa12345', NULL, NULL, '123456', 'def.png', NULL, '2022-08-02 00:09:57', '2022-08-02 00:09:57', 'def.png', NULL),
(30, 30, 0, 'شركة الصناعات المتنوعة ومواد التعبئة', 'صنعاء', NULL, NULL, '4218027', '2022-08-01-62e83776f28c8.png', NULL, '2022-08-02 03:28:39', '2022-08-02 03:28:39', '2022-08-01-62e83777000f0.png', NULL),
(31, 31, 0, 'سايكو - sico', 'صنعاء', NULL, NULL, '777259089', '2022-08-02-62e92ad14b407.png', NULL, '2022-08-02 20:46:57', '2022-08-02 20:46:57', '2022-08-02-62e92ad157788.png', NULL),
(32, 32, 0, 'الجوزي للتجارة العامة', 'صنعاء', NULL, NULL, '771014411', '2022-08-03-62ea80c5e73ac.png', NULL, '2022-08-03 21:05:58', '2022-08-03 21:05:58', '2022-08-03-62ea80c5eed38.png', NULL),
(33, 33, 0, 'مؤسسة الرجوي للتجارة العامة', 'صتعاء', NULL, NULL, '10255358', '2022-08-04-62ebff64bd77a.png', NULL, '2022-08-05 00:18:28', '2022-08-05 00:18:28', '2022-08-04-62ebff64bdba5.png', NULL),
(34, 34, 0, 'محمد عبدالوهاب الزبيري و اخيه', 'صنعاء', NULL, NULL, '240698', '2022-08-06-62ee6f6fe9642.png', NULL, '2022-08-06 20:41:03', '2022-08-06 20:41:03', '2022-08-06-62ee6f6feab86.png', NULL),
(35, 35, 0, 'جو برايم - Go Prime', 'صنعاء', NULL, NULL, '779888816', '2022-08-06-62ee89479b9bf.png', NULL, '2022-08-06 22:31:19', '2022-08-06 22:31:19', '2022-08-06-62ee89479e7f1.png', NULL),
(36, 36, 0, 'مجموعة الكبوس', 'صنعاء', NULL, NULL, '270800', '2022-08-07-62efeca31e609.png', NULL, '2022-08-07 23:47:31', '2022-08-07 23:47:31', '2022-08-07-62efeca31ecc0.png', NULL),
(37, 37, 0, 'شركة بن ربيع التجارية', 'صنعاء', NULL, NULL, '771222745', 'def.png', NULL, '2022-08-08 07:59:06', '2022-08-08 07:59:06', 'def.png', NULL),
(38, 38, 0, 'A&M Dent', 'صنعاء', NULL, NULL, '779400661', '2022-08-08-62f12c68c821f.png', NULL, '2022-08-08 22:31:52', '2022-08-08 22:31:52', '2022-08-08-62f12c68d5aa0.png', NULL),
(39, 39, 0, 'مياه حده', 'بيت بوس، Sana\'a, Yemen', NULL, NULL, '96777363555', '2022-08-08-62f140ed21daa.png', NULL, '2022-08-08 23:59:25', '2022-08-26 05:44:53', '2022-08-08-62f140ed24ab1.png', NULL),
(40, 40, 0, 'ﺷﺮﻛﺔ ﺣﻨﻈﻞ ﺇﺧﻮﺍﻥ ﻟﻠﺘﺠﺎﺭﺓ ﺍﻟﻌﺎﻣﺔ', 'صنعاء', NULL, NULL, '1612197', '2022-08-10-62f3cb153871f.png', NULL, '2022-08-10 22:13:25', '2022-08-10 22:13:25', '2022-08-10-62f3cb1538ae1.png', NULL),
(41, 41, 0, 'شركة يحيى سهيل وإخوانه للتجارة والاستثمار المحدودة', 'صنعاء', NULL, NULL, '01372663', '2022-08-15-62fa50a941972.png', NULL, '2022-08-15 20:56:57', '2022-08-15 20:56:57', '2022-08-15-62fa50a942712.png', NULL),
(42, 42, 0, 'شركة جلب للتجارة العامة والاستيراد المحدودة قاسم يحيى عبده جلب', 'صنعاء', NULL, NULL, '01601613', '2022-08-15-62fa940252fd2.png', NULL, '2022-08-16 01:44:18', '2022-08-16 01:44:18', '2022-08-15-62fa94025b617.png', NULL),
(43, 43, 0, 'مصنع الاغذية الخفيفة', 'صنعاء', NULL, NULL, '777400604', '2022-08-16-62fbfd0fcdac7.png', NULL, '2022-08-17 03:24:47', '2022-08-17 03:24:47', '2022-08-16-62fbfd0fd2c1b.png', NULL),
(44, 44, 0, 'KDD Yemen', 'sanaa', NULL, NULL, '773868752', '2022-08-17-62fc0b4df39f4.png', NULL, '2022-08-17 04:25:34', '2022-08-17 04:25:34', '2022-08-17-62fc0b4e03f60.png', NULL),
(45, 45, 0, 'شركة ميدو للصناعة والتجارة', 'صنعاء', NULL, NULL, '733441358', '2022-08-17-62fd436405f82.png', NULL, '2022-08-18 02:37:08', '2022-08-18 02:37:08', '2022-08-17-62fd4364075c4.png', NULL),
(46, 46, 0, 'شركة سهول كندة', 'صنعاء', NULL, NULL, '776800985', '2022-08-18-62fe8dce4f455.png', NULL, '2022-08-19 02:06:54', '2022-08-19 02:06:54', '2022-08-18-62fe8dce58325.png', NULL),
(47, 47, 0, 'شركة بي إم سي المحضار وشركاؤه للتجارة المحدودة', 'صنعاء', NULL, NULL, '05305420', '2022-08-18-62fe91eec1759.png', NULL, '2022-08-19 02:24:30', '2022-08-19 02:24:30', '2022-08-18-62fe91eec1a1b.png', NULL),
(49, 50, 39, 'Haddah Water - مياه حده-اليمني للتموينات', 'Yemen University, Sana\'a, Yemen', NULL, NULL, '777777777', '2022-08-18-62fe977c552d8.png', NULL, '2022-08-19 02:48:12', '2022-08-19 02:48:12', '2022-08-18-62fe977c557b0.png', NULL),
(56, 57, 18, 'موسسة الغراسي للتجارة-UG', 'صنعاء‎، Yemen', NULL, NULL, '777794438', '2022-08-19-62fecdcf8d544.png', NULL, '2022-08-19 06:39:59', '2022-11-30 08:08:49', '2022-08-19-62fecdcf8e218.png', NULL),
(57, 58, 16, 'محلات محمد محمد المرح-عفعهخح', 'صنعاء‎، Yemen', NULL, NULL, '777794438', '2022-08-21-63029a7d81f16.png', NULL, '2022-08-22 03:50:05', '2022-08-22 03:50:05', '2022-08-21-63029a7d82e58.png', NULL),
(58, 59, 16, 'محلات محمد محمد المرح-عصام', 'Yemen', NULL, NULL, 'عصام', '2022-08-21-63029b3ca6ee9.png', NULL, '2022-08-22 03:53:16', '2022-08-22 03:53:16', '2022-08-21-63029b3ca8fe7.png', NULL),
(59, 61, 16, 'محلات محمد محمد المرح-عصام', 'Yemen', NULL, NULL, '777794438', '2022-08-21-63029c2e4196a.png', NULL, '2022-08-22 03:57:18', '2022-08-22 03:57:18', '2022-08-21-63029c2e43325.png', NULL),
(60, 62, 0, 'بنك الشوكولاته', 'صنعاء', NULL, NULL, '776669901', '2022-08-23-63050c9e0b508.png', NULL, '2022-08-24 00:21:34', '2022-08-24 00:21:34', '2022-08-23-63050c9e2144f.png', NULL),
(64, 66, 39, 'مياه حده-المفلحي فرع الجنه', 'بيت بوس، شارع المحافضخ، Sana\'a, Yemen', NULL, NULL, '777363557', '2022-08-26-6308025b7ca40.png', NULL, '2022-08-26 06:14:35', '2022-08-26 06:14:35', '2022-08-26-6308025b7fbcc.png', NULL),
(65, 67, 39, 'مياه حده-اليمني للتموينات الاصلي', 'حدة Saudi Arabia', NULL, NULL, '777877788', '2022-08-26-630810826a6e9.png', NULL, '2022-08-26 07:14:58', '2022-08-26 07:14:58', '2022-08-26-630810826bb40.png', NULL),
(71, 75, 11, 'QADERFOOD-صنعاءughd', 'الحديدة، Yemen', NULL, NULL, '701000040', '2022-08-27-630a1e90e06c4.png', NULL, '2022-08-27 20:39:28', '2022-08-27 20:39:28', '2022-08-27-630a1e90e0a33.png', NULL),
(72, 76, 11, 'QADERFOOD-SANAA', 'عدن، Yemen', NULL, NULL, '779800010', '2022-08-27-630a7195f127e.png', NULL, '2022-08-28 02:33:42', '2022-08-28 02:33:42', '2022-08-27-630a719649ca7.png', NULL),
(73, 77, 0, 'LEGADOR', 'صنعاء', NULL, NULL, '711765656', '2022-09-05-6316056a0b536.png', NULL, '2022-09-05 21:19:22', '2022-09-05 21:19:22', '2022-09-05-6316056a0ce16.png', NULL),
(74, 78, 0, 'alihassen', 'sanaa', NULL, NULL, '777794438', '2022-09-26-6331d4c70e7e9.png', NULL, '2022-09-26 23:35:19', '2022-09-26 23:35:19', '2022-09-26-6331d4c70eb01.png', NULL),
(75, 83, 79, '-ادم جروب', 'Egypt', NULL, NULL, '012781000', '2022-11-01-636061ef8ca9e.png', NULL, '2022-11-01 10:01:51', '2022-11-01 10:01:51', '2022-11-01-636061ef8d1d2.png', NULL),
(76, 84, 0, 'احمد للتجارة', 'القاهرة', NULL, NULL, '0124663326', '2022-11-20-6379692a99c07.png', NULL, '2022-11-20 10:39:22', '2022-11-20 10:39:22', '2022-11-20-6379692a9a39e.png', NULL),
(77, 85, 0, 'ادم للتجارة', 'الجيزة', NULL, NULL, '0124663326', '2022-11-20-637969a976ddd.png', NULL, '2022-11-20 10:41:29', '2022-11-20 10:41:29', '2022-11-20-637969a97757b.png', NULL),
(78, 97, 57, '-يوسف', 'المنيل‎، Old Cairo, Egypt', NULL, NULL, '967777864', '2022-12-01-6387df1f30ba9.png', NULL, '2022-12-01 09:54:23', '2022-12-01 09:54:23', '2022-12-01-6387df1f3144d.png', NULL),
(79, 148, 148, 'ادم و شركائه', 'Cairo', NULL, NULL, '', 'def.png', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://www.w3schools.com/howto/howto_css_table_responsive.asp', 'fa fa-twitter', 0, 1, '2020-12-31 21:18:03', '2022-05-26 03:58:28'),
(2, 'linkedin', 'https://www.facebook.com/emdadalgomla/?ref=pages_you_manage', 'fa fa-linkedin', 1, 1, '2021-02-27 16:23:01', '2022-05-29 05:27:19'),
(3, 'google-plus', 'https://www.facebook.com/emdadalgomla/?ref=pages_you_manage', 'fa fa-google-plus-square', 0, 1, '2021-02-27 16:23:30', '2022-05-29 05:27:13'),
(4, 'pinterest', 'https://www.facebook.com/emdadalgomla/?ref=pages_you_manage', 'fa fa-pinterest', 0, 1, '2021-02-27 16:24:14', '2022-05-29 05:27:03'),
(5, 'instagram', 'https://www.facebook.com/emdadalgomla/?ref=pages_you_manage', 'fa fa-instagram', 0, 1, '2021-02-27 16:24:36', '2022-05-29 05:26:58'),
(6, 'facebook', 'https://www.facebook.com/emdadalgomla/?ref=pages_you_manage', 'fa fa-facebook', 0, 1, '2021-02-27 19:19:42', '2022-05-26 03:59:40');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`, `created_at`, `updated_at`) VALUES
(4077, '243', 'عدن', NULL, NULL),
(4078, '243', 'أبين', NULL, NULL),
(4079, '243', 'ذمار', NULL, NULL),
(4080, '243', 'حضرموت', NULL, NULL),
(4084, '243', 'إب', NULL, NULL),
(4085, '243', 'مأرب', NULL, NULL),
(4086, '243', 'أمانة العاصمة', NULL, NULL),
(4087, '243', 'صعدة', NULL, NULL),
(4088, '243', 'صنعاء', NULL, NULL),
(4089, '243', 'شبوة', NULL, NULL),
(4090, '243', 'تعز', NULL, NULL),
(4091, '243', 'البيضاء', NULL, NULL),
(4092, '243', 'الحديدة', NULL, NULL),
(4093, '243', 'الجوف', NULL, NULL),
(4094, '243', 'المهرة', NULL, NULL),
(4095, '243', 'المحويت', NULL, NULL),
(4125, '243', 'ريمة', NULL, NULL),
(4126, '243', 'سقطرى', NULL, NULL),
(4127, '243', 'لحج', NULL, NULL),
(4128, '243', 'الضالع', NULL, NULL),
(4130, '243', 'حجة', NULL, NULL),
(4131, '243', 'عمران', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subs_categories`
--

CREATE TABLE `subs_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `home_status` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subs_categories`
--

INSERT INTO `subs_categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `home_status`, `priority`, `created_at`, `updated_at`) VALUES
(10, 'زيت', 'zyt', '1669332040.jpg', 14, 1, NULL, NULL, '2022-11-25 10:20:40', '2022-11-25 10:20:40'),
(11, 'أرز', 'arz', '1669332908.jpg', 14, 1, NULL, NULL, '2022-11-25 10:35:08', '2022-11-25 10:35:08'),
(12, 'مكرونة ونودلز', 'mkron-onodlz', '1669333281.jpg', 14, 1, NULL, NULL, '2022-11-25 10:41:21', '2022-11-25 10:41:21'),
(13, 'معلبات', 'maalbat', '1669333361.jpg', 14, 1, NULL, NULL, '2022-11-25 10:42:41', '2022-11-25 10:42:41'),
(14, 'صلصة وبهارات', 'sls-obharat', '1669333552.jpg', 14, 1, NULL, NULL, '2022-11-25 10:45:52', '2022-11-25 10:45:52'),
(15, 'لوازم الخبز', 'loazm-alkhbz', '1669333650.jpg', 14, 1, NULL, NULL, '2022-11-25 10:47:30', '2022-11-25 10:47:30'),
(16, 'منتجات الألبان', 'mntgat-alalban', '1669333740.jpg', 14, 1, NULL, NULL, '2022-11-25 10:49:00', '2022-11-25 10:49:00'),
(17, 'مرقة وشوفان', 'mrk-oshofan', '1669334150.jpg', 14, 1, NULL, NULL, '2022-11-25 10:55:50', '2022-11-25 10:55:50'),
(18, 'بسكويت', 'bskoyt', '1669334225.jpg', 14, 1, NULL, NULL, '2022-11-25 10:57:05', '2022-11-25 10:57:05'),
(19, 'شكلاتة و حلويات', 'shklat-o-hloyat', '1669334464.jpg', 14, 1, NULL, NULL, '2022-11-25 11:01:05', '2022-11-25 11:01:05'),
(20, 'حبوب', 'hbob', '1669334792.jpg', 14, 1, NULL, NULL, '2022-11-25 11:06:32', '2022-11-25 11:06:32'),
(21, 'مشروبات طاقة', 'mshrobat-tak', '1669334919.jpg', 15, 1, NULL, NULL, '2022-11-25 11:08:39', '2022-11-25 11:08:39'),
(22, 'مشروبات غازية', 'mshrobat-ghazy', '1669334971.jpg', 15, 1, NULL, NULL, '2022-11-25 11:09:31', '2022-11-25 11:09:31'),
(23, 'عصائر', 'aasayr', '1669335031.jpg', 15, 1, NULL, NULL, '2022-11-25 11:10:31', '2022-11-25 11:10:31'),
(24, 'مشروبات الشعير', 'mshrobat-alshaayr', '1669335619.jpg', 15, 1, NULL, NULL, '2022-11-25 11:20:19', '2022-11-25 11:20:19'),
(25, 'سريعة التحضير', 'sryaa-althdyr', '1669335694.jpg', 15, 1, NULL, NULL, '2022-11-25 11:21:34', '2022-11-25 11:21:34'),
(26, 'ماء', 'maaa', '1669335828.jpg', 15, 1, NULL, NULL, '2022-11-25 11:23:48', '2022-11-25 11:23:48'),
(27, 'قهوة', 'kho', '1669335914.jpg', 15, 1, NULL, NULL, '2022-11-25 11:25:14', '2022-11-25 11:25:14'),
(28, 'شاي و قهوة مثلجة', 'shay-o-kho-mthlg', '1669335992.jpg', 15, 1, NULL, NULL, '2022-11-25 11:26:32', '2022-11-25 11:26:32'),
(29, 'شاي', 'shay', '1669336059.jpg', 15, 1, NULL, NULL, '2022-11-25 11:27:39', '2022-11-25 11:27:39'),
(30, 'رعاية الطفال', 'raaay-altfal', '1669336145.jpg', 16, 1, NULL, NULL, '2022-11-25 11:29:05', '2022-11-25 11:29:05'),
(31, 'منظفات', 'mnthfat', '1669336202.jpg', 16, 1, NULL, NULL, '2022-11-25 11:30:02', '2022-11-25 11:30:02'),
(32, 'منظفات البشرة', 'mnthfat-albshr', '1669336272.jpg', 16, 1, NULL, NULL, '2022-11-25 11:31:12', '2022-11-25 11:31:12'),
(33, 'العناية بالفم', 'alaanay-balfm', '1669336361.jpg', 16, 1, NULL, NULL, '2022-11-25 11:32:41', '2022-11-25 11:32:41'),
(34, 'العناية بالشعر', 'alaanay-balshaar', '1669336409.jpg', 16, 1, NULL, NULL, '2022-11-25 11:33:29', '2022-11-25 11:33:29'),
(35, 'مناديل', 'mnadyl', '1669336466.jpg', 16, 1, NULL, NULL, '2022-11-25 11:34:26', '2022-11-25 11:34:26'),
(36, 'النظافة الشخصية', 'alnthaf-alshkhsy', '1669336545.jpg', 16, 1, NULL, NULL, '2022-11-25 11:35:45', '2022-11-25 11:35:45'),
(37, 'عناية منزلية', 'aanay-mnzly', '1669336677.jpg', 16, 1, NULL, NULL, '2022-11-25 11:37:57', '2022-11-25 11:37:57');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `home_status` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `home_status` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_sub_categories`
--

INSERT INTO `sub_sub_categories` (`id`, `name`, `slug`, `icon`, `category_id`, `sub_category_id`, `position`, `home_status`, `priority`, `created_at`, `updated_at`) VALUES
(6, 'زيت دوار الشمس', 'zyt-doar-alshms', '1669343024.jpg', 14, 10, 0, 0, 0, '2022-11-25 13:23:44', '2022-11-25 13:23:44'),
(7, 'زيت جوز الهند وزيت الزيتون', 'zyt-goz-alhnd-ozyt-alzyton', '1669343106.jpg', 14, 10, 0, 0, 0, '2022-11-25 13:25:06', '2022-11-25 13:25:06'),
(8, 'حليب', 'hlyb', '1669468238.jpg', 14, 16, 0, 0, 0, '2022-11-26 14:10:38', '2022-11-26 14:10:38'),
(10, 'عصير', 'aasyr', '1673011050.jpg', 15, 23, 0, 0, 0, '2023-01-07 00:17:30', '2023-01-07 00:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `customer_id`, `subject`, `type`, `priority`, `description`, `reply`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'ffc', 'Website Problem', 'low', 'fcc', NULL, 'open', '2022-05-25 20:43:07', '2022-06-21 02:26:27'),
(2, 13, 'ناا', 'Website Problem', 'low', 'ناا', NULL, 'pending', '2022-07-03 02:20:21', '2022-07-03 02:20:21'),
(3, 12, 'غات', 'مشكلة في الطلب', 'low', 'ةوو', NULL, 'pending', '2022-08-02 20:55:56', '2022-08-02 20:55:56'),
(4, 12, 'الرل', 'مشكلة في التوصيل', 'low', 'الة', NULL, 'pending', '2022-08-02 20:56:14', '2022-08-02 20:56:14'),
(5, 136, 'التطبيق ذي يعلق', 'مشكلة في التطبيق', 'low', 'التطبيق ابحث عن اي حاجه مايطلعهش و الما ادخل تصنيفات مايطلعش حاجه طبعا النت حقي فور جي', NULL, 'pending', '2022-08-06 03:53:56', '2022-08-06 03:53:56'),
(6, 188, 'العنوان', 'سؤال عام', 'low', 'اين مقركم وهل بامكاننا الاستفادة من خدمتكم في اطار مديريات محافظة صنعاء', NULL, 'pending', '2022-08-10 20:50:16', '2022-08-10 20:50:16'),
(7, 50, 'عدم وصول الطلب', 'مشكلة في التوصيل', 'low', 'عدم وصول الطلب', NULL, 'pending', '2022-08-14 07:21:54', '2022-08-14 07:21:54'),
(8, 50, 'عدم وصول الطلب', 'مشكلة في التوصيل', 'low', 'عدم وصول الطلب', NULL, 'pending', '2022-08-14 07:22:53', '2022-08-14 07:22:53'),
(9, 187, 'لا استطيع رؤية المواد الغذائيه او الاصناف', 'مشكلة في التطبيق', 'low', 'ليست متوفره لماذا وهل يوجد توصيل لمحافظة إب', NULL, 'pending', '2022-09-15 17:23:56', '2022-09-15 17:23:56'),
(10, 341, 'تتبنبنب', 'مشكلة في الطلب', 'low', 'نبنبنب', NULL, 'pending', '2022-10-11 21:58:15', '2022-10-11 21:58:15'),
(11, 348, 'ااعع', 'مشكلة في الطلب', 'low', 'عههخ', NULL, 'pending', '2022-10-13 22:25:13', '2022-10-13 22:25:13'),
(12, 348, 'مشكله تطبيق', 'مشكلة في التطبيق', 'low', 'تتت', NULL, 'pending', '2022-10-14 18:29:21', '2022-10-14 18:29:21'),
(13, 348, 'لم يصلنى المنتج', 'مشكلة في الطلب', 'low', 'بالرجاء وصول المنتج فى الموعد المحدد', NULL, 'pending', '2022-10-14 18:33:47', '2022-10-14 18:33:47'),
(14, 348, 'توريد', 'التوريد مع إمداد', 'low', 'عيتني', NULL, 'pending', '2022-10-14 19:31:52', '2022-10-14 19:31:52'),
(15, 364, 'مشكله فى طلب المنتج', 'مشكلة في الطلب', 'low', 'لاشىء', NULL, 'pending', '2022-10-16 18:29:44', '2022-10-16 18:29:44'),
(16, 364, 'مشكله فل التطبيق', 'مشكلة في التطبيق', 'low', 'مشكله', NULL, 'pending', '2022-10-16 18:30:07', '2022-10-16 18:30:07'),
(17, 346, 'ن', 'سؤال عام', 'low', 'ز', NULL, 'pending', '2022-10-19 19:45:28', '2022-10-19 19:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_ticket_convs`
--

INSERT INTO `support_ticket_convs` (`id`, `support_ticket_id`, `admin_id`, `customer_message`, `admin_message`, `position`, `created_at`, `updated_at`) VALUES
(1, 11, 1, 'اتت', NULL, 0, '2022-10-13 22:25:41', '2022-10-13 22:25:41'),
(2, 11, 1, 'لتع', NULL, 0, '2022-10-13 22:28:24', '2022-10-13 22:28:24'),
(3, 12, 1, 'السلام عليكم ، ايش اخبار المشكله', NULL, 0, '2022-10-14 18:32:49', '2022-10-14 18:32:49'),
(4, 13, 1, 'هل وصل ؟', NULL, 0, '2022-10-14 18:34:05', '2022-10-14 18:34:05'),
(5, 17, 1, 'م\nز', NULL, 0, '2022-10-19 19:45:51', '2022-10-19 19:45:51'),
(6, 17, 1, 'ن', NULL, 0, '2022-10-19 19:45:53', '2022-10-19 19:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `talbats`
--

CREATE TABLE `talbats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `city_id_delivery` bigint(20) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `price` double DEFAULT 0,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `request_status` tinyint(1) DEFAULT 0,
  `request_date` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `how_is_close` bigint(20) DEFAULT NULL,
  `date_of_close` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Category', 1025, 'ye', 'name', 'قسم التخفيضات', 2),
('App\\Model\\Category', 1062, 'ye', 'name', 'المشروبات', 4),
('App\\Model\\Category', 1206, 'ye', 'name', 'مواد غذائية', 8),
('App\\Model\\Category', 1207, 'ye', 'name', 'زيت', 9),
('App\\Model\\Category', 1208, 'ye', 'name', 'أرز', 10),
('App\\Model\\Category', 1209, 'ye', 'name', 'مكرونة ونودلز', 11),
('App\\Model\\Category', 1210, 'ye', 'name', 'المشروبات', 12),
('App\\Model\\Category', 1211, 'ye', 'name', 'معلبات', 13),
('App\\Model\\Category', 1212, 'ye', 'name', 'صلصة وبهارات', 14),
('App\\Model\\Category', 1213, 'ye', 'name', 'لوازم الخبز', 15),
('App\\Model\\Category', 1214, 'ye', 'name', 'منتجات الألبان', 16),
('App\\Model\\Category', 1216, 'ye', 'name', 'بسكويت', 17),
('App\\Model\\Category', 1217, 'ye', 'name', 'شكلاتة واحلويات', 18),
('App\\Model\\Category', 1218, 'ye', 'name', 'حبوب', 19),
('App\\Model\\Category', 1219, 'ye', 'name', 'مشروبات طاقة', 20),
('App\\Model\\Category', 1220, 'ye', 'name', 'مشروبات غازية', 21),
('App\\Model\\Category', 1221, 'ye', 'name', 'عصائر', 22),
('App\\Model\\Category', 1222, 'ye', 'name', 'مشروبات الشعير', 23),
('App\\Model\\Category', 1223, 'ye', 'name', 'سريعة التحضير', 24),
('App\\Model\\Category', 1224, 'ye', 'name', 'ماء', 25),
('App\\Model\\Category', 1225, 'ye', 'name', 'قهوة', 26),
('App\\Model\\Category', 1226, 'ye', 'name', 'شاهي واقهوة مثلجة', 27),
('App\\Model\\Category', 1227, 'ye', 'name', 'شاي', 28),
('App\\Model\\Category', 1228, 'ye', 'name', 'منظفات', 29),
('App\\Model\\Category', 1232, 'ye', 'name', 'كرات الشوكولاتة', 30),
('App\\Model\\Category', 1233, 'ye', 'name', 'حلوى', 31),
('App\\Model\\Category', 1234, 'ye', 'name', 'حلوى هلامية&علكة', 32),
('App\\Model\\Category', 1236, 'ye', 'name', 'الواح الشوكولاتة', 33),
('App\\Model\\Category', 1237, 'ye', 'name', 'شوكولاتة محشية', 34),
('App\\Model\\Category', 1238, 'ye', 'name', 'ميني شوكولاتة', 35),
('App\\Model\\Category', 1239, 'ye', 'name', 'علب شوكولاتة متنوعة', 36),
('App\\Model\\Category', 1240, 'ye', 'name', 'قطع صغيرة', 37),
('App\\Model\\Category', 1241, 'ye', 'name', 'الكرواسون', 38),
('App\\Model\\Category', 1242, 'ye', 'name', 'شابورة', 39),
('App\\Model\\Category', 1243, 'ye', 'name', 'كعك&دونات', 40),
('App\\Model\\Category', 1244, 'ye', 'name', 'مقرمشات', 41),
('App\\Model\\Brand', 2, 'ye', 'name', 'بيبسي', 42),
('App\\Model\\Product', 2, 'ye', 'name', 'بيبسي شد24', 43),
('App\\Model\\Product', 2, 'ye', 'description', '<h1>بيبسي شد24بيبسي شد24بيبسي شد24</h1>', 44),
('App\\Model\\Product', 3, 'ye', 'name', 'كرتون شاي فضفاض من الكبوس 227 جرام 40 حبة', 45),
('App\\Model\\Product', 3, 'ye', 'description', '<h1>كرتون شاي فضفاض من الكبوس 227 جرام 40 حبة</h1>', 46),
('App\\Model\\Brand', 3, 'ye', 'name', 'عافية', 47),
('App\\Model\\Brand', 4, 'ye', 'name', 'مزون', 48),
('App\\Model\\Brand', 5, 'ye', 'name', 'qaderfood', 49),
('App\\Model\\Brand', 6, 'ye', 'name', 'تانج', 50),
('App\\Model\\Brand', 7, 'ye', 'name', 'نيوتلا', 51),
('App\\Model\\Product', 4, 'ye', 'name', 'عصير سن توب شد 30 *250', 52),
('App\\Model\\Product', 4, 'ye', 'description', '<h1>عصير سن توب شد 30 *250</h1>', 53),
('App\\Model\\Product', 5, 'ye', 'name', 'كرتون تونه الغويزي 185جرام 48 حبة', 54),
('App\\Model\\Product', 5, 'ye', 'description', '<h1>كرتون تونه الغويزي 185جرام 48 حبة</h1>', 55),
('App\\Model\\Product', 6, 'ye', 'name', 'كرتون جبنة شيدر كرافت 100 جرام 60 حبة', 56),
('App\\Model\\Product', 6, 'ye', 'description', '<h1>كرتون جبنة شيدر كرافت 100 جرام 60 حبة</h1>', 57),
('App\\Model\\Product', 7, 'ye', 'name', 'تونه ارقى 185جرام', 58),
('App\\Model\\Product', 7, 'ye', 'description', '<h1>تونه ارقى 185جرام</h1>', 59),
('App\\Model\\Attribute', 7, 'ye', 'name', 'النكهة', 66),
('App\\Model\\FlashDeal', 1, 'ye', 'title', 'تخفيضات', 77),
('App\\Model\\DealOfTheDay', 1, 'ye', 'title', 'عرض حصري', 78),
('App\\Model\\Product', 8, 'ye', 'name', 'اندومي نكهة الخضروات 75 غرام', 79),
('App\\Model\\Product', 8, 'ye', 'description', '<p>اندومي نكهة الخضروات 75 غرام</p>', 80),
('App\\Model\\FlashDeal', 2, 'ye', 'title', 'منتجات جديده', 81),
('App\\Model\\Product', 9, 'ye', 'name', 'شعيرية اندومي كاري دجاج 40*75 جرام', 82),
('App\\Model\\Product', 10, 'ye', 'name', 'شعيرية اندومي مقلية 40*70جم', 83),
('App\\Model\\Product', 10, 'ye', 'description', '<h1>شعيرية اندومي مقلية 40*70جم</h1>', 84),
('App\\Model\\Product', 11, 'ye', 'name', 'إندومي بنكهة الدجاج الخاصة', 85),
('App\\Model\\Product', 11, 'ye', 'description', '<h1>إندومي بنكهة الدجاج الخاصة</h1>', 86),
('App\\Model\\Product', 22, 'ye', 'name', 'لبن كامل الدسم 2لتر', 87),
('App\\Model\\Product', 22, 'ye', 'description', '<p>&nbsp;</p>\r\n\r\n<h1>لبن كامل الدسم</h1>\r\n\r\n<p>محضر من حليب البقر الطازج 100٪، مبستر ومتجانس. يعبأ الحليب الطازج من المزرعة يومياً من دون إضافة الماء أومسحوق الحليب أو مواد حافظة.</p>\r\n\r\n<p>المعلومات الغذائية</p>\r\n\r\n<p>طاقة (السعرة الحرارية)</p>\r\n\r\n<p>58kcal</p>\r\n\r\n<p>بروتين (غ)</p>\r\n\r\n<p>3.8g</p>\r\n\r\n<p>كربوهيدرات (غ)</p>\r\n\r\n<p>4.4g</p>\r\n\r\n<p>منها سكريات (غ)</p>\r\n\r\n<p>4.4g</p>\r\n\r\n<p>مجموع الدهون (غ)</p>\r\n\r\n<p>3g</p>\r\n\r\n<p>منها دهون مشبعة (غ)</p>\r\n\r\n<p>1.7g</p>\r\n\r\n<p>صوديوم (مغ)</p>\r\n\r\n<p>50mg</p>\r\n\r\n<p>كالسيوم (مغ)</p>\r\n\r\n<p>133mg</p>\r\n\r\n<p>فيتامين أ (وحدة دولية)</p>\r\n\r\n<p>200IU</p>\r\n\r\n<p>فيتامين د ٣ (وحدة دولية)</p>\r\n\r\n<p>40IU</p>\r\n\r\n<p>&nbsp;</p>', 88),
('App\\Model\\Product', 23, 'ye', 'name', 'جبنة شيدر قابلة للدهن 240gm', 89),
('App\\Model\\Product', 23, 'ye', 'description', '<p>&nbsp;</p>\r\n\r\n<h1>جبنة شيدر قابلة للدهن</h1>\r\n\r\n<p>معاير, مبستر ومتجانس. حليب أبقار طازج 100%. خالي من الزيوت النباتية.</p>\r\n\r\n<p>المعلومات الغذائية</p>\r\n\r\n<p>طاقة سعرة حرارية</p>\r\n\r\n<p>330kcal</p>\r\n\r\n<p>بروتين</p>\r\n\r\n<p>6.0g</p>\r\n\r\n<p>كربوهيدرات</p>\r\n\r\n<p>2.0g</p>\r\n\r\n<p>منها سكريات</p>\r\n\r\n<p>0.0g</p>\r\n\r\n<p>مجموع الدهون</p>\r\n\r\n<p>33.0g</p>\r\n\r\n<p>منها دهون مشبعة</p>\r\n\r\n<p>22.4g</p>\r\n\r\n<p>كوليسترول</p>\r\n\r\n<p>100mg</p>\r\n\r\n<p>صوديوم</p>\r\n\r\n<p>385mg</p>\r\n\r\n<p>كالسيوم</p>\r\n\r\n<p>98mg</p>\r\n\r\n<p>فيتامين أ</p>\r\n\r\n<p>1000IU</p>\r\n\r\n<p>فيتامين د٣</p>\r\n\r\n<p>24IU</p>', 90),
('App\\Model\\Product', 24, 'ye', 'name', 'جبنة كريم قابلة للدهن 240gm', 91),
('App\\Model\\Product', 24, 'ye', 'description', '<h1>جبنة كريم قابلة للدهن</h1>\r\n\r\n<p>معاير, مبستر ومتجانس. حليب أبقار طازج 100%. خالي من الزيوت النباتية.</p>\r\n\r\n<p>المعلومات الغذائية</p>\r\n\r\n<p>طاقة سعرة حرارية</p>\r\n\r\n<p>330kcal</p>\r\n\r\n<p>بروتين</p>\r\n\r\n<p>6.0g</p>\r\n\r\n<p>كربوهيدرات</p>\r\n\r\n<p>2.0g</p>\r\n\r\n<p>منها سكريات</p>\r\n\r\n<p>0.0g</p>\r\n\r\n<p>مجموع الدهون</p>\r\n\r\n<p>33.0g</p>\r\n\r\n<p>منها دهون مشبعة</p>\r\n\r\n<p>22.4g</p>\r\n\r\n<p>كوليسترول</p>\r\n\r\n<p>100mg</p>\r\n\r\n<p>صوديوم</p>\r\n\r\n<p>385mg</p>\r\n\r\n<p>كالسيوم</p>\r\n\r\n<p>98mg</p>\r\n\r\n<p>فيتامين أ</p>\r\n\r\n<p>1000IU</p>\r\n\r\n<p>فيتامين د٣</p>\r\n\r\n<p>24IU</p>\r\n\r\n<p>&nbsp;</p>', 92),
('App\\Model\\Product', 25, 'ye', 'name', 'عصير رمان 200ml', 93),
('App\\Model\\Product', 25, 'ye', 'description', '<h1>عصير رمان</h1>\r\n\r\n<p>عصير الرمان والعنب المعاد تكوينه خالي من المواد الحافظة. مبستر.</p>\r\n\r\n<p>المعلومات الغذائية</p>\r\n\r\n<p>طاقة</p>\r\n\r\n<p>55kcal</p>\r\n\r\n<p>بروتين</p>\r\n\r\n<p>0.1g</p>\r\n\r\n<p>مجموع الكربوهيدرات</p>\r\n\r\n<p>13.74g</p>\r\n\r\n<p>منها سكريات</p>\r\n\r\n<p>11.27</p>\r\n\r\n<p>ألياف غذائية</p>\r\n\r\n<p>0.30g</p>\r\n\r\n<p>فيتامين ج</p>\r\n\r\n<p>8.36g</p>', 94),
('App\\Model\\Product', 26, 'ye', 'name', 'فاصولياء حمراء', 96),
('App\\Model\\Product', 26, 'ye', 'description', '<p>الفاصولياء الحمراء من ليجادور هي إضافة مغذية إلى مائدتك. إنه مصدر رائع للمكملات الغذائية الأساسية والعناصر الغذائية التي يحتاجها جسمك.</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:186.3px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:127.467px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:182.233px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>فاصولياء حمراء</p>\r\n			</td>\r\n			<td>\r\n			<p>400 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 97),
('App\\Model\\Product', 27, 'ye', 'name', 'فول مدمس', 98),
('App\\Model\\Product', 27, 'ye', 'description', '<p>فول مدمس ليجادور مصدر صحي للألياف والفيتامينات. استمتع بوجبتك مع طبق لذيذ وسهل التحضير</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:160.7px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:135.717px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:199.583px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>فول مدمس</p>\r\n			</td>\r\n			<td>\r\n			<p>397 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 99),
('App\\Model\\Product', 28, 'ye', 'name', 'البازلاء الخضراء', 100),
('App\\Model\\Product', 29, 'ye', 'name', 'السباغيتي', 101),
('App\\Model\\Product', 29, 'ye', 'description', '<p>سباغيتي ليجادور مصنوعة من أجود أنواع سميد القمح القاسي، طبيعية ١٠٠٪ و خاليه من أي مواد حافظة أو مكونات صناعية لتتناسب بإمتياز مع جميع أنواع الصلصات والكريمات.&nbsp;</p>\r\n\r\n<p>١٠٠ ٪ سميد القمح القاسي. غير معدلة وراثيًا.</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:122px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:191px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:184px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>السباغيتي</p>\r\n			</td>\r\n			<td>\r\n			<p>400 / 500 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 102),
('App\\Model\\Category', 1245, 'ye', 'name', 'المعكرونة', 103),
('App\\Model\\Category', 1246, 'ye', 'name', 'الشعيرية', 104),
('App\\Model\\Product', 30, 'ye', 'name', 'الشعيرية', 105),
('App\\Model\\Product', 30, 'ye', 'description', '<p>تضيف شعيرية ليجادور طعمًا فريدًا لأطباقك اليومية ، فهو مصنوع من أجود أنواع سميد القمح القاسي ١٠٠ ٪. غير معدّل وراثيًا</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:114.817px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:194.55px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:186.633px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>الشعيرية</p>\r\n			</td>\r\n			<td>\r\n			<p>400 / 500 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 106),
('App\\Model\\Product', 31, 'ye', 'name', 'المعكرونة', 107),
('App\\Model\\Product', 31, 'ye', 'description', '<p>يتم تصنيع معكرونة ليجادور من سميد القمح القاسي النقي ١٠٠ ٪ لتزويدك أنت وأحبائك بأجود أطباق المعكرونة وتجربة فريدة من نوعها مع مجموعة واسعة من المعكرونة ذات الأشكال القصيرة. غير معدلة وراثيًا</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:203.567px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:149.683px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:142.75px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>معكرونة قصيرة أكواع</p>\r\n			</td>\r\n			<td>\r\n			<p>400 / 500 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>معكرونة قصيرة حادة</p>\r\n			</td>\r\n			<td>\r\n			<p>400 / 500 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>معكرونة قصيرة خواتم</p>\r\n			</td>\r\n			<td>\r\n			<p>400 / 500 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>معكرونة قصيرة حلزوني</p>\r\n			</td>\r\n			<td>\r\n			<p>400 / 500 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>معكرونة قصيرة قواقع</p>\r\n			</td>\r\n			<td>\r\n			<p>400 / 500 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>معكرونة قصيرة أنبوب</p>\r\n			</td>\r\n			<td>\r\n			<p>400 / 500 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 108),
('App\\Model\\Product', 32, 'ye', 'name', 'حليب مجفف', 109),
('App\\Model\\Product', 32, 'ye', 'description', '<p>حليب مجفف كامل الدسم سريع التحضير: حليب بودر ليجادور مصنوع من أجود أنواع حليب الأبقار الذي يذوب بسرعة في الماء البارد أو الدافئ ويحتوي على فيتامينات أ و د 3 والبروتين والكالسيوم والأحماض الأمينية الضرورية لنمط حياة صحي وتحسين مهام الجسم بشكل عام</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:234px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:78px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:79px\">\r\n			<p>Packaging</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:89px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>حليب مجفف كامل الدسم سريع التحضير</p>\r\n			</td>\r\n			<td>\r\n			<p>230 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>أكياس</p>\r\n			</td>\r\n			<td>\r\n			<p>18 شهر</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>حليب مجفف كامل الدسم سريع التحضير</p>\r\n			</td>\r\n			<td>\r\n			<p>900 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>أكياس</p>\r\n			</td>\r\n			<td>\r\n			<p>18 شهر</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>حليب مجفف كامل الدسم سريع التحضير</p>\r\n			</td>\r\n			<td>\r\n			<p>2.5 كيلو جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>علبة صفيح</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>حليب مجفف كامل الدسم سريع التحضير</p>\r\n			</td>\r\n			<td>\r\n			<p>900 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>علبة صفيح</p>\r\n			</td>\r\n			<td>\r\n			<p>سنتان</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 110),
('App\\Model\\Category', 1247, 'ye', 'name', 'حليب', 111),
('App\\Model\\Category', 1248, 'ye', 'name', 'حليب منكة', 112),
('App\\Model\\Category', 1249, 'ye', 'name', 'حليب مبخر', 113),
('App\\Model\\Category', 1250, 'ye', 'name', 'حليب مكثف', 114),
('App\\Model\\Category', 1251, 'ye', 'name', 'حليب بودرة', 115),
('App\\Model\\Category', 1252, 'ye', 'name', 'قشطة', 116),
('App\\Model\\Category', 1253, 'ye', 'name', 'اجبان', 117),
('App\\Model\\Category', 1254, 'ye', 'name', 'لبن&زبادي', 118),
('App\\Model\\Product', 33, 'ye', 'name', 'حليب مركز', 119),
('App\\Model\\Product', 33, 'ye', 'description', '<p>يضيف حليب ليجادور المركز غير المحلى طعمًا فريدًا للشاي والقهوة. وهو مدعم بفيتامين أ</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:160px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:137px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:200px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>حليب مركز</p>\r\n			</td>\r\n			<td>\r\n			<p>170 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>12 شهر</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>حليب مركز</p>\r\n			</td>\r\n			<td>\r\n			<p>400 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>12 شهر</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 120),
('App\\Model\\Product', 34, 'ye', 'name', 'جبنة مثلثات', 121),
('App\\Model\\Product', 34, 'ye', 'description', '<h2>جبنة مثلثات</h2>\r\n\r\n<p>أجزاء الجبن المثلث من ليجادور قابلة للدهن بسهولة ومثالية للإفطار ومصدر جيد للبروتين والفيتامينات. مذاقه الرائع محبوب من قبل الأطفال</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:170px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:142px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:185px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>جبنة مثلثات</p>\r\n			</td>\r\n			<td>\r\n			<p>360 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>12 شهر</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 122),
('App\\Model\\Product', 35, 'ye', 'name', 'معمول', 123),
('App\\Model\\Product', 35, 'ye', 'description', '<p>مصنوع من تمور عالية الجوده . يقدم معمول ليجادور تجربة فريدة وطعم لا يقاوم . يقدم في جميع المناسبات الخاصة</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:158.667px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:158.633px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:158.7px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>معمول</p>\r\n			</td>\r\n			<td>\r\n			<p>40 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>12 شهر</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 124),
('App\\Model\\Product', 36, 'ye', 'name', 'بسكويت كريمة', 125),
('App\\Model\\Product', 36, 'ye', 'description', '<p>بسكويت كريمة ليجادور يقدم طعمًا استثنائيًا مع كريمة ناعمة لذيذة. غني بخيرات الحليب ، ومتوفر بثلاث نكهات لذيذة (شوكولاتة ، فراولة وفانيليا).</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:158.683px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:158.633px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:158.683px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>بسكويت كريمة</p>\r\n			</td>\r\n			<td>\r\n			<p>50 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>12 شهر</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>بسكويت كريمة</p>\r\n			</td>\r\n			<td>\r\n			<p>25 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>12 شهر</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 126),
('App\\Model\\Product', 37, 'ye', 'name', 'بسكويت الشاي', 127),
('App\\Model\\Product', 37, 'ye', 'description', '<p>بسكويت شاي ليجادور يجعل وقت الشاي أكثر متعة. هذا البسكويت اللذيذ مقرمش ومليء بالنكهه المميزه</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:158.683px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:158.633px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:158.683px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>بسكويت الشاي</p>\r\n			</td>\r\n			<td>\r\n			<p>80 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>12 شهر</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 128),
('App\\Model\\Product', 38, 'ye', 'name', 'بسكويت ماري', 129),
('App\\Model\\Product', 38, 'ye', 'description', '<p>سكويت ليجادور ماري هو إضافة لذيذة لوجباتك الخفيفة اليومية , مصنوع من أجود أنواع دقيق القمح لمساعدتك على الحصول على كمية الألياف اليومية</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:179.25px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:112.517px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:184.233px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>بسكويت ماري</p>\r\n			</td>\r\n			<td>\r\n			<p>90 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>12 شهر</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 130),
('App\\Model\\Product', 39, 'ye', 'name', 'بسكويت دايجستيف', 131),
('App\\Model\\Product', 39, 'ye', 'description', '<p>وجبة خفيفة صحية لذيذة خالية من الزيوت المهدرجة والألوان والنكهات الصناعية</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:210.55px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:103.783px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:161.667px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>بسكويت دايجستيف</p>\r\n			</td>\r\n			<td>\r\n			<p>210 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>12 شهر</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 132),
('App\\Model\\Product', 40, 'ye', 'name', 'الكريمة المخفوقة', 133),
('App\\Model\\Product', 40, 'ye', 'description', '<p>كريم ليجادور هي مزيج كريمي مثالي يستخدم لتزيين الحلويات وسلطات الفواكه والآيس كريم وحشو الكيك</p>\r\n\r\n<table style=\"width:100%\">\r\n	<thead>\r\n		<tr>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:214px\">\r\n			<p>المنتج</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:117px\">\r\n			<p>الوزن</p>\r\n			</th>\r\n			<th colspan=\"1\" rowspan=\"1\" style=\"width:166px\">\r\n			<p>تاريخ الصلاحية</p>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>الكريمة المخفوقة</p>\r\n			</td>\r\n			<td>\r\n			<p>72 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>12 شهر</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>الكريمة المخفوقة</p>\r\n			</td>\r\n			<td>\r\n			<p>150 جرام</p>\r\n			</td>\r\n			<td>\r\n			<p>12 شهر</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 134),
('App\\Model\\Product', 41, 'ye', 'name', 'مسحوق الكاسترد', 135),
('App\\Model\\Product', 42, 'ye', 'name', 'التونة', 136),
('App\\Model\\Product', 43, 'ye', 'name', 'الأناناس المعلب', 137),
('App\\Model\\Product', 44, 'ye', 'name', 'الخوخ المعلب', 138),
('App\\Model\\Product', 45, 'ye', 'name', 'كوكتيل الفواكه المعلب', 139),
('App\\Model\\Product', 46, 'ye', 'name', 'الذرة الحلوة', 140),
('App\\Model\\Brand', 9, 'ye', 'name', 'نادفوود', 141),
('App\\Model\\Category', 1255, 'ye', 'name', 'تونة', 142),
('App\\Model\\Product', 47, 'ye', 'name', 'بازيليا الهناء', 143),
('App\\Model\\Category', 1256, 'ye', 'name', 'الحبوب', 144),
('App\\Model\\Product', 48, 'ye', 'name', 'فاصوليا الهناء', 145),
('App\\Model\\Product', 51, 'ye', 'name', 'سجائر شملان ازرق', 149),
('App\\Model\\Brand', 10, 'ye', 'name', 'شملان', 150),
('App\\Model\\Product', 52, 'ye', 'name', 'شملان احمر', 151),
('App\\Model\\Product', 53, 'ye', 'name', 'شملان أبيض', 152),
('App\\Model\\Product', 54, 'ye', 'name', 'حليب كامل الدسم 200ملي', 153),
('App\\Model\\Product', 55, 'ye', 'name', 'جبنة كريم قابلة للدهن 240gm', 154),
('App\\Model\\Product', 56, 'ye', 'name', 'جبنة كريم قابلة للدهن 240gm', 155),
('App\\Model\\Product', 57, 'ye', 'name', 'حليب مزون بالمانجو', 156),
('App\\Model\\Product', 58, 'ye', 'name', 'عصير برتقال', 157),
('App\\Model\\Product', 59, 'ye', 'name', 'عصير برتقال', 158),
('App\\Model\\Product', 60, 'ye', 'name', 'عصير تفاح', 159),
('App\\Model\\Product', 61, 'ye', 'name', 'عصير تفاح  300 مل', 160),
('App\\Model\\Product', 62, 'ye', 'name', 'عصير جوافه  200 ml', 161),
('App\\Model\\Brand', 11, 'ye', 'name', 'سيزر', 162),
('App\\Model\\Product', 63, 'ye', 'name', 'سيزر عصير مانجو', 163),
('App\\Model\\Product', 64, 'ye', 'name', 'سيزر عصير جوافة 250مل', 164),
('App\\Model\\Brand', 12, 'ye', 'name', 'الربيع', 165),
('App\\Model\\Product', 65, 'ye', 'name', 'عصير برتقال الربيع250مل', 166),
('App\\Model\\Attribute', 18, 'ye', 'name', 'الكمية', 167),
('App\\Model\\Attribute', 19, 'ye', 'name', 'الحجم', 168),
('App\\Model\\Brand', 13, 'ye', 'name', 'روشين', 170),
('App\\Model\\Product', 66, 'ye', 'name', 'شوكولاتة روشين لاكمي بالحليب -90 جرام', 171),
('App\\Model\\Product', 67, 'ye', 'name', 'روشين شوكولا بالكراميل', 172),
('App\\Model\\Product', 68, 'ye', 'name', 'شوكولاتة روشين لاتيه 43جم', 173),
('App\\Model\\Product', 69, 'ye', 'name', 'ويفر روشين محشو بالشوكولاتة 72 جرام', 174),
('App\\Model\\Product', 70, 'ye', 'name', 'ويفر بسكويت روشين بندق 216جم', 175),
('App\\Model\\Product', 71, 'ye', 'name', 'روشين ويفر بالكاكاو والحليب - 72 جم', 176),
('App\\Model\\Product', 72, 'ye', 'name', 'روشين الشوكولاته والفول السوداني بار شوكولاتة الحليب 38 جرام', 177),
('App\\Model\\Product', 73, 'ye', 'name', 'شوكولاتة روشين ميلك بابل - 80 جم', 178),
('App\\Model\\Product', 74, 'ye', 'name', 'روشين كراميل بابل شوكولاتة - 85 جم', 179),
('App\\Model\\Product', 75, 'ye', 'name', 'حلويات اوكرانية روشن بابلز داكنة ألواح الشوكولاتة الهوائية 2 قطعة × 80 جرام', 180),
('App\\Model\\Product', 76, 'ye', 'name', 'شوكولاتة رافايلو (15 قطعة) - 150 جم', 181),
('App\\Model\\Product', 77, 'ye', 'name', 'شوكولاتة سنيكرز', 182),
('App\\Model\\Product', 78, 'ye', 'name', 'شوكولاتة مارس', 183),
('App\\Model\\Brand', 14, 'ye', 'name', 'السمو', 184),
('App\\Model\\Product', 79, 'ye', 'name', 'ارز السمو 40 كغ', 185),
('App\\Model\\Product', 80, 'ye', 'name', 'ارز السمو 20 كغ', 186),
('App\\Model\\Product', 81, 'ye', 'name', 'أناناس السمو', 187),
('App\\Model\\Product', 82, 'ye', 'name', 'زيت دوار الشمس النبلاء', 188),
('App\\Model\\Product', 83, 'ye', 'name', 'أناناس النبلاء', 189),
('App\\Model\\Product', 84, 'ye', 'name', 'خوخ السمو', 190),
('App\\Model\\Product', 85, 'ye', 'name', 'لب المانجو النبلاء', 191),
('App\\Model\\Product', 86, 'ye', 'name', 'صابون ريحان', 192),
('App\\Model\\Product', 87, 'ye', 'name', 'زيت دوار الشمس السمو', 193),
('App\\Model\\Product', 88, 'ye', 'name', 'زيت النخيل السمو', 194),
('App\\Model\\Product', 91, 'ye', 'name', 'حليب السمو المركز صغير', 195),
('App\\Model\\Product', 92, 'ye', 'name', 'حليب السمو المركز كبير', 196),
('App\\Model\\Product', 93, 'ye', 'name', 'فول مدمس السمو', 197),
('App\\Model\\Product', 94, 'ye', 'name', 'بازيليا السمو', 198),
('App\\Model\\Product', 95, 'ye', 'name', 'فاصوليا حمراء السمو', 199),
('App\\Model\\Product', 96, 'ye', 'name', 'فاصوليا بالطماطم السمو', 200),
('App\\Model\\Product', 97, 'ye', 'name', 'أرز الصهاريج 40 كغ', 201),
('App\\Model\\Product', 98, 'ye', 'name', 'أرز الصهاريج 20 كغ', 202),
('App\\Model\\Category', 1258, 'ye', 'name', 'خضروات', 203),
('App\\Model\\Category', 1259, 'ye', 'name', 'فواكة', 204),
('App\\Model\\Category', 1260, 'ye', 'name', 'معلبات الماكولات البحرية', 205),
('App\\Model\\Category', 1261, 'ye', 'name', 'زيوت', 206),
('App\\Model\\Category', 1262, 'ye', 'name', 'ورق عنب', 207),
('App\\Model\\Category', 1263, 'ye', 'name', 'عسل', 208),
('App\\Model\\Category', 1264, 'ye', 'name', 'مربئ', 209),
('App\\Model\\Category', 1265, 'ye', 'name', 'طحينة', 210),
('App\\Model\\Category', 1266, 'ye', 'name', 'زيت دوارالشمس', 211),
('App\\Model\\Category', 1267, 'ye', 'name', 'زيت جوز الهند&زيت الزيتوم', 212),
('App\\Model\\Category', 1268, 'ye', 'name', 'زيت نباتي', 213),
('App\\Model\\Category', 1269, 'ye', 'name', 'زيت الذرة', 214),
('App\\Model\\Category', 1270, 'ye', 'name', 'زيت الطبخ&قلي', 215),
('App\\Model\\Category', 1271, 'ye', 'name', 'أرز', 216),
('App\\Model\\Category', 1272, 'ye', 'name', 'أرز بسمتي', 217),
('App\\Model\\Category', 1273, 'ye', 'name', 'مكرونة سريعة التحضير', 218),
('App\\Model\\Brand', 15, 'ye', 'name', 'الفخامة', 219),
('App\\Model\\Product', 100, 'ye', 'name', 'عصير مانجو الفخامة - قارورة', 220),
('App\\Model\\Product', 101, 'ye', 'name', 'عصير مانجو الفخامة عائلي', 221),
('App\\Model\\Product', 102, 'ye', 'name', 'أرز الفخامة 10 كيلو', 222),
('App\\Model\\Product', 103, 'ye', 'name', 'علبة بازيلياء الفخامة', 223),
('App\\Model\\Product', 104, 'ye', 'name', 'فاصوليا الفخامة', 224),
('App\\Model\\Product', 105, 'ye', 'name', 'كرتون معجون طماطم الفخامة 30 جرام', 225),
('App\\Model\\Category', 1274, 'ye', 'name', 'معجون طماطم', 226),
('App\\Model\\Category', 1275, 'ye', 'name', 'صلصة حار', 227),
('App\\Model\\Product', 106, 'ye', 'name', 'معجون طماطم الفخامة 70 جرام', 228),
('App\\Model\\Product', 107, 'ye', 'name', 'قصعة طماطم الفخامة', 229),
('App\\Model\\Product', 109, 'ye', 'name', 'زيت الفخامة 1.3 لتر', 230),
('App\\Model\\Product', 110, 'ye', 'name', 'عصير جوافة الفخامة - علب', 231),
('App\\Model\\Product', 111, 'ye', 'name', 'تونة الفخامة', 232),
('App\\Model\\Product', 112, 'ye', 'name', 'مكرونة الفخامة - قطع', 233),
('App\\Model\\Product', 113, 'ye', 'name', 'مكرونة الفخامة - طويل', 234),
('App\\Model\\Product', 114, 'ye', 'name', 'ارز الديوان 40كيلو', 235),
('App\\Model\\Product', 115, 'ye', 'name', 'ارز الربان 20كيلو', 236),
('App\\Model\\Product', 116, 'ye', 'name', 'فوري بسكويت كبير 24 * 160 جم', 237),
('App\\Model\\Product', 117, 'ye', 'name', 'ماري بسكويت 60حبه*95 جرام', 238),
('App\\Model\\Product', 118, 'ye', 'name', 'ابو ولد بسكويت 48حبه*100 جرام,', 239),
('App\\Model\\Product', 119, 'ye', 'name', 'اسمايلي بسكويت 60حبه*45 جرام', 240),
('App\\Model\\Product', 120, 'ye', 'name', 'سندباد بالشوكولاتة 24*13 جم', 241),
('App\\Model\\Product', 121, 'ye', 'name', 'نعنع ابيض حار 120جم', 242),
('App\\Model\\Product', 122, 'ye', 'name', 'بقري حليب صغير 28حبه*250 مل', 243),
('App\\Model\\Product', 123, 'ye', 'name', 'نسيم صابون اصفر 12حبه*75جم', 244),
('App\\Model\\Product', 124, 'ye', 'name', 'نجوم شوكولاتة 24حبه*25جم', 245),
('App\\Model\\Product', 125, 'ye', 'name', 'سنيكرس شوكولاتة كبير 24*50جم', 247),
('App\\Model\\Product', 126, 'ye', 'name', 'ميرو شوكولاته صغير24*18جم', 248),
('App\\Model\\Product', 127, 'ye', 'name', 'افيزا ريكو بار شوكولاتة بالجوز الهند 60*10جم', 250),
('App\\Model\\Category', 1276, 'ye', 'name', 'شوربة', 251),
('App\\Model\\Category', 1277, 'ye', 'name', 'مرقة', 252),
('App\\Model\\Category', 1278, 'ye', 'name', 'الشوفان', 253),
('App\\Model\\Category', 1279, 'ye', 'name', 'عناية منزلية', 254),
('App\\Model\\Category', 1280, 'ye', 'name', 'رعاية الطفال', 255),
('App\\Model\\Category', 1281, 'ye', 'name', 'منظفات', 256),
('App\\Model\\Category', 1282, 'ye', 'name', 'منظفات البشرة', 257),
('App\\Model\\Category', 1283, 'ye', 'name', 'العناية با لفم', 258),
('App\\Model\\Category', 1284, 'ye', 'name', 'العناية بالشعر', 259),
('App\\Model\\Category', 1288, 'ye', 'name', 'مناديل مبللة', 262),
('App\\Model\\Category', 1289, 'ye', 'name', 'حفاضات اطفال', 263),
('App\\Model\\Category', 1290, 'ye', 'name', 'استحمام الطفال& عناية الطفل', 264),
('App\\Model\\Category', 1291, 'ye', 'name', 'اكياس نفايات', 265),
('App\\Model\\Category', 1292, 'ye', 'name', 'مبيدات حشرية', 266),
('App\\Model\\Category', 1293, 'ye', 'name', 'بطاريات', 267),
('App\\Model\\Category', 1294, 'ye', 'name', 'بطاريات', 268),
('App\\Model\\Category', 1295, 'ye', 'name', 'معطرات الجو', 269),
('App\\Model\\Category', 1296, 'ye', 'name', 'لاصق التغليف', 270),
('App\\Model\\Category', 1297, 'ye', 'name', 'اكواب', 271),
('App\\Model\\Category', 1298, 'ye', 'name', 'صحون', 272),
('App\\Model\\Category', 1299, 'ye', 'name', 'ادوات المائدة', 273),
('App\\Model\\Category', 1301, 'ye', 'name', 'مطهرات الاسطح', 274),
('App\\Model\\Product', 128, 'ye', 'name', 'زبدة مرجرين القمرية', 275),
('App\\Model\\Category', 1302, 'ye', 'name', 'دقيق', 276),
('App\\Model\\Category', 1303, 'ye', 'name', 'سكر', 277),
('App\\Model\\Category', 1304, 'ye', 'name', 'خلطات الكيك', 278),
('App\\Model\\Category', 1305, 'ye', 'name', 'كريم كراميل', 279),
('App\\Model\\Category', 1306, 'ye', 'name', 'جيلي', 280),
('App\\Model\\Category', 1307, 'ye', 'name', 'خمائر الخبز', 281),
('App\\Model\\Category', 1308, 'ye', 'name', 'نكهات مركزة', 282),
('App\\Model\\Product', 129, 'ye', 'name', 'سكر السعيد 1ك X 5ك X 10ك', 283),
('App\\Model\\Product', 130, 'ye', 'name', 'دقيق السنابل', 284),
('App\\Model\\Product', 131, 'ye', 'name', 'جبنة افيدوو', 285),
('App\\Model\\Product', 133, 'ye', 'name', 'خميرة اوزمايا 500جرام', 287),
('App\\Model\\Product', 134, 'ye', 'name', 'حليب شاهي', 288),
('App\\Model\\Brand', 19, 'ye', 'name', 'ديكو', 293),
('App\\Model\\Product', 138, 'ye', 'name', 'ديلسي زنجبيل 24 * 500 مل', 294),
('App\\Model\\Product', 139, 'ye', 'name', 'ديلسي رمان 24 * 500 مل', 295),
('App\\Model\\Product', 140, 'ye', 'name', 'ديلسي برتقال 24 * 330 مل', 296),
('App\\Model\\Product', 141, 'ye', 'name', 'ديلسي كولا 24 * 500 مل', 297),
('App\\Model\\Product', 142, 'ye', 'name', 'ديلسي تفاح 24 * 330 مل', 298),
('App\\Model\\Brand', 20, 'ye', 'name', 'كمران', 299),
('App\\Model\\Product', 143, 'ye', 'name', 'سجائر مارب', 300),
('App\\Model\\Product', 144, 'ye', 'name', 'سجائر كمران', 301),
('App\\Model\\Product', 145, 'ye', 'name', 'سجائر كريتر', 302),
('App\\Model\\Product', 146, 'ye', 'name', 'سجائر سباء', 303),
('App\\Model\\Product', 147, 'ye', 'name', 'سجائر كمران صغير', 304),
('App\\Model\\Product', 148, 'ye', 'name', 'سجائر بون', 305),
('App\\Model\\Product', 149, 'ye', 'name', 'سجائر سوفت', 306),
('App\\Model\\Product', 150, 'ye', 'name', 'سجائر مالبورو', 307),
('App\\Model\\Product', 151, 'ye', 'name', 'سجائر غمدان', 308),
('App\\Model\\Product', 152, 'ye', 'name', 'سجائر غمدان', 309),
('App\\Model\\Brand', 21, 'ye', 'name', 'يماني', 310),
('App\\Model\\Product', 153, 'ye', 'name', 'حليب يماني', 311),
('App\\Model\\Product', 154, 'ye', 'name', 'حليب مبخر', 312),
('App\\Model\\Product', 155, 'ye', 'name', 'حليب الاخضر', 313),
('App\\Model\\Product', 156, 'ye', 'name', 'حليب بالموز', 314),
('App\\Model\\Product', 157, 'ye', 'name', 'بسكويت بسكريم تركي', 315),
('App\\Model\\Brand', 22, 'ye', 'name', 'ولكر', 316),
('App\\Model\\Product', 158, 'ye', 'name', 'اولكر شوكو ساندويش با الشكلاتة والبندق 23غرام', 317),
('App\\Model\\Product', 159, 'ye', 'name', 'اولكر بسكويت الشاهي 12حبة', 318),
('App\\Model\\Product', 160, 'ye', 'name', 'اولكر شوك وساندويش', 319),
('App\\Model\\Product', 161, 'ye', 'name', 'والكر بسكويت كات كات تات24غرام', 320),
('App\\Model\\Brand', 23, 'ye', 'name', 'ديمة', 321),
('App\\Model\\Product', 162, 'ye', 'name', 'ديمه بسكويت بالتمر 25 غرام', 322),
('App\\Model\\Brand', 24, 'ye', 'name', 'لوتي', 323),
('App\\Model\\Product', 164, 'ye', 'name', 'دان كيك', 324),
('App\\Model\\Product', 165, 'ye', 'name', 'دان كيك', 325),
('App\\Model\\Product', 166, 'ye', 'name', 'دان كيك', 326),
('App\\Model\\Product', 167, 'ye', 'name', 'كيك أولالا', 327),
('App\\Model\\Product', 168, 'ye', 'name', 'كيك أولالا', 328),
('App\\Model\\Product', 169, 'ye', 'name', 'كيك أولالا', 329),
('App\\Model\\Product', 170, 'ye', 'name', 'كات تات ويفر بابلندق', 330),
('App\\Model\\Product', 171, 'ye', 'name', 'سيسفك', 335),
('App\\Model\\Product', 172, 'ye', 'name', 'سيسفك', 336),
('App\\Model\\Product', 173, 'ye', 'name', 'تيمبو', 337),
('App\\Model\\Product', 174, 'ye', 'name', 'تيمبو', 338),
('App\\Model\\Product', 175, 'ye', 'name', 'تيمبو', 339),
('App\\Model\\Product', 176, 'ye', 'name', 'تيمبو', 340),
('App\\Model\\Product', 177, 'ye', 'name', 'تيمبو', 341),
('App\\Model\\Product', 178, 'ye', 'name', 'تيمبو', 342),
('App\\Model\\Product', 179, 'ye', 'name', 'رول كات', 343),
('App\\Model\\Product', 180, 'ye', 'name', 'رول كات', 344),
('App\\Model\\Product', 181, 'ye', 'name', 'روندو', 345),
('App\\Model\\Product', 182, 'ye', 'name', 'روندو', 346),
('App\\Model\\Product', 183, 'ye', 'name', 'روندو', 347),
('App\\Model\\Product', 184, 'ye', 'name', 'روندو', 348),
('App\\Model\\Product', 185, 'ye', 'name', 'بروبس', 349),
('App\\Model\\Product', 186, 'ye', 'name', 'بروبس', 350),
('App\\Model\\Product', 187, 'ye', 'name', 'بروبس', 351),
('App\\Model\\Product', 188, 'ye', 'name', 'أكرام', 352),
('App\\Model\\Product', 189, 'ye', 'name', 'أكرام', 353),
('App\\Model\\Product', 190, 'ye', 'name', 'أكرام', 354),
('App\\Model\\Product', 191, 'ye', 'name', 'هنا ميلير', 355),
('App\\Model\\Product', 192, 'ye', 'name', 'هنا ميلير', 356),
('App\\Model\\Product', 193, 'ye', 'name', 'هنا ميلير', 357),
('App\\Model\\Product', 194, 'ye', 'name', 'هنا ميلير', 358),
('App\\Model\\Product', 195, 'ye', 'name', 'هالي', 359),
('App\\Model\\Product', 196, 'ye', 'name', 'هالي', 360),
('App\\Model\\Product', 197, 'ye', 'name', 'هالي', 361),
('App\\Model\\Product', 198, 'ye', 'name', 'تاك كرار', 362),
('App\\Model\\Product', 199, 'ye', 'name', 'تاك كرار', 363),
('App\\Model\\Category', 1313, 'ye', 'name', 'بسكويت الشاي', 364),
('App\\Model\\Product', 200, 'ye', 'name', 'بتي بور', 365),
('App\\Model\\Product', 201, 'ye', 'name', 'بتي بور', 366),
('App\\Model\\Product', 203, 'ye', 'name', 'بسكويت الشاي', 367),
('App\\Model\\Product', 204, 'ye', 'name', 'بسكويت الشاي', 368),
('App\\Model\\Product', 205, 'ye', 'name', 'كات كات', 369),
('App\\Model\\Product', 206, 'ye', 'name', 'كات كات', 370),
('App\\Model\\Product', 207, 'ye', 'name', 'كات كات', 371),
('App\\Model\\Product', 208, 'ye', 'name', 'كوكو برنس', 372),
('App\\Model\\Product', 209, 'ye', 'name', 'كوكو برنس', 373),
('App\\Model\\Product', 210, 'ye', 'name', 'كوكو برنس', 374),
('App\\Model\\Product', 211, 'ye', 'name', 'بسكريم', 375),
('App\\Model\\Product', 212, 'ye', 'name', 'بسكريم', 376),
('App\\Model\\Product', 213, 'ye', 'name', 'بسكريم', 377),
('App\\Model\\Product', 214, 'ye', 'name', 'بسكريم', 378),
('App\\Model\\Product', 215, 'ye', 'name', 'بسكريم', 379),
('App\\Model\\Product', 216, 'ye', 'name', 'بسكريم', 380),
('App\\Model\\Product', 217, 'ye', 'name', 'هوبي', 381),
('App\\Model\\Product', 218, 'ye', 'name', 'هوبي', 382),
('App\\Model\\Product', 219, 'ye', 'name', 'هوبي', 383),
('App\\Model\\Product', 220, 'ye', 'name', 'كوكو حليب', 384),
('App\\Model\\Product', 221, 'ye', 'name', 'شوكلت ويفر', 385),
('App\\Model\\Product', 222, 'ye', 'name', 'طماطم حمراء', 389),
('App\\Model\\Product', 223, 'ye', 'name', 'بصل احمر', 390),
('App\\Model\\Product', 224, 'ye', 'name', 'بطاطس -محلي 8000 غرام', 391),
('App\\Model\\Product', 225, 'ye', 'name', 'موز1000غرام', 392),
('App\\Model\\Product', 226, 'ye', 'name', 'برتقال ابو صرة 1كجم', 393),
('App\\Model\\Category', 1319, 'ye', 'name', 'رقائق مملحة', 395),
('App\\Model\\Category', 1320, 'ye', 'name', 'بطاطس', 396),
('App\\Model\\Category', 1321, 'ye', 'name', 'فشار', 397),
('App\\Model\\Category', 1322, 'ye', 'name', 'حب', 398),
('App\\Model\\Category', 1323, 'ye', 'name', 'مكسرات', 399),
('App\\Model\\Brand', 25, 'ye', 'name', 'الرجوي', 400),
('App\\Model\\Category', 1324, 'ye', 'name', 'بهارات', 401),
('App\\Model\\Category', 1325, 'ye', 'name', 'ملح&خل', 402),
('App\\Model\\Product', 227, 'ye', 'name', 'حلبة الرجوي 250 جرام', 403),
('App\\Model\\Product', 228, 'ye', 'name', 'فول مدمس ميم', 404),
('App\\Model\\Product', 229, 'ye', 'name', 'جبنة افيدوو', 405),
('App\\Model\\Brand', 26, 'ye', 'name', 'ميم', 406),
('App\\Model\\Brand', 27, 'ye', 'name', 'افيدو', 407),
('App\\Model\\Product', 230, 'ye', 'name', 'البازلاء خضراء', 408),
('App\\Model\\Product', 231, 'ye', 'name', 'مكرونة ميم- طويل', 409),
('App\\Model\\Product', 232, 'ye', 'name', 'حليب اوال مبخر', 410),
('App\\Model\\Product', 233, 'ye', 'name', 'بيض شكلاتة زيني', 411),
('App\\Model\\Brand', 28, 'ye', 'name', 'النخبة', 412),
('App\\Model\\Product', 234, 'ye', 'name', 'جبن مثلث النخبة', 413),
('App\\Model\\Product', 235, 'ye', 'name', 'فاصوليا مطبوخة', 414),
('App\\Model\\Product', 236, 'ye', 'name', 'فاصولياء حمراء', 415),
('App\\Model\\Product', 237, 'ye', 'name', 'شوكولاتة زيني ابوملعقة crockkiجرام18', 416),
('App\\Model\\Product', 238, 'ye', 'name', 'شكولاته زيني 3بيض60جرام كرتون', 417),
('App\\Model\\Product', 239, 'ye', 'name', 'كلوركس مطهر1890مل', 418),
('App\\Model\\Category', 1328, 'ye', 'name', 'النظافة الشخصية', 419),
('App\\Model\\Product', 240, 'ye', 'name', 'خميرة اوزمايا 125جرام', 421),
('App\\Model\\Product', 241, 'ye', 'name', 'شوكولاتة اسباني 4*24*20جرام قلم حبيبات', 422),
('App\\Model\\Brand', 29, 'ye', 'name', 'اركوما', 423),
('App\\Model\\Brand', 30, 'ye', 'name', 'شاهي الوزة', 424),
('App\\Model\\Brand', 31, 'ye', 'name', 'تالدا', 425),
('App\\Model\\Brand', 32, 'ye', 'name', 'Taisun', 426),
('App\\Model\\Product', 18, 'ye', 'name', 'اندومي نكهة الخضروات 75 غرام', 427),
('App\\Model\\Product', 16, 'ye', 'name', 'كرتون جبنة شيدر كرافت 100 جرام 60 حبة', 428),
('App\\Model\\Product', 16, 'ye', 'description', '<h1>كرتون جبنة شيدر كرافت 100 جرام 60 حبة</h1>', 429),
('App\\Model\\Product', 19, 'ye', 'name', 'شعيرية اندومي كاري دجاج 40*75 جرام', 430),
('App\\Model\\Product', 20, 'ye', 'name', 'شعيرية اندومي مقلية 40*70جم', 431),
('App\\Model\\Product', 20, 'ye', 'description', '<h1>شعيرية اندومي مقلية 40*70جم</h1>', 432),
('App\\Model\\Product', 21, 'ye', 'name', 'إندومي بنكهة الدجاج الخاصة', 433),
('App\\Model\\Product', 21, 'ye', 'description', '<h1>إندومي بنكهة الدجاج الخاصة</h1>', 434),
('App\\Model\\Product', 15, 'ye', 'name', 'كرتون تونه الغويزي 185جرام 48 حبة', 435),
('App\\Model\\Product', 15, 'ye', 'description', '<h1>كرتون تونه الغويزي 185جرام 48 حبة</h1>', 436),
('App\\Model\\Product', 14, 'ye', 'name', 'عصير سن توب شد 30 *250', 437),
('App\\Model\\Product', 14, 'ye', 'description', '<h1>عصير سن توب شد 30 *250</h1>', 438),
('App\\Model\\Product', 12, 'ye', 'name', 'بيبسي شد24', 439),
('App\\Model\\Product', 12, 'ye', 'description', '<p>بيبسي شد24بيبسي شد24بيبسي شد24بيبسي شد24</p>', 440),
('App\\Model\\Product', 13, 'ye', 'name', 'كرتون شاي فضفاض من الكبوس 227 جرام 40 حبة', 441),
('App\\Model\\Product', 241, 'ye', 'description', '<p>شكلاتة لايكوس</p>', 442),
('App\\Model\\Product', 242, 'ye', 'name', 'حليب بالفراولة طويل الأجل', 443),
('App\\Model\\Product', 243, 'ye', 'name', 'حليب بالشوكولاتة طويل الأجل', 444),
('App\\Model\\Product', 244, 'ye', 'name', 'حليب طويل الأجل قليل الدسم', 445),
('App\\Model\\Product', 245, 'ye', 'name', 'جبنة مثلث البقرة الضاحكة', 446),
('App\\Model\\Product', 246, 'ye', 'name', 'حبات شوكولاتة لاكاسيتوس', 448),
('App\\Model\\Product', 247, 'ye', 'name', 'شوكولاتة اسباني 6*12*75جرام الواح لاكسيتوس', 449),
('App\\Model\\Product', 248, 'ye', 'name', 'شوكولاتة اسباني 40*70جرام باترول', 450),
('App\\Model\\Product', 249, 'ye', 'name', '100 جنجر', 451),
('App\\Model\\Product', 250, 'ye', 'name', 'رد جنسنج', 452),
('App\\Model\\Product', 251, 'ye', 'name', 'قشطة افيدو', 453),
('App\\Model\\Product', 274, 'ye', 'name', 'قشطة افيدو', 454),
('App\\Model\\Product', 273, 'ye', 'name', 'رد جنسنج', 455),
('App\\Model\\Product', 275, 'ye', 'name', 'عصير عنب  بدون إضافة سكر وألوان. مبستر. 1,5لتر', 456),
('App\\Model\\Product', 276, 'ye', 'name', 'عصير عنب  بدون إضافة سكر وألوان. مبستر.', 457),
('App\\Model\\Product', 277, 'ye', 'name', 'عصير عنب', 458),
('App\\Model\\Product', 278, 'ye', 'name', 'mixed-berry-350x460.png', 459),
('App\\Model\\Product', 279, 'ye', 'name', 'عصير جوافه  نكتار الجوافة المعاد تكوينه. خالي من المواد الحافظة. مبستر.', 460),
('App\\Model\\Product', 281, 'ye', 'name', 'عصير برتقال  بدون إضافة سكر ومواد حافظة وألوان. مبستر.', 461),
('App\\Model\\Product', 282, 'ye', 'name', 'عصير برتقال المعلومات الغذائية', 462),
('App\\Model\\Product', 272, 'ye', 'name', '100 جنجر', 463),
('App\\Model\\Product', 271, 'ye', 'name', 'شوكولاتة اسباني 40*75جرام باترول', 464),
('App\\Model\\Product', 270, 'ye', 'name', 'شوكولاتة اسباني 6*12*75جرام الواح لاكسيتوس', 465),
('App\\Model\\Product', 269, 'ye', 'name', 'شوكولاته اسباني  لاكاسيتوس المظللة', 466),
('App\\Model\\Product', 267, 'ye', 'name', 'حليب طويل الأجل قليل الدسم', 467),
('App\\Model\\Product', 266, 'ye', 'name', 'حليب بالشوكولاتة طويل الأجل', 468),
('App\\Model\\Product', 262, 'ye', 'name', 'شكولاته زيني 3بيض60جرام كرتون', 469),
('App\\Model\\Product', 263, 'ye', 'name', 'خميرة اوزمايا 125جرام', 470),
('App\\Model\\Product', 263, 'ye', 'description', '<p>خميرة اوزمايا 125جرام</p>', 471),
('App\\Model\\Product', 264, 'ye', 'name', 'شوكولاتة اسباني 4*24*20جرام قلم حبيبات', 472),
('App\\Model\\Product', 265, 'ye', 'name', 'حليب بالفراولة طويل الأجل', 473),
('App\\Model\\Product', 261, 'ye', 'name', 'شوكولاتة زيني ابوملعقة crockkiجرام18', 474),
('App\\Model\\Product', 253, 'ye', 'name', 'جبنة افيدوو', 475),
('App\\Model\\Product', 254, 'ye', 'name', 'البازلاء خضراء', 476),
('App\\Model\\Product', 255, 'ye', 'name', 'مكرونة ميم- طويل', 477),
('App\\Model\\Product', 256, 'ye', 'name', 'حليب اوال مبخر', 478),
('App\\Model\\Product', 257, 'ye', 'name', 'بيض شكلاتة زيني', 479),
('App\\Model\\Product', 258, 'ye', 'name', 'جبن مثلث النخبة', 480),
('App\\Model\\Product', 259, 'ye', 'name', 'فاصوليا مطبوخة', 481),
('App\\Model\\Product', 252, 'ye', 'name', 'فول مدمس ميم', 482),
('App\\Model\\Product', 283, 'ye', 'name', 'فول مدمس ميم', 483),
('App\\Model\\Category', 1331, 'ye', 'name', 'فوط صحية', 484),
('App\\Model\\Category', 1332, 'ye', 'name', 'شفرات حلاقة', 485),
('App\\Model\\Category', 1333, 'ye', 'name', 'مزيلات التعرف', 486),
('App\\Model\\Category', 1334, 'ye', 'name', 'ادوات الحلاقة', 487),
('App\\Model\\Category', 1335, 'ye', 'name', 'اخرى', 488),
('App\\Model\\Category', 1336, 'ye', 'name', 'مناديل للوجة', 489),
('App\\Model\\Category', 1337, 'ye', 'name', 'مناديل مطبخ', 490),
('App\\Model\\Category', 1338, 'ye', 'name', 'مناديل حمام', 491),
('App\\Model\\Category', 1339, 'ye', 'name', 'معجون أسنان', 492),
('App\\Model\\Category', 1340, 'ye', 'name', 'فرشة أسنان', 493),
('App\\Model\\Category', 1341, 'ye', 'name', 'صابون قطع', 494),
('App\\Model\\Category', 1342, 'ye', 'name', 'صابون سائل', 495),
('App\\Model\\Category', 1343, 'ye', 'name', 'سائل استحمام', 496),
('App\\Model\\Category', 1344, 'ye', 'name', 'معقمات', 497),
('App\\Model\\Category', 1345, 'ye', 'name', 'العناية بالوجة', 498),
('App\\Model\\Category', 1346, 'ye', 'name', 'العناية بالوجة&اليدين', 499),
('App\\Model\\Category', 1347, 'ye', 'name', 'مرطب الشفاه', 500),
('App\\Model\\Category', 1348, 'ye', 'name', 'شامبو', 501),
('App\\Model\\Category', 1349, 'ye', 'name', 'بلسم', 502),
('App\\Model\\Category', 1350, 'ye', 'name', 'أصباغ الشعر', 503),
('App\\Model\\Category', 1351, 'ye', 'name', 'منظفات', 504),
('App\\Model\\Category', 1352, 'ye', 'name', 'سائل غسيل الصحون', 505),
('App\\Model\\Category', 1353, 'ye', 'name', 'مطهر الأسطح', 506),
('App\\Model\\Category', 1354, 'ye', 'name', 'مبيضات', 507),
('App\\Model\\Category', 1355, 'ye', 'name', 'منعم للاقمشة', 508),
('App\\Model\\Category', 1356, 'ye', 'name', 'منظفات زجاج', 509),
('App\\Model\\Category', 1357, 'ye', 'name', 'منظفات الحمام', 510),
('App\\Model\\Category', 1358, 'ye', 'name', 'منظفات متعددة الأغراض', 511),
('App\\Model\\Category', 1359, 'ye', 'name', 'منظفات المطبخ', 512),
('App\\Model\\Category', 1360, 'ye', 'name', 'شامبو العباية', 513),
('App\\Model\\Category', 1361, 'ye', 'name', 'السيفة الفولاذية&إسفنج&قماش', 514),
('App\\Model\\Category', 1362, 'ye', 'name', 'منظفات متخصصة', 515),
('App\\Model\\Product', 287, 'ye', 'name', 'شوكلاته روشن نوجا بالفول السوداني 38 جرام', 519),
('App\\Model\\Product', 288, 'ye', 'name', 'شوكلاته روشن نوجا بالكراميل 40 جرام', 520),
('App\\Model\\Product', 291, 'ye', 'name', 'شوكلاته روشن تد بت بالفول السوداني 50 جرام', 523),
('App\\Model\\Product', 292, 'ye', 'name', 'ويفر روشن جوني كروكر 500جم', 524),
('App\\Model\\Product', 293, 'ye', 'name', 'ويفر كونافيتو اصابع بالفانيلياء 140جرام', 525),
('App\\Model\\Product', 294, 'ye', 'name', 'ويفر روشن مربع بالبندق 72 جرام', 526),
('App\\Model\\Product', 295, 'ye', 'name', 'ويفر روشن مربع بالشوكلاته 72جرام', 527),
('App\\Model\\Brand', 33, 'ye', 'name', 'موسي', 528),
('App\\Model\\Product', 296, 'ye', 'name', 'شراب شعير خالي من الكحول بنكهة التوت المثلج 330مل عبوة من 6 قطع', 529),
('App\\Model\\Product', 297, 'ye', 'name', 'شراب شعير كلاسيك خالٍ من الكحول زجاجات 330مل عبوة من 6 قطع', 530),
('App\\Model\\Product', 298, 'ye', 'name', 'زجاجات شراب شعير بنكهة التوت الأحمر خالٍ من الكحول 330مل عبوة من 6 قطع', 531),
('App\\Model\\Product', 299, 'ye', 'name', 'شرابب شعير خالي من الكحول بنكهة التفاح 330مل عبوة من 6 قطع', 532),
('App\\Model\\Product', 300, 'ye', 'name', 'ديلسي رمان 24 * 330 مل', 533),
('App\\Model\\Product', 301, 'ye', 'name', 'ديلسي تفاح 24 * 330 مل', 534),
('App\\Model\\Product', 302, 'ye', 'name', 'ديلسي كولا 24 * 330 مل', 535),
('App\\Model\\Product', 303, 'ye', 'name', 'ديلسي برتقال 24 * 330 مل', 536),
('App\\Model\\Product', 304, 'ye', 'name', 'ديلسي زنجبيل 24 * 500 مل', 537),
('App\\Model\\Product', 305, 'ye', 'name', 'ديلسي كولا 24 * 500 مل', 538),
('App\\Model\\Product', 306, 'ye', 'name', 'ديلسي رمان 24 * 500 مل', 539),
('App\\Model\\Product', 307, 'ye', 'name', 'راني تفاح 24 حبه * 500 مل', 540),
('App\\Model\\Product', 309, 'ye', 'name', 'ديكو عصير حبيبات الخوخ علب 30 * 250 مل', 541),
('App\\Model\\Product', 310, 'ye', 'name', 'راني عصير حبيبات البرتقال 30 * 250 مل', 542),
('App\\Model\\Product', 311, 'ye', 'name', 'راني عصير المانجو 30 * 250 مل', 543),
('App\\Model\\Product', 312, 'ye', 'name', 'راني عصير الجوافة 30 * 250 مل', 544),
('App\\Model\\Product', 314, 'ye', 'name', 'شوكولاتة سعيد حليب 36*23 جم', 545),
('App\\Model\\Product', 315, 'ye', 'name', 'شوكولاتة ميثيك ميني 24 * 12 جم', 546),
('App\\Model\\Product', 316, 'ye', 'name', 'شوكولاتة ميثيك بالحليب 24*30 جم', 547),
('App\\Model\\Product', 317, 'ye', 'name', 'سعيد شوكولاتة ابو ملعقة 48*18 جم', 548),
('App\\Model\\Product', 318, 'ye', 'name', 'روزانا مكرونة طويلة 20 * 400 جم', 549),
('App\\Model\\Product', 319, 'ye', 'name', 'الربان أرز بسمتي 5كجم', 550),
('App\\Model\\Product', 320, 'ye', 'name', 'اوبس شوكولاتة مزاز 60 حبة', 551),
('App\\Model\\Brand', 34, 'ye', 'name', 'كاراباو', 552),
('App\\Model\\Brand', 35, 'ye', 'name', 'سعيد', 553),
('App\\Model\\Brand', 36, 'ye', 'name', 'الريان', 554),
('App\\Model\\Brand', 37, 'ye', 'name', 'فيانو', 555),
('App\\Model\\Product', 321, 'ye', 'name', 'شوكولاتة فيانو أصابع شوكولاتةبكريمة الحليب', 556),
('App\\Model\\Product', 322, 'ye', 'name', 'شوكولاتة فيانو', 557),
('App\\Model\\Product', 323, 'ye', 'name', 'برينجلز رقائق  البطاطس بالكتاشب 165 غرام', 558),
('App\\Model\\Product', 324, 'ye', 'name', 'برينجلز رقائق  البطاطس نكة الملح والخل 165 غرام', 559),
('App\\Model\\Brand', 38, 'ye', 'name', 'OREO', 560),
('App\\Model\\Product', 326, 'ye', 'name', 'شكولاته كادبيري ديري ميلك اوريو - 12 قطعة 38 جم', 561),
('App\\Model\\Product', 327, 'ye', 'name', 'شكولاته كادبيري ديري ميلك اوريو - 12 قطعة 38 جم', 562),
('App\\Model\\Brand', 39, 'ye', 'name', 'Coppenrath', 563),
('App\\Model\\Product', 328, 'ye', 'name', 'البسكويت الالماني Grazer Rings', 564),
('App\\Model\\Product', 329, 'ye', 'name', 'ديمه فانتزي كيك بكريمة الشوكولاتة', 565),
('App\\Model\\Product', 330, 'ye', 'name', 'ديمه فانتزي كيك بكريمة الشوكولاتة', 566),
('App\\Model\\Product', 331, 'ye', 'name', 'ديمه كيك تريتو مارمو بكريمة الشوكلاتة 40 جرام', 567),
('App\\Model\\Product', 332, 'ye', 'name', 'دونات كيك الشوكولاته - 12x40G', 568),
('App\\Model\\Product', 333, 'ye', 'name', 'بسكويت التمر - 24x75G', 569),
('App\\Model\\Product', 334, 'ye', 'name', 'معمول بالتمر - 16x16G', 570),
('App\\Model\\Product', 335, 'ye', 'name', 'رافيلو بجوز الهند 30 جرام × 16', 571),
('App\\Model\\Product', 336, 'ye', 'name', 'بطاطس ملح وخل - 21x12G', 572);
INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Product', 337, 'ye', 'name', 'بطاطس جبنة فرنسية - 21x12G', 573),
('App\\Model\\Product', 338, 'ye', 'name', 'بطاطس كاتشب - 21x12G', 574),
('App\\Model\\Product', 339, 'ye', 'name', 'شيكولاتة ديري ميلك مع Oreo من كادبوري، 95 جرام - 12 قطعة', 575),
('App\\Model\\Product', 340, 'ye', 'name', 'شيكولاتة ديري ميلك مع Oreo من كادبوري، 95 جرام - 12 قطعة', 576),
('App\\Model\\Brand', 40, 'ye', 'name', 'بيتي كروكر', 577),
('App\\Model\\Product', 342, 'ye', 'name', 'خليط كيك البراوني بالشوكولاتة الداكنة 500 غ', 578),
('App\\Model\\Brand', 41, 'ye', 'name', 'تيشوب', 579),
('App\\Model\\Brand', 42, 'ye', 'name', 'الممتاز', 580),
('App\\Model\\Brand', 43, 'ye', 'name', 'البقري', 581),
('App\\Model\\Brand', 44, 'ye', 'name', 'الهناء', 582),
('App\\Model\\Brand', 45, 'ye', 'name', 'هنية', 583),
('App\\Model\\Product', 343, 'ye', 'name', 'هنية عصير تفاح125مل', 584),
('App\\Model\\Product', 344, 'ye', 'name', 'هنية عصير المانجو 44 * 125 مل', 585),
('App\\Model\\Product', 345, 'ye', 'name', 'هنية عصير الجوافة 44 * 125 مل', 586),
('App\\Model\\Product', 346, 'ye', 'name', 'هنية عصير فريتو مشكل توت 44* 125 مل', 587),
('App\\Model\\Product', 347, 'ye', 'name', 'هنية عصير برتقال44 * 125 مل', 588),
('App\\Model\\Product', 348, 'ye', 'name', 'الربيع عصير المانجو 18 * 200 مل', 589),
('App\\Model\\Product', 350, 'ye', 'name', 'الربيع عصير توت مشكل 200مل', 590),
('App\\Model\\Product', 351, 'ye', 'name', 'الربيع حليب 250مل', 591),
('App\\Model\\Category', 1363, 'ye', 'name', 'طلبيات كبيرة', 592),
('App\\Model\\Category', 1364, 'ye', 'name', 'طلبيات كبيرة', 593),
('App\\Model\\Category', 1365, 'ye', 'name', 'مياه', 594),
('App\\Model\\Category', 1367, 'ye', 'name', 'مشروبات الشعير &مركزة', 595),
('App\\Model\\Category', 1368, 'ye', 'name', 'عصير & حليب', 596),
('App\\Model\\Category', 1369, 'ye', 'name', 'بطاطس', 597),
('App\\Model\\Category', 1370, 'ye', 'name', 'زيت &ملح', 598),
('App\\Model\\Category', 1371, 'ye', 'name', 'معجون الطماطم & شطة', 599),
('App\\Model\\Category', 1372, 'ye', 'name', 'بازالاء & اندومي', 600),
('App\\Model\\Product', 375, 'ye', 'name', 'شوكولاتة فيوري كراميل كبير 12*40', 601),
('App\\Model\\Product', 376, 'ye', 'name', 'بريك 4 اصابع شكولاتة تيفاني كبير 12 * 31 جم', 602),
('App\\Model\\Brand', 46, 'ye', 'name', 'تيفاني', 603),
('App\\Model\\Product', 377, 'ye', 'name', 'بريك شوكولاته ديلايت 3 أصابع 12 * 25 جم', 604),
('App\\Model\\Product', 378, 'ye', 'name', 'شكولاتة بريك باور تيفاني 12*35جم', 605),
('App\\Model\\Product', 379, 'ye', 'name', 'شكولاتة بريك ريزو صغير 24*20جم', 606),
('App\\Model\\Product', 380, 'ye', 'name', 'شوكولاتة هابي بريك تيفاني 24*16جم', 607),
('App\\Model\\Product', 381, 'ye', 'name', 'شوكولاتة بريك ريزو (بالفول السوداني) 24*20 جم', 608),
('App\\Model\\Product', 382, 'ye', 'name', 'شوكولاتة المونداي صغير 12*35جم', 609),
('App\\Model\\Product', 383, 'ye', 'name', 'شوكولاتة فيوري بالقهوة 24 * 18 جم', 610),
('App\\Model\\Product', 384, 'ye', 'name', 'شوكولاتة تيك فايف 2 اصابع صغير 24*15,5جم', 611),
('App\\Model\\Product', 385, 'ye', 'name', 'شوكولاتة تيك فايف 3 اصابع 24*23,5 جم', 612),
('App\\Model\\Product', 386, 'ye', 'name', 'شوكولاتة بيج بريك 12 * 45 جم', 613),
('App\\Model\\Product', 387, 'ye', 'name', 'شوكولاتة بلاس ون ايس مان 24*11 جم', 614),
('App\\Model\\Product', 388, 'ye', 'name', 'شوكولاتة اونلي ايس مان 24*11 جم', 615),
('App\\Model\\Product', 389, 'ye', 'name', 'افيزا بلاس شوكولاتة بالكراميل 24*20 جم', 616),
('App\\Model\\Product', 390, 'ye', 'name', 'شوكولاتة بريك ديلايت 2 اصابع 24*16,5 جم', 617),
('App\\Model\\Product', 391, 'ye', 'name', 'شوكولاتة فيوري صغير 24*18 جم', 618),
('App\\Model\\Product', 392, 'ye', 'name', 'شوكولاتة فيوري كراميل صغير 24**20 جم', 619),
('App\\Model\\Product', 393, 'ye', 'name', 'شوكولاتة يونكرز صغير 24*20 جم', 620),
('App\\Model\\Product', 394, 'ye', 'name', 'شوكولاتة بالو كنج بار 24*18 جم', 621),
('App\\Model\\Product', 395, 'ye', 'name', 'شوكولاتة جنتي داكنه اصابع بالكراميل 12*35 جم', 622),
('App\\Model\\Product', 396, 'ye', 'name', 'شوكولاتة جنتي اصابع بالحليب 12*35 جم', 623),
('App\\Model\\Product', 397, 'ye', 'name', 'شوكولاتة جنتي اصابع بالكراميل 12*35 جم', 624),
('App\\Model\\Product', 398, 'ye', 'name', 'بريو بيكاديلي ويفر مغطى بالشكولاتة 24*26 جم', 625),
('App\\Model\\Product', 399, 'ye', 'name', 'شوكولاتة ريكو اكس ال بيج بيكاديلي 12 * 45 جم', 626),
('App\\Model\\Product', 400, 'ye', 'name', 'شوكولاتة ريكو بيكاديلي 3 اصابع 24*23 جم', 627),
('App\\Model\\Product', 401, 'ye', 'name', 'شوكولاتة ريكو بيكاديلي 2 اصابع24*15,5 جم', 628),
('App\\Model\\Product', 402, 'ye', 'name', 'شوكولاتة بيكاديلي سيلكا 12*45 جم', 629),
('App\\Model\\Product', 403, 'ye', 'name', 'افيزا رويال شوكولاتة بالحليب 24*18 جم', 630),
('App\\Model\\Product', 404, 'ye', 'name', 'شوكولاتة افيزا بلاس بار كراميل 24*40جم', 631),
('App\\Model\\Brand', 47, 'ye', 'name', 'minuet', 632),
('App\\Model\\Brand', 48, 'ye', 'name', 'ElHelwa', 633),
('App\\Model\\Brand', 49, 'ye', 'name', 'amazon', 634),
('App\\Model\\Brand', 50, 'ye', 'name', 'sorini', 635),
('App\\Model\\Brand', 51, 'ye', 'name', 'totlidiller', 636),
('App\\Model\\Brand', 52, 'ye', 'name', 'DORIVA', 637),
('App\\Model\\Brand', 53, 'ye', 'name', 'ElSabah', 638),
('App\\Model\\Brand', 54, 'ye', 'name', 'almoutafawek', 639),
('App\\Model\\Brand', 55, 'ye', 'name', 'PERSTIGE', 640),
('App\\Model\\Brand', 56, 'ye', 'name', 'ANI', 641),
('App\\Model\\Brand', 57, 'ye', 'name', 'HS', 642),
('App\\Model\\Brand', 58, 'ye', 'name', 'Match', 643),
('App\\Model\\Brand', 59, 'ye', 'name', 'colian', 644),
('App\\Model\\Brand', 60, 'ye', 'name', 'asya', 645),
('App\\Model\\Brand', 61, 'ye', 'name', 'JORDINA', 646),
('App\\Model\\Product', 405, 'ye', 'name', 'الهناء فاصولياء حمراء 24حبه', 647),
('App\\Model\\Product', 406, 'ye', 'name', 'اسمايلي بسكويت 60حبه*45 جرام', 648),
('App\\Model\\Brand', 62, 'ye', 'name', 'لونا', 649),
('App\\Model\\Product', 407, 'ye', 'name', 'لونا بالعسل قشطة 12حبه*170جم', 650),
('App\\Model\\Product', 408, 'ye', 'name', 'بسكويت الشاي تيشوب 24حبه*130جم', 651),
('App\\Model\\Product', 409, 'ye', 'name', 'فل مناديل جيب 18شدة*10', 652),
('App\\Model\\Product', 410, 'ye', 'name', 'كريستال ورد غسيل ملابس 12حبه*500جم', 653),
('App\\Model\\Brand', 63, 'ye', 'name', 'كريم', 654),
('App\\Model\\Product', 411, 'ye', 'name', 'لونا قشطة 12حبه*170جم', 655),
('App\\Model\\Product', 412, 'ye', 'name', 'كريم زيت 20 لتر', 656),
('App\\Model\\Brand', 64, 'ye', 'name', 'sella', 657),
('App\\Model\\Product', 413, 'ye', 'name', 'سيلا ارز مزة 10كجم', 658),
('App\\Model\\Product', 414, 'ye', 'name', 'تانج عصير برتقال اكياس 1كجم', 659),
('App\\Model\\Product', 415, 'ye', 'name', 'بوربون بسكويت 48 * 80 جم', 660),
('App\\Model\\Brand', 65, 'ye', 'name', 'نوودي', 661),
('App\\Model\\Product', 416, 'ye', 'name', 'نودي دجاج خاصه 40حبه*65جرام', 662),
('App\\Model\\Product', 417, 'ye', 'name', 'سمن البنت 6كجم', 663),
('App\\Model\\Product', 418, 'ye', 'name', 'سمن البنت 6كجم', 664),
('App\\Model\\Brand', 66, 'ye', 'name', 'السعيد', 665),
('App\\Model\\Brand', 67, 'ye', 'name', 'السنابل', 666),
('App\\Model\\Product', 419, 'ye', 'name', 'السعيد سكر 5كجم', 667),
('App\\Model\\Category', 1373, 'ye', 'name', 'سمن', 668),
('App\\Model\\Product', 420, 'ye', 'name', 'السنابل دقيق كبير 50كيلو', 669),
('App\\Model\\Product', 421, 'ye', 'name', 'ابو ولد بسكويت 48حبه*100 جرام', 670),
('App\\Model\\Product', 422, 'ye', 'name', 'بقري حليب كبير 20حبه*500 مل', 671),
('App\\Model\\Product', 423, 'ye', 'name', 'الممتاز حليب صغير 48حبه*170جرام', 672),
('App\\Model\\Product', 424, 'ye', 'name', 'الممتاز حليب كبير 24حبه*400جرام', 673),
('App\\Model\\Product', 425, 'ye', 'name', 'الهناء بزالياء خضراء 24حبه', 674),
('App\\Model\\Brand', 68, 'ye', 'name', 'كريستال', 675),
('App\\Model\\Product', 426, 'ye', 'name', 'كريستال ورد غسيل ملابس 48حبه*100 جرام', 676),
('App\\Model\\Product', 427, 'ye', 'name', 'بقري حليب صغير 28حبه*250 مل', 677),
('App\\Model\\Brand', 69, 'ye', 'name', 'الواحة', 678),
('App\\Model\\Product', 428, 'ye', 'name', 'الواحة ارز مزة 10 كيلو', 679),
('App\\Model\\Brand', 70, 'ye', 'name', 'اورجنال', 680),
('App\\Model\\Product', 429, 'ye', 'name', 'اورجينال عصير توت 27*200مل', 681),
('App\\Model\\Product', 430, 'ye', 'name', 'اورجينال عصير خوخ 27*200مل', 682),
('App\\Model\\Brand', 71, 'ye', 'name', 'اندومي', 683),
('App\\Model\\Product', 431, 'ye', 'name', 'اندومي نكهة كاري دجاج 40 * 75 جرام', 684),
('App\\Model\\Product', 432, 'ye', 'name', 'اندومي نكهة الدجاج الخاصة 40 * 75 جرام', 685),
('App\\Model\\Product', 433, 'ye', 'name', 'اندومي نكهة الدجاج البلدي 40 * 75 جرام', 686),
('App\\Model\\Product', 434, 'ye', 'name', 'اندومي نكهة خضار 40 * 75 جرام', 687),
('App\\Model\\Brand', 72, 'ye', 'name', 'فاخر', 688),
('App\\Model\\Product', 435, 'ye', 'name', 'فاخر عصير مانجو زجاج 24 * 200 مل', 689),
('App\\Model\\Product', 436, 'ye', 'name', 'فاخر شراب الفاكهة مانجو عائلي 6 * 1.5 لتر', 690),
('App\\Model\\Product', 437, 'ye', 'name', 'سيزر عصير برتقال وجزر 24 * 250 مل', 691),
('App\\Model\\Product', 438, 'ye', 'name', 'سيزر عصير مانجو 24 * 250 مل', 692),
('App\\Model\\Product', 439, 'ye', 'name', 'سيزر عصير جوافة 24 * 250 مل', 693),
('App\\Model\\Product', 440, 'ye', 'name', 'اورجينال عصير مانجو 27*200مل', 694),
('App\\Model\\Product', 441, 'ye', 'name', 'اورجينال عصير برتقال 27*200مل', 695),
('App\\Model\\Product', 442, 'ye', 'name', 'الخريف طحينية تنك 15 كجم', 696),
('App\\Model\\Product', 443, 'ye', 'name', 'الخريف طحينية سطول 1400 جم', 697),
('App\\Model\\Product', 445, 'ye', 'name', 'فاصوليا الفخامة', 698),
('App\\Model\\Product', 446, 'ye', 'name', 'تونة الفخامة', 699),
('App\\Model\\Product', 447, 'ye', 'name', 'معجون طماطم الفخامة 30 جرام', 700),
('App\\Model\\Product', 448, 'ye', 'name', 'أرز الفخامة 10 كيلو', 701),
('App\\Model\\Brand', 73, 'ye', 'name', 'راوخ', 702),
('App\\Model\\Product', 450, 'ye', 'name', 'راوخ عصير مانجو علب طويل 24*355مل', 703),
('App\\Model\\Product', 451, 'ye', 'name', 'راوخ عصير عنب احمر علب طويل 24*355مل', 704),
('App\\Model\\Product', 452, 'ye', 'name', 'الغابه السوداء عسل عائلي1* 1.5كجم', 705),
('App\\Model\\Product', 453, 'ye', 'name', 'نعمان بطاطس بالكاتشب عبوة 50', 706),
('App\\Model\\Product', 454, 'ye', 'name', 'نعمان بطاطس بالفلفل الحار عبوة 50', 707),
('App\\Model\\Brand', 74, 'ye', 'name', 'نعمان', 708),
('App\\Model\\Product', 455, 'ye', 'name', 'نعمان بطاطس بالملح عبوة 50', 709),
('App\\Model\\Product', 457, 'ye', 'name', 'نعمان بطاطس بالجبنة*50', 710),
('App\\Model\\Product', 458, 'ye', 'name', 'نعمان بطاطس بالليمون والفلفل عائلي', 711),
('App\\Model\\Product', 459, 'ye', 'name', 'نعمان بطاطس اصابع', 712),
('App\\Model\\Product', 460, 'ye', 'name', 'نعمان بطاطس بالليمون والفلفل عبوة 50', 713),
('App\\Model\\Product', 461, 'ye', 'name', 'نعمان بطاطس بالكاتشب الحار عبوة 50', 714),
('App\\Model\\Product', 462, 'ye', 'name', 'مشروب الزنجبيل البريطاني', 715),
('App\\Model\\Product', 463, 'ye', 'name', 'حبوب قمح وحليب وفواكه مشكلة 250جم', 716),
('App\\Model\\Product', 465, 'ye', 'name', 'الحلوة طحينية 1.5كجم', 717),
('App\\Model\\Product', 466, 'ye', 'name', 'الامازون شاي احمر 250جم', 718),
('App\\Model\\Product', 467, 'ye', 'name', 'جمجمة مليم ابو عود 1 * 48حبة', 719),
('App\\Model\\Product', 468, 'ye', 'name', 'دبلين مليم ابو عود 1 * 48حبة', 720),
('App\\Model\\Product', 469, 'ye', 'name', 'اورين قشطة 12*170جم', 721),
('App\\Model\\Product', 470, 'ye', 'name', 'امازون كاتشب 4لتر', 722),
('App\\Model\\Product', 472, 'ye', 'name', 'الكنج مكرونة مقطع 20*300جم', 723),
('App\\Model\\Product', 473, 'ye', 'name', 'الكنج شعيرية 20*300جم', 724),
('App\\Model\\Product', 476, 'ye', 'name', 'الامازون بروميوم حليب مجفف الاصلي 25 كجم', 725),
('App\\Model\\Product', 477, 'ye', 'name', 'الامازون محلبية 12*300جم', 726),
('App\\Model\\Product', 478, 'ye', 'name', 'جوردينا كيك 12 * 40 جم', 727),
('App\\Model\\Product', 479, 'ye', 'name', 'باني عصير مانجو 27*200مل', 728),
('App\\Model\\Product', 485, 'ye', 'name', 'جوردينا كيك دونت 12 * 45 جم', 729),
('App\\Model\\Product', 486, 'ye', 'name', 'سويس رول كيك عائلي 8* 265 جم', 730),
('App\\Model\\Product', 487, 'ye', 'name', 'سويس رول كيك 24 * 50 جم 3 قطع', 731),
('App\\Model\\Product', 488, 'ye', 'name', 'الحلوة تونة 12* 160 جم', 732),
('App\\Model\\Brand', 75, 'ye', 'name', 'giggles', 733),
('App\\Model\\Brand', 76, 'ye', 'name', 'amasi', 734),
('App\\Model\\Brand', 79, 'ye', 'name', 'الفيصل', 735),
('App\\Model\\Product', 492, 'ye', 'name', 'أرز الفيصل حبة صغير5كجم', 736),
('App\\Model\\FlashDeal', 3, 'ye', 'title', 'عروض مؤقته', 737),
('App\\Model\\Brand', 80, 'ye', 'name', 'دندنة', 738),
('App\\Model\\Product', 494, 'ye', 'name', 'هيلزبرغ مشروب عادي ، عبوة من 6', 739),
('App\\Model\\Product', 495, 'ye', 'name', 'فوري بسكويت كبير 24 * 160 جم', 740),
('App\\Model\\Product', 496, 'ye', 'name', 'كعكة أولكر ألبيلا المطلية بالشوكولاتة البيضاء مع صلصة الكاكاو، 40 جم (عبوة من 24 قطعة)', 741),
('App\\Model\\Product', 497, 'ye', 'name', 'بسكويت بيك اب 24 حبة', 742),
('App\\Model\\Product', 499, 'ye', 'name', 'هالك كب كيك 40غرام', 743),
('App\\Model\\Product', 501, 'ye', 'name', 'البيلا شوكولاتة بالنوقا 24*35جم', 744),
('App\\Model\\Product', 502, 'ye', 'name', 'البيلا كيك بالشوكولاتة 24 * 40 حم', 745),
('App\\Model\\Product', 498, 'ye', 'name', 'هالك كب كيك 40غرام', 746),
('App\\Model\\Product', 373, 'ye', 'name', 'خليط كيك البراوني بالشوكولاتة الداكنة 500 غ', 747),
('App\\Model\\Product', 518, 'ye', 'name', 'بطاطس جبنة فرنسية - 21x12G', 748),
('App\\Model\\Product', 523, 'ye', 'name', 'كرتون اندومي نكهة دجاج بالكاري 60*75', 749),
('App\\Model\\Product', 524, 'ye', 'name', 'اندومي نكهة الخضار 60*75جم', 750),
('App\\Model\\Brand', 98, 'ye', 'name', 'نادك', 751),
('App\\Model\\Product', 534, 'ye', 'name', 'ارز بسمتي الربان 5 كيلو', 752),
('App\\Model\\Product', 537, 'ye', 'name', 'بيج كولا 200مل', 753),
('App\\Model\\Product', 540, 'ye', 'name', 'بيج تفاح 200مل', 754),
('App\\Model\\Product', 546, 'ye', 'name', 'كرتون مياه حده حجم كبير 1.5 لتر', 755),
('App\\Model\\Product', 548, 'ye', 'name', 'فول جالينا فول صيني', 756),
('App\\Model\\Product', 552, 'ye', 'name', 'عسل روزانا 80جم', 757),
('App\\Model\\Brand', 102, 'ye', 'name', 'أبو طربوش', 758),
('App\\Model\\Product', 568, 'ye', 'name', 'شراب الأناناس - روزي', 759),
('App\\Model\\Product', 569, 'ye', 'name', 'نكتار المانجو - فور سيزنز', 760),
('App\\Model\\Product', 585, 'ye', 'name', 'معجون طماطم - سبعة نجوم', 761),
('App\\Model\\Product', 591, 'ye', 'name', 'بازيليا - مزارع', 762),
('App\\Model\\Product', 603, 'ye', 'name', 'حليب  بلدنا250 مل', 763),
('App\\Model\\Product', 546, 'ye', 'description', 'كرتون مياه حده حجم كبير 1.5 لتر', 764),
('App\\Model\\Product', 606, 'ye', 'name', 'ارز المنارتين 5 كيلو', 765),
('App\\Model\\Product', 611, 'ye', 'name', 'ارزجواهرة', 766),
('App\\Model\\Product', 531, 'ye', 'name', 'تونا الشاهين', 767),
('App\\Model\\Product', 626, 'ye', 'name', 'بفك بكار', 768),
('App\\Model\\Product', 635, 'ye', 'name', 'أرز التباهي', 769),
('App\\Model\\Product', 681, 'ye', 'name', 'اكياس حلوى سكيتلز قابلة للمضغ بنكهة الفواكه، 38 جرام× 14', 770),
('App\\Model\\Product', 685, 'ye', 'name', 'حلوى الشوكولاتة المحشوة بجوز الهند من باونتي مينيتشرز، 150 غرام - عبوة من واحدة', 771),
('App\\Model\\Product', 686, 'ye', 'name', 'توبليرون 24 × 35 جم', 772),
('App\\Model\\Product', 720, 'ye', 'name', 'شوكولاته ملعقه زايني ايطالي 20جم 24 حبه', 773),
('App\\Model\\Product', 260, 'ye', 'name', 'فاصولياء حمراء', 774),
('App\\Model\\Product', 558, 'ye', 'name', 'حليب مركز يماني بيبي', 775),
('App\\Model\\Product', 561, 'ye', 'name', 'حليب المدارس كامل الدسم - يماني', 776),
('App\\Model\\Product', 557, 'ye', 'name', 'حليب بنكهة الموز - يماني', 777),
('App\\Model\\Product', 562, 'ye', 'name', 'الحليب الحقيقي - يماني', 778),
('App\\Model\\Brand', 166, 'ye', 'name', 'البنت', 779),
('App\\Model\\Product', 727, 'ye', 'name', 'مانجو  عصير مزون بواكت 250*24ح', 780),
('App\\Model\\Product', 735, 'ye', 'name', 'خميرة سوبر فيتامكس اوزمايا محسن 20*500غرام', 781),
('App\\Model\\Brand', 172, 'ye', 'name', 'ليجادور', 782),
('App\\Model\\Product', 739, 'ye', 'name', 'نيدو حليب مجفف مدعم 2.5كيلو', 783),
('App\\Model\\Category', 1374, 'ye', 'name', 'حبوب كاملة &قهوة مطحونة&محمصة', 784),
('App\\Model\\Category', 1375, 'ye', 'name', 'قهوة سويعة التحضير', 785),
('App\\Model\\Category', 1376, 'ye', 'name', 'كبسولات القهوة', 786),
('App\\Model\\Category', 1377, 'ye', 'name', 'القهوة العربية', 787),
('App\\Model\\Brand', 173, 'ye', 'name', 'نستلة', 788),
('App\\Model\\Brand', 154, 'ye', 'name', 'اوزمو', 789),
('App\\Model\\Brand', 155, 'ye', 'name', 'رافايلو', 790),
('App\\Model\\Brand', 156, 'ye', 'name', 'سكيتلز', 791),
('App\\Model\\Brand', 157, 'ye', 'name', 'باونتي', 792),
('App\\Model\\Brand', 158, 'ye', 'name', 'آتَى', 793),
('App\\Model\\Brand', 160, 'ye', 'name', 'إكسترا', 794),
('App\\Model\\Brand', 161, 'ye', 'name', 'ليز', 795),
('App\\Model\\Brand', 162, 'ye', 'name', 'توبليرون', 796),
('App\\Model\\Brand', 163, 'ye', 'name', 'زيني', 797),
('App\\Model\\Brand', 159, 'ye', 'name', 'كيس اس', 798),
('App\\Model\\Brand', 153, 'ye', 'name', 'برينجلز', 799),
('App\\Model\\Brand', 152, 'ye', 'name', 'اي فيزا', 800),
('App\\Model\\Brand', 151, 'ye', 'name', 'تيك تاك', 801),
('App\\Model\\Brand', 150, 'ye', 'name', 'كادبوري', 802),
('App\\Model\\Brand', 149, 'ye', 'name', 'منتوس', 803),
('App\\Model\\Brand', 148, 'ye', 'name', 'كونجيتوس', 804),
('App\\Model\\Brand', 146, 'ye', 'name', 'ام اند امز', 805),
('App\\Model\\Brand', 145, 'ye', 'name', 'لاكاسا', 806),
('App\\Model\\Brand', 144, 'ye', 'name', 'ميلكا', 807),
('App\\Model\\Brand', 143, 'ye', 'name', 'سنيكرز', 808),
('App\\Model\\Brand', 142, 'ye', 'name', 'توداي', 809),
('App\\Model\\Brand', 141, 'ye', 'name', '‎ فيريرو روشيه', 810),
('App\\Model\\Brand', 140, 'ye', 'name', 'سولين', 811);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `parent_seller_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `imageDoc1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `imageDoc2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_fawry_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `isComplete` int(11) NOT NULL DEFAULT 0,
  `isDoc` int(11) NOT NULL DEFAULT 0,
  `isDocReq` int(11) NOT NULL DEFAULT 0,
  `treadType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categorySelected` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temporary_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `whats` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month_purchasing` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commercial_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `parent_seller_id`, `name`, `f_name`, `l_name`, `phone`, `image`, `imageDoc1`, `imageDoc2`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `isComplete`, `isDoc`, `isDocReq`, `treadType`, `categorySelected`, `sale_amount`, `temporary_token`, `is_email_verified`, `whats`, `position`, `building_name`, `building_email`, `building_type`, `building_size`, `month_purchasing`, `tax_no`, `commercial_no`) VALUES
(351, NULL, NULL, 'Ee', 'Sh', '774314232', 'def.png', 'def.png', 'def.png', 'eeedddrrr77431@gmail.com', NULL, '$2y$10$zD0cAx4O/QV9F3xHpKDwTu.UDdQs8nA/2tc4./xrEB3p5L3xAXkxi', NULL, '2022-08-27 01:33:31', '2022-08-27 01:33:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(352, NULL, NULL, 'SALAH', 'ALDHAMDI', '967777690990', 'def.png', 'def.png', 'def.png', 'eng.aldhamdy@gmail.com', NULL, '$2y$10$lXayZN/7nOloMdhKJV3EuOx2jgj82YdLQozxP7gzquN70eaqNX1N6', NULL, '2022-07-26 04:01:26', '2022-07-26 04:01:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(354, NULL, 'adam khaled', 'خالد', 'محمود', '0124663326', 'def.png', 'def.png', 'def.png', 'khaled@gmail.com', NULL, '$2y$10$LfwFiPUetK.ChP7d1DjY7OPyNt8sIUXQV7OvER7sJ7hzULtj41.KK', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTlkMDBkMTdiZDJjMmM4ZDJjZjVlNWVhOWE5YWE', '2022-10-29 21:23:38', '2023-01-20 14:54:28', NULL, 'مصر', 'القاهرة', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, NULL, NULL, NULL, 'sIYOdBwqhLaX2SkmD0J3kzHQirc1dL4fNPdtQdba', 1, '0124663326', 'صاحب منشاة', 'ادم جروب', 'adam@gmail.com', 'البقالات', 'فرع واحد', 'اكثر من 150,000', '123456', '123456'),
(355, NULL, NULL, 'ابو', 'يحيى', '+967735594755', 'def.png', 'def.png', 'def.png', 'mohammed17almansoor@gmail.com', NULL, '$2y$10$cDJy/.c/3RnbWfxQIpFpF.lWoWvXnQY1JM2fxpq.ma9F0BWSIhd8.', NULL, '2022-06-14 12:56:11', '2022-06-14 12:57:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 'UU8RzpLdv8b5FJzDvmgagvZp7KDwM8FehsfE034L', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(356, NULL, NULL, 'Alaa', 'Alhaj', '968772939291', 'def.png', 'def.png', 'def.png', 'mralaalhaj2@gmail.com', NULL, '$2y$10$VnKED/wFJSsWWwpVMrGgLu.f5HhNHEt.wG2j.nUFVI3eppjZKkMS2', NULL, '2022-08-15 13:24:31', '2022-08-15 13:24:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(357, NULL, NULL, 'Alaa', 'Alhaj', '967735537585', 'def.png', 'def.png', 'def.png', 'Mralaalhaj3@gmail.com', NULL, '$2y$10$YNS2cR7M2r0IH5J1MGNj0OLMwjZHizVR24VI1/hhHeVwocZBDZ0H.', NULL, '2022-06-26 13:54:10', '2022-06-26 13:54:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(358, NULL, 'walking customer', 'walking', 'customer', '00000000000', 'def.png', '', '', 'walking@customer.com', NULL, '$2y$10$LfwFiPUetK.ChP7d1DjY7OPyNt8sIUXQV7OvER7sJ7hzULtj41.KK', NULL, NULL, '2022-02-03 03:46:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(359, NULL, NULL, 'khaled', 'mahmoud', '0201555937124', 'def.png', 'def.png', 'def.png', 'khaled2020@gmail.com', NULL, '$2y$10$Y4V.impKFROLwrWtMQcjg.d08iYkeDam9hnj/s9FopsRToVts1qAy', NULL, '2022-11-22 12:38:01', '2023-01-03 07:05:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 'KhvVnZytJ0QnfwOVwTZWOCR075YQHPXO6x3CrkSq', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(363, NULL, NULL, NULL, NULL, 'khaled2025@gmail.com', 'def.png', 'def.png', 'def.png', 'khaled2025@gmail.com', NULL, '$2y$10$V3hBCP9EGl/dWRTCLSorcevueZBJugTzAGmLek7AmGJPZRgH/Tvi6', NULL, '2022-12-28 05:47:13', '2022-12-28 05:47:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 'oQCUULdql05VqQPcwnxaGzNHcmqi9OkJg4sIrVmc', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(364, NULL, NULL, NULL, NULL, '0124663326', 'def.png', 'def.png', 'def.png', '0124663326', NULL, '$2y$10$SZptiAYztUC8GMMIRHNSFu6y0o9U4Zt/l7VJ8NOjIejxTeJissWmq', NULL, '2023-01-03 07:48:28', '2023-01-13 22:56:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 'gsPmhH0hYJpCY38EQoK9ugO10MLZfFjI6sjf98lJ', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `version_settings`
--

CREATE TABLE `version_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `versionNo` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `versionForceUpdate` int(11) DEFAULT NULL,
  `versionTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `versionMessage` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `versionNeedClearData` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `version_settings`
--

INSERT INTO `version_settings` (`id`, `versionNo`, `versionForceUpdate`, `versionTitle`, `versionMessage`, `versionNeedClearData`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '3.3.3', 1, 'الاصدار الاول', 'ٍسريع', 0, '2021-12-20 07:00:54', '2022-06-12 11:49:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(80, 354, 9, '2022-12-29 22:25:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `transaction_note` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `store_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`) VALUES
(1, 'Yemen', 0x00000000010300000001000000030000000da5cbf166904c40a60add4273702e40a087af051942484096144ada14852e400da5cbf166904c40a60add4273702e40, 1, '2022-04-13 04:52:33', '2022-04-13 04:57:09', 'zone_1_store', 'zone_1_customer', 'zone_1_delivery_man'),
(2, 'اليمن', 0x000000000103000000010000001b0000007d61ba11d61446408fc85f689adb2e409161baf1e61446401d60269fe8d92e40b1a11f7283254640a6013bcda5ed2e4048a11f7261294640f40e856e10b62e408ea11f72ed3346406473e73550632e40b1a11f72cb3746402d2bd9ad5f2e2e4048a11f72e11246402d2bd9ad5f2e2e408ea11f72850546408d0917ebdba92e40fe0dbb36820e4640d86bd0dbefea2e40210ebb3698164640d86bd0dbefea2e40710eaf39fc7f45403cd761d33a7d3040e7980851a9a945403bd87dbe90b63040e798085109a44540fd3a2d088dfc3040e798085199c8454082093f1151323140e7980851095846403b0bb08091273140e798085169604740fd3a2d088dfc3040e7980851a9f24740b8f2a87f2db13040e798085129094840bf829f7c31223140e798085179e44940e1294b5befa83240e7980851698a4a403c61506bb22f3040e7980851a9d34840e23e57c3fd572c40e7980851e9a34740993e528c9bd92a40e79808511993464030c50ee2e5902940e79808512974464033805b3941d62840c92bd463dc9645405f8cc8a25cc92940c92bd4632c8345409440504c0d7730407d61ba11d61446408fc85f689adb2e40, 1, '2022-05-27 21:31:42', '2022-05-27 21:31:42', 'zone_2_store', 'zone_2_customer', 'zone_2_delivery_man'),
(3, 'صنعاء', 0x000000000103000000010000000b00000079c88054931f46401240e8c8b15e2e4033c88054270446405ccfcd13ceb22e40aec88054100c4640eb99b75feccd2e4067c88054cc134640008903e263ea2e4056c880546d094640472ec009ea1f2f4067c880541c2d464045f1d73b8f1e2f4079c8805473304640a813c9ef41e22e401453e1d318324640d141705e88532e402553e1d32f2a46403f3b2437ec432e40df52e1d30b21464043ff63ad115f2e4079c88054931f46401240e8c8b15e2e40, 1, '2022-05-27 21:33:31', '2022-05-27 21:33:31', 'zone_3_store', 'zone_3_customer', 'zone_3_delivery_man'),
(4, 'بيت بوس', 0x00000000010300000001000000060000002a3b0135a31c464075d7fdb5638a2e40572bfce4341d46402bc457bedd8e2e4074132a25591b4640c3ea4056de922e40a31962cfed1a46400d7737dc738e2e406a1962878f1b464079b19962958d2e402a3b0135a31c464075d7fdb5638a2e40, 1, '2022-05-27 22:14:17', '2022-05-27 22:14:17', 'zone_4_store', 'zone_4_customer', 'zone_4_delivery_man'),
(5, 'السبعين', 0x000000000103000000010000000c000000634858d4ee1946400d054bad49922e40564858944b1b46404613633200952e40754858d4dd1b4640b03ce425c9a52e4070485814321e4640bd761ebf4fa72e40864858d46c2346403d3b510b9c912e4044485894cc214640d1e49f95dc8c2e40524858d4d7214640a4f2b18754812e40b74858147e1d4640b529c79f24802e40404858d4481a464007b4660244872e4082485814191946407b778cc3858c2e406c4858547e194640bb3bbe1575922e40634858d4ee1946400d054bad49922e40, 1, '2022-05-27 22:25:54', '2022-05-27 22:25:54', 'zone_5_store', 'zone_5_customer', 'zone_5_delivery_man'),
(6, 'صنعاء2', 0x000000000103000000010000000700000039c865d495124640d12870cc15942e406dc865d45a11464034a88cd9fdc92e4039c865d4752346405386f2fd4bc82e407fc865d42924464086d98d4ecc962e40d672daef561e464027214f153b832e40aa72da6fb1164640163e17913f842e4039c865d495124640d12870cc15942e40, 1, '2022-05-27 22:26:29', '2022-05-27 22:26:29', 'zone_6_store', 'zone_6_customer', 'zone_6_delivery_man'),
(7, 'خط الوحده', 0x000000000103000000010000000a00000092f0f0c9fc15464017e1e476cdaf2e40bdf0f049d21a46407f821b30afb22e409ff0f009a81b4640a2119ae96dad2e4084f0f089911b4640f563caf9cca52e40cff0f049f11946404aa816c3bfa22e4096f0f089e0174640f58af92b01a82e4077f0f0494e1746405138318fdea92e406af0f009db154640ada647f0bbab2e408df0f009811546403e4b10ac76af2e4092f0f0c9fc15464017e1e476cdaf2e40, 1, '2022-08-21 00:33:20', '2022-08-21 00:33:20', 'zone_7_store', 'zone_7_customer', 'zone_7_delivery_man');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_commissions`
--
ALTER TABLE `admin_commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_logs`
--
ALTER TABLE `app_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branche`
--
ALTER TABLE `branche`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_deps`
--
ALTER TABLE `category_deps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `category_dep_translations`
--
ALTER TABLE `category_dep_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_jobs`
--
ALTER TABLE `category_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `category_job_translations`
--
ALTER TABLE `category_job_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_locations`
--
ALTER TABLE `customer_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_requests`
--
ALTER TABLE `customer_wallet_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `day_shop`
--
ALTER TABLE `day_shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `day_shop_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `department_typs`
--
ALTER TABLE `department_typs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_names`
--
ALTER TABLE `job_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `market_typs`
--
ALTER TABLE `market_typs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `new_req_orders`
--
ALTER TABLE `new_req_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `new_req_order_convs`
--
ALTER TABLE `new_req_order_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_typs`
--
ALTER TABLE `sale_typs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_req_add_products`
--
ALTER TABLE `seller_req_add_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_req_add_products_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `seller_req_product_files`
--
ALTER TABLE `seller_req_product_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_req_product_files_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subs_categories`
--
ALTER TABLE `subs_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `version_settings`
--
ALTER TABLE `version_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_commissions`
--
ALTER TABLE `admin_commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_logs`
--
ALTER TABLE `app_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branche`
--
ALTER TABLE `branche`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `category_deps`
--
ALTER TABLE `category_deps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `category_dep_translations`
--
ALTER TABLE `category_dep_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category_jobs`
--
ALTER TABLE `category_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category_job_translations`
--
ALTER TABLE `category_job_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48694;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_locations`
--
ALTER TABLE `customer_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_wallet_requests`
--
ALTER TABLE `customer_wallet_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `day_shop`
--
ALTER TABLE `day_shop`
  MODIFY `id` bigint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `department_typs`
--
ALTER TABLE `department_typs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `new_req_orders`
--
ALTER TABLE `new_req_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `new_req_order_convs`
--
ALTER TABLE `new_req_order_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100126;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1168;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sale_typs`
--
ALTER TABLE `sale_typs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `seller_req_add_products`
--
ALTER TABLE `seller_req_add_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seller_req_product_files`
--
ALTER TABLE `seller_req_product_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4132;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subs_categories`
--
ALTER TABLE `subs_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=812;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT for table `version_settings`
--
ALTER TABLE `version_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `seller_req_add_products`
--
ALTER TABLE `seller_req_add_products`
  ADD CONSTRAINT `seller_req_add_products_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_req_product_files`
--
ALTER TABLE `seller_req_product_files`
  ADD CONSTRAINT `seller_req_product_files_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
