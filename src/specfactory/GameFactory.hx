package specfactory;
import tools.Random;
import gamedata.GameObjectData;

class GameFactory {
	public static function GameObjectData() { 
		var size = GameFactory.GameObjectSize();
		var position = GameFactory.GameObjectPosition();
		var g : GameObjectData = { 
			size : size ,
			position : position ,
			angle : Random.Angle() ,
			id : "0"
		}; // g 
		return g;
	} // GameObjectData
	
	public static function GameObjectSize() { 
		var s = { 
			width : 10.0 + Random.Number(10), 
			height : 10.0 + Random.Number(10) 
		}; // s 
		return s;
	} // GameObjectSize
	
	public static function GameObjectPosition() { 
		var p = { 
			x : Random.Number(50) + 0.0, 
			y : Random.Number(50) + 0.0 
		}; // p  
		return p;
	} // GameObjectPosition
} // GameFactory