obj_game.points+=50; //adding 50 points to variable in obj_game.
instance_destroy(other); //destroys other instance.
effect_create_above(ef_explosion, x, y, 1, c_white); // Creates explosive effect

if (sprite_index==spr_rock_big) {
	sprite_index=spr_rock_small;
	instance_copy(true);
}
else {
	instance_destroy();
	create_rock(1);
}