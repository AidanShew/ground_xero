x = clamp(x, obj_enemy_treclops.x-60, obj_enemy_treclops.x+40);
y = clamp(y, obj_enemy_treclops.y-10, obj_enemy_treclops.y+30);

if (instance_exists(obj_player)) {
	move_towards_point(obj_player.x, obj_player.y, 5);
}