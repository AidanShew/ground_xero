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
		y+=0.01;
	break;
	
	case (WATER.TO_SKY):

		if (sprite_index != spr_bg_water_to_sky) {
			sprite_index = spr_bg_water_to_sky;
			image_index = 0;
			image_speed = 1;
		}
		else if (image_index >= image_number-3) instance_destroy(self);
			
	break;
}