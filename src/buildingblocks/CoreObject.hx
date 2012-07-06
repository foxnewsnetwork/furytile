package buildingblocks;
import dispatch.Event;
import dispatch.EventLaser;

// Root object all things in furytile inherit from
class CoreObject {
	public static var Count = 0;
	private var core_object_id : Int;
	public var delegate_hash : Hash<Array<Event->Void>>; // please don't mess with this variable
	
	public function new() { 
		this.core_object_id = CoreObject.Count;
		CoreObject.Count += 1;
		this.delegate_hash = new Hash<Array<Event->Void>>();
		EventLaser.Register(this);
	} // new 
	
	public function Listen4( eventname, callb : Event -> Void ) { 
		if ( !this.delegate_hash.exists(eventname) )
			this.delegate_hash.set( eventname, [ function(e) { trace(e); } ] );
		this.delegate_hash.get(eventname).push(callb);
	} // Listen4
	
	// Destructor (YES CALL YOU OWN FUCKING DESTRUCTORS, YOU FUCKING LAZY ASSHOLES)
	public function Destroy() { 
		EventLaser.Unregister(this);
		CoreObject.Count -= 1;
	} // Destroy
	
	public function Core_Object_Id() { 
		return this.core_object_id; 
	} // Core_Object_Id
} // CoreObject