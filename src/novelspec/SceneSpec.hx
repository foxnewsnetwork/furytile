package novelspec;
import novel.Scene;
import novel.Animation;
import specfactory.NovelFactory;
class SceneSpec extends haxespec.FuryTestCase {
	private var scene : Scene;
	private var anime : Animation;
	private var subs : Animation;
	
	public override function setup() { 
		this.scene = new Scene();
		this.anime = new Animation( this.scene, NovelFactory.AnimationData("image") );
		this.subs = new Animation( this.scene, NovelFactory.AnimationData( "text" ) );	
	} // setup
	public override function tearDown() { } 
	public function testScene() { 
		tools.Stopwatch.Interval(function() {
			this.scene.Step(); 
			this.scene.Draw();
		}, 30); // Stopwatch Interval	
	} // testScene
} // SceneSpec