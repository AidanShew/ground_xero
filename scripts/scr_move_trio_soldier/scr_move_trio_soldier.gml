function scr_move_trio_soldier(){	
	sprite_index=red ? spr_soldier_red : spr_soldier_blue;
	if (!arrival||controller.move_timer<=0) {
		fire=false;
		switch (rotation_order) {
			case (0): //Down
			x=controller.x;
			y=controller.y+75;
			break;
			
			case (1): //Left
			x=controller.x+75;
			y=controller.y;
			break;
			
			case (2): //Up
			x=controller.x;
			y=controller.y-75;
			break;
			
			case (3): //Right
			x=controller.x-75;
			y=controller.y;
			break;
		}
	}
}