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
manufacturer VARCHAR(30),
prodcategory int NOT NULL,
index prodcategory(prodcategory),
foreign key (prodcategory) references productgroup(id)
on delete restrict
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE discproperty (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    disc INTEGER NOT NULL,
    type VARCHAR(20),
    plastic VARCHAR(20),
    speed INTEGER,
    glide INTEGER,
    turn INTEGER,
    fade INTEGER,
    foreign key (disc) references product(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into product (name, price, manufacturer, prodcategory) values 
('Innova DX Valkyrie', 'Innova'10.90, 1),
('Innova Star Boss', 'Innova', 18.90, 1),
('Innova DX Leopard', 'Innova', 10.90, 1),
('Innova DX Aero', 'Innova', 12.90, 1),
('Innova DX Aviar', 'Innova', 10.90, 1),
('Innova DX Archangel', 'Innova', 10.90, 1),
('Innova Champion Krait', 'Innova', 17.90, 1),
('Innova Champion TeeBird', 'Innova', 20.90, 1),
('Prodigy 400 D3', 'Prodigy', 17.90, 1),
('Westside Discs BT Origio Pohjan Poika', 'Westside Discs', 10.90, 1);

insert into discproperty (disc, type, plastic, speed, glide, turn, fade) values
(1, 'Pituusdraiveri', 'DX', 9, 4, -2, 2),
(2, 'Pituusdraiveri', 'Star', 13, 5, -1, 3),
(3, 'Väylädraiveri', 'DX', 6, 5, -2, 1),
(4, 'Putteri', 'DX', 3, 6, 0, 0),
(5, 'Putteri', 'DX', 2, 3, 0, 1),
(6, 'Pituusdraiveri', 'DX', 8, 6, -4, 1),
(7, 'Pituusdraiveri', 'Champion', 11, 5, -1, 2),
(8, 'Väylädraiveri', 'Champion', 7, 5, 0, 2),
(9, 'Pituusdraiveri', '400', 13, 6, -2, 2),
(10, 'Pituusdraiveri', 'BT Origio', 10, 5, -1, 2);

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