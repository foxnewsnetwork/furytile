package buildingblocks;
import js.JQuery;
import buildingblocks.Image;
import buildingblocksdata.CanvasData;
import buildingblocks.Text;
import buildingblocksdata.TextData;

// Static canvas class
class Canvas {
	public static var Images : Hash<Image> = new Hash<Image>();
	public static var ImageCount = 0;
	public static var Texts : Hash<Text> = new Hash<Text>();
	public static var TextCount = 0;
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
	public static function RegisterImage( img : Image ) : String { 
		var index = Canvas.ImageCount + "-" + img.Id();
		Canvas.Images.set(index, img);
		Canvas.ImageCount += 1;
		return index;
	} // RegisterImage
	public static function RemoveImage( img : Image ) : Bool { 
		if ( Canvas.Images.remove(img.Index()) )  { 
			Canvas.ImageCount -= 1;
			return true;
		} // if 
		return false;
	} // RemoveImage
	public static function RegisterText( txt : Text ) : String { 
		var index = Canvas.TextCount + "-" + txt.Id();
		Canvas.Texts.set(index, txt);
		Canvas.TextCount += 1;
		return index;
	} // RegisterText
	public static function RemoveText( txt : Text ) : Bool { 
		if ( Canvas.Texts.remove(txt.Index()) )  { 
			Canvas.TextCount -= 1;
			return true;
		} // if 
		return false;
	} // RemoveText 
	// Draw redraws the ENTIRE canvas
	public static function Draw() { 
		Canvas.Self.setAttribute("width", Canvas.Configuration.width + "px");
		Canvas.Self.setAttribute("height", Canvas.Configuration.height + "px");
		Canvas.Self.style.border = "2px solid black";
		Canvas.Context.clearRect(0,0, Canvas.Configuration.width, Canvas.Configuration.height);
		
		// Step 1: Calculate the maximum draw box that will fit in the given resolution
		var ratio = Canvas.Configuration.reference_width / Canvas.Configuration.reference_height;
		var width = Canvas.Configuration.width;
		var height = width / ratio;
		var band_height = ( Canvas.Configuration.height - height ) / 2;
		
		// Step 1.5 : Conversion lambdas
		var lambda_converter = (function() { 
			return { 
				Size : function( s : { width :Float, height :Float} ) { 
					return { 
						width : s.width / 100 * width ,
						height : s.height / 100 * height
					}; // return
				} , // size
				Position : function( p : { x :Float, y :Float } ) { 
					return { 
						x : p.x / 100 * width ,
						y : p.y / 100 * height + band_height
					}; // return
				} // position
			}; // return
		})(); // lambda_converter
		
		// Step 2: Draw the images
		for( image in Canvas.Images ) { 
			var source_position = image.Jsonify().source_position;
			var source_size = image.Jsonify().source_size;
			var position = lambda_converter.Position( image.Jsonify().position  );
			var size = lambda_converter.Size( image.Jsonify().size );
			var skew = { cos : Math.cos(image.Jsonify().angle), sin : Math.sin(image.Jsonify().angle) };
			Canvas.Context.setTransform(skew.cos, skew.sin, -skew.sin, skew.cos, 0, 0);
			Canvas.Context.drawImage(image.Source(), 
				source_position.x, 
				source_position.y, 
				source_size.width, 
				source_size.height, 
				position.x, 
				position.y, 
				size.width, 
				size.height
			); // drawImage
		} // for image
		
		// Step 3: Draw the texts
		for( text in Canvas.Texts ) {
		
			// Step a: setting the rotational matrix
			var a = { cos : Math.cos(text.Jsonify().angle), sin : Math.sin(text.Jsonify().angle) };
			Canvas.Context.setTransform( a.cos, a.sin, -a.sin, a.cos, 0, 0);
			
			// Step b: setting the alignment
			Canvas.Context.textAlign = text.Jsonify().align;
			Canvas.Context.textBaseline = text.Jsonify().baseline;
			
			// Step c: Setting color
			Canvas.Context.fillStyle = text.Jsonify().text_color;
			Canvas.Context.strokeStyle = text.Jsonify().outline_color;
			Canvas.Context.font = text.Jsonify().text_font;
			
			// Step d: writing text
			var p = lambda_converter.Position( text.Jsonify().position );
			var t = text.Jsonify().raw_text;
			Canvas.Context.fillText(t, p.x, p.y);
			Canvas.Context.strokeText(t, p.x, p.y);
		} // for text
		
		// Step Last: Draw black bands in filler areas
		Canvas.Context.setTransform(1,0,0,1,0,0); // Clears transforms
		Canvas.Context.fillStyle = "black";
		Canvas.Context.fillRect(0,0,width,band_height);
		Canvas.Context.fillRect(0,Canvas.Configuration.height - band_height, width, band_height);
	} // Draw
} // Canvas