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
	public static var Name = "game state data changed " + tools.Random.Text(15); 
	public var key : String;
	public var value : T;
	
	public function new(key, value) { 
		super( GameStateDataChangedEvent.Name, 0 );
		this.key = key;
		this.value = value;
	} // new
} // GameStateDataChangedEvent

class GameStartEvent extends dispatch.Event { 
	public static var Name = "game started " + tools.Random.Text(15);
	
	public function new() { 
		super( GameStartEvent.Name, 0 );
	} // new
} // GameStartEvent

class GameFinishEvent extends dispatch.Event { 
	public static var Name = "game finished " + tools.Random.Text(15);
	public var victory : Bool;
	public var score : Int;
	
	public function new( win, score) { 
		super( GameFinishEvent.Name, 0 );
		this.victory = win;
		this.score = score;
	} // new
} // GameFinishEvent