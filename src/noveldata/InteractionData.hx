package noveldata;

typedef InteractionData = { 
	var next_animation_id : String;
	var back_animation_id : String;
	var mouseover : Array<Interaction>;
	var mouseleave : Array<Interaction>;
	var mousemove : Array<Interaction>;
	var click : Array<Interaction>;
} // InteractionData

enum Interaction { 
	None;
	Inflate;
	Deflate;
	Hide;
	Show;
	Next;
	Back;
} // Interaction