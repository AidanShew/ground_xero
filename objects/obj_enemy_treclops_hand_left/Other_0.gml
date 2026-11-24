if (x > room_width) {
	speed=0;
	ready=false;
	x = path[0];
	y = -150;
	speed_ticker=0;
	image_ticker=0;
	follow_timer=120;
	hs_timer=240;
	attack_type=TRECLOPS_ATTACK.CALIBRATE;
}