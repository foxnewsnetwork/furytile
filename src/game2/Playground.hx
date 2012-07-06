package game2;
import buildingblocks.Canvas;
import buildingblocks.CoreObject;
import game2data.GameEventData;
import dispatch.EventCannon;

class Playground {
	private var logic : Logic;
	private var toys : Array<Toy>;
	private var states : Hash<String>;
	private var gameover_callback : Void -> Void;
	
	public function Draw() { 
		Canvas.Draw();		
	} // Draw
	
	public function Step() { 
		this.logic.Step();
	} // Step
	
	public function GameOver( ?cb ) { 
		if ( cb == null )
			this.gameover_callback();
		this.gameover_callback = cb;
	} // GameOver
	
	public function new() { 
		this.logic = new Logic(this);
		this.toys = [];
		this.states = new Hash<String>();
	} // new
	
	public function AddToy( toy ) { 
		this.toys.push( toy );
	} // AddToy
	
	public function AddRule( rule ) { 
		this.logic.AddRule(rule);
	} // AddRule
	
	public function AddMetaRule( metarule ) { 
		this.logic.AddMetaRule( metarule );
	} // AddMetaRule
	
	public function Exists( key ) { 
		return this.states.exists(key);
	} // Exists
	
	public function Set( key, value ) {
		EventCannon.Fire( new GameEventData(key, value) ); 
		this.states.set(key, value);
	} // Set
	
	public function Get( key ) { 
		return this.states.get(key);
	} // Get
	
	public function Remove( key ) { 
		return this.states.remove(key);
	} // Remove
} // Playground