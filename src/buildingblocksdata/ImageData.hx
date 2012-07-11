package buildingblocksdata;

typedef ImageData = { 
	source : String ,
	source_position : { x : Float, y : Float } ,
	source_size : { width : Float, height : Float } , 
	position : { x : Float, y : Float } ,
	size : { width : Float, height : Float } ,
	angle : Float , // angle is in radians
	opacity : Float ,
	frame : Int // frames go left -> right, up -> down
} // ImageData 

/***
* Note on angle
********
* angle is used to construct a strictly rotational matrix
* [ cos( angle ) sin( angle ) ]
* [ -sin( angle ), cos( angle ) ]
* some properties of the matrix include :
* 1 . anti-symmetrical
* 2 . det ( skew ) = 1
* 3 . imaginary eigenvalues
*/