package gamespec;
import haxespec.FuryTestCase;
import game.Renderer;
import game.GameState;

class RendererSpec extends FuryTestCase {
	private var artist : TestRenderer;
	private var gamestate : GameState;
	
	public override function setup() {
		this.gamestate = new GameState(); 
		this.artist = new TestRenderer( this.gamestate );
		this.gamestate.Set("faggot", 0);
	} // setup
	public override function tearDown() {
		this.artist = null;
	} // tearDown 
	
	public function testInheritanceScheme() { 
		this.gamestate.Modify("faggot", 11);
		this.assertEquals( 100, this.artist.testval );
		this.assertTrue( this.artist.testval != 0 );
	} // testInheritanceScheme
} // RendererSpec

class TestRenderer extends Renderer { 
	public var testval : Int;
	public function new(g) { 
		super(g);
		this.testval = 0;
	} // new
	private override function p_processgamestate(e) { 
		this.testval = 100;
	} // p_processgamestate
} // Renderer