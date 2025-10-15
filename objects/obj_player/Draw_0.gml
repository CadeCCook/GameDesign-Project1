var has_shield = (global.shield_charges > 0);

//blue tint for shield
if (has_shield) {
    gpu_set_blendmode(bm_add);
    draw_set_alpha(0.5);
    draw_set_colour(make_colour_rgb(80,170,255));
    var o = 1;
    draw_sprite_ext(sprite_index, image_index, x-o, y, image_xscale, image_yscale, image_angle, c_white, 1);
    draw_sprite_ext(sprite_index, image_index, x+o, y, image_xscale, image_yscale, image_angle, c_white, 1);
    draw_sprite_ext(sprite_index, image_index, x, y-o, image_xscale, image_yscale, image_angle, c_white, 1);
    draw_sprite_ext(sprite_index, image_index, x, y+o, image_xscale, image_yscale, image_angle, c_white, 1);
    draw_set_alpha(1);
    draw_set_colour(c_white);
    gpu_set_blendmode(bm_normal);
}

draw_self();