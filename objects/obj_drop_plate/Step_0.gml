vspeed += .25
if (hspeed > 0){
	hspeed = max(hspeed-1, 0)
} else if (hspeed < 0){
	hspeed = min(hspeed+1, 0)
}