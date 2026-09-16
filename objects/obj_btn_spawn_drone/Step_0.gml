if (!instance_exists(obj_parent_enemy)) {
	global.enemies_alive=0;
	scr_create_enemy_drone(12, MOVE.ORBIT);
}
