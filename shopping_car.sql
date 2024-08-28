-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-08-28 16:16:13
-- 伺服器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- 資料庫： `shopping_car`
--

-- --------------------------------------------------------

--
-- 資料表結構 `car`
--

CREATE TABLE `car` (
  `id` int(20) NOT NULL,
  `p_no` int(10) NOT NULL,
  `quantity` int(20) NOT NULL,
  `create_at` datetime NOT NULL,
  `updata_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `car`
--

INSERT INTO `car` (`id`, `p_no`, `quantity`, `create_at`, `updata_at`) VALUES
(39, 1, 1, '2024-08-28 15:37:28', '2024-08-28 15:37:28'),
(40, 3, 1, '2024-08-28 15:37:30', '2024-08-28 15:37:30');

-- --------------------------------------------------------

--
-- 資料表結構 `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `updata_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `order`
--

INSERT INTO `order` (`order_id`, `total_price`, `create_at`, `updata_at`) VALUES
(1, 315, '2024-08-24 02:59:14', '2024-08-24 02:59:14'),
(2, 135, '2024-08-24 03:02:03', '2024-08-24 03:02:03'),
(3, 10054, '2024-08-24 03:09:11', '2024-08-24 03:09:11'),
(4, 90, '2024-08-27 11:16:03', '2024-08-27 11:16:03'),
(5, 225, '2024-08-27 14:34:00', '2024-08-27 14:34:00'),
(6, 20088, '2024-08-28 15:12:05', '2024-08-28 15:12:05'),
(7, 10, '2024-08-28 16:08:55', '2024-08-28 16:08:55');

-- --------------------------------------------------------

--
-- 資料表結構 `order_item`
--

CREATE TABLE `order_item` (
  `item_id` int(20) NOT NULL,
  `products_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `order_item`
--

INSERT INTO `order_item` (`item_id`, `products_id`, `order_id`, `quantity`) VALUES
(1, 4, 1, 5),
(2, 1, 1, 1),
(3, 2, 2, 1),
(4, 4, 2, 1),
(5, 3, 3, 1),
(6, 4, 3, 1),
(7, 5, 3, 1),
(8, 1, 4, 1),
(9, 1, 5, 1),
(10, 2, 5, 1),
(11, 4, 5, 1),
(12, 1, 6, 1),
(13, 3, 6, 2),
(14, 5, 7, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `products`
--

CREATE TABLE `products` (
  `no` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(20) NOT NULL,
  `create_at` datetime NOT NULL,
  `updata_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `products`
--

INSERT INTO `products` (`no`, `name`, `price`, `create_at`, `updata_at`) VALUES
(1, '巧克力', 90, '2024-08-09 00:00:00', '2024-08-09 00:24:28'),
(2, '熱可可', 90, '2024-08-09 00:00:00', '2024-08-09 00:00:00'),
(3, '公仔', 9999, '2024-08-09 01:15:12', '2024-08-09 01:15:12'),
(4, '御飯糰', 45, '2024-08-09 16:01:43', '2024-08-09 16:01:43'),
(5, '麥香奶茶', 10, '2024-08-09 16:02:12', '2024-08-09 16:02:12');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- 資料表索引 `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`item_id`);

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`no`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `car`
--
ALTER TABLE `car`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_item`
--
ALTER TABLE `order_item`
  MODIFY `item_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `products`
--
ALTER TABLE `products`
  MODIFY `no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;
