function create_swoop(){
	/*
	---INSTRUCTIONS---
	*If swoop_spawn_timer doesn't exist, create it and set it to 90.
	*swoop_create() should be placed in the step function since it 
	will automatically stop iterating when it's finished.
	
	---ABOUT---
	*Both Swoop Left and Swoop Right Soldiers are assied with move_swoop(),
	this script will add/subtract their direction to make them veer left or 
	right.
	
	*Every 10 seconds a soldier is created and is assigned Swoop Left or Right.
	Swoop Right will have the soldier fly towards the right side of the screen
	and same respectively for Swoop Left.
	*/
		
	var timer = swoop_spawn_timer;
	if (timer>0) {
		if (timer==80||timer==60||timer==40||timer==20||timer==0) {
			scr_create_enemy_soldier(1, MOVE.SWOOP_LEFT);
		}
	
		if (timer==90||timer==70||timer==50||timer==30||timer==10) {
			scr_create_enemy_soldier(1, MOVE.SWOOP_RIGHT);
		}
	}
	swoop_spawn_timer--;
	show_debug_message("Timer: "+string(timer));
}