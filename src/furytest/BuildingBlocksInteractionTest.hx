package furytest;
import buildingblocksspec.InteractionSpec;
class BuildingBlocksInteractionTest {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add( new InteractionSpec() );
		runner.run();
	} // main
} // BBIT