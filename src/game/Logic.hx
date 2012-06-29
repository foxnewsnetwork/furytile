package game;

class Logic {
	private var rules : Array<GameState -> Void>;
	private var metarules : Array<Logic -> Void>;
	private var current_state : GameState;
	
	public function new() { 
		this.rules = [];
		this.metarules = [];
	} // new	
	public function CurrentState( ?state : GameState ) { 
		if ( state != null ) { 
			this.current_state = state;
		}
		return this.current_state;
	} // CurrentState
	public function Rules( ) { 
		return this.rules;
	} // Rules
	public function AddRule( rule : GameState -> Void ) : Int{ 
		this.rules.push( rule );
		return this.rules.length - 1;
	} // AddRule
	
	public function MetaRules() { 
		return this.metarules;
	} // MetaRules
	public function AddMetaRule( metarule ) : Int { 
		this.metarules.push( metarule );
		return this.metarules.length - 1;
	} // AddMetaRule
	
	public function Step( ?gamestate : GameState ) : Void { 
		this.CurrentState(gamestate);
		// Step 1: Apply metarules
		for( metarule in this.metarules ) { 
			metarule( this );
		} // for
		
		// Step 2: Apply rules
		for( rule in this.rules ) { 
			rule(this.current_state);
		} // for rule
	} // Step
} // Logic