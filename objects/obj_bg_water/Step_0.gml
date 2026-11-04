switch (state) {
	case (WATER.TRANSITION):
		if (sprite_index != spr_bg_water_trans) {
			sprite_index = spr_bg_water_trans;
		}
		else if (image_index >= image_number-5) {
			image_speed = 0;
			state = WATER.MOVE_DOWN;
		}
	break;
	
	case (WATER.MOVE_DOWN):
		y+=0.1;
	break;
}