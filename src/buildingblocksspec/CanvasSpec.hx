package buildingblocksspec;
import buildingblocks.Canvas;

class CanvasSpec extends haxe.unit.TestCase {
	
	public function testStatics() { 
		this.assertTrue( Canvas.Self != null );
		this.assertTrue( Canvas.Context != null );
	} // testStatics
	
	
} // CanvasSpec