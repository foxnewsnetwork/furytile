package game;
import js.JQuery;
import buildingblocks.Canvas;
import gamedata.InteractionData;

class Interaction {
	public static var ID = 0;
	public static var Actions = ['keydown','keypress','keyup','mouseclick','mouseover','mouseleave', 'mousemove'];
	private var interactions : Hash<Hash<JqEvent->Void>>;
	
	public function new() { 
		this.interactions = new Hash<Hash<JqEvent->Void>>();
		var canvas = new JQuery("canvas");
		var body = new JQuery("body");
		if ( canvas == null || canvas.length == 0 ) { 
			throw "Canvas not found and I don't get paid enough to make one error.";
		} // if no canvas
		if ( body == null || body.length == 0 ) { 
			throw "Body not found and I am not even going to bother with trying to create one.";
		} // if no body
		for( action in Interaction.Actions ) { 
			this.interactions.set( action, new Hash<JqEvent->Void>() );
			var lambda_callback = (function(a : String) {
				return function(e : JqEvent) { 
					for( cb in this.interactions.get(a) ) { 
						cb(e);
					} // for
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
		} // for
	} // new
	
	public function Register( type : String, cb : JqEvent -> Void ) : String { 
		if ( this.interactions.exists( type ) ) {
			var key = Interaction.ID + "-" + type; 
			this.interactions.get(type).set(key, cb);
			Interaction.ID += 1;
			return key;
		} // if
		throw "No such interaction key error on registration : try learning to spell, dumbass";
		return null;
	} // Register
	public function Remove( type : String, key : String ) : Void { 
		if ( this.interactions.exists(type) ) { 
			if ( this.interactions.get(type).remove(key) ) { 
				return;
			} // if
			throw "No such interaction function to remove.";
		} // if
		throw "No such interaction key errror on removal : where did you learn to program? DeVry University?";
		return null;
	} // Remove
} // Interaction