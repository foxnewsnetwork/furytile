package novel;
import noveldata.SceneData;
import noveldata.AnimationData;
import game2.Playground;

class Novel extends Scene {
	private var scenes : Array<Scene>;
	private var buttons : Hash<Animation>;
	private var active_scene : Int;
	public function new() { 
		super();
	} // new
	public function Next() { 
		if ( this.scenes.length == this.active_scene + 1 )
			return;
		this.scenes[this.active_scene].Hide();
		this.active_scene += 1;
		this.scenes[this.active_scene].Show();
	} // Next
	
	public function Back() { 
		if ( this.active_scene == 0 )
			return;
		this.scenes[this.active_scene].Hide();
		this.active_scene -= 1;
		this.scenes[this.active_scene].Show();
	} // Back
	
	public function Jump( page : Int ) { 
	
	} // Jump
	
	public function LoadNovel( s_data : Array<SceneData>, ui_data : Hash<AnimationData> ) {
		this.p_scenes( s_data );
		this.p_buttons( ui_data ); 
	} // Load
	
	public function Start() { 
		this.active_scene = 0;
		this.scenes[this.active_scene].Show();
		tools.Stopwatch.Interval( function() { 
			this.Step();
			this.scenes[this.active_scene].Draw();
		} , 30); // Interaval
	} // Start
	
	/****
	* Private Functions
	***/
	// Setups and prepares the scenes
	private function p_scenes( data : Array<SceneData> ) { 
		this.scenes = [];
		for( d in data ) { 
			var scene = new Scene();
			scene.Load(d);
			this.scenes.push(scene);
			scene.Hide();
		} // for data	
	} // p_scenes
	
	// Setups the UI buttons
	private function p_buttons( data : Hash<AnimationData> ) { 
		var actions = ['next','back','jump','save'];
		this.buttons = new Hash<Animation>();
		for ( action in actions ) { 
			var anime_data = data.get( action );
			if ( anime_data == null )
				continue;
			var button = new Animation(this, anime_data );
			switch( action ) { 
				case "next" :
					button.Click( function(e) { 
						this.Next();
					} ); // Click
				case "back" :
					button.Click( function(e) { 
						this.Back();
					} ); // Click
				case "jump" : 
					button.Click( function(e) { 
						throw "Not Implemented Exception : Jump button";
					} ); // Click 
				case "save" :
					button.Click( function(e) { 
						throw "Not Implemented Exception : Save button";
					} ); // Click 
				default :
					throw "Unrecognized action exception : button setup";
			} // switch
			this.buttons.set(action, button);
		} // actions 
	} // p_buttons
} // Novel