package buildingblocks;
import js.JQuery;

// HTML divs which are constrained to live in the canvas and believe like a 
// canvas member
class Div {
	private var self : JQuery;
	private var pos : { x : Float, y : Float };
	private var siz : { width : Float, height : Float };
	public static var Parent : JQuery = (function() { 
		var p = new JQuery("canvas#canvas");
		if ( p == null || p.length <= 0 ) {
			throw "No canvas found error, try putting this code after your canvas element";
			return null;
		} // if
		return p;
	} )(); // Parent
	public function new( id : String ) {
		this.self = new JQuery(id);
		this.self.css("position" , "absolute");
		this.pos = { x : 0.0, y : 0.0 };
		this.siz = { width : 0.0, height : 0.0 };
	} // new
	
	// Position is given as a percent of canvas size
	public function Position( ?p : { x : Float, y : Float } ) : { x : Float, y : Float } { 
		var cp = {
			x : this.self.position().left + Canvas.Configuration.band_width ,
			y : this.self.position().top + Canvas.Configuration.band_height
		}; // canvas position
		var cs = { 
			width : Canvas.Configuration.effective_width , 
			height : Canvas.Configuration.effective_height 
		}; // canvas size
		if ( p != null ) {
			 this.pos = p;
			 this.self.css("left", cp.x + p.x / 100 * cs.width + "px");
			 this.self.css("top", cp.y + p.y / 100 * cs.height + "px");
		} // if
		return this.pos;
	} // Position
	
	// Size is also given as a percent of canvas
	public function Size( ?s : { width : Float, height : Float } ) { 
		var cs = { 
			width : Canvas.Configuration.effective_width , 
			height : Canvas.Configuration.effective_height 
		}; // canvas size
		if ( s != null ) { 
			this.siz = s; 
			this.self.css("width", s.width / 100 * cs.width + "px" );
			this.self.css("height", s.height / 100 * cs.height + "px" );
		} // if
	} // SIze
	
	public function Click( cb ) { 
		this.self.click(cb);
	} // Click
	
	public function Mouseover( cb ) { 
		this.self.mouseover(cb);
	} // Mouseover
	
	public function Mouseleave( cb ) { 
		this.self.mouseleave(cb);
	} // Mouseover
	
	public function Mousemove( cb ) { 
		this.self.mousemove(cb);
	} // Mouseover   
} // Div