--erstellt eine neue datenbank
create database datenbankname; 
____________________________________________________
-- geht in die datenbank rein
use datenbankname; 
____________________________________________________
-- tabelle erstellen                        
create table tabelle (                      
    spalte1 datentyp,                           
    spalte2 datentyp,                           
    ....                                        
);           

-- hier ein beispiel von tabelle erstellen
CREATE TABLE benutzer (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    vorname VARCHAR(50),
    nachname VARCHAR(50),
    email VARCHAR(100)
);
____________________________________________________________
-- eine spalte hinzufügen                                       
alter table tabelle  -- fügt bei diese tabelle ein              
add spalte datentyp; -- fügt neue spalte zu                     

-- beispiel für eine spalte hinzufügen
ALTER TABLE produkte
ADD preis DECIMAL(10,2);
_____________________________________________________________
-- spalte einfügen
alter table tabelle -- ändern in diese tabelle
rename column alte_spalte to neue_spalte; -- ändert von alte spalte in die neue spalte name was du angubst

--beispiel für eine neue spalte zu fügen
ALTER TABLE benutzer
ADD geburtsdatum DATE;
_________________________________________________________________
-- spalte löschen
alter table tabelle -- ämdert tabelle
drop column spalte; -- löscht eine spalte aus der tabelle

-- beispiel von tabelle benutzer spalte löschen
ALTER TABLE benutzer
DROP COLUMN name;
_____________________________________________________________________
-- datensätze einfügen
insert into tabelle (spalte1, spalte2, ... oder mehr)
values (wert1, wert2, oder mehr); -- fügt neue werte in deine spalten

-- beispiel bei tabelle benutzer spalte und werte einfügen
INSERT INTO benutzer (vorname, nachname, email)
VALUES ('Max', 'Mustermann', 'max@example.com');

INSERT INTO benutzer (vorname, nachname, email)
VALUES ('Anna', 'Schmidt', 'anna@example.com');
_____________________________________________________________________________
-- datensätze aktualisieren
update tabelle -- welche tabelle soll aktualisiert werden
set spalte = neuer_wert
where bedingung; -- aktualisiert alte in neue

-- beispiel datensätze zu aktualisieren
UPDATE benutzer
SET nachname = 'Musterfrau'
WHERE id = 1;
__________________________________________________________________________
-- datensätze löschen
delete from tabelle
where bedingung; 

-- beispiel datensatz löschen
DELETE FROM benutzer
WHERE id = 2;
_____________________________________________________
-- daten abfragen
select spalte1, spalte2, ..
from tabelle
where bedingung; 

-- beispiel daten abfragen
SELECT vorname, nachname
FROM benutzer
WHERE id > 5;
____________________________________________________
-- aggregationfunktion
select count(*), sum(spalte), avg(spalte)
from tabelle
where bedingung; 

-- beispiel Anzahl der Datensätze, die Summe der Werte in der Spalte 
SELECT COUNT(*), SUM(alter), AVG(gewicht)
FROM benutzer;
________________________________________________________________________________
-- sortieren und filtern
select spalte1, spalte2, ...
from tabelle where bedingung order by spalte asc/desc
limit anzahl; -- Sortiert und begrenzt die Ergebnisse basierend auf einer Spalte und Anzahl

-- beispiel für sortieren, filtern
SELECT vorname, nachname, alter -- Wähle die Spalten Vorname, Nachname und Alter aus
FROM benutzer -- Aus der Tabelle "benutzer"
WHERE alter > 25 -- Wo das Alter größer als 25 ist (Filterung)
ORDER BY alter DESC; -- Sortiere die Ergebnisse absteigend nach dem Alter       DESC bedeutet absteigend
_______________________________________________________________________________________________________________
-- indizes hinzufügen
create index indexname on tablle(spalte); -- Fügt einen Index auf eine Spalte in der Tabelle hinzu, um Abfragen zu beschleunigen

-- ein beispiel für indizes
CREATE INDEX indexname ON benutzer(vorname); -- Erstellt einen Index namens "indexname" auf der Spalte "vorname" in der Tabelle "benutzer"
________________________________________________________________________________________________________________________________________________________
-- contrains hinzufügen
alter table tabelle
add constraint constraint_name constraint_type(spalte) -- Fügt Einschränkungen wie Primärschlüssel, Fremdschlüssel usw. hinzu

-- ein beispiel für contrains
ALTER TABLE benutzer
ADD CONSTRAINT unique_email UNIQUE(email); -- Fügt einen UNIQUE Constraint auf die Spalte "email" in der Tabelle "benutzer" hinzu

CONSTRAINT bedeutet -- Ein "Constraint" (Einschränkung) in einer Datenbank definiert Regeln 
                    -- oder Bedingungen, die die Gültigkeit und Integrität der Daten sicherstellen.
                    -- Es gibt verschiedene Arten von Constraints:

                    -- Unique Constraint: Stellt sicher, dass Werte in einer Spalte eindeutig sind und sich nicht wiederholen.
                    -- Primary Key Constraint: Definiert eine Spalte oder eine Gruppe von Spalten als primären Schlüssel für eine Tabelle, 
                    -- wodurch jeder Datensatz eindeutig identifizierbar wird.
                    -- Foreign Key Constraint: Definiert eine Beziehung zwischen zwei Tabellen, indem Werte in einer Spalte auf Werte in einer anderen Tabelle verweisen.
                    -- Check Constraint: Überprüft, ob Werte in einer Spalte bestimmte Bedingungen erfüllen.
___________________________________________________________________________________________________________________________________________________________________________________________________
-- DATENTYPEN ERKLÄRT
die zahlen in klammern begrenzt lediglich die stelle (3) 3 stellen.
Du könntest weiterhin Zahlen speichern, die größer oder kleiner als drei Stellen sind, ohne Einschränkungen.

INTEGER (INT) oder NUMERIC/DATA TYPES: Für ganze Zahlen ohne Dezimalstellen. 
Verwende INT, wenn du Ganzzahlen speichern möchtest, und NUMERIC für Zahlen mit Dezimalstellen, wobei du die Genauigkeit der Dezimalstellen angeben kannst.

VARCHAR oder STRING TYPES: Für Zeichenketten. Verwende VARCHAR oder CHAR für Textdaten. 
Die Wahl zwischen VARCHAR und CHAR hängt von der Speicherung variabler oder fester Längen ab. 
VARCHAR ist flexibel für variablen Längen, während CHAR feste Längen verwendet.

DATE/TIME TYPES: Zur Speicherung von Datums- und Zeitinformationen. 
Verwende DATE für Datumsangaben, TIME für Zeiten und DATETIME für Kombinationen von Datum und Uhrzeit.

BOOLEAN TYPES: Zur Speicherung von Wahrheitswerten wie TRUE oder FALSE. Verwende BOOLEAN, BOOL oder BIT.

BINARY/LOB TYPES: Zur Speicherung von Binärdaten oder großen Datenmengen wie Bildern, Audiodateien usw. 
Verwende BINARY für kleine Binärdaten und BLOB/CLOB für große Binär-/Zeichenmengen.

__________________________________________________________________________________________________________________________________________________________________________________
-- JOINS ERKLÄRT

INNER JOIN
-- Gibt nur Datensätze zurück, die in beiden Tabellen übereinstimmen.
Beispiel: Angenommen, wir haben zwei Tabellen Kunden und Bestellungen. 
Wir möchten Kundendaten mit den zugehörigen Bestellungen abrufen.

SELECT Kunden.Name, Bestellungen.Produkt
FROM Kunden
INNER JOIN Bestellungen ON Kunden.ID = Bestellungen.KundenID;
_______________________________________________________________________________________________________________________________

LEFT JOIN
Gibt alle Datensätze aus der linken Tabelle und die übereinstimmenden Datensätze aus der rechten Tabelle zurück.
Beispiel: Wir möchten alle Kunden auflisten, auch wenn sie keine Bestellungen haben.

SELECT Kunden.Name, Bestellungen.Produkt
FROM Kunden
LEFT JOIN Bestellungen ON Kunden.ID = Bestellungen.KundenID;

________________________________________________________________________________________________________________________________

RIGHT JOIN
Gibt alle Datensätze aus der rechten Tabelle und die übereinstimmenden Datensätze aus der linken Tabelle zurück. 
(In MySQL wird dies durch LEFT JOIN erreicht, indem die Reihenfolge der Tabellen umgekehrt wird.)
Beispiel: Alle Bestellungen auflisten, auch wenn sie keinen zugehörigen Kunden haben.

SELECT Kunden.Name, Bestellungen.Produkt
FROM Bestellungen
LEFT JOIN Kunden ON Kunden.ID = Bestellungen.KundenID;

________________________________________________________________________________________________________________________________

FULL JOIN
Dies wird in MySQL nicht direkt unterstützt. 
Um alle Datensätze aus beiden Tabellen zurückzugeben, kannst du LEFT JOIN und UNION verwenden, um die Ergebnisse zu kombinieren.

SELECT Kunden.Name, Bestellungen.Produkt FROM Kunden
LEFT JOIN Bestellungen ON Kunden.ID = Bestellungen.KundenID UNION       -- UNION entfernt Duplikate standardmäßig, während UNION ALL Duplikate beibehält.
SELECT Kunden.Name, Bestellungen.Produkt FROM Bestellungen
LEFT JOIN Kunden ON Kunden.ID = Bestellungen.KundenID;

__________________________________________________________________________________________________________________________________________________
-- was bedeutet UNIQUE
dass alle Werte in einer bestimmten Spalte oder Kombination von Spalten eindeutig sind. 
Dies bedeutet, dass kein Wert in der Spalte oder der Kombination der Spalten mehrmals in der Tabelle vorhanden sein darf.
_______________________________________________________________________________________________________________________________________

1 2 3 NORMALFORMEN ERKLÄRT!!!

Erste Normalform (1NF):

Jede Zelle in der Tabelle muss atomar sein, d.h., sie darf nicht mehrteilig sein.
Es sollten keine wiederholenden Gruppen von Spalten geben, und jedes Attribut sollte atomar sein.
Beispiel: Wenn du eine Tabelle für Adressen hast, sollte jede Spalte nur eine Art von Information (Straße, Stadt, PLZ) enthalten,
keine zusammengesetzten Werte.

Erste Normalform (1NF): Alles muss schön einzeln in Kästchen sein, keine Gruppen von Dingen in einem Kästchen.


______________________________________________________________________________________________________________________________________________________________________________

Zweite Normalform (2NF):

Die Tabelle muss in der 1NF sein.
Jedes Nicht-Schlüssel-Attribut sollte voll funktional vom gesamten Primärschlüssel abhängig sein.
Es sollten keine Teile des Primärschlüssels verwendet werden, um andere Attribute zu beschreiben.
Beispiel: Wenn du eine Tabelle mit Bestellungen hast, sollte jede Information über die Bestellung direkt vom Bestellungs-ID abhängen, 
nicht von einem Teil davon wie dem Kunden.

Zweite Normalform (2NF): Alle Dinge müssen richtig von der Ganzen-Schlüssel-Geschichte abhängen, nicht nur von einem Teil davon.

__________________________________________________________________________________________________________________________________________________________________________

Dritte Normalform (3NF):

Die Tabelle muss in der 2NF sein.
Kein Nicht-Schlüssel-Attribut sollte transitiv von einem Schlüsselattribut abhängig sein.
Wenn A von B und B vom Primärschlüssel abhängt, sollte A nicht von diesem Primärschlüssel abhängen.
Beispiel: In einer Tabelle mit Kunden und deren Standorten sollte die Postleitzahl nicht von einem Kunden, sondern nur von einem Standort abhängen.

Dritte Normalform (3NF): Alles, was nicht direkt zum Schlüssel gehört, darf nicht von anderen Dingen abhängen, die nicht der Schlüssel sind.

