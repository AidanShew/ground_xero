show_debug_message("Move Timer: "+string(move_timer));
var target_x=(room_width/2);
var target_y=350;
var orbit_speed= 10;
move_timer--;

//Enemy Soldier
if (instance_exists(obj_enemy_soldier)) {
	show_debug_message("X: "+string(x)+"\nY: "+string(y));
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