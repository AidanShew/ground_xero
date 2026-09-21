function scr_attack_aimed_drone(){
	if (fire_counter>=5) {
		var bullet=instance_create_layer(x,y,"Instances", obj_bullet_soldier);
		bullet.direction=image_angle;
		bullet.red=red;
		bullet.speed=20;
		
		
		fire_counter=0;
	}
	else fire_counter++;
}