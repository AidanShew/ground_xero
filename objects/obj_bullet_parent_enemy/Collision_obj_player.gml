if ( (other.red&&red) || (!other.red&&!red) ) obj_game.points*=1.005;
else if (!other.immunity) scr_player_death();

instance_destroy();