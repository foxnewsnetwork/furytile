package buildingblocks;
import js.JQuery;

// Generic canvas element
class Element extends CoreObject {
	public static var Count = 0;
	public static var Parent : JQuery = (function(){ 
		var jq = new JQuery("body");
		if ( jq == null ) { 
			throw "Javascript Placement Error : This code must be placed in the <body> tags";
		} // if
		return jq;
	})(); // Parent
	
	private var id : Int;
	private var index : String;
	private var has_mouse_flag : Bool;
	public var visible_flag : Bool;
	public function new() {
		super(); 
		this.has_mouse_flag = false;
		this.visible_flag = true;
		// Step 1: Setup ID
		this.id = Element.Count;
		Element.Count += 1;	
	} // new
	
	public function Id() { 
		return this.id;
	} // Id
	
	public function Index() : String { 
		return this.index;
	} // Index
	public function Hide() { 
		this.visible_flag = false;
	} // Hide
	public function Show() { 
		this.visible_flag = true;
	} // Show
	
	public function Size( ?s : { width : Float, height : Float } ) { 
		return s;
	} // Size
	public function Position( ?p : { x : Float, y : Float } ) { 
		return p;
	} // Position
	public function Angle( ?a : Float ) { 
		return a;
	} // Angle
	
	/****
	* Interaction Callbacks
	**/
	public function Click( cb : JqEvent -> Void ) { 
		Interaction.Register("mouseclick", function(e) { 
			if ( !this.visible_flag )
				return;
			var point = { x : e.pageX + 0.0, y : e.pageY + 0.0 };
			var box_position = Canvas.ConvertPosition( this.Position() );
			var box_size = Canvas.ConvertSize( this.Size() );
			if ( tools.Measure.PointInBox(point,box_position,box_size) ) { 
				cb(e);
			} // if
		} ); // mouseclick
	} // Click
	public function Mouseover( cb : JqEvent -> Void ) { 
		Interaction.Register("mousemove", function(e) { 
			if ( !this.visible_flag )
				return;
			var point = { x : e.pageX + 0.0, y : e.pageY + 0.0 };
			var box_position = Canvas.ConvertPosition( this.Position() );
			var box_size = Canvas.ConvertSize( this.Size() );
			if ( tools.Measure.PointInBox(point,box_position,box_size) ) {
				this.has_mouse_flag = true;
				cb(e);
			} // if
		} ); // mouseover
	} // Mouseover
	public function Mouseleave( cb : JqEvent -> Void ) { 
		Interaction.Register("mousemove", function(e) { 
			if ( !this.visible_flag )
				return;
			var point = { x : e.pageX + 0.0, y : e.pageY + 0.0 };
			var box_position = Canvas.ConvertPosition( this.Position() );
			var box_size = Canvas.ConvertSize( this.Size() );
			if ( !tools.Measure.PointInBox(point,box_position,box_size) ) {
				if ( this.has_mouse_flag == true ) { 
					this.has_mouse_flag = false;
					cb(e);
				} // if has mouse
			} // if
		} ); // mouseover
	} // Mouseleave
	public function Mousemove( cb : JqEvent -> Void ) { 
		Interaction.Register( "mousemove", function(e) {
			if ( !this.visible_flag )
				return; 
			cb(e);
		} ); // Register
	} // Mousemove
} // Element