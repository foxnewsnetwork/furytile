package novel;
import game2.Playground;
import noveldata.AnimationData;
import noveldata.InteractionData;
import noveldata.SceneData;

class Scene extends Playground {
	private var animations : Hash<Animation>;
	private var interactions : Hash<InteractionData>;
	private var elapsed_frames : Int;
	public function new() { 
		super();
		this.animations = new Hash<Animation>();
		this.elapsed_frames = 0;
	} // new
	
	public override function Step( ) { 
		super.Step();
		for( animation in this.animations ) { 
			animation.Step( this.elapsed_frames );
		} // for animation
		this.elapsed_frames += 1;
	} // Step
	
	public function Load( s_data : SceneData ) { 
		this.animations = new Hash<Animation>();
		for ( data in s_data.animations ) { 
			var anime = new Animation( this, data );
			this.AddAnimation(anime);
			
			// Interaciton management
			if ( s_data.interactions.exists( data.animation_id ) ) {
				var interaction = s_data.interactions.get( data.animation_id );
				var lambda_callback_generator = function(who : Animation, choices : Array<Interaction>) {
					if ( choices == null || choices.length == 0 )
						return function(e) { return; };
					var original = { 
						size : who.Size() ,
						angle : who.Angle()
					}; // original
					var output_array = [];
					for( choice in choices ) {
						switch( choice ) { 
							case Interaction.None :
								output_array.push( function(e) {
									
									who.Size( original.size );
									who.Angle( original.angle );
								} ); // output_array
							case Interaction.Inflate :
								output_array.push( function(e) { 
									 
									who.Size( { width : original.size.width + 1.5, height : original.size.height + 1.5 } );
								} ); // output_array
							case Interaction.Deflate :
							 	output_array.push( function(e) { 
							 		
							 		who.Size( { width : original.size.width - 1.5, height : original.size.height - 1.5 } );
							 	} ); // output_array
							 case Interaction.Hide :
							 	output_array.push( function(e) { 
							 		
							 		who.Hide();
							 	} ); // output_array
							 case Interaction.Show :
							 	output_array.push( function(e) { 
							 		
							 		who.Show();
							 	} ); // output_array
							 case Interaction.Next :
							 	output_array.push( ( function(i : InteractionData) {
							 		return function(e) { 
								 		if ( this.animations.exists( i.next_animation_id ) )
								 			this.animations.get(i.next_animation_id).Show(); 
							 		} ; // return 
							 	} )( interaction ) ); // output_array
							 case Interaction.Back :
							 	output_array.push( ( function(i : InteractionData) { 
							 		return function(e) { 
							 			if ( this.animations.exists( i.back_animation_id ) )
							 				this.animations.get(i.back_animation_id).Show();
							 		}; // return
							 	} )( interaction ) ); // output_array
						} // switch choice
					} // for choices
					return function(e) { 
						for( handler in output_array ) 
							handler(e);
					}; // output
				}; // lambda_callback_generator
				// Adding callbacks 
				anime.Click( lambda_callback_generator(anime, interaction.click ) );
				anime.Mouseleave( lambda_callback_generator(anime, interaction.mouseleave ) );
				anime.Mouseover( lambda_callback_generator(anime, interaction.mouseover ) );
				anime.Mousemove( lambda_callback_generator(anime, interaction.mousemove ) );
			} // if
		} // for data
	} // Load
	
	public function AddAnimation( animation : Animation ) { 
		this.animations.set( animation.Id(), animation );
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