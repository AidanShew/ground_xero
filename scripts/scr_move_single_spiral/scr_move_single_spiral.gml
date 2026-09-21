function move_single_spiral(){
	if (!arrival && point_distance(x,y, path[0], path [1]) <= 15) {
		speed = 0;
		array_push(controller.arrived_spiral_drones, self);
		arrival = true;
	}
	else if (array_length(controller.arrived_spiral_drones) == 15) {
		fire = true;
		angle += 2;
		x = center_x+lengthdir_x(orbit_radius, orbit_angle+angle);
		y = center_y+lengthdir_y(orbit_radius, orbit_angle+angle);
		image_angle=orbit_angle+angle;
	}
}