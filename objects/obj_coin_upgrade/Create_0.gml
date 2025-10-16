hovered = false;
persistent = true;

if (!variable_global_exists("base_starting_lives")) global.base_starting_lives = 5;
if (!variable_global_exists("starting_lives"))      global.starting_lives      = global.base_starting_lives;
if (!variable_global_exists("control_mult"))		global.control_mult = 1.0;

if (!variable_global_exists("booted")) {
    if (file_exists("save.ini")) {
        ini_open("save.ini");
        global.coins      = ini_read_real("player", "coins", 0);
        var saved_jump    = ini_read_real("shop", "jump_level",   0);
        var shield_owned  = ini_read_real("shop", "shield_owned", 0);
        var saved_lives   = ini_read_real("shop", "lives_level",  0);
        ini_close();

        global.shop = {
            jump_level:     saved_jump,
            jump_max:       5,
            jump_base_cost: 10,

            lives_level:    clamp(saved_lives, 0, 3),
            lives_max:      3,
			
			control_mult_level: 0,
			control_mult_max:   5,
			control_mult:   0
        };
        global.shield_owned = (shield_owned == 1);
    } else {
        global.coins = 0;
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
		global.control_mult = 1.0;

        ini_open("save.ini");
        ini_write_real("player", "coins",           global.coins);
        ini_write_real("shop",   "jump_level",      global.shop.jump_level);
        ini_write_real("shop",   "shield_owned",    0);
        ini_write_real("shop",   "lives_level",     global.shop.lives_level);
        ini_close();
    }

    global.show_shop = false;
    global.booted = true;
}


function save_progress() {
    ini_open("save.ini");
    ini_write_real("player", "coins",           global.coins);
    ini_write_real("shop",   "jump_level",      global.shop.jump_level);
    ini_write_real("shop",   "shield_owned",    global.shield_owned ? 1 : 0);
    ini_write_real("shop",   "lives_level",     global.shop.lives_level);
    ini_close();
}
