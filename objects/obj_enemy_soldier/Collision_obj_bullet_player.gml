instance_destroy(other);
if (other.red == self.red) {
	enemy_health = --;
	var sound=choose(snd_explosion_normal, snd_explosion_high, snd_explosion_low, snd_explosion_lower);
	audio_play_sound(sound, 1, false);
}

if (enemy_health<=0) {
	if (move_type==MOVE.REVOLVER_RIGHT) {
		array_delete(obj_controller_revolver_right.revolver_soldiers, array_get_index(obj_controller_revolver_right.revolver_soldiers, id), 1);
	}
	else if (move_type==MOVE.REVOLVER_LEFT) {
		array_delete(obj_controller_revolver_left.revolver_soldiers, array_get_index(obj_controller_revolver_left.revolver_soldiers, id), 1);
	}
	instance_destroy(self);
}