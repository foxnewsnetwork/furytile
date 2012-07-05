package dispatch;
import js.JQuery;
class Event {
	// Name of the event
	public var name : String;
	// object id of who fired it
	public var origin : Int;
	
	public function new( name : String, origin : Int ) { 
		this.name = name;
		this.origin = origin;
	} // new
	
	public function ToJqEvent() : JqEvent { return null; }
} // Event