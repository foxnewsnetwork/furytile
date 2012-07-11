package specfactory;
import game2.Toy;
import game2data.ToyData;
import tools.Random;

class Game2Factory {
	public static function ToyData(?seed : Int) : ToyData { 
		var default_seed = 15;
		if ( seed != null )
			default_seed = seed;
		if ( seed == 0 ) { 
			var output = { 
				image_data : null ,
				image_id : null ,
				text_data : null ,
				text_id : null ,
				div_id : null
			}; // output
			return output;
		} // else if
		var output = { 
			image_data : BuildingBlocksFactory.ImageData() ,
			image_id : Random.Text(default_seed) ,
			text_data : BuildingBlocksFactory.TextData(),
			text_id : Random.Text(default_seed) ,
			div_id : Random.Text(default_seed)
		}; // output
		return output;
	} // ToyData 
} // Game2Factory