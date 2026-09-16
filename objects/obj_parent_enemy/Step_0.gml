if (y<=-200 || y>=room_height+200 || x<=-200 || x>=room_width+200) {
	//show_debug_message("Enemy outside of bounds\nX: "+string(x)+"\nY: "+string(y));
	global.enemies_off_screen++;
	instance_destroy();
}