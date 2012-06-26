package buildingblocksspec;
import buildingblocks.Element;
import buildingblocks.Image;
import buildingblocks.Canvas;
import buildingblocksdata.ImageData;
import tools.Random;

class ImageSpec extends haxe.unit.TestCase {

	private var image : Image;
	public override function setup() {
		super.setup(); 
		this.image = new Image( this.generateImageData() );
	} // setup
	
	public function generateImageData() : ImageData { 
		var data : ImageData = {
			source : "madotsuki.png" ,
			source_position : { x : 0.0, y : 0.0 } ,
			source_size : { width : 60.0, height : 60.0 } , 
			position : { x : Random.Number(256) + 0.0, y : Random.Number(256) + 0.0 } ,
			size : { width : Random.Number(256) + 0.0, height : Random.Number(256) + 0.0 } ,
			skew : { x : Random.Decimal(), y : Random.Decimal() } ,
			opacity : 1.0
		}; // return
		return data;
	} // generateImageData
	
	public function testSetup() { 
		this.assertEquals( Element.Count - 1, this.image.Id() );
	} // testSetup
	
	public function testCanvasRegistration() { 
		// Registering
		var indicies : Array<Int> = [];
		var images : Array<Image> = [];
		for( k in 0...50 ) { 
			var img = new Image(this.generateImageData()); // new Image
			indicies.push( Canvas.RegisterImage( img ) );
			images.push( img ); 
		} // for
		
		for( k in 0...50 ) { 
			this.assertEquals(Canvas.Images[indicies[k]].Jsonify(), images[k].Jsonify() );
		} // for
	} // testCanvasRegistration
} // ElementSpec