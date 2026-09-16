function create_cross(){
	var timer=cross_spawn_timer;
	
	//Set cross_spawn_timer to 120
	if (timer%20==0&&timer>0) {
		scr_create_enemy_soldier(1, MOVE.CROSS_RIGHT, noone, false);
		scr_create_enemy_soldier(1, MOVE.CROSS_LEFT, noone, true);
	}
	
	cross_spawn_timer--;
}