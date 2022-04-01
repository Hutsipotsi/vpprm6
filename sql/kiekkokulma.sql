DROP DATABASE IF EXISTS kiekkokulma;

CREATE DATABASE kiekkokulma;

USE kiekkokulma;

CREATE TABLE productgroup (
id int PRIMARY KEY AUTO_INCREMENT,
name CHAR(10)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into productgroup (name) values ('Kiekot'), ('Korit'), ('Reput');

CREATE TABLE product (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
price DECIMAL(10,2),
image VARCHAR(50),
cost DECIMAL(10,2),
prodcategory int NOT NULL,
index prodcategory(prodcategory),
foreign key (prodcategory) references productgroup(id)
on delete restrict
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into product (name, price, prodcategory) values 
('DX Valkyrie', 10.90, 1),
('Star Boss', 18.90, 1),
('DX Leopard', 10.90, 1),
('DX Aero', 12.90, 1),
('DX Archangel', 10.90, 1),
('Champion Krait', 17.90, 1);
insert into product (name, price, prodcategory) values
('DISCatcher Traveler', 149.00, 2),
('DISCatcher EZ Target', 199.00, 2);
insert into product (name, price, prodcategory) values
('GRIPeq G2 Shoulder Bag', 129.00, 3),
('GRIPeq BX3 Tour Bag', 129.00, 3),
('Innova Discover Pack', 29.90, 3),
('Super HeroPack 2.0', 129.00, 3);

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