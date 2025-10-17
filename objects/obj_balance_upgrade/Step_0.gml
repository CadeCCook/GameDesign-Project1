
var rx1 = x - sprite_xoffset;
var ry1 = y - sprite_yoffset;
var rx2 = rx1 + btn_w;
var ry2 = ry1 + btn_h;

hover = point_in_rectangle(mouse_x, mouse_y, rx1, ry1, rx2, ry2);

if (hover && mouse_check_button_pressed(mb_left)) {
    var lvl     = global.shop.control_mult_level;
    var max_lvl = global.shop.control_mult_max;
    var cost_now = control_cost();

    if (lvl < max_lvl && global.coins >= cost_now) {
        global.coins -= cost_now;
        global.shop.control_mult_level = lvl + 1;

        _apply_control_effect();

        if (instance_exists(obj_game)) with (obj_game) save_progress();
    } else {
        audio_play_sound(_142608__autistic_lucario__error, 0, false);
    }
}
