function scr_create_tracer_section(){
	if (!instance_exists(obj_controller_tracer)) {
		instance_create_layer(0, 0, "Instances", obj_controller_tracer);
	}
}