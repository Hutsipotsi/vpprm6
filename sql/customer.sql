CREATE TABLE customer (
 cusname VARCHAR(8) PRIMARY KEY,
 name VARCHAR(20) NOT NULL,
 contact VARCHAR(15),
 street VARCHAR(40)
 postal CHAR(5),
 city VARCHAR(20),
 phone VARCHAR(20)
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_sv_0900_ai_ci;