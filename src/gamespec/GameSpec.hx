package gamespec;
import haxespec.FuryTestCase;
import game.Game;
import game.GameState;
import game.GameObject;
import game.Logic;
import game.Renderer;
import dispatch.EventCannon;
import gamedata.GameStateData;
import buildingblocks.Canvas;
import buildingblocks.Text;
import buildingblocks.Interaction;
import specfactory.BuildingBlocksFactory;
import specfactory.GameFactory;

class GameSpec extends FuryTestCase {
	private var game : GameSpecTestGame;
	public override function setup() { 
		this.game = new GameSpecTestGame();
	} // setup
	public override function tearDown() { }
	public function testGame() { 
		this.game.Start();
	} // testGame
} // FuryTestCase

// Very simple test. The game consists of a number and two buttons.
// Pressing one of the buttons increments the number, while the other one
// decrements it. The functionality of each button is randomly switched.
// The object of the game is to get the number to 10 (starting form 0)
class GameSpecTestGame extends Game { 
	
	public function new() { 
		super(); 
		
		// Step 1: Setup gamestate
		this.game_state.Set("number", 0);
		this.game_state.Set("attempts", 0);
		this.game_state.Set("win", false);
		this.game_renderer = new GameSpecTestRenderer(this.game_state);
		
		// Step 2: Setup the button
		var objdata = GameFactory.GameObjectData();
		objdata.position = { x : 50.0, y : 50.0 };
		var btn = new GameObject(objdata); // GameObject
		
		// Step 2.5 : Registration
		btn.Register( this.game_state );
		this.game_renderer.Register( btn );
		this.game_objects.push(new GameObject());
		
		// Step 3 : Setup button interaction
		btn.Bind("mouseover", function(e){
			var a = btn.Angle() + Math.PI / 16;
			btn.Angle(a);
		} ); // mouseover
		
		this.logic_manager.AddRule(function(g) { 
			if ( g.Get("win") == true ) { 
				EventCannon.Fire(new GameFinishEvent(true, 10));
			} // 
		} ); // AddRule winning
		this.logic_manager.AddRule(function( g ) { 
			if ( g.Get("number") == 10 ) { 
				g.Set("win", true );
			} // if
		} ); // AddRule win condition
		
		// Step 3: Setup rendering
		
	} // new
} // TestGame

class GameSpecTestRenderer extends Renderer { 
	private var text : Text;
	private var score : Text;
	
	public function new(g) { 
		super(g);
		var scr_data = BuildingBlocksFactory.TextData();
		scr_data.raw_text = g.Get("number") + "";
		scr_data.position = { x : 50.0, y : 50.0 };
		scr_data.text_size = 40;
		this.score = new Text(scr_data);
	} // new
	public override function Register(gameobject) { 
		super.Register(gameobject);
		var txt_data = BuildingBlocksFactory.TextData();
		txt_data.raw_text = "Faggot";
		txt_data.position = gameobject.Position();
		txt_data.text_size = Math.ceil(gameobject.Size().height);
		this.text = new Text(txt_data);
	} // Register
	
	private override function p_processgamestate(event) { 
		if ( event.key == this.gameobjects[0].Id() ) { 
			this.text.Position(this.gameobjects[0].Position());
		} // if
		if ( event.key == "number" ) { 
			this.score.Text( event.value + "" );
		} // if
	} // p_processgamestate
} // TestRenderer