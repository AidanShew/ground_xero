function power_up_determiner(enemy){
	if (instance_exists(obj_horde)) {
		if (obj_horde.horde_round>=1) {
			choose(instance_create_layer(enemy.x,enemy.y,"Instances", obj_overshield), instance_create_layer(enemy.x,enemy.y,"Instances", obj_megadrive));
		}
	}
}