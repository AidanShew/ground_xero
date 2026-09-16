var wave_amplitude = 60;   //Width of wave
var wave_frequency = 0.1;  //Speed of oscillation

t++;

switch(move_type) {
	case TRACER_MOVE.FROM_BOTTOM_CENTER:
	case TRACER_MOVE.FROM_BOTTOM_LEFT:
	case TRACER_MOVE.FROM_BOTTOM_RIGHT:
	y-=move_speed;
	break;
	
	case TRACER_MOVE.FROM_LEFT:
	x+=move_speed;
	y = ystart + sin(t * wave_frequency) * wave_amplitude;
	break;
	
	case TRACER_MOVE.FROM_RIGHT:
	x -= move_speed;
	y = ystart + sin(t * wave_frequency) * wave_amplitude;
	break;
	
	case TRACER_MOVE.FROM_TOP_CENTER:
	case TRACER_MOVE.FROM_TOP_LEFT:
	case TRACER_MOVE.FROM_TOP_RIGHT:
	y+=move_speed;
	break;
}
if (move_type!=TRACER_MOVE.FROM_LEFT&&move_type!=TRACER_MOVE.FROM_RIGHT) {
	switch (alignment) {
		case TRACER_ALIGN.LEFT:
		x = xstart + sin(t * wave_frequency) * wave_amplitude;
		direction=0;
		break;
	
		case TRACER_ALIGN.RIGHT:
		x = xstart - sin(t * wave_frequency) * wave_amplitude;
		direction=180;
		break;
	}
}