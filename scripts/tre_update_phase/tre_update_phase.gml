function tre_update_phase(){
	if (enemy_health<(starting_enemy_health/2) && global.tre_phase==TRECLOPS_PHASE.ONE) {
		show_debug_message("RUNNING 1");
		global.tre_phase=TRECLOPS_PHASE.TWO;
		obj_parent_treclops_hand.attack_type=TRECLOPS_ATTACK.CALIBRATE;
	}
	if ((enemy_health<(starting_enemy_health/3)) && (global.tre_phase==TRECLOPS_PHASE.TWO)) {
		global.tre_phase=TRECLOPS_PHASE.THREE;
		show_debug_message("RUNNING 2");
		obj_parent_treclops_hand.attack_type=TRECLOPS_ATTACK.CALIBRATE;
	}
}