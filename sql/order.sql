CREATE TABLE order (
 ordernumber INTEGER PRIMARY KEY,
 cusname VARCHAR(8) NOT NULL,
 orderdate DATETIME NOT NULL,
 mode CHAR(1),
 savedate DATETIME,
 FOREIGN KEY (cusname)  -- viiteavain viittaa asiakas-tauluun
 REFERENCES customer (cusname)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_sv_0900_ai_ci;