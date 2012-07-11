package specfactory;
import buildingblocks.Element;
import buildingblocks.Image;
import buildingblocks.Text;
import buildingblocksdata.TextData;
import buildingblocksdata.CanvasData;
import buildingblocksdata.ImageData;
import tools.Random;

class BuildingBlocksFactory {

	public static function CanvasData() { 
		return { 
			ratio : Random.Number(300) / 100 ,
			width : Random.Number(1440) + 0.0 ,
			height : Random.Number(900) + 0.0
		}; // return
	} // CanvasData
	public static function ImageData() : ImageData { 
		return { 
			source : "madotsuki.png" ,
			source_position : { x : 0.0, y : 0.0 } ,
			source_size : { width : 60.0, height : 60.0 } , 
			position : { x : Random.Number(100) + 0.0, y : Random.Number(100) + 0.0 } ,
			size : { width : Random.Number(10) + 10.0, height : Random.Number(10) + 10.0 } ,
			angle : Random.Number(360) / 180 * Math.PI ,
			opacity : 1.0 ,
			frame : 0
		}; // return
	} // ImageData
	public static function Image() : Image { 
		return new Image( BuildingBlocksFactory.ImageData() );
	} // return Image
	public static function TextData() : TextData { 
		var color = "rgb(" + Random.Number(256) + "," + Random.Number(256) + "," + Random.Number(256) + ")";
		var outline = "rgb(" + Random.Number(256) + "," + Random.Number(256) + "," + Random.Number(256) + ")";
		var font = ['Arial', 'sans-serif','Times New Roman'][Random.Number(3)];
		return { 
			raw_text : Random.Text(25) ,
			text_font : font ,
			text_size : Random.Number(100) ,
			text_color : color ,
			outline_color : outline ,
			align : ['start','end','left','right','center'][Random.Number(5)] ,
			baseline : ["alphabetic", "bottom", "hanging", "ideographic", "middle", "top"][Random.Number(6)] ,
			position : { x : Random.Number(100) + 0.0, y : Random.Number(100) + 0.0 } ,
			angle : Random.Number(360) / 180 * Math.PI ,
			opacity : 1.0
		} ; // return
	} // TextData
	public static function Text() : Text { 
		return new Text( BuildingBlocksFactory.TextData() );
	} // Text
} // BuildingBlocksFactory