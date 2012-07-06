package dispatch;
import buildingblocks.CoreObject;

// Object-oriented event class
// Unless you know what you're doing (unless you're me, why would you?), 
// do NOT use this class directly
class EventLaser {
	public static var core_hash : Hash<CoreObject> = new Hash<CoreObject>();
	public static function Fire( e : Event, who : Int, ?pos : haxe.PosInfos ) { 
		if ( !EventLaser.core_hash.exists(who + "") ) { 
			haxe.Log.trace( "No object exists to capture the following event : ", pos );
			haxe.Log.trace( e, pos );
			return;
		} // if no such object
		var core = EventLaser.core_hash.get(who + "");
		if ( !core.delegate_hash.exists(e.name) ) { 
			haxe.Log.trace( "Core object : ", pos );
			haxe.Log.trace( core, pos );
			haxe.Log.trace( " Does not have handlers for event : ", pos );
			haxe.Log.trace( e, pos );
			return;
		} // if
		var handlers = core.delegate_hash.get(e.name);
		for( handler in handlers ) { 
			handler( e );
		} // for handler
	} // Fire
	public static function Register( core : CoreObject ) { 
		EventLaser.core_hash.set( core.Core_Object_Id() + "", core );
	} // Register
	public static function Unregister( core : CoreObject ) : Bool { 
		return EventLaser.core_hash.remove( core.Core_Object_Id() + "" );
	} // Unregister
} // EventLaser