if (invuln) exit;

//bat or rat sound effect
var snd_hit = -1;
if (other.object_index == obj_enemy_rat) {
    snd_hit = _468442__breviceps__video_game_squeak;
} else if (other.object_index == obj_enemy_bat) {
    snd_hit = _445958__breviceps__cartoon_bat_mouse_squeak;
}

// Shield
if (global.shield_charges > 0) {

    global.shield_charges -= 1;
    if (global.shield_charges < 0) global.shield_charges = 0;

    invuln = true;
    alarm[0] = invuln_time;
    exit;
}

drop_plate();

if (snd_hit != -1) {
    audio_play_sound(snd_hit, 0, false);
}

invuln = true;
alarm[0] = invuln_time;