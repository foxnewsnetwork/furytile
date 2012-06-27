package haxespec;

class FuryTestCase extends haxe.unit.TestCase {
	public function assertIncludes<T>( array : Array<T>, expected : T ) : Void { 
		var flag = false;
		for( given in array ) { 
			if ( given == expected ) { 
				flag = true;
				break;
			} // if
		} // for
		this.assertTrue(flag);
	} // assertIncludes
} // FuryTestCase