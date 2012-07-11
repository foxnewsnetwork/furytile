package pitchdeckspec;
import pitchdeck.PitchDeck;
import pitchdeck.Slide;
import novel.Animation;
import noveldata.AnimationData;
import noveldata.InteractionData;
import noveldata.SceneData;
import specfactory.NovelFactory;
import specfactory.PitchDeckFactory;
class PitchDeckSpec extends haxespec.FuryTestCase {
	private var pitchdeck : PitchDeck;
	public override function setup() {
		this.pitchdeck = new PitchDeck();
		var problem_data =  PitchDeckFactory.SlideData("problem");
		this.pitchdeck.LoadDeck([problem_data]);
		this.pitchdeck.Start();
	} // setup
	public override function tearDown() { } // tearDown
	public function testPitchDeck () { 
	
	
	} // testPitchDeck
} // PitchDeckSpec