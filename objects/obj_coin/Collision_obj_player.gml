var mult = 1;
if (variable_global_exists("coin_mult")) {
    mult = max(1, round(global.coin_mult));
}

global.coins += mult;

audio_play_sound(_337049__shinephoenixstormcrow__320655__rhodesmas__level_up_01, 0, false);
instance_destroy();