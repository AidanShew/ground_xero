scr_ui_set_ratio();

if (instance_exists(obj_pause_manager)) {
	with (obj_pause_manager) {
		all_objects=[];
		is_paused=false;
	}
}
EnemiesAlive=0;

highscore_sound_played=false;

points=1000;

default_player_hp=50;
player_hp=default_player_hp;

default_player_lives=3;
player_lives=default_player_lives;

whirlpool_amount=1;
whirlpool_round=5;

is_dead=false;

default_text_timer=120;
text_timer=default_text_timer;

activate_horde_intro=false;
phase_one_intro=false;
phase_two_intro=false;
phase_three_intro=false;
phase_four_intro=false;
end_of_intro=false;