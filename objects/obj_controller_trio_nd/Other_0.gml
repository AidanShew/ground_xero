if (instance_exists(obj_enemy_soldier)) {
	if (obj_enemy_soldier.arrival) {
		with (obj_enemy_soldier) instance_destroy();
		instance_destroy(self);
	}
}