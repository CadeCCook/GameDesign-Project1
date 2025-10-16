var gw = display_get_gui_width();
var gh = display_get_gui_height();
var cx = btn_anchor_x * gw;
var cy = btn_anchor_y * gh;

var sw = sprite_get_width(spr_btn);
var sh = sprite_get_height(spr_btn);

var scale = hovered ? 1.06 : 1;
var target_w = btn_w * scale;
var target_h = btn_h * scale;

var xs = target_w / sw;
var ys = target_h / sh;

draw_sprite_ext(spr_btn, 0, cx, cy, xs, ys, 0, c_white, 1);
