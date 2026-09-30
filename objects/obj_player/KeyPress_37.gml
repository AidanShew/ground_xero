show_debug_message("Red Status: "+string(red));

red = !red;
sprite_index = red ? spr_player_red_shell : spr_player_blue_shell;

image_index = 0;
image_speed = 1;