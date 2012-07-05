package buildingblocks;
import buildingblocksdata.TextData;
import buildingblocks.Canvas;

class Text extends Element {
	private var text_data : TextData;
	
	public function new(data : TextData) { 
		super();
		this.text_data = data;
		this.index = Canvas.RegisterText(this);
	} // new
	
	public function Jsonify() : TextData { 
		return this.text_data;
	} // TextData
	
	public function Text( ?raw_txt : String ) { 
		if ( raw_txt != null )
			this.text_data.raw_text = raw_txt;
		return this.text_data.raw_text;
	} // Text
	
	public function Append( raw_txt : String ) { 
		this.text_data.raw_text += raw_txt;
		return this.text_data.raw_text;
	} // Append
	
	public function TextData( ?data : TextData ) { 
		if( data != null )
			this.text_data = data;
		return this.text_data;
	} // TextData
	
	public function Position( ?p : { x : Float, y : Float } ) { 
		if( p != null )
			this.text_data.position = p;
		return this.text_data.position;
	} // Position
	
	public function Angle( ?a : Float ) { 
		if ( a != null )
			this.text_data.angle = a;
		return this.text_data.angle;
	} // Angle
	public override function Hide() : Void { 
		if ( this.index == null )
			return;
		Canvas.RemoveText(this);
		this.index = null;
	} // Hide
	
	public override function Show() : Void { 
		if ( this.index != null ) { 
			return;
		} // if
		this.index = Canvas.RegisterText(this);
	} // Show
} // Text