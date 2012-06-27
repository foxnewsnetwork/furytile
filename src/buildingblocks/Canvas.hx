package buildingblocks;
import js.JQuery;
import buildingblocks.Image;
import buildingblocksdata.CanvasData;

// Static canvas class
class Canvas {
	public static var Images : Array<Image> = [];
	public static var Configuration : CanvasData = { 
		reference_width : 2560.0 ,
		reference_height : 1600.0 ,
		width : 800.0 ,
		height : 600.0 
	}; // Configuration 
	public static var Self : Dynamic = (function(){ 
		var body = new JQuery("body");
		if( body.length <= 0 ) { 
			body.append("<canvas id='canvas'>Something went terribly wrong</canvas>");
		} // if
		return js.Lib.document.getElementById("canvas");
	})(); // Self
	public static var Context : Dynamic = (function(){ 
		if ( Canvas.Self == null ) { 
			trace( "You need to place this code AFTER the <canvas> tag in body in order for this to work!" );
			throw "Javascript Location Error : try placing the <javascript> AFTER the <canvas> tag";
			return;
		} // if
		return Canvas.Self.getContext("2d");
	})(); // Context
	// Returns the index
	public static function RegisterImage( img : Image ) : Int { 
		var index = Canvas.Images.length;
		Canvas.Images.push(img);
		return index;
	} // RegisterImage
	public static function Draw() { 
		Canvas.Self.setAttribute("width", Canvas.Configuration.width + "px");
		Canvas.Self.setAttribute("height", Canvas.Configuration.height + "px");
		Canvas.Self.style.border = "2px solid black";
		// Step 1: Calculate the maximum draw box that will fit in the given resolution
		var ratio = Canvas.Configuration.reference_width / Canvas.Configuration.reference_height;
		var width = Canvas.Configuration.width;
		var height = width / ratio;
		var k_y = height / Canvas.Configuration.height;
		var band_height = ( Canvas.Configuration.height - height ) / 2;
		
		
		// Step 2: Draw the images
		for( image in Canvas.Images ) { 
			var source_position = image.Jsonify().source_position;
			var source_size = image.Jsonify().source_size;
			var position = image.Jsonify().position ;
			var size = image.Jsonify().size;
			var skew = { cos : Math.cos(image.Jsonify().angle), sin : Math.sin(image.Jsonify().angle) };
			Canvas.Context.setTransform(1, 0, 0, 1, 0, 0);
			Canvas.Context.drawImage(image.Source(), source_position.x, source_position.y, source_size.width, source_size.height, position.x * width / 100, position.y * height / 100 + band_height, size.width * width / 100, size.height * height / 100); // drawImage
		} // for image
		
		// Step 3: Draw black bands in filler areas
		Canvas.Context.setTransform(1,0,0,1,0,0); // Clears transforms
		Canvas.Context.fillStyle = "black";
		Canvas.Context.fillRect(0,0,width,band_height);
		Canvas.Context.fillRect(0,Canvas.Configuration.height - band_height, width, band_height);
	} // Draw
} // Canvas