
btn_w = (sprite_index != -1) ? sprite_width  : 160;
btn_h = (sprite_index != -1) ? sprite_height : 160;

hover   = false;
enabled = true;

if (!variable_global_exists("shop")) global.shop = {};
if (!variable_struct_exists(global.shop, "control_mult_level")) global.shop.control_mult_level = 0;
if (!variable_struct_exists(global.shop, "control_mult_max"))   global.shop.control_mult_max   = 5;


if (!variable_global_exists("control_mult")) global.control_mult = 1.0;

control_cost = function () {
    return 400 + (global.shop.control_mult_level * 200);
};

_apply_control_effect = function () {
    global.control_mult = 1 + (global.shop.control_mult_level * 0.10);
};

_apply_control_effect();