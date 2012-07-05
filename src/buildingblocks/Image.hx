package buildingblocks;
import buildingblocksdata.ImageData;
import js.JQuery;
import js.Dom.HtmlDom;

class Image extends Element {
	// on source
	private var source : HtmlDom;
	private var image_data : ImageData;
	
	
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
	} // new
	
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