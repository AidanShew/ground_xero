function scr_player_death(){
	effect_create_above(ef_firework, x, y, 1, c_white);
	instance_destroy(obj_player);
	obj_game.player_lives--;

	if (obj_game.player_lives<0) {
		instance_create_layer(x,y,"Instances", obj_death_screen);
	}
	else {
		instance_create_layer(x,y,"Instances", obj_player_puppet);
	}
}