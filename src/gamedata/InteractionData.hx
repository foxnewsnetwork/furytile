package gamedata;
import dispatch.Event;

// If you're going to change this, be sure to make the corresponding change in
// the Interaction.hx file
// apparently, this file is not used.
enum InteractionData {
	keydown;
	keyup;
	keypress;
	mouseclick;
	mouseover;
	mouseleave;
	mousemove;
} // InteractionData

class UserInteractionEvent extends Event { 
	public static var Name = "User Interaction Event";
	public var type : String;
	public var keyCode : Int;
	public var position : { x : Float, y : Float };
	
	public function new( origin ) { 
		super(UserInteractionEvent.Name, origin);
	} // new
} // Event

class MouseoverEvent extends UserInteractionEvent {
	public static function FromJqEvent( origin, e : js.JQuery.JqEvent ) { 
		var output = new MouseoverEvent(origin, e);
		return output;
	} // FromJqEvent 
	public static var Name = "User Interaction Event - Mouseover";
	public function new( origin, jse ) { 
		super(origin);
		this.name = MouseoverEvent.Name;
		this.position = { x : jse.pageX + 0.0, y : jse.pageY + 0.0 };
		this.type = "mouseover";
		this.keyCode = 0;
	} // new
	public override function ToJqEvent() : js.JQuery.JqEvent { 
		var j : js.JQuery.JqEvent = { 
			which : null, 
			wheelDelta : null, 
			type : null, 
			timeStamp : null, 
			target : null, 
			stopPropagation : null, 
			stopImmediatePropagation : null, 
			shiftKey : null, 
			relatedTarget : null, 
			preventDefault : null, 
			pageY : null, 
			pageX : null, 
			metaKey : null, 
			keyCode : null, 
			isPropationStopped : null, 
			isImmediatePropagationStopped : null, 
			isDefaultPrevented : null, 
			currentTarget : null, 
			ctrlKey : null, 
			charCode : null, 
			altKey : null
		}; // jqevent
		j.keyCode = this.keyCode;
		j.pageX = Math.floor(this.position.x);
		j.pageY = Math.floor(this.position.y);
		j.type = this.type;
		return j;
	} // To JqEvent 
} // MouseoverEvent

class MouseleaveEvent extends MouseoverEvent {
	public static function FromJqEvent( origin, e : js.JQuery.JqEvent ) { 
		var output = new MouseleaveEvent(origin, e);
		return output;
	} // FromJqEvent  
	public static var Name = "User Interaction Event - Mouseleave";
	public function new( origin, jse ) { 
		super(origin, jse);
		this.name = MouseleaveEvent.Name;
		this.type = "mouseleave";
	} // new
} // MouseleaveEvent