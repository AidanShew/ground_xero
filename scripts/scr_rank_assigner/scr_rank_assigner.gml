function rank_assigner(){
	
if (obj_game.player_lives==-1&&global.highest_round==5&&global.recent_wave>5) { global.highest_rank="Missing in Action"; } 
	
else if (obj_game.player_lives==-1&&global.highest_round==5) { global.highest_rank="Champion"; }
	
else if (obj_game.player_lives==-1&&global.highest_round==4) { global.highest_rank="Hero"; }
	
else if (obj_game.player_lives==-1&&global.highest_round==3) { global.highest_rank="Soldier"; }
	
else if (obj_game.player_lives==-1&&global.highest_round==1||global.highest_round==2) { global.highest_rank="Cadet";	}
	
else if (obj_game.player_lives!=1&&global.highest_round!=5) { global.highest_rank="Deserter"; }

else if (obj_game.player_lives!=-1&&global.highest_round==5) { global.highest_rank="Honorable Discharge"; }

else { global.highest_rank="No Rank Yet"; }

}