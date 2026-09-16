direction=90;
left=false;

t = 0;

move_speed = 25;

wave_amplitude=instance_exists(obj_player) ? obj_player.bullet_amplitude : 20;   // width of wave
wave_frequency = 0.3;  // speed of oscillation

damage=1;

red=obj_player.red;

sprite_index=red ? spr_red_bullet : spr_bullet;