if (bullet_amplitude>0) {
	bullet_amplitude-=5;
	audio_play_sound(snd_menu_browse, 1, false);
}
show_debug_message("Bullet Amplitude: "+string(bullet_amplitude));