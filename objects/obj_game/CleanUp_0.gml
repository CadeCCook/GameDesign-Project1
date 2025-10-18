if (variable_global_exists("__game_id") && global.__game_id == id) {
    global.__game_id = noone; // don't use variable_global_remove
}