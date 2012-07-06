package game2spec;
import game2.Playground;
import game2.Logic;
import game2.Toy;
import specfactory.Game2Factory;

class PlaygroundSpec extends haxespec.FuryTestCase {
	private var playground : Playground;
	public override function setup() { 
		// Step 1: Setup
		this.playground = new Playground();
		
		// Step 2: Configuring UI
		var toydata = Game2Factory.ToyData();
		toydata.text_id = null;
		toydata.div_id = null;
		var btn = new Toy( this.playground, toydata );
		btn.Click( function(e) { 
			var num = Std.parseInt(this.playground.Get("number"));
			num += 1;
			this.playground.Set("number", num + "");
		} ); // Click 
		
		// Step 3: Setup display
		var fagdata = Game2Factory.ToyData();
		fagdata.image_id = null;
		fagdata.div_id = null;
		fagdata.text_data.text_size = 20;
		fagdata.text_data.raw_text = "0";
		var dis = new Toy( this.playground, fagdata );
		
		// Step 3.5: Setup gameover
		this.playground.GameOver(function() { 
			js.Lib.alert("You win");
		} ); // GameOver
		
		// Step 4: Configuring logic
		this.playground.AddRule( function(p) { 
			var num = Std.parseInt(p.Get("number"));
			dis.Text().Text(num + "");
		} ); // AddRule
		this.playground.AddRule( function(p) { 
			var num = Std.parseInt( p.Get("number") );
			if( num == 10 )
				p.GameOver();
		} ); // AddRule
	} // Setup
	public override function tearDown() { }
	
	public function testIntegration() { 
		tools.Stopwatch.Interval(function(){ 
			this.playground.Draw();
			this.playground.Step();
		}, 25); // looping
	} // testIntegration
} // PlaygroundSpec
