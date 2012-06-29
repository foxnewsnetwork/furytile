package gamespec;
import haxespec.FuryTestCase;
import game.Interaction;

class InteractionSpec extends FuryTestCase {
	private var interaction : Interaction;
	private var flags : Hash<Bool>;
	
	public override function setup() { 
		this.interaction = new Interaction();
		this.flags = new Hash<Bool>();
		for( action in Interaction.Actions ) { 
			this.flags.set(action, false);
		} // for action
	} // setup
	public override function tearDown() { 
	} // tearDown
	
	public function testInteraction() {
		var count = Interaction.Actions.length; 
		for( action in Interaction.Actions ) { 
			this.interaction.Register( action, (function(a : String) { 
				return function(e) { 
					if ( !this.flags.exists(a) ) { 
						trace( "Async Test : " + a + " Failed..." );
						return;
					} // if no flag
					if ( this.flags.get(a) == true ) { 
						return;
					} // if flag already trigged
					else { 
						this.flags.set(a, true);
						count -= 1; 
						trace( "Interaction async Test : " + a + " Passed..." + count + " interaction tests remaining." );
						if( count == 0 )
							trace( "All interaction async tests passed!" );
					} // if triggerd
				}; // return
			})(action) ); // Register callback
		} // for action
		this.assertTrue(true);
		trace( "Your interactions are required to pass this test. Mouse the mouse around and hit the keyboard!" );
	} // testInteraction
} // InteractionSpec