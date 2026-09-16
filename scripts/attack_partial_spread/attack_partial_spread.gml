function attack_partial_spread(left){
	if (instance_exists(obj_player)) {
		if (left) {
			if (increase) {
				if (dir>=360) increase=false;
				else dir+=0.5;
			}
			else {
				if (dir<=292) increase=true;
				else dir-=0.5;
			}
		}
		else {
			if (increase) {
				if (dir>=247) increase=false;
				else dir+=0.5;
			}
			else {
				if (dir<=180) increase=true;
				else dir-=0.5;
			}
		}
	
		if (fire_counter_two>=1) {
			for (var i=0; i<10; i++) {
				var bullet=instance_create_layer(x,y,"Instances",obj_bullet_treclops_normal_red);
				if (!bullet.red) bullet.sprite_index=spr_smll_blue_bullet;
				bullet.direction=dir-(i*3);
				bullet.speed=15;
				bullet.red=!mother.red;

			}
		
			fire_counter_two=0;
		}
		else fire_counter_two++;
	}
}