--1.Utwórz pustą bazę danych:
CREATE DATABASE Firma;


--2.Dodaj nowy schemat o nazwie rozliczenia:
CREATE SCHEMA rozliczenia;

--3.Dodaj schematu rozliczenia dodaj cztery tabele:
CREATE TABLE rozliczenia.pracownicy(id_pracownika INTEGER PRIMARY KEY, imie VARCHAR(20)NOT NULL, nazwisko VARCHAR(20)NOT NULL, adres VARCHAR(40), telefon VARCHAR (15));
CREATE TABLE rozliczenia.godziny(id_godziny INTEGER	PRIMARY KEY, data DATE NOT NULL, liczba_godzin INTEGER NOT NULL, id_pracownika INTEGER);
CREATE TABLE rozliczenia.pensje(id_pensji INTEGER PRIMARY KEY, stanowisko VARCHAR(20), kwota MONEY,id_premii INTEGER);
CREATE TABLE rozliczenia.premie(id_premii INTEGER PRIMARY KEY, rodzaj VARCHAR(20), kwota MONEY);

--Ustal klucze obce:
ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);
ALTER TABLE rozliczenia.pensje ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

--4.Wypełnij każdą tabelę 10. rekordami:
--Tabela pracownicy:
INSERT INTO rozliczenia.pracownicy VALUES (1,'Adam','Szwed','ul.Lipowa 26-Wrocław','778099001');
INSERT INTO rozliczenia.pracownicy VALUES (2,'Ala','Las','ul.Targowa 6-Wrocław','790321123');
INSERT INTO rozliczenia.pracownicy VALUES (3,'Wojciech','Puzio','ul.Parkowa 5-Oława','655432900');
INSERT INTO rozliczenia.pracownicy VALUES (4,'Bernard','Flis','ul.Stara 3-Środa śląska','987766543');
INSERT INTO rozliczenia.pracownicy VALUES (5,'Aleksandra','Szewc','ul.Długa 1-Wrocław','790899518');
INSERT INTO rozliczenia.pracownicy VALUES (6,'Daria','Małek','ul.Lipowa 12-Wrocław','775433223');
INSERT INTO rozliczenia.pracownicy VALUES (7,'Łukasz','Stec','ul.Parkowa 3-Oława','775443221');
INSERT INTO rozliczenia.pracownicy VALUES (8,'Emilia','Krak','ul.Piękna 6-Wrocław','505420678');
INSERT INTO rozliczenia.pracownicy VALUES (9,'Ewa','Krawiec','ul.Targowa 17-Wrocław','887665442');
INSERT INTO rozliczenia.pracownicy VALUES (10,'Szymon','Idec', 'ul.Stara 10-Środa śląska','540340123');

--Tabela godziny:
INSERT INTO rozliczenia.godziny VALUES (1,'2021-03-12',8,1);
INSERT INTO rozliczenia.godziny VALUES (2,'2021-03-13',8,2);
INSERT INTO rozliczenia.godziny VALUES (3,'2021-03-14',7,4);
INSERT INTO rozliczenia.godziny VALUES (4,'2021-03-15',8,5);
INSERT INTO rozliczenia.godziny VALUES (5,'2021-03-15',9,3);
INSERT INTO rozliczenia.godziny VALUES (6,'2021-03-16',8,7);
INSERT INTO rozliczenia.godziny VALUES (7,'2021-03-16',10,8);
INSERT INTO rozliczenia.godziny VALUES (8,'2021-03-18',8,6);
INSERT INTO rozliczenia.godziny VALUES (9,'2021-03-19',8,10);
INSERT INTO rozliczenia.godziny VALUES (10,'2021-03-20',8,9);

--Tabela premie:
INSERT INTO rozliczenia.premie VALUES (1,'regulaminowa',216.55);
INSERT INTO rozliczenia.premie VALUES (2,'uznaniowa',86.55);
INSERT INTO rozliczenia.premie VALUES (3,'regulaminowa',386.90);
INSERT INTO rozliczenia.premie VALUES (4,'regulaminowa',186.70);
INSERT INTO rozliczenia.premie VALUES (5,'uznaniowa',157.78);
INSERT INTO rozliczenia.premie VALUES (6,'regulaminowa',240.50);
INSERT INTO rozliczenia.premie VALUES (7,'regulaminowa',275.80);
INSERT INTO rozliczenia.premie VALUES (8,'uznaniowa',320.95);
INSERT INTO rozliczenia.premie VALUES (9,'regulaminowa',187.33);
INSERT INTO rozliczenia.premie VALUES (10,'uznaniowa',135.55);

--Tabela pensje:
INSERT INTO rozliczenia.pensje VALUES (1,'Dyrektor',5789.56, 1);
INSERT INTO rozliczenia.pensje VALUES (2,'Sekretarka',3799.36, 2);
INSERT INTO rozliczenia.pensje VALUES (3,'Informatyk',4778.00, 3);
INSERT INTO rozliczenia.pensje VALUES (4,'Pomoc kuchenna',2980.77, 5);
INSERT INTO rozliczenia.pensje VALUES (5,'Pedagog',4880.55, 4);
INSERT INTO rozliczenia.pensje VALUES (6,'Nauczyciel',3989.46, 7);
INSERT INTO rozliczenia.pensje VALUES (7,'Nauczyciel',3789.56, 6);
INSERT INTO rozliczenia.pensje VALUES (8,'Pielęgniarka',3189.75, 9);
INSERT INTO rozliczenia.pensje VALUES (9,'Nauczyciel',3659.51, 8);
INSERT INTO rozliczenia.pensje VALUES (10,'Konserwator',2778.34, 10);

--5.Za pomocą zapytania SQL wyświetl nazwiska pracowników i ich adresy:
SELECT nazwisko, adres FROM rozliczenia.pracownicy;

--6.Napisz zapytanie, które przekonwertuje datę w tabeli godziny tak, aby wyświetlana była 
--informacja jaki to dzień tygodnia i jaki miesiąc (funkcja DATEPART x2):
SELECT data, DATE_PART('dow', data) AS WEEKDAY, DATE_PART('month', data) AS MONTH FROM rozliczenia.godziny;
 
--7.W tabeli pensje zmień nazwę atrybutu kwota na kwota_brutto oraz dodaj nowy o nazwie 
--kwota_netto. Oblicz kwotę netto i zaktualizuj wartości w tabeli.
ALTER TABLE rozliczenia.pensje RENAME COLUMN "kwota" TO "kwota brutto";
ALTER TABLE rozliczenia.pensje ADD "kwota netto" MONEY;
UPDATE rozliczenia.pensje SET "kwota netto" = "kwota brutto" / 1.19;















