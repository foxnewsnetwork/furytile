package buildingblocksspec;
import buildingblocks.Interaction;
import buildingblocks.Image;
import buildingblocks.Text;
import buildingblocks.Canvas;
import specfactory.BuildingBlocksFactory;

class InteractionSpec extends haxespec.FuryTestCase {
	private var image : Image;
	private var image2 : Image;
	private var text : Text;
	public override function setup() { 
		this.image = BuildingBlocksFactory.Image();
		this.image2 = BuildingBlocksFactory.Image();
		var t_d = BuildingBlocksFactory.TextData();
		t_d.text_size = 25;
		t_d.raw_text = "Testing";
		t_d.align = "start";
		t_d.baseline = "alphabetic";
		this.text = new Text(t_d);
	} // setup
	public override function tearDown() { } // tearDown
	
	public function testFunctionality() { 
		this.text.Click( function(e) { 
			var a = this.text.Angle() + Math.PI / 20;
			this.text.Angle(a);
			Canvas.Draw();
		} ); // click
		this.image.Click( function(e) { 
			var a = this.image.Angle() + Math.PI / 16; 
			this.image.Angle( a );
			Canvas.Draw();
		} ); // Mouseclick
		this.image.Mouseover( function(e) { 
			var a = this.image.Angle() - Math.PI / 16;
			this.image.Angle(a);
			Canvas.Draw();
		} ); // Mouseover
		Canvas.Draw();
	} // testFunctionality
} // InteractionSpec