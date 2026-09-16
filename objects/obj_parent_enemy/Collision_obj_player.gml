if (!obj_player.immunity) scr_player_death();
global.enemies_off_screen++;
//instance_destroy(other);
instance_destroy(self);