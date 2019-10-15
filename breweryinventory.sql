-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: breweryinventory
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `CustLName` varchar(30) NOT NULL,
  `CustContactNo` char(15) NOT NULL,
  `CustAddress` varchar(50) NOT NULL,
  `CustTIN` int(12) NOT NULL,
  `PaymentNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerID_UNIQUE` (`CustomerID`),
  KEY `PaymentNo_idx` (`PaymentNo`),
  CONSTRAINT `PaymentNo` FOREIGN KEY (`PaymentNo`) REFERENCES `payment` (`PaymentNo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Moralde','09172935102','Cogon',4312,1),(2,'Paredes','09174324012','Carmen',5123,2),(3,'Dolor','09174356243','Balulang',2123,3),(4,'Parrel','09175120553','Kauswagan',1211,4),(5,'Cuenca','09172580192','Macasandig',5167,5),(21,'Villanueva','Macasandig','09174214723',8231,NULL),(51,'Junar','Balulang','09174268514',1245,NULL),(57,'Loren','Cogon','09174136259',9274,NULL),(61,'Velez','Balulang','09174258716',2146,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_has_order`
--

DROP TABLE IF EXISTS `customer_has_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_has_order` (
  `customer_CustomerID` int(11) NOT NULL,
  `order_Order#` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  PRIMARY KEY (`customer_CustomerID`,`order_Order#`),
  KEY `fk_customer_has_order_order1_idx` (`order_Order#`),
  CONSTRAINT `fk_customer_has_order_customer` FOREIGN KEY (`customer_CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_has_order_order1` FOREIGN KEY (`order_Order#`) REFERENCES `ordern` (`OrderNo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_has_order`
--

LOCK TABLES `customer_has_order` WRITE;
/*!40000 ALTER TABLE `customer_has_order` DISABLE KEYS */;
INSERT INTO `customer_has_order` VALUES (1,1,'2019-09-01'),(2,2,'2019-09-04'),(3,3,'2019-09-04'),(4,4,'2019-09-09'),(5,5,'2019-09-11');
/*!40000 ALTER TABLE `customer_has_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `ItemID` int(5) NOT NULL,
  `ItemName` varchar(20) NOT NULL,
  `ItemType` varchar(10) NOT NULL,
  `UnitCost` int(5) NOT NULL,
  `ItemCost` int(5) NOT NULL,
  `ItemQty` int(4) NOT NULL,
  PRIMARY KEY (`ItemID`),
  UNIQUE KEY `ItemID_UNIQUE` (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'San Mig Light','Alcohol',18,20,14),(2,'Magnolia Orange','Softdrink',16,18,16),(3,'Red horse','Alcohol',20,22,15),(4,'Magnolia Apple','Softdrink',16,18,21),(5,'San Mig','Alcohol',18,20,17);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_report`
--

DROP TABLE IF EXISTS `inventory_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_report` (
  `InventoryReportNo` int(11) NOT NULL,
  `InventoryDate` date NOT NULL,
  `inventorycustodian_IC_ID` int(11) NOT NULL,
  `inventory_ItemID` int(5) NOT NULL,
  `salesmanager_SM_ID` int(11) NOT NULL,
  PRIMARY KEY (`InventoryReportNo`,`inventory_ItemID`),
  UNIQUE KEY `InventoryReportNo_UNIQUE` (`InventoryReportNo`),
  KEY `fk_inventory_report_salesmanager1_idx` (`salesmanager_SM_ID`),
  KEY `fk_inventory_report_inventorycustodian1_idx` (`inventory_ItemID`),
  KEY `inventorycustodian_IC_ID_idx` (`inventorycustodian_IC_ID`),
  CONSTRAINT `fk_inventory_report_inventorycustodian1` FOREIGN KEY (`inventory_ItemID`) REFERENCES `inventorycustodian` (`inventory_ItemID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_inventory_report_salesmanager1` FOREIGN KEY (`salesmanager_SM_ID`) REFERENCES `salesmanager` (`SM_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inventorycustodian_IC_ID` FOREIGN KEY (`inventorycustodian_IC_ID`) REFERENCES `inventorycustodian` (`IC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_report`
--

LOCK TABLES `inventory_report` WRITE;
/*!40000 ALTER TABLE `inventory_report` DISABLE KEYS */;
INSERT INTO `inventory_report` VALUES (1,'2015-03-05',1,1,1),(2,'2015-03-05',2,1,2),(3,'2016-08-07',3,2,3),(4,'2016-05-25',4,2,4),(5,'2017-05-03',5,5,5);
/*!40000 ALTER TABLE `inventory_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventorycustodian`
--

DROP TABLE IF EXISTS `inventorycustodian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventorycustodian` (
  `IC_ID` int(11) NOT NULL,
  `IC_LName` varchar(50) NOT NULL,
  `IC_BirthDate` date NOT NULL,
  `IC_Contact#` char(15) NOT NULL,
  `inventory_ItemID` int(5) NOT NULL,
  PRIMARY KEY (`IC_ID`),
  UNIQUE KEY `IC_ID_UNIQUE` (`IC_ID`),
  KEY `fk_inventorycustodian_inventory1_idx` (`inventory_ItemID`),
  CONSTRAINT `ItemID` FOREIGN KEY (`inventory_ItemID`) REFERENCES `inventory` (`ItemID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventorycustodian`
--

LOCK TABLES `inventorycustodian` WRITE;
/*!40000 ALTER TABLE `inventorycustodian` DISABLE KEYS */;
INSERT INTO `inventorycustodian` VALUES (1,'Wintia','1999-03-27','09174914611',1),(2,'Nyami','1999-12-03','09174914612',1),(3,'Uchiha','1989-07-06','09174914613',2),(4,'Uzunaki','1999-05-15','09174914614',2),(5,'Fennia','1985-10-03','09174914615',5);
/*!40000 ALTER TABLE `inventorycustodian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_report`
--

DROP TABLE IF EXISTS `order_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_report` (
  `OrderReportNo` int(11) NOT NULL,
  `OrderRDate` date NOT NULL,
  `salesmanager_SM_ID` int(11) NOT NULL,
  `inventorycustodian_IC_ID` int(11) NOT NULL,
  PRIMARY KEY (`OrderReportNo`),
  UNIQUE KEY `OrderReportNo_UNIQUE` (`OrderReportNo`),
  KEY `fk_order_report_salesmanager1_idx` (`salesmanager_SM_ID`),
  KEY `fk_order_report_inventorycustodian1_idx` (`inventorycustodian_IC_ID`),
  CONSTRAINT `fk_order_report_inventorycustodian1` FOREIGN KEY (`inventorycustodian_IC_ID`) REFERENCES `inventorycustodian` (`IC_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_order_report_salesmanager1` FOREIGN KEY (`salesmanager_SM_ID`) REFERENCES `salesmanager` (`SM_ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_report`
--

LOCK TABLES `order_report` WRITE;
/*!40000 ALTER TABLE `order_report` DISABLE KEYS */;
INSERT INTO `order_report` VALUES (1,'2019-09-01',1,1),(2,'2019-09-04',2,2),(3,'2019-09-04',3,3),(4,'2019-09-09',4,4),(5,'2019-09-01',5,5);
/*!40000 ALTER TABLE `order_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordern`
--

DROP TABLE IF EXISTS `ordern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordern` (
  `OrderNo` int(11) NOT NULL,
  `OrderItemName` varchar(20) NOT NULL,
  `OrderItemQty` int(4) NOT NULL,
  PRIMARY KEY (`OrderNo`),
  UNIQUE KEY `Order#_UNIQUE` (`OrderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordern`
--

LOCK TABLES `ordern` WRITE;
/*!40000 ALTER TABLE `ordern` DISABLE KEYS */;
INSERT INTO `ordern` VALUES (1,'San Mig',25),(2,'Magnolia Apple',12),(3,'San Mig Light',14),(4,'Red horse',7),(5,'Magnolia Orange',9),(7,'Magnolia',5),(10,'Red horse',8),(15,'Red horse',9),(16,'Magnolia Orange',7),(17,'Magnolia Apple',11),(20,'Red horse',5),(31,'Red horse',5),(55,'Red horse',7);
/*!40000 ALTER TABLE `ordern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentNo` int(11) NOT NULL,
  `PaymentType` varchar(4) NOT NULL,
  `salesmanager_SM_ID` int(11) NOT NULL,
  PRIMARY KEY (`PaymentNo`),
  UNIQUE KEY `PaymentNo_UNIQUE` (`PaymentNo`),
  KEY `fk_payment_salesmanager1_idx` (`salesmanager_SM_ID`),
  CONSTRAINT `fk_payment_salesmanager1` FOREIGN KEY (`salesmanager_SM_ID`) REFERENCES `salesmanager` (`SM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Cash',1),(2,'Cash',1),(3,'Cash',1),(4,'CC',1),(5,'CC',2);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paymenttype`
--

DROP TABLE IF EXISTS `payment_paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_paymenttype` (
  `payment_PaymentNo` int(11) NOT NULL,
  `PaymentType` varchar(4) NOT NULL,
  PRIMARY KEY (`payment_PaymentNo`,`PaymentType`),
  KEY `fk_payment_paymenttype_payment1_idx` (`payment_PaymentNo`),
  CONSTRAINT `fk_payment_paymenttype_payment1` FOREIGN KEY (`payment_PaymentNo`) REFERENCES `payment` (`PaymentNo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paymenttype`
--

LOCK TABLES `payment_paymenttype` WRITE;
/*!40000 ALTER TABLE `payment_paymenttype` DISABLE KEYS */;
INSERT INTO `payment_paymenttype` VALUES (1,'Cash'),(2,'Cash'),(3,'Cash'),(4,'CC'),(5,'CC');
/*!40000 ALTER TABLE `payment_paymenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_report`
--

DROP TABLE IF EXISTS `purchase_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_report` (
  `PurchaseReportNo` int(11) NOT NULL,
  `PurchaseDate` date NOT NULL,
  `salesmanager_SM_ID` int(11) NOT NULL,
  `inventorycustodian_IC_ID` int(11) NOT NULL,
  PRIMARY KEY (`PurchaseReportNo`),
  UNIQUE KEY `PurchaseReportNo_UNIQUE` (`PurchaseReportNo`),
  KEY `fk_purchase_report_salesmanager1_idx` (`salesmanager_SM_ID`),
  KEY `fk_purchase_report_inventorycustodian1_idx` (`inventorycustodian_IC_ID`),
  CONSTRAINT `fk_purchase_report_inventorycustodian1` FOREIGN KEY (`inventorycustodian_IC_ID`) REFERENCES `inventorycustodian` (`IC_ID`),
  CONSTRAINT `fk_purchase_report_salesmanager1` FOREIGN KEY (`salesmanager_SM_ID`) REFERENCES `salesmanager` (`SM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_report`
--

LOCK TABLES `purchase_report` WRITE;
/*!40000 ALTER TABLE `purchase_report` DISABLE KEYS */;
INSERT INTO `purchase_report` VALUES (1,'2019-09-01',1,1),(2,'2019-09-04',2,2),(3,'2019-09-04',3,3),(4,'2019-09-09',4,4),(5,'2019-09-11',5,5);
/*!40000 ALTER TABLE `purchase_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_report`
--

DROP TABLE IF EXISTS `sales_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_report` (
  `SalesReportNo` int(11) NOT NULL,
  `SalesDate` date NOT NULL,
  `salesmanager_SM_ID` int(11) NOT NULL,
  `inventorycustodian_IC_ID` int(11) NOT NULL,
  PRIMARY KEY (`SalesReportNo`),
  UNIQUE KEY `SalesReportNo_UNIQUE` (`SalesReportNo`),
  KEY `fk_sales_report_salesmanager1_idx` (`salesmanager_SM_ID`),
  KEY `fk_sales_report_inventorycustodian1_idx` (`inventorycustodian_IC_ID`),
  CONSTRAINT `fk_sales_report_inventorycustodian1` FOREIGN KEY (`inventorycustodian_IC_ID`) REFERENCES `inventorycustodian` (`IC_ID`),
  CONSTRAINT `fk_sales_report_salesmanager1` FOREIGN KEY (`salesmanager_SM_ID`) REFERENCES `salesmanager` (`SM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_report`
--

LOCK TABLES `sales_report` WRITE;
/*!40000 ALTER TABLE `sales_report` DISABLE KEYS */;
INSERT INTO `sales_report` VALUES (1,'2019-09-01',1,1),(2,'2019-09-04',1,1),(3,'2019-09-04',1,1),(4,'2019-09-09',1,1),(5,'2019-09-11',2,2);
/*!40000 ALTER TABLE `sales_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesmanager`
--

DROP TABLE IF EXISTS `salesmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesmanager` (
  `SM_ID` int(11) NOT NULL,
  `SM_LName` varchar(50) NOT NULL,
  `SM_BirthDate` date NOT NULL,
  `SM_Contact#` char(15) NOT NULL,
  `Order#` int(11) NOT NULL,
  `supplier_SupplierID` int(11) NOT NULL,
  PRIMARY KEY (`SM_ID`),
  UNIQUE KEY `SM_ID_UNIQUE` (`SM_ID`),
  KEY `fk_salesmanager_supplier1_idx` (`supplier_SupplierID`),
  KEY `Order#_idx` (`Order#`),
  CONSTRAINT `Order#` FOREIGN KEY (`Order#`) REFERENCES `ordern` (`OrderNo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_salesmanager_supplier1` FOREIGN KEY (`supplier_SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesmanager`
--

LOCK TABLES `salesmanager` WRITE;
/*!40000 ALTER TABLE `salesmanager` DISABLE KEYS */;
INSERT INTO `salesmanager` VALUES (1,'Parell','1998-03-11','09174914612',1,1),(2,'Ybanez','1991-07-05','09174914616',2,1),(3,'Opalla','1989-07-06','09174914611',3,1),(4,'Moralde','1978-02-11','09174914612',4,1),(5,'Santo','2001-09-11','09174914618',5,1);
/*!40000 ALTER TABLE `salesmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(20) NOT NULL,
  `SupplierAddress` varchar(50) NOT NULL,
  `SupplierContactNo` char(15) NOT NULL,
  PRIMARY KEY (`SupplierID`),
  UNIQUE KEY `SupplierID_UNIQUE` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'San Miguel','Opol','09184715491'),(2,'San Miguel Corp','Opol','1234');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply` (
  `SupplyID` int(11) NOT NULL,
  `SupplyName` varchar(20) NOT NULL,
  `SupplyType` varchar(20) NOT NULL,
  `SupplyQty` int(4) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  PRIMARY KEY (`SupplyID`),
  UNIQUE KEY `SupplyID_UNIQUE` (`SupplyID`),
  KEY `SupplierID_idx` (`SupplierID`),
  CONSTRAINT `SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply` DISABLE KEYS */;
INSERT INTO `supply` VALUES (1,'Red horse','Alcohol',14,1),(2,'San Mig Light','Alcohol',17,1),(3,'San Mig','Alcohol',13,1),(4,'Magnolia Apple','Softdrink',14,1),(5,'Magnolia Orange','Softdrink',12,1);
/*!40000 ALTER TABLE `supply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-14 22:34:04
