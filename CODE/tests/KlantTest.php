<?php
// auteur: Lucas Tanis
// functie: unitests class Klant

use PHPUnit\Framework\TestCase;
use Bas\classes\Klant;
use Bas\classes\Database;

// Filename moet gelijk zijn aan de classname KlantTest
class KlantTest extends TestCase{
    
	protected $klant;

    protected function setUp(): void {
        $this->klant = new Klant();
        $this->database = new Database();
    }

	// Methods moeten starten met de naam test....
	public function testgetKlanten(){
		$klanten = $this->klant->getKlanten();
        $this->assertIsArray($klanten);
		$this->assertTrue(count($klanten) > 0, "Aantal moet groter dan 0 zijn");
	}

	public function testGetKlant(){
		$klantId = 1; // check of dit ook echt in de database bestaat!
		$klant = $this->klant->getKlant($klantId);
		$this->assertEquals($klantId, $klant[0]['klantId']);
	}

    function test_insertKlant()
    {

        $row = [
          'klantEmail' => 'test1@example.com',
          'klantNaam' => 'test 1'
        ];

        $result = $this->klant->insertKlant($row);
        $this->assertTrue($result);

        $conn = $this->database->getConnection();

        $stmt = $conn->prepare("DELETE FROM klant WHERE klantEmail = :klantEmail");
        $stmt->bindParam(':klantEmail', $row['klantEmail']);

        $deleteResult = $stmt->execute();

        $this->assertTrue($deleteResult);

    }
	
}
	
?>