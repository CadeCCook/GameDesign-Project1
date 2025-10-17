var rx1 = x - sprite_xoffset;
var ry1 = y - sprite_yoffset;
var rx2 = rx1 + btn_w;
var ry2 = ry1 + btn_h;

hover = point_in_rectangle(mouse_x, mouse_y, rx1, ry1, rx2, ry2);

var lvl       = global.shop.jump_level;
var lvl_max   = global.shop.jump_max;
var cost_now  = jump_cost();
var can_buy   = enabled && (lvl < lvl_max) && (global.coins >= cost_now);

if (hover && mouse_check_button_pressed(mb_left)) {
    if (can_buy) {
        global.coins -= cost_now;
        global.shop.jump_level = clamp(global.shop.jump_level + 1, 0, lvl_max);

        var g = _get_game();
        if (g != noone) g.save_progress();
    } else {
        audio_play_sound(_142608__autistic_lucario__error, 0, false);
    }
}
