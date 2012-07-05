package furytest;
import buildingblocksspec.IntegrationSpec;

class BuildingBlocksIntegrationTest {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add( new IntegrationSpec() );
		runner.run();
	} // main
} // BuildingBlocksIntegrationTest