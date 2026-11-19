// If beginning cutscene already played, fade_out will be true
if (fade_out) {
	if (fade_alpha<=1) fade_alpha+=0.01;
	
	// If fade_alpha is at least 1:
	else {
		// If line index hasn't iterated through the length of line_alpha:
		if (line_index < array_length(line_alpha)-1) {
			line_alpha[line_index] +=0.01;
			
			// If line_alpha[line_index] is at least 1
			if (line_alpha[line_index] >= 1) {
				// If line_alpha 
				line_alpha[line_index] = 1;
				line_index++;
			}
		}
		else if (!done_loading) {
			for (var i = 0; i < array_length(to_load); i++) {
				show_debug_message("Loading...\n"+string(loaded)+"/"+string(array_length(to_load))+" Loaded\n\n");
				sprite_prefetch(to_load[i]);
				loaded ++;
			}
			
			if (loaded >= array_length(to_load)-1) done_loading = true;
				
		}
		else {
			line_alpha[array_length(line_alpha)-1] +=0.01;
	
			if (line_alpha[array_length(line_alpha)-1] >= 1) {
				line_alpha[array_length(line_alpha)-1] = 1;
			}
		}
	}
}
