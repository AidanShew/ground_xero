function scr_move_helix(){
	if (y<(room_height/2)-200) {
		if (move_type==MOVE.HELIX_LEFT) direction-=2;
		else direction+=2;
	}
	else {
		if (move_type==MOVE.HELIX_LEFT) direction+=2;
		else direction-=2;
	}
	if (y<room_height/2&&fire_counter>=12) {
		var bullet=instance_create_layer(x, y, "Instances", obj_bullet_soldier);
		bullet.direction=image_angle;
		bullet.red=red;
		fire_counter=0;
	}
	else fire_counter++;
}