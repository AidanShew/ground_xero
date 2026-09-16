function scr_move_swoop(){
	if (y>=100) {
		direction= move_type==MOVE.SWOOP_RIGHT ? direction+0.5 : direction-0.5;
	}
	image_angle=direction;
	speed=12;
}