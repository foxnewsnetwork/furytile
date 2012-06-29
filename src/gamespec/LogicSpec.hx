package gamespec;
import game.Logic;
import game.GameState;
import gamedata.GameStateData;
import haxespec.FuryTestCase;
import tools.Random;

class LogicSpec extends FuryTestCase {
	
	private var logic : Logic;
	private var gamestate : GameState;
	private var rules : Array<Int -> Int>;
	public override function setup() { 
		super.setup();
		this.logic = new Logic();
		this.rules = [];
		var gamestatedata = new GameStateData();
		gamestatedata.Set("debug", 0);
		gamestatedata.Set("faggot", 0);
		this.gamestate = new GameState( gamestatedata );
		
		for( k in 0...10) { 
			var rule = Random.Transform(4);
			rules.push(rule);
		} // for k
	} // setup
	
	public override function tearDown() { 
		this.logic = null;
		this.gamestate = null;
		super.tearDown();
	} // tearDown
	
	public function testRules() { 
		var rule = function( g0 : GameState ) { 
			g0.Modify( "debug", 1 );
		}; // rule
		this.logic.AddRule( rule );
		this.logic.Step( this.gamestate );
		this.assertEquals( this.gamestate.GameState().Get("debug"), 1);
		this.assertEquals( this.gamestate, this.logic.CurrentState() );
	} // testRules
	
	public function testTransform() {
		// Transform should be a random one-to-one function  
		var f = Random.Transform(5);
		this.assertTrue( f(1) != null );
		for( k in 0...50 ) {
			this.assertEquals(f(k), f(k));
		} // for 
		// Here I test one-to-one
	} // testTransfomr
	
	public function testRuleCascading() { 
		var initial_value = this.gamestate.Get("faggot");
		
		for( f in this.rules ) { 
			this.logic.AddRule(function(g0:GameState){ 
				g0.Modify( "faggot", f(g0.Get("faggot") ) );
			}); // AddRule
			initial_value = f(initial_value);
		} // for f
		this.logic.Step(this.gamestate);
		this.assertEquals( this.gamestate.Get("faggot"), initial_value );
	} // testRuleCascading
	
} // LogicSpec