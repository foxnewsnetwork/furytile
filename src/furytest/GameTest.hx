package furytest;
import gamespec.GameSpec;
import gamespec.LogicSpec;
import gamespec.GameStateSpec;
import gamespec.InteractionSpec;

class GameTest {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add( new LogicSpec() );
		runner.add( new GameStateSpec() );
		runner.add( new InteractionSpec() );
		runner.run();
	} // main
} // GameTest