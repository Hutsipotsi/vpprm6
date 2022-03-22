CREATE TABLE asiakas (
 astunnus VARCHAR(8) PRIMARY KEY,
 asnimi VARCHAR(20) NOT NULL,
 yhteyshlo VARCHAR(15),
 postinro CHAR(5),
 asvuosi SMALLINT,
 FOREIGN KEY (postinro) -- viiteavain viittaa posti-tauluun
 REFERENCES posti (postinro)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_sv_0900_ai_ci;