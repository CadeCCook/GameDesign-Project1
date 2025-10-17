
if (!hover) exit;


var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var pad = 8;
var w   = 260;
var h   = 82;
var owned = global.shield_owned;


var fill_col  = make_colour_rgb(18,32,48);
var frame_col = make_colour_rgb(60,160,220);

draw_set_alpha(0.92);
draw_set_colour(fill_col);
draw_rectangle(mx, my, mx + w, my + h, false);
draw_set_alpha(1);

draw_set_colour(frame_col);
draw_rectangle(mx, my, mx + w, my + h, true);

draw_set_colour(c_white);
var ty = my + pad;
draw_text(mx + pad, ty, "Shield");                                    ty += 16;
draw_text(mx + pad, ty, "Status: " + (owned ? "OWNED" : "Available")); ty += 16;
draw_text(mx + pad, ty, "Effect: Negates one mob hit");                ty += 16;
draw_text(mx + pad, ty, owned ? "Cost: —" : ("Cost: " + string(shield_cost) + " coins"));