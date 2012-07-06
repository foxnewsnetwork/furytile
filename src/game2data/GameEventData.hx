package game2data;

class GameEventData extends dispatch.Event {
	public static var Name = "Game State Changed Event";
	public var key : String;
	public var value : String;
	
	public function new(key, value) { 
		super( GameEventData.Name, 0 );
		this.key = key;
		this.value = value; 
	} // new
} // GameEventData