package pitchdeck;
import novel.Novel;
import novel.Animation;
import noveldata.AnimationData;
import pitchdeckdata.SlideData;
class PitchDeck extends Novel {
	// the "slides"
	private var slides : Hash<Slide>;
	private var actions : Array<String>;
	
	// Load data
	public function LoadDeck(data : Array<SlideData> ) { 
		for( sd in data ) { 
			var slide = new Slide();
			slide.Load( sd.scene );
			
			this.slides.set(sd.name, slide);
			
		} // for
	} // LoadDeck
	
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
	
	private override function p_buttons( data : Hash<AnimationData> ) { 
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
	
	public override function Step() { 
		super.Step();
		for( slide in this.slides ) { 
			slide.Step();
		} // for 
	} // Step
	
	public override function Start() { 
		this.active_scene = 0;
		this.slides.get( this.actions[0] ).Show();
		tools.Stopwatch.Interval( function() { 
			this.Step();
			var s = this.slides.get( this.actions[this.active_scene] );
			s.Draw();
		}, 30 ); // Interval
	} // Show
} // PitchDeck