function scr_move_cross() {
	var polarity = controller.cross_polarity_timer>=0 ? true /*Majority Blue*/: false /*Majority Red*/;
	image_angle=direction;
	
	if (y>100) {
		if (move_type==MOVE.CROSS_LEFT) direction-=1.7;
		else if (move_type==MOVE.CROSS_RIGHT) direction+=1.5;
	}
		if (fire_counter>=10&&x==room_width/2) {
			var index;
			
			if (polarity) index= red ? 3 : 6;
			else index = red ? 6 : 3;
			
			for (var i=0; i<index; i++) {
				var bullet=instance_create_layer(room_width/2, red ? y : y+50, "Instances", obj_bullet_soldier);
				
				if ((red&&polarity) ||
				(!red&&!polarity)) 
				bullet.direction=247.5+(i*22.5);
				
				else if (((!red&&polarity)||
				(red&&!polarity))&&
				i<=2) 
				bullet.direction=253.125+(i*5.625);
				
				else if (((!red&&polarity)||
				(red&&!polarity))&&
				i>2) 
				bullet.direction=275.625+((i-3)*5.625);
				
				bullet.red=red;
				fire_counter=0;
			}
		}
		else fire_counter++;	
}