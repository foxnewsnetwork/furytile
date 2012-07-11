package furytest;
import pitchdeckspec.PitchDeckSpec;
class PitchDeckTest {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add( new PitchDeckSpec() );
		runner.run();
	} // main
} // PitchDeckTest