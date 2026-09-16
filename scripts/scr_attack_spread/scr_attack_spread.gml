function attack_spread(){
	if (fire_counter>=5) {
		
		for (var i=0; i<6; i++) {
			var bullet_right=instance_create_layer(x, y,"Instances", obj_bullet_soldier);
			bullet_right.direction=image_angle+(i*10);
			bullet_right.red=red;
			var bullet_left=instance_create_layer(x, y,"Instances", obj_bullet_soldier);
			bullet_left.direction=image_angle-(i*10);
			bullet_left.red=red;
		}
		/*
		left_bullet=instance_create_layer(x-15,y,"Instances", obj_soldier_bullet);
		left_bullet.direction=image_angle-20;
		left_bullet.red=red;
		
		right_bullet=instance_create_layer(x+15,y,"Instances", obj_soldier_bullet);
		right_bullet.direction=image_angle+20;
		right_bullet.red=red;
		*/
		fire_counter=0;
	}
	else fire_counter++;
}