package furytest;
import novelspec.NovelSpec;
class NovelIntegrationTest {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add( new NovelSpec() );
		runner.run();
	} // main
} // NovelIntergrationTest