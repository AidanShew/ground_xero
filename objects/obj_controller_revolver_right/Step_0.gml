var orbit_speed= 5;

if (obj_enemy_soldier.arrival) {
	if (controller.retreat_timer<=0) {
		with (obj_enemy_soldier) {
			if (move_type==MOVE.REVOLVER_RIGHT) {
				speed = 10;
				direction = 0;
				fire = false;
			}
		}
		//After soldiers are given speed and direction, parent object is destroyed
		instance_destroy(self);
	}
	//When Revolver Timer is greater than 0, the enemies are still oscillating up and down.
	else if (revolver_timer>0) {
		if (array_length(revolver_soldiers)>1) revolver_timer--;
		revolver_oscillate_speed+=0.05;
	
		with (obj_enemy_soldier) {
			if (move_type==MOVE.REVOLVER_RIGHT) {
				x=1250 + lengthdir_x(orbit_radius, orbit_angle);
			
				y=((room_height/2)+
				//Sine function allows object to oscillate at a depth of 350.
					sin(other.revolver_oscillate_speed)*350)+
				//Adding this with lengthdir_y(), the object is able to oscillate 
					lengthdir_y(orbit_radius, orbit_angle); //Rotation orbit_radius length away around orbit_angle degrees.
			
				revolver_target_y=(room_height/2)+(sin(other.revolver_oscillate_speed)*350); //Captures the Y position before rotation.
		
				//If all other enemies are destroyed, the last one will ignore rotation and fire.
				if (array_length(other.revolver_soldiers)<=1) rotation_order=0;
			}
		}
		
	}
	//Once Revolver Timer hits 0, enemies stop oscillating and rotate positions before resuming.
	else {
		with (obj_enemy_soldier) {
			if (move_type==MOVE.REVOLVER_RIGHT) {
				fire=false;
				x= 1250 + (lengthdir_x(orbit_radius, orbit_angle));
				y= (revolver_target_y) + (lengthdir_y(orbit_radius, orbit_angle));
				orbit_offset+=min(orbit_speed, 90 - orbit_offset);
				orbit_angle+=orbit_speed;
			
				if (orbit_offset%90==0) {
					other.revolver_timer=120;
					orbit_offset=0;
					rotation_order=(rotation_order+1) mod 4;
				}
			}
		}
	}
}