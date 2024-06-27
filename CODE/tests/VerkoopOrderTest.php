<?php
// auteur: Erik van der Wiel
// functie: unitests class VerkoopOrder

use PHPUnit\Framework\TestCase;
use Bas\classes\VerkoopOrder;
use Bas\classes\Database;

// Filename moet gelijk zijn aan de classname VerkoopOrderTest
class VerkoopOrderTest extends TestCase{

    protected $verkoopOrder;

    protected function setUp(): void {
        $this->verkoopOrder = new VerkoopOrder();
        $this->database = new Database();
    }

    // Methods moeten starten met de naam test....
    public function testgetVerkoopOrders(){
        $verkoopOrders = $this->verkoopOrder->getVerkoopOrders();
        $this->assertIsArray($verkoopOrders);
        $this->assertTrue(count($verkoopOrders) > 0, "Aantal moet groter dan 0 zijn");
    }

    public function testGetVerkoopOrder(){
        $verkOrdId = 30; // check of dit ook echt in de database bestaat!
        $verkoopOrder = $this->verkoopOrder->getVerkoopOrder($verkOrdId);
        $this->assertEquals($verkOrdId, $verkoopOrder[0]['verkOrdId']);
    }

    function test_insertVerkoopOrder()
    {

        $row = [
            'verkOrdDatum' => '2026-06-02',
            'verkOrdBestAantal' => '5',
            'verkOrdStatus' => '1'
        ];

        $result = $this->verkoopOrder->insertVerkoopOrder($row);
        $this->assertTrue($result);

        $conn = $this->database->getConnection();

        $stmt = $conn->prepare("DELETE FROM verkooporder WHERE verkOrdDatum = :verkOrdDatum");
        $stmt->bindParam(':verkOrdDatum', $row['verkOrdDatum']);

        $deleteResult = $stmt->execute();

        $this->assertTrue($deleteResult);

    }

}

?>