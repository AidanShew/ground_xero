starting_enemy_health=1000;
enemy_health=starting_enemy_health;
red=false;
x=room_width/2;
y=-50;

var left_hand=instance_create_layer(x,y,"Instances", obj_enemy_treclops_hand_left);
left_hand.path = [(room_width/2)-400, 200]

var right_hand=instance_create_layer(x,y,"Instances", obj_enemy_treclops_hand_right);
right_hand.path=[(room_width/2)+400, 200];

fire_counter=0;
fire_counter_two=0;
move_speed=3;
fire=false;
index=-1;
fired=0;
speed=15;
throw_timer=60;
bullet_star=[];
bullet_thrown=0;
bullets_restocked=false;
polarity_timer=300;

ss_timer=360;

attack_type=TRECLOPS_ATTACK.NONE;
global.tre_phase=TRECLOPS_PHASE.ONE;

phase_ready=true;

//Rain Stuff
left=false;
fire_rain=false;
rain_timer=1200;
offset=1201;
firing=false;
bullet_x=01;

//Health Stuff
starting_p1_health=750;
starting_p2_health=500;
starting_p3_health=500;

phase_one_health=750;
phase_two_health=500;
phase_three_health=500;

increase=true;
increase2=false;
dir1=180;
dir2=360;
fire_counter_three=0;
desperate_increment=1.5;