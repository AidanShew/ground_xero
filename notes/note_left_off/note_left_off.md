10-12-2026:
Well I fixed everything that I was ranting about below, except the enum polarity, I'll do that later.

I'm mostly working on sprites, one of the last biggest hurdles is the background of the game, which is kind of ambitious but possible.
I just need time! I have midterms coming up so I'll probably have to partition work away from this for a bit. But I'll still increment progress.

TO DO:
- Background
- Polarity enum
- Organize sprite directory


10-09-2026:
I last added the new thruster sprite for red and blue.

BUT when I switch polarities, it doesn't switch the sprite accordingly until move_x or move_y update.

I need to find a way to keep the polarities synced across the main body and thrusters.


TO DO:
- I want to switch the red/blue polarity to a enum controlled state, that would be probably more efficient.
- Implement sprite target system for thrusters to simplify their step functions.
- Fix desyncing of polarity sprites.

Also the sprite directory is a mess, it needs to be sorted through properly. GET TO WORK!!