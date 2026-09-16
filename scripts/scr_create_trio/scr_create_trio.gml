function create_trio(){
	/*
	---INSTRUCTIONS---
	* Not recommended for the step function, however instance_exists for
	loop will attempt to stop it from iterating more than once.
	
	---ABOUT---
	* Will create obj_controller_trio which will handle everything, it will
	create soldiers and drones accordingly, it will also guide them through
	their movements.
	* See the obj_controller_trio Create and Step functions for more
	information about this movement pattern and how it works!
	*/
	
	if (!instance_exists(obj_controller_trio)) instance_create_layer(0,0, "Instances", obj_controller_trio);
}