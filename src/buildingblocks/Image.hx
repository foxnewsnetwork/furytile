package buildingblocks;
import buildingblocksdata.ImageData;
import js.JQuery;
import js.Dom.HtmlDom;
import js.Dom;

class Image extends Element {
	// on source
	private var source : HtmlDom; 
	private var jqsource : JQuery;
	private var image_data : ImageData;
	private var frame : Int;
	private var max_frames : { width : Int, height : Int };
	public function new(data : ImageData) { 
		super();
		
		// Step 2 : Setting the rest of the junk
		this.image_data = data;
		var source_txt = "<img alt='image preload filler" + this.Id() + "' ";
		source_txt += "src='" + data.source + "' ";
		source_txt += "id='furytile-image-preload-" + this.Id() + "' ";
		source_txt += "style='display : none; position : absolute;'/>";
		Element.Parent.append(source_txt);
		this.source = js.Lib.document.getElementById("furytile-image-preload-" + this.Id()); 
		this.index = Canvas.RegisterImage( this );
		
		// Step 3: Setting frames (left -> right, up -> down)
		this.frame = data.frame;
		this.jqsource = new JQuery("#furytile-image-preload-" + this.Id() );
	} // new
	
	public function Frame( ?f : Int ) { 
		this.max_frames = { 
			width : Math.floor( this.jqsource.width() / this.image_data.source_size.width ), 
			height : Math.floor( this.jqsource.height() / this.image_data.source_size.height ) 
		}; // max_frames
		if ( f != null ) { 
			this.frame += 1;
			this.frame %= (this.max_frames.width * this.max_frames.height );
		} // if
		var fw = this.frame % this.max_frames.width;
		var fh = Math.floor( this.frame / this.max_frames.width );
		var s = this.image_data.source_size;
		return { 
			x : fw * s.width ,
			y : fh * s.height
		}; // image_data
	} // Frame
	
	public override function Angle( ?a : Float ) { 
		if ( a != null )
			this.image_data.angle = a;
		return this.image_data.angle;
	} // Angle
	public override function Position( ?p : { x : Float, y : Float } ) { 
		if ( p != null )
			this.image_data.position = p;
		return this.image_data.position;
	} // Position
	public override function Size( ?s : { width : Float, height : Float } ) { 
		if ( s != null )
			this.image_data.size = s;
		return this.image_data.size;
	} // Size
	public function Jsonify() { 
		return image_data;
	} // Serialize	
	
	public function Source() { 
		return this.source;
	} // Source
	
	public override function Hide() : Void { 
		if ( this.index == null )
			return;
		Canvas.RemoveImage(this);
		this.index = null;
	} // Hide
	
	public override function Show() : Void { 
		if ( this.index != null ) { 
			return;
		} // if
		this.index = Canvas.RegisterImage(this);
	} // Show
		
} // Image