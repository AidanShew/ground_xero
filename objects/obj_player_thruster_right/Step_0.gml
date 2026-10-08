var sprite_range = 
obj_player.red ? spr_player_red_thruster_right_range :
spr_player_blue_thruster_right_range;

var sprite_extended = 
obj_player.red ? spr_player_red_thruster_right_extended :
spr_player_blue_thruster_right_extended;

var sprite_retracted = 
obj_player.red ? spr_player_red_thruster_right_retracted :
spr_player_blue_thruster_right_retracted;

switch (thruster_state) {
	case THRUSTER.LEFT:
	// Frame Target: Last Frame
	// Sprite Target: sprite_retracted
		if (image_index <= image_number - 1) image_speed = 1;
		else if (sprite_index != sprite_retracted) sprite_index = sprite_retracted;
	break;
	
	case THRUSTER.RIGHT:
	// Frame Target 0
	// sprite_extended
		if (image_index >= 1) image_speed = -1
		else if (sprite_index != sprite_extended) sprite_index = sprite_extended;
	break;
	
	case THRUSTER.NEUTRAL:
	// Frame Target 8
	// spr_player_blue_thruster_right
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
	//Frame Target 11
		if (sprite_index != sprite_range) sprite_index = sprite_range;
		if (image_index != 11) {
			if (image_index > 11) image_speed = -1
			else if (image_index < 11) image_speed = 1;
		}
		else image_speed = 0;
	break;
	
	case THRUSTER.DOWN:
	// Frame Target 2
		if (sprite_index != sprite_range) sprite_index = sprite_range;
		if (image_index != 2) {
			if (image_index > 2) image_speed = -1
			else if (image_index < 2) image_speed = 1;
		}
		else image_speed = 0;
	break;
}