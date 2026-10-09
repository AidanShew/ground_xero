/*
GOAL:

Have thrusters go to specific sprite when player moves in specific direction



*/



var sprite_range = 
obj_player.red ? spr_player_red_thruster_left_range :
spr_player_blue_thruster_left_range;

var sprite_extended = 
obj_player.red ? spr_player_red_thruster_left_extended :
spr_player_blue_thruster_left_extended;

var sprite_retracted = 
obj_player.red ? spr_player_red_thruster_left_retracted :
spr_player_blue_thruster_left_retracted;

if (sprite_index != sprite_range) sprite_index = sprite_range;

switch(thruster_state) {
	case THRUSTER.DOWN:
	target_index = 2;
	break;
	
	case THRUSTER.UP:
	target_index = 9;
	break;
	
	case THRUSTER.LEFT:
	target_index = image_number-1;
	break;
	
	case THRUSTER.RIGHT:
	target_index = 1;
	break;
	
	case THRUSTER.NEUTRAL:
	target_index = 6;
	break;
}

if (image_index != target_index) {
	image_speed = image_index > target_index ? -1 : 1;
}
else {
	image_speed = 0;
	image_index = target_index;
}



/*
switch (thruster_state) {
	case THRUSTER.LEFT:
	// Target Sprite: 0
	target_index = 0;
	
		if (sprite_index == sprite_range && image_index != target_index) image_speed = -1
		
		else if (sprite_index != sprite_extended) {
			image_speed = 1;
			sprite_index = sprite_extended;
		}
		
	break;
	
	case THRUSTER.RIGHT:
	// Target Sprite: -1
	target_index = image_number-1;

		if (sprite_index == sprite_range && image_index != target_index) image_speed = 1;
		else if (sprite_index != sprite_retracted) {
			image_speed = 1;
			sprite_index = sprite_retracted;
		}

	break;
	
	case THRUSTER.NEUTRAL:
	// Target Sprite: 8
	
	target_index = 9;
		if (sprite_index != sprite_range) sprite_index = sprite_range;

		if (image_index != target_index) image_speed = image_index > target_index ? -1 : 1;
		else {
			image_speed = 0;
			image_index = target_index;
		}

	break;
	
	case THRUSTER.UP:
	// Target Sprite: 11
	target_index = 11
		if (sprite_index != sprite_range) sprite_index = sprite_range;

		if (image_index != target_index) image_speed = image_index > target_index ? -1 : 1;
		else {
			image_speed = 0;
			image_index = target_index;
		}

	break;
	
	case THRUSTER.DOWN:
	//Target Sprite: 2
	target_index = 2
		if (sprite_index != sprite_range) sprite_index = sprite_range;
		
		if (image_index != target_index) image_speed = image_index > target_index ? image_speed = -1 : image_speed = 1;
		else {
			image_speed = 0;
			image_index = target_index;
		}
	break;
}

