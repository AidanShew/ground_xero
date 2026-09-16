event_inherited();
sprite_index=red ? spr_soldier_red : spr_soldier_blue;

switch (move_type) {
	case MOVE.RIVER:
	move_river();
	move_speed=12;
	if (instance_exists(obj_player)) image_angle=point_direction(x,y, obj_player.x, obj_player.y);
	break;	
	
	case MOVE.DICE:
	move_dice();
	break;
	
	case MOVE.CORNER:
	move_corner();
	break;
	
	case MOVE.TEST:
	move_test();
	break;
	
	case MOVE.SWOOP_RIGHT:
	case MOVE.SWOOP_LEFT:
	scr_move_swoop();
	break;
	
	case MOVE.TRIO:
	scr_move_trio_soldier();
	break;
	
	case MOVE.HELIX_LEFT:
	case MOVE.HELIX_RIGHT:
	scr_move_helix();
	break;
	
	case MOVE.CROSS_LEFT:
	case MOVE.CROSS_RIGHT:
	scr_move_cross();
	break;
	
	case MOVE.CIRCUIT_RIGHT:
	case MOVE.CIRCUIT_LEFT:
	scr_move_circuit();
	break;
	
	case MOVE.HELIX:
	scr_move_helix();
	break;
	
	case MOVE.TARGET:
	move_timer--;
	move_target(target_x, target_y,	esc_x, esc_y, move_timer);
	break;
	
	case MOVE.PACK_RIGHT:
	fire=y<=(room_height*.75);
	scr_move_pack_right();
	break;
	
	case MOVE.PACK_LEFT:
	fire=y<=(room_height*.75);
	move_pack_left();
	break;
	
	case MOVE.REVOLVER_RIGHT:
	case MOVE.REVOLVER_LEFT:
	move_revolver();
	break;
}
if (fire) {	
	switch (attack_type) {
		case ATTACK.SPIRAL:
		if (x>528) attack_spiral();
		break;
	
		case ATTACK.MINEFIELD:
		if (x>=528)	attack_minefield(mine_alignment);
		break;
	
		case ATTACK.SPREAD:
		if (x>600) attack_spread();
		break;
		
		case ATTACK.AIMED:
		scr_attack_aimed();
		//attack_pack();
		break;
	}
}