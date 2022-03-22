 CREATE TABLE tilausrivi (
 tilausnro INTEGER,
 rivinro SMALLINT,
 tuotenro INTEGER NOT NULL,
 kpl INTEGER NOT NULL,
 PRIMARY KEY (tilausnro, rivinro),
 FOREIGN KEY (tilausnro)
 REFERENCES tilaus (tilausnro),
 FOREIGN KEY (tuotenro)  -- viiteavain viittaa tilaus-tauluun
 REFERENCES tuote (tuotenro)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_sv_0900_ai_ci;