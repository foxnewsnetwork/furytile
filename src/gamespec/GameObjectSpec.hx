package gamespec;

import game.GameObject;
import gamedata.GameObjectData;
import gamedata.GameStateData;
import haxespec.FuryTestCase;
import specfactory.GameFactory;
import tools.Random; 
import dispatch.EventCannon;
import game.GameState;

class GameObjectSpec extends FuryTestCase {
	private var gameobject : GameObject;
	private var gamestate : GameState;
	private var original_gameobjectdata : GameObjectData;
	private var modified_gameobjectdata : GameObjectData;
	private var event_gameobject_flag : Bool;
	private var original_gameobject_id : String;
	private var gameobjectdata_id_modified : Bool;
	public override function setup() { 
		EventCannon.Listen(GameObjectCreatedEvent.Name, function(e){ 
			if ( e.gameobject != null )
				this.event_gameobject_flag = true;
		} ); // Listen
		this.event_gameobject_flag = false;
		this.original_gameobjectdata = GameFactory.GameObjectData();
		var a = this.original_gameobjectdata.id;
		this.gameobjectdata_id_modified = false;
		this.modified_gameobjectdata = GameFactory.GameObjectData();
		this.gamestate = new GameState();
		this.gameobject = new GameObject( this.original_gameobjectdata );
		if ( a != this.original_gameobjectdata.id ) { 
			this.gameobjectdata_id_modified = true;
		} // if
		this.original_gameobject_id = gameobject.Id();
		this.gamestate.Set(this.gameobject.Id(), this.gameobject.ObjectData() );
	} // setup
	public override function tearDown() { 
		
	} // tearDown
	public function testPosition() {
		this.gameobject.Register( this.gamestate ); 
		var p = GameFactory.GameObjectPosition();
		this.assertDifferent( this.gameobject.Position(), p );
		this.assertDifferent( this.gamestate.Get(this.gameobject.Id()).position, p );
		this.gameobject.Position( p );
		this.assertEquals( this.gamestate.Get(this.gameobject.Id()).position, p );
		this.assertEquals( this.gameobject.Position(), p );
	} // testPosition
	public function testSize() { 
		this.gameobject.Register(this.gamestate);
		var s = GameFactory.GameObjectSize();
		this.assertDifferent( this.gamestate.Get(this.gameobject.Id()).size, s );
		this.assertDifferent( this.gameobject.Size(), s );
		this.gameobject.Size(s);
		this.assertEquals( this.gamestate.Get(this.gameobject.Id()).size, s );
		this.assertEquals( this.gameobject.Size(), s );
	}
	public function testAngle() { 
		this.gameobject.Register( this.gamestate );
		var a = Random.Number(100) + 0.0;
		this.assertDifferent( this.gamestate.Get(this.gameobject.Id()).angle, a );
		this.assertDifferent( this.gameobject.Angle(), a );
		this.gameobject.Angle(a);
		this.assertEquals( this.gamestate.Get(this.gameobject.Id()).angle, a );
		this.assertEquals( this.gameobject.Angle(), a );
	}
	public function testSetup() {
		// Proper modification
		this.assertTrue( this.gameobjectdata_id_modified );
		
		// Different seed data
		this.assertDifferent( this.original_gameobjectdata, this.modified_gameobjectdata );
		
		// Modification
		this.gamestate.Modify(this.gameobject.Id(), this.modified_gameobjectdata );
		
		// Checking junk out
		this.assertEquals( this.gameobject.Angle(), this.modified_gameobjectdata.angle );
		this.assertEquals( this.gameobject.Position(), this.modified_gameobjectdata.position );
		this.assertEquals( this.gameobject.Size(), this.modified_gameobjectdata.size );
		
		// Id not changed
		this.assertDifferent( this.gameobject.Id(), this.modified_gameobjectdata.id );
		
		// Direct modification should not work
		var lolcat : GameObjectData = this.gamestate.Get( this.gameobject.Id() );
		lolcat.angle = 10.0;
		this.assertDifferent(this.gameobject.Angle(), 10.0);
	} // testSetup
} // GameObjectSpec