package game;
import dispatch.EventCannon;
import gamedata.GameStateData;

class GameState {
	private var gamestate_data : GameStateData;
	
	public function new(data : GameStateData) { 
		this.gamestate_data = data;
	} // new
	
	public function GameState() : GameStateData { 
		return this.gamestate_data;
	} // Jsonify
	
	public function Hashify() : Hash<String> { 
		return null;
	} // Hashify
	
	public function Modify<T>( key : String, value : T ) { 
		EventCannon.Fire( new GameStateData(key, value) );
	} // Modify
} // GameState