package tools;

class Converter {
	// t is a percentage and goes from 0 -> 100
	public static function GetLine( a : Array<Float>, b : Array<Float> ) { 
		if ( a.length != b.length ) { 
			throw "Dumbass exception found in converter. Unmatching dimensions.";
			return null;
		} // if bad data
		return function(t : Float) { 
			var c = b.copy();
			for( k in 0...c.length ) { 
				c[k] = (b[k] - a[k]) / 100 * t + a[k];
			} // for
			return c;
		}; // function
	} // Point2Line
	
	// a happens at -1, b at 0, and c at 1
	// TODO: switch the matrix multiplication method over to div & conq
	public static function GetQuadratic( a : Array<Float>, b : Array<Float>, c : Array<Float> ) {
		if ( a.length != b.length || b.length != c.length ){ 
			throw "Dumbass exception found in converter. Unmatching dimensions.";
			return null;
		} // if bad data
		  
		var T = [[1/2, -1.0, 1/2], [-1/2, 0.0, 1/2], [0.0, 1.0, 0.0]];
		var X = [a,b,c];
		var K = [Converter.GetZeroes(a.length), Converter.GetZeroes(a.length), Converter.GetZeroes(a.length)];
		// K = T * X
		for( i in 0...3 ) { 
			for( j in 0...3 ) { 
				for( m in 0...a.length ) { 
					K[i][m] += T[i][j] * X[j][m];
				} // for m
			} // for l
		} // for i
		return function(t : Float) { 
			var output = Converter.GetZeroes(a.length);
			for( k in 0...output.length ) { 
				output[k] = K[0][k] * t * t + K[1][k] * t + K[2][k]; 
			} // for k
			return output;
		}; // function
	} // GetQuadratic
	
	public static function GetZeroes( ?len : Int ) { 
		var l = len == null? 1 : len;
		var output = new Array<Float>();
		for( k in 0...l )
			output.push(0.0);
		return output;
	} // returns some zeros
} // Converter

