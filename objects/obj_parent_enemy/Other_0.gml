if (y>room_height+200 || y<-200 || x<-200 || x>room_width+200) {
	global.enemies_off_screen++;
	instance_destroy();
}