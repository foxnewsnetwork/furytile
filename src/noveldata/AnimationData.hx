package noveldata;
import buildingblocksdata.ImageData;
import buildingblocksdata.TextData;
import game2data.ToyData;
import specfactory.Game2Factory;

class AnimationHelper { 
	 public static function GetToy( data : AnimationData, index : Int ) : ToyData { 
	 	var toydata = Game2Factory.ToyData();
	 	toydata.image_id = data.image_id;
	 	toydata.text_id = data.text_id;
	 	toydata.div_id = data.div_id;
	 	
	 	if( toydata.image_id != null ) { 
	 		toydata.image_data = data.image_data( data.image_path(index) );
	 	} // if
	 	if ( toydata.text_id != null ) { 
	 		toydata.text_data = data.text_data( data.text_path(index) );
	 	} // if
	 	return toydata;
	 } // GetToy
} // AnimationData


typedef Position = { x : Float, y : Float } // Position

typedef AnimationData = { 
	var image_data : Position -> ImageData;
	var image_id : String;
	var image_path : Int -> Position;
	var text_data : Position -> TextData;
	var text_id : String;
	var text_path : Int -> Position;
	var div_id : String;
	var div_path : Int -> Position;
} // AnimationData

// Please note that, for all intents and purposes, all the position functions
// ought to be serializable into point-tangent pairs