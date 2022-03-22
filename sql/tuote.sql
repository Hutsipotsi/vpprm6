CREATE TABLE tuote (
 tuotenro INTEGER PRIMARY KEY,
 tuotenimi VARCHAR(20) NOT NULL,
 hinta DECIMAL(5,2),
 kustannus DECIMAL(5,2),
 trnro SMALLINT NOT NULL,
 FOREIGN KEY (trnro)  -- viiteavain viittaa tuoteryhma-tauluun
 REFERENCES tuoteryhma (trnro)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_sv_0900_ai_ci;