package specfactory;
import novel.Animation;
import novel.Novel;
import novel.Scene;
import noveldata.AnimationData;
import buildingblocksdata.ImageData;
import buildingblocksdata.TextData;

class NovelFactory {
	public static function AnimationData ( ?type : String ) : AnimationData  { 
		var output = { 
			image_data : null ,
			image_id : null ,
			image_path : null ,
			text_data : null ,
			text_id : null ,
			text_path : null ,
			div_id : null ,
			div_path : null
		}; // output
		switch(type) { 
			case "image" : 
				var image_data : ImageData = BuildingBlocksFactory.ImageData();
				var rand = tools.Random.Number(30);
				output.image_id = "0";
				output.image_path = function(t) : Position { 
					return { 
						x : 25 + rand * Math.cos( t / 50 ), 
						y : 25 + rand * Math.sin( t / 50 )
					}; // return
				}; // image_path
				var angle = 0.0;
				output.image_data = function( p ) { 
					image_data.position = p;
					image_data.angle += Math.PI / 50;
					image_data.angle %= 2 * Math.PI;
					return image_data;
				} // image_data
			case "text" :
				var text_data : TextData = BuildingBlocksFactory.TextData();
				var rand = tools.Random.Number(30);
				output.text_id = "0";
				output.text_path = function(t) : Position { 
					return { 
						x : 25 + rand * Math.cos( t / 50 ), 
						y : 25 + rand * Math.sin( t / 50 )
					}; // return
				} // text_path
				var angle = 0.0;
				output.text_data = function(p) { 
					text_data.position = p;
					text_data.angle += Math.PI / 50;
					text_data.angle %= 2 * Math.PI;
					return text_data;
				} // text_data
			case "div" :
				throw "Not Implemented Exception : Div Factory";
			default :
				throw "Not Implemented Exception : Default Factory";
		} // switch
		return output;
	} // AnimationData
} // NovelFactory