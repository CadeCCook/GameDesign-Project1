image_index = 0;
image_speed = 1;

var s = choose(
    _233607__abstraktgeneriert__breaking_glass_1,
    _381259__edwar64896__plate_4,
    _548231__max2587__glass_3
);

var inst = audio_play_sound(s, 0, false);
audio_sound_gain(inst, random_range(0.75, 0.95), 0);
audio_sound_pitch(inst, random_range(0.95, 1.05));