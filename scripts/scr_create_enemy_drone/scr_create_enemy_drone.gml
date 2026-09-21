function scr_create_enemy_drone(amount, move_type) {
	for (var i=0; i<amount; i++) {
		var enemy=instance_create_layer(x, y, "Instances", obj_enemy_drone);
		enemy.move_type=move_type;
		
		switch(move_type) {
			case (MOVE.ORBIT):
			enemy.path=[room_width/2, room_height*0.25];
			enemy.orbit_angle = i*30;
			break;
			
			case (MOVE.SINGLE_SPIRAL):
			enemy.fire = false;
			enemy.controller = self;
			while (spiral_spawn_timer > 0) {
				enemy.center_x=room_width/2;
				enemy.center_y=((room_height/2)-200);
				spiral_spawn_timer--;
			}
			spiral_spawn_timer = 60;
			
			enemy.x = 1742;
			enemy.y = -100;
			enemy.angle = 0;
			enemy.orbit_radius = 250;
			enemy.orbit_angle = (360/amount)*i;
			enemy.red = (i>=amount/2);
			enemy.attack_type = ATTACK.AIMED;
			
			enemy.arrival = false;
			with (enemy) {
				path =
				[center_x+lengthdir_x(orbit_radius, orbit_angle+angle),
				center_y+lengthdir_y(orbit_radius, orbit_angle)+angle];
				
				speed = 20;
				direction = point_direction(x,y, path[0], path[1]);
			}
			break;
			
			case (MOVE.DICE):
			enemy.direction=270;			
			enemy.formation_index=i;
			
			enemy.path = [
			[560,140], [660, 140], [760, 140], [860, 140], [960,140], [1060,140], [1160,140], [1260,140], [1360,140],
			[610,440], [710, 440], [810, 440], [910, 440], [1010, 440], [1110, 440], [1210,440], [1310, 440]
			];
			if (enemy.path[enemy.formation_index][0]<=room_width/2) enemy.x=350;
			else if (enemy.path[enemy.formation_index][0]>=room_width/2) enemy.x=1600;
			enemy.y=enemy.path[enemy.formation_index][1];
			show_debug_message("Path X: "+string(enemy.path[enemy.formation_index][0])+"\nX: "+string(enemy.x)+"\nPath Y: "+string(enemy.path[enemy.formation_index][1])+"\nY: "+string(enemy.y));
			enemy.image_angle=270;
			break;
			
			case (MOVE.TRIO_LEFT):
			enemy.x=(room_width/2)-250;
			enemy.y=-100;
			enemy.path=[(room_width/2)-250, room_height/2];
			enemy.orbit_angle=i*120;
			enemy.speed=20;
			enemy.homing_timer=20;
			enemy.is_thrown=false;
			array_push(star_drones_left, enemy);
			break;
			
			case (MOVE.TRIO_RIGHT):
			enemy.x=(room_width/2)-250;
			enemy.y=-100;
			enemy.path=[(room_width/2)+250, room_height/2];
			enemy.orbit_angle=i*120;
			enemy.speed=20;
			enemy.homing_timer=20;
			enemy.is_thrown=false;
			array_push(star_drones_right, enemy);
			break;
		}
	}
	
}