package buildingblocks;
import js.JQuery;
import buildingblocks.Image;

// Static canvas class
class Canvas {
	public static var Images : Array<Image> = [];
	
	public static var Self = (function(){ 
		var body = new JQuery("body");
		if( body.length <= 0 ) { 
			body.append("<canvas id='canvas'>Something went terribly wrong</canvas>");
		} // if
		return js.Lib.document.getElementById("canvas");
	})(); // Self
	public static var Context = (function(){ 
		if ( Canvas.Self == null ) { 
			trace( "You need to place this code AFTER the <canvas> tag in body in order for this to work!" );
			throw "Javascript Location Error : try placing the <javascript> AFTER the <canvas> tag";
			return;
		} // if
		return untyped Canvas.Self.getContext("2d");
	})(); // Context
	// Returns the index
	public static function RegisterImage( img : Image ) : Int { 
		var index = Canvas.Images.length;
		Canvas.Images.push(img);
		return index;
	} // RegisterImage
	public static function Draw() { 
	
	} // Draw
} // Canvas