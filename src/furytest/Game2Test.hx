package furytest;
import game2spec.PlaygroundSpec;
class Game2Test {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add( new PlaygroundSpec() );
		runner.run();
	} // main 
} // Game2Test