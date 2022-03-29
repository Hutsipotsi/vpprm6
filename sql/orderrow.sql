CREATE TABLE orderrow (
ordernumber INTEGER PRIMARY KEY NOT NULL,
rownumber SMALLINT NOT NULL,
prodnumber INTEGER NOT NULL,
pcs INTEGER NOT NULL,
FOREIGN KEY (ordernumber)
REFERENCES customorder (ordernumber)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;