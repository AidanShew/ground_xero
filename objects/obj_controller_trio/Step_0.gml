var target_x=(room_width/2);
var target_y=350;
var orbit_speed= 10;
move_timer--;

if (!instance_exists(obj_enemy_soldier) && !instance_exists(obj_enemy_drone)) instance_destroy(self);

//Enemy Soldier
if (instance_exists(obj_enemy_soldier)) {
	if (obj_enemy_soldier.arrival&&move_timer>0) {
		x=target_x;
		y=target_y;
		
		speed=0;
		if (revolver_timer>0) {
			with (obj_enemy_soldier) {
				if (move_type==MOVE.TRIO) fire= rotation_order=0;
			}
			if (array_length(revolver_soldiers)>1) revolver_timer--;
		}
		else {
			with (obj_enemy_soldier) {
				if (move_type==MOVE.TRIO) {
					fire=false;
					orbit_offset+=min(orbit_speed, 90 - orbit_offset);
					if (orbit_offset>=90) {
						other.revolver_timer=20;
						orbit_offset=0;
						rotation_order=(rotation_order+1) mod 4;
					}
					orbit_angle+=orbit_speed;
					x= controller.x + (lengthdir_x(75, orbit_angle));
					y= controller.y + (lengthdir_y(75, orbit_angle));
				}
			}
		}
	}
	else if (!obj_enemy_soldier.arrival) {
		speed=20;
		direction=point_direction(x,y, target_x, target_y);
		if (point_distance(x,y, target_x, target_y)<=15) obj_enemy_soldier.arrival=true;
	}
	else if (move_timer<=0) {
		speed=20;
		direction+=0.5
	}
}

//Enemy Drones
if (instance_exists(obj_enemy_drone)) {
	var left_index = array_length(star_drones_left) == 1 ? 0 : array_length(star_drones_left)-1;
	var right_index = array_length(star_drones_right) == 1 ? 0 : array_length(star_drones_right)-1;
	
	if (!instance_exists(star_drones_left[left_index]) && left_index > 0) {
		array_delete(star_drones_left, left_index, 1);
	}
	
	if (!instance_exists(star_drones_right[right_index]) && right_index > 0) {
		array_delete(star_drones_right, right_index, 1);
	}
	
	if (star_timer <= 0) {
		
		/*
		If statement checks for:
			* If left index exists AND is greater than or equal to 0.
			* If There are more left drones than right, inclusive
		*/
		if ((left_index >= 0) &&
		(instance_exists(star_drones_left[left_index])) && 
		(array_length(star_drones_left) >= array_length(star_drones_right))) {
			
			star_drones_left[left_index].is_thrown = true;
			if (left_index > 0) array_delete(star_drones_left, left_index, 1);
			
			show_debug_message("Left: "+string(array_length(star_drones_left)));
		}
		
		/*
		Else if statement checks for:
			* If right index exists AND is greater than or equal to 0.
			* If There are more right drones than left
		*/
		else if ((right_index >= 0) &&
		(instance_exists(star_drones_right[right_index])) && 
		((array_length(star_drones_right) > array_length(star_drones_left) || !instance_exists(star_drones_left[left_index])))) {
			
			star_drones_right[right_index].is_thrown = true;
			if (right_index > 0) array_delete(star_drones_right, right_index, 1);
			
			show_debug_message("Right: "+string(array_length(star_drones_right)));
		}
		star_timer = 30;
	}
	else if (obj_enemy_drone.arrived) star_timer--;
}