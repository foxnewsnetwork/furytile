package gamespec;
import haxespec.FuryTestCase;
import game.Game;
import game.GameState;
import game.GameObject;
import game.Interaction;
import game.Logic;
import game.Renderer;
import dispatch.EventCannon;
import gamedata.GameStateData;
import buildingblocks.Canvas;
import buildingblocks.Text;
import specfactory.BuildingBlocksFactory;
import specfactory.GameFactory;

class GameSpec extends FuryTestCase {
	private var game : GameSpecTestGame;
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
		
		// Step 2: Setup the button
		var btn = new GameObject(GameFactory.GameObjectData()); // GameObject
		this.game_state.Set( btn.Id() , btn.ObjectData() );
		this.game_objects.push(new GameObject());
		this.interaction_manager.Register("mouseclick", function(e) { 
			if( tools.Measure.PointInBox({x : e.pageX + 0.0, y : e.pageY + 0.0}, btn.Position(), btn.Size()) ) { 
				var num = this.game_state.Get("number");
				this.game_state.Modify("number", num + tools.Random.OneOf( [-1,1] ) );
			} // if
			this.logic_manager.Step();
		} ); // Register
		
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
	} // new
} // TestGame

class GameSpecTestRenderer extends Renderer { 
	private var text : Text;
	public override function Register(gameobject) { 
		super.Register(gameobject);
		var txt_data = BuildingBlocksFactory.TextData();
		txt_data.raw_text = "Faggot";
		txt_data.position = gameobject.Position();
		this.text = new Text(txt_data);
	} // Register
	
	private override function p_processgamestate(event) { 
		if ( event.key == this.gameobjects[0].Id() ) { 
			this.text.Position(this.gameobjects[0].Position());
		} // if
	} // p_processgamestate
} // TestRenderer