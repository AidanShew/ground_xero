enemy_health-=other.damage;
	
//Plays sound effect
var sound=choose(snd_explosion_normal, snd_explosion_high, snd_explosion_low, snd_explosion_lower);
audio_play_sound(sound, 1, false);

instance_destroy(other);

if (enemy_health <= 0) {
	global.enemies_off_screen++;
	instance_destroy(self);
}