red=!mother.red;

switch (attack_type) {
	case (TRECLOPS_ATTACK.CALIBRATE):
		show_debug_message("Hand Attack Type: Calibrate");
		if (point_distance(x,y, path[0], path[1])<=15) {
			speed=0;
			image_angle=left ? 45: 135;
			fire=true;
			switch (global.tre_phase) {
				case (TRECLOPS_PHASE.ONE):
					attack_type=TRECLOPS_ATTACK.NONE;
				break;
	
				case (TRECLOPS_PHASE.TWO):
					attack_type=TRECLOPS_ATTACK.PARTIAL_RAIN;
				break;
				
				case (TRECLOPS_PHASE.THREE):
					if (!left) {
						attack_type=TRECLOPS_ATTACK.PARTIAL_SPREAD;
						show_debug_message("Checkpoint");
					}
				break;
			}
		}
		else {
			direction=point_direction(x,y, path[0], path[1]);
			image_angle=direction;
			speed=15;
		}
		break;
		
	case (TRECLOPS_ATTACK.NONE):
		show_debug_message("Hand Attack Type: None");
		if (global.tre_phase==TRECLOPS_PHASE.ONE) {
			if (--global.hs_timer<=0) {
				global.hs_timer=120;
				attack_type=TRECLOPS_ATTACK.HAND_SWOOP;
			}
			else {
				if (left) attack_type = mother.red ? TRECLOPS_ATTACK.NONE : TRECLOPS_ATTACK.SIDE_SPREAD;
				else attack_type=!mother.red ? TRECLOPS_ATTACK.NONE : TRECLOPS_ATTACK.SIDE_SPREAD;
			}		
		}
		
	break;
		
	// ***PHASE 1 ATTACKS***
	
	case (TRECLOPS_ATTACK.SIDE_SPREAD):
	show_debug_message("Hand Attack Type: Side Spread");
		speed=0;
		
		if (left) {
			attack_type=mother.red ? TRECLOPS_ATTACK.NONE : TRECLOPS_ATTACK.SIDE_SPREAD;
			attack_treclops(true);
		}
		else {
			attack_type=!mother.red ? TRECLOPS_ATTACK.NONE : TRECLOPS_ATTACK.SIDE_SPREAD;
			attack_treclops(false);
		}
			
		if (--global.ss_timer<=0) {
			if (obj_enemy_treclops_hand_left.attack_type != TRECLOPS_ATTACK.CALIBRATE &&
				obj_enemy_treclops_hand_left.attack_type != TRECLOPS_ATTACK.HAND_SWOOP &&
				obj_enemy_treclops_hand_right.attack_type != TRECLOPS_ATTACK.CALIBRATE &&
				obj_enemy_treclops_hand_right.attack_type != TRECLOPS_ATTACK.HAND_SWOOP)
			{
				obj_enemy_treclops_hand_left.attack_type = TRECLOPS_ATTACK.PARTIAL_SPREAD;
				obj_enemy_treclops_hand_right.attack_type = TRECLOPS_ATTACK.PARTIAL_SPREAD;
				global.ss_timer=360;
			}
		}
		break;
	
	case (TRECLOPS_ATTACK.PARTIAL_SPREAD):
	show_debug_message("Hand Attack Type: Partial Spread");
		speed=0;
		if (global.tre_phase==TRECLOPS_PHASE.ONE) {
			if (--global.ps_timer<=0) {
				obj_enemy_treclops_hand_left.attack_type=TRECLOPS_ATTACK.NONE;
				obj_enemy_treclops_hand_right.attack_type=TRECLOPS_ATTACK.NONE;
			
				global.ps_timer=360;
				global.ss_timer=360;
			}			
			attack_partial_spread(left ? true : false);
		}
		else if (global.tre_phase==TRECLOPS_PHASE.THREE) {
			attack_partial_spread2();
		}
		
	break;
		
	case (TRECLOPS_ATTACK.HAND_SWOOP):
		show_debug_message("Hand Attack Type: Hand Swoop");
		attack_hand_swoop(left ? true : false);
	break;
		
	// ***PHASE 2 ATTACKS***
	case (TRECLOPS_ATTACK.PARTIAL_RAIN):
		show_debug_message("Hand Attack Type: Partial Rain");
		red=!mother.red;
		if (left) {
			bullet_left=!mother.left;
			if (point_distance(x,y, path[0]+100, path[1]+100)<=15) {
				speed=0;
				if (image_angle!=180) image_angle+=1;
				else attack_partial_rain(true);
			}
			else {
				direction=point_direction(x,y, path[0]+100, path[1]+100);
				speed=15;
			}
		}
		else {
			bullet_left=mother.left;
			if (point_distance(x,y, path[0]-100, path[1]+100)<=15) {
					speed=0;
					if (image_angle!=180) image_angle+=1;
					else attack_partial_rain(true);
				}
			else {
					direction=point_direction(x,y, path[0]-100, path[1]+100);
					speed=15;
			}
		}
	break;
	
	// ***PHASE 4 ATTACK***
	case (TRECLOPS_ATTACK.BLOCK):
		show_debug_message("Hand Attack Type: Block");
		if (instance_exists(obj_bullet_player_blue)) {
			if (point_distance(x,y, obj_bullet_player_blue.x, mother.y+200)<=15) {
				//attack_spread();
				speed=0;
			}
			else {
				direction=point_direction(x,y, obj_bullet_player_blue.x, mother.y+200);
				image_angle=direction;
				speed=15;
			}
		}
		
		else if (instance_exists(obj_player)) {
			if (point_distance(x,y, obj_player.x, mother.y+200)<=15) {
				//attack_spread();
				speed=0;
			}
			else {
				direction=point_direction(x,y,obj_player.x, mother.y+200);
				image_angle=direction;
				speed=15;
			}
		}
		break;
}

if (global.tre_phase==TRECLOPS_PHASE.FOUR) {
	attack_type=TRECLOPS_ATTACK.BLOCK;
}