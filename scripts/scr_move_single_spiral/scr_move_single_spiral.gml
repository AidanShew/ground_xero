function move_single_spiral(){
	angle+=2;
	x=center_x+lengthdir_x(orbit_radius, orbit_angle+angle);
	y=center_y+lengthdir_y(orbit_radius, orbit_angle+angle);
	image_angle=orbit_angle+angle;
	show_debug_message("Image Angle: "+string(image_angle));
}