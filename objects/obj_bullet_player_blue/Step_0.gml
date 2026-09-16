t++;
y -= move_speed;

if (left) {
	x = xstart + sin(t * wave_frequency) * wave_amplitude;
}
else {
	x = xstart + sin(t * wave_frequency+pi) * wave_amplitude;
}