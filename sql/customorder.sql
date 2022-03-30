CREATE TABLE customorder (
 ordernumber INTEGER PRIMARY KEY,
 cusname VARCHAR(8) NOT NULL,
 orderdate DATETIME NOT NULL,
 mode CHAR(1),
 savedate DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;