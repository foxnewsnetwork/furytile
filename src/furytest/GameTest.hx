package furytest;
import gamespec.GameSpec;
import gamespec.LogicSpec;
import gamespec.GameStateSpec;
import gamespec.GameObjectSpec;

import gamespec.RendererSpec;

class GameTest {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add( new LogicSpec() );
		runner.add( new GameStateSpec() );
		
		runner.add( new RendererSpec() );
		runner.add( new GameObjectSpec() );
		runner.run();
	} // main
} // GameTest