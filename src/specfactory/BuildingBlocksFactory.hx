package specfactory;
import buildingblocks.Element;
import buildingblocks.Image;
import buildingblocksdata.CanvasData;
import buildingblocksdata.ImageData;
import tools.Random;

class BuildingBlocksFactory {

	public static function CanvasData() : CanvasData { 
		return { 
			reference_width : 2560.0 ,
			reference_height : 1600.0 ,
			width : Random.Number(2560) + 0.0 ,
			height : Random.Number(1600) + 0.0
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
			opacity : 1.0
		}; // return
	} // ImageData
	
	public static function Image() : Image { 
		return new Image( BuildingBlocksFactory.ImageData() );
	} // return Image
} // BuildingBlocksFactory