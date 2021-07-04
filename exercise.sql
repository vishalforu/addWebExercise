-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2021 at 09:36 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exercise`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `part_number` int(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `qty` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `part_number`, `name`, `description`, `qty`) VALUES
(1, 102, '', '', NULL),
(2, 200, '', '', NULL),
(3, 220, '', '', NULL),
(4, 500, '', '', NULL),
(5, 610, '', '', NULL),
(6, 660, '', '', NULL),
(7, 700, '', '', NULL),
(8, 900, '', '', NULL),
(9, 1000, '', '', NULL),
(10, 1020, '', '', NULL),
(11, 1040, '', '', NULL),
(12, 1120, '', '', NULL),
(13, 1130, '', '', NULL),
(14, 1400, '', '', NULL),
(15, 1410, '', '', NULL),
(16, 1440, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_prices`
--

INSERT INTO `product_prices` (`id`, `product_id`, `user_id`, `product_price`) VALUES
(1, 1, 1, 32.0004),
(2, 1, 2, 36),
(3, 1, 3, 38.9995),
(4, 2, 1, 32.0004),
(5, 2, 2, 36),
(6, 2, 3, 38.9995),
(7, 3, 1, 32.0004),
(8, 3, 2, 36),
(9, 3, 3, 38.9995),
(10, 4, 1, 32.0004),
(11, 4, 2, 36),
(12, 4, 3, 38.9995),
(13, 5, 1, 32.0004),
(14, 5, 2, 36),
(15, 5, 3, 38.9995),
(16, 6, 1, 32.0004),
(17, 6, 2, 36),
(18, 6, 3, 38.9995),
(19, 7, 1, 32.0004),
(20, 7, 2, 36),
(21, 7, 3, 38.9995),
(22, 8, 1, 32.0004),
(23, 8, 2, 36),
(24, 8, 3, 38.9995),
(25, 9, 1, 32.0004),
(26, 9, 2, 36),
(27, 9, 3, 38.9995),
(28, 10, 1, 46.0032),
(29, 10, 2, 48.9984),
(30, 10, 3, 52.0032),
(31, 11, 1, 32.0004),
(32, 11, 2, 36),
(33, 11, 3, 38.9995),
(34, 12, 1, 32.0004),
(35, 12, 2, 36),
(36, 12, 3, 38.9995),
(37, 13, 1, 32.0004),
(38, 13, 2, 36),
(39, 13, 3, 38.9995),
(40, 14, 1, 32.0004),
(41, 14, 2, 36),
(42, 14, 3, 38.9995),
(43, 15, 1, 32.0004),
(44, 15, 2, 36),
(45, 15, 3, 38.9995),
(46, 16, 1, 46.0032),
(47, 16, 2, 48.9984),
(48, 16, 3, 52.0032);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `company_name`, `address`, `state`, `zip`) VALUES
(1, '', '', '', 'Test Company A', '', '', NULL),
(2, '', '', '', 'Test Company B', '', '', NULL),
(3, '', '', '', 'Test Company C', '', '', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_price` (`product_price`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD CONSTRAINT `product_prices_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_prices_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
