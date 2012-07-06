package gamedata;
import dispatch.Event;
import game.GameObject;
import buildingblocks.Image;
import buildingblocks.Text;
import buildingblocks.Div;

typedef GameObjectData = { 
	var images : Array<Image>;
	var texts : Array<Text>;
	var divs : Array<Div>;
	var id : String;
} // GameObjectData

typedef GameObjectSize = { 
	var width : Float;
	var height : Float;
} // GameObjectSize

typedef GameObjectPosition = { 
	var x : Float;
	var y : Float;
} // GameObjectPosition	

class GameObjectCreatedEvent extends Event { 
	public static var Name = "Game Object Created Event " + tools.Random.Text(15);
	public var gameobject : GameObject;
	
	public function new( gameobject : GameObject ) { 
		super( GameObjectCreatedEvent.Name, 0 );
		this.gameobject = gameobject;
	} // new
} // GameObjectCreatedEvent

class GameObjectPositionEvent extends Event { 
	public static var Name = "Game Object Position Changed " + tools.Random.Text(20);
	public var object_key : String;
	public var position : GameObjectPosition;
	
	public function new( ok : String, p : GameObjectPosition ) { 
		super( GameObjectPositionEvent.Name, 0 );
		this.object_key = ok;
		this.position = p;
	} // new
} // GameObjectPositionChanged