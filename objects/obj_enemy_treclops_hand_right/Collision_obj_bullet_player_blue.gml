instance_destroy(other);
var sound=choose(snd_explosion_normal, snd_explosion_high, snd_explosion_low, snd_explosion_lower);
audio_play_sound(sound, 1, false);
if (global.tre_phase==TRECLOPS_PHASE.FOUR) { 
	if (self.red==other.red) enemy_health-=0.5;
	else enemy_health--;
}

if (enemy_health<=0) {
	global.enemies_off_screen++;
	global.tre_phase=TRECLOPS_PHASE.FIVE;
	instance_destroy(self);
}