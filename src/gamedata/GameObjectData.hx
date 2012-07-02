package gamedata;
import dispatch.Event;
import game.GameObject;

typedef GameObjectData = { 
	var size : GameObjectSize;
	var position : GameObjectPosition;
	var angle : Float ;
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