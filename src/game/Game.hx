package game;

class Game {
	// Handles user interaction
	private var interaction_manager : Interaction;
	// Process the game state to the next game state
	private var logic_manager : Logic;
	// Handles drawing the game (persumably through canvas)
	private var game_renderer : Renderer;
	// The driving variable that represents the game
	private var game_state : GameState;
	
	public function new() { 
		this.game_state = new GameState();
	} // new
	
	public function GameState() { 
		return this.game_state;
	} // GameState
	
	public function Load() { 
	
	} // Load
} // Game