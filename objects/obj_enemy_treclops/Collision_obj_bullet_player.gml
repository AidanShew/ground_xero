instance_destroy(other);

var sound=choose(snd_explosion_normal, snd_explosion_high, snd_explosion_low, snd_explosion_lower);
audio_play_sound(sound, 1, false);

if (global.tre_phase==TRECLOPS_PHASE.ONE||global.tre_phase==TRECLOPS_PHASE.TWO||global.tre_phase==TRECLOPS_PHASE.FIVE) enemy_health--;
if (global.tre_phase==TRECLOPS_PHASE.FIVE && enemy_health<=0) instance_destroy();