function attack_pack() {
	if (fire_counter>=10) {
		var bullet=instance_create_layer(x,y,"Instances", obj_bullet_soldier);
		bullet.direction=direction;
		bullet.red=red;
		bullet.speed=20;
		
		fire_counter=0;
	}
	else fire_counter++;
}