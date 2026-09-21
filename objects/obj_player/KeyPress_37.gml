show_debug_message("Red Status: "+string(red));
if (red) {
	red=false;
	sprite_index = spr_to_blue_big;

	image_index = 0;
	image_speed = 1;
}
else {
	red=true;
	sprite_index=spr_to_red_big;
	
	image_index=0;
	image_speed=1;
}