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

if (move_x < 0) {
	obj_player_thruster_left.thruster_state = THRUSTER.LEFT;
	obj_player_thruster_right.thruster_state = THRUSTER.LEFT;
}
else if (move_x > 0) {
	obj_player_thruster_left.thruster_state = THRUSTER.RIGHT;
	obj_player_thruster_right.thruster_state = THRUSTER.RIGHT;
}
else if (move_y < 0) {
	obj_player_thruster_left.thruster_state = THRUSTER.UP;
	obj_player_thruster_right.thruster_state = THRUSTER.UP;
}
else if (move_y > 0) {
	obj_player_thruster_left.thruster_state = THRUSTER.DOWN;
	obj_player_thruster_right.thruster_state = THRUSTER.DOWN;
}
else {
	obj_player_thruster_left.thruster_state = THRUSTER.NEUTRAL;
	obj_player_thruster_right.thruster_state = THRUSTER.NEUTRAL;
}

x += move_x * player_speed;
y += move_y * player_speed;

with (obj_player_thruster_left) {
	x += other.move_x * other.player_speed;
	y += other.move_y * other.player_speed;
	x = clamp(x, 545, room_width-545);
	y = clamp(y, 30, room_height-25);
}

with (obj_player_thruster_right) {
	x += other.move_x * other.player_speed;
	y += other.move_y * other.player_speed;
	x = clamp(x, 545, room_width-545);
	y = clamp(y, 30, room_height-25);
}

with (obj_player_guns) {
	x += other.move_x * other.player_speed;
	y += other.move_y * other.player_speed;
	x = clamp(x, 545, room_width-545);
	y = clamp(y, 30, room_height-25);
}

hsp = move_x * player_speed;
vsp = move_y * player_speed;

//Keeps player within boundaries
obj_player.x = clamp(x, 545, room_width-545);
obj_player.y = clamp(y, 30, room_height-25);


// +--------------SPRITE--------------+
/*
if ((sprite_index == spr_to_blue_big) && (image_index >= image_number - 1)) {
    sprite_index = spr_player_big;
	image_index = 0;
    image_speed	= 0;
}
else if ((sprite_index == spr_to_red_big) && (image_index >= image_number - 1)) {
    sprite_index = spr_player_red_big;
    image_speed = 0;
}
*/

// +--------------SHOOTING--------------+

if (keyboard_check(vk_up) && fire_counter++ >= 5 && !megadrive) {
	// Blue sprite is defined before for-loop so both bullets have same sprite.
	// Bullet sprites are randomly assigned.
	var blue_sprite = choose(spr_blue_bullet_thick, spr_blue_bullet_thin);
	
	// For loop runs twice, results in two bullets at once, one for each side of the ship.
	for (var i=0; i<2; i++) {
		var bullet = instance_create_layer(i==0 ? x-20 : x+20, y-100, "Instances",obj_bullet_player);
		
		// bullet sprite is set to either red or blue selection.
		bullet.sprite_index=red ? spr_red_bullet : blue_sprite;
		
		bullet.damage = damage;
	}
		
	
	//var sound = red ? choose(snd_explosion_normal, snd_explosion_low, snd_explosion_lower) : choose(snd_explosion_normal, snd_explosion_high);	
	//audio_play_sound(sound, 1, 0);
	
	fire_counter=0;
}

if (keyboard_check(vk_up)) obj_player_guns.sprite_index = red ? spr_player_guns_red_firing : spr_player_guns_blue_firing;
else obj_player_guns.sprite_index = red ? spr_player_red_guns_neutral : spr_player_blue_guns_neutral;




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