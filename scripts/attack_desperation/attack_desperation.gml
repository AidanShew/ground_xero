function attack_desperation(){
	if (instance_exists(obj_player)) {
		if (increase) {
			if (dir1>=360) increase=false;
			else dir1+=1.5;
		}
		else {
			if (dir1<=180) increase=true;
			else dir1-=1.5;
		}
	
		if (fire_counter_two>=1) {
			for (var i=0; i<10; i++) {
				var bullet=instance_create_layer(x,y,"Instances",obj_bullet_treclops_normal_red);
				bullet.red=!red;
				if (!bullet.red) bullet.sprite_index=spr_smll_blue_bullet;
				bullet.direction=dir1-(i*3);
				bullet.speed=15;
			}
		
			fire_counter_two=0;
		}
		else fire_counter_two++;
	}
}