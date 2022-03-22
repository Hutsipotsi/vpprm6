CREATE TABLE tilaus (
 tilausnro INTEGER PRIMARY KEY,
 astunnus VARCHAR(8) NOT NULL,
 tilauspvm DATETIME NOT NULL,
 tila CHAR(1),
 tallennuspvm DATETIME,
 FOREIGN KEY (astunnus)  -- viiteavain viittaa asiakas-tauluun
 REFERENCES asiakas (astunnus)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_sv_0900_ai_ci;