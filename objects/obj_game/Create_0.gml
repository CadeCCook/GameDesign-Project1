persistent = true;

if (!variable_global_exists("starting_lives")) global.starting_lives = 5;

if (!variable_global_exists("booted")) {
    if (file_exists("save.ini")) {
        ini_open("save.ini");
        global.coins = ini_read_real("player", "coins", 0);
        var saved_jump   = ini_read_real("shop", "jump_level", 0);
        var shield_owned = ini_read_real("shop", "shield_owned", 0);
        ini_close();

        global.shop = {
            jump_level: saved_jump,
            jump_max: 5,
            jump_base_cost: 10
        };
        global.shield_owned   = (shield_owned == 1);
    } else {
        global.coins = 0;
        global.shop  = { jump_level: 0, jump_max: 5, jump_base_cost: 10 };
        global.shield_owned = false;
        ini_open("save.ini");
        ini_write_real("player", "coins", global.coins);
        ini_write_real("shop",   "jump_level",  global.shop.jump_level);
        ini_write_real("shop",   "shield_owned", 0);
        ini_close();
    }

    global.lives = global.starting_lives;
    global.show_shop = false;
    global.booted = true;
}

//timer for clock

global.level_time_total = 2.5 * 60;
global.level_time_left  = global.level_time_total;
_time_out_triggered = false;

//code for shield upgrade

global.shield_charges = global.shield_owned ? 1 : 0;

function reset_run() {
    global.lives = global.starting_lives;
    global.level_time_left = global.level_time_total;
    _time_out_triggered = false;
    global.shield_charges = global.shield_owned ? 1 : 0;
}

function shop_jump_cost() {
    return global.shop.jump_base_cost * power(2, global.shop.jump_level);
}

function save_progress() {
    ini_open("save.ini");
    ini_write_real("player", "coins",       global.coins);
    ini_write_real("shop",   "jump_level",  global.shop.jump_level);
    ini_write_real("shop",   "shield_owned", global.shield_owned ? 1 : 0);
    ini_close();
}