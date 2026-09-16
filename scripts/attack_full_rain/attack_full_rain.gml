function attack_full_rain(hands){
	firing=true;
	if (fire_counter>=3) {
		for (var i=0; i<6; i++) {			
			if (!hands) {					
				var new_x=i<3 ? (x+25)+(i*50) : (x-25)-((i-3)*50)
				var bullet=instance_create_layer(
				new_x,
				y,
				"Instances",
				obj_bullet_soldier);
				
				bullet.direction=270;
				bullet.red=i<3 ? !red : red;
				bullet.speed=25
			}
			else {					
				var new_x=i<3 ? (x+25)+(i*50) : (x-25)-((i-3)*50)
				var bullet=instance_create_layer(
				new_x,
				y,
				"Instances",
				obj_bullet_soldier);
				
				bullet.direction=270;
				bullet.red=red;
				bullet.speed=25
			}
		}
		fire_counter=0;
	}
	else fire_counter++;
}