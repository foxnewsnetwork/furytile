package tools;

class Stopwatch {
	public static var TIME : Float = haxe.Timer.stamp();
	
	public static function Start() : Float{ 
		Stopwatch.TIME = haxe.Timer.stamp();
		return Stopwatch.TIME;
	} //end Start
	
	public static function Stop() : Float{ 
		var startTime : Float = Stopwatch.TIME;
		var difference : Float = Stopwatch.Start() - startTime;
		return difference;
	} // end Stop
	
	public static function Interval( cb : Void -> Void, duration : Int ) { 
		var timer = new haxe.Timer(duration);
		timer.run = cb;
		return timer;
	} // Interval
} // Stopwatch