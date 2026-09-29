/*
	+---------------------+
	|	PLAYER - CREATE   |
	+---------------------+
	
	Note: Create Events occur once, upon initialization.
	
	Sections:

*/

// +--------------INITIALIZATION--------------+

depth = -99;

if ( !instance_exists(obj_battle_feed) ) instance_create_layer(x,y,"Instances", obj_battle_feed);
if ( !instance_exists(obj_game) ) instance_create_layer(x,y, "Instances", obj_game);
if ( !instance_exists(obj_player_thruster_left) ) instance_create_layer(x,y, "Instances", obj_player_thruster_left);
if ( !instance_exists(obj_player_thruster_right) ) instance_create_layer(x,y, "Instances", obj_player_thruster_right);
if ( !instance_exists(obj_player_blue_gun) ) instance_create_layer(x,y, "Instances", obj_player_blue_gun);

instance_create_layer(x, y, "Instances", obj_multiplier);

image_speed = 1;

// +--------------BULLETS, DAMAGE, & COMBOS--------------+

//Bullets
bullet_amplitude=20;
fire_counter=0;

//Damage
multiplier=1;
damage=1;

//Combos
default_combo_timer=90;
combo_timer=0
combo=0;

//Polarity
red=false;


// +--------------PLAYER SPEED--------------+

player_speed=10;


// +--------------POWER-UPS & IMMUNITY--------------+

megadrive=false;
overshield=false;

default_pup_time=300
pup_timer=default_pup_time;

//Immunity
immunity=false;
//immunity=obj_game.player_lives!=obj_game.default_player_lives;
default_immunity_timer=120;
immunity_timer=default_immunity_timer;
immortal=(immunity || overshield);