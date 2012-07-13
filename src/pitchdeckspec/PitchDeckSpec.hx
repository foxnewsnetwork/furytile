package pitchdeckspec;
import pitchdeck.PitchDeck;
import pitchdeck.Slide;
import novel.Animation;
import noveldata.AnimationData;
import noveldata.InteractionData;
import noveldata.SceneData;
import specfactory.NovelFactory;
import specfactory.PitchDeckFactory;
import tools.Converter;
import tools.Random;
class PitchDeckSpec extends haxespec.FuryTestCase {
	private var pitchdeck : PitchDeck;
	public override function setup() {
		this.pitchdeck = new PitchDeck();
		var ui_data = PitchDeckFactory.UIData();
		this.pitchdeck.LoadUI( ui_data );
		
		var problem_data =  PitchDeckFactory.SlideData("problem");
		this.pitchdeck.LoadDeck([problem_data]);
		this.pitchdeck.Start();
	} // setup
	public override function tearDown() { } // tearDown
	public function testPitchDeck () { 
	
	
	} // testPitchDeck
	
	public function fasdftestConverterLinear() { 
		var a = Random.Vector(7);
		var b = Random.Vector(7);
		var linear = Converter.GetLine(a,b);
		this.assertMathEqual( linear(0.0), a );
		this.assertMathEqual( linear(100.0), b );
	} // testConverter
	
	public function asdftestConverterQuad() { 
		var a = Random.Vector(8);
		var b = Random.Vector(8);
		var c = Random.Vector(8);
		var quad = Converter.GetQuadratic(a,b,c);
		this.assertMathEqual( quad(-1.0), a );
		this.assertMathEqual( quad(0.0), b );
		this.assertMathEqual( quad(1.0), c );
	} // testConverterQuad
} // PitchDeckSpec