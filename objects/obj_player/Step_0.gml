fire_counter++;

//Player core movement
move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

x += move_x * player_speed;
y += move_y * player_speed;


/*
if (sprite_index!=spr_to_blue||sprite_index!=spr_to_red) {
	if (move_x < 0) {
		if (!red) sprite_index=spr_player_left;
		else sprite_index=spr_player_red_left;
	}
	else if (move_x > 0) {
		if (!red) sprite_index = spr_player_right;
		else sprite_index=spr_player_red_right;
	}
}
*/

if (sprite_index == spr_to_blue) {

    if (image_index >= image_number - 1) {

        sprite_index = spr_player;

        image_speed = 0;
    }
}
else if (sprite_index == spr_to_red) {

    if (image_index >= image_number - 1) {

        sprite_index = spr_player_red;

        image_speed = 0;
    }
}

//Player shooting
if (keyboard_check(vk_up)&&fire_counter>=fire_limit&&!megadrive) {
	for (var i=0; i<2; i++) {
		bullet=instance_create_layer(x,y,"Instances",obj_bullet_player_blue);
		bullet.left=i==1 ? true : false;
	}
	
	//fire_sound= red ? choose(FireDeep1, FireDeep2, FireDeep3) : choose(Fire0, Fire1, Fire2);
	//audio_play_sound(fire_sound, 1, false);
	fire_counter=0;
}

//Combo
if (--combo_timer<=0) {
	combo_timer=0;
	multiplier+=combo;
	combo=0;
}

//Power-ups
if (place_meeting(x, y, obj_megadrive)&&!overshield) {
	obj_battle_feed.battle_message="Picked up Mega Drive!"
	obj_battle_feed.new_message=true;
	
	audio_play_sound(announcer_megadrive, 1, false);
	
	if (!megadrive) megadrive=!megadrive;
	else pup_timer=default_pup_time;
	
	instance_destroy(obj_megadrive);
}

if (place_meeting(x, y, obj_overshield)&&!megadrive) {
	obj_battle_feed.battle_message="Picked up Overshield!"
	obj_battle_feed.new_message=true;
	
	audio_play_sound(announcer_overshield, 1, false);
	
	if (!overshield) overshield=true;
	else if (overshield) pup_timer=default_pup_time
	
	instance_destroy(obj_overshield);
}

if (immunity_timer>0) {
	immunity=true;
	//immunity_timer--;
}
else immunity=false;

if (overshield) {
	immortal=overshield;
	if (--pup_timer<=0) {
		overshield=false;
		immortal=false;
		pup_timer=default_pup_time;
	}
}
	
if (megadrive) {
	sprite_index=spr_player_megadrive;
	fire_sound=choose(snd_fire_low, snd_fire_lower, snd_fire_lowest, snd_fire_normal, snd_fire_high, snd_fire_higher);
	audio_play_sound(fire_sound, 1, false);
	
	function fire_shot(side) {
		shot=instance_create_layer(x,y,"Instances", obj_bullet_player_blue);
		variable_instance_set(shot, side, true);
		shot.direction=90;
	}
	
	fire_shot("side_r");
	fire_shot("side_l");
	fire_shot("mid_r");
	fire_shot("mid_l");
	
	if (--pup_timer<=0) {
		megadrive=false;
		sprite_index=spr_player;
		pup_timer=default_pup_time;
	}
}

//To make player stay in boundaries
obj_player.x=clamp(x, 545, room_width-545);
obj_player.y=clamp(y, 30, room_height-25);