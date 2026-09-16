function create_pack(){	
	if (pack_iteration<4) {
		if (spawn_pack) {
			show_debug_message("Supposed to spawn...");
			soldier_create(
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