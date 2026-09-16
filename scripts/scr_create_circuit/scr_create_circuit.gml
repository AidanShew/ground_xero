function create_circuit() {
	var timer=circuit_spawn_timer--;
	
	//Set circuit_spawn_timer to 600
	if ((timer%15==0)&&(timer>0||timer<-400)) {
		for (var i=0; i<=1; i++) {
			scr_create_enemy_soldier(
			1, 
			i==0 ? MOVE.CIRCUIT_RIGHT : MOVE.CIRCUIT_LEFT, 
			noone, 
			((i==0&&timer>0) || (i==1&&timer<0)) ? false : true);
		}
	}
	circuit_speed=clamp(
	circuit_speed+0.03, 
	10, 
	(timer<0) ? 20 : 15);
}