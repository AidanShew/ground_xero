function scr_create_revolver(){
	if (!instance_exists(obj_controller_revolver_right)) {
		instance_create_layer(0,0, "Instances", obj_controller_revolver_right);
		obj_controller_revolver_right.controller = self;
	}
	
	if (!instance_exists(obj_controller_revolver_left)) {
		instance_create_layer(0,0, "Instances", obj_controller_revolver_left);
		obj_controller_revolver_left.controller = self;
	}
}