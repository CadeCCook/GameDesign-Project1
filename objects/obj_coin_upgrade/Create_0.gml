btn_w = (sprite_index != -1) ? sprite_width  : 160;
btn_h = (sprite_index != -1) ? sprite_height : 160;

hover   = false;
enabled = true;

if (!variable_global_exists("shop")) global.shop = {};
if (!variable_struct_exists(global.shop, "coin_mult_level")) global.shop.coin_mult_level = 0;
if (!variable_struct_exists(global.shop, "coin_mult_max"))   global.shop.coin_mult_max   = 5;
if (!variable_global_exists("coin_mult"))                    global.coin_mult            = power(2, global.shop.coin_mult_level);

coinmult_cost = function() {
    return 500 * power(2, global.shop.coin_mult_level);
};

_apply_runtime_mult = function() {
    global.coin_mult = power(2, global.shop.coin_mult_level);
};
