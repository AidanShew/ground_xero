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
		else if (!instance_exists(obj_controller_trio)) section++;
		
		show_debug_message("Trio Controller?: "+string(instance_exists(obj_controller_trio)));
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
			scr_create_single_spiral();
			single_spiral_spawned = true;
		}
		else if (!instance_exists(obj_enemy_drone)) section++;
		single_spiral_timer--;
	break;
	
	case (7):
	
		if (!revolver_spawned) {
			scr_create_revolver();
			revolver_spawned=true;
		}
		// Section will progress if retreat_timer is less than -180 or both controllers are destroyed
		else if (--retreat_timer <= -180 || 
		(revolver_spawned && !instance_exists(obj_controller_revolver_left) && 
		!instance_exists(obj_controller_revolver_right))) section++;
		
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