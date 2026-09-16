function kodiak_create(amount, move_type, attack_type=noone, mine_alignment=noone){
	
	for (var i=0; i<amount; i++) {
		enemy=instance_create_layer(10, 270,"Instances", obj_enemy_kodiak);
		if (instance_number(obj_enemy_kodiak)%2==0) enemy.red=true;
		enemy.move_type=move_type;
		enemy.mine_alignment=mine_alignment;
		enemy.attack_type=attack_type;
		switch (move_type) {
			case (MOVE.SWOOP_RIGHT):
			if (enemy.red) {
				enemy.direction=270;
				enemy.path = [[1170, 130], [1170, 540]];
				enemy.x=1170;
				enemy.y=-15;
			}
			else {
				enemy.direction=90;
				enemy.path=[[750, 950], [750, 540]];
				enemy.x=750;
				enemy.y=1095;
			}
			break;
			
			case (MOVE.TEST):
			enemy.formation_index=i;
			enemy.path = [[room_width/2, room_height/2]];
			break;
		}
	}
	
}