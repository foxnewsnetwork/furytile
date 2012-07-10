package tools;

// Measures stuff and whatnot
class Measure {
	public static var Count = -1;
	public static function Increment() : Int { 
		Measure.Count += 1;
		return Measure.Count;
	} // Increment
	public static function PointInBox( p : { x : Float, y : Float }, box_p : { x : Float, y : Float }, box_s : { width : Float, height : Float } ) { 
		if ( box_p.x <= p.x && p.x <= box_p.x + box_s.width )
			if ( box_p.y <= p.y && p.y <= box_p.y + box_s.height )
				return true;
		return false;
	} // PointInBox
} // Measure