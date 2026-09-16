function scr_attack_cake(){
	if (fire_counter>=5) {
		mid_bullet=instance_create_layer(x,y,"Instances", obj_bullet_soldier);
		mid_bullet.direction=direction;
		if ((move_type==MOVE.SWOOP_LEFT||move_type==MOVE.SWOOP_RIGHT)&&index==1) mid_bullet.red=true;
		
		left_bullet=instance_create_layer(x-60,y,"Instances", obj_bullet_soldier);
		left_bullet.direction=direction;
		if ((move_type==MOVE.SWOOP_LEFT||move_type==MOVE.SWOOP_RIGHT)&&index==1) left_bullet.red=true;
		
		left_bullet2=instance_create_layer(x-120,y,"Instances", obj_bullet_soldier);
		left_bullet2.direction=direction;
		if ((move_type==MOVE.SWOOP_LEFT||move_type==MOVE.SWOOP_RIGHT)&&index==1) left_bullet2.red=true;
		
		right_bullet=instance_create_layer(x+60,y,"Instances", obj_bullet_soldier);
		right_bullet.direction=direction;
		if ((move_type==MOVE.SWOOP_LEFT||move_type==MOVE.SWOOP_RIGHT)&&index==1) right_bullet.red=true;
		
		right_bullet2=instance_create_layer(x+120,y,"Instances", obj_bullet_soldier);
		right_bullet2.direction=direction;
		if ((move_type==MOVE.SWOOP_LEFT||move_type==MOVE.SWOOP_RIGHT)&&index==1) right_bullet2.red=true;
				
		fire_counter=0;
		fired++;
	}
	else fire_counter+=1;
}