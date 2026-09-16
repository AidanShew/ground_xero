function pause_state(){
	if (keyboard_check(vk_escape)&&instance_deactivate_all(false)) { 
		instance_deactivate_all(true); }
	if (keyboard_check(vk_escape)&&instance_deactivate_all) { 
		instance_deactivate_all(false); }
}