function scr_player_death(){
	effect_create_above(ef_firework, x, y, 1, c_white);
	instance_destroy(obj_player);
	obj_mission_one.section = 0;
	room = rm_mission_one;
}