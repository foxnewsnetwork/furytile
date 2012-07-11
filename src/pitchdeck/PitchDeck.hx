package pitchdeck;
import novel.Novel;
import novel.Animation;
import noveldata.AnimationData;

class PitchDeck extends Novel {
	// the "slides"
	private var slides : Hash<Slide>;
	private var actions : Array<String>;
	
	// Load data
	public function LoadDeck() { }
	
	// Constructor
	public function new() { 
		super();
		this.actions = ['problem','solution','finance','comparison']; 
		this.slides = new Hash<Slide>();
	} // new
	
	public override function Jump( page : Int ) { 
		var act = this.actions[page];
		var old_act = this.actions[this.active_scene];
		this.slides.get(old_act).Hide();
		this.slides.get(act).Show();
		this.active_scene = page;
	} // Jump 
	
	private function p_buttons( data : Hash<AnimationData> ) { 
		for( k in 0...this.actions.length ) {
			var act = actions[k]; 
			var anime_data = data.get( act );
			if ( anime_data != null ) { 
				var button = new Animation( this, anime_data );
				this.buttons.set(act, button);
				button.Click((function(kk) { 
					return function(e) { this.Jump(kk); };
				} )(k)); // Click
			} // if
		} // for act
	} // p_buttons
	
	
} // PitchDeck