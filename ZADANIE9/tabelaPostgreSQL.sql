--Utworzenie schematu:
CREATE DATABASE tabela;
USE tabela;
CREATE SCHEMA tabelageol;

--Dodanie tabel do schematu:
CREATE TABLE tabelageol.GeoEon(id_eon INTEGER PRIMARY KEY, nazwa_eon VARCHAR(20));
CREATE TABLE tabelageol.GeoEra(id_era INTEGER PRIMARY KEY, id_eon INTEGER, nazwa_era VARCHAR(20));
CREATE TABLE tabelageol.GeoOkres(id_okres INTEGER PRIMARY KEY, id_era INTEGER, nazwa_okres VARCHAR(20));
CREATE TABLE tabelageol.GeoEpoka(id_epoka INTEGER PRIMARY KEY, id_okres INTEGER, nazwa_epoka VARCHAR(20));
CREATE TABLE tabelageol.GeoPietro(id_pietro INTEGER PRIMARY KEY, id_epoka INTEGER, nazwa_pietro VARCHAR(20));

--Klucze obce:
ALTER TABLE tabelageol.GeoEra ADD FOREIGN KEY (id_eon) REFERENCES tabelageol.GeoEon(id_eon);
ALTER TABLE tabelageol.GeoOkres ADD FOREIGN KEY (id_era) REFERENCES tabelageol.GeoEra(id_era);
ALTER TABLE tabelageol.GeoEpoka ADD FOREIGN KEY (id_okres) REFERENCES tabelageol.GeoOkres(id_okres);
ALTER TABLE tabelageol.GeoPietro ADD FOREIGN KEY (id_epoka) REFERENCES tabelageol.GeoEpoka(id_epoka);

--Dodawanie rekordów:
--tabela Eon:
INSERT INTO tabelageol.GeoEon VALUES (1,'Fanerozoik');

--tabela Era:
INSERT INTO tabelageol.GeoEra VALUES (1,1,'Paleozoik');
INSERT INTO tabelageol.GeoEra VALUES (2,1,'Mezozoik');
INSERT INTO tabelageol.GeoEra VALUES (3,1,'Kenzoik');

--tabela Okres:
INSERT INTO tabelageol.GeoOkres VALUES (1,1,'Dewon');
INSERT INTO tabelageol.GeoOkres VALUES (2,1,'Karbon');
INSERT INTO tabelageol.GeoOkres VALUES (3,1,'Perm');
INSERT INTO tabelageol.GeoOkres VALUES (4,2,'Trias');
INSERT INTO tabelageol.GeoOkres VALUES (5,2,'Jura');
INSERT INTO tabelageol.GeoOkres VALUES (6,2,'Kreda');
INSERT INTO tabelageol.GeoOkres VALUES (7,3,'Trzeciorzed_Paleogen');
INSERT INTO tabelageol.GeoOkres VALUES (8,3,'Trzeciorzed_Neogen');
INSERT INTO tabelageol.GeoOkres VALUES (9,3,'Czwartorzad');

--tabela Epoka:
INSERT INTO tabelageol.GeoEpoka VALUES (1,1,'Dolny');
INSERT INTO tabelageol.GeoEpoka VALUES (2,1,'Srodkowy');
INSERT INTO tabelageol.GeoEpoka VALUES (3,1,'Gorny');
INSERT INTO tabelageol.GeoEpoka VALUES (4,2,'Dolny');
INSERT INTO tabelageol.GeoEpoka VALUES (5,2,'Gorny');
INSERT INTO tabelageol.GeoEpoka VALUES (6,3,'Dolny');
INSERT INTO tabelageol.GeoEpoka VALUES (7,3,'Gorny');
INSERT INTO tabelageol.GeoEpoka VALUES (8,4,'Dolna');
INSERT INTO tabelageol.GeoEpoka VALUES (9,4,'Srodkowa');
INSERT INTO tabelageol.GeoEpoka VALUES (10,4,'Gorna');
INSERT INTO tabelageol.GeoEpoka VALUES (11,5,'Dolna');
INSERT INTO tabelageol.GeoEpoka VALUES (12,5,'Srodkowa');
INSERT INTO tabelageol.GeoEpoka VALUES (13,5,'Gorna');
INSERT INTO tabelageol.GeoEpoka VALUES (14,6,'Dolna');
INSERT INTO tabelageol.GeoEpoka VALUES (15,6,'Srodkowa');
INSERT INTO tabelageol.GeoEpoka VALUES (16,7,'Paleocen');
INSERT INTO tabelageol.GeoEpoka VALUES (17,7,'Eocen');
INSERT INTO tabelageol.GeoEpoka VALUES (18,7,'Oligocen');
INSERT INTO tabelageol.GeoEpoka VALUES (19,8,'Miocen');
INSERT INTO tabelageol.GeoEpoka VALUES (20,8,'Pliocen');
INSERT INTO tabelageol.GeoEpoka VALUES (21,9,'Plejstocen');
INSERT INTO tabelageol.GeoEpoka VALUES (22,9,'Halocen');

--tabela piętro:
INSERT INTO tabelageol.GeoPietro VALUES (1,1,'lochkow');
INSERT INTO tabelageol.GeoPietro VALUES (2,1,'prag');
INSERT INTO tabelageol.GeoPietro VALUES (3,1,'ems');
INSERT INTO tabelageol.GeoPietro VALUES (4,2,'eifel');
INSERT INTO tabelageol.GeoPietro VALUES (5,2,'żywet');
INSERT INTO tabelageol.GeoPietro VALUES (6,3,'fran');
INSERT INTO tabelageol.GeoPietro VALUES (7,3,'famen');
INSERT INTO tabelageol.GeoPietro VALUES (8,4,'turnej');
INSERT INTO tabelageol.GeoPietro VALUES (9,4,'wizen');
INSERT INTO tabelageol.GeoPietro VALUES (10,4,'serpuchow');
INSERT INTO tabelageol.GeoPietro VALUES (11,5,'baszkir');
INSERT INTO tabelageol.GeoPietro VALUES (12,5,'moskow');
INSERT INTO tabelageol.GeoPietro VALUES (13,5,'kasimow');
INSERT INTO tabelageol.GeoPietro VALUES (14,5,'gżel');
INSERT INTO tabelageol.GeoPietro VALUES (15,6,'assel');
INSERT INTO tabelageol.GeoPietro VALUES (16,6,'sakmar');
INSERT INTO tabelageol.GeoPietro VALUES (17,6,'artinsk');
INSERT INTO tabelageol.GeoPietro VALUES (18,6,'kungur');
INSERT INTO tabelageol.GeoPietro VALUES (19,7,'road');
INSERT INTO tabelageol.GeoPietro VALUES (20,7,'word');
INSERT INTO tabelageol.GeoPietro VALUES (21,7,'kapitan');
INSERT INTO tabelageol.GeoPietro VALUES (22,7,'wucziaping');
INSERT INTO tabelageol.GeoPietro VALUES (23,7,'czangsing');
INSERT INTO tabelageol.GeoPietro VALUES (24,8,'ind');
INSERT INTO tabelageol.GeoPietro VALUES (25,8,'olenek');
INSERT INTO tabelageol.GeoPietro VALUES (26,9,'anizyk');
INSERT INTO tabelageol.GeoPietro VALUES (27,9,'ladyn');
INSERT INTO tabelageol.GeoPietro VALUES (28,10,'karnik');
INSERT INTO tabelageol.GeoPietro VALUES (29,10,'noryk');
INSERT INTO tabelageol.GeoPietro VALUES (30,10,'retyk');
INSERT INTO tabelageol.GeoPietro VALUES (31,11,'hettang');
INSERT INTO tabelageol.GeoPietro VALUES (32,11,'synemur');
INSERT INTO tabelageol.GeoPietro VALUES (33,11,'pliensbach');
INSERT INTO tabelageol.GeoPietro VALUES (34,11,'toark');
INSERT INTO tabelageol.GeoPietro VALUES (35,12,'aalen');
INSERT INTO tabelageol.GeoPietro VALUES (36,12,'bajos');
INSERT INTO tabelageol.GeoPietro VALUES (37,12,'baton');
INSERT INTO tabelageol.GeoPietro VALUES (38,12,'kelowej');
INSERT INTO tabelageol.GeoPietro VALUES (39,13,'oksford');
INSERT INTO tabelageol.GeoPietro VALUES (40,13,'kimeryd');
INSERT INTO tabelageol.GeoPietro VALUES (41,13,'tyton');
INSERT INTO tabelageol.GeoPietro VALUES (42,14,'berrias');
INSERT INTO tabelageol.GeoPietro VALUES (43,14,'walanżyn');
INSERT INTO tabelageol.GeoPietro VALUES (44,14,'hoteryw');
INSERT INTO tabelageol.GeoPietro VALUES (45,14,'barrem');
INSERT INTO tabelageol.GeoPietro VALUES (46,14,'apt');
INSERT INTO tabelageol.GeoPietro VALUES (47,14,'alb');
INSERT INTO tabelageol.GeoPietro VALUES (48,15,'cenoman');
INSERT INTO tabelageol.GeoPietro VALUES (49,15,'turon');
INSERT INTO tabelageol.GeoPietro VALUES (50,15,'koniak');
INSERT INTO tabelageol.GeoPietro VALUES (51,15,'santon');
INSERT INTO tabelageol.GeoPietro VALUES (52,15,'kampan');
INSERT INTO tabelageol.GeoPietro VALUES (53,15,'mastrycht');
INSERT INTO tabelageol.GeoPietro VALUES (54,16,'dan');
INSERT INTO tabelageol.GeoPietro VALUES (55,16,'zeland');
INSERT INTO tabelageol.GeoPietro VALUES (56,16,'tanet');
INSERT INTO tabelageol.GeoPietro VALUES (57,17,'iprez');
INSERT INTO tabelageol.GeoPietro VALUES (58,17,'barton');
INSERT INTO tabelageol.GeoPietro VALUES (59,17,'priabon');
INSERT INTO tabelageol.GeoPietro VALUES (60,18,'rupel');
INSERT INTO tabelageol.GeoPietro VALUES (61,18,'szat');
INSERT INTO tabelageol.GeoPietro VALUES (62,19,'akwitan');
INSERT INTO tabelageol.GeoPietro VALUES (63,19,'burdygał');
INSERT INTO tabelageol.GeoPietro VALUES (64,19,'lang');
INSERT INTO tabelageol.GeoPietro VALUES (65,19,'serrawal');
INSERT INTO tabelageol.GeoPietro VALUES (66,19,'torton');
INSERT INTO tabelageol.GeoPietro VALUES (67,19,'messyn');
INSERT INTO tabelageol.GeoPietro VALUES (68,20,'zankl');
INSERT INTO tabelageol.GeoPietro VALUES (69,20,'piacent');
INSERT INTO tabelageol.GeoPietro VALUES (70,21,'gelas');
INSERT INTO tabelageol.GeoPietro VALUES (71,21,'kalabr');
INSERT INTO tabelageol.GeoPietro VALUES (72,21,'chiban');
INSERT INTO tabelageol.GeoPietro VALUES (73,21,'tarant');
INSERT INTO tabelageol.GeoPietro VALUES (74,22,'grenland');
INSERT INTO tabelageol.GeoPietro VALUES (75,22,'nortgryp');
INSERT INTO tabelageol.GeoPietro VALUES (76,22,'megalaj');

--Forma zdenormalizowana tabeli geochronologicznej:
SELECT * INTO GeoTabela FROM (tabelageol.GeoPietro INNER JOIN tabelageol.GeoEpoka ON 
JOIN tabelageol.GeoOkres  JOIN tabelageol.GeoEra JOIN tabelageol.GeoEon);

--Tabela Dziesiec:
CREATE TABLE Dziesiec (cyfra INTEGER , bit INTEGER);
INSERT INTO Dziesiec VALUES (0,0000);
INSERT INTO Dziesiec VALUES (1,0001);
INSERT INTO Dziesiec VALUES (2,0010);
INSERT INTO Dziesiec VALUES (3,0011);
INSERT INTO Dziesiec VALUES (4,0100);
INSERT INTO Dziesiec VALUES (5,0101);
INSERT INTO Dziesiec VALUES (6,0110);
INSERT INTO Dziesiec VALUES (7,0111);
INSERT INTO Dziesiec VALUES (8,1000);
INSERT INTO Dziesiec VALUES (9,1001);

--Tabela Milion:
CREATE TABLE Milion(liczba INTEGER,cyfra INTEGER, bit INTEGER);
INSERT INTO Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra 
+ 10000*a5.cyfra + 10000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit 
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec 
a6 ;

--Zapytanie 1 (1 ZL), którego celem jest złączenie syntetycznej tablicy miliona wyników 
--z tabelą geochronologiczną w postaci zdenormalizowanej, przy czym do warunku złącze
--nia dodano operację modulo, dopasowującą zakresy wartości złączanych kolumn:

-- bez nałożonych indeksów na kolumny danych:
EXPLAIN SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON 
(mod(Milion.liczba,68)=(GeoTabela.id_pietro));

--z indeksami na wszystkich kolumnach biorących udział w złączeniu:

CREATE INDEX mil ON Milion USING BTREE (liczba);    
CREATE INDEX ON GeoTabela(id_pietro);

--Zapytanie 2 (2 ZL), którego celem jest złączenie syntetycznej tablicy miliona wyników 
--z tabelą geochronologiczną w postaci znormalizowanej, reprezentowaną przez złączenia 
--pięciu tabel:

-- bez nałożonych indeksów na kolumny danych:
EXPLAIN SELECT COUNT(*) FROM Milion INNER JOIN tabelageol.GeoPietro ON 
(mod(Milion.liczba,68)=tabelageol.GeoPietro.id_pietro) NATURAL JOIN tabelageol.GeoEpoka
NATURAL JOIN tabelageol.GeoOkres NATURAL JOIN tabelageol.GeoEra NATURAL JOIN tabelageol.GeoEon;


--z indeksami na wszystkich kolumnach biorących udział w złączeniu:
CREATE INDEX mil ON Milion USING BTREE (liczba);    
CREATE INDEX ON GeoTabela(id_pietro);
CREATE INDEX epoka ON tabelageol.GeoEpoka USING BTREE (id_epoka, nazwa_epoka);    
CREATE INDEX ON tabelageol.GeoOkres(id_okres, nazwa_okres);
CREATE INDEX e ON tabelageol.GeoEra USING BTREE (id_era, nazwa_era);    
CREATE INDEX ON tabelageol.GeoEon(id_eon, nazwa_eon);


--Zapytanie 3 (3 ZG), którego celem jest złączenie syntetycznej tablicy miliona wyników 
--z tabelą geochronologiczną w postaci zdenormalizowanej, przy czym złączenie jest 
--wykonywane poprzez zagnieżdżenie skorelowane:

-- bez nałożonych indeksów na kolumny danych:
EXPLAIN SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,68)= 
(SELECT id_pietro FROM GeoTabela WHERE mod(Milion.liczba,68)=(id_pietro));

--z indeksami na wszystkich kolumnach biorących udział w złączeniu:
CREATE INDEX mil ON Milion USING BTREE (liczba);    
CREATE INDEX ON GeoTabela(id_pietro);


--Zapytanie 4 (4 ZG), którego celem jest złączenie syntetycznej tablicy miliona wyników 
--z tabelą geochronologiczną w postaci znormalizowanej, przy czym złączenie 
--jest wykonywane poprzez zagnieżdżenie skorelowane, a zapytanie wewnętrzne jest złączeniem 
--tabel poszczególnych jednostek geochronologicznych:

-- bez nałożonych indeksów na kolumny danych:
EXPLAIN SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,68) IN
(SELECT tabelageol.GeoPietro.id_pietro FROM tabelageol.GeoPietro 
 NATURAL JOIN tabelageol.GeoEpoka NATURAL JOIN 
tabelageol.GeoOkres NATURAL JOIN tabelageol.GeoEra 
 NATURAL JOIN tabelageol.GeoEon);

--z indeksami na wszystkich kolumnach biorących udział w złączeniu:
CREATE INDEX mil ON Milion USING BTREE (liczba);    
CREATE INDEX ON tabelageol.GeoPietro(id_pietro);
CREATE INDEX epoka ON tabelageol.GeoEpoka USING BTREE (id_epoka, nazwa_epoka);    
CREATE INDEX ON tabelageol.GeoOkres(id_okres, nazwa_okres);
CREATE INDEX e ON tabelageol.GeoEra USING BTREE (id_era, nazwa_era);    
CREATE INDEX ON tabelageol.GeoEon(id_eon, nazwa_eon);









