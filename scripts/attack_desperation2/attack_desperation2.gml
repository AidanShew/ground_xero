function attack_desperation2(){
	if (instance_exists(obj_player)) {
		if (increase2) {
			if (dir2>=360) increase2=false;
			else dir2+=1.5;
		}
		else {
			if (dir2<=180) increase2=true;
			else dir2-=1.5;
		}
	
		if (fire_counter_three>=1) {
			for (var i=0; i<10; i++) {
				var bullet=instance_create_layer(x,y,"Instances",obj_bullet_treclops_normal_red);
				bullet.red=!red;
				if (!bullet.red) bullet.sprite_index=spr_smll_blue_bullet;
				bullet.direction=dir2+(i*3);
				bullet.speed=15;
			}
		
			fire_counter_three=0;
		}
		else fire_counter_three++;
	}
}