package buildingblocksspec;
import buildingblocks.Element;

class ElementSpec extends haxe.unit.TestCase {

	private var element : Element;
	public override function setup() {
		super.setup(); 
		this.element = new Element();
	} // setup
	
	public function testSetup() { 
		this.assertEquals( Element.Count - 1, this.element.Id() );
	} // testSetup
} // ElementSpec