package noveldata;
import buildingblocksdata.ImageData;
import buildingblocksdata.TextData;
import game2data.ToyData;
import specfactory.Game2Factory;

class AnimationHelper { 
	 public static function GetToy( data : AnimationData, index : Int ) : ToyData { 
	 	
	 	var toydata = Game2Factory.ToyData(0);
	 	toydata.image_id = data.image_id;
	 	toydata.text_id = data.text_id;
	 	toydata.div_id = data.div_id;
	 	
	 	if( toydata.image_id != null ) { 
	 		toydata.image_data = data.image_data( index );
	 		toydata.image_data.position = data.image_path( index );
	 		
	 	} // if
	 	if ( toydata.text_id != null ) { 
	 		toydata.text_data = data.text_data( index );
	 		toydata.text_data.position = data.text_path( index );
	 	} // if
	 	return toydata;
	 } // GetToy
} // AnimationData


typedef Position = { x : Float, y : Float } // Position

typedef AnimationData = {
	var animation_id : String; 
	var image_data : Int -> ImageData;
	var image_id : String;
	var image_path : Int -> Position;
	var text_data : Int -> TextData;
	var text_id : String;
	var text_path : Int -> Position;
	var div_id : String;
	var div_path : Int -> Position;
} // AnimationData

// Please note that, for all intents and purposes, all the position functions
// ought to be serializable into point-tangent pairs

