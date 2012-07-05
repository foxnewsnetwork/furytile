package game;
import gamedata.GameObjectData;
import gamedata.GameStateData;
import dispatch.EventCannon;
import dispatch.EventLaser;
import buildingblocks.CoreObject;
import buildingblocks.Interaction;
import gamedata.InteractionData;

class GameObject extends CoreObject {
	public static var Name = "Furytile GameObject " + tools.Random.Text(15);
	public static var Count = 0;
	private var objectdata : GameObjectData;
	private var position_callback : GameObjectPosition -> Void;
	private var size_callback : GameObjectSize -> Void;
	private var angle_callback : Float -> Void;
	private var registration_flag : Bool;
	private var active_flag : Bool;
	private var has_mouse_flag : Bool;
	
	public function new(?objdata : GameObjectData) { 
		super();
		this.objectdata = { 
			size : { width : 0.0, height : 0.0 } ,
			position : { x : 0.0, y : 0.0 },
			angle : 0.0 ,
			id : GameObject.Name + GameObject.Count
		}; // objectdata
		GameObject.Count += 1;
		if( objdata != null ) { 
			this.objectdata.size = objdata.size;
			this.objectdata.position = objdata.position;
			this.objectdata.angle = objdata.angle;
			objdata.id = this.objectdata.id;
		} // if
		EventCannon.Fire(new GameObjectCreatedEvent(this));
		EventCannon.Listen(GameStateDataChangedEvent.Name, function(e) { 
			if( e.key == this.Id() ) { 
				this.p_updateobjectdata(e.value);
			} // if
		} ); // Listen
		this.registration_flag = false;
		this.active_flag = true;
		this.has_mouse_flag = false;
		Interaction.Register("mousemove", function(e) { 
			if ( tools.Measure.PointInBox( { x : e.pageX+0.0, y : e.pageY+0.0 }, this.Position(), this.Size() ) )  { 
				if ( this.has_mouse_flag == false ) {
					this.has_mouse_flag = true;
					var event = new MouseoverEvent( this.Core_Object_Id(), e );
					event.type = "mouseover";
					event.position = { x : e.pageX + 0.0, y : e.pageY + 0.0 };
					EventLaser.Fire( event, this.Core_Object_Id() );
				} // if has_mouse
			} // if in box
			else { 
				if ( this.has_mouse_flag == true ) { 
					this.has_mouse_flag = false;
					var event = new MouseleaveEvent( this.Core_Object_Id(), e );
					event.type = "mouseleave";
					event.position = { x : e.pageX + 0.0, y : e.pageY + 0.0 };
					EventLaser.Fire( event, this.Core_Object_Id() );
				} // if has_mouse
			} // else not in box
		} ); // Register
	} // new
	
	public function Register( gamestate : GameState ) {
		gamestate.Set( this.Id(), this.ObjectData() ); 
		var g : GameObjectData = gamestate.Get(this.Id());
		this.position_callback = function( p ) { 
			g.position = p;
		}; // position_callback
		this.size_callback = function(s) { 
			g.size = s;
		}; // size callback
		this.angle_callback = function(a) { g.angle = a; };
		this.registration_flag = true;
	} // Register
	
	/***
	* Interaction Functions
	*/
	public function Bind( action : String, cb : js.JQuery.JqEvent->Void ) : Void { 
		switch( action ) { 
			case "mouseover" :
				this.Listen4( MouseoverEvent.Name, function(e) { 
					cb( e.ToJqEvent() );
				} ); // listen4
			case "mouseleave" :
				this.Listen4( MouseleaveEvent.Name, function(e) { 
					cb( e.ToJqEvent() );
				} ); // listen4
			default :
				Interaction.Register( action, cb );
		} // switch
	} // bind
	
	/***
	* Get Accessor Functions
	*/
	public function Id() { 
		return this.objectdata.id;
	} // Id
	
	public function Position( ?p : GameObjectPosition ) {
		if ( registration_flag && p != null )
			this.position_callback(p);
		return this.objectdata.position;
	} // Position
	
	public function Size(?s : GameObjectSize ) {
		if ( registration_flag && s != null )
			this.size_callback(s); 
		return this.objectdata.size;
	} // Size
	
	public function Angle(?a : Float ) {
		if ( registration_flag && a != null )
			this.angle_callback(a); 
		return this.objectdata.angle;
	} // Angle
	
	public function ObjectData() { 
		return this.objectdata;
	} // ObjectData
	
	// private function
	private function p_updateobjectdata( objdata : GameObjectData ) { 
		this.objectdata.angle = objdata.angle;
		this.objectdata.position = objdata.position;
		this.objectdata.size = objdata.size;
	} // p_updateobjectdata
} // GameObject