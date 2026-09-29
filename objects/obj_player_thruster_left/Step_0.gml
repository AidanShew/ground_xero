switch (thruster_state) {
	case THRUSTER.LEFT:
		if (image_index > 1) image_speed = -1
		else image_speed = 0
	break;
	
	case THRUSTER.RIGHT:
		if (image_index <= image_number - 1) image_speed = 1
		else image_speed = 0
	break;
	
	case THRUSTER.NEUTRAL:
		if (image_index != 8) {
			if (image_index > 8) image_speed = -1
			else if (image_index < 8) image_speed = 1;
		}
		else image_speed = 0;
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