package game;
import buildingblocks.Canvas;
import buildingblocks.Text;
import buildingblocks.Image;
import dispatch.EventCannon;
import gamedata.GameStateData;

class Renderer {
	private var images : Array<Image>;
	private var texts : Array<Text>;
	private var gamestate : GameState;
	
	public function new(state : GameState) { 
		this.images = [];
		this.texts = [];
		this.gamestate = state;
		
		EventCannon.Listen(GameStateDataChangedEvent.Name, function(e) { 
			this.p_processgamestate(e);
		} ); // registering the event
	} // new
	
	public function Draw() { 
		Canvas.Draw();
	} // Draw
	
	// Private section
	// Please note that changing the gamestate in this function WILL
	// result in an infinite loop that kills everyone and memory leaks
	private function p_processgamestate( event ) { 
		throw "Not Implemented Error : Please do not try to implement abstract classes";
	} // p_processgamestate
} // Renderer