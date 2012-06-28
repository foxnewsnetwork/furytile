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
	
	public override function tearDown () { 
		for( text in this.texts ) { 
			Canvas.RemoveText(text);
		} // for
	} // tearDown
	public function testSetup() { 
		
		for( k in 0...this.texts.length ) {
			this.assertTrue(Canvas.Texts.exists(this.texts[k].Index())); 
		} // for k
		
		for ( txt in Canvas.Texts ) { 
			this.assertIncludes(this.texts, txt);
		} // for txt
	} // testSetup
	
	public function testTearDown() { 
		for( text in this.texts ) { 
			this.assertTrue(Canvas.Texts.exists(text.Index()));
			var startCount = Canvas.TextCount;
			Canvas.RemoveText(text);
			this.assertEquals(startCount - 1, Canvas.TextCount);
			this.assertFalse(Canvas.Texts.exists(text.Index()));
		} // for text
	} // tearDown
} // TextSpec