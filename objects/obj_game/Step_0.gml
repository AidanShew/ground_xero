if (activate_horde_intro) {
	scr_ui_create_stars();
	if (!phase_one_intro&&!phase_two_intro&&!phase_three_intro&&!phase_four_intro&&!end_of_intro) {
		phase_one_intro=true;
	}
	
	//Phase One of horde intro
	if (text_timer>0&&phase_one_intro) { text_timer--; }
	
	//Detecting to switch to phase two
	if (text_timer<=0&&phase_one_intro&&!phase_two_intro) {
		phase_one_intro=false;
		phase_two_intro=true;
		text_timer=default_text_timer;
	}
	
	//Phase Two of horde intro
	if (phase_two_intro&&text_timer>0) { text_timer--; }

	//Detecting to switch to phase three
	if (text_timer<=0&&phase_two_intro&&!phase_three_intro) {
		phase_two_intro=false;
		phase_three_intro=true;
		text_timer=default_text_timer;
	}

	//Phase Three of horde intro
	if (phase_three_intro&&text_timer>0) { text_timer--; }

	//Detecting to switch to phase four
	if (text_timer<=0&&phase_three_intro&&!phase_four_intro) {
		phase_three_intro=false;
		phase_four_intro=true;
		text_timer=default_text_timer;
	}
	
	//Phase Four of horde intro
	if (phase_four_intro&&text_timer>0) {
		text_timer--;
	}

	if (text_timer<=0&&phase_four_intro) {
		end_of_intro=true;
		phase_four_intro=false;
		activate_horde_intro=false;
	}
}

if (end_of_intro) {
	if (!instance_exists(obj_horde)) { instance_create_layer(x,y,"Instances",obj_horde); }
	
	if (global.high_score<obj_game.points) { 
		if (!highscore_sound_played) {
			highscore_sound_played=true;
			audio_play_sound(announcer_highscore, 0, false);
		}
			
		global.high_score=obj_game.points;
		}

	if (instance_exists(obj_horde)) { rank_assigner(); }

	if (player_lives<0) { obj_game.alarm[0]=0; }

	if (instance_exists(obj_death_screen)) { is_dead=true; }
	else { is_dead=false; }

}
