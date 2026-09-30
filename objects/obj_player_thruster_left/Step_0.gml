show_debug_message("Index: "+string(image_index));
switch (thruster_state) {
	case THRUSTER.LEFT:
		if (image_index >= 1) image_speed = -1
		else if (sprite_index != spr_player_blue_thruster_left_extended) sprite_index = spr_player_blue_thruster_left_extended;
	break;
	
	case THRUSTER.RIGHT:
		if (image_index <= image_number - 1) image_speed = 1
		else image_speed = 0
	break;
	
	case THRUSTER.NEUTRAL:
		if (sprite_index != spr_player_blue_thruster_left) sprite_index = spr_player_blue_thruster_left;
		if (image_index != 8) {
			if (image_index > 8) image_speed = -1
			else if (image_index < 8) image_speed = 1;
		}
		else {
			image_speed = 0;
			image_index = 8;
		}
	break;
	
	case THRUSTER.UP:
		if (image_index != 11) {
			if (image_index > 11) image_speed = -1
			else if (image_index < 11) image_speed = 1;
		}
		else image_speed = 0;
	break;
	
	case THRUSTER.DOWN:
		if (image_index != 2) {
			if (image_index > 2) image_speed = -1
			else if (image_index < 2) image_speed = 1;
		}
		else image_speed = 0;
	break;
}