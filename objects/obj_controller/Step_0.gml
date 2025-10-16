// To open shop press 'S'
if (keyboard_check_pressed(ord("S"))) {
    global.show_shop = !global.show_shop;
}

// +1000 coins on 'P'
if (keyboard_check_pressed(ord("P"))) {
    global.coins += 1000;
    if (instance_exists(obj_game)) with (obj_game) save_progress();
}

// To exit game Esc
if (keyboard_check_pressed(vk_escape)) {
    game_end();
}

// Toggle fullscreen with 'F' isnt working
if (keyboard_check_pressed(ord("F"))) {
    var fs = window_get_fullscreen();
    window_set_fullscreen(!fs);
}

// Restart room with R
if (keyboard_check_pressed(ord("R"))) {
    if (instance_exists(obj_game)) with (obj_game) reset_run();
	audio_stop_sound(Game_Soundtrack);
	room_restart();
}