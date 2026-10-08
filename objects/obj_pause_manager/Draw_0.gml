if (is_paused) {
	
	for(var i=0; i<array_height_2d(all_objects); i++) {
		draw_sprite_ext(all_objects[i,0], all_objects[i,1], 
		all_objects[i,2], all_objects[i,3], all_objects[i,4],
		all_objects[i,5], all_objects[i,6], all_objects[i,7], 
		all_objects[i,8]/5);
	}
	
	draw_sprite(spr_logo, 0, 896, 896);
	
}