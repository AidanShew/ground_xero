function scr_ui_create_stars(){
	star=instance_create_layer(irandom(room_width), -150, "Instances", obj_star);
	while (star.y>=0) {
		count+=1;
		if (count<=5) {
			instance_destroy(star);
		}
	}
}