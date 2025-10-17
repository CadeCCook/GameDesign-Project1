
var mx = device_mouse_x(0);
var my = device_mouse_y(0);

var x1 = x - sprite_xoffset;
var y1 = y - sprite_yoffset;
var x2 = x1 + btn_w;
var y2 = y1 + btn_h;

hover = point_in_rectangle(mx, my, x1, y1, x2, y2);


var lvl       = global.shop.coin_mult_level;
var max_level = global.shop.coin_mult_max;
var cost      = coinmult_cost();
enabled       = (lvl < max_level);

if (enabled && hover && mouse_check_button_pressed(mb_left)) {
    if (global.coins >= cost) {
        global.coins -= cost;
        global.shop.coin_mult_level += 1;
        _apply_runtime_mult();

        if (instance_exists(obj_game)) with (obj_game) save_progress();

    } else {
        audio_play_sound(_142608__autistic_lucario__error, 0, false);
    }
}

