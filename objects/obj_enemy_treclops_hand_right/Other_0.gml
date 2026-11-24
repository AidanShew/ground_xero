if (x<=0) {
	speed=0;
	x = path[0];
	y = -150;
	ready=false;
	speed_ticker=0;
	image_ticker=0;
	follow_timer=120;
	hs_timer=240;
	attack_type=TRECLOPS_ATTACK.CALIBRATE;
}