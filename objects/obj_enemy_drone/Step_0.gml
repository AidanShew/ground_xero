event_inherited();
switch (move_type) {
	case (MOVE.ORBIT):
	move_orbit();
	break;
	
	case (MOVE.SINGLE_SPIRAL):
	move_single_spiral();
	break;
	
	case(MOVE.TRIO_LEFT):
	case(MOVE.TRIO_RIGHT):
	move_trio_drone();
	break;
	
	case (MOVE.DICE):
	move_dice();
	break;
}

switch (attack_type) {
	case (ATTACK.AIMED):
	scr_attack_aimed();
	break;
}