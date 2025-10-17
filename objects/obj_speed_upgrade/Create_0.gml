btn_w = (sprite_index != -1) ? sprite_width  : 160;
btn_h = (sprite_index != -1) ? sprite_height : 160;

hover   = false;
enabled = true;

// Ensure the shop struct/fields exist
if (!variable_global_exists("shop")) global.shop = {};
if (!variable_struct_exists(global.shop, "speed_level")) global.shop.speed_level = 0;
if (!variable_struct_exists(global.shop, "speed_max"))   global.shop.speed_max   = 5;

global.speed_mult = 1 + 0.1 * global.shop.speed_level;

speed_cost = function () {
    return 400 + (global.shop.speed_level * 200);
};
