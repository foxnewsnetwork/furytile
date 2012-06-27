package furytest;
import buildingblocksspec.CanvasSpec;
import buildingblocksspec.ElementSpec;
import buildingblocksspec.ImageSpec;
import buildingblocksspec.TextSpec;
import js.JQuery;

class BuildingBlocksTest {
	public static function main() { 
		new JQuery("document").ready( function(e) { 
			var runner = new haxe.unit.TestRunner();
			runner.add(new CanvasSpec());
			runner.add(new ElementSpec());
			runner.add(new ImageSpec() );
			runner.add(new TextSpec() );
			runner.run();
		} ); // document ready
	} // main
} // BuildingBlocksTest