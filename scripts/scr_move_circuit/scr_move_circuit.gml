function scr_move_circuit(){
	if (index < array_length(path)) {		
		image_angle=direction;
		speed=controller.circuit_speed;
		direction=point_direction(x,y, path[index][0], path[index][1]);
		if (point_distance(x,y,path[index][0], path[index][1]) < 20) index++;
	}
}