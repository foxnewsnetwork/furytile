package buildingblocks;
import js.JQuery;

// Generic canvas element
class Element {
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
	 
	public function new() { 
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
	public function Hide() { }
	public function Show() { }
} // Element