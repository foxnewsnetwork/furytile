package buildingblocksspec;
import buildingblocks.Element;
import buildingblocks.Image;
import buildingblocks.Canvas;
import buildingblocksdata.ImageData;
import tools.Random;
import specfactory.BuildingBlocksFactory;
import haxespec.FuryTestCase;

class ImageSpec extends FuryTestCase {

	private var images : Array<Image>;
	private var indicies : Array<String>;
	public override function setup() {
		super.setup();
		this.images = [];
		this.indicies = []; 
		for( k in 0...10 ) { 
			var img = BuildingBlocksFactory.Image(); // new Image
			this.indicies.push( Canvas.RegisterImage( img ) );
			this.images.push( img ); 
		} // for
	} // setup
	public override function tearDown() { 
		for( image in this.images ) { 
			Canvas.RemoveImage( image );
		} // for
	} // tearDown
	
	public function testExclusivity() { 
		for( image in this.images ) { 
			this.assertTrue( Canvas.Images.exists(image.Index()) );
		} // for
		
		for( image in Canvas.Images ) { 
			this.assertIncludes(this.images, image);
		} // for
	} // testExclusivity
	public function testSetup() { 
		for( img in this.images ) { 
			if ( !Canvas.Images.exists( img.Index() ) )
				trace( img.Index() );
			this.assertTrue(Canvas.Images.exists(img.Index()));
		} // for
	} // testSetup
	
	public function testCanvasRegistration() { 
		// Registering
		for( k in 0...10 ) { 
			this.assertEquals(Canvas.Images.get(indicies[k]).Jsonify(), this.images[k].Jsonify() );
		} // for
		
	} // testCanvasRegistration
	
	public function testTearDown() { 
		for( image in this.images ) { 
			this.assertTrue( Canvas.Images.exists( image.Index() ) );
			var startCount = Canvas.ImageCount;
			Canvas.RemoveImage(image);
			this.assertEquals(startCount - 1, Canvas.ImageCount);
			this.assertFalse(Canvas.Images.exists(image.Index()));
		} // for
	} // tearDown
} // ElementSpec