persistent = true;

if (!variable_global_exists("starting_lives")) global.starting_lives = 5;

if (!variable_global_exists("booted")) {
    if (file_exists("save.ini")) {
        ini_open("save.ini");
        global.coins = ini_read_real("player", "coins", 0);
        var saved_jump = ini_read_real("shop", "jump_level", 0);
        ini_close();
        global.shop = {
            jump_level: saved_jump,
            jump_max: 5,
            jump_base_cost: 10
        };
    } else {
        global.coins = 0;
        global.shop = {
            jump_level: 0,
            jump_max: 5,
            jump_base_cost: 10
        };
        ini_open("save.ini");
        ini_write_real("player", "coins", global.coins);
        ini_write_real("shop", "jump_level", global.shop.jump_level);
        ini_close();
    }
    global.lives = global.starting_lives;
    global.show_shop = false;
    global.booted = true;
}

function reset_run() {
    global.lives = global.starting_lives;
}

function shop_jump_cost() {
    return global.shop.jump_base_cost * power(2, global.shop.jump_level);
}

function save_progress() {
    ini_open("save.ini");
    ini_write_real("player", "coins", global.coins);
    ini_write_real("shop", "jump_level", global.shop.jump_level);
    ini_close();
}