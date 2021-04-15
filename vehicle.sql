-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Mar 26, 2021 at 11:20 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autocare`
--

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `chassis_number` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `engine_number` varchar(255) NOT NULL,
  `gear_type` varchar(255) DEFAULT NULL,
  `live_dead` varchar(255) DEFAULT NULL,
  `manufactured_year` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `registration_number` varchar(255) NOT NULL,
  `vehicle_model` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_beffs1o2b4ykpx5mthi4iak6x` (`chassis_number`),
  UNIQUE KEY `UK_threjkp4d2l44xt2iiiuje193` (`engine_number`),
  UNIQUE KEY `UK_6fo0502tpr111m29vqj0bhpa4` (`registration_number`),
  UNIQUE KEY `UK_442h4j9g8nm30wpjk392v8bgj` (`number`),
  KEY `FKlwqsusjj6iodeb0df1b554vxq` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `chassis_number`, `code`, `engine_number`, `gear_type`, `live_dead`, `manufactured_year`, `number`, `registration_number`, `vehicle_model`, `customer_id`) VALUES
(1, '2021-03-24 22:06:46.678852', 'anonymousUser', '2021-03-24 22:07:31.423597', 'anonymousUser', '2312213213', NULL, '12313141', 'MANUAL', 'STOP', '2018', 'ERT 1233', 'SAV210000', 'BIKE', 2),
(2, '2021-03-24 22:08:36.075599', 'anonymousUser', '2021-03-24 22:08:36.075599', 'anonymousUser', '232424', NULL, '1231231', 'MANUAL', 'ACTIVE', '2013', 'WER 12341', 'SAV210001', 'BIKE', 1),
(3, '2021-03-24 22:15:33.197641', 'anonymousUser', '2021-03-24 22:15:33.197641', 'anonymousUser', '344353534543', NULL, '12321312312', 'MANUAL', 'ACTIVE', '2019', 'QWE 123321', 'SAV210002', 'VAN', 1),
(4, '2021-03-24 22:22:50.269066', 'anonymousUser', '2021-03-24 22:22:50.269066', 'anonymousUser', '12132113213', NULL, '23423244', 'MANUAL', 'ACTIVE', '2014', 'ABC 1234', 'SAV210003', 'VAN', 1),
(5, '2021-03-25 20:45:50.774575', 'anonymousUser', '2021-03-25 20:45:50.774575', 'anonymousUser', '1234', NULL, '123', 'MANUAL', 'ACTIVE', '2020', 'ABB1234', 'SAV210004', 'VAN', 1),
(6, '2021-03-26 13:41:42.055427', 'anonymousUser', '2021-03-26 13:41:42.055427', 'anonymousUser', '1234567', NULL, '123456', 'MANUAL', 'ACTIVE', '2000', '57-2955', 'SAV210005', 'VAN', 4),
(7, '2021-03-26 14:19:43.656070', 'anonymousUser', '2021-03-26 14:19:43.656070', 'anonymousUser', 'gggg', NULL, 'hhhh', 'MANUAL', 'ACTIVE', '2007', 'XD-0905', 'SAV210006', 'BIKE', 5),
(8, '2021-03-26 14:22:47.402310', 'anonymousUser', '2021-03-26 14:22:47.402310', 'anonymousUser', 'ssdvfsf', NULL, 'csdc', 'MANUAL', 'ACTIVE', '2018', '67-6767', 'SAV210007', 'CAR', 5),
(9, '2021-03-26 14:24:31.557626', 'anonymousUser', '2021-03-26 14:24:31.557626', 'anonymousUser', 'svve', NULL, 'dvdfgb ', 'MANUAL', 'ACTIVE', '2018', '57-1234', 'SAV210008', 'VAN', 4),
(10, '2021-03-26 14:30:32.556410', 'anonymousUser', '2021-03-26 14:30:32.556410', 'anonymousUser', '2342ad', NULL, 'werw433', 'MANUAL', 'ACTIVE', '1990', '34-1234', 'SAV210009', 'LORRY', 7),
(11, '2021-03-26 15:06:54.535638', 'anonymousUser', '2021-03-26 15:06:54.535638', 'anonymousUser', 'wddddddddddddddddd', NULL, 'sddfed', 'MANUAL', 'ACTIVE', '2018', 'LL-0000', 'SAV210010', 'VAN', 7),
(12, '2021-03-26 15:09:45.717253', 'anonymousUser', '2021-03-26 15:09:45.717253', 'anonymousUser', 'SDVDS', NULL, 'DSFDSVG', 'MANUAL', 'ACTIVE', '2009', 'LL-1234', 'SAV210011', 'VAN', 7),
(13, '2021-03-26 16:25:49.888923', 'anonymousUser', '2021-03-26 16:25:49.888923', 'anonymousUser', '432235', NULL, '232144', 'AUTO', 'ACTIVE', '2015', 'CAF-2000', 'SAV210012', 'CAR', 8);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `FKlwqsusjj6iodeb0df1b554vxq` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
