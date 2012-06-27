package buildingblocks;
import buildingblocksdata.ImageData;
import js.JQuery;
import js.Dom.HtmlDom;

class Image extends Element {
	// on source
	private var source : HtmlDom;
	private var image_data : ImageData;
	
	// status
	private var index : Int;
	
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
	
	public function Jsonify() { 
		return image_data;
	} // Serialize	
	
	public function Source() { 
		return this.source;
	} // Source
} // Image