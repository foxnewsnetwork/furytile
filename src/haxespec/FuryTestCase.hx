package haxespec;

class FuryTestCase extends haxe.unit.TestCase {
	public function assertIncludes<T>( array : Array<T>, expected : T, ?pos : haxe.PosInfos ) : Void { 
		var flag = false;
		for( given in array ) { 
			if ( given == expected ) { 
				flag = true;
				break;
			} // if
		} // for
		if ( !flag ) { 
			haxe.Log.trace( "Expected " + array.toString() + " to contain ", pos );
			haxe.Log.trace( expected, pos );
		} // if 
		this.assertTrue(flag, pos);
	} // assertIncludes
	
	public function assertDifferent<T>( expected : T, actual : T, ?pos : haxe.PosInfos ) : Void { 
		var flag = (expected == actual);
		if ( flag ) { 
			haxe.Log.trace( "Expected ", pos );
			haxe.Log.trace( expected, pos );
			haxe.Log.trace( " to be different from ", pos );
			haxe.Log.trace( actual, pos );
		} // if
		this.assertFalse( flag, pos );
	} // assertDifferent
	
	public function assertChange<T>( when : Void -> Void, from : T, to : T, ?pos : haxe.PosInfos ) : Void { 
		when();
		var flag = (from == to );
		if( !flag ) { 
			haxe.Log.trace( "Expected ", pos );
			haxe.Log.trace( from, pos );
			haxe.Log.trace( " to change to ", pos );
			haxe.Log.trace( to, pos );
		} // if 
		this.assertTrue(flag, pos);
	} // assertChange  
} // FuryTestCase