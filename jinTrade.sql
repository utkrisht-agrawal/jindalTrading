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

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.contact_details
CREATE TABLE IF NOT EXISTS `contact_details` (
  `FIRST_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LAST_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `E_MAIL_ADDRESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DESINATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MOBILE_NUMBER` bigint NOT NULL DEFAULT '0',
  UNIQUE KEY `MOBILE_NUMBER` (`MOBILE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.customer_firms
CREATE TABLE IF NOT EXISTS `customer_firms` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `firm` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.cust_categories
CREATE TABLE IF NOT EXISTS `cust_categories` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.cust_firms
CREATE TABLE IF NOT EXISTS `cust_firms` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `firm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.cust_product
CREATE TABLE IF NOT EXISTS `cust_product` (
  `CUSTOMER_ID` varchar(50) DEFAULT NULL,
  `PRODUCTS` varchar(50) DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `PRODUCT_GROUP` varchar(50) DEFAULT NULL,
  `TOTAL_QUTY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.cust_products
CREATE TABLE IF NOT EXISTS `cust_products` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.masterteam
CREATE TABLE IF NOT EXISTS `masterteam` (
  `member` varchar(50) DEFAULT NULL,
  `leader` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.master_categories
CREATE TABLE IF NOT EXISTS `master_categories` (
  `categoriesId` int NOT NULL AUTO_INCREMENT,
  `categoriesType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoriesId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.master_grades
CREATE TABLE IF NOT EXISTS `master_grades` (
  `gradeId` int NOT NULL AUTO_INCREMENT,
  `gradeType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.master_products
CREATE TABLE IF NOT EXISTS `master_products` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) DEFAULT NULL,
  `productGroup` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.master_product_groups
CREATE TABLE IF NOT EXISTS `master_product_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productGroup` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.master_vendors
CREATE TABLE IF NOT EXISTS `master_vendors` (
  `vendorId` int NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(50) NOT NULL,
  `vendorAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`vendorId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.transport_contact
CREATE TABLE IF NOT EXISTS `transport_contact` (
  `transport_id` varchar(50) DEFAULT NULL,
  `transport_contact` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.transport_station
CREATE TABLE IF NOT EXISTS `transport_station` (
  `transport_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `station _From` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `station_to` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.transport_truck
CREATE TABLE IF NOT EXISTS `transport_truck` (
  `transport_id` int DEFAULT NULL,
  `transport_truck` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.truck_stations
CREATE TABLE IF NOT EXISTS `truck_stations` (
  `trasport_id` int DEFAULT NULL,
  `transport_stations from` varchar(50) DEFAULT NULL,
  `truck_no` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.vendor_firms
CREATE TABLE IF NOT EXISTS `vendor_firms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(255) NOT NULL,
  `firm` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.vendor_products
CREATE TABLE IF NOT EXISTS `vendor_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.ven_categories
CREATE TABLE IF NOT EXISTS `ven_categories` (
  `vendor_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.ven_contacts
CREATE TABLE IF NOT EXISTS `ven_contacts` (
  `vendors_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MOBILE_NUMBER` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.ven_firm_details
CREATE TABLE IF NOT EXISTS `ven_firm_details` (
  `FIRM_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `vendors_id` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table jindaltrading.ven_product
CREATE TABLE IF NOT EXISTS `ven_product` (
  `VENDOR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PRODUCTS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
