<?php

// Eine neue Verbindung zu der Datenbank herstellen
$conn = new mysqli("localhost", "username", "password", "database");

// Überprüfen, ob die Verbindung erfolgreich war
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Die Daten aus der Tabelle `books` auslesen
$sql = "SELECT * FROM books";
$result = $conn->query($sql);

// Die Daten aus der Tabelle auslesen
while ($row = $result->fetch_assoc()) {
    echo $row["title"] . " von " . $row["author"] . "<br>";
}

// Die Verbindung zur Datenbank schließen
$conn->close();

?>

// ODER SO, EIN BEISPIEL MIT TERMINKALENDER

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">

    <title>Terminkaleder</title>
    <h1>Terminkaleder</h1>
</head>
<body>

<?php
// Hier beginnt der PHP-Code innerhalb des HTML-Dokuments

$dbcon = new mysqli("localhost", "root", "", "termine"); // Stellt eine Datenbankverbindung her

if ($dbcon->connect_error) {
  die("Verbindung fehlgeschlagen: " . $dbcon->connect_error);
} else {
    $select = "SELECT * FROM kunde"; // Speichert eine SQL-Abfrage, um alle Daten aus der 'kunde'-Tabelle abzurufen
    $result = $dbcon -> query($select); // Führt die SQL-Abfrage aus

    if($result->num_rows > 0){ // Überprüft, ob Zeilen von der Abfrage zurückgegeben werden
      while($row = $result->fetch_assoc()) { // Durchläuft jede Zeile des Abfrageergebnisses
        echo '<div class="kunde">'; // Gibt HTML mit der Klasse 'kunde' aus

        // Gibt Kundeninformationen aus
        echo '<div>' .$row['nickname'].'
            (<a href="mailto:'.$row['email'].'">'
            .$row['email']. '</a>)</div>';
         if($row['vorname'] || $row['nachname']){  
            echo '<div>';
                if($row['vorname']) echo $row['vorname'] . ' ';
                if($row['nachname']) echo $row['nachname'];
            echo '</div>';
          }
       
        if($row['beschreibung'])
          echo '<div><i>' . $row['beschreibung'] . '</i></div>';

        // Ruft Termine ab, die mit dem Kunden verbunden sind
        $select = 'SELECT * FROM termine JOIN kategorien ON termine.kategorien = kategorien.kategorieid WHERE termine.email="' . $row['email'].'"';

        $termine = $dbcon->query($select);

        if($termine->num_rows > 0){
          while($termin = $termine->fetch_assoc()){ // Durchläuft jeden Termin
            // Gibt Termininformationen aus
            echo'<div class="termine '.$termin['farbe'].'">';
                echo '<div> von ' .$termin['datum_von']. 'bis' .date('F  j , Y , g : i  a', strtotime($termin['datum_bis'])) .'</div>';
                if($termin['titel'])
                echo '<h3>'.$termin['titel'] .'</h3>';
                if($termin['ort'])
            echo '<div><i>' .$termin['ort'] . '</i></div>';
          }
        }
   
      echo '</div>'; // Schließt das 'kunde'-Div
    }
  }
}

// Stellt eine weitere Datenbankverbindung her (wie zuvor)
$dbcon = new mysqli("localhost", "root", "", "termine");

if ($dbcon->connect_error) {
  die("Verbindung fehlgeschlagen: " . $dbcon->connect_error);
}

// Erstellt ein Formular zum Filtern
echo '<form method="get">';

// Erstellt ein Dropdown-Menü zur Auswahl einer Kategorie
echo '<select name="kunde">';

// Ruft Kategorien aus der Datenbank ab
$sql = "SELECT * FROM kategorien";
$result = $dbcon->query($sql);

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    // Gibt Optionen für das Dropdown-Menü basierend auf Kategorien aus
    echo '<option value="'.$row["kategorieid"].'">'.$row["name"].'</option>';
  }
} else {
  echo "0 Ergebnisse"; // Wird ausgegeben, wenn es keine Kategorien gibt
}
echo '</select>';

// Fügt einen Submit-Button zum Formular hinzu
echo '<input type="submit" value="Filtern">';
echo '</form>'; // Schließt das Formular

?>
</body>
</html>
