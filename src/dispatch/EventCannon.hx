package dispatch;

class EventCannon {
	public static var event_storage = new Hash< Array< Dynamic -> Void > >();
	
	public static function Listen( name : String, cb : Dynamic -> Void, ?pos : haxe.PosInfos ) { 
		if ( !EventCannon.event_storage.exists(name) )
			EventCannon.event_storage.set(name, [function(e) { haxe.Log.trace(e, pos); } ]);	
		EventCannon.event_storage.get(name).push( cb );
	} // Listen
	
	public static function Fire( e : Dynamic ) { 
		if ( !EventCannon.event_storage.exists(e.name) )
			return;
		for( handler in EventCannon.event_storage.get(e.name) ) { 
			handler(e);
		} // for
	} // Fire
} // EventCannon