package buildingblocksspec;
import buildingblocks.Canvas;
import buildingblocks.Image;
import buildingblocks.Text;
import specfactory.BuildingBlocksFactory;

class IntegrationSpec extends haxespec.FuryTestCase {
	private var text_center_middle : Text;
	private var text_upper_right : Text;
	private var image_upper_left : Image;
	
	public override function setup() { 
		var center_middle = BuildingBlocksFactory.TextData();
		center_middle.position = { x : 40.0, y : 40.0 };
		center_middle.raw_text = "Center Middle";
		center_middle.opacity = 1.0;
		center_middle.text_color = "#000000";
		center_middle.text_font = "Arial";
		center_middle.align = "start";
		center_middle.baseline = "top";
		center_middle.text_size = 25;
		
		center_middle.angle = Math.PI / 8;
		this.text_center_middle = new Text(center_middle);
		
		var upper_right = BuildingBlocksFactory.TextData();
		upper_right.position = { x : 80.0, y : 5.0 };
		upper_right.raw_text = "Upper Right";
		upper_right.align = "start";
		upper_right.baseline = "top";
		this.text_upper_right = new Text(upper_right);
		
		this.image_upper_left = BuildingBlocksFactory.Image();
	} // setup
	public function testProperPositions() {
		tools.Stopwatch.Interval( function() {
			var a = this.text_center_middle.Angle();
			a += Math.PI / 50;
			this.text_center_middle.Angle(a);
			
			var b = this.text_upper_right.Angle();
			b += Math.PI / 25;
			this.text_upper_right.Angle(b);
			 
			var c = this.image_upper_left.Angle();
			c += Math.PI / 40;
			this.image_upper_left.Angle(c);
			Canvas.Draw();
		}, 25 ); // Interval 
	} // testProperPositions
	
} // IntegrationSpec