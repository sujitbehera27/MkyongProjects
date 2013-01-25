/*
SQLyog Community v8.82 
MySQL - 5.1.32-community : Database - tcmsappdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE tcmsappdb ;

USE tcmsappdb;

/*Table structure for table clientdetails */

DROP TABLE IF EXISTS clientdetails;

CREATE TABLE clientdetails (
  clientId smallint(6) NOT NULL AUTO_INCREMENT,
  createdOn datetime NOT NULL,
  description varchar(60) DEFAULT NULL,
  isExist bit(1) NOT NULL,
  lastupdated datetime DEFAULT NULL,
  name varchar(30) NOT NULL,
  PRIMARY KEY (clientId),
  UNIQUE KEY clientId (clientId),
  UNIQUE KEY name (name),
  UNIQUE KEY name_2 (name)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table clientdetails */

insert  into clientdetails(clientId,createdOn,description,isExist,lastupdated,name) values (1,'2012-01-01 01:01:00','client1','',NULL,'client1');

/*Table structure for table productdetails */

DROP TABLE IF EXISTS productdetails;

CREATE TABLE productdetails (
  prdId smallint(6) NOT NULL AUTO_INCREMENT,
  createdOn datetime NOT NULL,
  description varchar(60) DEFAULT NULL,
  isExist bit(1) NOT NULL,
  lastupdated datetime DEFAULT NULL,
  name varchar(30) NOT NULL,
  clientid smallint(6) NOT NULL,
  PRIMARY KEY (prdId),
  UNIQUE KEY prdId (prdId),
  KEY FKF1A68A73347839BE (clientid),
  CONSTRAINT FKF1A68A73347839BE FOREIGN KEY (clientid) REFERENCES clientdetails (clientId)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table productdetails */

insert  into productdetails(prdId,createdOn,description,isExist,lastupdated,name,clientid) values (1,'2012-01-01 01:01:00','prd1','',NULL,'PRD1',1),(2,'2012-01-01 01:01:00','prd2','',NULL,'PRD2',1);

/*Table structure for table producttestcases */

DROP TABLE IF EXISTS producttestcases;

CREATE TABLE producttestcases (
  testcaseid int(11) NOT NULL AUTO_INCREMENT,
  createdOn datetime NOT NULL,
  description longtext NOT NULL,
  exec_type varchar(13) NOT NULL,
  name varchar(36) NOT NULL,
  severity varchar(15) DEFAULT NULL,
  type varchar(9) NOT NULL,
  testsuiteid int(11) DEFAULT NULL,
  lastupdated datetime DEFAULT NULL,
  PRIMARY KEY (testcaseid),
  UNIQUE KEY testcaseid (testcaseid),
  KEY FK51A101E2FBBABFB7 (testsuiteid),
  CONSTRAINT FK51A101E2FBBABFB7 FOREIGN KEY (testsuiteid) REFERENCES producttestsuite (testSuiteId)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table producttestcases */

insert  into producttestcases(testcaseid,createdOn,description,exec_type,name,severity,type,testsuiteid,lastupdated) values (1,'2012-02-21 18:40:54','tc1','automated','testcase1',NULL,'positive',1,NULL),(2,'2012-02-21 18:41:01','tc2','automated','testcase2',NULL,'positive',1,NULL),(3,'2012-02-21 18:41:34','tc1','nonautomated','testcase1',NULL,'positive',2,NULL),(4,'2012-02-21 18:41:44','tc12','automated','testcase2',NULL,'negative',2,NULL),(5,'2012-02-23 16:47:11','tcase10','automated','tcase10',NULL,'negative',1,NULL),(6,'2012-02-23 16:50:40','tcase10','automated','tcase10',NULL,'negative',1,NULL),(7,'2012-02-23 16:51:34','tcase10','automated','tcase10',NULL,'negative',1,NULL),(8,'2012-02-23 17:33:52','tcase10','automated','tcase10',NULL,'negative',1,NULL),(9,'2012-02-23 17:34:18','tcase10','automated','tcase10',NULL,'negative',1,NULL),(10,'2012-02-23 17:37:48','tcase10','automated','tcase10',NULL,'negative',1,NULL),(11,'2012-02-23 17:38:14','tcase10','automated','tcase10',NULL,'negative',1,NULL),(12,'2012-02-23 17:52:14','tcase10','automated','tcase10',NULL,'negative',1,NULL),(13,'2012-02-23 17:52:42','tcase10','automated','tcase10',NULL,'negative',1,NULL),(27,'2012-02-24 12:25:37','tcase10','automated','tcase10',NULL,'negative',1,NULL),(28,'2012-02-24 12:26:13','tcase10','automated','tcase10',NULL,'negative',1,NULL),(29,'2012-02-24 12:30:06','des','automated','testcase1',NULL,'positive',3,NULL);

/*Table structure for table producttestsuite */

DROP TABLE IF EXISTS producttestsuite;

CREATE TABLE producttestsuite (
  testSuiteId int(11) NOT NULL AUTO_INCREMENT,
  createdOn datetime NOT NULL,
  lastupdatedon datetime DEFAULT NULL,
  name varchar(36) NOT NULL,
  testSuiteDesc longtext NOT NULL,
  clientId smallint(6) NOT NULL,
  productId smallint(6) NOT NULL,
  PRIMARY KEY (testSuiteId),
  UNIQUE KEY testSuiteId (testSuiteId),
  KEY FK528B6D97347839BE (clientId),
  KEY FK528B6D973C08895C (productId),
  CONSTRAINT FK528B6D973C08895C FOREIGN KEY (productId) REFERENCES productdetails (prdId),
  CONSTRAINT FK528B6D97347839BE FOREIGN KEY (clientId) REFERENCES clientdetails (clientId)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table producttestsuite */

insert  into producttestsuite(testSuiteId,createdOn,lastupdatedon,name,testSuiteDesc,clientId,productId) values (1,'2012-01-01 01:01:00',NULL,'TSUTE1','est\r\n',1,1),(2,'2012-01-01 01:01:00',NULL,'TSUIT2','sad\r\n',1,1),(3,'2012-01-01 01:01:00',NULL,'TSUIP2','adad\r\n\r\n',1,2),(4,'2012-01-01 01:01:00',NULL,'TSUIP1','dfsafdsa',1,2);

/*Table structure for table testcasehistory */

DROP TABLE IF EXISTS testcasehistory;

CREATE TABLE testcasehistory (
  TransId int(11) NOT NULL AUTO_INCREMENT,
  execDate datetime NOT NULL,
  result varchar(5) DEFAULT NULL,
  testcaseId int(11) NOT NULL,
  userid smallint(6) NOT NULL,
  PRIMARY KEY (TransId),
  UNIQUE KEY TransId (TransId),
  KEY FK6760FF92659B861E (testcaseId),
  KEY FK6760FF924BC225FE (userid),
  CONSTRAINT FK6760FF924BC225FE FOREIGN KEY (userid) REFERENCES userdetails (userid),
  CONSTRAINT FK6760FF92659B861E FOREIGN KEY (testcaseId) REFERENCES producttestcases (testcaseid)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table testcasehistory */

insert  into testcasehistory(TransId,execDate,result,testcaseId,userid) values (1,'2012-02-22 18:44:22','fail',1,1),(2,'2012-02-23 13:14:41','pass',1,1),(3,'2012-02-23 13:15:36','pass',1,1),(4,'2012-02-23 13:41:49','pass',1,1),(5,'2012-02-23 13:42:20','pass',1,1),(6,'2012-02-23 14:57:34','pass',1,1),(7,'2012-02-23 14:58:02','pass',1,1),(8,'2012-02-23 16:50:41','pass',1,1),(9,'2012-02-23 16:51:35','pass',1,1),(10,'2012-02-23 17:33:53','pass',1,1),(11,'2012-02-23 17:34:20','pass',1,1),(12,'2012-02-23 17:37:50','pass',1,1),(13,'2012-02-23 17:38:15','pass',1,1),(14,'2012-02-23 17:52:15','pass',1,1),(15,'2012-02-23 17:52:43','pass',1,1),(16,'2012-02-23 17:57:49','pass',1,1),(17,'2012-02-23 18:02:18','pass',1,1),(18,'2012-02-23 18:02:49','pass',1,1),(19,'2012-02-23 18:03:15','pass',1,1),(20,'2012-02-23 18:04:10','pass',1,1),(21,'2012-02-23 18:04:36','pass',1,1),(22,'2012-02-23 18:17:28','pass',1,1),(23,'2012-02-23 18:19:38','pass',1,1),(24,'2012-02-23 18:20:07','pass',1,1),(25,'2012-02-24 10:17:22','pass',1,1),(26,'2012-02-24 10:17:54','pass',1,1),(27,'2012-02-24 10:29:43','pass',1,1),(28,'2012-02-24 10:30:10','pass',1,1),(29,'2012-02-24 12:25:38','pass',1,1),(30,'2012-02-24 12:26:14','pass',1,1);

/*Table structure for table userdetails */

DROP TABLE IF EXISTS userdetails;

CREATE TABLE userdetails (
  userid smallint(6) NOT NULL AUTO_INCREMENT,
  createdOn datetime NOT NULL,
  name varchar(30) NOT NULL,
  password varchar(30) NOT NULL,
  clientid smallint(6) DEFAULT NULL,
  userrole smallint(6) DEFAULT NULL,
  PRIMARY KEY (userid),
  UNIQUE KEY userid (userid),
  UNIQUE KEY name (name),
  UNIQUE KEY name_2 (name),
  KEY FKE7A23C17347839BE (clientid),
  KEY FKE7A23C1797AE6561 (userrole),
  CONSTRAINT FKE7A23C1797AE6561 FOREIGN KEY (userrole) REFERENCES userrole (RoleId),
  CONSTRAINT FKE7A23C17347839BE FOREIGN KEY (clientid) REFERENCES clientdetails (clientId),
  CONSTRAINT FK_userrole FOREIGN KEY (userrole) REFERENCES userrole (RoleId)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table userdetails */

insert  into userdetails(userid,createdOn,name,password,clientid,userrole) values (1,'2012-01-01 01:01:00','testusr1','1234',1,NULL);

/*Table structure for table userrole */

DROP TABLE IF EXISTS userrole;

CREATE TABLE userrole (
  RoleId smallint(6) NOT NULL AUTO_INCREMENT,
  RoleName varchar(25) NOT NULL,
  Description varchar(50) DEFAULT NULL,
  PRIMARY KEY (RoleId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table userrole */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;