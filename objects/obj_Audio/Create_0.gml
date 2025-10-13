global.current_track = noone;

function music_play(track, priority = 1, loop = true, fade_ms = 400) {
    if (global.current_track == noone) {
        audio_play_sound(track, priority, loop);
        global.current_track = track;
        audio_sound_gain(track, 0, 0);
        audio_sound_gain(track, 1, fade_ms);
        return;
    }
    if (global.current_track == track) return;

    var old = global.current_track;
    audio_sound_gain(old, 0, fade_ms);
    audio_play_sound(track, priority, loop);
    audio_sound_gain(track, 0, 0);
    audio_sound_gain(track, 1, fade_ms);
    global.current_track = track;

    alarm[0] = ceil(fade_ms / (1000 / room_speed));
    global._music_to_stop = old;
}

//music_play(Game_Soundtrack);