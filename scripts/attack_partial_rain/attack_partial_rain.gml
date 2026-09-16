function attack_partial_rain(hands){
	if (fire_counter>=3) {
		for (var i=0; i<3; i++) {
			if (!hands) {
				var bullet_x=other.left ? (x+25)+(i*50) : (x-25)-(i*50);
				
				var bullet=instance_create_layer(
				bullet_x,
				y,
				"Instances",
				obj_bullet_soldier);
				bullet.direction=270;
				bullet.red=red;
				bullet.speed=25
			}
			else {
				
				var bullet_x=other.bullet_left ? (x+15)+(i*50) : (x-15)-(i*50);
				
				var bullet=instance_create_layer(
				bullet_x,
				y,
				"Instances",
				obj_bullet_soldier);
				bullet.direction=270;
				bullet.red=red;
				bullet.speed=25;
			}
		}
		fire_counter=0;
	}
	else fire_counter++;
}