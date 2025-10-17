
if (!hover) exit;

var lvl       = global.shop.coin_mult_level;
var max_level = global.shop.coin_mult_max;
var cost      = coinmult_cost();
var cur_x     = power(2, lvl);

var gx = device_mouse_x_to_gui(0) + 14;
var gy = device_mouse_y_to_gui(0) + 14;

var gw = display_get_gui_width();
var gh = display_get_gui_height();
var tw = 180;
var th = 70;
if (gx + tw > gw - 8) gx = gw - tw - 8;
if (gy + th > gh - 8) gy = gh - th - 8;


draw_set_colour(make_colour_rgb(235, 180, 60));
draw_set_alpha(0.95);
draw_rectangle(gx, gy, gx + tw, gy + th, false);
draw_set_alpha(1);


draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(gx + 8, gy + 6, "Coin Value");
draw_text(gx + 8, gy + 24, "Current: x" + string(cur_x));

var price_text = (lvl < max_level) ? ("Cost: " + string(cost)) : "MAXED";
draw_text(gx + 8, gy + th - 20, price_text);
