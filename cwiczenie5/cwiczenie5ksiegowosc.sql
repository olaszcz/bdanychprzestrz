--2.Dodaj nowy schemat o nazwie rozliczenia:
CREATE SCHEMA ksiegowosc;
--3.Dodaj cztery tabele:
CREATE TABLE ksiegowosc.pracownicy(id_pracownika INTEGER PRIMARY KEY, imie VARCHAR(20)NOT NULL, nazwisko VARCHAR(20)NOT NULL, adres VARCHAR(40), telefon VARCHAR (15));
CREATE TABLE ksiegowosc.godziny(id_godziny INTEGER	PRIMARY KEY, data DATE NOT NULL, liczba_godzin INTEGER NOT NULL, id_pracownika INTEGER);
CREATE TABLE ksiegowosc.pensje(id_pensji INTEGER PRIMARY KEY, stanowisko VARCHAR(20), kwota MONEY);
CREATE TABLE ksiegowosc.premie(id_premii INTEGER PRIMARY KEY, rodzaj VARCHAR(20), kwota MONEY);
CREATE TABLE ksiegowosc.wynagrodzenie(id_wynagrodzenia INTEGER PRIMARY KEY, data DATE, id_pracownika INTEGER, id_godziny INTEGER, id_pensji INTEGER, id_premii INTEGER);
--klucze obce
ALTER TABLE ksiegowosc.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje(id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);
--4.Wypełnij każdą tabelę 10. rekordami:
--Tabela pracownicy:
INSERT INTO ksiegowosc.pracownicy VALUES (1,'Adam','Szwed','ul.Lipowa 26-Wrocław','778099001');
INSERT INTO ksiegowosc.pracownicy VALUES (2,'Ala','Las','ul.Targowa 6-Wrocław','790321123');
INSERT INTO ksiegowosc.pracownicy VALUES (3,'Wojciech','Puzio','ul.Parkowa 5-Oława','655432900');
INSERT INTO ksiegowosc.pracownicy VALUES (4,'Bernard','Flis','ul.Stara 3-Środa śląska','987766543');
INSERT INTO ksiegowosc.pracownicy VALUES (5,'Aleksandra','Szewc','ul.Długa 1-Wrocław','790899518');
INSERT INTO ksiegowosc.pracownicy VALUES (6,'Daria','Małek','ul.Lipowa 12-Wrocław','775433223');
INSERT INTO ksiegowosc.pracownicy VALUES (7,'Łukasz','Stec','ul.Parkowa 3-Oława','775443221');
INSERT INTO ksiegowosc.pracownicy VALUES (8,'Emilia','Krak','ul.Piękna 6-Wrocław','505420678');
INSERT INTO ksiegowosc.pracownicy VALUES (9,'Ewa','Krawiec','ul.Targowa 17-Wrocław','887665442');
INSERT INTO ksiegowosc.pracownicy VALUES (10,'Szymon','Idec', 'ul.Stara 10-Środa śląska','540340123');
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Przechowuje dane pracowników: imię, nazwisko, adres, numer telefonu oraz id każdego pracownika';

--Tabela godziny:
INSERT INTO ksiegowosc.godziny VALUES (1,'2021-03-12',180,1);
INSERT INTO ksiegowosc.godziny VALUES (2,'2021-03-13',148,2);
INSERT INTO ksiegowosc.godziny VALUES (3,'2021-03-14',137,4);
INSERT INTO ksiegowosc.godziny VALUES (4,'2021-03-15',158,5);
INSERT INTO ksiegowosc.godziny VALUES (5,'2021-03-15',169,3);
INSERT INTO ksiegowosc.godziny VALUES (6,'2021-03-16',178,7);
INSERT INTO ksiegowosc.godziny VALUES (7,'2021-03-16',140,8);
INSERT INTO ksiegowosc.godziny VALUES (8,'2021-03-18',138,6);
INSERT INTO ksiegowosc.godziny VALUES (9,'2021-03-19',168,10);
INSERT INTO ksiegowosc.godziny VALUES (10,'2021-03-20',158,9);
COMMENT ON TABLE ksiegowosc.godziny IS 'Przechowuje dane o id godziny, dacie, liczbie godzin oraz id pracowinika(klucz obcy) ';

--Tabela premie:
INSERT INTO ksiegowosc.premie VALUES (1,'regulaminowa',216.55);
INSERT INTO ksiegowosc.premie VALUES (2,'uznaniowa',86.55);
INSERT INTO ksiegowosc.premie VALUES (3,'regulaminowa',386.90);
INSERT INTO ksiegowosc.premie VALUES (4,'regulaminowa',186.70);
INSERT INTO ksiegowosc.premie VALUES (5,'uznaniowa',157.78);
INSERT INTO ksiegowosc.premie VALUES (6,'regulaminowa',240.50);
INSERT INTO ksiegowosc.premie VALUES (7,'regulaminowa',275.80);
INSERT INTO ksiegowosc.premie VALUES (8,'uznaniowa',320.95);
INSERT INTO ksiegowosc.premie VALUES (9,'regulaminowa',187.33);
INSERT INTO ksiegowosc.premie VALUES (10,'uznaniowa',135.55);
COMMENT ON TABLE ksiegowosc.premie IS 'Przechowuje dane: id premii, jej rodzaj (uznaniowa lub regulaminowa) oraz kwotę premii';

--Tabela pensje:
INSERT INTO ksiegowosc.pensje VALUES (1,'Dyrektor',5789.56);
INSERT INTO ksiegowosc.pensje VALUES (2,'Sekretarka',3799.36);
INSERT INTO ksiegowosc.pensje VALUES (3,'Informatyk',4778.00);
INSERT INTO ksiegowosc.pensje VALUES (4,'Pomoc kuchenna',2980.77);
INSERT INTO ksiegowosc.pensje VALUES (5,'Pedagog',4880.55);
INSERT INTO ksiegowosc.pensje VALUES (6,'Nauczyciel',3989.46);
INSERT INTO ksiegowosc.pensje VALUES (7,'Nauczyciel',3789.56);
INSERT INTO ksiegowosc.pensje VALUES (8,'Pielęgniarka',3189.75);
INSERT INTO ksiegowosc.pensje VALUES (9,'Nauczyciel',3659.51);
INSERT INTO ksiegowosc.pensje VALUES (10,'Konserwator',2778.34);
COMMENT ON TABLE ksiegowosc.pensje IS 'Przechowuje dane: id pensji, jej wysokość oraz kwotę pensji';

--Tabela wynagrodzenie:
INSERT INTO ksiegowosc.wynagrodzenie VALUES (1,'2021-03-31',1,1,1,1);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (2,'2021-03-31',2,2,2,2);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (3,'2021-03-31',3,5,3,3);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (4,'2021-03-31',4,3,4,5);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (5,'2021-03-31',5,4,5,4);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (6,'2021-03-31',6,8,6,7);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (7,'2021-03-31',7,6,7,6);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (8,'2021-03-31',8,7,8,9);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (9,'2021-03-31',9,10,9,8);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (10,'2021-03-31',10,9,10,10);
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Przechowuje dane: id wynagrodzenia, datę, id pracownika, id godziny, id pensji oraz id premii';

--6. Wykonaj następujące zapytania: 

--a) Wyświetl tylko id pracownika oraz jego nazwisko:
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

--b) Wyświetl id pracowników, których płaca jest większa niż 1000:
SELECT w.id_pracownika, e.kwota
FROM ksiegowosc.pensje e 
JOIN ksiegowosc.wynagrodzenie w
ON e.id_pensji=w.id_pensji
WHERE e.kwota > 1000::money;

--c) Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000: 
SELECT w.id_pracownika,w.id_premii
FROM ksiegowosc.pensje s
JOIN ksiegowosc.wynagrodzenie w
ON s.id_pensji=w.id_pensji
WHERE w.id_premii IS NULL AND s.kwota > 2000::money;

--d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J:
SELECT imie FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%';

--e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
SELECT imie, nazwisko FROM ksiegowosc.pracownicy WHERE nazwisko LIKE '%n%' AND imie  LIKE '%a';

--f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas
--pracy to 160 h miesięcznie. 
SELECT p.imie, p.nazwisko,(SELECT g.liczba_godzin-160) AS liczba_nadgodz 
FROM ksiegowosc.godziny g
JOIN ksiegowosc.pracownicy p
ON g.id_pracownika=p.id_pracownika
WHERE g.liczba_godzin-160 > 0;

--g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000 PLN.
SELECT k.imie, k.nazwisko ,p.kwota
FROM ksiegowosc.pracownicy k
JOIN ksiegowosc.pensje p
ON k.id_pracownika = p.id_pensji
WHERE p.kwota > 1500::money AND p.kwota<3000::money;

--h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
SELECT p.imie, p.nazwisko,(SELECT g.liczba_godzin-160) AS liczba_nadgodz 
FROM ksiegowosc.godziny g
JOIN ksiegowosc.pracownicy p
ON g.id_pracownika=p.id_pracownika
JOIN ksiegowosc.wynagrodzenie w
ON  w.id_pracownika=p.id_pracownika
WHERE g.liczba_godzin-160 > 0 AND w.id_premii IS NULL;

--i) Uszereguj pracowników według pensji:
SELECT p.imie, p.nazwisko,c.kwota
FROM ksiegowosc.wynagrodzenie g
JOIN ksiegowosc.pracownicy p
ON g.id_pracownika=p.id_pracownika
JOIN  ksiegowosc.pensje c
ON c.id_pensji=g.id_pensji
ORDER BY c.kwota DESC;

--j) Uszereguj pracowników według pensji i premii malejąco:(CHYBA ŻLE!!!!!!!!)
SELECT p.imie, p.nazwisko,g.id_pracownika, c.kwota,d.kwota
FROM ksiegowosc.wynagrodzenie g
JOIN ksiegowosc.pracownicy p
ON g.id_pracownika=p.id_pracownika
JOIN  ksiegowosc.pensje c
ON c.id_pensji=g.id_pensji
JOIN  ksiegowosc.premie d
ON d.id_premii=g.id_premii
ORDER BY c.kwota DESC, d.kwota DESC;

--k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’:
SELECT stanowisko, COUNT (*) FROM ksiegowosc.pensje GROUP BY(stanowisko);

--l) Policz średnią, minimalną i maksymalną płacę dla 
--stanowiska ‘kierownik’ (jeżeli takiego nie masz, to przyjmij dowolne inne): 'nauczyciel'
SELECT AVG (kwota::numeric)::money , MIN (kwota::numeric)::money AS min, 
MAX (kwota::numeric)::money AS max
FROM ksiegowosc.pensje WHERE stanowisko = 'Nauczyciel';

--m) Policz sumę wszystkich wynagrodzeń:
SELECT SUM(g.kwota) + SUM(d.kwota) AS suma  
FROM ksiegowosc.premie g 
JOIN ksiegowosc.wynagrodzenie w 
ON g.id_premii=w.id_premii
JOIN  ksiegowosc.pensje d
ON d.id_pensji=w.id_pensji;

--n)Policz sumę wynagrodzeń w ramach danego stanowiska: 
SELECT p.stanowisko,SUM(p.kwota)+SUM(c.kwota) AS suma_wynagrodzenia 
FROM ksiegowosc.pensje p JOIN ksiegowosc.wynagrodzenie w
ON p.id_pensji=w.id_pensji
JOIN ksiegowosc.premie c
ON c.id_premii=w.id_premii
GROUP BY stanowisko;

--o)Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska:
SELECT p.stanowisko, COUNT(c.id_premii) 
FROM ksiegowosc.pensje p 
JOIN ksiegowosc.wynagrodzenie w
ON p.id_pensji=w.id_pensji
JOIN ksiegowosc.premie c
ON c.id_premii=w.id_premii
GROUP BY stanowisko;

--p)Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł:
DELETE FROM ksiegowosc.pensje
WHERE kwota::numeric<1200;

 

















