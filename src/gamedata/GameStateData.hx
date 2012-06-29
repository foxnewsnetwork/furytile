package gamedata;

class GameStateData { 
	private var data : Hash<Dynamic>;
	public function new() { 
		this.data = new Hash<Dynamic>();
	} // new
	public function Set(key : String, value : Dynamic) { 
		this.data.set(key, value);
	} // set
	public function Get(key : String) : Dynamic { 
		return this.data.get(key);
	} // Get
	public function Exists(key : String) : Bool { 
		return this.data.exists(key);
	} // Exists
} // GameStateData

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