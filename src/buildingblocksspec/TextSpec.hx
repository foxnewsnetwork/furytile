package buildingblocksspec;
import buildingblocks.Text;
import specfactory.BuildingBlocksFactory;
import buildingblocks.Canvas;
import haxespec.FuryTestCase;

class TextSpec extends FuryTestCase {
	private var texts : Array<Text>;
	public override function setup() { 
		this.texts = [];
		for( k in 0...10 ) { 
			var text = BuildingBlocksFactory.Text();
			this.texts.push(text);
		} // for
	} // setup
	
	public function testSetup() { 
		for( k in 0...this.texts.length ) {
			this.assertIncludes( Canvas.Texts, this.texts[k] ); 
		} // for k
	} // testSetup
} // TextSpec