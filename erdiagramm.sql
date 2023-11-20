-- lieferschein
CREATE TABLE lieferscheine (
id INT(11) AUTO_INCREMENT PRIMARY KEY,
Lieferscheinnummer INT NOT NULL UNIQUE,
datum DATE NOT NULL,
Liefermenge INT NOT NULL,
bestellnummer INT NOT NULL,
FOREIGN KEY (bestellnummer) REFERENCES bestellungen (bestellnummer)
);

CREATE TABLE lieferscheinpositionen ( 
    id INT(11) AUTO_INCREMENT PRIMARY KEY, 
    Lieferscheinnummer INT NOT NULL, 
    produktnummer INT NOT NULL,
    menge INT NOT NULL,
FOREIGN KEY (Lieferscheinnummer) REFERENCES lieferscheine (Lieferscheinnummer)
);

-- kundendatenbank
CREATE TABLE kunden (
id INT(11) AUTO_INCREMENT PRIMARY KEY,
kundennummer INT NOT NULL UNIQUE, 
name VARCHAR(255) NOT NULL, 
email VARCHAR(255) NOT NULL, password VARCHAR(255) NOT NULL, 
Geburtsdatum DATE NOT NULL, 
adresse VARCHAR(255) NOT NULL, 
plz VARCHAR(5) NOT NULL,
ort VARCHAR(255) NOT NULL 
);

CREATE TABLE bestellungen (
id INT(11) AUTO_INCREMENT PRIMARY KEY,
kundennummer INT NOT NULL,
bestellnummer INT NOT NULL UNIQUE,
datum DATE NOT NULL,
Gesamtbetrag INT NOT NULL,
FOREIGN KEY (kundennummer) REFERENCES kunden (kundennummer)
);

CREATE TABLE bestellpositionen (
id INT(11) AUTO_INCREMENT PRIMARY KEY,
bestellnummer INT NOT NULL,
produktnummer INT NOT NULL,
menge INT NOT NULL,
FOREIGN KEY (bestellnummer) REFERENCES bestellungen (bestellnummer)
);

-- produktdatenbank
CREATE TABLE produkte (
id INT(11) AUTO_INCREMENT PRIMARY KEY,
produktnummer INT NOT NULL UNIQUE,
produktname VARCHAR(255) NOT NULL, 
produktbeschreibung TEXT NOT NULL,
produktbild VARCHAR(255) NOT NULL,
Preis INT NOT NULL,
kategorie_id INT NOT NULL,
FOREIGN KEY (kategorie_id) REFERENCES kategorien (id)
);

CREATE TABLE kategorien (
id INT(11) AUTO_INCREMENT PRIMARY KEY, 
kategoriename VARCHAR(255) NOT NULL, 
kategoriebeschreibung TEXT NOT NULL
);

-- Wlan beispiel
CREATE TABLE benutzer (
id INT(11) AUTO_INCREMENT PRIMARY KEY, 
username VARCHAR(255) NOT NULL UNIQUE, 
email VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL
);

CREATE TABLE gerät (
id INT(11) AUTO_INCREMENT PRIMARY KEY, 
gerätename VARCHAR(255) NOT NULL UNIQUE, 
mac_adresse VARCHAR(17) NOT NULL
);

CREATE TABLE daten (
id INT(11) AUTO_INCREMENT PRIMARY KEY, 
datentyp VARCHAR(255) NOT NULL, 
datengröße INT NOT NULL
);

CREATE TABLE benutzer_verwendet_gerät ( 
    id INT(11) AUTO_INCREMENT PRIMARY KEY, 
    benutzer_id INT NOT NULL,
    gerät_id INT NOT NULL,
    CONSTRAINT fk_benutzer_id FOREIGN KEY (benutzer_id) REFERENCES benutzer (id),
    CONSTRAINT fk_gerät_id FOREIGN KEY (gerät_id) REFERENCES gerät (id) 
);

CREATE TABLE gerät_überträgt_daten ( 
    id INT(11) AUTO_INCREMENT PRIMARY KEY, 
    gerät_id INT NOT NULL,
    daten_id INT NOT NULL,
    CONSTRAINT fk_gerät_id_2 FOREIGN KEY (gerät_id) REFERENCES gerät (id),
    CONSTRAINT fk_daten_id FOREIGN KEY (daten_id) REFERENCES daten (id) );

    