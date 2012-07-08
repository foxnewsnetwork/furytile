package game2;
import game2data.ToyData;
import buildingblocks.Image;
import buildingblocks.Text;
import buildingblocks.Div;

class Toy {
	private var toydata : ToyData;
	private var image : Image;
	private var text : Text;
	private var div : Div;
	
	public function Image() { return this.image; }
	public function Text() { return this.text; }
	public function Div() { return this.div; } 
	
	public function new( p : Playground, data : ToyData ) { 
		if ( data.div_id != null ) {
			this.div = new Div( data.div_id );
		}
		if ( data.image_id != null ) {
			this.image = new Image( data.image_data );
		}
		if ( data.text_id != null ) {
			this.text = new Text( data.text_data );
		} 
		this.toydata = data;
		p.AddToy(this);
	} // new
	
	public function Hide( ) { 
		if ( this.image != null )
			this.image.Hide();
		if ( this.text != null )
			this.text.Hide();
		if ( this.div != null )
			this.div.Hide();
	} // Hide
	
	public function Show() { 
		if ( this.image != null )
			this.image.Show();
		if ( this.text != null )
			this.text.Show();
		if ( this.div != null )
			this.div.Show();
	} // Show
	
	public function Click( cb ) { 
		if ( this.image != null )
			this.image.Click(cb);
		if ( this.text != null )
			this.text.Click(cb);
		if ( this.div != null )
			this.div.Click( cb );
	} // Click
	public function Mouseover( cb ) { 
		if ( this.image != null )
			this.image.Mouseover(cb);
		if ( this.text != null )
			this.text.Mouseover(cb);
		if ( this.div != null )
			this.div.Mouseover( cb );
	} // Mouseover
	public function Mouseleave( cb ) { 
		if ( this.image != null )
			this.image.Mouseleave(cb);
		if ( this.text != null )
			this.text.Mouseleave(cb);
		if ( this.div != null )
			this.div.Mouseleave( cb );
	} // Mouseleave
	public function Mousemove( cb ) { 
		if ( this.image != null )
			this.image.Mousemove(cb);
		if ( this.text != null )
			this.text.Mousemove(cb);
		if ( this.div != null )
			this.div.Mousemove( cb );
	} // Mousemove
} // Toy