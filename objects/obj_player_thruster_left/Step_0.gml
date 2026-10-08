var sprite_range = 
obj_player.red ? spr_player_red_thruster_left_range :
spr_player_blue_thruster_left_range;

var sprite_extended = 
obj_player.red ? spr_player_red_thruster_left_extended :
spr_player_blue_thruster_left_extended;

var sprite_retracted = 
obj_player.red ? spr_player_red_thruster_left_retracted :
spr_player_blue_thruster_left_retracted;

switch (thruster_state) {
	case THRUSTER.LEFT:
		if (image_index >= 1) image_speed = -1
		else if (sprite_index != sprite_extended) sprite_index = sprite_extended;
	break;
	
	case THRUSTER.RIGHT:
		if (image_index <= image_number - 1) image_speed = 1
		else image_speed = 0
	break;
	
	case THRUSTER.NEUTRAL:
		if (sprite_index != sprite_range) sprite_index = sprite_range;
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
		if (sprite_index != sprite_range) sprite_index = sprite_range;
		if (image_index != 11) {
			if (image_index > 11) image_speed = -1
			else if (image_index < 11) image_speed = 1;
		}
		else image_speed = 0;
	break;
	
	case THRUSTER.DOWN:
		if (sprite_index != sprite_range) sprite_index = sprite_range;
		if (image_index != 2) {
			if (image_index > 2) image_speed = -1
			else if (image_index < 2) image_speed = 1;
		}
		else image_speed = 0;
	break;
}