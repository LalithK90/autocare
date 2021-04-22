-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Apr 18, 2021 at 10:52 AM
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `live_dead` varchar(255) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rm1bp9bhtiih5foj17t8l500j` (`code`),
  UNIQUE KEY `UK_dwk6cx0afu8bs9o4t536v1j5v` (`email`),
  UNIQUE KEY `UK_4h6a5iro7ibjn1v8g2n7pktiw` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `address`, `code`, `email`, `live_dead`, `mobile`, `name`) VALUES
(1, '2021-04-16 12:23:36.141859', 'manager', '2021-04-16 12:23:36.141859', 'manager', 'abcba', 'SAC210000', 'dulan@gmail.com', 'ACTIVE', '0778587541', 'Dulan'),
(2, '2021-04-16 12:24:18.506178', 'manager', '2021-04-16 12:24:18.506178', 'manager', 'abcdn', 'SAC210001', 'tharindu@gmail.com', 'ACTIVE', '0778123456', 'Tharindu'),
(3, '2021-04-18 10:19:57.604471', 'inspector', '2021-04-18 10:19:57.604471', 'inspector', 'n.34,padukka,millewa', 'SAC210002', 'lalith@gmail.com', 'ACTIVE', '0775474548', 'Lalith sir'),
(4, '2021-04-18 10:59:27.433734', 'inspector', '2021-04-18 10:59:27.433734', 'inspector', 'no.12,asd,asd', 'SAC210003', 'dilaninduwara1234@gmail.com', 'ACTIVE', '0772665966', 'Isuru'),
(5, '2021-04-18 11:00:37.876208', 'inspector', '2021-04-18 11:00:37.876208', 'inspector', 'no.23,qwe,qwe', 'SAC210004', 'dulanindeewara@gmail.com', 'ACTIVE', '0778649212', 'dulan'),
(6, '2021-04-18 11:09:08.675809', 'inspector', '2021-04-18 11:09:08.675809', 'inspector', 'no.12,qwe,qe', 'SAC210005', 'tharindunuwa222@gmail.com', 'ACTIVE', '0769937493', 'Tharuka'),
(7, '2021-04-18 14:14:41.614122', 'manager', '2021-04-18 14:14:41.614122', 'manager', 'qweq', 'SAC210006', 'kalpa@gmail.com', 'ACTIVE', '0781232132', 'kalpa');

-- --------------------------------------------------------

--
-- Table structure for table `discount_ratio`
--

DROP TABLE IF EXISTS `discount_ratio`;
CREATE TABLE IF NOT EXISTS `discount_ratio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `discount_ratio_status` varchar(255) DEFAULT NULL,
  `live_dead` varchar(255) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `discount_ratio`
--

INSERT INTO `discount_ratio` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `amount`, `discount_ratio_status`, `live_dead`, `name`) VALUES
(1, '2021-04-16 12:27:41.957184', 'manager', '2021-04-16 12:27:41.957184', 'manager', '0.00', 'ACTIVE', 'ACTIVE', 'default'),
(2, '2021-04-16 12:27:55.990500', 'manager', '2021-04-16 12:27:55.990500', 'manager', '25.00', 'ACTIVE', 'ACTIVE', 'new year');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `calling_name` varchar(255) DEFAULT NULL,
  `civil_status` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date_of_assignment` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `employee_status` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `land` varchar(10) DEFAULT NULL,
  `live_dead` varchar(255) DEFAULT NULL,
  `mobile_one` varchar(10) DEFAULT NULL,
  `mobile_two` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nic` varchar(12) DEFAULT NULL,
  `office_email` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nbyivu8qgmx0r7wtbplf01gf8` (`code`),
  UNIQUE KEY `UK_dihajhqd7lkqn3lhsawly3t9r` (`nic`),
  UNIQUE KEY `UK_ldqrk7j96ef2tqxsonr4dqf0r` (`office_email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `address`, `calling_name`, `civil_status`, `code`, `date_of_assignment`, `date_of_birth`, `designation`, `employee_status`, `gender`, `land`, `live_dead`, `mobile_one`, `mobile_two`, `name`, `nic`, `office_email`, `title`) VALUES
(1, '2021-04-16 12:15:04.694443', 'anonymousUser', '2021-04-16 12:15:04.694443', 'anonymousUser', NULL, 'Admin', 'UNMARRIED', NULL, '2021-04-16', '2003-04-16', 'CASHIER', 'WORKING', 'MALE', NULL, 'ACTIVE', '0750000000', NULL, '908670000V', NULL, NULL, 'DR'),
(2, '2021-04-16 12:17:59.978526', 'admin', '2021-04-16 12:17:59.978526', 'admin', 'abc', 'Isuru', 'MARRIED', 'SACE210000', '2021-04-15', '1998-03-10', 'CASHIER', 'WORKING', 'MALE', '0113452331', 'ACTIVE', '0778907896', '0778907865', 'Isuru', '980700654V', 'isuru@gmail.com', 'MR'),
(3, '2021-04-17 06:46:10.050461', 'manager', '2021-04-17 06:46:10.050461', 'manager', 'asd', 'hirushan', 'MARRIED', 'SACE210001', '2021-04-09', '1995-03-30', 'IN_OFFICER', 'WORKING', 'MALE', '0112121212', 'ACTIVE', '0778456322', '0778959869', 'hirushan', '950900786V', 'hirushan@gmail', 'MR'),
(4, '2021-04-17 13:17:27.557548', 'manager', '2021-04-17 13:26:28.945014', 'manager', 'qweqwe', 'Isuri', 'MARRIED', 'SACE210002', '2021-04-16', '1998-04-08', 'TECH', 'WORKING', 'MALE', '0112232323', 'ACTIVE', '0779898989', '0776565665', 'Isuri', '980999999V', 'isuri@gmail.com', 'MR'),
(5, '2021-04-17 13:21:36.275500', 'manager', '2021-04-17 13:26:53.668853', 'manager', 'qweqwe', 'dilan', 'MARRIED', 'SACE210003', '2021-04-15', '1995-03-30', 'CASHIER', 'WORKING', 'MALE', '0112232332', 'ACTIVE', '0778989898', '0776565656', 'dilan', '950900876V', 'dilan@gmail.com', 'MR'),
(6, '2021-04-17 14:10:45.372167', 'manager', '2021-04-17 14:10:45.372167', 'manager', 'asdasd', 'Lalith', 'MARRIED', 'SACE210004', '2021-04-16', '1990-12-21', 'TECH', 'WORKING', 'FEMALE', '0112646464', 'ACTIVE', '0778898989', '0786565656', 'Lalith', '908567876V', 'lalith@gmail.com', 'MR'),
(7, '2021-04-17 15:33:50.143045', 'manager', '2021-04-17 15:33:50.143045', 'manager', 'ddssss', 'qweqweqe', 'MARRIED', 'SACE210005', '2021-04-16', '1997-03-18', 'CASHIER', 'WORKING', 'MALE', '0345656565', 'ACTIVE', '0778787878', '0764545454', 'asdad', '970787834V', 'aasddsa@gmail.com', 'MR'),
(8, '2021-04-18 14:14:03.413353', 'manager', '2021-04-18 14:14:03.413353', 'manager', 'adaasd', 'nalinda', 'MARRIED', 'SACE210006', '2021-04-18', '0991-07-30', 'MANAGER', 'WORKING', 'MALE', '0342121212', 'ACTIVE', '0772232323', '0772323232', 'nalinda', '099121211212', 'nalinda@gmail.com', 'MR');

-- --------------------------------------------------------

--
-- Table structure for table `employee_files`
--

DROP TABLE IF EXISTS `employee_files`;
CREATE TABLE IF NOT EXISTS `employee_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `new_id` varchar(255) DEFAULT NULL,
  `new_name` varchar(255) DEFAULT NULL,
  `pic` longblob,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5eob6je5op1e4m7v20v5i01p2` (`new_id`),
  KEY `FKolualpa5dydj5r06txltc1y6d` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `amount_tendered` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `live_dead` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `discount_ratio_id` int(11) DEFAULT NULL,
  `service_type_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_opor0kv54jt58n364jog9bu2i` (`code`),
  KEY `FKby2skjf3ov608yb6nm16b49lg` (`customer_id`),
  KEY `FKs0qx9ne49ltgj5jrvwblc6xe9` (`discount_ratio_id`),
  KEY `FKeqi3aaatxtg6v4c91tfhhdo0u` (`service_type_id`),
  KEY `FK71268xwbe8u7suqrowleh11wj` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `amount`, `amount_tendered`, `balance`, `bank_name`, `card_number`, `code`, `discount_amount`, `live_dead`, `payment_method`, `payment_status`, `remarks`, `total_amount`, `customer_id`, `discount_ratio_id`, `service_type_id`, `vehicle_id`) VALUES
(1, '2021-04-16 12:26:39.522076', 'manager', '2021-04-17 06:42:57.551867', 'manager', '200.00', '250.00', '50.00', '', '', 'SAP210000', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '200.00', 1, 1, 3, 1),
(2, '2021-04-16 12:32:25.421317', 'manager', '2021-04-17 06:43:00.748234', 'manager', '300.00', '304.00', '4.00', '', '', 'SAP210001', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '300.00', 2, 1, 2, 2),
(3, '2021-04-16 12:38:22.901464', 'manager', '2021-04-17 06:43:04.017909', 'manager', '200.00', '320.00', '120.00', '', '', 'SAP210002', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '200.00', 1, 1, 3, 1),
(4, '2021-04-16 12:38:22.950489', 'manager', '2021-04-17 06:43:02.224941', 'manager', '3000.00', '3400.00', '400.00', '', '', 'SAP210003', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '3000.00', 1, 1, 1, 1),
(5, '2021-04-16 12:40:50.212344', 'manager', '2021-04-18 09:54:05.709666', 'manager', '200.00', '219.00', '19.00', '', '', 'SAP210004', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '200.00', 1, 1, 3, 1),
(6, '2021-04-16 12:40:50.245367', 'manager', '2021-04-18 09:54:06.908980', 'manager', '3000.00', '3299.00', '299.00', '', '', 'SAP210005', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '3000.00', 1, 1, 1, 1),
(7, '2021-04-17 06:23:43.284426', 'manager', '2021-04-18 09:54:09.161643', 'manager', '300.00', '300.00', '0.00', '', '', 'SAP210006', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '300.00', 1, 1, 2, 1),
(8, '2021-04-17 06:23:43.692924', 'manager', '2021-04-18 09:54:12.496278', 'manager', '200.00', '234.00', '34.00', '', '', 'SAP210007', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '200.00', 1, 1, 3, 1),
(9, '2021-04-17 06:31:01.758110', 'manager', '2021-04-18 09:54:22.482642', 'manager', '300.00', '400.00', '100.00', '', '', 'SAP210008', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '300.00', 2, 1, 2, 2),
(10, '2021-04-17 06:32:16.458841', 'manager', '2021-04-18 09:54:18.473315', 'manager', '300.00', '456.00', '156.00', '', '', 'SAP210009', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '300.00', 2, 1, 2, 2),
(11, '2021-04-17 06:38:33.310796', 'manager', '2021-04-18 09:54:15.348614', 'manager', '300.00', '320.00', '20.00', '', '', 'SAP210010', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '300.00', 1, 1, 2, 1),
(12, '2021-04-17 06:38:33.407854', 'manager', '2021-04-18 09:54:03.417884', 'manager', '200.00', '210.00', '10.00', '', '', 'SAP210011', '0.00', 'ACTIVE', 'CASH', 'CANCEL', '', '200.00', 1, 1, 3, 1),
(13, '2021-04-18 09:53:34.079185', 'manager', '2021-04-18 09:53:34.079185', 'manager', '300.00', '0.00', '0.00', NULL, NULL, 'SAP210012', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 1, NULL, 2, 1),
(14, '2021-04-18 09:55:11.754724', 'manager', '2021-04-18 09:55:11.754724', 'manager', '300.00', '0.00', '0.00', NULL, NULL, 'SAP210013', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 1, NULL, 2, 1),
(15, '2021-04-18 09:55:11.806758', 'manager', '2021-04-18 09:55:11.806758', 'manager', '200.00', '0.00', '0.00', NULL, NULL, 'SAP210014', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 1, NULL, 3, 1),
(16, '2021-04-18 09:59:03.558374', 'manager', '2021-04-18 09:59:03.558374', 'manager', '300.00', '0.00', '0.00', NULL, NULL, 'SAP210015', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 1, NULL, 2, 1),
(17, '2021-04-18 09:59:10.062495', 'manager', '2021-04-18 09:59:10.062495', 'manager', '200.00', '0.00', '0.00', NULL, NULL, 'SAP210016', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 1, NULL, 3, 1),
(18, '2021-04-18 09:59:16.577643', 'manager', '2021-04-18 09:59:16.577643', 'manager', '3000.00', '0.00', '0.00', NULL, NULL, 'SAP210017', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 1, NULL, 1, 1),
(19, '2021-04-18 10:10:18.656285', 'manager', '2021-04-18 10:10:18.656285', 'manager', '300.00', '0.00', '0.00', NULL, NULL, 'SAP210018', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 1, NULL, 2, 1),
(20, '2021-04-18 10:10:25.193605', 'manager', '2021-04-18 10:10:25.193605', 'manager', '200.00', '0.00', '0.00', NULL, NULL, 'SAP210019', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 1, NULL, 3, 1),
(21, '2021-04-18 10:10:31.693508', 'manager', '2021-04-18 10:10:31.693508', 'manager', '3000.00', '0.00', '0.00', NULL, NULL, 'SAP210020', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 1, NULL, 1, 1),
(22, '2021-04-18 10:38:20.762582', 'technichian', '2021-04-18 10:39:54.382372', 'cashier', '3000.00', '3800.00', '800.00', '', '', 'SAP210021', '0.00', 'ACTIVE', 'CASH', 'PAID', '', '3000.00', 3, 1, 1, 3),
(23, '2021-04-18 11:04:38.015299', 'technichian', '2021-04-18 11:04:38.015299', 'technichian', '3000.00', '0.00', '0.00', NULL, NULL, 'SAP210022', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 1, NULL, 1, 4),
(24, '2021-04-18 11:14:14.688705', 'technichian', '2021-04-18 11:14:14.688705', 'technichian', '300.00', '0.00', '0.00', NULL, NULL, 'SAP210023', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 6, NULL, 2, 1),
(25, '2021-04-18 11:14:27.516917', 'technichian', '2021-04-18 11:14:27.516917', 'technichian', '200.00', '0.00', '0.00', NULL, NULL, 'SAP210024', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 6, NULL, 3, 1),
(26, '2021-04-18 11:14:40.858146', 'technichian', '2021-04-18 11:14:40.858146', 'technichian', '3000.00', '0.00', '0.00', NULL, NULL, 'SAP210025', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 6, NULL, 1, 1),
(27, '2021-04-18 12:30:52.859811', 'technichian', '2021-04-18 12:30:52.859811', 'technichian', '300.00', '0.00', '0.00', NULL, NULL, 'SAP210026', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 6, NULL, 2, 1),
(28, '2021-04-18 12:37:25.404828', 'manager', '2021-04-18 12:37:25.404828', 'manager', '3000.00', '0.00', '0.00', NULL, NULL, 'SAP210027', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 3, NULL, 1, 3),
(29, '2021-04-18 13:32:02.400773', 'manager', '2021-04-18 13:32:02.400773', 'manager', '200.00', '0.00', '0.00', NULL, NULL, 'SAP210028', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 6, NULL, 3, 1),
(30, '2021-04-18 13:48:49.620137', 'manager', '2021-04-18 13:48:49.620137', 'manager', '300.00', '0.00', '0.00', NULL, NULL, 'SAP210029', '0.00', 'ACTIVE', 'CASH', 'NOTPAID', NULL, '0.00', 6, NULL, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_iubw515ff0ugtm28p8g3myt0h` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `role_name`) VALUES
(1, '2021-04-16 12:15:04.481303', 'anonymousUser', '2021-04-16 12:15:04.481303', 'anonymousUser', 'ADMIN'),
(2, '2021-04-16 12:15:04.560358', 'anonymousUser', '2021-04-16 12:15:04.560358', 'anonymousUser', 'IN_OFFICER'),
(3, '2021-04-16 12:15:04.581371', 'anonymousUser', '2021-04-16 12:15:04.581371', 'anonymousUser', 'MANAGER'),
(4, '2021-04-16 12:15:04.626400', 'anonymousUser', '2021-04-16 12:15:04.626400', 'anonymousUser', 'TECH'),
(5, '2021-04-16 12:15:04.648415', 'anonymousUser', '2021-04-16 12:15:04.648415', 'anonymousUser', 'CASHIER');

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

DROP TABLE IF EXISTS `service_type`;
CREATE TABLE IF NOT EXISTS `service_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `live_dead` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `vehicle_model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5xqxi6a47dld2eppt6hl3jl50` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `live_dead`, `name`, `price`, `vehicle_model`) VALUES
(1, '2021-04-16 12:21:22.917576', 'admin', '2021-04-16 12:21:22.917576', 'admin', 'ACTIVE', 'VAN-full service', '3000.00', 'VAN'),
(2, '2021-04-16 12:21:43.972256', 'admin', '2021-04-16 12:21:43.972256', 'admin', 'ACTIVE', 'VAN-bodywash', '300.00', 'VAN'),
(3, '2021-04-16 12:22:00.842915', 'admin', '2021-04-16 12:22:00.842915', 'admin', 'ACTIVE', 'VAN-waxing', '200.00', 'VAN'),
(4, '2021-04-18 09:45:58.453227', 'manager', '2021-04-18 09:45:58.453227', 'manager', 'ACTIVE', 'CAR-full service', '3000.00', 'CAR');

-- --------------------------------------------------------

--
-- Table structure for table `service_type_parameter`
--

DROP TABLE IF EXISTS `service_type_parameter`;
CREATE TABLE IF NOT EXISTS `service_type_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `live_dead` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `service_section` varchar(255) DEFAULT NULL,
  `vehicle_model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `service_type_parameter`
--

INSERT INTO `service_type_parameter` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `live_dead`, `name`, `price`, `service_section`, `vehicle_model`) VALUES
(1, '2021-04-16 12:20:09.678365', 'admin', '2021-04-16 12:20:09.678365', 'admin', 'ACTIVE', 'bodywash', '200.00', 'WASHING', 'VAN'),
(2, '2021-04-16 12:20:25.198888', 'admin', '2021-04-16 12:20:25.198888', 'admin', 'ACTIVE', 'waxing', '200.00', 'WASHING', 'VAN'),
(3, '2021-04-16 12:20:53.111164', 'admin', '2021-04-16 12:20:53.111164', 'admin', 'ACTIVE', 'Interior cleaning', '200.00', 'WASHING', 'VAN'),
(4, '2021-04-18 09:45:05.625315', 'manager', '2021-04-18 09:45:05.625315', 'manager', 'ACTIVE', 'bodywash', '200.00', 'WASHING', 'CAR'),
(5, '2021-04-18 09:45:27.939985', 'manager', '2021-04-18 09:45:27.939985', 'manager', 'ACTIVE', 'interior cleaning', '300.00', 'WASHING', 'CAR');

-- --------------------------------------------------------

--
-- Table structure for table `service_type_parameter_vehicle`
--

DROP TABLE IF EXISTS `service_type_parameter_vehicle`;
CREATE TABLE IF NOT EXISTS `service_type_parameter_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `meter_value` int(11) NOT NULL,
  `service_type_parameter_vehicle_status` varchar(255) DEFAULT NULL,
  `service_type_id` int(11) DEFAULT NULL,
  `service_type_parameter_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmgv16e760dtr5jj9n90tsorrm` (`service_type_id`),
  KEY `FKljlseeh5rd7paay6hefadj728` (`service_type_parameter_id`),
  KEY `FKgov4vxnrtu8rj2inukufumiws` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `service_type_parameter_vehicle`
--

INSERT INTO `service_type_parameter_vehicle` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `meter_value`, `service_type_parameter_vehicle_status`, `service_type_id`, `service_type_parameter_id`, `vehicle_id`) VALUES
(1, '2021-04-16 12:26:13.149596', 'manager', '2021-04-16 12:59:28.999397', 'manager', 2000, 'PAID', 3, 2, 1),
(2, '2021-04-16 12:32:10.892164', 'manager', '2021-04-16 12:33:38.997575', 'manager', 12323, 'PAID', 2, 1, 2),
(3, '2021-04-16 12:35:22.161854', 'manager', '2021-04-16 13:01:00.874107', 'manager', 12321321, 'PAID', 1, 1, 1),
(4, '2021-04-16 12:35:22.209885', 'manager', '2021-04-16 13:01:00.929144', 'manager', 12321321, 'PAID', 1, 2, 1),
(5, '2021-04-16 12:35:22.275928', 'manager', '2021-04-16 13:01:00.974176', 'manager', 12321321, 'PAID', 1, 3, 1),
(6, '2021-04-16 12:40:20.467485', 'manager', '2021-04-16 12:59:29.060439', 'manager', 2, 'PAID', 3, 2, 1),
(7, '2021-04-16 19:06:46.756737', 'manager', '2021-04-16 19:06:46.756737', 'manager', 0, 'CHK', 1, 1, 1),
(8, '2021-04-16 19:06:46.847797', 'manager', '2021-04-16 19:06:46.847797', 'manager', 0, 'CHK', 1, 2, 1),
(9, '2021-04-16 19:06:46.908838', 'manager', '2021-04-16 19:06:46.908838', 'manager', 0, 'CHK', 1, 3, 1),
(10, '2021-04-17 06:23:26.689323', 'manager', '2021-04-17 06:42:09.883577', 'manager', 0, 'PAID', 2, 1, 1),
(11, '2021-04-17 06:23:26.792392', 'manager', '2021-04-17 06:42:28.897102', 'manager', 0, 'PAID', 3, 2, 1),
(12, '2021-04-17 06:28:28.307660', 'manager', '2021-04-17 06:39:22.359549', 'manager', 12343, 'PAID', 2, 1, 2),
(13, '2021-04-17 06:31:31.900588', 'manager', '2021-04-17 06:39:22.415584', 'manager', 0, 'PAID', 2, 1, 2),
(14, '2021-04-17 06:33:41.385765', 'manager', '2021-04-17 06:42:09.910596', 'manager', 1324, 'PAID', 2, 1, 1),
(15, '2021-04-17 06:34:40.107158', 'manager', '2021-04-17 06:34:40.107158', 'manager', 134546, 'CHK', 2, 1, 2),
(16, '2021-04-17 06:48:11.695294', 'inspector', '2021-04-17 06:48:11.695294', 'inspector', 1, 'CHK', 2, 1, 2),
(17, '2021-04-17 06:48:46.636827', 'inspector', '2021-04-17 06:48:46.636827', 'inspector', 2, 'CHK', 2, 1, 1),
(18, '2021-04-18 09:53:14.296202', 'manager', '2021-04-18 09:53:33.950602', 'manager', 123123, 'DONE', 2, 1, 1),
(19, '2021-04-18 09:54:56.207145', 'manager', '2021-04-18 09:55:11.643569', 'manager', 123444, 'DONE', 3, 2, 1),
(20, '2021-04-18 09:58:45.923457', 'manager', '2021-04-18 09:59:03.370249', 'manager', 1234555, 'DONE', 1, 1, 1),
(21, '2021-04-18 09:58:45.999007', 'manager', '2021-04-18 09:59:03.428287', 'manager', 1234555, 'DONE', 1, 2, 1),
(22, '2021-04-18 09:58:46.090568', 'manager', '2021-04-18 09:59:03.498335', 'manager', 1234555, 'DONE', 1, 3, 1),
(23, '2021-04-18 10:02:51.561437', 'manager', '2021-04-18 10:09:58.751460', 'manager', 1111, 'DONE', 1, 1, 1),
(24, '2021-04-18 10:02:51.831654', 'manager', '2021-04-18 10:09:58.786983', 'manager', 1111, 'DONE', 1, 2, 1),
(25, '2021-04-18 10:02:51.896406', 'manager', '2021-04-18 10:10:18.570228', 'manager', 1111, 'DONE', 1, 3, 1),
(26, '2021-04-18 10:33:31.053263', 'inspector', '2021-04-18 12:37:25.236709', 'manager', 1234, 'DONE', 1, 1, 3),
(27, '2021-04-18 10:33:31.192975', 'inspector', '2021-04-18 12:37:25.276737', 'manager', 1234, 'DONE', 1, 2, 3),
(28, '2021-04-18 10:33:31.296566', 'inspector', '2021-04-18 12:37:25.314262', 'manager', 1234, 'DONE', 1, 3, 3),
(29, '2021-04-18 11:01:47.394837', 'inspector', '2021-04-18 11:04:37.752410', 'technichian', 238901, 'DONE', 1, 1, 4),
(30, '2021-04-18 11:01:47.481395', 'inspector', '2021-04-18 11:04:37.900279', 'technichian', 238901, 'DONE', 1, 2, 4),
(31, '2021-04-18 11:01:47.630004', 'inspector', '2021-04-18 11:04:37.929811', 'technichian', 238901, 'DONE', 1, 3, 4),
(32, '2021-04-18 11:12:36.844507', 'inspector', '2021-04-18 11:14:14.455551', 'technichian', 2132, 'DONE', 1, 1, 1),
(33, '2021-04-18 11:12:36.939570', 'inspector', '2021-04-18 11:14:14.536603', 'technichian', 2132, 'DONE', 1, 2, 1),
(34, '2021-04-18 11:12:37.006114', 'inspector', '2021-04-18 11:14:14.611654', 'technichian', 2132, 'DONE', 1, 3, 1),
(35, '2021-04-18 12:30:15.545010', 'inspector', '2021-04-18 12:30:52.766749', 'technichian', 11335, 'DONE', 2, 1, 1),
(36, '2021-04-18 12:34:56.852224', 'manager', '2021-04-18 12:37:25.367797', 'manager', 0, 'DONE', 2, 1, 3),
(37, '2021-04-18 13:31:46.686775', 'manager', '2021-04-18 13:32:01.917900', 'manager', 0, 'DONE', 3, 2, 1),
(38, '2021-04-18 13:48:36.486638', 'manager', '2021-04-18 13:48:49.471539', 'manager', 0, 'DONE', 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_type_service_type_parameter`
--

DROP TABLE IF EXISTS `service_type_service_type_parameter`;
CREATE TABLE IF NOT EXISTS `service_type_service_type_parameter` (
  `service_type_id` int(11) NOT NULL,
  `service_type_parameter_id` int(11) NOT NULL,
  KEY `FKt3nx9jc3hok90e7qi2iy3l9e4` (`service_type_parameter_id`),
  KEY `FKev9sp2g8m4w3g2402anrtd17u` (`service_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `service_type_service_type_parameter`
--

INSERT INTO `service_type_service_type_parameter` (`service_type_id`, `service_type_parameter_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 2),
(4, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  KEY `FK211dk0pe7l3aibwce8yy61ota` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `enabled`, `password`, `username`, `employee_id`) VALUES
(1, '2021-04-16 12:15:04.933605', 'anonymousUser', '2021-04-16 12:15:04.933605', 'anonymousUser', b'1', '$2a$10$jqNWmtn4D9i9dF1I.i3wr.n17FZ.BQWgRWPJ9KFYQPT9NqtgOsgBe', 'admin', 1),
(2, '2021-04-16 12:19:34.127843', 'admin', '2021-04-16 12:19:34.127843', 'admin', b'1', '$2a$10$vOm2mN7oTx3dMiLEVPJ.YuwcIuOs2ngyBNYhJ9KYQPk6yEcFF6/xO', 'manager', 2),
(3, '2021-04-17 06:47:02.939774', 'manager', '2021-04-18 11:28:51.603737', 'inspector', b'1', '$2a$10$nNKYAjaZIA0P3LRqElLz3.L3bf.aAFCiaQbJYNaB6Yad/PjiagwhW', 'inspector', 3),
(4, '2021-04-17 13:20:03.314798', 'manager', '2021-04-18 10:17:04.371488', 'manager', b'1', '$2a$10$17uaGHhb4cncoclIq.YrfuokoUdrta4XFGz71wKXhCOuxT8FiKN5G', 'cashier', 4),
(5, '2021-04-17 13:23:25.905676', 'manager', '2021-04-18 11:03:36.945993', 'manager', b'1', '$2a$10$ih4stc6qEh/xBt8G1KV6quHABoVM6JkTHs0.sobGuJX73yznSDd1S', 'technichian', 5),
(9, '2021-04-17 14:13:44.261424', 'manager', '2021-04-17 15:15:04.815245', 'manager', b'1', '$2a$10$OEbibOC5K9fZXz0FNWWp5OGDFBEzRtUx2CYOtC6dJ3B3TrEX7yWUS', 'lalith', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 3),
(3, 2),
(9, 5),
(4, 5),
(5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_session_log`
--

DROP TABLE IF EXISTS `user_session_log`;
CREATE TABLE IF NOT EXISTS `user_session_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `failure_attempts` int(11) NOT NULL,
  `user_session_log_status` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrhb4wune1hnnhdsbiah2ojo5l` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_session_log`
--

INSERT INTO `user_session_log` (`id`, `created_at`, `failure_attempts`, `user_session_log_status`, `user_id`) VALUES
(1, '2021-04-16 12:15:14.728137', 0, 'LOGGED', 1),
(2, '2021-04-16 12:22:39.530114', 0, 'LOGOUT', 1),
(3, '2021-04-16 12:22:50.220118', 0, 'LOGGED', 2),
(4, '2021-04-16 15:33:48.498327', 0, 'LOGGED', 1),
(5, '2021-04-16 15:36:18.509434', 0, 'LOGOUT', 1),
(6, '2021-04-16 18:56:12.300427', 0, 'LOGGED', 1),
(7, '2021-04-16 18:56:15.662180', 0, 'LOGOUT', 1),
(8, '2021-04-16 18:56:36.219408', 0, 'LOGGED', 2),
(9, '2021-04-16 18:56:40.941690', 0, 'LOGOUT', 2),
(10, '2021-04-16 19:06:01.773328', 0, 'LOGGED', 2),
(11, '2021-04-16 19:59:43.587393', 0, 'LOGGED', 2),
(12, '2021-04-16 20:49:30.093718', 0, 'LOGGED', 2),
(13, '2021-04-17 06:21:29.575634', 0, 'LOGGED', 2),
(14, '2021-04-17 06:47:10.131456', 0, 'LOGOUT', 2),
(15, '2021-04-17 06:47:41.255816', 0, 'LOGGED', 3),
(16, '2021-04-17 06:48:51.055382', 0, 'LOGOUT', 3),
(17, '2021-04-17 06:49:18.547907', 0, 'LOGGED', 2),
(18, '2021-04-17 09:08:01.773353', 0, 'LOGGED', 2),
(19, '2021-04-17 13:15:31.312017', 0, 'LOGGED', 2),
(20, '2021-04-17 13:23:32.684478', 0, 'LOGOUT', 2),
(21, '2021-04-17 13:23:40.980525', 0, 'LOGGED', 4),
(22, '2021-04-17 13:23:44.123913', 0, 'LOGOUT', 4),
(23, '2021-04-17 13:24:12.218252', 0, 'LOGGED', 2),
(24, '2021-04-17 14:08:45.154628', 0, 'LOGGED', 2),
(25, '2021-04-17 14:35:35.916666', 0, 'LOGGED', 1),
(26, '2021-04-17 14:35:54.660604', 0, 'LOGOUT', 1),
(27, '2021-04-17 14:36:23.912365', 0, 'LOGGED', 9),
(28, '2021-04-17 14:37:46.760231', 0, 'LOGOUT', 9),
(29, '2021-04-17 14:38:01.212998', 0, 'LOGGED', 3),
(30, '2021-04-17 14:38:12.077013', 0, 'LOGOUT', 3),
(31, '2021-04-17 14:38:22.054349', 0, 'LOGGED', 2),
(32, '2021-04-17 14:40:20.382725', 0, 'LOGOUT', 2),
(33, '2021-04-17 14:40:29.635085', 0, 'LOGGED', 3),
(34, '2021-04-17 14:40:33.316560', 0, 'LOGOUT', 3),
(35, '2021-04-17 14:40:49.839009', 0, 'LOGGED', 2),
(36, '2021-04-17 14:41:02.691711', 0, 'LOGOUT', 2),
(37, '2021-04-17 14:49:29.703317', 0, 'LOGGED', 2),
(38, '2021-04-17 14:49:35.555946', 0, 'LOGOUT', 2),
(39, '2021-04-17 15:14:29.905511', 0, 'LOGGED', 2),
(40, '2021-04-17 15:15:10.145441', 0, 'LOGOUT', 2),
(41, '2021-04-17 15:15:22.447026', 0, 'LOGGED', 9),
(42, '2021-04-17 15:16:04.462915', 0, 'LOGOUT', 9),
(43, '2021-04-17 15:16:27.330783', 0, 'LOGGED', 2),
(44, '2021-04-17 15:35:47.001318', 0, 'LOGOUT', 2),
(45, '2021-04-17 15:36:11.262574', 0, 'LOGGED', 9),
(46, '2021-04-17 15:43:13.781225', 0, 'LOGOUT', 9),
(47, '2021-04-17 15:43:21.695025', 0, 'LOGGED', 2),
(48, '2021-04-18 06:16:21.176778', 0, 'LOGGED', 2),
(49, '2021-04-18 09:34:29.279726', 0, 'LOGGED', 2),
(50, '2021-04-18 09:34:40.775292', 0, 'LOGOUT', 2),
(51, '2021-04-18 09:43:31.671578', 0, 'LOGGED', 2),
(52, '2021-04-18 10:14:58.760997', 0, 'LOGOUT', 2),
(53, '2021-04-18 10:15:10.919228', 0, 'LOGGED', 2),
(54, '2021-04-18 10:17:39.330178', 0, 'LOGOUT', 2),
(55, '2021-04-18 10:18:07.358492', 0, 'LOGGED', 3),
(56, '2021-04-18 10:27:38.241226', 0, 'LOGGED', 3),
(57, '2021-04-18 10:32:55.392336', 0, 'LOGGED', 3),
(58, '2021-04-18 10:33:40.344837', 0, 'LOGOUT', 3),
(59, '2021-04-18 10:34:29.155988', 0, 'LOGGED', 2),
(60, '2021-04-18 10:35:00.440435', 0, 'LOGOUT', 2),
(61, '2021-04-18 10:35:52.587580', 0, 'LOGGED', 2),
(62, '2021-04-18 10:37:01.171827', 0, 'LOGOUT', 2),
(63, '2021-04-18 10:37:09.864967', 0, 'LOGGED', 5),
(64, '2021-04-18 10:38:49.325540', 0, 'LOGOUT', 5),
(65, '2021-04-18 10:38:58.647784', 0, 'LOGGED', 4),
(66, '2021-04-18 10:40:28.688412', 0, 'LOGOUT', 4),
(67, '2021-04-18 10:41:56.769802', 0, 'LOGGED', 2),
(68, '2021-04-18 10:58:26.578126', 0, 'LOGGED', 3),
(69, '2021-04-18 11:01:57.423818', 0, 'LOGOUT', 3),
(70, '2021-04-18 11:03:09.344603', 0, 'LOGGED', 2),
(71, '2021-04-18 11:03:41.627819', 0, 'LOGOUT', 2),
(72, '2021-04-18 11:03:49.859439', 0, 'LOGGED', 5),
(73, '2021-04-18 11:07:47.538279', 0, 'LOGOUT', 5),
(74, '2021-04-18 11:08:04.478341', 0, 'LOGGED', 3),
(75, '2021-04-18 11:12:40.580765', 0, 'LOGOUT', 3),
(76, '2021-04-18 11:13:21.214411', 0, 'LOGGED', 2),
(77, '2021-04-18 11:13:38.756943', 0, 'LOGOUT', 2),
(78, '2021-04-18 11:14:00.282608', 0, 'LOGGED', 5),
(79, '2021-04-18 11:22:16.046821', 0, 'LOGOUT', 5),
(80, '2021-04-18 11:22:27.434007', 0, 'LOGGED', 3),
(81, '2021-04-18 12:28:57.379455', 0, 'LOGGED', 2),
(82, '2021-04-18 12:29:07.997938', 0, 'LOGOUT', 2),
(83, '2021-04-18 12:29:42.626595', 0, 'LOGGED', 3),
(84, '2021-04-18 12:30:22.268750', 0, 'LOGOUT', 3),
(85, '2021-04-18 12:30:39.052171', 0, 'LOGGED', 5),
(86, '2021-04-18 12:31:44.024359', 0, 'LOGOUT', 5),
(87, '2021-04-18 12:32:42.084612', 0, 'LOGGED', 2),
(88, '2021-04-18 13:21:03.399861', 0, 'LOGGED', 2),
(89, '2021-04-18 14:12:39.707734', 0, 'LOGGED', 2),
(90, '2021-04-18 15:44:35.291742', 0, 'LOGGED', 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `chassis_number`, `code`, `engine_number`, `gear_type`, `live_dead`, `manufactured_year`, `number`, `registration_number`, `vehicle_model`, `customer_id`) VALUES
(1, '2021-04-16 12:24:57.952192', 'manager', '2021-04-18 11:12:11.413549', 'inspector', '123456', NULL, '12345', 'MANUAL', 'ACTIVE', '2000', 'GW1175', 'SAV210000', 'VAN', 6),
(2, '2021-04-16 12:25:29.940621', 'manager', '2021-04-16 12:25:29.940621', 'manager', '1234567', NULL, '1234567', 'MANUAL', 'ACTIVE', '2000', 'XO94778', 'SAV210001', 'VAN', 2),
(3, '2021-04-18 10:20:45.501775', 'inspector', '2021-04-18 10:20:45.501775', 'inspector', 'qwe1234', NULL, 'ald1234', 'MANUAL', 'ACTIVE', '2013', 'XD0905', 'SAV210002', 'VAN', 3),
(4, '2021-04-18 11:01:11.464172', 'inspector', '2021-04-18 11:01:11.464172', 'inspector', 'asd123', NULL, 'qwe123', 'MANUAL', 'ACTIVE', '1992', '2513455', 'SAV210003', 'VAN', 1),
(8, '2021-04-18 11:24:00.470799', 'inspector', '2021-04-18 11:24:00.470799', 'inspector', '1231qw', NULL, '123qw', 'MANUAL', 'ACTIVE', '1992', '56123', 'SAV210004', 'VAN', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_files`
--
ALTER TABLE `employee_files`
  ADD CONSTRAINT `FKolualpa5dydj5r06txltc1y6d` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK71268xwbe8u7suqrowleh11wj` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  ADD CONSTRAINT `FKby2skjf3ov608yb6nm16b49lg` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FKeqi3aaatxtg6v4c91tfhhdo0u` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`id`),
  ADD CONSTRAINT `FKs0qx9ne49ltgj5jrvwblc6xe9` FOREIGN KEY (`discount_ratio_id`) REFERENCES `discount_ratio` (`id`);

--
-- Constraints for table `service_type_parameter_vehicle`
--
ALTER TABLE `service_type_parameter_vehicle`
  ADD CONSTRAINT `FKgov4vxnrtu8rj2inukufumiws` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  ADD CONSTRAINT `FKljlseeh5rd7paay6hefadj728` FOREIGN KEY (`service_type_parameter_id`) REFERENCES `service_type_parameter` (`id`),
  ADD CONSTRAINT `FKmgv16e760dtr5jj9n90tsorrm` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`id`);

--
-- Constraints for table `service_type_service_type_parameter`
--
ALTER TABLE `service_type_service_type_parameter`
  ADD CONSTRAINT `FKev9sp2g8m4w3g2402anrtd17u` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`id`),
  ADD CONSTRAINT `FKt3nx9jc3hok90e7qi2iy3l9e4` FOREIGN KEY (`service_type_parameter_id`) REFERENCES `service_type_parameter` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK211dk0pe7l3aibwce8yy61ota` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `user_session_log`
--
ALTER TABLE `user_session_log`
  ADD CONSTRAINT `FKrhb4wune1hnnhdsbiah2ojo5l` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `FKlwqsusjj6iodeb0df1b554vxq` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
