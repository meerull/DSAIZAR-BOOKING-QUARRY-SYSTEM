-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2022 at 06:51 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soil-order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(12, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(13, 'Jaison E Mathew', 'jaison', '5f4dcc3b5aa765d61d8327deb882cf99'),
(14, 'Varghese Babu', 'password', '5f4dcc3b5aa765d61d8327deb882cf99');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(4, 'Soils', 'soil_Category_266.jpg', 'Yes', 'Yes'),
(5, 'Sand', 'soil_Category_369.jpg', 'Yes', 'Yes'),
(9, 'Rock', 'soil_Category_270.jpg', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_soil`
--

CREATE TABLE `tbl_soil` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_soil`
--

INSERT INTO `tbl_soil` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(35, 'Fine sand', '', '30.00', 'soil-Name-4902.jpg', 14, 'Yes', 'Yes'),
(36, 'Red Soil', 'Good for tree', '30.00', 'soil-Name-1139.jpg', 13, 'Yes', 'Yes'),
(37, 'Small Rock', ' ', '45.00', 'soil-Name-234.jpeg', 15, 'Yes', 'Yes'),
(39, 'Big Rock', '', '30.00', 'soil-Name-1867.jpg', 15, 'No', 'Yes'),
(40, 'Limestone', '', '50.00', 'soil-Name-3992.jpg', 13, 'No', 'Yes'),
(41, 'clay sand', '', '35.00', 'soil-Name-2216.jpg', 13, 'No', 'Yes'),
(42, 'Top Soil', '.', '40.00', 'soil-Name-6421.jpg', 13, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `soil` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `u_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `soil`, `price`, `qty`, `total`, `order_date`, `status`, `u_id`) VALUES
(19, 'Fine sand', '30.00', 1, '30.00', '2025-01-30 01:41:13', 'Ordered', 25),
(20, 'Fine sand', '30.00', 1, '30.00', '2025-01-30 10:01:59', 'Delivered', 6),
(21, 'Red Soil', '30.00', 3, '90.00', '2025-01-30 14:48:16', 'On Delivery', 26),
(22, 'Fine sand', '30.00', 5, '150.00', '2025-02-01 15:28:14', 'Delivered', 36);


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_contact` bigint(25) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `customer_name`, `customer_email`, `customer_contact`, `customer_address`, `created_at`) VALUES
(35, 'rayyan', '$2y$10$Gy6aUbgcfidoBL5TlfHyMu8IORap1nBg60Q1sqh/Hnf32dyPewqIa', 'mohd rayyan', 'rayyan@gmail.com', 9526519828, 'perlis', '2024-11-12 17:20:06'),
(36, 'adham', '$2y$10$ViiTNdK7o2PDAXE0BjUHnOReE6CA91gjxU6v/XB402NJiZzvr7JMO', 'AHMAD ADHAM BIN MOHD SAIFI', 'adham@gmail.com', 9038394034, 'Machang, Kelantan', '2024-11-12 18:48:54'),
(37, 'AIMAN', '$2y$10$faixVpekjH7qyog4CsSD7u/KdpfnJ0B06rMHR8rWBHgooHGfT7vrS', 'AIMAN HAKIM BIN AZIZ ', 'aiman@gmail.com', 9284049384, 'Arau, Perlis', '2024-11-12 19:06:00'),
(38, 'azyan', '$2y$10$xqjkDZrGsWsDhecSXf2zCu9rNskNrBC9QH6SgsV2pdQhvwHym3HBa', 'AZYAN SORFINA BINTI MUHAMAD FAUZI', 'azyan@gmail.com', 9319392053, 'Kangar, Perlis', '2024-11-14 21:06:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_soil`
--
ALTER TABLE `tbl_soil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_soil`
--
ALTER TABLE `tbl_soil`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
