instance_destroy(other);
var sound=choose(snd_explosion_normal, snd_explosion_high, snd_explosion_low, snd_explosion_lower);
audio_play_sound(sound, 1, false);
if (variable_instance_exists(self, red)&&self.red==other.red) enemy_health-=0.5;
else enemy_health--;

if (enemy_health<=0) {
	if (move_type==MOVE.REVOLVER_RIGHT) {
		array_delete(obj_controller_revolver_right.revolver_soldiers, array_get_index(obj_controller_revolver_right.revolver_soldiers, id), 1);
	}
	else if (move_type==MOVE.REVOLVER_LEFT) {
		array_delete(obj_controller_revolver_left.revolver_soldiers, array_get_index(obj_controller_revolver_left.revolver_soldiers, id), 1);
	}
	global.enemies_off_screen++;
	instance_destroy(self);
}