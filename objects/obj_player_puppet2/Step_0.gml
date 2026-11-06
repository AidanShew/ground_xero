if (go==true) {
	var random_int=irandom(50);
	
	if (random_int==7) sprite_index=spr_player_legacy_big;
	else sprite_index=spr_player_puppet2;
	
	image_alpha=1;
	x=xstart;
	
	if (x==xstart) {
		if (y<-5) {
			switch (rm) {
				case ("horde"):
					room_goto(rm_horde);
					break;
				case ("story"):
					room_goto(rm_cutscene_intro);
					break;
			}
			instance_destroy();
		}
		else {
			y-=15;
		}
	}
}

else {
	if (y>=(room_height*0.5)+150) { 
		y--;
		obj_earth.y++;
		if (point_distance(x, y, x, (room_height*0.5)+150)<50) { 
			y-=0.1;
			obj_earth.y+=0.1;
			obj_earth.sprite_index=spr_earth_destroy_menu;
			}
	}
	else {
		arrived=true;
	}

	if (arrived) {
		obj_earth.y-=0.01
		if (index==0) {
			if (x>=xstart+50) { index=1; }
			else { 
				if (point_distance(x,y,xstart+50,y)<10) {
					sprite_index=spr_player_puppet2;
					x++;
				}
				else if (point_distance(x,y,xstart+50,y)<25) {
					sprite_index=spr_player_puppet2_right;
					x++;
				}
				else {
					sprite_index=spr_player_puppet2_right;
					x+=1.5;
				}
			}
		}
		else if (index==1) {
			if (x<=xstart-50) { index=0; }
			else { 
				if (point_distance(x,y,xstart-50,y)<10) {
					sprite_index=spr_player_puppet2;
					x--;
				}
				else if (point_distance(x,y,xstart-50,y)<25) {
					sprite_index=spr_player_puppet2_left;
					x--;
				}
				else {
					sprite_index=spr_player_puppet2_left;
					x-=1.5;
				}
			}
		}
	}
}