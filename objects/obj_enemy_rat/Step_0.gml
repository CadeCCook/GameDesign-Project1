if (hspeed > 0) {
	if (!instance_place(x+1+sprite_width/2, y+1, obj_block)) {
        hspeed = -hspeed;
        image_xscale = -image_xscale;
	}
} else if (hspeed < 0) {
	if (!instance_place(x-1+sprite_width/2, y+1, obj_block)) {
        hspeed = -hspeed;
        image_xscale = -image_xscale;
	}
}