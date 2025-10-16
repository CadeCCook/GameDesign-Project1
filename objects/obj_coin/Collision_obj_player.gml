with (other) {
    var base_value = 1;
    var mult       = max(1, global.coin_mult);
    global.coins  += base_value * mult;
}

audio_play_sound(_337049__shinephoenixstormcrow__320655__rhodesmas__level_up_01, 0, false);

instance_destroy();
