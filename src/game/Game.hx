package game;
import buildingblocks.CoreObject;
import gamedata.GameStateData;
import dispatch.EventCannon;
import dispatch.EventLaser;

class Game extends CoreObject {
	// Handles user interaction
	private var interaction_manager : Interaction;
	// Process the game state to the next game state
	private var logic_manager : Logic;
	// Handles drawing the game (persumably through canvas)
	private var game_renderer : Renderer;
	// The driving variable that represents the game
	private var game_state : GameState;
	// objects invovled in this game
	private var game_objects : Array<GameObject>;
	
	public function new() {
		super(); 
		this.game_state = new GameState();
		this.logic_manager = new Logic();
		this.logic_manager.CurrentState(game_state);
		this.interaction_manager = new Interaction();
		this.game_renderer = new Renderer( this.game_state );
		this.game_objects = [];
		
		EventCannon.Listen(GameFinishEvent.Name, function(e : GameFinishEvent ) { 
			this.Finish(e);
		} ); // Listen
	} // new
	
	public function GameState() { 
		return this.game_state;
	} // GameState
	
	public function Start() { 
		this.game_renderer.Draw();
		this.game_state.Set("started", true);
	} // Start
	
	public function Finish( event : GameFinishEvent ) { 
		this.game_state.Set("started", false);
	} // Finish
} // Game