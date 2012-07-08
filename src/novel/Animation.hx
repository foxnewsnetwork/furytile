package novel;
import game2.Toy;
import noveldata.AnimationData;

class Animation extends Toy {

	private var animation_data : AnimationData;
	
	public function new(scene : Scene, data : AnimationData ) {
		super( scene, AnimationHelper.GetToy( data, 0 ) );
		this.animation_data = data;
		scene.AddAnimation(this); 
	} // new
	
	public function Step( time : Int ) { 
		var ad = AnimationHelper.GetToy( this.animation_data, time );
		if ( ad.image_id != null ) { 
			this.image.Angle( ad.image_data.angle );
			this.image.Position( ad.image_data.position );
			this.image.Size( ad.image_data.size );
		} // if
		if ( ad.text_id != null ) {
			this.text.Angle( ad.text_data.angle );
			this.text.Position( ad.text_data.position );
			this.text.Size( { width : this.Text().Size().width, height : ad.text_data.text_size + 0.0 } );
		} // if
		
	} // Step
} // Animation