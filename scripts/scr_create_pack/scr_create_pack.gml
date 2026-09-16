function scr_create_pack(){	
	show_debug_message("Pack Timer: "+string(pack_spawn_timer)+"\nIteration: "+string(pack_iteration));
	if (pack_iteration<4) {
		if (spawn_pack) {
			show_debug_message("Supposed to spawn...");
			scr_create_enemy_soldier(
			3, 
			pack_iteration%2 == 0 ? MOVE.PACK_LEFT : MOVE.PACK_RIGHT, 
			ATTACK.AIMED, 
			pack_iteration%2 == 0 ? false : true);
			
			spawn_pack = false;
		}

		if (pack_spawn_timer <= 0) {
			pack_iteration++;
			pack_spawn_timer = 120;
			
			spawn_pack = true;
		}
		
		pack_spawn_timer--;
	}
}