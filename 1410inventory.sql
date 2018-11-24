-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2017 at 12:13 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `admins` (
  `id` int(3) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile1` varchar(15) NOT NULL,
  `mobile2` varchar(15) NOT NULL,
  `password` char(60) NOT NULL,
  `role` char(5) NOT NULL,
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

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `email`, `mobile1`, `mobile2`, `password`, `role`, `created_on`, `last_login`, `last_seen`, `last_edited`, `account_status`, `deleted`) VALUES
(1, 'Admin', 'Demo', 'demo@1410inc.xyz', '08021111111', '07032222222', '$2y$10$xv9I14OlR36kPCjlTv.wEOX/6Dl7VMuWCl4vCxAVWP1JwYIaw4J2C', 'Super', '2017-01-04 22:19:16', '2017-04-07 17:28:08', '2017-04-07 18:34:45', '2017-04-07 17:34:45', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `eventlog`
--

CREATE TABLE `eventlog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event` varchar(200) NOT NULL,
  `eventRowIdOrRef` varchar(20) DEFAULT NULL,
  `eventDesc` text,
  `eventTable` varchar(20) DEFAULT NULL,
  `staffInCharge` bigint(20) UNSIGNED NOT NULL,
  `eventTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

-- CREATE TABLE `items` (
--   `id` bigint(20) UNSIGNED NOT NULL,
--   `name` varchar(50) NOT NULL,
--   `code` varchar(10) NOT NULL,
--   `description` text,
--   `unitPrice` decimal(10,2) NOT NULL,
--   `quantity` int(6) NOT NULL,
--   `dateAdded` datetime NOT NULL,
--   `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lk_sess`
--

-- CREATE TABLE `lk_sess` (
--   `id` varchar(40) NOT NULL,
--   `ip_address` varchar(45) NOT NULL,
--   `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
--   `data` blob NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

-- CREATE TABLE `transactions` (
--   `transId` bigint(20) UNSIGNED NOT NULL,
--   `ref` varchar(10) NOT NULL,
--   `itemName` varchar(50) NOT NULL,
--   `itemCode` varchar(50) NOT NULL,
--   `description` text,
--   `quantity` int(6) NOT NULL,
--   `unitPrice` decimal(10,2) NOT NULL,
--   `totalPrice` decimal(10,2) NOT NULL,
--   `totalMoneySpent` decimal(10,2) NOT NULL,
--   `amountTendered` decimal(10,2) NOT NULL,
--   `discount_amount` decimal(10,2) NOT NULL,
--   `discount_percentage` decimal(10,2) NOT NULL,
--   `vatPercentage` decimal(10,2) NOT NULL,
--   `vatAmount` decimal(10,2) NOT NULL,
--   `changeDue` decimal(10,2) NOT NULL,
--   `modeOfPayment` varchar(20) NOT NULL,
--   `cust_name` varchar(20) DEFAULT NULL,
--   `cust_phone` varchar(15) DEFAULT NULL,
--   `cust_email` varchar(50) DEFAULT NULL,
--   `transType` char(1) NOT NULL,
--   `staffId` bigint(20) UNSIGNED NOT NULL,
--   `transDate` datetime NOT NULL,
--   `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `cancelled` char(1) NOT NULL DEFAULT '0'
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile1` (`mobile1`);

--
-- Indexes for table `eventlog`
--
ALTER TABLE `eventlog`
  ADD PRIMARY KEY (`id`);

-- --
-- -- Indexes for table `items`
-- --
-- ALTER TABLE `items`
--   ADD PRIMARY KEY (`id`),
--   ADD UNIQUE KEY `name` (`name`),
--   ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `transactions`
--
-- ALTER TABLE `transactions`
--   ADD PRIMARY KEY (`transId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admins`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eventlog`
--
ALTER TABLE `eventlog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- -- AUTO_INCREMENT for table `items`
-- --
-- ALTER TABLE `items`
--   MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transactions`
--
-- ALTER TABLE `transactions`
--   MODIFY `transId` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


create table Suppliers (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(50),
	Email VARCHAR(50),
	CreditInRupees DECIMAL(6,3),
	CreditInDinars DECIMAL(6,3),
	DebitInRupees DECIMAL(6,3),
	DebitInDinars DECIMAL(6,3),
	ProfitsInRupees DECIMAL(6,3),
	ProfitsInDinar DECIMAL(6,3),
	DateAdded DATE
);
insert into Suppliers (Name, Email, CreditInRupees, CreditInDinars, DebitInRupees, DebitInDinars, ProfitsInRupees, ProfitsInDinar, DateAdded) values ('Ransom Feyer', 'rfeyer0@diigo.com', 20.008, 39.685, 35.249, 92.609, 38.267, 64.277, '7/25/2018');
insert into Suppliers (Name, Email, CreditInRupees, CreditInDinars, DebitInRupees, DebitInDinars, ProfitsInRupees, ProfitsInDinar, DateAdded) values ('Demetrius Amar', 'damar1@free.fr', 35.17, 32.779, 67.376, 78.121, 24.46, 90.37, '2/12/2018');


create table Customers (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(50),
	MobileNumber VARCHAR(50),
	TotalPurchaseInDinars DECIMAL(6,3),
	CreditAmountInDinars DECIMAL(6,3),
	DateAdded DATE,
	LastModifiedDate DATE,
	LastModifiedID INT,
	AddedById INT
);
insert into Customers (Name, MobileNumber, TotalPurchaseInDinars, CreditAmountInDinars, DateAdded, LastModifiedDate, LastModifiedID, AddedById) values ('Hildegarde Klagges', '3932417135', 89.53, 66.933, '10/23/2018', '7/23/2018', 1, 1);
insert into Customers (Name, MobileNumber, TotalPurchaseInDinars, CreditAmountInDinars, DateAdded, LastModifiedDate, LastModifiedID, AddedById) values ('Nat Dundon', '8058018171', 40.798, 71.421, '8/5/2018', '8/26/2018', 2, 2);

create table Staffs (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(50),
	CivilIdNumber INT,
	CivilIdExpiry DATE,
	Photo VARCHAR(50),
	DateAdded DATE,
	LastModifiedDate DATE,
	LastModifiedID INT,
	AddedById INT,
	Designation VARCHAR(50),
	BranchId INT
);
insert into Staffs (Name, CivilIdNumber, CivilIdExpiry, Photo, DateAdded, LastModifiedDate, LastModifiedID, AddedById, Designation, BranchId) values ('Vivien Janowski', 12, '9/28/2018', 'http://dummyimage.com/215x140.bmp/cc0000/ffffff', '2/21/2018', '1/13/2018', 1, 1, 'Support', 1);
insert into Staffs (Name, CivilIdNumber, CivilIdExpiry, Photo, DateAdded, LastModifiedDate, LastModifiedID, AddedById, Designation, BranchId) values ('Klarika Swindin', 12, '2/5/2018', 'http://dummyimage.com/134x182.png/ff4444/ffffff', '12/19/2017', '11/23/2017', 2, 2, 'Sales', 2);

-- ALTER TABLE `staffs` ADD `Role` VARCHAR(50) NOT NULL AFTER `Name`;


create table Branches (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(50),
	Address VARCHAR(50),
	TotalProfitInDinars DECIMAL(6,3),
	BranchManagerId INT,
	DateAdded DATE,
	AddedById INT,
	LastModifiedDate DATE,
	LastModifiedID INT
);
insert into Branches (Name, Address, TotalProfitInDinars, BranchManagerId, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values ('Geraldine Welbrock', '2969 Truax Point', 1.223, 1, '12/23/2017', 1, '2/6/2018', 1);
insert into Branches (Name, Address, TotalProfitInDinars, BranchManagerId, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values ('Rora Caizley', '62 Schurz Circle', 7.563, 2, '9/22/2018', 2, '5/16/2018', 2);


create table BrancheSaleTransactions (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	BranchId INT,
	CashSale BOOLEAN,
	CustomerId INT,
	Cash FLOAT,
	Credit FLOAT,
	TotalCost DECIMAL(6,3),
	TotalProfit DECIMAL(6,3),
	DateAdded DATE,
	AddedById INT,
	LastModifiedDate DATE,
	LastModifiedID INT
);
insert into BrancheSaleTransactions (BranchId, CustomerId,  TotalProfit, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values ( 1, 1,  4.164, '12/31/2017', 1, '4/3/2018', 1);
insert into BrancheSaleTransactions (BranchId, CustomerId,  TotalProfit, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values (2, 2, 32.039, '2/12/2018', 2, '4/16/2018', 2);


create table BrancheSaleItems (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	TransactionId INT,
	ItemId INT,
	Quantity INT,
	UnitPrice DECIMAL(6,3),
	ExpectedSaleMargin DECIMAL(6,3),
	Profit DECIMAL(6,3),
	DateAdded DATE,
	AddedById INT,
	LastModifiedDate DATE,
	LastModifiedID INT
);
insert into BrancheSaleItems (TransactionId, ItemId, Quantity, UnitPrice, ExpectedSaleMargin, Profit, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values (1, 1, 6, 65.357, 40.379, 34.815, '5/23/2018', 1, '7/23/2018', 1);
insert into BrancheSaleItems (TransactionId, ItemId, Quantity, UnitPrice, ExpectedSaleMargin, Profit, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values (2, 2, 1, 28.189, 78.939, 33.111, '5/15/2018', 2, '6/24/2018', 2);

create table BranchExpenseTransactions (
	Id INT,
	AmountInDinars DECIMAL(5,3),
	Reason TEXT,
	BranchId INT,
	DateAdded DATE,
	AddedById INT,
	LastModifiedDate DATE,
	LastModifiedID INT
);
insert into BranchExpenseTransactions (AmountInDinars, Reason, BranchId, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values (3.392, 'amet  integer ac leo', 1, '11/22/2017', 1, '12/11/2017', 1);
insert into BranchExpenseTransactions (AmountInDinars, Reason, BranchId, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values ( 2.913, 'et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare', 2, '6/17/2018', 2, '9/4/2018', 2);

create table Shipments (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	SupplierId INT,
	ShipmentNumber TEXT,
	ExpectedArrivalDate DATE,
	ExpectedDeliveryDate DATE,
	ExpectedArrivalPlace VARCHAR(50),
	DateAdded DATE,
	AddedById INT,
	LastModifiedDate DATE,
	LastModifiedID INT
);

create table Items (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Name INT,
	DateAdded DATE,
	AddedById INT,
	LastModifiedDate DATE,
	LastModifiedID INT
);
insert into Items (Name, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values ( 1, '11/15/2017', 1, '11/15/2017', 1);
insert into Items (Name, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values ( 2, '5/11/2018', 2, '9/19/2018', 2);

create table ShipmentItems (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	ShipmentNumber INT,
	ItemId INT,
	AmountExpected DATE,
	DateAdded DATE,
	AddedById INT,
	LastModifiedDate DATE,
	LastModifiedID INT
);
insert into ShipmentItems (ShipmentNumber, ItemId, AmountExpected, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values (1, 1, '10/8/2018', '3/11/2018', 1, '1/14/2018', 1);
insert into ShipmentItems (ShipmentNumber, ItemId, AmountExpected, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values (2, 2, '5/11/2018', '8/24/2018', 2, '2/28/2018', 2);

create table BranchItems (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	BranchId INT,
	ItemId INT,
	AmountAvailable DECIMAL(6,3),
	UnitPrice DECIMAL(6,3),
	DateAdded DATE,
	AddedById INT,
	LastModifiedDate DATE,
	LastModifiedID INT
);
insert into BranchItems (BranchId, ItemId, AmountAvailable, UnitPrice, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values (1, 1, 25.473, 77.461, '4/18/2018', 1, '10/3/2018', 1);
insert into BranchItems (BranchId, ItemId, AmountAvailable, UnitPrice, DateAdded, AddedById, LastModifiedDate, LastModifiedID) values (2, 2, 28.006, 66.651, '6/19/2018', 2, '10/24/2018', 2);

create table RevaluationHistories (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	ItemId INT,
	OriginalUnitPrice DECIMAL(4,3),
	RevaluatedPrice DECIMAL(4,3),
	DateAdded DATE,
	AddedById INT
);
insert into RevaluationHistory (ItemId, OriginalUnitPrice, RevaluatedPrice, DateAdded, AddedById) values ( 1, 4.289, 4.272, '5/22/2018', 1);
insert into RevaluationHistory (ItemId, OriginalUnitPrice, RevaluatedPrice, DateAdded, AddedById) values ( 2, 3.78, 2.684, '9/11/2018', 2);

create table RevaluationProfits (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	ItemId INT,
	OriginalUnitPrice DECIMAL(4,3),
	NewUnitPrice DECIMAL(4,3),
	TotalAmount DECIMAL(5,3),
	Profit DECIMAL(5,3),
	DateAdded DATE,
	AddedById INT
);
insert into RevaluationProfits (ItemId, OriginalUnitPrice, NewUnitPrice, TotalAmount, Profit, DateAdded, AddedById) values (1, 1.767, 1.142, 5.439, 6.306, '12/2/2017', 1);
insert into RevaluationProfits (ItemId, OriginalUnitPrice, NewUnitPrice, TotalAmount, Profit, DateAdded, AddedById) values (2, 2.034, 1.821, 7.39, 9.239, '2/11/2018', 2);

create table ItemSalesControl (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	ItemId INT,
	RevaluationPrice DECIMAL(4,3),
	TotalAvailable DECIMAL(5,3),
	Profit DECIMAL(5,3),
	DateAdded DATE,
	AddedById INT,
	LastModifiedDate DATE,
	LastModifiedId INT
);
insert into ItemSalesControl (ItemId, RevaluationPrice, TotalAvailable, Profit, DateAdded, AddedById, LastModifiedDate, LastModifiedId) values (1, 1.339, 2.155, 11.728, '8/6/2018', 1, '1/15/2018', 1);
insert into ItemSalesControl (ItemId, RevaluationPrice, TotalAvailable, Profit, DateAdded, AddedById, LastModifiedDate, LastModifiedId) values (2, 3.169, 7.671, 4.786, '3/27/2018', 2, '12/6/2017', 2);

create table TemporaryStorages (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	ItemId INT,
	TotalAvailable DECIMAL(5,3),
	UnitPrice DECIMAL(5,3),
	ShipmentNumber VARCHAR(50),
	DateAdded DATE,
	AddedById INT,
	LastModifiedDate DATE,
	LastModifiedId INT
);
insert into TemporaryStorages (ItemId, TotalAvailable, UnitPrice, ShipmentNumber, DateAdded, AddedById, LastModifiedDate, LastModifiedId) values (1, 1.522, 5.348, 'interactive', '7/26/2018', 1, '9/21/2018', 1);
insert into TemporaryStorages (ItemId, TotalAvailable, UnitPrice, ShipmentNumber, DateAdded, AddedById, LastModifiedDate, LastModifiedId) values (2, 1.124, 3.63, 'structure', '6/22/2018', 2, '3/13/2018', 2);

create table ItemSalesRecords (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	ItemId INT,
	ShipmentNumber VARCHAR(50),
	WholeSaleTotalQuantity DECIMAL(5,3),
	WholeSaleTotalPrice DECIMAL(5,3),
	RetailSaleTotalQuantity DECIMAL(5,3),
	RetailSaleTotalPrice DECIMAL(5,3),
	RevaluationProfit DECIMAL(5,3),
	RevaluationLoss DECIMAL(5,3),
	DateAdded DATE,
	AddedById INT,
	LastModifiedDate DATE,
	LastModifiedId INT
);
insert into ItemSalesRecords (ItemId, ShipmentNumber, WholeSaleTotalQuantity, WholeSaleTotalPrice, RetailSaleTotalQuantity, RetailSaleTotalPrice, RevaluationProfit, RevaluationLoss, DateAdded, AddedById, LastModifiedDate, LastModifiedId) values ( 1, 'actuating', 7.567, 4.668, 6.497, 9.0, 5.181, 9.33, '4/22/2018', 1, '12/25/2017', 1);
insert into ItemSalesRecords (ItemId, ShipmentNumber, WholeSaleTotalQuantity, WholeSaleTotalPrice, RetailSaleTotalQuantity, RetailSaleTotalPrice, RevaluationProfit, RevaluationLoss, DateAdded, AddedById, LastModifiedDate, LastModifiedId) values (2, 'asymmetric', 1.755, 8.167, 1.225, 5.241, 4.376, 5.408, '1/30/2018', 2, '5/2/2018', 2);


