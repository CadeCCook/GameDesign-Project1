if (hspeed > 0) {
	if (!instance_place(x+hsp+sprite_width/2, y+5, obj_block)) {
		show_debug_message("flipping")
        hspeed = -hspeed;
        image_xscale = -image_xscale;
	}
} else if (hspeed < 0) {
	if (!instance_place(x-hsp+sprite_width/2, y+5, obj_block)) {
		show_debug_message("flipping")
        hspeed = -hspeed;
        image_xscale = -image_xscale;
	}
}