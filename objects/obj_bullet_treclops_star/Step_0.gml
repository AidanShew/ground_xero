if (instance_exists(obj_enemy_treclops)) {
	if (!is_thrown) {
		direction-=15;
	}
	else {
		if (instance_exists(obj_player)&&homing_timer-->0) direction=point_direction(x,y, obj_player.x, obj_player.y);
		speed=15;
	}
}
else {
	speed=15; // If treclops is dead bullets will just fly off instead of continuing in a circle
	direction-=0.5;
}