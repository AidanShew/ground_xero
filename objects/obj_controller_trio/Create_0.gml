revolver_timer=0;
move_timer=120;
star_timer=120;

revolver_soldiers=[];
star_drones_left=[];
star_drones_right=[]; //Array for throwing drones

scr_create_enemy_soldier(4, MOVE.TRIO);

scr_create_enemy_drone(3, MOVE.TRIO_RIGHT);
scr_create_enemy_drone(3, MOVE.TRIO_LEFT);

x=300;
y=500;

