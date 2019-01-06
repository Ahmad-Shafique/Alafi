-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2019 at 11:37 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `1410inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(3) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile1` varchar(15) NOT NULL,
  `mobile2` varchar(15) NOT NULL,
  `password` char(60) NOT NULL,
  `role` char(6) NOT NULL,
  `created_on` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `last_seen` datetime NOT NULL,
  `last_edited` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `account_status` char(1) NOT NULL DEFAULT '1',
  `deleted` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `first_name`, `last_name`, `email`, `mobile1`, `mobile2`, `password`, `role`, `created_on`, `last_login`, `last_seen`, `last_edited`, `account_status`, `deleted`) VALUES
(1, 'Admin', 'Demo', 'demo@1410inc.xyz', '08021111111', '07032222222', '$2y$10$xv9I14OlR36kPCjlTv.wEOX/6Dl7VMuWCl4vCxAVWP1JwYIaw4J2C', 'Super', '2017-01-04 22:19:16', '2018-12-31 04:58:21', '2018-12-30 19:33:00', '2018-12-31 01:58:21', '1', '0'),
(2, 'name', 'lname', 'abc@123.com', '01928374657', '', 'xyz', 'retail', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2018-12-28 22:10:38', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(3) PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL ,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile1` varchar(15) NOT NULL,
  `mobile2` varchar(15) NOT NULL,
  `password` char(60) NOT NULL,
  `role` char(6) NOT NULL,
  `created_on` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `last_seen` datetime NOT NULL,
  `last_edited` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `account_status` char(1) NOT NULL DEFAULT '1',
  `deleted` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `email`, `mobile1`, `mobile2`, `password`, `role`, `created_on`, `last_login`, `last_seen`, `last_edited`, `account_status`, `deleted`) VALUES
(1, 'sf', 'sl', '', '', '', 'xyz', 'retail', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2018-12-20 10:25:45', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `TotalProfitInDinars` decimal(6,3) DEFAULT 0,
  `BranchManagerId` int(11) UNIQUE KEY  DEFAULT 0,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branchesaleitems`
--

CREATE TABLE `branchesaleitems` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `TransactionId` int(11) DEFAULT NULL,
  `ItemId` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(6,3) DEFAULT NULL,
  `ExpectedSaleMargin` decimal(6,3) DEFAULT NULL,
  `Profit` decimal(6,3) DEFAULT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branchesaletransactions`
--

CREATE TABLE `branchesaletransactions` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `BranchId` int(11) DEFAULT NULL,
  `CashSale` tinyint(1) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `Cash` float DEFAULT NULL,
  `Credit` float DEFAULT NULL,
  `TotalCost` decimal(6,3) DEFAULT NULL,
  `TotalProfit` decimal(6,3) DEFAULT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branchexpensetransactions`
--

CREATE TABLE `branchexpensetransactions` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `AmountInDinars` decimal(5,3) DEFAULT NULL,
  `Reason` varchar(200),
  `BranchId` int(11) DEFAULT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branchitems`
--

CREATE TABLE `branchitems` (
  `Id` int(11) NOT NULL,
  `BranchId` int(11) DEFAULT 0,
  `ItemId` int(11) DEFAULT 0,
  `AmountAvailable` decimal(6,3) DEFAULT 0,
  `UnitPrice` decimal(6,3) DEFAULT 0,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `MobileNumber` varchar(50) UNIQUE KEY DEFAULT NULL,
  `TotalPurchaseInDinars` decimal(6,3) DEFAULT 0,
  `CreditAmountInDinars` decimal(6,3) DEFAULT 0,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `Name` int(11) UNIQUE NOT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `itemsalescontrol`
--

CREATE TABLE `itemsalescontrol` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `ItemId` int(11) DEFAULT NULL,
  `RevaluationPrice` decimal(4,3) DEFAULT NULL,
  `TotalAvailable` decimal(5,3) DEFAULT NULL,
  `Profit` decimal(5,3) DEFAULT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `itemsalesrecords`
--

CREATE TABLE `itemsalesrecords` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `ItemId` int(11) DEFAULT NULL,
  `ShipmentNumber` varchar(50) DEFAULT NULL,
  `WholeSaleTotalQuantity` decimal(5,3) DEFAULT NULL,
  `WholeSaleTotalPrice` decimal(5,3) DEFAULT NULL,
  `RetailSaleTotalQuantity` decimal(5,3) DEFAULT NULL,
  `RetailSaleTotalPrice` decimal(5,3) DEFAULT NULL,
  `RevaluationProfit` decimal(5,3) DEFAULT NULL,
  `RevaluationLoss` decimal(5,3) DEFAULT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lk_sess`
--

CREATE TABLE `lk_sess` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receivedstorageitems`
--

CREATE TABLE `receivedstorageitems` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `ItemId` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `revaluationhistories`
--

CREATE TABLE `revaluationhistories` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `ItemId` int(11) DEFAULT NULL,
  `OriginalUnitPrice` decimal(4,3) DEFAULT NULL,
  `RevaluatedPrice` decimal(4,3) NOT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `revaluationprofits`
--

CREATE TABLE `revaluationprofits` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `ItemId` int(11) DEFAULT NULL,
  `OriginalUnitPrice` decimal(4,3) DEFAULT 0,
  `NewUnitPrice` decimal(4,3) DEFAULT 0,
  `TotalAmount` decimal(5,3) DEFAULT 0,
  `Profit` decimal(5,3) DEFAULT 0,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipmentorderitems`
--

CREATE TABLE `shipmentorderitems` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `ShipmentOrderId` int(11) NOT NULL,
  `ItemId` int(11) DEFAULT 0,
  `Quantity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipmentorders`
--

CREATE TABLE `shipmentorders` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `DateOrdered` datetime DEFAULT CURRENT_TIMESTAMP,
  `SupplierId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipmentreceiveditems`
--

CREATE TABLE `shipmentreceiveditems` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `ShipmentNumber` varchar(100) NOT NULL,
  `ItemId` int(11) DEFAULT 0,
  `Quantity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipmentsreceived`
--

CREATE TABLE `shipmentsreceived` (
  `Id` int(11) NOT NULL,
  `ShipmentNumber` varchar(100) UNIQUE KEY NOT NULL,
  `SupplierId` int(11) DEFAULT NULL,
  `ReceiverName` varchar(100) DEFAULT NULL,
  `DateReceived` datetime DEFAULT CURRENT_TIMESTAMP,
  `TransportationCost` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `CivilIdNumber` int(11)UNIQUE KEY DEFAULT NULL,
  `CivilIdExpiry` date DEFAULT NULL,
  `Photo` varchar(50) DEFAULT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0,
  `Designation` varchar(50) DEFAULT NULL,
  `BranchId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stockinventories`
--

CREATE TABLE `stockinventories` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `StockLocationId` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `ItemQuantity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stocklocations`
--

CREATE TABLE `stocklocations` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `LocationName` varchar(100) DEFAULT NULL,
  `StockKeeperName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(50) UNIQUE KEY DEFAULT  NULL,
  `Email` varchar(50) UNIQUE KEY DEFAULT  NULL,
  `CreditInRupees` decimal(6,3) DEFAULT 0,
  `CreditInDinars` decimal(6,3) DEFAULT 0,
  `DebitInRupees` decimal(6,3) DEFAULT 0,
  `DebitInDinars` decimal(6,3) DEFAULT 0,
  `ProfitsInRupees` decimal(6,3) DEFAULT 0,
  `ProfitsInDinar` decimal(6,3) DEFAULT 0,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temporarystorages`
--

CREATE TABLE `temporarystorages` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `ItemId` int(11) DEFAULT NULL,
  `TotalAvailable` decimal(5,3) DEFAULT 0,
  `UnitPrice` decimal(5,3) DEFAULT 0,
  `ShipmentNumber` varchar(50) DEFAULT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--


CREATE TABLE `wholesaletransactions` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `TransactionDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CustomerId` int(11) NOT NULL,
  `KwdAmount` decimal(5,3) DEFAULT 0,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `wholesaletransactionitems` (
  `Id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `WholeSaleTransactionId` int(11) NOT NULL,
  `ItemId` int(11) DEFAULT 0,
  `ItemAmount` int(11) DEFAULT 0,
  `UnitPrice` decimal(5,3) DEFAULT 0,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  `AddedById` int(11) DEFAULT 0,
  `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifiedID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile1` (`mobile1`);

ALTER TABLE `admin`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;



-- PRIMARY KEY AUTO_INCREMENT
-- UNIQUE KEY
--   `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
--   `AddedById` int(11) DEFAULT 0,
--   `LastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `LastModifiedID` int(11) DEFAULT 0








COMMIT;