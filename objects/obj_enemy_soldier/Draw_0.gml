if (firing) {
	draw_sprite_ext(
	red ? spr_red_firing : spr_blue_firing, 
	choose(1,2,3), 
	x, 
	y-5, 
	1, 
	1, 
	image_angle, 
	c_white,
	1);
}

draw_self();