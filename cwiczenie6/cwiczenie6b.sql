--Wykorzystując bazę danych stworzoną na poprzednich ćwiczeniach wykonaj następujące polecenia:
--a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski 
--w nawiasie (+48):

UPDATE ksiegowosc.pracownicy SET telefon = (SELECT CONCAT('(+48)',telefon));


--b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony był myślnikami wg 
--wzoru: ‘555-222-333’:

UPDATE ksiegowosc.pracownicy SET telefon = (SELECT CONCAT ((SELECT SUBSTRING(telefon FROM 6 for 3)), '-',
(SELECT SUBSTRING(telefon FROM 9 for 3)),'-',(SELECT SUBSTRING( telefon FROM 12 for 3))));


--c) Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter:

SELECT UPPER(nazwisko) FROM ksiegowosc.pracownicy ORDER BY LENGTH(nazwisko) DESC LIMIT 1;
	
--d) Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5 :
	
SELECT MD5(p.id_pracownika::character varying) AS id_md5,
MD5(p.imie) AS imie_md5,
MD5(p.nazwisko) AS nazwisko_md5 ,MD5(p.adres) AS adres_md5,
MD5(p.telefon) AS telefon_md5, MD5(c.kwota::character varying) AS pensja_md5
FROM ksiegowosc.wynagrodzenie g
JOIN ksiegowosc.pracownicy p
ON g.id_pracownika=p.id_pracownika
JOIN  ksiegowosc.pensje c
ON c.id_pensji=g.id_pensji;			

--e) Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne:

SELECT p.imie, p.nazwisko, c.kwota 
AS kwota_pensji, r.kwota AS kwota_premii
FROM ksiegowosc.wynagrodzenie g
LEFT OUTER JOIN ksiegowosc.pracownicy p
ON g.id_pracownika=p.id_pracownika
LEFT OUTER JOIN  ksiegowosc.pensje c
ON c.id_pensji=g.id_pensji
LEFT OUTER JOIN  ksiegowosc.premie r
ON g.id_premii=r.id_premii;

--f) wygeneruj raport (zapytanie), które zwróci w wyniki treść wg poniższego szablonu:

SELECT CONCAT('Pracownik  ',p.imie,' ', p.nazwisko,', w dniu ',
g.data,' otrzymał pensję całkowitą na kwotę  ',r.kwota+pr.kwota,
', gdzie wynagrodznie  zasadnicze wynosiło:  ',r.kwota,', premia: ', pr.kwota, ', nadgodziny: ',
(CASE WHEN g.liczba_godzin-160>0 THEN g.liczba_godzin-160 WHEN g.liczba_godzin-160<0 THEN '0' END ))
FROM ksiegowosc.wynagrodzenie w JOIN ksiegowosc.pracownicy p ON w.id_pracownika=p.id_pracownika JOIN  ksiegowosc.pensje r
ON r.id_pensji=w.id_pensji JOIN  ksiegowosc.premie pr ON w.id_pensji=pr.id_premii JOIN ksiegowosc.godziny g 
ON g.id_godziny=w.id_godziny;




















									 