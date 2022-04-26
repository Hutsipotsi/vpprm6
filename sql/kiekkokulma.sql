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
('Viking Discs Royal', 169.90, 'disc-catcher3.jpg', 2);

insert into product (name, price, image, prodcategory) values
('DISCatcher Traveler', 149.00, 'disc-catcher4.jpg', 2),
('DISCatcher EZ Target', 199.00, 'disc-catcher2.jpg', 2);

insert into product (name, price, image, prodcategory) values
('GRIPeq G2 Shoulder Bag', 129.00, 'backpack.png', 3),
('GRIPeq BX3 Tour Bag', 129.00, 'bag1.jpg', 3),
('Innova Discover Pack', 29.90, 'bag2.jpg', 3),
('Super HeroPack 2.0', 129.00, 'bag3.jpg', 3);

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
    id int primary key auto_increment,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    contact VARCHAR(15),
    street VARCHAR(40),
    postal CHAR(5),
    city VARCHAR(20),
    phone VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

 CREATE TABLE customorder (
     id int primary key auto_increment,
     order_date timestamp default current_timestamp,
     customer_id int not null,
     index customer_id(customer_id),
     foreign key (customer_id) references customer(id) on delete restrict
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

 CREATE TABLE orderrow (
     order_id int not null,
     index order_id(order_id),
     foreign key (order_id) references customorder(id) on delete restrict,
     product_id int not null,
     index product_id(product_id),
     foreign key (product_id) references product(id) on delete restrict,
     pcs int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE registered_user(  
    reg_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(70) NOT NULL,
    lname VARCHAR(70) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE sale (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
discount DECIMAL(10,2),
prod_id int NOT NULL,
foreign key (prod_id) references product(id)
on delete restrict
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO sale (discount, prod_id) VALUES
(20, 12),
(20, 13),
(20, 10),
(10, 14),
(10, 7),
(15, 11);