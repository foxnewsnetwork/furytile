package buildingblocks;
import js.JQuery;
import dispatch.EventCannon;
import dispatch.EventLaser;

class Interaction {
	public static var Actions = ['keydown','keypress','keyup','mouseclick','mouseover','mouseleave', 'mousemove'];
	public static var Count = 0;
	public static var Interactions = (function(){ 
		var cb_hash = new Hash<Hash<JqEvent->Void>>();
		var canvas = new JQuery("canvas#canvas");
		var body = new JQuery("body");
		if ( canvas == null || canvas.length == 0 ) { 
			throw "Canvas not found and I don't get paid enough to make one error.";
		} // if no canvas
		if ( body == null || body.length == 0 ) { 
			throw "Body not found and I am not even going to bother with trying to create one.";
		} // if no body
		for( action in Interaction.Actions ) { 
			cb_hash.set( action, new Hash<JqEvent->Void>() );
			var lambda_callback = (function(a : String) {
				return function(e : JqEvent) { 
					for( cb in cb_hash.get(a) ) { 
						cb(e);
					} // for cb
				}; // return
			} )(action); // lambda_callback
			switch( action ) { 
				case "keydown" :
					body.keydown( lambda_callback );
				case "keypress" :
					body.keypress( lambda_callback );
				case "keyup" :
					body.keyup( lambda_callback );
				case "mouseclick" :
					canvas.click( lambda_callback );
				case "mouseover" :
					canvas.mouseover( lambda_callback );
				case "mouseleave" :
					canvas.mouseleave( lambda_callback );
				case "mousemove" :
					canvas.mousemove( lambda_callback );
				default :
					throw "Unrecognized action error : " + action;
					break;
			} // switch
		} // for action
		return cb_hash;
	})(); // Interactions
	
	public static function Register( type, cb ) { 
		if ( !Interaction.Interactions.exists(type) ) { 
			throw "Unrecognized action type error : " + type;
			return -1;
		} // if bad type
		var handler_hash = Interaction.Interactions.get(type);
		handler_hash.set( Interaction.Count + "", cb );
		Interaction.Count += 1;
		return Interaction.Count - 1;
	} // Register
	
	public static function Unregister( type : String, key : Int ) { 
		if ( !Interaction.Interactions.exists(type) ) { 
			throw "Unrecognized action type error : " + type;
			return false;
		} // if bad type
		return Interaction.Interactions.get(type).remove(key + "");
	} // Unregister
		
} // Interaction