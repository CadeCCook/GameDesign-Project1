var rx1 = x - sprite_xoffset;
var ry1 = y - sprite_yoffset;
var rx2 = rx1 + btn_w;
var ry2 = ry1 + btn_h;

hover = point_in_rectangle(mouse_x, mouse_y, rx1, ry1, rx2, ry2);

if (hover && mouse_check_button_pressed(mb_left)) {
    var lvl     = global.shop.speed_level;
    var max_lvl = global.shop.speed_max;

    if (lvl < max_lvl) {
        var cost_now = speed_cost();
        if (global.coins >= cost_now) {
            global.coins -= cost_now;
            global.shop.speed_level = lvl + 1;

            global.speed_mult = 1 + 0.1 * global.shop.speed_level;

            if (instance_exists(obj_game)) {
                with (obj_game) {
                    if (!is_undefined(save_progress)) save_progress();
                }
            }
        } else {
            audio_play_sound(_142608__autistic_lucario__error, 0, false);
        }
    }
}
