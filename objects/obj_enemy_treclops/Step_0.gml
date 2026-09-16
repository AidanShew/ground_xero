tre_polarity_switch();
tre_update_phase();

show_debug_message("Treclops Health: "+string(enemy_health)+"/"+string(starting_enemy_health));

switch (attack_type) {
	case (TRECLOPS_ATTACK.STAR):
		attack_star();
	break;
	
	case (TRECLOPS_ATTACK.PARTIAL_RAIN):
		attack_curtain_rain();
	break;	
	
	case (TRECLOPS_ATTACK.FULL_RAIN):
		if (rain_timer<offset) attack_full_rain(false);
	break;	
	
	case (TRECLOPS_ATTACK.DESPERATE):
		attack_star();
		attack_desperation();
		attack_desperation2();
	break;
}

switch (global.tre_phase) {
	case (TRECLOPS_PHASE.ONE):
		show_debug_message("Phase 1");
		tre_calibrate();
		if (fire) attack_type=TRECLOPS_ATTACK.STAR;
	break;
	
	case (TRECLOPS_PHASE.TWO):
		show_debug_message("Phase 2");
		tre_calibrate();
		if (fire) attack_type=TRECLOPS_ATTACK.PARTIAL_RAIN;
	break;
	
	case (TRECLOPS_PHASE.THREE):
		show_debug_message("Phase 3");
		tre_calibrate();
		if (fire) attack_type=TRECLOPS_ATTACK.STAR;
	break;
	
	case (TRECLOPS_PHASE.FOUR):
		show_debug_message("Phase 4");
		tre_calibrate();
		if (fire) {
			if (instance_exists(obj_enemy_treclops_hand_right)&&(obj_enemy_treclops_hand_right.x<x-50||obj_enemy_treclops_hand_right.x>x+50)) attack_type=TRECLOPS_ATTACK.STAR;
			else attack_type=TRECLOPS_ATTACK.NONE;
		}
	break;
	
	case (TRECLOPS_PHASE.FIVE):
		show_debug_message("Phase 5");
		tre_calibrate();
		if (fire) {
			attack_type=TRECLOPS_ATTACK.DESPERATE;
		}
	break;
}
	