function move_revolver(){
	sprite_index=red ? spr_soldier_red : spr_soldier_blue;
	if (obj_mission_one.retreat_timer > 0) {
		if (!arrival) { //Hasn't reached initial_target_x
			if (move_type==MOVE.REVOLVER_RIGHT) {
				speed= x>initial_target_x ? 10 : 0;
				arrival=x<=initial_target_x;
			}
			else {
				speed=x<initial_target_x ? 10 : 0;
				arrival= x>=initial_target_x;
			}
			fire=arrival;
		}
		else fire= rotation_order=0;
	
		if (fire) {
			if (fire_counter>10) {
				for (var i=0; i<6; i++) {
					var bullet=instance_create_layer(x,y,"Instances", obj_soldier_bullet);
					bullet.direction=move_type==MOVE.REVOLVER_LEFT ? 326.25+(i*11.25) : 146.25+(i*11.25);
					bullet.red=red;
				}
				fire_counter=0;
			}
			else fire_counter++;
		}
	}
}