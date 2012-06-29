package game;
import dispatch.EventCannon;
import gamedata.GameStateData;

class GameState {
	private var gamestate_data : GameStateData;
	
	public function new(?data : GameStateData) { 
		if ( data != null )
			this.gamestate_data = data;
		else
			this.gamestate_data = new GameStateData();
	} // new
	
	public function GameState() : GameStateData { 
		return this.gamestate_data;
	} // Jsonify
	
	public function Hashify() : Hash<String> { 
		return null;
	} // Hashify
	
	public function Get(key){ 
		return this.gamestate_data.Get(key);
	} // Get
	public function Modify<T>( key , value : T ) { 
		if ( this.gamestate_data.Exists(key) ) { 
			this.gamestate_data.Set(key, value);
			EventCannon.Fire( new GameStateDataChangedEvent(key, value) );
		} // if
		return;
	} // Modify
	public function Set<T>( key, value : T) { 
		this.gamestate_data.Set(key, value);
	} // Set
	public function Exists( key ) : Bool { 
		return this.gamestate_data.Exists(key);
	} // Exists
} // GameState