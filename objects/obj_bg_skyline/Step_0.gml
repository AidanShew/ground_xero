switch (state) {
	case (CITY.TRANSITION):
		if (sprite_index != spr_bg_skyline_trans) {
			sprite_index = spr_bg_skyline_trans;
		}
		else if (image_index >= image_number-5) {
			image_speed = 0;
			state = CITY.MOVE_DOWN;
		}
	break;
	
	case (CITY.MOVE_DOWN):
		y+=0.1;
	break;
}