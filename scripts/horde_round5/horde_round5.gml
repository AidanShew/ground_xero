function horde_round5(){
	previous_wave=obj_horde.horde_wave;
	obj_horde.horde_wave++;
	current_wave=obj_horde.horde_wave;
	obj_horde.horde_round=5;
	show_debug_message("Advancing Wave: " + string(obj_horde.horde_wave)+"\nAdvancing Round: "+string(obj_horde.horde_round));
	enemies_alive=0;
	
	if (current_wave>previous_wave) {
		spawn_wave=irandom(10);
		if (instance_exists(obj_enemy_soldier)) { instance_destroy(obj_enemy_soldier); }
		if (instance_exists(obj_wp)) { instance_destroy(obj_wp); }
		if (instance_exists(obj_enemy_tracer)) { instance_destroy(obj_enemy_tracer); }
		if (instance_exists(obj_enemy_hunter)) { instance_destroy(obj_enemy_hunter); }
		if (instance_exists(obj_enemy_exo)) { instance_destroy(obj_enemy_exo); }
	
		if (spawn_wave==1) {
			instance_create_layer(x,y,"Instances", obj_tracer_spawner);
			exo_create();
			hunter_create(10);
		}
		else if (spawn_wave==2) {
			instance_create_layer(x,y,"Instances", obj_soldier_spawner);
			obj_soldier_spawner.amount=8;
			instance_create_layer(x,y,"Instances", obj_tracer_spawner);
			hunter_create(10);
		}
		else if (spawn_wave==3) {
			hunter_create(6);
			exo_create();
			instance_create_layer(x,y,"Instances", obj_soldier_spawner);
			obj_soldier_spawner.amount=6;
		}
		else if (spawn_wave==4) {
			exo_create();
			instance_create_layer(x,y,"Instances", obj_soldier_spawner);
			obj_soldier_spawner.amount=10;
			hunter_create(2);
		}
		else if (spawn_wave==5) {
			whirlpool_create(1);
			hunter_create(7);
			instance_create_layer(x,y,"Instances", obj_soldier_spawner);
			obj_soldier_spawner.amount=6;
		}
		else if (spawn_wave==6) {
			instance_create_layer(x,y,"Instances", obj_tracer_spawner);
			hunter_create(6);
			exo_create();
		}
		else if (spawn_wave==7) {
			hunter_create(10);
		}
		else if (spawn_wave==8) {
			instance_create_layer(x,y,"Instances", obj_tracer_spawner);
			hunter_create(7);
			instance_create_layer(x,y,"Instances", obj_soldier_spawner);
			obj_soldier_spawner.amount=4;
		}
		else if (spawn_wave==9) {
			exo_create();
			hunter_create(3);
		}
		else if (spawn_wave==10) {
			whirlpool_create(1);
			hunter_create(4);
		}
		else if (spawn_wave==11) {
			instance_create_layer(x,y,"Instances", obj_tracer_spawner);
		}
		else if (spawn_wave==12) {
			instance_create_layer(x,y,"Instances", obj_tracer_spawner);
			instance_create_layer(x,y,"Instances", obj_soldier_spawner);
			obj_soldier_spawner.amount=12;
		}
		else if (spawn_wave==13) {
			instance_create_layer(x,y,"Instances", obj_soldier_spawner);
			obj_soldier_spawner.amount=6;
			hunter_create(2);
		}
		else if (spawn_wave==14) {
			exo_create();
		}
		else if (spawn_wave==15) {
			whirlpool_create(1);
		}
		else if (spawn_wave==16) {
			instance_create_layer(x,y,"Instances", obj_tracer_spawner);
			exo_create();
		}
		else if (spawn_wave==17) {
			hunter_create(6);
		}
		else if (spawn_wave==18) {
			instance_create_layer(x,y,"Instances", obj_tracer_spawner);
			hunter_create(2);
		}
		else if (spawn_wave==19) {
			exo_create();
			hunter_create(2);
		}
		else if (spawn_wave==20) {
			whirlpool_create(1);
			hunter_create(3);
		}
	}
}