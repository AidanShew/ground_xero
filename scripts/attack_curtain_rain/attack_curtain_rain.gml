function attack_curtain_rain(){
	if (rain_timer>offset&&fire_counter>=1) {
		for (var i=0; i<6; i++) {						
			var new_x=i<3 ? (x+25)+(i*50) : (x-25)-((i-3)*50)
			var bullet=instance_create_layer(
			new_x,
			i<3 ? (i*100) : ((i-3)*100),
			"Instances",
			obj_bullet_soldier)
			bullet.direction=270;
			bullet.red=i<3 ? !red : red;
			bullet.speed=25;
		}
		fire_counter=0;
	}
	else fire_counter++;
}