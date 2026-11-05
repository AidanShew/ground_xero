switch (state) {
	
	case (CLOUD.TRANSITION):
		if (image_index >= image_number-3) {
			image_speed = 0;
			state = CLOUD.MOVE_DOWN;
		}
		else {
			image_speed = 1;
		}
	break;
	
	case (CLOUD.MOVE_DOWN):
		y+=0.01;
	break;
	
	case (CLOUD.TO_SKY):
	
		if (sprite_index != spr_bg_cloud_move_down) {
			sprite_index = spr_bg_cloud_move_down;
			image_index = 0;
			image_speed = 1;
		}
		else if (image_index >= image_number-3) {
			image_speed = 0;
			state = CLOUD.SKY_ZONE;
		}
			
	break;
	
	case (CLOUD.SKY_ZONE):
		y+=0.01;
	break;
}