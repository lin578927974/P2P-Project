/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : p2p

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-06-07 23:52:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for basfile
-- ----------------------------
DROP TABLE IF EXISTS `basfile`;
CREATE TABLE `basfile` (
  `FlieID` char(36) NOT NULL,
  `FileType` tinyint(4) NOT NULL,
  `FileClass` varchar(36) DEFAULT NULL,
  `GrpID` char(36) NOT NULL,
  `FileName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `FileUrl` varchar(200) CHARACTER SET utf8 NOT NULL,
  `OrderDesc` smallint(6) DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`FlieID`),
  KEY `FK_BASFILE_REFERENCE_BASFILEG` (`GrpID`),
  CONSTRAINT `FK_BASFILE_REFERENCE_BASFILEG` FOREIGN KEY (`GrpID`) REFERENCES `basfilegroup` (`GrpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of basfile
-- ----------------------------

-- ----------------------------
-- Table structure for basfilegroup
-- ----------------------------
DROP TABLE IF EXISTS `basfilegroup`;
CREATE TABLE `basfilegroup` (
  `GrpID` char(36) NOT NULL,
  `GrpName` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `GrpClass` tinyint(4) DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`GrpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of basfilegroup
-- ----------------------------

-- ----------------------------
-- Table structure for basindex
-- ----------------------------
DROP TABLE IF EXISTS `basindex`;
CREATE TABLE `basindex` (
  `IdxKey` varchar(6) NOT NULL,
  `SN` int(11) NOT NULL,
  `UseTime` datetime NOT NULL,
  PRIMARY KEY (`IdxKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of basindex
-- ----------------------------

-- ----------------------------
-- Table structure for basproduct
-- ----------------------------
DROP TABLE IF EXISTS `basproduct`;
CREATE TABLE `basproduct` (
  `ProdID` char(36) NOT NULL,
  `ProdNmae` varchar(40) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(400) CHARACTER SET utf8 NOT NULL,
  `BServRate` decimal(6,2) NOT NULL,
  `LServRate` decimal(6,2) NOT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of basproduct
-- ----------------------------

-- ----------------------------
-- Table structure for basrate
-- ----------------------------
DROP TABLE IF EXISTS `basrate`;
CREATE TABLE `basrate` (
  `RateCode` char(36) NOT NULL,
  `RateName` varchar(40) CHARACTER SET utf8 NOT NULL,
  `RateType` tinyint(4) NOT NULL,
  `RateClass` varchar(36) DEFAULT NULL,
  `GrpID` char(36) NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Val` decimal(6,2) NOT NULL,
  `MaxVal` decimal(18,2) DEFAULT NULL,
  `MainVal` decimal(18,2) DEFAULT NULL,
  `RangeMax` decimal(18,2) DEFAULT NULL,
  `RangeMin` decimal(18,2) DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`RateCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of basrate
-- ----------------------------

-- ----------------------------
-- Table structure for basrategroup
-- ----------------------------
DROP TABLE IF EXISTS `basrategroup`;
CREATE TABLE `basrategroup` (
  `GrpID` char(36) NOT NULL,
  `GrpName` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `GrpClass` varchar(36) DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`GrpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of basrategroup
-- ----------------------------

-- ----------------------------
-- Table structure for basregion
-- ----------------------------
DROP TABLE IF EXISTS `basregion`;
CREATE TABLE `basregion` (
  `RegiCode` char(6) NOT NULL,
  `RegiName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `AbbName` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Level` tinyint(4) NOT NULL,
  `UpCode` char(6) DEFAULT NULL,
  PRIMARY KEY (`RegiCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of basregion
-- ----------------------------

-- ----------------------------
-- Table structure for basscorerule
-- ----------------------------
DROP TABLE IF EXISTS `basscorerule`;
CREATE TABLE `basscorerule` (
  `RuleCode` char(36) NOT NULL,
  `RuleName` varchar(40) CHARACTER SET utf8 NOT NULL,
  `RuleType` tinyint(4) NOT NULL,
  `Score` int(11) NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`RuleCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of basscorerule
-- ----------------------------

-- ----------------------------
-- Table structure for bastext
-- ----------------------------
DROP TABLE IF EXISTS `bastext`;
CREATE TABLE `bastext` (
  `TxtID` char(36) NOT NULL,
  `TxtClass` tinyint(4) NOT NULL,
  `Title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Content` text NOT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`TxtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bastext
-- ----------------------------

-- ----------------------------
-- Table structure for finfklog
-- ----------------------------
DROP TABLE IF EXISTS `finfklog`;
CREATE TABLE `finfklog` (
  `FkLogID` char(20) NOT NULL,
  `FkRegID` char(30) NOT NULL,
  `FKUserID` char(36) NOT NULL,
  `RealDT` datetime NOT NULL,
  `RealAmount` decimal(18,2) NOT NULL,
  `TransID` char(40) NOT NULL,
  `InputPerID` char(36) NOT NULL,
  `InputPerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `InputDT` datetime NOT NULL,
  `ApprovePerID` char(36) DEFAULT NULL,
  `ApprovePerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ApproveDT` datetime DEFAULT NULL,
  `FkLogFlag` char(10) DEFAULT NULL,
  `Remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`FkLogID`),
  UNIQUE KEY `ix_KfkLog_ID` (`FkLogID`),
  KEY `ix_KfkLog_RegID` (`FkRegID`),
  CONSTRAINT `fk_KfkLog_Reg` FOREIGN KEY (`FkRegID`) REFERENCES `finfkreg` (`FkRegID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of finfklog
-- ----------------------------

-- ----------------------------
-- Table structure for finfkreg
-- ----------------------------
DROP TABLE IF EXISTS `finfkreg`;
CREATE TABLE `finfkreg` (
  `FkRegID` char(30) NOT NULL,
  `FKUserID` char(36) NOT NULL,
  `FKKindCode` char(10) NOT NULL,
  `FKKindName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `RegisterAmount` decimal(18,2) NOT NULL,
  `DueDate` date NOT NULL,
  `RealAmount` decimal(18,2) NOT NULL,
  `LastestFKDT` datetime DEFAULT NULL,
  `RelativeBusType` char(1) DEFAULT NULL,
  `RelativeBusTab` char(20) DEFAULT NULL,
  `RelativeBusID` varchar(50) DEFAULT NULL,
  `BusIssueNo` int(11) DEFAULT NULL,
  `RelativeFinType` char(1) DEFAULT NULL,
  `RelativeFinTab` char(20) DEFAULT NULL,
  `RelativeFinID` varchar(50) DEFAULT NULL,
  `InputPerID` char(36) NOT NULL,
  `InputPerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `InputDT` datetime NOT NULL,
  `ApprovePerID` char(36) DEFAULT NULL,
  `ApprovePerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ApproveDT` datetime DEFAULT NULL,
  `FkFlag` char(10) DEFAULT NULL,
  `Remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`FkRegID`),
  UNIQUE KEY `ix_Kfkreg_ID` (`FkRegID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of finfkreg
-- ----------------------------

-- ----------------------------
-- Table structure for finfkregbak
-- ----------------------------
DROP TABLE IF EXISTS `finfkregbak`;
CREATE TABLE `finfkregbak` (
  `FkRegID` char(30) NOT NULL,
  `BakNo` int(11) NOT NULL,
  `FKUserID` char(36) NOT NULL,
  `FKKindCode` char(10) NOT NULL,
  `FKKindName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `RegisterAmount` decimal(18,2) NOT NULL,
  `DueDate` date NOT NULL,
  `RealAmount` decimal(18,2) NOT NULL,
  `LastestFKDT` datetime DEFAULT NULL,
  `RelativeBusType` char(1) DEFAULT NULL,
  `RelativeBusTab` char(20) DEFAULT NULL,
  `RelativeBusID` varchar(50) DEFAULT NULL,
  `BusIssueNo` int(11) DEFAULT NULL,
  `RelativeFinType` char(1) DEFAULT NULL,
  `RelativeFinTab` char(20) DEFAULT NULL,
  `RelativeFinID` varchar(50) DEFAULT NULL,
  `InputPerID` char(36) NOT NULL,
  `InputPerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `InputDT` datetime NOT NULL,
  `ApprovePerID` char(36) DEFAULT NULL,
  `ApprovePerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ApproveDT` datetime DEFAULT NULL,
  `FkFlag` char(10) DEFAULT NULL,
  `Remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `BakCode` char(10) NOT NULL,
  `BakName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `BackupDT` datetime NOT NULL,
  PRIMARY KEY (`FkRegID`,`BakNo`),
  UNIQUE KEY `ix_KfkregBak_ID` (`FkRegID`,`BakNo`),
  KEY `ix_KfkregBak_RegID` (`FkRegID`),
  CONSTRAINT `fk_KfkregBak_Reg` FOREIGN KEY (`FkRegID`) REFERENCES `finfkreg` (`FkRegID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of finfkregbak
-- ----------------------------

-- ----------------------------
-- Table structure for finsklog
-- ----------------------------
DROP TABLE IF EXISTS `finsklog`;
CREATE TABLE `finsklog` (
  `SkLogID` char(20) NOT NULL,
  `SkRegID` char(30) NOT NULL,
  `SKUserID` char(36) NOT NULL,
  `FkLogID` char(20) NOT NULL,
  `FKUserID` char(36) NOT NULL,
  `RealDT` datetime NOT NULL,
  `RealAmount` decimal(18,2) NOT NULL,
  `TransID` char(40) NOT NULL,
  `InputPerID` char(36) NOT NULL,
  `InputPerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `InputDT` datetime NOT NULL,
  `ApprovePerID` char(36) DEFAULT NULL,
  `ApprovePerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ApproveDT` datetime DEFAULT NULL,
  `SkLogFlag` char(10) DEFAULT NULL,
  `Remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`SkLogID`),
  UNIQUE KEY `ix_KskLog_ID` (`SkLogID`),
  KEY `ix_KskLog_RegID` (`SkRegID`),
  KEY `ix_KskLog_FKLogID` (`FkLogID`),
  CONSTRAINT `fk_KskLog_FKLog` FOREIGN KEY (`FkLogID`) REFERENCES `finfklog` (`FkLogID`),
  CONSTRAINT `fk_KskLog_Reg` FOREIGN KEY (`SkRegID`) REFERENCES `finskreg` (`SkRegID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of finsklog
-- ----------------------------

-- ----------------------------
-- Table structure for finskreg
-- ----------------------------
DROP TABLE IF EXISTS `finskreg`;
CREATE TABLE `finskreg` (
  `SkRegID` char(30) NOT NULL,
  `SKUserID` char(36) NOT NULL,
  `SKKindCode` char(10) NOT NULL,
  `SKKindName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `RegisterAmount` decimal(18,2) NOT NULL,
  `DueDate` date NOT NULL,
  `RealAmount` decimal(18,2) NOT NULL,
  `LastestSKDT` datetime DEFAULT NULL,
  `RelativeBusType` char(1) DEFAULT NULL,
  `RelativeBusID` varchar(50) DEFAULT NULL,
  `RelativeBusTab` char(20) DEFAULT NULL,
  `BusIssueNo` int(11) DEFAULT NULL,
  `RelativeFinType` char(1) DEFAULT NULL,
  `RelativeFinTab` char(20) DEFAULT NULL,
  `RelativeFinID` varchar(50) DEFAULT NULL,
  `FkRegID` char(30) NOT NULL,
  `InputPerID` char(36) NOT NULL,
  `InputPerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `InputDT` datetime NOT NULL,
  `ApprovePerID` char(36) DEFAULT NULL,
  `ApprovePerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ApproveDT` datetime DEFAULT NULL,
  `SKFlag` char(10) DEFAULT NULL,
  `Remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`SkRegID`),
  UNIQUE KEY `ix_KskReg_ID` (`SkRegID`),
  KEY `ix_KskReg_FKRegID` (`FkRegID`),
  CONSTRAINT `fk_KskReg_FkReg` FOREIGN KEY (`FkRegID`) REFERENCES `finfkreg` (`FkRegID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of finskreg
-- ----------------------------

-- ----------------------------
-- Table structure for finskregbak
-- ----------------------------
DROP TABLE IF EXISTS `finskregbak`;
CREATE TABLE `finskregbak` (
  `SkRegID` char(30) NOT NULL,
  `BakNo` int(11) NOT NULL,
  `SKUserID` char(36) NOT NULL,
  `SKKindCode` char(10) NOT NULL,
  `SKKindName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `RegisterAmount` decimal(18,2) NOT NULL,
  `DueDate` date NOT NULL,
  `RealAmount` decimal(18,2) NOT NULL,
  `LastestSKDT` datetime DEFAULT NULL,
  `RelativeBusType` char(1) DEFAULT NULL,
  `RelativeBusID` varchar(50) DEFAULT NULL,
  `RelativeBusTab` char(20) DEFAULT NULL,
  `BusIssueNo` int(11) DEFAULT NULL,
  `RelativeFinType` char(1) DEFAULT NULL,
  `RelativeFinTab` char(20) DEFAULT NULL,
  `RelativeFinID` varchar(50) DEFAULT NULL,
  `FkRegID` char(30) NOT NULL,
  `InputPerID` char(36) NOT NULL,
  `InputPerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `InputDT` datetime NOT NULL,
  `ApprovePerID` char(36) DEFAULT NULL,
  `ApprovePerName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ApproveDT` datetime DEFAULT NULL,
  `SKFlag` char(10) DEFAULT NULL,
  `Remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `BakCode` char(10) NOT NULL,
  `BakName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `BackupDT` datetime NOT NULL,
  PRIMARY KEY (`SkRegID`,`BakNo`),
  UNIQUE KEY `ix_KskregBak_ID` (`SkRegID`,`BakNo`),
  KEY `ix_KskregBak_RegID` (`SkRegID`),
  CONSTRAINT `fk_KSkregBak_Reg` FOREIGN KEY (`SkRegID`) REFERENCES `finskreg` (`SkRegID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of finskregbak
-- ----------------------------

-- ----------------------------
-- Table structure for fndbankaccount
-- ----------------------------
DROP TABLE IF EXISTS `fndbankaccount`;
CREATE TABLE `fndbankaccount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CardID` char(34) NOT NULL,
  `UserID` char(36) NOT NULL,
  `Holder` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Bank` varchar(20) NOT NULL,
  `BankDet` varchar(120) CHARACTER SET utf8 NOT NULL,
  `BidTime` datetime NOT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_FndBankAccount_UserID` (`UserID`),
  CONSTRAINT `fk_FndBankAccount_UserID` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fndbankaccount
-- ----------------------------

-- ----------------------------
-- Table structure for fndbdlog
-- ----------------------------
DROP TABLE IF EXISTS `fndbdlog`;
CREATE TABLE `fndbdlog` (
  `BDLogID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `ChType` tinyint(4) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `LogCode` char(36) NOT NULL,
  `ChTime` datetime NOT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`BDLogID`),
  KEY `fk_FndBDLog_UserID` (`UserID`),
  CONSTRAINT `fk_FndBDLog_UserID` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fndbdlog
-- ----------------------------

-- ----------------------------
-- Table structure for fndczlog
-- ----------------------------
DROP TABLE IF EXISTS `fndczlog`;
CREATE TABLE `fndczlog` (
  `CZLogID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `CZRegID` char(36) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `CardID` char(34) DEFAULT NULL,
  `Holder` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `BankDet` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `CZTime` datetime NOT NULL,
  `AdminID` char(36) NOT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`CZLogID`),
  KEY `fk_FndCZLog_UserID` (`UserID`),
  KEY `fk_FndCZLog_AdminID` (`AdminID`),
  CONSTRAINT `fk_FndCZLog_AdminID` FOREIGN KEY (`AdminID`) REFERENCES `sysadmin` (`AdminID`),
  CONSTRAINT `fk_FndCZLog_UserID` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fndczlog
-- ----------------------------

-- ----------------------------
-- Table structure for fndczreg
-- ----------------------------
DROP TABLE IF EXISTS `fndczreg`;
CREATE TABLE `fndczreg` (
  `CZRegID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `CZTime` datetime NOT NULL,
  `CardID` char(34) DEFAULT NULL,
  `Holder` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `BankDet` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `Annex` char(36) DEFAULT NULL,
  `CZState` tinyint(4) NOT NULL,
  `FailMsg` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `AdminID` char(36) DEFAULT NULL,
  `ReviewID` char(36) DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`CZRegID`),
  KEY `fk_FndCZReg_UserID` (`UserID`),
  KEY `fk_FndCZReg_AdminID` (`AdminID`),
  KEY `fk_FndCZReg_ReviewID` (`ReviewID`),
  KEY `fk_FndCZReg_FlieID` (`Annex`),
  CONSTRAINT `fk_FndCZReg_AdminID` FOREIGN KEY (`AdminID`) REFERENCES `sysadmin` (`AdminID`),
  CONSTRAINT `fk_FndCZReg_FlieID` FOREIGN KEY (`Annex`) REFERENCES `basfile` (`FlieID`),
  CONSTRAINT `fk_FndCZReg_ReviewID` FOREIGN KEY (`ReviewID`) REFERENCES `sysadmin` (`AdminID`),
  CONSTRAINT `fk_FndCZReg_UserID` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fndczreg
-- ----------------------------

-- ----------------------------
-- Table structure for fnddjreg
-- ----------------------------
DROP TABLE IF EXISTS `fnddjreg`;
CREATE TABLE `fnddjreg` (
  `DJRegID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `BusType` tinyint(4) NOT NULL,
  `BusCode` char(36) NOT NULL,
  `DJTime` datetime NOT NULL,
  `DJMsg` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `JJTime` datetime DEFAULT NULL,
  `JJMsg` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `AdminID` char(36) DEFAULT NULL,
  `DJState` tinyint(4) NOT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`DJRegID`),
  KEY `fk_FndDJReg_UserID` (`UserID`),
  CONSTRAINT `fk_FndDJReg_UserID` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fnddjreg
-- ----------------------------

-- ----------------------------
-- Table structure for fndtxlog
-- ----------------------------
DROP TABLE IF EXISTS `fndtxlog`;
CREATE TABLE `fndtxlog` (
  `TXLogID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `TXRegID` char(36) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `CardID` char(34) NOT NULL,
  `Holder` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `BankDet` varchar(120) CHARACTER SET utf8 NOT NULL,
  `TXTime` datetime NOT NULL,
  `AdminID` char(36) NOT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`TXLogID`),
  KEY `fk_FndTXLog_UserID` (`UserID`),
  KEY `fk_FndTXLog_AdminID` (`AdminID`),
  CONSTRAINT `fk_FndTXLog_AdminID` FOREIGN KEY (`AdminID`) REFERENCES `sysadmin` (`AdminID`),
  CONSTRAINT `fk_FndTXLog_UserID` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fndtxlog
-- ----------------------------

-- ----------------------------
-- Table structure for fndtxreg
-- ----------------------------
DROP TABLE IF EXISTS `fndtxreg`;
CREATE TABLE `fndtxreg` (
  `TXRegID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `TXTime` datetime NOT NULL,
  `CardID` char(34) NOT NULL,
  `Holder` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `BankDet` varchar(120) CHARACTER SET utf8 NOT NULL,
  `TXState` tinyint(4) NOT NULL,
  `FailMsg` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `AdminID` char(36) DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`TXRegID`),
  KEY `fk_FndTXReg_UserID` (`UserID`),
  KEY `fk_FndTXReg_AdminID` (`AdminID`),
  CONSTRAINT `fk_FndTXReg_AdminID` FOREIGN KEY (`AdminID`) REFERENCES `sysadmin` (`AdminID`),
  CONSTRAINT `fk_FndTXReg_UserID` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fndtxreg
-- ----------------------------

-- ----------------------------
-- Table structure for manapproval
-- ----------------------------
DROP TABLE IF EXISTS `manapproval`;
CREATE TABLE `manapproval` (
  `ApprID` char(36) NOT NULL,
  `ApplyID` char(36) NOT NULL,
  `AdminID` char(36) NOT NULL,
  `Opinion` text NOT NULL,
  `ApprTime` datetime NOT NULL,
  `Result` tinyint(4) NOT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`ApprID`),
  KEY `FK_MANAPPRO_REFERENCE_SYSADMIN` (`AdminID`),
  KEY `FK_MANAPPRO_REFERENCE_PTPAPPLY` (`ApplyID`),
  CONSTRAINT `FK_MANAPPRO_REFERENCE_PTPAPPLY` FOREIGN KEY (`ApplyID`) REFERENCES `ptpapply` (`ApplyID`),
  CONSTRAINT `FK_MANAPPRO_REFERENCE_SYSADMIN` FOREIGN KEY (`AdminID`) REFERENCES `sysadmin` (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of manapproval
-- ----------------------------

-- ----------------------------
-- Table structure for manbulletin
-- ----------------------------
DROP TABLE IF EXISTS `manbulletin`;
CREATE TABLE `manbulletin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Message` varchar(500) CHARACTER SET utf8 NOT NULL,
  `MsgType` tinyint(4) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ExpireTime` datetime NOT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of manbulletin
-- ----------------------------

-- ----------------------------
-- Table structure for manmsg
-- ----------------------------
DROP TABLE IF EXISTS `manmsg`;
CREATE TABLE `manmsg` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` char(36) NOT NULL,
  `AdminID` char(36) DEFAULT NULL,
  `Title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Message` varchar(500) CHARACTER SET utf8 NOT NULL,
  `MsgType` tinyint(4) NOT NULL,
  `IsRead` bit(1) NOT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MANMSG_REFERENCE_SYSADMIN` (`AdminID`),
  KEY `FK_MANMSG_REFERENCE_SYSUSER` (`UserID`),
  CONSTRAINT `FK_MANMSG_REFERENCE_SYSADMIN` FOREIGN KEY (`AdminID`) REFERENCES `sysadmin` (`AdminID`),
  CONSTRAINT `FK_MANMSG_REFERENCE_SYSUSER` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of manmsg
-- ----------------------------

-- ----------------------------
-- Table structure for manoverdue
-- ----------------------------
DROP TABLE IF EXISTS `manoverdue`;
CREATE TABLE `manoverdue` (
  `OvrID` char(36) NOT NULL,
  `OvrFKRegID` char(30) NOT NULL,
  `DspState` tinyint(4) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`OvrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of manoverdue
-- ----------------------------

-- ----------------------------
-- Table structure for manverify
-- ----------------------------
DROP TABLE IF EXISTS `manverify`;
CREATE TABLE `manverify` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` char(36) NOT NULL,
  `InfoType` tinyint(4) NOT NULL,
  `VerifyCode` varchar(200) NOT NULL,
  `VerifyType` tinyint(4) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ExpireTime` datetime NOT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MANVERIF_REFERENCE_SYSUSER` (`UserID`),
  CONSTRAINT `FK_MANVERIF_REFERENCE_SYSUSER` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of manverify
-- ----------------------------

-- ----------------------------
-- Table structure for ptpadvance
-- ----------------------------
DROP TABLE IF EXISTS `ptpadvance`;
CREATE TABLE `ptpadvance` (
  `AdvID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `PayUserID` char(36) NOT NULL,
  `AdvType` tinyint(4) NOT NULL,
  `TenderID` char(36) NOT NULL,
  `LimitIndex` smallint(6) NOT NULL,
  `ApplyTime` datetime NOT NULL,
  `DspTime` datetime DEFAULT NULL,
  `DspState` tinyint(4) NOT NULL,
  `AdminID` char(36) DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`AdvID`),
  KEY `FK_PTPADVAN_REFERENCE_PTPLOAN` (`TenderID`),
  KEY `FK_PTPADVAN_REFERENCE_SYSUSER2` (`UserID`),
  KEY `FK_PTPADVAN_REFERENCE_SYSUSER` (`PayUserID`),
  KEY `FK_PTPADVAN_REFERENCE_SYSADMIN` (`AdminID`),
  CONSTRAINT `FK_PTPADVAN_REFERENCE_PTPLOAN` FOREIGN KEY (`TenderID`) REFERENCES `ptploan` (`TenderID`),
  CONSTRAINT `FK_PTPADVAN_REFERENCE_SYSADMIN` FOREIGN KEY (`AdminID`) REFERENCES `sysadmin` (`AdminID`),
  CONSTRAINT `FK_PTPADVAN_REFERENCE_SYSUSER` FOREIGN KEY (`PayUserID`) REFERENCES `sysuser` (`UserID`),
  CONSTRAINT `FK_PTPADVAN_REFERENCE_SYSUSER2` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ptpadvance
-- ----------------------------

-- ----------------------------
-- Table structure for ptpapply
-- ----------------------------
DROP TABLE IF EXISTS `ptpapply`;
CREATE TABLE `ptpapply` (
  `ApplyID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `LoanType` char(36) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `TimeLimit` smallint(6) NOT NULL,
  `AIRate` decimal(6,2) NOT NULL,
  `RepayWays` tinyint(4) NOT NULL,
  `ApprState` tinyint(4) NOT NULL,
  `Description` text NOT NULL,
  `Annex` char(36) DEFAULT NULL,
  `Contacts` char(36) NOT NULL,
  `TEL` varchar(15) NOT NULL,
  `Sex` char(1) NOT NULL,
  `ApplyTime` datetime NOT NULL,
  `AdminID` char(36) DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`ApplyID`),
  KEY `FK_PTPAPPLY_REFERENCE_BASFILEG` (`Annex`),
  KEY `FK_PTPAPPLY_REFERENCE_SYSADMIN` (`AdminID`),
  KEY `FK_PTPAPPLY_REFERENCE_SYSUSER` (`UserID`),
  CONSTRAINT `FK_PTPAPPLY_REFERENCE_BASFILEG` FOREIGN KEY (`Annex`) REFERENCES `basfilegroup` (`GrpID`),
  CONSTRAINT `FK_PTPAPPLY_REFERENCE_SYSADMIN` FOREIGN KEY (`AdminID`) REFERENCES `sysadmin` (`AdminID`),
  CONSTRAINT `FK_PTPAPPLY_REFERENCE_SYSUSER` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ptpapply
-- ----------------------------

-- ----------------------------
-- Table structure for ptpbid
-- ----------------------------
DROP TABLE IF EXISTS `ptpbid`;
CREATE TABLE `ptpbid` (
  `BidID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `RcmID` char(36) DEFAULT NULL,
  `TenderID` char(36) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `Pct` decimal(18,15) NOT NULL,
  `BidTime` datetime NOT NULL,
  `BidType` tinyint(4) NOT NULL,
  `BidState` tinyint(4) NOT NULL,
  `IsTran` bit(1) NOT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`BidID`),
  KEY `FK_PTPBID_REFERENCE_PTPRECOM` (`RcmID`),
  KEY `FK_PTPBID_REFERENCE_PTPLOAN` (`TenderID`),
  KEY `FK_PTPBID_REFERENCE_SYSUSER` (`UserID`),
  CONSTRAINT `FK_PTPBID_REFERENCE_PTPLOAN` FOREIGN KEY (`TenderID`) REFERENCES `ptploan` (`TenderID`),
  CONSTRAINT `FK_PTPBID_REFERENCE_PTPRECOM` FOREIGN KEY (`RcmID`) REFERENCES `ptprecommend` (`RcmID`),
  CONSTRAINT `FK_PTPBID_REFERENCE_SYSUSER` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ptpbid
-- ----------------------------

-- ----------------------------
-- Table structure for ptpbuy
-- ----------------------------
DROP TABLE IF EXISTS `ptpbuy`;
CREATE TABLE `ptpbuy` (
  `BuyID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `TranID` char(36) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `Pct` decimal(18,15) NOT NULL,
  `BuyTime` datetime NOT NULL,
  `IsTran` bit(1) NOT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`BuyID`),
  KEY `FK_PTPBUY_REFERENCE_PTPTRANS` (`TranID`),
  CONSTRAINT `FK_PTPBUY_REFERENCE_PTPTRANS` FOREIGN KEY (`TranID`) REFERENCES `ptptransfer` (`TranID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ptpbuy
-- ----------------------------

-- ----------------------------
-- Table structure for ptploan
-- ----------------------------
DROP TABLE IF EXISTS `ptploan`;
CREATE TABLE `ptploan` (
  `TenderID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `LoanType` char(36) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `TimeLimit` smallint(6) NOT NULL,
  `AIRate` decimal(6,2) NOT NULL,
  `RepayWays` tinyint(4) NOT NULL,
  `Description` text NOT NULL,
  `RCOpinion` text NOT NULL,
  `Guarantee` text,
  `Mortgage` text,
  `Annex` char(36) DEFAULT NULL,
  `BServRate` decimal(6,2) NOT NULL,
  `LServRate` decimal(6,2) NOT NULL,
  `BidState` tinyint(4) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `AccrueTime` datetime NOT NULL,
  `ExpireTime` datetime NOT NULL,
  `ApplyID` char(36) DEFAULT NULL,
  `RepUser` char(36) NOT NULL,
  `RepTime` datetime NOT NULL,
  `VerUser` char(36) DEFAULT NULL,
  `VerTime` datetime DEFAULT NULL,
  `Purpose` char(50) NOT NULL,
  `BailUser` char(36) NOT NULL,
  `Protocol` char(36) NOT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`TenderID`),
  KEY `FK_PTPLOAN_REFERENCE_PTPAPPLY` (`ApplyID`),
  KEY `FK_PTPLOAN_REFERENCE_BASFILEG` (`Annex`),
  KEY `FK_PTPLOAN_REFERENCE_SYSADMIN` (`RepUser`),
  KEY `FK_PTPLOAN_REFERENCE_BASPRODU` (`LoanType`),
  KEY `FK_PTPLOAN_REFERENCE_SYSUSER` (`UserID`),
  KEY `FK_PTPLOAN_REFERENCE_SYSADMIN2` (`VerUser`),
  CONSTRAINT `FK_PTPLOAN_REFERENCE_BASFILEG` FOREIGN KEY (`Annex`) REFERENCES `basfilegroup` (`GrpID`),
  CONSTRAINT `FK_PTPLOAN_REFERENCE_BASPRODU` FOREIGN KEY (`LoanType`) REFERENCES `basproduct` (`ProdID`),
  CONSTRAINT `FK_PTPLOAN_REFERENCE_PTPAPPLY` FOREIGN KEY (`ApplyID`) REFERENCES `ptpapply` (`ApplyID`),
  CONSTRAINT `FK_PTPLOAN_REFERENCE_SYSADMIN` FOREIGN KEY (`RepUser`) REFERENCES `sysadmin` (`AdminID`),
  CONSTRAINT `FK_PTPLOAN_REFERENCE_SYSADMIN2` FOREIGN KEY (`VerUser`) REFERENCES `sysadmin` (`AdminID`),
  CONSTRAINT `FK_PTPLOAN_REFERENCE_SYSUSER` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ptploan
-- ----------------------------

-- ----------------------------
-- Table structure for ptprating
-- ----------------------------
DROP TABLE IF EXISTS `ptprating`;
CREATE TABLE `ptprating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TenderID` char(36) NOT NULL,
  `BidID` char(36) DEFAULT NULL,
  `UserID` char(36) NOT NULL,
  `Content` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `Score` tinyint(4) NOT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PTPRATIN_REFERENCE_PTPBID` (`BidID`),
  KEY `FK_PTPRATIN_REFERENCE_PTPLOAN` (`TenderID`),
  KEY `FK_PTPRATIN_REFERENCE_SYSUSER` (`UserID`),
  CONSTRAINT `FK_PTPRATIN_REFERENCE_PTPBID` FOREIGN KEY (`BidID`) REFERENCES `ptpbid` (`BidID`),
  CONSTRAINT `FK_PTPRATIN_REFERENCE_PTPLOAN` FOREIGN KEY (`TenderID`) REFERENCES `ptploan` (`TenderID`),
  CONSTRAINT `FK_PTPRATIN_REFERENCE_SYSUSER` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ptprating
-- ----------------------------

-- ----------------------------
-- Table structure for ptprecommend
-- ----------------------------
DROP TABLE IF EXISTS `ptprecommend`;
CREATE TABLE `ptprecommend` (
  `RcmID` char(36) NOT NULL,
  `TenderID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `RcmType` tinyint(4) NOT NULL,
  `RcmNmae` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `RcmPhone` char(11) DEFAULT NULL,
  `RcmCode` varchar(20) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `Rate` decimal(6,2) NOT NULL,
  `ExpireTime` datetime NOT NULL,
  `RcmState` tinyint(4) NOT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`RcmID`),
  UNIQUE KEY `UN_PTPRECOM_RECCODE` (`RcmCode`),
  KEY `FK_PTPRECOM_REFERENCE_PTPLOAN` (`TenderID`),
  KEY `FK_PTPRECOM_REFERENCE_SYSUSER` (`UserID`),
  CONSTRAINT `FK_PTPRECOM_REFERENCE_PTPLOAN` FOREIGN KEY (`TenderID`) REFERENCES `ptploan` (`TenderID`),
  CONSTRAINT `FK_PTPRECOM_REFERENCE_SYSUSER` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ptprecommend
-- ----------------------------

-- ----------------------------
-- Table structure for ptpscore
-- ----------------------------
DROP TABLE IF EXISTS `ptpscore`;
CREATE TABLE `ptpscore` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` char(36) NOT NULL,
  `Score` int(11) NOT NULL,
  `ChTime` datetime NOT NULL,
  `ChType` tinyint(4) NOT NULL,
  `RuleCode` char(36) DEFAULT NULL,
  `Reason` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ptpscore
-- ----------------------------

-- ----------------------------
-- Table structure for ptptransfer
-- ----------------------------
DROP TABLE IF EXISTS `ptptransfer`;
CREATE TABLE `ptptransfer` (
  `TranID` char(36) NOT NULL,
  `UserID` char(36) NOT NULL,
  `TenderID` char(36) NOT NULL,
  `AssID` char(36) NOT NULL,
  `AssType` tinyint(4) NOT NULL,
  `Principal` decimal(18,2) NOT NULL,
  `Interest` decimal(18,2) NOT NULL,
  `GuarFee` decimal(18,2) NOT NULL,
  `TimeLimit` smallint(6) NOT NULL,
  `SurpLimit` smallint(6) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `Description` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `TranState` tinyint(4) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`TranID`),
  KEY `FK_PTPTRANS_REFERENCE_PTPLOAN` (`TenderID`),
  CONSTRAINT `FK_PTPTRANS_REFERENCE_PTPLOAN` FOREIGN KEY (`TenderID`) REFERENCES `ptploan` (`TenderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ptptransfer
-- ----------------------------

-- ----------------------------
-- Table structure for sysadmin
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin`;
CREATE TABLE `sysadmin` (
  `AdminID` char(36) NOT NULL,
  `Password` char(32) NOT NULL,
  `RoleID` char(36) NOT NULL,
  `JobID` char(36) NOT NULL,
  `OrgCode` char(36) NOT NULL,
  `Post` varchar(20) CHARACTER SET utf8 NOT NULL,
  `RealName` varchar(15) CHARACTER SET utf8 NOT NULL,
  `Card` char(18) DEFAULT NULL,
  `TEL` varchar(15) DEFAULT NULL,
  `Phone` char(11) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `Address` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Fax` varchar(15) DEFAULT NULL,
  `Province` char(6) DEFAULT NULL,
  `City` char(6) DEFAULT NULL,
  `County` char(6) DEFAULT NULL,
  `ZipCode` char(6) DEFAULT NULL,
  `Sex` char(1) NOT NULL,
  `BirthType` tinyint(4) DEFAULT NULL,
  `BirthYear` smallint(6) DEFAULT NULL,
  `BirthMonth` tinyint(4) DEFAULT NULL,
  `BirthDay` tinyint(4) DEFAULT NULL,
  `IsLog` bit(1) NOT NULL,
  `LoginExpire` datetime NOT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `UN_SYSADMIN_JOBID` (`JobID`),
  KEY `FK_SYSADMIN_REFERENCE_SYSROLE` (`RoleID`),
  KEY `FK_SYSADMIN_REFERENCE_SYSORG` (`OrgCode`),
  KEY `FK_SYSADMIN_REFERENCE_BASREGIO` (`Province`),
  KEY `FK_SYSADMIN_REFERENCE_BASREGIO2` (`City`),
  KEY `FK_SYSADMIN_REFERENCE_BASREGIO3` (`County`),
  CONSTRAINT `FK_SYSADMIN_REFERENCE_BASREGIO` FOREIGN KEY (`Province`) REFERENCES `basregion` (`RegiCode`),
  CONSTRAINT `FK_SYSADMIN_REFERENCE_BASREGIO2` FOREIGN KEY (`City`) REFERENCES `basregion` (`RegiCode`),
  CONSTRAINT `FK_SYSADMIN_REFERENCE_BASREGIO3` FOREIGN KEY (`County`) REFERENCES `basregion` (`RegiCode`),
  CONSTRAINT `FK_SYSADMIN_REFERENCE_SYSORG` FOREIGN KEY (`OrgCode`) REFERENCES `sysorg` (`OrgCode`),
  CONSTRAINT `FK_SYSADMIN_REFERENCE_SYSROLE` FOREIGN KEY (`RoleID`) REFERENCES `sysrole` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysadmin
-- ----------------------------

-- ----------------------------
-- Table structure for sysadminlogin
-- ----------------------------
DROP TABLE IF EXISTS `sysadminlogin`;
CREATE TABLE `sysadminlogin` (
  `AdminID` char(36) NOT NULL,
  `LoginTime` datetime NOT NULL,
  `LoginIP` varchar(40) NOT NULL,
  `SessionId` varchar(120) NOT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysadminlogin
-- ----------------------------

-- ----------------------------
-- Table structure for sysautoconfig
-- ----------------------------
DROP TABLE IF EXISTS `sysautoconfig`;
CREATE TABLE `sysautoconfig` (
  `AppCode` varchar(60) NOT NULL,
  `AppName` varchar(60) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Cycle` tinyint(4) NOT NULL,
  `LastTime` datetime DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`AppCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysautoconfig
-- ----------------------------

-- ----------------------------
-- Table structure for sysautolog
-- ----------------------------
DROP TABLE IF EXISTS `sysautolog`;
CREATE TABLE `sysautolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AppCode` varchar(60) NOT NULL,
  `RunTime` datetime NOT NULL,
  `Result` bit(1) NOT NULL,
  `Message` text,
  PRIMARY KEY (`ID`),
  KEY `FK_SYSAUTOL_REFERENCE_SYSAUTOC` (`AppCode`),
  CONSTRAINT `FK_SYSAUTOL_REFERENCE_SYSAUTOC` FOREIGN KEY (`AppCode`) REFERENCES `sysautoconfig` (`AppCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysautolog
-- ----------------------------

-- ----------------------------
-- Table structure for syscode
-- ----------------------------
DROP TABLE IF EXISTS `syscode`;
CREATE TABLE `syscode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeCode` char(60) NOT NULL,
  `CodeCode` varchar(36) NOT NULL,
  `CodeClass` varchar(36) DEFAULT NULL,
  `CodeName` varchar(40) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `OthCond` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `OrderDesc` smallint(6) DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SYSCODE_REFERENCE_SYSTYPE` (`TypeCode`),
  CONSTRAINT `FK_SYSCODE_REFERENCE_SYSTYPE` FOREIGN KEY (`TypeCode`) REFERENCES `systype` (`TypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of syscode
-- ----------------------------

-- ----------------------------
-- Table structure for sysconfig
-- ----------------------------
DROP TABLE IF EXISTS `sysconfig`;
CREATE TABLE `sysconfig` (
  `CfgCode` char(40) NOT NULL,
  `CfgName` varchar(40) CHARACTER SET utf8 NOT NULL,
  `CfgClass` tinyint(4) DEFAULT NULL,
  `CfgValue` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `IsDeploy` bit(1) NOT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`CfgCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysconfig
-- ----------------------------

-- ----------------------------
-- Table structure for sysexception
-- ----------------------------
DROP TABLE IF EXISTS `sysexception`;
CREATE TABLE `sysexception` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HelpLink` varchar(200) DEFAULT NULL,
  `Message` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `Source` varchar(200) DEFAULT NULL,
  `StackTrace` text,
  `TargetSite` varchar(200) DEFAULT NULL,
  `Data` text,
  `ExcpTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysexception
-- ----------------------------

-- ----------------------------
-- Table structure for sysfundop
-- ----------------------------
DROP TABLE IF EXISTS `sysfundop`;
CREATE TABLE `sysfundop` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SerieID` char(36) NOT NULL,
  `TransID` char(40) NOT NULL,
  `OpType` tinyint(4) NOT NULL,
  `Account` varchar(40) NOT NULL,
  `ToAccount` varchar(40) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `OpTime` datetime NOT NULL,
  `OthCond` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Result` bit(1) NOT NULL,
  `Message` text NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysfundop
-- ----------------------------

-- ----------------------------
-- Table structure for sysloanexception
-- ----------------------------
DROP TABLE IF EXISTS `sysloanexception`;
CREATE TABLE `sysloanexception` (
  `TenderID` char(36) NOT NULL,
  `Flag` char(60) NOT NULL,
  `State` tinyint(4) NOT NULL,
  `InpTime` datetime NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`TenderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysloanexception
-- ----------------------------

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MdlCode` char(36) NOT NULL,
  `OpCode` char(36) NOT NULL,
  `OpTime` datetime NOT NULL,
  `PerID` char(36) NOT NULL,
  `PerType` tinyint(4) NOT NULL,
  `Result` bit(1) NOT NULL,
  `BeforeMessage` text,
  `AfterMessage` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of syslog
-- ----------------------------

-- ----------------------------
-- Table structure for sysmdlop
-- ----------------------------
DROP TABLE IF EXISTS `sysmdlop`;
CREATE TABLE `sysmdlop` (
  `CfgID` char(36) NOT NULL,
  `MdlCode` char(36) NOT NULL,
  `OpCode` char(36) NOT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`CfgID`),
  KEY `FK_SYSMDLOP_REFERENCE_SYSOPERA` (`OpCode`),
  KEY `FK_SYSMDLOP_REFERENCE_SYSMODUL` (`MdlCode`),
  CONSTRAINT `FK_SYSMDLOP_REFERENCE_SYSMODUL` FOREIGN KEY (`MdlCode`) REFERENCES `sysmodule` (`MdlCode`),
  CONSTRAINT `FK_SYSMDLOP_REFERENCE_SYSOPERA` FOREIGN KEY (`OpCode`) REFERENCES `sysoperate` (`OpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysmdlop
-- ----------------------------

-- ----------------------------
-- Table structure for sysmodule
-- ----------------------------
DROP TABLE IF EXISTS `sysmodule`;
CREATE TABLE `sysmodule` (
  `MdlCode` char(36) NOT NULL,
  `MdlName` varchar(60) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `AnotherCode` char(36) DEFAULT NULL,
  `AbbName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `EnName` varchar(120) DEFAULT NULL,
  `MdlType` tinyint(4) NOT NULL,
  `MdlClass` tinyint(4) NOT NULL,
  `UpCode` char(36) DEFAULT NULL,
  `LinkUrl` varchar(200) DEFAULT NULL,
  `IcoUrl` varchar(200) DEFAULT NULL,
  `OrderDesc` smallint(6) DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MdlCode`),
  KEY `FK_SYSMODUL_REFERENCE_SYSMODUL` (`UpCode`),
  CONSTRAINT `FK_SYSMODUL_REFERENCE_SYSMODUL` FOREIGN KEY (`UpCode`) REFERENCES `sysmodule` (`MdlCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysmodule
-- ----------------------------

-- ----------------------------
-- Table structure for sysoperate
-- ----------------------------
DROP TABLE IF EXISTS `sysoperate`;
CREATE TABLE `sysoperate` (
  `OpCode` char(36) NOT NULL,
  `OpName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `OrderDesc` smallint(6) DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`OpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysoperate
-- ----------------------------

-- ----------------------------
-- Table structure for sysorg
-- ----------------------------
DROP TABLE IF EXISTS `sysorg`;
CREATE TABLE `sysorg` (
  `OrgCode` char(36) NOT NULL,
  `OrgName` varchar(40) CHARACTER SET utf8 NOT NULL,
  `UpCode` char(36) DEFAULT NULL,
  `Description` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`OrgCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysorg
-- ----------------------------

-- ----------------------------
-- Table structure for syspowr
-- ----------------------------
DROP TABLE IF EXISTS `syspowr`;
CREATE TABLE `syspowr` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` char(36) NOT NULL,
  `MdlCode` char(36) NOT NULL,
  `OpCode` char(36) NOT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SYSPOWR_REFERENCE_SYSROLE` (`RoleID`),
  KEY `FK_SYSPOWR_REFERENCE_SYSOPERA` (`OpCode`),
  KEY `FK_SYSPOWR_REFERENCE_SYSMODUL` (`MdlCode`),
  CONSTRAINT `FK_SYSPOWR_REFERENCE_SYSMODUL` FOREIGN KEY (`MdlCode`) REFERENCES `sysmodule` (`MdlCode`),
  CONSTRAINT `FK_SYSPOWR_REFERENCE_SYSOPERA` FOREIGN KEY (`OpCode`) REFERENCES `sysoperate` (`OpCode`),
  CONSTRAINT `FK_SYSPOWR_REFERENCE_SYSROLE` FOREIGN KEY (`RoleID`) REFERENCES `sysrole` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of syspowr
-- ----------------------------

-- ----------------------------
-- Table structure for sysrole
-- ----------------------------
DROP TABLE IF EXISTS `sysrole`;
CREATE TABLE `sysrole` (
  `RoleID` char(36) NOT NULL,
  `RoleName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `RoleType` tinyint(4) NOT NULL,
  `Description` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `State` tinyint(4) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysrole
-- ----------------------------

-- ----------------------------
-- Table structure for syssmslog
-- ----------------------------
DROP TABLE IF EXISTS `syssmslog`;
CREATE TABLE `syssmslog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Phone` char(11) NOT NULL,
  `PerType` tinyint(4) NOT NULL,
  `PerID` char(36) DEFAULT NULL,
  `Content` varchar(400) CHARACTER SET utf8 NOT NULL,
  `Result` bit(1) NOT NULL,
  `Message` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of syssmslog
-- ----------------------------

-- ----------------------------
-- Table structure for systype
-- ----------------------------
DROP TABLE IF EXISTS `systype`;
CREATE TABLE `systype` (
  `TypeCode` char(60) NOT NULL,
  `TypeName` varchar(60) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`TypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of systype
-- ----------------------------

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `UserID` char(36) NOT NULL,
  `Password` char(32) NOT NULL,
  `PayPassword` char(32) DEFAULT NULL,
  `RoleID` char(36) NOT NULL,
  `UserType` tinyint(4) NOT NULL,
  `AssAccount` varchar(40) DEFAULT NULL,
  `IsBind` bit(1) NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `Freeze` decimal(18,2) NOT NULL,
  `Score` int(11) NOT NULL,
  `RcmCode` varchar(20) NOT NULL,
  `RcmUser` char(36) DEFAULT NULL,
  `OpenID` char(28) DEFAULT NULL,
  `Security` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Question` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Answer` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `IsLog` bit(1) NOT NULL,
  `LoginExpire` datetime NOT NULL,
  `RegTime` datetime NOT NULL,
  `State` tinyint(4) NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UN_SYSUSER_OPENID` (`RcmCode`),
  KEY `FK_SYSUSER_REFERENCE_SYSROLE` (`RoleID`),
  CONSTRAINT `FK_SYSUSER_REFERENCE_SYSROLE` FOREIGN KEY (`RoleID`) REFERENCES `sysrole` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysuser
-- ----------------------------

-- ----------------------------
-- Table structure for sysuseratenterprise
-- ----------------------------
DROP TABLE IF EXISTS `sysuseratenterprise`;
CREATE TABLE `sysuseratenterprise` (
  `UserID` char(36) NOT NULL,
  `EntName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `AllName` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `BL` char(15) NOT NULL,
  `OC` char(10) NOT NULL,
  `TR` char(20) NOT NULL,
  `OP` char(18) NOT NULL,
  `LR` varchar(15) CHARACTER SET utf8 NOT NULL,
  `Card` char(18) NOT NULL,
  `TEL` varchar(15) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `Fax` varchar(15) DEFAULT NULL,
  `ZipCode` char(6) DEFAULT NULL,
  `Address` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `fk_SYSUSERE_UserID` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysuseratenterprise
-- ----------------------------

-- ----------------------------
-- Table structure for sysuseratpersonal
-- ----------------------------
DROP TABLE IF EXISTS `sysuseratpersonal`;
CREATE TABLE `sysuseratpersonal` (
  `UserID` char(36) NOT NULL,
  `RealName` varchar(15) CHARACTER SET utf8 NOT NULL,
  `Card` char(18) NOT NULL,
  `Sex` char(1) NOT NULL,
  `Phone` char(11) NOT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `ZipCode` char(6) DEFAULT NULL,
  `Address` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `fk_SYSUSERP_UserID` FOREIGN KEY (`UserID`) REFERENCES `sysuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sysuseratpersonal
-- ----------------------------

-- ----------------------------
-- Table structure for wxreceive
-- ----------------------------
DROP TABLE IF EXISTS `wxreceive`;
CREATE TABLE `wxreceive` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OpenID` char(28) NOT NULL,
  `MsgType` varchar(20) NOT NULL,
  `Content` text NOT NULL,
  `CompleteMsg` text NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wxreceive
-- ----------------------------
