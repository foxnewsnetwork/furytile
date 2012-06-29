package furytest;
import gamespec.GameSpec;
import gamespec.LogicSpec;
import gamespec.GameStateSpec;


class GameTest {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add( new LogicSpec() );
		runner.add( new GameStateSpec() );
		runner.run();
	} // main
} // GameTest