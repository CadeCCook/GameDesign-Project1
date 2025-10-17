var rx1 = x - sprite_xoffset;
var ry1 = y - sprite_yoffset;
var rx2 = rx1 + btn_w;
var ry2 = ry1 + btn_h;

hover = point_in_rectangle(mouse_x, mouse_y, rx1, ry1, rx2, ry2);


if (hover && mouse_check_button_pressed(mb_left)) {
    var lvl = global.shop.lives_level;
    var mx  = global.shop.lives_max;

    if (lvl < mx) {
        var cost_now = lives_cost();
        if (global.coins >= cost_now) {
            global.coins -= cost_now;
            global.shop.lives_level = lvl + 1;

            if (instance_exists(obj_game)) {
                with (obj_game) {
                    recompute_starting_lives();
                    save_progress();
                }
            } else {
                global.starting_lives = global.base_starting_lives + global.shop.lives_level;
            }

            if (variable_global_exists("lives")) {
                if (global.lives < global.starting_lives) {
                    global.lives = global.starting_lives;

                    if (instance_exists(obj_plates)) with (obj_plates) {
                        lives = global.lives;

                        if (is_undefined(_sync_plate_sprite_from_lives)) {
                            image_index = clamp(lives - 1, 0, image_number - 1);
                        } else {
                            _sync_plate_sprite_from_lives();
                        }
                        plate_weight       = weight_effect / max(lives, 1);
                        _drop_cooldown     = 0;
                        _game_over_pending = false;
                        image_angle        = 0;
                        visible            = true;
                    }
                }
            }
        } else {
            audio_play_sound(_142608__autistic_lucario__error, 0, false);
        }
    }
}
