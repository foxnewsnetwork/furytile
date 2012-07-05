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
	public static var Self : Dynamic = (function(){ 
		var body = new JQuery("body");
		if( body.length <= 0 ) { 
			body.append("<canvas id='canvas' width='800' height='600'>Something went terribly wrong</canvas>");
		} // if
		var c = js.Lib.document.getElementById("canvas");
		if ( c.getAttribute("width") == null )
			c.setAttribute("width", "800");
		if ( c.getAttribute("height") == null )
			c.setAttribute("height", "600");
		return c;
	})(); // Self
	public static var Context : Dynamic = (function(){ 
		if ( Canvas.Self == null ) { 
			trace( "You need to place this code AFTER the <canvas> tag in body in order for this to work!" );
			throw "Javascript Location Error : try placing the <javascript> AFTER the <canvas> tag";
			return;
		} // if
		return Canvas.Self.getContext("2d");
	})(); // Context
	public static var Configuration : CanvasData = (function(){
		var c = new JQuery("canvas#canvas");
		var config = { 
			ratio : 1.6 ,
			width : Std.parseFloat( c.attr( "width" ) ),
			height : Std.parseFloat( c.attr( "height" ) ),
			effective_width : 0.0 ,
			effective_height : 0.0 ,
			band_height : 0.0 ,
			band_width : 0.0
		}; // config
		
		// Step 1: Calculating effective size
		if ( config.ratio * config.height * config.height > config.width * config.width / config.ratio ) { 
			config.effective_width = config.width;
			config.effective_height = config.effective_width / config.ratio; 
		} // if tall box
		else { 
			config.effective_height = config.height;
			config.effective_width = config.effective_height * config.ratio;
		} // else fat box  
		
		// Step 2: Calculating the bands
		config.band_height = ( config.height - config.effective_height ) / 2;
		config.band_width = ( config.width - config.effective_width ) / 2;
		return config;
	})(); // Configuration
	
	public static function ConvertPosition( p : { x : Float, y : Float } ) { 
		return { 
			x : p.x / 100 * Canvas.Configuration.effective_width + Canvas.Configuration.band_width ,
			y : p.y / 100 * Canvas.Configuration.effective_height + Canvas.Configuration.band_height
		}; // return	
	} // ConvertPosition
	
	public static function ConvertSize( s : { width : Float, height : Float } ) { 
		return { 
			width : s.width / 100 * Canvas.Configuration.effective_width ,
			height : s.height / 100 * Canvas.Configuration.effective_height
		}; // return
	} // ConvertSize
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
		trace( Canvas.Configuration );
		// Step 1: Calculate the maximum draw box that will fit in the given resolution
		var ratio = Canvas.Configuration.ratio;
		var width = Canvas.Configuration.effective_width;
		var height = Canvas.Configuration.effective_height;
		var band_height = Canvas.Configuration.band_height;
		var band_width = Canvas.Configuration.band_width;
		Canvas.Context.clearRect(band_width,band_height, width, height);
		
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
			if( image.visible_flag == false )
				return; 
			var source_position = image.Jsonify().source_position;
			var source_size = image.Jsonify().source_size;
			var position = lambda_converter.Position( image.Jsonify().position  );
			var size = lambda_converter.Size( image.Jsonify().size );
			var skew = { cos : Math.cos(image.Jsonify().angle), sin : Math.sin(image.Jsonify().angle) };
			var center = { x : position.x + size.width / 2 , y : position.y + size.height / 2 };
			var shift = { 
				x : ( 1 - skew.cos ) * center.x - skew.sin * center.y ,
				y : skew.sin * center.x + ( 1 - skew.cos ) * center.y 
			}; // shift
			Canvas.Context.rotate( image.Jsonify().angle );
			Canvas.Context.translate( -shift.x, -shift.y );
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
			Canvas.Context.restore();
			Canvas.Context.setTransform(1,0,0,1,0,0); // Clears transforms
		} // for image
		
		// Step 3: Draw the texts
		for( text in Canvas.Texts ) {
			if( text.visible_flag == false )
				return;
			
			// Step aa : Extracting the data
			var t = text.Jsonify().raw_text;
			var p = lambda_converter.Position( text.Jsonify().position );
			var size = { width : Canvas.Context.measureText(t).width , height : text.Jsonify().text_size };
			
			// Step a: setting the rotational matrix
			var a = { cos : Math.cos(text.Jsonify().angle), sin : Math.sin(text.Jsonify().angle) };
			var center = { x : p.x + size.width / 2, y : p.y + size.height / 2 };
			var shift = { 
				x : ( 1 - a.cos ) * center.x - a.sin * center.y ,
				y : a.sin * center.x + ( 1 - a.cos ) * center.y
			}; // shift
			Canvas.Context.rotate( text.Jsonify().angle );
			Canvas.Context.translate( -shift.x, -shift.y );
			
			// Step b: setting the alignment
			Canvas.Context.textAlign = text.Jsonify().align;
			Canvas.Context.textBaseline = text.Jsonify().baseline;
			
			// Step c: Setting color
			Canvas.Context.fillStyle = text.Jsonify().text_color;
			Canvas.Context.strokeStyle = text.Jsonify().outline_color;
			Canvas.Context.font = text.Jsonify().text_size + "px " + text.Jsonify().text_font;
			
			// Step d: writing text
			Canvas.Context.fillText(t, p.x, p.y );
			Canvas.Context.strokeText(t, p.x, p.y);
			Canvas.Context.setTransform(1,0,0,1,0,0); // Clears transforms
			Canvas.Context.restore();
		} // for text
		
		// Step Last: Draw black bands in filler areas
		
		Canvas.Context.fillStyle = "black";
		Canvas.Context.fillRect(0,0,width,band_height);
		Canvas.Context.fillRect(0,Canvas.Configuration.height - band_height, width, band_height);
		Canvas.Context.fillRect(0,0,band_width, height);
		Canvas.Context.fillRect(Canvas.Configuration.width - band_width, 0, band_width, height);
	} // Draw
} // Canvas