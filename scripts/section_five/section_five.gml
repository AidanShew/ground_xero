function section_five(){
	if (!spawned){
		scr_create_enemy_treclops();
		spawned=true;
	}

	if (global.enemies_off_screen >= 1) {
		global.enemies_off_screen=0;
		spawned=false;
		show_debug_message("Enemies Off Screen: "+string(global.enemies_off_screen));
		show_debug_message("End of Section 5...\nGoing to Section 6");
		section=SECTION.SIX;
	}
}