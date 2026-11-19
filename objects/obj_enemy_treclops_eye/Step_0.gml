x = clamp(x, obj_enemy_treclops.x-60, obj_enemy_treclops.x+60);
y = clamp(y, obj_enemy_treclops.y-40, obj_enemy_treclops.y+40);

if (instance_exists(obj_player)) {
	move_towards_point(obj_player.x, obj_player.y, 5);
}

show_debug_message("Alive!");