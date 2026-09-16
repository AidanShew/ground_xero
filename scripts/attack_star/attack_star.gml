function attack_star(){
	if (instance_exists(obj_player)) {
		if (array_length(bullet_star)==3) bullets_restocked=true;
		else if (array_length(bullet_star)==0) bullets_restocked=false;
	
		if (!bullets_restocked&&polarity_timer>0) {
			if (fire_counter>=15) {
				fire_counter=0;
				index++;
				var bullet=instance_create_layer(x,y+200,"Instances",obj_bullet_treclops_star);
				bullet.orbit_angle=(index*120);
				bullet_star[index]=bullet;
			}
			else fire_counter++;
		}
		//show_debug_message("Fire Counter: "+string(fire_counter));
	
		if (bullets_restocked&&throw_timer<=0) {
			bullet_star[index].is_thrown=true;
			array_delete(bullet_star, index, 1);
			index--;
			throw_timer=60;
		}
		else if (bullets_restocked&&throw_timer>0) throw_timer--;
		/*
		if (--ss_timer<=0&&(obj_right_hand.attack_type==TRECLOPS_ATTACK.NONE||obj_right_hand.attack_type==TRECLOPS_ATTACK.SIDE_SPREAD)&&(obj_left_hand.attack_type==TRECLOPS_ATTACK.NONE||obj_left_hand.attack_type==TRECLOPS_ATTACK.SIDE_SPREAD)) {
			obj_right_hand.attack_type=TRECLOPS_ATTACK.PARTIAL_SPREAD;
			obj_left_hand.attack_type=TRECLOPS_ATTACK.PARTIAL_SPREAD;
		}
		*/
	}
}