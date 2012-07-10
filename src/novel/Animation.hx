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
	
	public function Id() { 
		return this.animation_data.animation_id;
	} // Id
	
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
	
	public function Position( ?p : Position ) : Position { 
		if ( animation_data.image_id != null ) { 
			return this.image.Position( p );
		} // if
		if ( animation_data.text_id != null ) { 
			return this.text.Position( p );
		} // if
		if ( animation_data.div_id != null ) { 
			throw "Not implemented exception : Positioning a div";
			
		} // if
		return p;
	} // Position
	public function Size( ?s : { width : Float, height : Float } ) { 
		if ( animation_data.image_id != null ) { 
			return this.image.Size( s );
		} // if
		if ( animation_data.text_id != null ) { 
			return this.text.Size( s );
		} // if
		if ( animation_data.div_id != null ) { 
			throw "Not implemented exception : Positioning a div";
		} // if
		return s; 
	} // Size
	public function Angle( ?a : Float ) : Float { 
		if ( animation_data.image_id != null ) { 
			return this.image.Angle( a );
		} // if
		if ( animation_data.text_id != null ) { 
			return this.text.Angle( a );
		} // if
		if ( animation_data.div_id != null ) { 
			throw "Not implemented exception : Positioning a div";
		} // if
		return a;
	} // Float
} // Animation