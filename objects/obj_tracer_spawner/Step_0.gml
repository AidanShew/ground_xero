spawn_timer--;
if (spawn_timer%5==0) {	
	if (instance_exists(obj_horde)&&obj_horde.horde_wave==1) {
		for (var i=0; i<2; i++) {
			tracer=instance_create_layer(room_width*0.5, -20, "Instances", obj_enemy_tracer);
			if (instance_exists(obj_horde)) { obj_horde.enemies_alive+=1; }
			tracer.image_angle=-90;
			if (i%2==0) { tracer.alignment="Left"; }
			else { tracer.alignment="Right"; }
		}
		
		for (var i=0; i<2; i++) {
			tracer=instance_create_layer(room_width*.4, -20, "Instances", obj_enemy_tracer);
			if (instance_exists(obj_horde)) { obj_horde.enemies_alive+=1; }
			tracer.image_angle=-90;
			if (i%2==0) { tracer.alignment="Left"; }
			else { tracer.alignment="Right"; }
		}
		
		for (var i=0; i<2; i++) {
			tracer=instance_create_layer(room_width*.6, -20, "Instances", obj_enemy_tracer);
			if (instance_exists(obj_horde)) { obj_horde.enemies_alive+=1; }
			tracer.image_angle=-90;
			if (i%2==0) { tracer.alignment="Left"; }
			else { tracer.alignment="Right"; }
		}
	}
	
	else {
		for (var i=0; i<2; i++) {
			tracer=instance_create_layer(room_width*0.5, -20, "Instances", obj_enemy_tracer);
			if (instance_exists(obj_horde)) { obj_horde.enemies_alive+=1; }
			tracer.image_angle=-90;
			if (i%2==0) { tracer.alignment="Left"; }
			else { tracer.alignment="Right"; }
		}
	}
}
else if (spawn_timer<=0) {
	instance_destroy();
}