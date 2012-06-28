package gamedata;

class GameStateData {

}

class GameStateDataChangedEvent<T> extends dispatch.Event { 
	public static var Name = "game state data changed"; 
	public var key : String;
	public var value : T;
	
	public function new(key, value) { 
		super( GameStateDataChangedEvent.Name, 0 );
		this.key = key;
		this.value = value;
	} // new
} // GameStateDataChangedEvent