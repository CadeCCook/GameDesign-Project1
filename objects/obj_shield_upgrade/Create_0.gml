btn_w = (sprite_index != -1) ? sprite_width  : 160;
btn_h = (sprite_index != -1) ? sprite_height : 160;

hover   = false;
enabled = true;

if (!variable_global_exists("shop")) global.shop = {};
if (!variable_global_exists("shield_owned")) global.shield_owned = false;
if (!variable_global_exists("shield_charges")) global.shield_charges = 0;

shield_cost = 500;