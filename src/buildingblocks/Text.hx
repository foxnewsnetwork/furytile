package buildingblocks;
import buildingblocksdata.TextData;
import buildingblocks.Canvas;

class Text extends Element {
	private var text_data : TextData;
	
	public function new(data : TextData) { 
		super();
		this.text_data = data;
		Canvas.RegisterText(this);
	} // new
	
	public function Jsonify() : TextData { 
		return this.text_data;
	} // TextData
} // Text