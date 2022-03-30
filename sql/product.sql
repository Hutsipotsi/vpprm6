
CREATE TABLE product (
prodnumber INTEGER PRIMARY KEY AUTO_INCREMENT,
prodname VARCHAR(100) NOT NULL,
price DECIMAL(10,2),
cost DECIMAL(10,2),
prodcategory VARCHAR(40) NOT NULL,
index prodcategory(prodcategory));
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into product (prodname, price, prodcategory) values ('basket', 10, 'baskets');
insert into product (prodname, price, prodcategory) values ('disc', 10, 'discs');