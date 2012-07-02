package game;
import buildingblocks.Canvas;
import buildingblocks.CoreObject;
import dispatch.EventCannon;
import gamedata.GameStateData;
import gamedata.GameObjectData;


class Renderer extends CoreObject {
	private var gameobjects : Array<GameObject>;
	private var gamestate : GameState;
	
	public function new(state : GameState) { 
		super();
		this.gameobjects = [];
		this.gamestate = state;
		
		EventCannon.Listen(GameStateDataChangedEvent.Name, function(e) { 
			this.p_processgamestate(e);
		} ); // registering the event
		
		EventCannon.Listen(GameObjectCreatedEvent.Name, function(e) { 
			this.Register(e.gameobject);
		} ); // Listen obj created
	} // new
	
	public function Draw() { 
		Canvas.Draw();
	} // Draw
	
	public function Register( gameobject : GameObject ) : Void { 
		this.gameobjects.push(gameobject);
	} // Register
	
	public function Remove( gameobject : GameObject) : Bool { 
		return this.gameobjects.remove(gameobject);
	} // Remove
	
	// Private section
	// Please note that changing the gamestate in this function WILL
	// result in an infinite loop that kills everyone and memory leaks
	private function p_processgamestate( event ) { 
		throw "Not Implemented Error : Please do not try to implement abstract classes";
	} // p_processgamestate
	
} // Renderer