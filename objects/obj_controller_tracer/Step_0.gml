switch (tracer_phase) {
	case (1):
		if (tracer_spawn_timer>0 && tracer_spawn_timer%5==0) {
			tracer_create(TRACER_MOVE.FROM_TOP_CENTER, 2, 15);
		}
	break;
	
	case (2):
		if (tracer_spawn_timer>0 && tracer_spawn_timer%5==0) {
			tracer_create(TRACER_MOVE.FROM_TOP_LEFT, 2, 17);
		}
	break;
	
	case (3):
	if (tracer_spawn_timer>0 && tracer_spawn_timer%5==0) {
		tracer_create(TRACER_MOVE.FROM_TOP_RIGHT, 2, 20);
	}
	break;
	
	case (4):
	if (tracer_spawn_timer>0 && tracer_spawn_timer%5==0) {
		tracer_create(TRACER_MOVE.FROM_BOTTOM_CENTER, 2, 22);
	}
	break;	
	
	case (5):
		if (tracer_spawn_timer>0 && tracer_spawn_timer%5==0) {
			tracer_create(TRACER_MOVE.FROM_BOTTOM_LEFT, 2, 25);
		}
	break;	
	
	case (6):
		if (tracer_spawn_timer>0 && tracer_spawn_timer%5==0) {
			tracer_create(TRACER_MOVE.FROM_BOTTOM_RIGHT, 2, 27);
		}
	break;	
	
	case (7):
		if (tracer_spawn_timer>0 && tracer_spawn_timer%5==0) {
			tracer_create(TRACER_MOVE.FROM_BOTTOM_LEFT, 2, 28);
			tracer_create(TRACER_MOVE.FROM_TOP_CENTER, 2, 22);
		}
	break;	

	case (8):
		if (tracer_spawn_timer>0 && tracer_spawn_timer%5==0) {
			tracer_create(TRACER_MOVE.FROM_TOP_LEFT, 2, 20);
			tracer_create(TRACER_MOVE.FROM_BOTTOM_RIGHT, 2, 24);
		}
	break;	
	
	case (9):
		if (tracer_spawn_timer>0 && tracer_spawn_timer%5==0) {
			tracer_create(TRACER_MOVE.FROM_BOTTOM_LEFT, 2, 25);
			tracer_create(TRACER_MOVE.FROM_TOP_CENTER, 2, 20);
			tracer_create(TRACER_MOVE.FROM_BOTTOM_RIGHT, 2, 25);
		}
	break;	
	
	case (10):
		if (tracer_spawn_timer>0 && tracer_spawn_timer%5==0) {
			tracer_create(TRACER_MOVE.FROM_TOP_LEFT, 1);
			tracer_create(TRACER_MOVE.FROM_TOP_RIGHT, 1);
		}
		
		if (triond_spawned && !instance_exists(obj_controller_trio_nd)) {
			tracer_phase++;
		}
		
		if (!triond_spawned) {
			scr_create_trio_nd();
			triond_spawned=true;
		}
	break;
		
	case (11):
		instance_destroy();
	break;
}

if (tracer_phase < 10 && --tracer_spawn_timer <=-60) {
	tracer_phase++;
	tracer_spawn_timer=120;
}
else if (tracer_phase >= 10 && --tracer_spawn_timer <= 0) {
	tracer_spawn_timer=120;
}

show_debug_message("Tracer Phase: "+string(tracer_phase));
show_debug_message("Tracer Spawn Timer: "+string(tracer_spawn_timer));