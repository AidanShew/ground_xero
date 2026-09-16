switch (section) {
	case (1):
		create_swoop();
		if (swoop_spawn_timer<=-30) section++;
	break;
	
	case (2):
		create_helix();
		if (helix_spawn_timer<=-180) section++;
	break;
	
	case (3):
		if (!trio_spawned) {
			create_trio();
			trio_spawned=true;
		}
		else if (trio_spawned&&!instance_exists(obj_controller_trio)) {
			section++;
		}
	break;
	
	case (4):
		create_cross();
		if (cross_spawn_timer<=-180) section++;
	break;
	
	case (5):
		create_circuit();
		if (circuit_spawn_timer<=-400) section++;
	break;
	
	case (6):
		if (!single_spiral_spawned) {
			scr_create_single_spiral(); //Needs exit
			single_spiral_spawned = true;
		}
		else if (--single_spiral_timer<=0) {
			if (instance_exists(obj_enemy_drone)) instance_destroy(obj_enemy_drone);
			section++;
		}
	break;
	
	case (7):
		if (!revolver_spawned) {
			scr_create_revolver();
			revolver_spawned=true;
		}
		else if (--retreat_timer <= -180) section++;
	break;
	
	case (8):
		scr_create_pack();
		if (pack_iteration>=4) {
			section++;
		}
	break;
	
	case (9):
		if (!tracer_spawned) {
			scr_create_tracer_section();
			tracer_spawned=true;
		}
		else if (tracer_spawned && !instance_exists(obj_controller_tracer)) {
			section++;
		}
	break;
	
	case (10):
		scr_create_enemy_treclops();
		if (treclops_spawned && !instance_exists(obj_enemy_treclops)) {
			section++;
		}
	break;
	
	case (11):
		instance_destroy(self);
		break;
}