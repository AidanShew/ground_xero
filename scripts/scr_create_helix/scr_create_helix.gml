function create_helix(){
	/*
	---INSTRUCTIONS---
	*If helix_spawn_timer doesn't exist, create it and set it to an even
	number greater than 20, recommended to be 90.
	*/
	//Set helix_spawn_timer to 90
	
	helix_spawn_timer--;
	
	var timer = helix_spawn_timer;
	
	if (timer>=0) {
		if (timer%20==0) {
			scr_create_enemy_soldier(1, MOVE.HELIX_RIGHT);
		}
		if (timer%20==10) {
			scr_create_enemy_soldier(1, MOVE.HELIX_LEFT);
		}
	}
}