instance_destroy()
if (lives <=0) {
	game_restart()
}

if (!sfx_played) {
    var idx = irandom(array_length(plate_sounds) - 1);
    var snd = plate_sounds[idx];

    var inst = audio_play_sound(snd, 5, false);
    audio_sound_pitch(inst, random_range(0.95, 1.05));
    audio_sound_gain(inst, random_range(0.85, 1.0), 0);

    sfx_played = true;
}