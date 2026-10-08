if (room != rm_menu ) {
	
	if(!is_paused) {
		var offset=0;
		
		for (var i=0; i < instance_count; i++) {
			if ( instance_find(all, i).sprite_index != -1) {
				all_objects[i - offset, 0] = instance_find(all, i).sprite_index;
				all_objects[i - offset, 1] = instance_find(all, i).image_index;
				all_objects[i - offset, 2] = instance_find(all, i).x;
				all_objects[i - offset, 3] = instance_find(all, i).y;
				all_objects[i - offset, 4] = instance_find(all, i).image_xscale;
				all_objects[i - offset, 5] = instance_find(all, i).image_yscale;
				all_objects[i - offset, 6] = instance_find(all, i).image_angle;
				all_objects[i - offset, 7] = instance_find(all, i).image_blend;
				all_objects[i - offset, 8] = instance_find(all, i).image_alpha;
			}
			else { ++offset; }
		}
		instance_deactivate_all(true);
		is_paused=true;
		if(is_paused) {
			instance_create_layer(352, 192, "Instances", obj_button_menu);
			instance_create_layer(352, 960, "Instances", obj_button_quit);
		}
	}
	else {
		instance_activate_all();
		is_paused=false;
		
		instance_destroy(obj_button_menu);
		instance_destroy(obj_button_quit);
		
		all_objects=[]; // Resets array, else all previous paused objects would be redrawn on different screen.
	}
	
}