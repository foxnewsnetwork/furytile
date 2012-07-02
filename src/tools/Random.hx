package tools;

// Macros for generating convenient integer randoms
class Random {
	public static function OneOf<T>( stuff : Array<T> ) { 
		return stuff[Random.Number(stuff.length)];
	} // OneOf

	// Generates a funtion that random transform the input
	// should only be used for numbers (obviously)
	public static function Transform( ?length : Int ) : Int -> Int { 
		var l = 5;
		if ( length != null )
			l = length;
		var transforms = [function(a) { 
			return a; 
		}]; // transform
		for( k in 0...l ) { 
			var a = Random.Number(9); var b = Random.Number(9); var c = Random.Number(9);
			transforms.push((function(x,y,z){
				return function(j : Int) : Int { 
					return x * j + y - z;
				}; // return
			})(a,b,c)); // transforms.push
		} // for k
		var transform = (function(fun : Array<Int->Int>){ 
			return function(a){ 
				for( f in fun ) { 
					a = f(a);
				} // for
				return a;
			}; // return
		} )(transforms); // transform
		return transform;
	} // Transform

	// Defaults to between 0 -> 99 (inclusive)
	public static function Number( ?upper_cap : Int ) : Int { 
		var cap = 100;
		if( upper_cap != null )
			cap = upper_cap;
		return Math.floor( Math.random() * cap );
	} // Number
	
	public static function Decimal( ) : Float { 
		return Random.Number(99999) / 99999;
	} // Float
	
	public static function Text( ?len : Int ) : String { 
		var l = 100;
		if ( len != null )
			l = len;
		var alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','%','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
		var rand_arr = [];
		for( k in (0...l) )
			rand_arr.push( Random.Number(alphabet.length) );
		return Lambda.map(rand_arr, function(n) { return alphabet[n]; } ).join("");
	} // Text
	
	public static function Percent() : Float { 
		return Random.Number(100) / 100;
	} // Percent 
	
	public static function Hex( ?len : Int ) : String { 
		var l = 6;
		if ( len != null )
			l = len;
		var hex = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'];
		var rand_arr = [];
		for( k in 0...l ) { 
			rand_arr.push( Random.Number(hex.length) );
		} // for k
		return "#" + Lambda.map(rand_arr, function(n) { return hex[n]; } ).join("");
	} // Hex
	
	//always in radians
	public static function Angle() : Float { 
		return Random.Number(360) * Math.PI / 180;
	}  // Angle
} // Random