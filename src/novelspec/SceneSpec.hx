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
		var original_size = this.anime.Image().Size();
		this.subs = new Animation( this.scene, NovelFactory.AnimationData( "text" ) );
		this.anime.Mouseover( function(e) { 
			this.anime.Image().Size({ width : original_size.width + 2.5, height : original_size.height + 2.5 });
		} ); // Mousemove	
		this.anime.Mouseleave( function(e) { 
			this.anime.Image().Size( original_size );
		} ); // Mouseleave
	} // setup
	public override function tearDown() { } 
	public function testScene() { 
		tools.Stopwatch.Interval(function() {
			this.scene.Step(); 
			this.scene.Draw();
		}, 30); // Stopwatch Interval	
	} // testScene
} // SceneSpec