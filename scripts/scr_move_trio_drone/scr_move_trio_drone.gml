function move_trio_drone(){	
	if (arrived&&obj_controller_trio.move_timer>0) {
		if (is_thrown) {
			if (instance_exists(obj_player)&&homing_timer-->0) direction=point_direction(x,y, obj_player.x, obj_player.y);
			speed=20;
		}
		else {
			orbit_angle += 10;
	
			x = path[0] + lengthdir_x(40, orbit_angle);
			y = path[1] + lengthdir_y(40, orbit_angle);
		}
	}
	else if (!arrived) {
		if (point_distance(x,y, path[0], path[1]) <= 15) {
			arrived=true;
		}
		else {
			direction=point_direction(x,y, path[0], path[1]);
		}
	}
	else {
		speed=-20;
		direction=point_direction(x,y,path[0], path[1]);
	}
}