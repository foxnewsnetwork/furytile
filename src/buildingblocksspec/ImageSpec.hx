package buildingblocksspec;
import buildingblocks.Element;
import buildingblocks.Image;
import buildingblocks.Canvas;
import buildingblocksdata.ImageData;
import tools.Random;
import specfactory.BuildingBlocksFactory;

class ImageSpec extends haxe.unit.TestCase {

	private var image : Image;
	public override function setup() {
		super.setup(); 
		this.image = BuildingBlocksFactory.Image();
	} // setup
	
	public function testSetup() { 
		this.assertEquals( Element.Count - 1, this.image.Id() );
	} // testSetup
	
	public function testCanvasRegistration() { 
		// Registering
		var indicies : Array<Int> = [];
		var images : Array<Image> = [];
		for( k in 0...10 ) { 
			var img = BuildingBlocksFactory.Image(); // new Image
			indicies.push( Canvas.RegisterImage( img ) );
			images.push( img ); 
		} // for
		
		for( k in 0...10 ) { 
			this.assertEquals(Canvas.Images[indicies[k]].Jsonify(), images[k].Jsonify() );
		} // for
		
	} // testCanvasRegistration
	
	public override function tearDown() { 
		return;
	} // tearDown
} // ElementSpec