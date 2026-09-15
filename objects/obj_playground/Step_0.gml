if (!spawned) {
	//treclops_create();
	//create_double_spiral();
	//create_cross();
	//create_single_spiral();
	//create_trio();
	create_revolver();
	spawned=true;
}
if (--retreat_timer <= -540) {
	//section++;
}
//create_tracer_section();
//create_pack();
//create_helix();
/*
create_cross();
var pol_limit=30;
if (cross_polarity_timer>=-pol_limit) cross_polarity_timer--;
else cross_polarity_timer=pol_limit;

show_debug_message("Cross Pol Timer: "+string(obj_playground.cross_polarity_timer));
*/

//create_circuit();
//swoop_create();
