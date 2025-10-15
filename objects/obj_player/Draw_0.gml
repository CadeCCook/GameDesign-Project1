var has_shield = (global.shield_charges > 0);

draw_self();

//blue tint for shield
if (has_shield) {
    gpu_set_blendmode(bm_add);
    var col = make_colour_rgb(80,170,255);
    var a   = 0.6;
    var o   = 2;
    draw_sprite_ext(sprite_index, image_index, x-o, y,     image_xscale, image_yscale, image_angle, col, a);
    draw_sprite_ext(sprite_index, image_index, x+o, y,     image_xscale, image_yscale, image_angle, col, a);
    draw_sprite_ext(sprite_index, image_index, x,   y-o,   image_xscale, image_yscale, image_angle, col, a);
    draw_sprite_ext(sprite_index, image_index, x,   y+o,   image_xscale, image_yscale, image_angle, col, a);
    draw_sprite_ext(sprite_index, image_index, x-o, y-o,   image_xscale, image_yscale, image_angle, col, a);
    draw_sprite_ext(sprite_index, image_index, x+o, y-o,   image_xscale, image_yscale, image_angle, col, a);
    draw_sprite_ext(sprite_index, image_index, x-o, y+o,   image_xscale, image_yscale, image_angle, col, a);
    draw_sprite_ext(sprite_index, image_index, x+o, y+o,   image_xscale, image_yscale, image_angle, col, a);
    gpu_set_blendmode(bm_normal);
}