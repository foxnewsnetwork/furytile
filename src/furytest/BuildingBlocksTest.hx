package furytest;
import buildingblocksspec.CanvasSpec;
import buildingblocksspec.ElementSpec;
import buildingblocksspec.ImageSpec;

class BuildingBlocksTest {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add(new CanvasSpec());
		runner.add(new ElementSpec());
		runner.add(new ImageSpec() );
		runner.run();
	} // main
} // BuildingBlocksTest