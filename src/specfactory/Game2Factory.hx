package specfactory;
import game2.Toy;
import game2data.ToyData;
import tools.Random;

class Game2Factory {
	public static function ToyData() : ToyData { 
		var output = { 
			image_data : BuildingBlocksFactory.ImageData() ,
			image_id : Random.Text(15) ,
			text_data : BuildingBlocksFactory.TextData(),
			text_id : Random.Text(15) ,
			div_id : Random.Text(15)
		}; // output
		return output;
	} // ToyData 
} // Game2Factory