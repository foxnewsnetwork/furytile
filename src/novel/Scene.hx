package novel;
import game2.Playground;

class Scene extends Playground {
	private var animations : Array<Animation>;
	private var elapsed_frames : Int;
	public function new() { 
		super();
		this.animations = [];
		this.elapsed_frames = 0;
	} // new
	
	public override function Step( ) { 
		super.Step();
		for( animation in this.animations ) { 
			animation.Step( this.elapsed_frames );
		} // for animation
		this.elapsed_frames += 1;
	} // Step
	
	public function AddAnimation( animation : Animation ) { 
		this.animations.push(animation);
	} // AddAnimation
	
	public function Serialize() { 
		throw "Not Implemented Exception";
	} // Serialize
	
	public function Show() { 
		for( toy in this.toys ) { 
			toy.Show();
		} // for
	} // Show
	
	public function Hide() { 
		for( toy in this.toys ) { 
			toy.Hide();
		} // for
	} // Hide
} // Scene