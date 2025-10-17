if (!hover) exit;

var gw = display_get_gui_width();
var gh = display_get_gui_height();
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var tw = 230;
var th = 64;
var tx = clamp(mx + 12, 8, gw - tw - 8);
var ty = clamp(my + 12, 8, gh - th - 8);

draw_set_alpha(0.90);
draw_set_colour(make_colour_rgb(160,120,60));
draw_rectangle(tx, ty, tx + tw, ty + th, false);
draw_set_alpha(1);
draw_set_colour(c_white);

var lvl = global.shop.lives_level;
var mxv = global.shop.lives_max;
var cost_txt = (lvl < mxv) ? ("Cost: " + string(lives_cost()) + " coins") : "MAXED";

draw_text(tx + 10, ty + 8,  "Extra Plates");
draw_text(tx + 10, ty + 26, "Level: " + string(lvl) + "/" + string(mxv));
draw_text(tx + 10, ty + 44, cost_txt);
