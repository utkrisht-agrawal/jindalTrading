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

-- Dumping structure for table jindaltrading.cust_categories
CREATE TABLE IF NOT EXISTS `cust_categories` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_categories: ~3 rows (approximately)
DELETE FROM `cust_categories`;
INSERT INTO `cust_categories` (`customerId`, `customerName`, `category`, `createdAt`, `updatedAt`) VALUES
	(29, 'ABC', '	RETAIL', '2023-02-08 02:54:04', '2023-02-08 02:54:51'),
	(30, 'PAL AGRO', '	EMPLOYEES', '2023-02-11 01:20:26', '2023-02-11 01:20:26'),
	(32, 'q', '	PIGIRON', '2023-02-14 04:17:46', '2023-02-14 04:17:46');

-- Dumping structure for table jindaltrading.cust_caterories
CREATE TABLE IF NOT EXISTS `cust_caterories` (
  `CUSTOMER_ID` varchar(50) DEFAULT NULL,
  `CATEGORIES` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_caterories: ~3 rows (approximately)
DELETE FROM `cust_caterories`;
INSERT INTO `cust_caterories` (`CUSTOMER_ID`, `CATEGORIES`) VALUES
	('PAL AGRO', 'RETAIL'),
	('PAL AGRO', 'WHOLE SALE'),
	('PAL AGRO', 'PIG IRON');

-- Dumping structure for table jindaltrading.cust_contact
CREATE TABLE IF NOT EXISTS `cust_contact` (
  `customer_id` varchar(50) DEFAULT NULL,
  `mob._no.` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_contact: ~0 rows (approximately)
DELETE FROM `cust_contact`;

-- Dumping structure for table jindaltrading.cust_contacts
CREATE TABLE IF NOT EXISTS `cust_contacts` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `mobileNumber` int NOT NULL,
  `customerName` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_contacts: ~3 rows (approximately)
DELETE FROM `cust_contacts`;
INSERT INTO `cust_contacts` (`customerId`, `mobileNumber`, `customerName`, `createdAt`, `updatedAt`) VALUES
	(59, 1112223333, 'ABC', '2023-02-08 02:54:04', '2023-02-08 02:54:04'),
	(60, 1112223333, 'PAL AGRO', '2023-02-11 01:20:26', '2023-02-11 01:20:26'),
	(62, 1112223333, 'q', '2023-02-14 04:17:46', '2023-02-14 04:17:46');

-- Dumping structure for table jindaltrading.cust_firm
CREATE TABLE IF NOT EXISTS `cust_firm` (
  `CUSTOMER_ID` varchar(50) DEFAULT NULL,
  `FIRM_ID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_firm: ~0 rows (approximately)
DELETE FROM `cust_firm`;

-- Dumping structure for table jindaltrading.cust_firms
CREATE TABLE IF NOT EXISTS `cust_firms` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `firm` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_firms: ~3 rows (approximately)
DELETE FROM `cust_firms`;
INSERT INTO `cust_firms` (`customerId`, `customerName`, `firm`, `createdAt`, `updatedAt`) VALUES
	(14, 'ABC', 'abc solutions', '2023-02-08 02:54:04', '2023-02-08 02:54:04'),
	(16, 'PAL AGRO', 'PAL AGRO', '2023-02-11 01:27:45', '2023-02-11 01:27:45'),
	(17, 'q', 'q', '2023-02-14 04:17:46', '2023-02-14 04:17:46');

-- Dumping structure for table jindaltrading.cust_product
CREATE TABLE IF NOT EXISTS `cust_product` (
  `CUSTOMER_ID` varchar(50) DEFAULT NULL,
  `PRODUCTS` varchar(50) DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `PRODUCT_GROUP` varchar(50) DEFAULT NULL,
  `TOTAL_QUTY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_product: ~3 rows (approximately)
DELETE FROM `cust_product`;
INSERT INTO `cust_product` (`CUSTOMER_ID`, `PRODUCTS`, `QUANTITY`, `PRODUCT_GROUP`, `TOTAL_QUTY`) VALUES
	('PAL AGRO', 'PIG IRON', 50, 'IRON', 50),
	('PAL AGRO', 'MET COKE 65-80', 20, 'COKE', 30),
	('PAL AGRO', 'HARD COKE', 10, 'COKE', 30);

-- Dumping structure for table jindaltrading.cust_products
CREATE TABLE IF NOT EXISTS `cust_products` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.cust_products: ~7 rows (approximately)
DELETE FROM `cust_products`;
INSERT INTO `cust_products` (`customerId`, `customerName`, `product`, `createdAt`, `updatedAt`) VALUES
	(16, 'ABC', 'HARD COKE', '2023-02-08 02:54:04', '2023-02-08 02:54:04'),
	(17, 'ABC', '24% LOW ASH', '2023-02-08 02:54:04', '2023-02-08 02:54:04'),
	(18, 'ABC', 'PIG IRON', '2023-02-08 02:54:04', '2023-02-08 02:54:04'),
	(19, 'ABC', 'CAST IRON', '2023-02-08 02:54:04', '2023-02-08 02:54:04'),
	(20, 'PAL AGRO', 'MET COKE 80-150', '2023-02-11 01:20:26', '2023-02-11 01:20:26'),
	(21, 'PAL AGRO', '24% LOW ASH', '2023-02-11 01:20:26', '2023-02-11 01:20:26'),
	(38, 'q', 'pigIron', '2023-02-15 04:42:00', '2023-02-15 04:42:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.logintables: ~3 rows (approximately)
DELETE FROM `logintables`;
INSERT INTO `logintables` (`id`, `username`, `password`, `role`, `createdAt`, `updatedAt`, `level`) VALUES
	(1, 'Rohit', 'passr', 'User', '2022-11-17 18:04:54', '2022-11-17 18:04:54', 1),
	(2, 'Kios', 'passk', 'Moderator', '2022-11-24 17:01:32', '2022-11-24 17:01:32', 2),
	(3, 'Harsh', 'passh', 'Admin', '2022-11-24 17:02:23', '2022-11-24 17:02:23', 3);

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
	(1, '11', '1122334455', '	delhi', '	MET COKE 65-80', 'Rohit', '1', 'sales', '2023-01-27 14:39:57', '2023-01-27 09:20:23'),
	(2, '5', '5556663333', '	muzafarnagar', '	HARD COKE', 'Shekhar', '2', 'account', '2023-01-27 14:49:52', '2023-01-27 09:20:25'),
	(3, '12', '5533559704', 'muzafarnagar', '24% LOW ASH', 'Arun', '19', 'not known', '2023-01-27 09:37:42', '2023-01-27 09:37:42');

-- Dumping structure for table jindaltrading.market_plan_pig_irons
CREATE TABLE IF NOT EXISTS `market_plan_pig_irons` (
  `serialNumber` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `area` varchar(255) NOT NULL,
  `grade` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `lastDelivery` varchar(255) NOT NULL,
  `representative` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `meetingDates` varchar(255) NOT NULL,
  `currentRemark` varchar(255) NOT NULL,
  `remarkStatus` enum('VERIFIED','UNVERIFIED') NOT NULL DEFAULT 'UNVERIFIED',
  `nextDate` varchar(255) NOT NULL,
  `currentIssue` varchar(255) NOT NULL,
  `analysed` varchar(255) NOT NULL,
  `updateTimeStamp` varchar(255) NOT NULL,
  `totalIssue` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`serialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.market_plan_pig_irons: ~7 rows (approximately)
DELETE FROM `market_plan_pig_irons`;
INSERT INTO `market_plan_pig_irons` (`serialNumber`, `customerName`, `area`, `grade`, `category`, `product`, `lastDelivery`, `representative`, `phoneNumber`, `meetingDates`, `currentRemark`, `remarkStatus`, `nextDate`, `currentIssue`, `analysed`, `updateTimeStamp`, `totalIssue`, `createdAt`, `updatedAt`) VALUES
	(1, '1', 'delhi', 'A', 'TRADERS', 'PIG IRON', '1-1-23', 'Arun', '1234567891', '1', 'high price', 'UNVERIFIED', '1', 'A', 'a', '1', 'a', '2023-01-03 06:57:39', '2023-01-31 16:20:24'),
	(3, '11', 'meerut', 'A', 'WHOLESALE', 'PIG IRON', '1-1-23', 'Shekhar', '2233445566', '1', '', 'UNVERIFIED', '1', 'A', 'q', '1', 'q', '2023-01-07 16:32:14', '2023-01-30 02:04:40'),
	(7, '12', 'delhi', 'C', 'RETAIL', 'PIG IRON', '1-1-23', 'Arun', '9876543210', '1', 'q', 'VERIFIED', '', 'B', '', '', '', '2023-01-13 06:50:02', '2023-01-30 02:04:39'),
	(8, '15', 'muzafarnagar', 'B', 'RETAIL', 'PIG IRON', '1-1-23', 'Rohit', '0003336663', '', '', 'UNVERIFIED', '', 'C', '', '', '', '2023-01-14 03:34:46', '2023-01-30 02:04:38'),
	(9, '1', 'delhi', 'A', '	TRADERS', '	HARD COKE', '1-1-23', 'Rohit', '1234567891', '15', 'not known', 'UNVERIFIED', '20', 'B', '', '', '', '2023-01-30 01:56:14', '2023-01-30 02:04:41'),
	(11, 'q', 'agra', 'B', 'PIGIRON', 'MET COKE 80-150', '1-1-23', 'Rohit', '11', '1', 'q', 'VERIFIED', '1', 'q', 'q', '1', 'q', '2023-02-14 04:18:28', '2023-02-14 04:18:28'),
	(12, 'PAL AGRO', 'delhi', 'A', 'PIGIRON', 'HARD COKE', '1-1-23', 'Rohit', '5533559704', '1', 'q', 'VERIFIED', '1', 'q', 'q', '1', 'q', '2023-02-14 05:00:46', '2023-02-14 05:00:46');

-- Dumping structure for table jindaltrading.market_plan_quantity_ledgers
CREATE TABLE IF NOT EXISTS `market_plan_quantity_ledgers` (
  `serialNumber` int NOT NULL AUTO_INCREMENT,
  `customerId` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`serialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.market_plan_quantity_ledgers: ~3 rows (approximately)
DELETE FROM `market_plan_quantity_ledgers`;
INSERT INTO `market_plan_quantity_ledgers` (`serialNumber`, `customerId`, `category`, `product`, `quantity`, `createdAt`, `updatedAt`) VALUES
	(1, '1', '	WHOLESALE', '	24% LOW ASH', 1, '2023-01-21 19:54:42', '2023-01-23 02:22:43'),
	(2, '11', '	RETAIL', '	CAST IRON', 5, '2023-01-21 19:55:11', '2023-01-23 02:22:06'),
	(4, '12', 'FERRO ALLOYS', 'MET COKE 65-80', 15, '2023-01-23 02:00:00', '2023-01-23 02:00:00');

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

-- Dumping structure for table jindaltrading.master_areas
CREATE TABLE IF NOT EXISTS `master_areas` (
  `areaId` int NOT NULL AUTO_INCREMENT,
  `area` varchar(50) NOT NULL,
  PRIMARY KEY (`areaId`) USING BTREE,
  UNIQUE KEY `area` (`area`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_areas: ~6 rows (approximately)
DELETE FROM `master_areas`;
INSERT INTO `master_areas` (`areaId`, `area`) VALUES
	(12, 'agra'),
	(6, 'chittor'),
	(1, 'delhi'),
	(2, 'meerut'),
	(3, 'muzafarnagar'),
	(19, 'quetta');

-- Dumping structure for table jindaltrading.master_categories
CREATE TABLE IF NOT EXISTS `master_categories` (
  `categoriesId` int NOT NULL AUTO_INCREMENT,
  `categoriesType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoriesId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_categories: ~8 rows (approximately)
DELETE FROM `master_categories`;
INSERT INTO `master_categories` (`categoriesId`, `categoriesType`) VALUES
	(1, 'EMPLOYEES'),
	(2, 'FERRO ALLOYS'),
	(3, 'PIGIRON'),
	(4, 'RETAIL'),
	(5, 'TRADERS'),
	(6, 'TRANSPORTER'),
	(7, 'VENDORS'),
	(8, 'WHOLESALE');

-- Dumping structure for table jindaltrading.master_customers
CREATE TABLE IF NOT EXISTS `master_customers` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(50) NOT NULL DEFAULT '0',
  `area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` enum('VERIFIED','UNVERIFIED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'UNVERIFIED',
  `grade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pincode` int NOT NULL,
  `address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `referenceNumber1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `referenceNumber2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `creditLimit` varchar(50) NOT NULL DEFAULT '',
  `creditDays` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`customerId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_customers: ~5 rows (approximately)
DELETE FROM `master_customers`;
INSERT INTO `master_customers` (`customerId`, `customerName`, `area`, `status`, `grade`, `pincode`, `address`, `referenceNumber1`, `referenceNumber2`, `creditLimit`, `creditDays`) VALUES
	(12, 'check user', 'chittor', 'UNVERIFIED', 'C', 248005, 'Haridwar Road', 'a', 'a', '1', '1'),
	(24, 'Ujjwal Raturi', 'agra', 'UNVERIFIED', 'A', 248005, 'Lane-1', '', '', '', ''),
	(45, 'ABC', 'delhi', 'VERIFIED', 'A', 110001, 'Meerut Road', '', '', '', ''),
	(47, 'PAL AGRO', 'meerut', 'VERIFIED', 'A', 250003, 'PAL AGRO INDUSTRIES GULATHA ROAD NEAR SAMSHAN GHAT', 'SACHIN', 'SANDEEP', '2500000', '8'),
	(48, 'q', 'chittor', 'VERIFIED', 'B', 248005, 'Road', '', '', '', '');

-- Dumping structure for table jindaltrading.master_employees
CREATE TABLE IF NOT EXISTS `master_employees` (
  `employeeNumber` int NOT NULL AUTO_INCREMENT,
  `employeeName` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `employeeCategories` varchar(255) DEFAULT NULL,
  `dateOfBirth` varchar(50) DEFAULT NULL,
  `fatherName` varchar(255) DEFAULT NULL,
  `motherName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `primaryMobileNumber` bigint DEFAULT NULL,
  `officeMobileNumber` int DEFAULT NULL,
  `fatherMobileNumber` int DEFAULT NULL,
  `motherMobileNumber` int DEFAULT NULL,
  `spouseName` varchar(255) DEFAULT NULL,
  `spouseMobileNumber` int DEFAULT NULL,
  `emailId` varchar(255) DEFAULT NULL,
  `officeEmailId` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `bankName` varchar(255) DEFAULT NULL,
  `bankAccountNumber` int DEFAULT NULL,
  `ifscCode` int DEFAULT NULL,
  `dateOfJoining` int DEFAULT NULL,
  `aadharNumber` int DEFAULT NULL,
  `panNumber` int DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employeeNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_employees: ~2 rows (approximately)
DELETE FROM `master_employees`;
INSERT INTO `master_employees` (`employeeNumber`, `employeeName`, `designation`, `employeeCategories`, `dateOfBirth`, `fatherName`, `motherName`, `address`, `primaryMobileNumber`, `officeMobileNumber`, `fatherMobileNumber`, `motherMobileNumber`, `spouseName`, `spouseMobileNumber`, `emailId`, `officeEmailId`, `area`, `bankName`, `bankAccountNumber`, `ifscCode`, `dateOfJoining`, `aadharNumber`, `panNumber`, `reference`, `gender`, `photo`) VALUES
	(1, 'despo', '2', '0', '0', '0', '0', '0', 0, 0, 0, 0, '0', 0, '1', '0', '1', '0', 0, 0, 0, 0, 0, '0', '0', '0'),
	(2, 'a1', 'a', 'a', '1', 'a', 'a', 'a', 1, 1, 1, 1, 'aa', 1, 'a', 'a', 'a', 'a', 1, 1, 11, 1, 1, 'a', 'aa', 'a');

-- Dumping structure for table jindaltrading.master_grades
CREATE TABLE IF NOT EXISTS `master_grades` (
  `gradeId` int NOT NULL AUTO_INCREMENT,
  `gradeType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_grades: ~4 rows (approximately)
DELETE FROM `master_grades`;
INSERT INTO `master_grades` (`gradeId`, `gradeType`) VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C'),
	(4, 'D');

-- Dumping structure for table jindaltrading.master_products
CREATE TABLE IF NOT EXISTS `master_products` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) DEFAULT NULL,
  `productGroup` int NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_products: ~8 rows (approximately)
DELETE FROM `master_products`;
INSERT INTO `master_products` (`productId`, `productName`, `productGroup`) VALUES
	(1, 'HARD COKE', 0),
	(2, 'SOFT COKE', 0),
	(3, 'MET COKE 65-80', 0),
	(4, 'MET COKE 80-150', 0),
	(5, '24% LOW ASH', 0),
	(6, 'PIG IRON', 0),
	(7, 'CAST IRON', 0),
	(10, 'COAL DUST', 0);

-- Dumping structure for table jindaltrading.master_teams
CREATE TABLE IF NOT EXISTS `master_teams` (
  `teamId` int NOT NULL AUTO_INCREMENT,
  `teamMember` varchar(255) DEFAULT NULL,
  `teamLeader` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`teamId`),
  UNIQUE KEY `teamMember` (`teamMember`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_teams: ~3 rows (approximately)
DELETE FROM `master_teams`;
INSERT INTO `master_teams` (`teamId`, `teamMember`, `teamLeader`, `createdAt`, `updatedAt`) VALUES
	(1, 'Shekhar', 'Sachin', '2023-01-14 08:43:41', '2023-01-14 08:43:42'),
	(2, 'Rohit', 'Sachin', '2023-01-14 08:44:05', '2023-01-14 03:23:21'),
	(3, 'Arun', 'Ashok', '2023-01-14 08:44:23', '2023-01-14 08:44:25');

-- Dumping structure for table jindaltrading.master_vendors
CREATE TABLE IF NOT EXISTS `master_vendors` (
  `vendorId` int NOT NULL AUTO_INCREMENT,
  `vendorAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`vendorId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.master_vendors: ~3 rows (approximately)
DELETE FROM `master_vendors`;
INSERT INTO `master_vendors` (`vendorId`, `vendorAddress`, `area`) VALUES
	(1, 'op', 'check'),
	(2, 'q', 'a'),
	(5, 'taj mahal', 'agra');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transportstations: ~2 rows (approximately)
DELETE FROM `transportstations`;
INSERT INTO `transportstations` (`transportId`, `transportName`, `transportSource`, `transportDestination`, `createdAt`, `updatedAt`) VALUES
	(1, 'Ujjwal', 'agra', 'delhi', '2023-02-10 05:32:47', '2023-02-10 05:35:58'),
	(3, 'All india', '11', '11', '2023-02-11 01:15:36', '2023-02-11 01:15:36');

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
  `transportContact` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`transportId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transport_contacts: ~2 rows (approximately)
DELETE FROM `transport_contacts`;
INSERT INTO `transport_contacts` (`transportId`, `transportName`, `transportContact`, `createdAt`, `updatedAt`) VALUES
	(1, 'Ujjwal', '1234', '2023-02-10 05:05:35', '2023-02-10 05:08:10'),
	(4, 'All india', '753', '2023-02-11 01:15:36', '2023-02-11 01:15:36');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transport_details: ~2 rows (approximately)
DELETE FROM `transport_details`;
INSERT INTO `transport_details` (`transportId`, `transportName`, `transportArea`, `transportStation`, `transportOwner`, `bankName`, `bankAccountNumber`, `ifscCode`, `createdAt`, `updatedAt`) VALUES
	(1, 'ABCD', 'agra', 'agra', 'xyz', 'SBI', 123, '456', '2023-02-10 07:55:55', '2023-02-10 04:27:31'),
	(9, 'All india', NULL, 'aaaaa', 'aaa', 'aa', 159, 'aa', '2023-02-11 01:15:36', '2023-02-11 01:15:36');

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
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`transportId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table jindaltrading.transport_trucks: ~2 rows (approximately)
DELETE FROM `transport_trucks`;
INSERT INTO `transport_trucks` (`transportId`, `transportName`, `transportTruck`, `createdAt`, `updatedAt`) VALUES
	(1, 'Ujjwal', 'UK07 0005', '2023-02-10 13:36:29', '2023-02-10 13:36:35'),
	(4, 'All india', 'sc', '2023-02-11 01:15:36', '2023-02-11 01:15:36');

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
