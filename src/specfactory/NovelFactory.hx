package specfactory;
import novel.Animation;
import novel.Novel;
import novel.Scene;
import noveldata.AnimationData;
import noveldata.SceneData;
import noveldata.InteractionData;
import buildingblocksdata.ImageData;
import buildingblocksdata.TextData;
import tools.Measure;

class NovelFactory {

	public static function AnimationUI() : Hash<AnimationData> { 
		var actions = [ 'next','back','jump','save' ];
		var output = new Hash<AnimationData>();
		for( action in actions ) { 
			output.set( action, NovelFactory.AnimationData("image") );
		} // for action
		return output;
	} // AnimationUI
	public static function InteractionData() : InteractionData { 
		return { 
			next_animation_id : null ,
			back_animation_id : null ,
			mouseover : [ Interaction.Inflate ] ,
			mouseleave : [ Interaction.None ] ,
			mousemove : null ,
			click : [ Interaction.Next, Interaction.Hide ]
		} // return InteractionData
	} // InteractionData
	public static function SceneData() : SceneData { 
		var interaction_hash = new Hash<InteractionData>();
		var animation_array = [];
		for( k in 0...4 ) { 
			var anime = NovelFactory.AnimationData("image");
			animation_array.push( anime );
		} // for k
		for( k in 0...4 ) { 
			var interact = NovelFactory.InteractionData();
			if ( k < 3 )
				interact.next_animation_id = animation_array[k+1].animation_id;
			if ( k > 0 )
				interact.back_animation_id = animation_array[k-1].animation_id;
			interaction_hash.set( animation_array[k].animation_id, interact );
		} // for k
		return { interactions : interaction_hash, animations : animation_array };
	} // SceneData
	public static function AnimationData ( ?type : String ) : AnimationData  { 
		var output = { 
			animation_id : "novelfactorygenerated " + Measure.Increment(),
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