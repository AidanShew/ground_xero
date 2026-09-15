function soldier_create(amount, move_type, attack_type=noone, red=noone, target_x=noone, target_y=noone, esc_x=noone, esc_y=noone, start_x=noone, start_y=noone, move_timer=noone, left=noone){
	for (var i=0; i<amount; i++) {
		var enemy=instance_create_layer(0,0,"Instances", obj_enemy_soldier);
		switch (move_type) {
			
			case (MOVE.RIVER):
			enemy.x-=(100*i);
			//enemy.red=i%2==0;
			enemy.path = [[500, 270], [1200,270], [1200, 470], [720,470], [720, 670], [2000, 670]];
			break;
			
			case (MOVE.DICE):
			enemy.direction=270;	
			enemy.formation_index=i;
			
			if (enemy.formation_index==0||enemy.formation_index==2||enemy.formation_index==5||enemy.formation_index==7) enemy.red=true;
			
			enemy.path = [
			[760, 240], [960, 240], [1160, 240], 
				[860, 340], [1060, 340], 
			[760, 440], [960, 440], [1160, 440]
			];
			enemy.image_angle=270;
			break;
			
			case (MOVE.CORNER):
			enemy.x=room_width/2;
			enemy.y=-50;
			enemy.formation_index=i;
			enemy.red=true;
			enemy.speed=10;
			enemy.path= [[660, 340], [1260, 340]];
			enemy.image_angle=270;
			enemy.attack_type=attack_type;
			enemy.move_type=move_type;
			break;
			
			case (MOVE.SWOOP_RIGHT):
			enemy.y=-50;
			enemy.x=(room_width/2);
			enemy.direction=270;
			enemy.image_angle=enemy.direction;
			enemy.move_type=move_type;
			break;
			
			case (MOVE.SWOOP_LEFT):
			enemy.y=-50;
			enemy.x=(room_width/2);
			enemy.direction=270;
			enemy.image_angle=enemy.direction;
			enemy.move_type=move_type;
			break;
			
			case (MOVE.TEST):
			enemy.image_angle=270;
			enemy.direction=270;
			enemy.attack_type=attack_type
			enemy.formation_index=i;
			enemy.path = [[room_width/2, room_height/2]];
			break;
			
			case (MOVE.HELIX_LEFT):
			enemy.y=-50;
			enemy.image_angle=270;
			enemy.x=(room_width/2);
			enemy.direction=270;
			enemy.move_type=move_type;
			enemy.red=true;
			enemy.speed=15;
			break;
			
			case (MOVE.HELIX_RIGHT):
			enemy.y=-50;
			enemy.image_angle=270;
			enemy.x=(room_width/2);
			enemy.direction=270;
			enemy.move_type=move_type;
			enemy.speed=15;
			break;
			
			case (MOVE.CROSS_LEFT):
			case (MOVE.CROSS_RIGHT):
			enemy.controller=self;
			enemy.y=move_type==MOVE.CROSS_LEFT ? -50 : -100;
			enemy.x=(room_width/2);
			enemy.red=red;
			enemy.direction=270;
			enemy.speed=15;
			enemy.move_type=move_type;
			break;
			
			case (MOVE.CIRCUIT_RIGHT):
			case (MOVE.CIRCUIT_LEFT):
			enemy.y=100;
			var path_x1;
			var path_x2;
			var y_offset;
			if (move_type==MOVE.CIRCUIT_RIGHT) {
				enemy.x=1500;
				enemy.direction=180;
				path_x1=(room_width/2)+50;
				path_x2=path_x1+320;
			}
			else if (move_type==MOVE.CIRCUIT_LEFT) {
				enemy.x=400;
				enemy.direction=0;
				path_x1=(room_width/2)-50;
				path_x2=path_x1-320;	
			}
			
			y_offset=50;
			enemy.path = [
				[path_x1, 50], 
				[path_x1, 150], 
				
				[path_x2, 150], 
				[path_x2, 250], 

				[path_x1, 250], 
				[path_x1, 350],

				[path_x2, 350],
				[path_x2, 450],

				[path_x1, 450],
				[path_x1, 550], 

				[path_x2, 550], 
				[path_x2, 650], 

				[path_x1, 650], 
				[path_x1, 750],

				[path_x2, 750],
				[path_x2, 850],

				[path_x1, 850], 
				[path_x1, 950],

				[path_x2, 950],
				[path_x2, 1050],
				
				[path_x1, 1050],
				[path_x1, 1150]
			];
			enemy.y=50;
			enemy.controller=self;
			enemy.speed=circuit_speed;
			enemy.move_type=move_type;
			enemy.red=red;
			break;
			
			/*
			case (MOVE.HELIX):
			enemy.y=100;
			if (!left) {
				enemy.x=(room_width/2)+300;
				enemy.direction=180;
			}
			else {
				enemy.x=(room_width/2)-300;
				enemy.direction=0;
			}
			enemy.left=left;
			enemy.speed=10;
			enemy.move_type=move_type;
			break;
			*/
			case (MOVE.TARGET):
			enemy.x=start_x;
			enemy.y=start_y;
			enemy.attack_type=attack_type;
			enemy.move_type=move_type;
			enemy.path=[[target_x, target_y]];
			enemy.move_timer=move_timer;
			enemy.esc_x=esc_x;
			enemy.esc_y=esc_y;
			enemy.red=red;
			break;
			
			case (MOVE.PACK_LEFT):
			enemy.red=red;
			enemy.direction=270;
			enemy.speed=10;
			enemy.move_type=move_type;
			enemy.attack_type=attack_type;
			enemy.y= i==0 ? -50 : -150;
			
			if (i==0) enemy.x=650;
			else enemy.x= i==2 ? 600 : 700;
			
			break;
			
			case(MOVE.PACK_RIGHT):
			enemy.red=red;
			enemy.direction=270;
			enemy.speed=10;
			enemy.attack_type=attack_type;
			enemy.move_type=MOVE.PACK_RIGHT;
			enemy.y= i==0 ? -50 : -150;
			
			if (i==0) enemy.x=1270;
			else enemy.x=i==2? 1220 : 1320;
			
			break;
			
			case (MOVE.REVOLVER_RIGHT):			
			if (i==0) {
				enemy.x=1725;
				enemy.orbit_angle=180;
				enemy.red=false;
				enemy.initial_target_x=1175; //Where enemy moves to after spawning
				enemy.rotation_order=0; //Order in formation, 0 being on the left side.
			}
			else if (i==2) {
				enemy.x=1875;
				enemy.orbit_angle=0;
				enemy.red=false;
				enemy.initial_target_x=1325
				enemy.rotation_order=2
			}
			else if (i==1) {
				enemy.y=(room_height/2)+75;
				enemy.orbit_angle=90;
				enemy.red=true;
				enemy.initial_target_x=1250;
				enemy.rotation_order=3
				
			}
			else if (i==3) {
				enemy.y=(room_height/2)-75;
				enemy.orbit_angle=270;
				enemy.red=true;
				enemy.initial_target_x=1250;
				enemy.rotation_order=1;
			}	
			
			if (i==0||i==2) enemy.y=(room_height/2);
			else if (i==1||i==3) enemy.x=1800;
			
			enemy.direction=180;
			enemy.image_angle=enemy.direction;
			enemy.move_type=move_type;
			enemy.revolver_right=true;
			array_push(obj_revolver_right_p.revolver_soldiers, enemy);
			break;
			
			case (MOVE.REVOLVER_LEFT):			
			if (i==0) {
				enemy.x=195;
				enemy.orbit_angle=180;
				enemy.red=true;
				enemy.initial_target_x=745; //Where enemy moves to after spawning
				enemy.rotation_order=2; //Order in formation, 0 being on the right side.
			}
			else if (i==2) {
				enemy.x=45;
				enemy.orbit_angle=0;
				enemy.red=true;
				enemy.initial_target_x=595
				enemy.rotation_order=0;
			}
			else if (i==1) {
				enemy.y=(room_height/2)+75;
				enemy.orbit_angle=90;
				enemy.red=false;
				enemy.initial_target_x=670;
				enemy.rotation_order=1
				
			}
			else if (i==3) {
				enemy.y=(room_height/2)-75;
				enemy.orbit_angle=270;
				enemy.red=false;
				enemy.initial_target_x=670;
				enemy.rotation_order=3;
			}	
			
			if (i==0||i==2) enemy.y=(room_height/2);
			else if (i==1||i==3) enemy.x=120;
			
			enemy.direction=0;
			enemy.image_angle=enemy.direction;
			enemy.move_type=move_type;
			enemy.revolver_right=false;
			array_push(obj_revolver_left_p.revolver_soldiers, enemy);
			break;
						
			case (MOVE.TRIO):
			enemy.controller=obj_controller_trio;
			
			if (i==3) { //Left
				enemy.orbit_angle=180;
				enemy.red=true;
				enemy.rotation_order=3;
			}
			else if (i==1) { //Right
				enemy.orbit_angle=0;
				enemy.red=true;
				enemy.rotation_order=1;
			}
			else if (i==2) { //Up
				enemy.orbit_angle=90;
				enemy.red=false;
				enemy.rotation_order=2;
				
			}
			else if (i==0) { //Down
				enemy.orbit_angle=270;
				enemy.red=false;
				enemy.rotation_order=0;
			}	
			
			array_push(self.revolver_soldiers, enemy);
			enemy.direction=270;
			enemy.image_angle=270;
			enemy.move_type=move_type;
			enemy.attack_type=ATTACK.SPREAD;
			self.move_timer=480;
			break;
		}
	}
}