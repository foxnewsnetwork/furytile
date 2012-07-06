package game2;

class Logic {
	private var rules : Array<Playground -> Void>;
	private var metarules : Array<Logic -> Void>;
	private var playground : Playground;
	
	public function new(p:Playground) { 
		this.rules = [];
		this.metarules = [];
		this.playground = p;
	} // new
	
	public function Rules( ) { 
		return this.rules;
	} // Rules
	public function AddRule( rule : Playground -> Void ) : Int{ 
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
	
	public function Step() : Void { 
		// Step 1: Apply metarules
		for( metarule in this.metarules ) { 
			metarule(this);
		} // for
		
		// Step 2: Apply rules
		for( rule in this.rules ) { 
			rule(this.playground);
		} // for rule
	} // Step
} // Logic