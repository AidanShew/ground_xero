function tre_calibrate(){
	if (point_distance(x,y, path[0], path[1])>=5) {
		direction=point_direction(x, y, path[0], path[1]);
		speed = max(speed-0.03, 0);
	}
	else {
		speed = 0;
		fire=true;
	}
}