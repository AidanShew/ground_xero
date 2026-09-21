/*
	+-------------------+
	|	PLAYER - STEP	|
	+-------------------+
	
	Note: Step Events occur every frame.
	
	Sections:
	* Movement
	* Sprite
	* Shooting
	* Combos
	* Power-Ups
*/

// +--------------MOVEMENT--------------+

//If negative, player is moving left
move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));

//If negative, player is moving up
move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

x += move_x * player_speed;
y += move_y * player_speed;

hsp = move_x * player_speed;
vsp = move_y * player_speed;

//Keeps player within boundaries
obj_player.x = clamp(x, 545, room_width-545);
obj_player.y = clamp(y, 30, room_height-25);


// +--------------SPRITE--------------+

if ((sprite_index == spr_to_blue_big) && (image_index >= image_number - 1)) {
    sprite_index = spr_player_big;
    image_speed	= 0;
}
else if ((sprite_index == spr_to_red_big) && (image_index >= image_number - 1)) {
    sprite_index = spr_player_red_big;
    image_speed = 0;
}


// +--------------SHOOTING--------------+

if (keyboard_check(vk_up) && fire_counter++ >= 2 && !megadrive) {
	for (var i=0; i<2; i++) {
		var bullet = instance_create_layer(i==0 ? x-10 : x+10,y-10,"Instances",obj_bullet_player);
		bullet.damage = damage;
	}
		
	
	//var sound = red ? choose(snd_explosion_normal, snd_explosion_low, snd_explosion_lower) : choose(snd_explosion_normal, snd_explosion_high);	
	//audio_play_sound(sound, 1, 0);
	
	fire_counter=0;
}


// +--------------COMBOS--------------+

if (--combo_timer<=0) {
	combo_timer=0;
	multiplier+=combo;
	combo=0;
}


// +--------------POWER-UPS--------------+

//Megadrive pickup
if (place_meeting(x, y, obj_megadrive)&&!overshield) {
	obj_battle_feed.battle_message="Picked up Mega Drive!"
	obj_battle_feed.new_message=true;
	
	audio_play_sound(announcer_megadrive, 1, false);
	
	if (!megadrive) megadrive=!megadrive;
	else pup_timer=default_pup_time;
	
	instance_destroy(obj_megadrive);
}

//Overshield pickup
if (place_meeting(x, y, obj_overshield)&&!megadrive) {
	obj_battle_feed.battle_message="Picked up Overshield!"
	obj_battle_feed.new_message=true;
	
	audio_play_sound(announcer_overshield, 1, false);
	
	if (!overshield) overshield=true;
	else if (overshield) pup_timer=default_pup_time
	
	instance_destroy(obj_overshield);
}

//Immunity timer
if (immunity_timer>0) {
	immunity=true;
	//immunity_timer--;
}
else immunity=false;

//Overshield attributes
if (overshield) {
	immortal=overshield;
	if (--pup_timer<=0) {
		overshield=false;
		immortal=false;
		pup_timer=default_pup_time;
	}
}

//Megadrive attributes
if (megadrive) {
	sprite_index=spr_player_megadrive;
	fire_sound=choose(snd_fire_low, snd_fire_lower, snd_fire_lowest, snd_fire_normal, snd_fire_high, snd_fire_higher);
	audio_play_sound(fire_sound, 1, false);
	
	function fire_shot(side) {
		shot=instance_create_layer(x,y,"Instances", obj_bullet_player);
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