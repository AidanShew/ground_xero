event_inherited();
fire=false;
mother=obj_enemy_treclops;
fire_counter=0;
fire_counter_two=0;
enemy_health=300;
fire=false;
speed=15;
attack_type=TRECLOPS_ATTACK.CALIBRATE;
phase=TRECLOPS_PHASE.ONE;
image_angle=0;

//Hand Swoop Stuff
global.hs_timer=120; //Hand Swoop Timer
speed_ticker=0;
image_ticker=0;
ready=false;
follow_timer=120;

//Spread Stuff
increase=true;
global.ps_timer=360; //Partial Spread Timer
global.ss_timer=360 //Side Spread Timer

//Rain Stuff
bullet_left=false;