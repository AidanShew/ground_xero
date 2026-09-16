function exo_create(){
	for (var i=1; i<=6; i++) {
		
		if (i<=3) { spawn_x=-15; }
		
		else { spawn_x=room_width+15; }
		
		var enemy=instance_create_layer(spawn_x, display_get_gui_height()*0.5, "Instances", obj_enemy_exo);
		instance_create_layer(x,y,"Instances", obj_exo_fire_manager);
		enemy.position=i;
		ds_list_add(obj_exo_fire_manager.fire_queue, enemy);
	
		if (instance_exists(obj_horde)) {obj_horde.enemies_alive+=1; }
	}
}