
btn_w = (sprite_index != -1) ? sprite_width  : 160;
btn_h = (sprite_index != -1) ? sprite_height : 160;

hover   = false;
enabled = true;

if (!variable_global_exists("shop")) global.shop = {};
if (!variable_struct_exists(global.shop, "jump_level"))     global.shop.jump_level     = 0;
if (!variable_struct_exists(global.shop, "jump_max"))       global.shop.jump_max       = 5;
if (!variable_struct_exists(global.shop, "jump_base_cost")) global.shop.jump_base_cost = 10;

_get_game = function () {
    return instance_exists(obj_game) ? instance_find(obj_game, 0) : noone;
};

jump_cost = function () {
    var g = _get_game();
    if (g != noone) return g.shop_jump_cost();

    return global.shop.jump_base_cost * power(2, global.shop.jump_level);
};


_jump_bonus_text = function () {
    return "+" + string(global.shop.jump_level * 10) + "%";
};
