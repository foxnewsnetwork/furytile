package buildingblocksspec;
import buildingblocks.Canvas;
import buildingblocks.Image;
import buildingblocks.Text;
import specfactory.BuildingBlocksFactory;

class CanvasSpec extends haxe.unit.TestCase {
	
	public function testStatics() { 
		this.assertTrue( Canvas.Self != null );
		this.assertTrue( Canvas.Context != null );
	} // testStatics
	
	public function faggotDraw() {
		Canvas.Configuration = {
			reference_width : 2560.0,
			reference_height : 1600.0,
			width : 800.0 ,
			height : 600.0
		}; // Configuration
		for( k in 0...10 ) { 
			Canvas.RegisterImage(BuildingBlocksFactory.Image());
			Canvas.RegisterText(BuildingBlocksFactory.Text());
		} // for
	} // setupDraw
	
	public function testDraw() { 
		this.faggotDraw();
		for( image in Canvas.Images ) { 
			this.assertTrue( image.Source().style.display == "none" );
		} // for
		this.assertFalse( js.Lib.document.getElementById("f242444g1524g134g1e4r1g4dfgfaggot") != null );
		this.assertTrue( Canvas.Context.drawImage != null );
		this.assertTrue( Canvas.Draw() == null );
		
	} // testDraw
} // CanvasSpec