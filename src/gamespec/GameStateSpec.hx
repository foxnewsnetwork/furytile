package gamespec;
import haxespec.FuryTestCase;
import game.GameState;
import gamedata.GameStateData;
import dispatch.EventCannon;

class GameStateSpec extends FuryTestCase {
	private var gamestate : GameState;
	
	public override function setup() { 
		this.gamestate = new GameState();
		for( k in 0...26) { 
			this.gamestate.Set(k + "", k);
		} // for k
	} //setup
	
	public override function tearDown() { 
		this.gamestate = null;
	} // teardown
	
	public function testSetup(){ 
		for( k in 0...26 ) { 
			this.assertTrue( this.gamestate.Exists(k + "") );
			this.assertEquals( this.gamestate.Get(k + ""), k);
		} // for k
	} // testSetup
	
	public function testGameStateModification() { 
		var flag = false;
		EventCannon.Listen( GameStateDataChangedEvent.Name, function(e) { 
			flag = true;
		} ); // EventCannon.Listen
		this.assertFalse(flag);
		this.gamestate.Modify("0", 14);
		this.assertTrue(flag);
	} // testGameStateModification
} // GameStateSpec