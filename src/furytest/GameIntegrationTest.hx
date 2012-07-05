package furytest;
import gamespec.GameSpec;

class GameIntegrationTest {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add( new GameSpec() );
		runner.run();
	} // main
} // GameIntegrationTest