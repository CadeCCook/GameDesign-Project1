
if (!hover) exit;


var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var pad = 8;
var w   = 220;
var h   = 80;

var lvl     = global.shop.jump_level;
var lvl_max = global.shop.jump_max;

var cost_text = "MAXED";
if (lvl < lvl_max) {
    var c = jump_cost();
    cost_text = "Cost: " + string(c) + " coins";
    h = 82;
}


var fill_col  = make_colour_rgb(18, 48, 18);
var frame_col = make_colour_rgb(60,160,60);

draw_set_alpha(0.9);
draw_set_colour(fill_col);
draw_rectangle(mx, my, mx + w, my + h, false);
draw_set_alpha(1);

draw_set_colour(frame_col);
draw_rectangle(mx, my, mx + w, my + h, true);

draw_set_colour(c_white);
var ty = my + pad;
draw_text(mx + pad, ty, "Jump Boost");                      ty += 16;
draw_text(mx + pad, ty, "Level: " + string(lvl) + "/" + string(lvl_max)); ty += 16;
draw_text(mx + pad, ty, "Current Bonus: +" + string(global.shop.jump_level * 10) + "%"); ty += 16;
draw_text(mx + pad, ty, cost_text);
