var bullet_direction=irandom(2);
if (bullet_direction==0) {
	audio_play_sound(snd_fire_normal,1,false); 
	left_front_bullet=instance_create_layer(x+40,y,"Instances",obj_bullet_player_blue)
	left_front_bullet.direction=22.5+90;
	left_front_bullet.image_angle=22.5;
}
else if (bullet_direction==1) {
	audio_play_sound(snd_fire_normal,1,false); 
	up_mid=instance_create_layer(x+40,y,"Instances",obj_bullet_player_blue)
	up_mid.direction=90;
}
else {
	audio_play_sound(snd_fire_normal,1,false); 
	right_front_bullet=instance_create_layer(x+40,y,"Instances",obj_bullet_player_blue)
	right_front_bullet.direction=-22.5+90;
	right_front_bullet.image_angle=-22.5;
}