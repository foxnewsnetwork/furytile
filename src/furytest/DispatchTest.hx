package furytest;
import dispatchspec.EventCannonSpec;

class DispatchTest {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add( new EventCannonSpec() );
		runner.run();
	} // main
} // DispatchTest