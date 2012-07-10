package novelspec;
import novel.Novel;
import novel.Scene;
import novel.Animation;
import noveldata.AnimationData;
import noveldata.InteractionData;
import noveldata.SceneData;
import specfactory.NovelFactory;

class NovelSpec extends haxespec.FuryTestCase {
	private var novel : Novel;
	public override function setup() { 
		this.novel = new Novel();
		var scene_data = NovelFactory.SceneData();
		var ui_data = NovelFactory.AnimationUI();
		
		this.novel.LoadNovel([scene_data], ui_data);		
		this.novel.Start();
	} // Setup
	public override function tearDown(){ } // tearDown
	public function testNovel() { 
		
	} // testNovel
} // NovelSpec