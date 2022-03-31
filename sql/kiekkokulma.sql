DROP DATABASE IF EXISTS kiekkokulma;

CREATE DATABASE kiekkokulma;

CREATE TABLE productgroup (
prodcategory SMALLINT PRIMARY KEY,
groupname CHAR(10)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into productgroup (groupname) values ('disc');
insert into productgroup (groupname) values ('basket');
insert into productgroup (groupname) values ('bag');

CREATE TABLE product (
prodnumber INTEGER PRIMARY KEY AUTO_INCREMENT,
prodname VARCHAR(100) NOT NULL,
price DECIMAL(10,2),
cost DECIMAL(10,2),
prodcategory VARCHAR(40) NOT NULL,
index prodcategory(prodcategory)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into product (prodname, price, prodcategory) values ('basket', 10, 'baskets');
insert into product (prodname, price, prodcategory) values ('disc', 10, 'discs');

CREATE TABLE customer (
 cusname VARCHAR(8) PRIMARY KEY,
 name VARCHAR(20) NOT NULL,
 contact VARCHAR(15),
 street VARCHAR(40),
 postal CHAR(5),
 city VARCHAR(20),
 phone VARCHAR(20))
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

 CREATE TABLE customorder (
 ordernumber INTEGER PRIMARY KEY,
 cusname VARCHAR(8) NOT NULL,
 orderdate DATETIME NOT NULL,
 mode CHAR(1),
 savedate DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

 CREATE TABLE orderrow (
ordernumber INTEGER PRIMARY KEY NOT NULL,
rownumber SMALLINT NOT NULL,
prodnumber INTEGER NOT NULL,
pcs INTEGER NOT NULL,
FOREIGN KEY (ordernumber)
REFERENCES customorder (ordernumber)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;