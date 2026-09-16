function attack_treclops(left){
	if (instance_exists(obj_player)) {
		if (left) var dir=315;
		else dir = 225;
	
		if (fire_counter_two>=10) {
			for (var i=0; i<10; i++) {
				var bullet=instance_create_layer(x,y,"Instances",obj_bullet_treclops_normal_red);
				bullet.direction=dir-(i*5);
				bullet.speed=15;
				if (!left) {
					bullet.red=false;
					bullet.sprite_index=spr_smll_blue_bullet;
				}
			}
		
			for (var i=0; i<10; i++) {
				var bullet=instance_create_layer(x,y,"Instances",obj_bullet_treclops_normal_red);
				bullet.direction=dir+(i*5);
				bullet.speed=15;
				if (!left) {
					bullet.red=false;
					bullet.sprite_index=spr_smll_blue_bullet;
				}
			}
		
			fire_counter_two=0;
		}
		else fire_counter_two++;
	}
}