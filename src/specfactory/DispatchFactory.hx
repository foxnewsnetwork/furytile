package specfactory;
import dispatch.Event;

class DispatchFactory {
	public static function Event() : Event { 
		return new Event( tools.Random.Text(25), tools.Random.Number(999) );
	} // Event 
} // DispatchFactory