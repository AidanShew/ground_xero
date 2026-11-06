if (fade_out) {
	draw_set_alpha(fade_alpha);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
}


if (fade_alpha>=1) {
	for (var i=0; i < array_length(text_lines)-1; i++) {
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		draw_set_font(ft_clean);
		draw_set_color(make_color_rgb(255, 255, 255));
		draw_set_alpha(line_alpha[i]);
		
		draw_text(room_width/2, room_height/2+(i*40), text_lines[i]);
	}
	
	if (done_loading) {
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		draw_set_font(ft_clean);
		draw_set_color(make_color_rgb(255, 255, 255));
		draw_set_alpha(line_alpha[array_length(text_lines)-1]);
		
		draw_text(room_width/2, room_height - 300, text_lines[array_length(text_lines)-1]);
	}
}

draw_set_alpha(1);