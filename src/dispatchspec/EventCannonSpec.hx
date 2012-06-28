package dispatchspec;
import specfactory.DispatchFactory;
import dispatch.EventCannon;
import dispatch.Event;
import haxespec.FuryTestCase;

class EventCannonSpec extends FuryTestCase {

	private var events : Array<Event>;
	public override function setup() { 
		super.setup();
		this.events = [];
		for( k in 0...50) { 
			this.events.push( DispatchFactory.Event() );
		} // for
	} // setup
	public function testStandardUsage() { 
		for( event in this.events ) { 
			EventCannon.Listen(event.name, (function(ev) { 
				return function(e : Event) { 
					this.assertEquals(ev.name, e.name);
					this.assertEquals(ev.origin, e.origin);
				}; // return
			})(event)); // EventCannon
		} // for events listening
		
		for( event in this.events ) { 
			EventCannon.Fire(event);
		} // for events firing
	} // testStandardUsage
	
	public function testProbableUsage() { 
		var lambda_faggot = function(){ 
			var is : String = "not a faggot";
			EventCannon.Listen("trevor faggot", function(e){ 
				if ( e.faggot == true )
					is = "a faggot";
			} ); //  EventCannon.Listen
			return { 
				Is : function(text) { 
					if( text == is)
						return true;
					else
						return false;
				} // Is
			}; // return
		}; // lambda_faggot 
		var trevor = lambda_faggot(); // anonymouse trevor 
		var henry = lambda_faggot();
		
		EventCannon.Fire( { 
			name : "trevor faggot" ,
			origin : 0 ,
			faggot : true
		} ); // EventCannon.Fire
		
		this.assertTrue( trevor.Is("a faggot") );
		this.assertTrue( henry.Is("a faggot") );
	} // testProbableUsage
	public override function tearDown() { 
		super.tearDown();
	} // tearDown
} // EventCannonSpec