<!--
	Auteur: Erik van der Wiel
	Function: home page CRUD artikel
-->

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crud</title>
    <link rel="stylesheet" href="../style.css">
</head>

<body>
<h1>CRUD Artikelen</h1>
<nav>
    <a href='../index.html'>Home</a><br>
    <a href='insert.php'>Toevoegen nieuw Artikel</a><br><br>
</nav>

<form method="GET">
    <label for="searchArtId">Zoek op ArtId:</label>
    <input type="number" id="searchArtId" name="searchArtId">
    <button type="submit">Zoek</button>
</form>
<br>

<?php

// Autoloader classes via composer
require '../../vendor/autoload.php';

use Bas\classes\Artikel;

// Maak een object Artikel
$Artikel = new Artikel;
$searchArtId = $_GET['searchArtId'] ?? null;

// Start CRUD
$Artikel->crudArtikel($searchArtId);

?>
</body>
</html>