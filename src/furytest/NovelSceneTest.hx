package furytest;
import novelspec.SceneSpec;
class NovelSceneTest {
	public static function main() { 
		var runner = new haxe.unit.TestRunner();
		runner.add( new SceneSpec() );
		runner.run();
	} // main
} // NovelSceneTest