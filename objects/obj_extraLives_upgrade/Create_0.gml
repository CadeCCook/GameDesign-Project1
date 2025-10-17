
btn_w = (sprite_index != -1) ? sprite_width  : 160;
btn_h = (sprite_index != -1) ? sprite_height : 160;

hover   = false;
enabled = true;

if (!variable_global_exists("shop")) global.shop = {};

if (!variable_struct_exists(global.shop, "lives_level")) global.shop.lives_level = 0;
if (!variable_struct_exists(global.shop, "lives_max"))   global.shop.lives_max   = 3;

lives_cost = function () {
    if (instance_exists(obj_game)) {
        var _c = 0;
        with (obj_game) _c = shop_lives_cost();
        return _c;
    }
    return 400 * (global.shop.lives_level + 1);
};