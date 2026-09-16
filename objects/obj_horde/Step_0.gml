scr_ui_create_stars();
if (horde_round>global.highest_round) { global.highest_round=horde_round; }

switch (horde_round) {
	case 1: 
	if (!audio_played_one) {
		audio_played_one=true;
		audio_play_sound(announcer_round_one, 1, false);
	}
	round_one=true;
	break;

	case 2: 
	if (!audio_played_two) {
		audio_played_two=true;
		audio_play_sound(announcer_round_two, 1, false);
	}
	round_two=true;
	break;

	case 3: 
	if (!audio_played_three) {
		audio_played_three=true;
		audio_play_sound(announcer_round_three, 1, false);
	}
	round_three=true;
	break;

	case 4:
	if (!audio_played_four) {
		audio_played_four=true;
		audio_play_sound(announcer_round_four, 1, false);
	}
	round_four=true;
	break;
	
	case 5:
	if (!audio_played_five) {
		audio_played_five=true;
		audio_play_sound(announcer_round_five, 1, false);
	}
	round_five=true;
	break;
}

switch (horde_wave) {
	case 1: 
	wave_one=true;
	break;

	case 2: 
	wave_two=true;
	break;

	case 3: 
	wave_three=true;
	break;

	case 4:
	wave_four=true;
	break;
	
	case 5:
	wave_five=true;
	break;
}