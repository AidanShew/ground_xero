depth=1;

left=true;

section=1;

global.enemies_off_screen=0;

spawned=false;

spawn_timer=90;
spawn_timer2=120;
spawn_timer3=240;
tracer_section_spawn_timer=2000; //Spawn Timer for Tracer Section

//Spawn Timers
swoop_spawn_timer = 90; //Required For create_swoop()

trio_spawned = false //Indicates that trio has started once.

helix_spawn_timer = 90; //Required For create_helix()

//Required for create_cross()
cross_spawn_timer = 120;
cross_polarity_timer = 30;

//Required for create_circuit()
circuit_spawn_timer = 540;
circuit_speed=10;

//Required for create_pack();
pack_spawn_timer = 120;
pack_iteration = 0;

single_spiral_timer = 1200;
single_spiral_spawned = false;

revolver_spawned = false;
retreat_timer = 540;