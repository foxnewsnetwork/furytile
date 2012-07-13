package specfactory;
import buildingblocksdata.ImageData;
import pitchdeckdata.SlideData;
import noveldata.SceneData;
import noveldata.AnimationData;
import noveldata.InteractionData;
import game2data.ToyData;

class PitchDeckFactory {
	public static function UIData() { 
		var actions = ['problem','solution','finance','comparison'];
		var output = new Hash<AnimationData>();
		for( k in 0...actions.length ) {
			var act = actions[k]; 
			var button = NovelFactory.AnimationData("image");
			button.image_path = function(f:Int) : Position { 
				return { x : 5.0 + 5 * k, y : 2.0 };
			} // button
			var image_data = BuildingBlocksFactory.ImageData();
			image_data.source = "chara4.gif";	
			image_data.source_size = { width : 32.0, height : 32.0 };
			image_data.position = { x : 0.0, y : 0.0 };
			image_data.size = { width : 5.5, height : 5.5 };
			image_data.frame = k;
			button.image_data = (function(i) { 
				return function(f:Int) : ImageData { return i; }; // image_data
			})(image_data);
			output.set( act, button );
		} // for
		return output;
	} // UIData

	public static function SlideData( type : String ) { 
		var slide_data : SlideData = { name : type, scene : null };
		switch( type ) { 
			case "problem" :
				var scene_data : SceneData = { animations : null, interactions : new Hash<InteractionData>() };
				var image_data : ImageData = BuildingBlocksFactory.ImageData();
				image_data.source = "chara4.gif";
				image_data.source_size = { width : 32.0, height : 32.0 };
				image_data.position = { x : 0.0, y : 0.0 };
				var animation_data : AnimationData = NovelFactory.AnimationData( "image" );
				animation_data.image_path = function(f : Int) : Position { 
					return { 
						x : 40 + 10 * Math.cos( f / 50 ) ,
						y : 50 + 5 * Math.sin( f / 60 )
					}; // return
				}; // image_path
				animation_data.image_data = function( f : Int ) : ImageData { 
					image_data.angle += Math.PI / 360;
					image_data.angle %= 2 * Math.PI;
					image_data.frame += 1;
					
					return image_data;
				}; // image_data
				scene_data.animations = [animation_data];
				slide_data.scene = scene_data;
			case "solution" :
			
			case "finance" :
			
			case "comparison" :
			
			default :
				throw "Fuck you";
		} // switch
		return slide_data;
	} // SlideData
} // PitchDeckFactory