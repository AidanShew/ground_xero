function attack_spiral(){
	if (fire_counter>=5) {
		bullet_angle = (bullet_angle + 20) mod 360;
		
		var density = 8; // how many bullets per burst
		var base_angle = bullet_angle;

		for (var i = 0; i < density; i++) {
		    var angle = base_angle + (360 / density) * i;

		    var soldier_bullet = instance_create_layer(x, y, "Instances", obj_bullet_soldier);
		    soldier_bullet.direction = angle;
			soldier_bullet.red=red;
		}
		
		fire_counter=0;
	}
	else { fire_counter+=1; }
}