
//restart game + reset upgrades
if (keyboard_check_pressed(vk_backspace)) {
	audio_stop_sound(Game_Soundtrack)
	global.starting_lives = global.base_starting_lives
	global.lives = global.base_starting_lives
	lives = global.lives
	global.shield_charges = 0
	global.coins = 0
	global.level_time_total = 2.5 * 60;
	global.level_time_left  = global.level_time_total;
	obj_game.time_out_triggered     = false;
	
	global.shop  = {
        jump_level:     0,
        jump_max:       5,
        jump_base_cost: 10,
        lives_level:    0,
        lives_max:      3,
		
		control_mult_level: 0,
		control_mult_max:   5,
		control_mult:   0
    };
	
    global.shield_owned = false;
	global.shield_owned = false;


    ini_open("save.ini");
    ini_write_real("player", "coins",           global.coins);
    ini_write_real("shop",   "jump_level",      global.shop.jump_level);
    ini_write_real("shop",   "shield_owned",    0);
    ini_write_real("shop",   "lives_level",     global.shop.lives_level);
    ini_close();
	
	room_goto(rm_tutorial);
}