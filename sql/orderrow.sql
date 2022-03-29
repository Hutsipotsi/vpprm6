 CREATE TABLE orderrow (
 ordernumber INTEGER PRIMARY KEY,
 rownumber SMALLINT PRIMARY KEY,
 prodnumber INTEGER NOT NULL,
 pcs INTEGER NOT NULL,
 FOREIGN KEY (ordernumber)
 REFERENCES order (ordernumber),
 FOREIGN KEY (prodnumber)
 REFERENCES product (prodnumber)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_sv_0900_ai_ci;