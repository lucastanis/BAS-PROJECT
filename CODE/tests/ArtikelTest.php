<?php
// auteur: Lucas Tanis
// functie: unitests class Artikel

use PHPUnit\Framework\TestCase;
use Bas\classes\Artikel;
use Bas\classes\Database;

// Filename moet gelijk zijn aan de classname ArtikelTest
class ArtikelTest extends TestCase{

    protected $artikel;

    protected function setUp(): void {
        $this->artikel = new Artikel();
        $this->database = new Database();
    }

    // Methods moeten starten met de naam test....
    public function testgetArtikelen(){
        $artikelen = $this->artikel->getArtikelen();
        $this->assertIsArray($artikelen);
        $this->assertTrue(count($artikelen) > 0, "Aantal moet groter dan 0 zijn");
    }

    public function testGetArtikel(){
        $artId = 1; // check of dit ook echt in de database bestaat!
        $artikel = $this->artikel->getArtikel($artId);
        $this->assertEquals($artId, $artikel[0]['artId']);
    }

}

?>