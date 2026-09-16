function check_for_advance(){
	switch (room) {
		case (rm_horde):
		if (instance_number(obj_parent_enemy) <= 0) {
			show_debug_message("Advancing Round...");
			horde_advance();
		}
		break;
	}
}