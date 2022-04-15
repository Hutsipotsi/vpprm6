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


insert into product (name, price, image, manufacturer, prodcategory) values 
('Innova DX Valkyrie', 10.90, 'innova_dx_valkyrie.jpg', 'Innova', 1),
('Innova Star Boss', 18.90, 'innova_star_boss.jpg', 'Innova', 1),
('Innova DX Leopard', 10.90, 'innova_dx_leopard.jpg', 'Innova', 1),
('Innova DX Aero', 12.90, 'innova_dx_aero.jpg', 'Innova', 1),
('Innova DX Aviar', 10.90, 'innova_dx_aviar.jpg', 'Innova', 1),
('Innova DX Archangel', 10.90, 'innova_dx_archangel.jpg', 'Innova', 1),
('Innova Champion Krait', 17.90, 'innova_champion_krait.jpg', 'Innova', 1),
('Innova Champion TeeBird', 20.90, 'innova_champion_teebird.jpg', 'Innova', 1),
('Prodigy 400 D3', 17.90, 'prodigy_400_d3.jpg', 'Prodigy', 1),
('Westside Discs BT Origio Pohjan Poika', 10.90, 'westside-discs_bt-origio_pohjan-poika.jpg', 'Westside Discs', 1);

insert into product (name, price, image, prodcategory) values 
('Viking Discs Royal Basket', 169.90, 'disc-golf3.jpg', 2);

insert into product (name, price, image, prodcategory) values
('DISCatcher Traveler', 149.00, 'disc-golf4.jpg', 2),
('DISCatcher EZ Target', 199.00, 'disc-golf5.jpg', 2);

insert into product (name, price, image, prodcategory) values
('GRIPeq G2 Shoulder Bag', 129.00, 'backpack.png', 3),
('GRIPeq BX3 Tour Bag', 129.00, 'disc-golf-bag.jpg', 3),
('Innova Discover Pack', 29.90, 'disc-golf-bag.jpg', 3),
('Super HeroPack 2.0', 129.00, 'backpack.png', 3);

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