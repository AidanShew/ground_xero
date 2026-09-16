function scr_create_enemy_treclops(){
	if (!treclops_spawned) {
		var tre=instance_create_layer(0,0,"Instances", obj_enemy_treclops);
		tre.path = [room_width/2, 200];
		treclops_spawned=true;
	}
}