if (keyboard_check_pressed(ord("S"))) {
    global.show_shop = !global.show_shop;
}

if (!_time_out_triggered) {
    global.level_time_left = max(0, global.level_time_left - (1 / room_speed));
    if (global.level_time_left <= 0) {
        _time_out_triggered = true;
        global.lives = global.starting_lives;
        var _snd = asset_get_index("Game_Soundtrack");
        if (_snd != -1) audio_stop_sound(Game_Soundtrack);
        room_goto(rm_gameover);
    }
}