-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for jindaltrading
CREATE DATABASE IF NOT EXISTS `jindaltrading` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jindaltrading`;

-- Dumping structure for table jindaltrading.check
CREATE TABLE IF NOT EXISTS `check` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `data` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.check: ~0 rows (approximately)
DELETE FROM `check`;

-- Dumping structure for table jindaltrading.contact_details
CREATE TABLE IF NOT EXISTS `contact_details` (
  `FIRST_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LAST_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `E_MAIL_ADDRESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DESINATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MOBILE_NUMBER` bigint NOT NULL DEFAULT '0',
  UNIQUE KEY `MOBILE_NUMBER` (`MOBILE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.contact_details: ~3 rows (approximately)
DELETE FROM `contact_details`;
INSERT INTO `contact_details` (`FIRST_NAME`, `LAST_NAME`, `E_MAIL_ADDRESS`, `DESINATION`, `MOBILE_NUMBER`) VALUES
	('KISHAN', 'PAL', 'KIG@GMAIL.COM', 'PARTNER', 932561202),
	('RAKESH', 'TOMAR', 'rakeshtomar@gmail.com', 'owner', 2147483647),
	('RAKESH', 'TOMAR', 'rakeshtomar@gmail.com', 'owner', 9837786106);

-- Dumping structure for table jindaltrading.customer_firms
CREATE TABLE IF NOT EXISTS `customer_firms` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `firm` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.customer_firms: ~0 rows (approximately)
DELETE FROM `customer_firms`;

-- Dumping structure for table jindaltrading.cust_categories
CREATE TABLE IF NOT EXISTS `cust_categories` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_categories: ~12 rows (approximately)
DELETE FROM `cust_categories`;
INSERT INTO `cust_categories` (`customerId`, `customerName`, `category`, `createdAt`, `updatedAt`) VALUES
	(84, '90', '5', '2023-07-03 11:43:44', '2023-07-13 11:08:00'),
	(85, '91', '18', '2023-07-03 11:45:29', '2023-07-03 11:45:29'),
	(89, '95', '5', '2023-07-03 14:14:01', '2023-07-03 14:14:01'),
	(91, '97', '18', '2023-07-13 07:34:17', '2023-07-13 07:34:17'),
	(92, '98', '5', '2023-07-14 12:59:02', '2023-07-14 12:59:02'),
	(93, '98', '8', '2023-07-14 12:59:02', '2023-07-14 12:59:02'),
	(94, '98', '18', '2023-07-14 12:59:02', '2023-07-14 12:59:02'),
	(95, '99', '5', '2023-07-14 13:26:53', '2023-07-14 13:26:53'),
	(96, '99', '8', '2023-07-14 13:26:53', '2023-07-14 13:26:53'),
	(97, '100', '5', '2023-07-14 13:29:22', '2023-07-14 13:29:22'),
	(98, '102', '5', '2023-07-14 13:37:17', '2023-07-14 13:37:17'),
	(99, '103', '5', '2023-07-14 13:39:43', '2023-07-14 13:39:43');

-- Dumping structure for table jindaltrading.cust_contacts
CREATE TABLE IF NOT EXISTS `cust_contacts` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `mobileNumber` bigint DEFAULT NULL,
  `customerName` varchar(50) DEFAULT NULL,
  `contactName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_contacts: ~9 rows (approximately)
DELETE FROM `cust_contacts`;
INSERT INTO `cust_contacts` (`customerId`, `mobileNumber`, `customerName`, `contactName`, `designation`, `email`, `createdAt`, `updatedAt`) VALUES
	(141, 5555566666, '95', NULL, 'Manager', 'ujjwalraturi248001@gmail.com', '2023-07-03 14:14:01', '2023-07-03 14:14:01'),
	(142, 1234567890, '95', NULL, 'hr', 'a@b', '2023-07-03 14:14:01', '2023-07-03 14:14:01'),
	(153, 1234567890, '97', NULL, 'man', 'ujjwalraturi248001@gmail.com', '2023-07-13 07:34:17', '2023-07-13 07:34:17'),
	(154, 1234567890, '97', NULL, 'hr', 'ujjwalraturi248001@gmail.com', '2023-07-13 10:51:36', '2023-07-13 10:51:36'),
	(155, 1112223335, '97', NULL, 'ceo', 'a@n', '2023-07-13 10:51:36', '2023-07-13 10:51:36'),
	(156, 1234567890, '91', NULL, 'aa', 's@d', '2023-07-13 10:52:01', '2023-07-13 11:03:40'),
	(157, 1234567890, '98', NULL, 'aa', 'ujjwalraturi248001@gmail.com', '2023-07-14 12:59:02', '2023-07-14 12:59:02'),
	(158, 1234567890, '103', 'aa', 'vdv', 'ujjwalraturi248001@gmail.com', '2023-07-14 13:39:43', '2023-07-14 13:39:43'),
	(159, 1234567890, '103', 'dfdf', 'vdvd', 'ujjwalraturi248001@gmail.com', '2023-07-14 13:39:43', '2023-07-14 13:39:43');

-- Dumping structure for table jindaltrading.cust_firms
CREATE TABLE IF NOT EXISTS `cust_firms` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `firm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_firms: ~10 rows (approximately)
DELETE FROM `cust_firms`;
INSERT INTO `cust_firms` (`customerId`, `customerName`, `firm`, `createdAt`, `updatedAt`) VALUES
	(34, '90', '25', '2023-07-03 11:43:44', '2023-07-03 11:43:44'),
	(35, '90', '27', '2023-07-03 11:43:44', '2023-07-03 11:43:44'),
	(36, '91', '27', '2023-07-03 11:45:29', '2023-07-03 11:45:29'),
	(42, '95', '25', '2023-07-03 14:14:01', '2023-07-03 14:14:01'),
	(44, '97', '25', '2023-07-13 07:34:17', '2023-07-13 07:34:17'),
	(45, '98', '25', '2023-07-14 12:59:02', '2023-07-14 12:59:02'),
	(46, '99', '25', '2023-07-14 13:26:53', '2023-07-14 13:26:53'),
	(47, '100', '27', '2023-07-14 13:29:22', '2023-07-14 13:29:22'),
	(48, '102', '25', '2023-07-14 13:37:17', '2023-07-14 13:37:17'),
	(49, '103', '25', '2023-07-14 13:39:43', '2023-07-14 13:39:43');

-- Dumping structure for table jindaltrading.cust_product
CREATE TABLE IF NOT EXISTS `cust_product` (
  `CUSTOMER_ID` varchar(50) DEFAULT NULL,
  `PRODUCTS` varchar(50) DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `PRODUCT_GROUP` varchar(50) DEFAULT NULL,
  `TOTAL_QUTY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_product: ~0 rows (approximately)
DELETE FROM `cust_product`;

-- Dumping structure for table jindaltrading.cust_products
CREATE TABLE IF NOT EXISTS `cust_products` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_products: ~12 rows (approximately)
DELETE FROM `cust_products`;
INSERT INTO `cust_products` (`customerId`, `customerName`, `product`, `createdAt`, `updatedAt`) VALUES
	(137, '95', '17', '2023-07-03 11:43:44', '2023-07-13 11:10:52'),
	(138, '90', '18', '2023-07-03 11:43:44', '2023-07-03 11:43:44'),
	(139, '91', '17', '2023-07-03 11:45:29', '2023-07-03 11:45:29'),
	(143, '95', '17', '2023-07-03 14:14:01', '2023-07-03 14:14:01'),
	(144, '95', '18', '2023-07-05 03:00:49', '2023-07-05 03:00:49'),
	(146, '97', '17', '2023-07-13 07:34:17', '2023-07-13 07:34:17'),
	(147, '98', '17', '2023-07-14 12:59:02', '2023-07-14 12:59:02'),
	(148, '98', '18', '2023-07-14 12:59:02', '2023-07-14 12:59:02'),
	(149, '99', '17', '2023-07-14 13:26:53', '2023-07-14 13:26:53'),
	(150, '100', '18', '2023-07-14 13:29:22', '2023-07-14 13:29:22'),
	(151, '102', '18', '2023-07-14 13:37:17', '2023-07-14 13:37:17'),
	(152, '103', '17', '2023-07-14 13:39:43', '2023-07-14 13:39:43');

-- Dumping structure for table jindaltrading.firm_details
CREATE TABLE IF NOT EXISTS `firm_details` (
  `S.NO` int NOT NULL,
  `FIRM_ID` varchar(50) NOT NULL DEFAULT '',
  `FIRM_NAME` varchar(50) NOT NULL DEFAULT '',
  `G.S.T` varchar(50) NOT NULL DEFAULT '',
  `ADDRESS` varchar(50) NOT NULL DEFAULT '',
  `PIN_CODE` varchar(50) NOT NULL DEFAULT '',
  `BANK_NAME` varchar(50) NOT NULL DEFAULT '',
  `BANK_ACC` varchar(50) NOT NULL DEFAULT '',
  `I.F.C_CODE` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`FIRM_ID`),
  UNIQUE KEY `BANK_ACC` (`BANK_ACC`),
  UNIQUE KEY `G.S.T` (`G.S.T`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.firm_details: ~2 rows (approximately)
DELETE FROM `firm_details`;
INSERT INTO `firm_details` (`S.NO`, `FIRM_ID`, `FIRM_NAME`, `G.S.T`, `ADDRESS`, `PIN_CODE`, `BANK_NAME`, `BANK_ACC`, `I.F.C_CODE`) VALUES
	(1, 'AGGRAWAL INDUSTRIES MEERUT', 'AGGRAWAL INDUSTRIES ', '09AEXPA0129B1ZU', '60/122 MEERUIT JINDAL TRADING COMPANY', '250002', 'ICIC BANK', '01235678', 'ICIC0000012HU'),
	(2, 'AGGRAWALINDUSTRIES DELHI', 'AGGRAWAL INDUSTRIES', '098ACDEJ2561', 'AGGAWALINDUSTRIES KABRI BAZZAR RED FORT', '156161', 'HDFC BANK', '234165413JKBC', '1153265052');

-- Dumping structure for table jindaltrading.logintables
CREATE TABLE IF NOT EXISTS `logintables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.logintables: ~4 rows (approximately)
DELETE FROM `logintables`;
INSERT INTO `logintables` (`id`, `username`, `password`, `role`, `createdAt`, `updatedAt`, `level`) VALUES
	(1, 'Rohit', 'passr', 'User', '2022-11-17 18:04:54', '2022-11-17 18:04:54', 1),
	(2, 'Kios', 'passk', 'Moderator', '2022-11-24 17:01:32', '2022-11-24 17:01:32', 2),
	(3, 'Harsh', 'passh', 'Admin', '2022-11-24 17:02:23', '2022-11-24 17:02:23', 3),
	(12, 'check', 'passc', 'User', '2023-03-18 01:47:40', '2023-03-18 01:52:41', 2);

-- Dumping structure for table jindaltrading.market_plan_allotments
CREATE TABLE IF NOT EXISTS `market_plan_allotments` (
  `serialNumber` int NOT NULL AUTO_INCREMENT,
  `customerId` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `representative` varchar(255) NOT NULL,
  `meetingDates` varchar(255) NOT NULL,
  `currentIssue` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`serialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.market_plan_allotments: ~3 rows (approximately)
DELETE FROM `market_plan_allotments`;
INSERT INTO `market_plan_allotments` (`serialNumber`, `customerId`, `phoneNumber`, `area`, `product`, `representative`, `meetingDates`, `currentIssue`, `createdAt`, `updatedAt`) VALUES
	(1, '10', '1122334455', '	delhi', '	PIG IRON', 'Rohit', '1', 'sales', '2023-01-27 14:39:57', '2023-02-23 00:26:37'),
	(2, '5', '5556663334', '	agra', '	HARD COKE', 'Rohit', '21', 'account info', '2023-01-27 14:49:52', '2023-02-23 00:26:21'),
	(3, '12', '5533559704', '	chittor', '24% LOW ASH', 'Arun', '19', 'not known', '2023-01-27 09:37:42', '2023-02-23 00:26:25');

-- Dumping structure for table jindaltrading.market_plan_pig_irons
CREATE TABLE IF NOT EXISTS `market_plan_pig_irons` (
  `serialNumber` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastDelivery` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `representative` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phoneNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `meetingDates` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `currentRemark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `remarkStatus` enum('VERIFIED','UNVERIFIED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'UNVERIFIED',
  `nextDate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `currentIssue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `analysed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updateTimeStamp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `totalIssue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`serialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.market_plan_pig_irons: ~2 rows (approximately)
DELETE FROM `market_plan_pig_irons`;
INSERT INTO `market_plan_pig_irons` (`serialNumber`, `customerName`, `area`, `grade`, `category`, `product`, `lastDelivery`, `representative`, `phoneNumber`, `meetingDates`, `currentRemark`, `remarkStatus`, `nextDate`, `currentIssue`, `analysed`, `updateTimeStamp`, `totalIssue`, `createdAt`, `updatedAt`) VALUES
	(41, 'PAL AGRO', 'meerut', 'B', 'Retail', 'PIG IRON', '2023-04-01', 'Rohit', '8533859704', '2023-04-12', '', 'UNVERIFIED', '', '', '', '', '', '2023-04-11 14:31:14', '2023-04-11 14:51:40'),
	(42, 'PAL AGRO', 'meerut', 'A', 'Retail', 'PIG IRON', '2023-05-20', 'Rohit', '1112223333', '2023-05-27', NULL, 'UNVERIFIED', NULL, NULL, NULL, NULL, NULL, '2023-05-25 21:27:57', '2023-05-25 21:27:57');

-- Dumping structure for table jindaltrading.market_plan_quantity_ledgers
CREATE TABLE IF NOT EXISTS `market_plan_quantity_ledgers` (
  `serialNumber` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `invoiceNumber` varchar(50) NOT NULL DEFAULT '',
  `delivery` varchar(50) NOT NULL DEFAULT '0000-00-00',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`serialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.market_plan_quantity_ledgers: ~1 rows (approximately)
DELETE FROM `market_plan_quantity_ledgers`;
INSERT INTO `market_plan_quantity_ledgers` (`serialNumber`, `customerName`, `category`, `product`, `quantity`, `invoiceNumber`, `delivery`, `createdAt`, `updatedAt`) VALUES
	(9, 'PAL AGRO', 'Retail', 'PIG IRON', 15, 'KL034D12', '2023-04-01', '2023-04-11 14:32:03', '2023-04-11 14:32:03');

-- Dumping structure for table jindaltrading.mastercustomers
CREATE TABLE IF NOT EXISTS `mastercustomers` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `status` enum('VERIFIED','UNVERIFIED','INACTIVE') DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `referenceNumber1` varchar(255) DEFAULT NULL,
  `referenceNumber2` varchar(255) DEFAULT NULL,
  `creditLimit` int DEFAULT NULL,
  `creditDays` int DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.mastercustomers: ~0 rows (approximately)
DELETE FROM `mastercustomers`;

-- Dumping structure for table jindaltrading.masterteam
CREATE TABLE IF NOT EXISTS `masterteam` (
  `member` varchar(50) DEFAULT NULL,
  `leader` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.masterteam: ~3 rows (approximately)
DELETE FROM `masterteam`;
INSERT INTO `masterteam` (`member`, `leader`) VALUES
	('ashok', 'sachin'),
	('ravi', 'sachin'),
	('sachin', 'ujjwal');

-- Dumping structure for table jindaltrading.masterustomers
CREATE TABLE IF NOT EXISTS `masterustomers` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `status` enum('VERIFIED','UNVERIFIED','INACTIVE') DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `referenceNumber1` varchar(255) DEFAULT NULL,
  `referenceNumber2` varchar(255) DEFAULT NULL,
  `creditLimit` int DEFAULT NULL,
  `creditDays` int DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.masterustomers: ~0 rows (approximately)
DELETE FROM `masterustomers`;

-- Dumping structure for table jindaltrading.master_areas
CREATE TABLE IF NOT EXISTS `master_areas` (
  `areaId` int NOT NULL AUTO_INCREMENT,
  `area` varchar(50) NOT NULL,
  `district` varchar(50) DEFAULT NULL,
  `zone` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`areaId`) USING BTREE,
  UNIQUE KEY `area` (`area`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_areas: ~4 rows (approximately)
DELETE FROM `master_areas`;
INSERT INTO `master_areas` (`areaId`, `area`, `district`, `zone`, `state`) VALUES
	(1, 'del', 'del', 'A', 'delhi'),
	(2, 'meerut', 'meerut', 'B', 'uttar pradesh'),
	(12, 'agra', 'lucknow', 'A', 'uttar pradesh'),
	(19, 'haridwar', 'haridwar', 'D', 'uttarakhand');

-- Dumping structure for table jindaltrading.master_categories
CREATE TABLE IF NOT EXISTS `master_categories` (
  `categoriesId` int NOT NULL AUTO_INCREMENT,
  `categoriesType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoriesId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_categories: ~3 rows (approximately)
DELETE FROM `master_categories`;
INSERT INTO `master_categories` (`categoriesId`, `categoriesType`) VALUES
	(5, 'Traders'),
	(8, 'Wholesale'),
	(18, 'Retail');

-- Dumping structure for table jindaltrading.master_customers
CREATE TABLE IF NOT EXISTS `master_customers` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(50) NOT NULL DEFAULT '0',
  `area` varchar(50) DEFAULT NULL,
  `areaId` int DEFAULT NULL,
  `status` enum('VERIFIED','UNVERIFIED','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'UNVERIFIED',
  `grade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `referenceNumber1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reference1ContactNumber` bigint DEFAULT NULL,
  `referenceNumber2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `reference2ContactNumber` bigint DEFAULT NULL,
  `creditLimit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `creditDays` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  PRIMARY KEY (`customerId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_customers: ~10 rows (approximately)
DELETE FROM `master_customers`;
INSERT INTO `master_customers` (`customerId`, `customerName`, `area`, `areaId`, `status`, `grade`, `pincode`, `address`, `referenceNumber1`, `reference1ContactNumber`, `referenceNumber2`, `reference2ContactNumber`, `creditLimit`, `creditDays`) VALUES
	(90, 'asdf', '1', NULL, 'VERIFIED', '1', 248005, 'zdfbsdftbae', '', 8533859704, '', NULL, '', ''),
	(91, 'qwwe', '12', NULL, 'VERIFIED', '2', 248005, 'ss', '', NULL, '', NULL, NULL, NULL),
	(95, 'Ujjwal Raturi', '19', NULL, 'VERIFIED', '1', 248005, 'Lane-1, Vansthalipuram, Miyanwala Chowk, Haridwar Road', 'arpit', 8533859704, 'mohit', 1122334455, '10000', '10'),
	(97, 'prakash', '1', NULL, 'UNVERIFIED', '1', 248005, 'Lane-1, Vansthalipuram, Miyanwala Chowk, Haridwar Road', '', NULL, '', NULL, NULL, NULL),
	(98, 'qaz', '1', NULL, 'VERIFIED', '1', 248005, 'Haridwar Road', '', 8533859704, '', NULL, NULL, NULL),
	(99, 'ert', '19', NULL, 'UNVERIFIED', '1', 248005, 'Lane-1, Vansthalipuram, Miyanwala Chowk, Haridwar Road', '', 8533859704, '', NULL, NULL, NULL),
	(100, 'vfbfbfbfbfb', '2', NULL, 'VERIFIED', '1', 248005, 'Lane-1, Vansthalipuram, Miyanwala Chowk, Haridwar Road', '', 8533859704, '', NULL, NULL, NULL),
	(101, 'adi', '1', NULL, 'UNVERIFIED', '2', 248005, 'Lane-1, Vansthalipuram, Miyanwala Chowk, Haridwar Road', '', 918533859704, '', NULL, NULL, NULL),
	(102, 'war', '2', NULL, 'VERIFIED', '2', 248005, 'Lane-1, Vansthalipuram, Miyanwala Chowk, Haridwar Road', '', 8533859704, '', NULL, NULL, NULL),
	(103, 'power', '12', NULL, 'UNVERIFIED', '2', 248005, 'Lane-1, Vansthalipuram, Miyanwala Chowk, Haridwar Road', '', 8533859704, '', NULL, NULL, NULL);

-- Dumping structure for table jindaltrading.master_custs
CREATE TABLE IF NOT EXISTS `master_custs` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `status` enum('VERIFIED','UNVERIFIED','INACTIVE') DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `referenceNumber1` varchar(255) DEFAULT NULL,
  `referenceNumber2` varchar(255) DEFAULT NULL,
  `creditLimit` int DEFAULT NULL,
  `creditDays` int DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_custs: ~0 rows (approximately)
DELETE FROM `master_custs`;

-- Dumping structure for table jindaltrading.master_employees
CREATE TABLE IF NOT EXISTS `master_employees` (
  `employeeNumber` int NOT NULL AUTO_INCREMENT,
  `employeeName` varchar(255) NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dateOfJoining` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `dateOfLeaving` varchar(50) DEFAULT '',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dateOfBirth` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bloodGroup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `primaryMobileNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fatherName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `motherName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fatherMobileNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `motherMobileNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `spouseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `spouseMobileNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `emailId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bankName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bankAccountNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `ifscCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `aadharNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `panNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `referenceContactNumber` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employeeNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_employees: ~5 rows (approximately)
DELETE FROM `master_employees`;
INSERT INTO `master_employees` (`employeeNumber`, `employeeName`, `designation`, `dateOfJoining`, `dateOfLeaving`, `gender`, `dateOfBirth`, `bloodGroup`, `address`, `primaryMobileNumber`, `fatherName`, `motherName`, `fatherMobileNumber`, `motherMobileNumber`, `spouseName`, `spouseMobileNumber`, `emailId`, `bankName`, `bankAccountNumber`, `ifscCode`, `aadharNumber`, `panNumber`, `reference`, `referenceContactNumber`, `photo`) VALUES
	(7, 'Ravi', 'Manager', '', '', '', '1', 'Sales', 'delhi', '1112223333', '', '', '', '', '', '', 'a@d', 'SBI', '123456789012', 'aw34', '123456789012', 'sd34', '', NULL, ''),
	(12, 'ujjwal', 'a', '2023-03-30', '', '', '2023-03-02', 'A', 'a', '1234567890', '', '', '', '', '', '', 'ujjwalraturi248001@gmail.com', 'a', '12345678901', 'a', '12345678901', '1', '', '', NULL),
	(17, 'neha', 'a', '', '', '', '', 'B', '', '1', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', 'images/2023-03-29T09-53-44.229Z-female1.jpg'),
	(18, 'Mohit Sharma', 'Manager', '2023-03-29', '', 'Male', '1995-01-01', 'A', 'Haldwani', '1234567891', 'Ram Sharma', 'Kiran Sharma', '3213211230', '', '', '', 'mohit@gmail.com', 'SBI', '11100224444', 'SBI000GL', '302510359926', 'MSS1197', 'Ashok', '9871236541', 'images\\2023-03-29T10-50-42.003Z-man1.jpg'),
	(19, 'ishu', 'Manager', '2023-04-12', '', '', '2023-04-17', 'a', 'dun', '8533859704', 'aa', 'a', '', '', '', '', 'ujjwalraturi248001@gmail.com', 'sbi', '123412341234', 'df4', '123412341234', 'sd34', '', '', 'No image');

-- Dumping structure for table jindaltrading.master_firms
CREATE TABLE IF NOT EXISTS `master_firms` (
  `firmId` int NOT NULL AUTO_INCREMENT,
  `firmName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pincode` int NOT NULL DEFAULT '0',
  `GSTNumber` varchar(50) NOT NULL DEFAULT '0',
  `accountNumber` int NOT NULL DEFAULT '0',
  `bankName` varchar(50) NOT NULL DEFAULT '0',
  `IFSCcode` varchar(50) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`firmId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_firms: ~4 rows (approximately)
DELETE FROM `master_firms`;
INSERT INTO `master_firms` (`firmId`, `firmName`, `address`, `pincode`, `GSTNumber`, `accountNumber`, `bankName`, `IFSCcode`, `createdAt`, `updatedAt`) VALUES
	(25, 'Pal Agro hg', 'Haridwar Road', 249201, '1q2w3ee45', 123456, 'wd', 'SBI000', '2023-06-22 10:33:24', '2023-06-22 11:38:17'),
	(27, 'sfsdf', 'Lane-1, Vansthalipuram, Miyanwala Chowk, Haridwar Road', 249201, '1q2w3ee45', 123456, 'sbi', 'SBI000', '2023-07-03 11:42:56', '2023-07-03 11:42:56'),
	(28, 'papu', 'appu', 248001, 'awaw', 123456, 'wd', 'SBI000', '2023-07-03 11:55:51', '2023-07-03 11:55:51'),
	(29, 'utkrist bhaiya', 'rishikesh', 123456, 'a', 1, 'a', 'a', '2023-07-13 18:10:57', '2023-07-13 18:10:57');

-- Dumping structure for table jindaltrading.master_grades
CREATE TABLE IF NOT EXISTS `master_grades` (
  `gradeId` int NOT NULL AUTO_INCREMENT,
  `gradeType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_grades: ~4 rows (approximately)
DELETE FROM `master_grades`;
INSERT INTO `master_grades` (`gradeId`, `gradeType`) VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C'),
	(9, 'D');

-- Dumping structure for table jindaltrading.master_products
CREATE TABLE IF NOT EXISTS `master_products` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) DEFAULT NULL,
  `productGroup` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_products: ~2 rows (approximately)
DELETE FROM `master_products`;
INSERT INTO `master_products` (`productId`, `productName`, `productGroup`) VALUES
	(17, 'PIG IRON', '4'),
	(18, 'COAL', '1');

-- Dumping structure for table jindaltrading.master_product_groups
CREATE TABLE IF NOT EXISTS `master_product_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productGroup` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_product_groups: ~2 rows (approximately)
DELETE FROM `master_product_groups`;
INSERT INTO `master_product_groups` (`id`, `productGroup`, `createdAt`, `updatedAt`) VALUES
	(1, 'Foundory Coke', '2023-03-13 18:40:52', '2023-06-22 06:49:28'),
	(4, 'steel', '2023-06-22 07:02:09', '2023-06-22 07:02:09');

-- Dumping structure for table jindaltrading.master_teams
CREATE TABLE IF NOT EXISTS `master_teams` (
  `teamId` int NOT NULL AUTO_INCREMENT,
  `teamMember` varchar(255) DEFAULT NULL,
  `teamLeader` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`teamId`),
  UNIQUE KEY `teamMember` (`teamMember`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_teams: ~7 rows (approximately)
DELETE FROM `master_teams`;
INSERT INTO `master_teams` (`teamId`, `teamMember`, `teamLeader`, `createdAt`, `updatedAt`) VALUES
	(1, 'Shekhar', 'Sachin', '2023-01-14 08:43:41', '2023-01-14 08:43:42'),
	(2, 'Rohit', 'Sachin', '2023-01-14 08:44:05', '2023-01-14 03:23:21'),
	(3, 'Arun', 'Ashok', '2023-01-14 08:44:23', '2023-01-14 08:44:25'),
	(6, 'Raju', 'Babu Rao', '2023-02-25 10:49:53', '2023-02-25 10:49:53'),
	(10, 'Shyam', 'Babu Rao', '2023-02-25 11:13:59', '2023-02-25 11:13:59'),
	(13, 'ujjwal', 'ishu', '2023-04-15 19:20:48', '2023-04-15 19:20:48'),
	(14, 'ishu', 'ishu', '2023-04-15 19:21:03', '2023-04-15 19:21:03');

-- Dumping structure for table jindaltrading.master_vendors
CREATE TABLE IF NOT EXISTS `master_vendors` (
  `vendorId` int NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(50) NOT NULL,
  `vendorAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`vendorId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_vendors: ~2 rows (approximately)
DELETE FROM `master_vendors`;
INSERT INTO `master_vendors` (`vendorId`, `vendorName`, `vendorAddress`, `area`) VALUES
	(19, 'Ujjwal', 'Safdarganj', '1'),
	(20, 'naveen', 'dehradun', '19');

-- Dumping structure for table jindaltrading.transport
CREATE TABLE IF NOT EXISTS `transport` (
  `transport_id` varchar(50) DEFAULT NULL,
  `transport_name` varchar(50) DEFAULT NULL,
  `transport_area` varchar(50) DEFAULT NULL,
  `transport_station` varchar(50) DEFAULT NULL,
  `owner_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_acc` bigint DEFAULT NULL,
  `ifc_code` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transport: ~0 rows (approximately)
DELETE FROM `transport`;

-- Dumping structure for table jindaltrading.transportstations
CREATE TABLE IF NOT EXISTS `transportstations` (
  `transportId` int NOT NULL AUTO_INCREMENT,
  `transportName` varchar(255) DEFAULT NULL,
  `transportSource` varchar(255) DEFAULT NULL,
  `transportDestination` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`transportId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transportstations: ~4 rows (approximately)
DELETE FROM `transportstations`;
INSERT INTO `transportstations` (`transportId`, `transportName`, `transportSource`, `transportDestination`, `createdAt`, `updatedAt`) VALUES
	(8, '15', 'dehradun', 'delhi', '2023-07-13 11:24:38', '2023-07-13 11:24:38'),
	(9, '16', 's', 'f', '2023-07-13 11:26:19', '2023-07-13 11:26:19'),
	(10, '17', 's', 's', '2023-07-13 11:27:13', '2023-07-13 11:27:13'),
	(11, '18', 'xx', 'xax', '2023-07-15 06:20:06', '2023-07-15 06:20:06');

-- Dumping structure for table jindaltrading.transport_contact
CREATE TABLE IF NOT EXISTS `transport_contact` (
  `transport_id` varchar(50) DEFAULT NULL,
  `transport_contact` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transport_contact: ~0 rows (approximately)
DELETE FROM `transport_contact`;

-- Dumping structure for table jindaltrading.transport_contacts
CREATE TABLE IF NOT EXISTS `transport_contacts` (
  `transportId` int NOT NULL AUTO_INCREMENT,
  `transportName` varchar(255) DEFAULT NULL,
  `contactName` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `mobileNumber` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`transportId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transport_contacts: ~5 rows (approximately)
DELETE FROM `transport_contacts`;
INSERT INTO `transport_contacts` (`transportId`, `transportName`, `contactName`, `designation`, `mobileNumber`, `email`, `createdAt`, `updatedAt`) VALUES
	(8, '15', NULL, 'Manager', 8533859704, 'ujjwalraturi248001@gmail.com', '2023-07-13 11:24:38', '2023-07-13 11:24:38'),
	(9, '16', NULL, 'a', 1234567890, 'a@n', '2023-07-13 11:26:19', '2023-07-13 11:26:19'),
	(10, '17', NULL, 'CEO', 8533859704, 'ujjwalraturi248001@gmail.com', '2023-07-13 11:27:13', '2023-07-13 11:27:13'),
	(11, '18', NULL, 'aa', 8533859704, 'ujjwalraturi248001@gmail.com', '2023-07-15 06:20:06', '2023-07-15 06:20:06'),
	(12, '18', NULL, 'bb', 1234567890, 'ujjwalraturi248001@gmail.com', '2023-07-15 06:20:06', '2023-07-15 06:20:06');

-- Dumping structure for table jindaltrading.transport_details
CREATE TABLE IF NOT EXISTS `transport_details` (
  `transportId` int NOT NULL AUTO_INCREMENT,
  `transportName` varchar(255) DEFAULT NULL,
  `transportArea` varchar(255) DEFAULT NULL,
  `transportStation` varchar(255) DEFAULT NULL,
  `transportOwner` varchar(255) DEFAULT NULL,
  `bankName` varchar(255) NOT NULL,
  `bankAccountNumber` bigint NOT NULL DEFAULT '0',
  `ifscCode` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`transportId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transport_details: ~4 rows (approximately)
DELETE FROM `transport_details`;
INSERT INTO `transport_details` (`transportId`, `transportName`, `transportArea`, `transportStation`, `transportOwner`, `bankName`, `bankAccountNumber`, `ifscCode`, `createdAt`, `updatedAt`) VALUES
	(15, 'Verma Transport', '1', 'ISBT', 'anil verma', 'sbi', 1, 'sac', '2023-07-13 11:24:38', '2023-07-13 11:24:38'),
	(16, 'sharma transport', '2', 'ss', 'ss', 's', 1, 's', '2023-07-13 11:26:19', '2023-07-13 11:26:19'),
	(17, 'abc', '12', 's', 's', 's', 1, 's', '2023-07-13 11:27:13', '2023-07-13 11:27:13'),
	(18, 'Ujjwal', '19', 'qq', 'aaa', 'sbi', 1, 'a', '2023-07-15 06:20:06', '2023-07-15 06:20:06');

-- Dumping structure for table jindaltrading.transport_station
CREATE TABLE IF NOT EXISTS `transport_station` (
  `transport_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `station _From` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `station_to` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transport_station: ~0 rows (approximately)
DELETE FROM `transport_station`;

-- Dumping structure for table jindaltrading.transport_truck
CREATE TABLE IF NOT EXISTS `transport_truck` (
  `transport_id` int DEFAULT NULL,
  `transport_truck` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transport_truck: ~0 rows (approximately)
DELETE FROM `transport_truck`;

-- Dumping structure for table jindaltrading.transport_trucks
CREATE TABLE IF NOT EXISTS `transport_trucks` (
  `transportId` int NOT NULL AUTO_INCREMENT,
  `transportName` varchar(255) DEFAULT NULL,
  `transportTruck` varchar(255) DEFAULT NULL,
  `ownerName` varchar(255) DEFAULT NULL,
  `ownerMobileNumber` bigint DEFAULT NULL,
  `driverName` varchar(255) DEFAULT NULL,
  `driverMobileNumber` bigint DEFAULT NULL,
  `bodyType` enum('FULL','HALF') DEFAULT NULL,
  `capacity` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`transportId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transport_trucks: ~6 rows (approximately)
DELETE FROM `transport_trucks`;
INSERT INTO `transport_trucks` (`transportId`, `transportName`, `transportTruck`, `ownerName`, `ownerMobileNumber`, `driverName`, `driverMobileNumber`, `bodyType`, `capacity`, `createdAt`, `updatedAt`) VALUES
	(8, '16', 'UK07 0001', 'o', 8533859704, 'd', 8533859701, NULL, NULL, '2023-07-13 11:26:19', '2023-07-13 11:26:19'),
	(9, '17', '123', 'o', 8533859704, 'd', 8533859702, NULL, NULL, '2023-07-13 11:27:13', '2023-07-13 11:27:13'),
	(10, '18', 'axax', 'o', 8533859704, 'd', 8533859703, 'FULL', '3', '2023-07-15 06:20:06', '2023-07-15 06:20:06'),
	(11, '18', 'afga', 'o', 8533859704, 'd', 8533859704, 'HALF', '2', '2023-07-15 06:20:06', '2023-07-15 06:20:06'),
	(16, '15', 'Bihar', 'o', 1231234444, 'd', 8533859705, 'HALF', '1000', '2023-07-15 06:41:44', '2023-07-15 06:41:44'),
	(17, '16', 'Bihar', 'o', 1231234444, 'd', 8533859706, 'HALF', '1000', '2023-07-15 06:41:44', '2023-07-15 06:41:44');

-- Dumping structure for table jindaltrading.truck number details
CREATE TABLE IF NOT EXISTS `truck number details` (
  `truck no.` int DEFAULT NULL,
  `owner name` int DEFAULT NULL,
  `pan no.` int DEFAULT NULL,
  `bank account no.` int DEFAULT NULL,
  `bank name` int DEFAULT NULL,
  `ifsc code` int DEFAULT NULL,
  `owmer no.` int DEFAULT NULL,
  `driver name` int DEFAULT NULL,
  `driver no.` int DEFAULT NULL,
  `truck capacity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.truck number details: ~0 rows (approximately)
DELETE FROM `truck number details`;

-- Dumping structure for table jindaltrading.truck_stations
CREATE TABLE IF NOT EXISTS `truck_stations` (
  `trasport_id` int DEFAULT NULL,
  `transport_stations from` varchar(50) DEFAULT NULL,
  `truck_no` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.truck_stations: ~0 rows (approximately)
DELETE FROM `truck_stations`;

-- Dumping structure for table jindaltrading.vendor_contacts
CREATE TABLE IF NOT EXISTS `vendor_contacts` (
  `vendorId` int NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `mobileNumber` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`vendorId`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.vendor_contacts: ~5 rows (approximately)
DELETE FROM `vendor_contacts`;
INSERT INTO `vendor_contacts` (`vendorId`, `vendorName`, `designation`, `mobileNumber`, `email`, `createdAt`, `updatedAt`) VALUES
	(27, '19', 'Manager', 8533859704, 'ujjwalraturi248001@gmail.com', '2023-07-06 03:25:52', '2023-07-06 03:25:52'),
	(28, '19', 'hr', 1234567890, 'ujjwalraturi248001@gmail.com', '2023-07-06 03:25:52', '2023-07-06 03:25:52'),
	(49, '19', 'man', 1234567890, 'ujjwalraturi248001@gmail.com', '2023-07-13 07:30:36', '2023-07-13 07:30:36'),
	(50, '20', 'CEO', 1112223333, 'a@b', '2023-07-13 07:39:23', '2023-07-13 07:39:23'),
	(51, '20', 'hr', 1234567890, 'l@j', '2023-07-13 07:39:23', '2023-07-13 07:39:23');

-- Dumping structure for table jindaltrading.vendor_firms
CREATE TABLE IF NOT EXISTS `vendor_firms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(255) NOT NULL,
  `firm` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.vendor_firms: ~3 rows (approximately)
DELETE FROM `vendor_firms`;
INSERT INTO `vendor_firms` (`id`, `vendorName`, `firm`, `createdAt`, `updatedAt`) VALUES
	(3, '19', '25', '2023-07-06 03:25:52', '2023-07-06 03:25:52'),
	(4, '19', '28', '2023-07-06 03:25:52', '2023-07-06 03:25:52'),
	(5, '20', '27', '2023-07-13 07:39:23', '2023-07-13 07:39:23');

-- Dumping structure for table jindaltrading.vendor_products
CREATE TABLE IF NOT EXISTS `vendor_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.vendor_products: ~3 rows (approximately)
DELETE FROM `vendor_products`;
INSERT INTO `vendor_products` (`id`, `vendorName`, `product`, `createdAt`, `updatedAt`) VALUES
	(4, '19', '17', '2023-07-06 03:25:52', '2023-07-06 03:25:52'),
	(5, '19', '18', '2023-07-06 03:25:52', '2023-07-06 03:25:52'),
	(6, '20', '17', '2023-07-13 07:39:23', '2023-07-13 07:39:23');

-- Dumping structure for table jindaltrading.ven_categories
CREATE TABLE IF NOT EXISTS `ven_categories` (
  `vendor_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.ven_categories: ~0 rows (approximately)
DELETE FROM `ven_categories`;

-- Dumping structure for table jindaltrading.ven_contacts
CREATE TABLE IF NOT EXISTS `ven_contacts` (
  `vendors_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MOBILE_NUMBER` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.ven_contacts: ~0 rows (approximately)
DELETE FROM `ven_contacts`;

-- Dumping structure for table jindaltrading.ven_firm_details
CREATE TABLE IF NOT EXISTS `ven_firm_details` (
  `FIRM_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `vendors_id` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.ven_firm_details: ~0 rows (approximately)
DELETE FROM `ven_firm_details`;

-- Dumping structure for table jindaltrading.ven_product
CREATE TABLE IF NOT EXISTS `ven_product` (
  `VENDOR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PRODUCTS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.ven_product: ~0 rows (approximately)
DELETE FROM `ven_product`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
