CREATE TABLE product (
 prodnumber INTEGER PRIMARY KEY,
 prodname VARCHAR(20) NOT NULL,
 price DECIMAL(5,2),
 cost DECIMAL(5,2),
 prodcategory SMALLINT NOT NULL,
 FOREIGN KEY (prodcategory)
 REFERENCES productgroup (prodcategory)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_sv_0900_ai_ci;