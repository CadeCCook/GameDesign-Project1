if (_game_over_pending) {
    visible = false;
    exit;
}

if (!instance_exists(obj_player)) exit;

image_xscale = obj_player.image_xscale;
x = obj_player.x + obj_player.sprite_width / 2;
y = obj_player.y - 11;

if (obj_player.current_speed > 0) image_angle += movement_effect;
if (obj_player.current_speed < 0) image_angle -= movement_effect;

if (keyboard_check_pressed(vk_up) && obj_player.vspeed == 0) {
    image_angle *= jump_effect;
}

if (keyboard_check(ord("D"))) image_angle -= control_effect;
if (keyboard_check(ord("A"))) image_angle += control_effect;

for (var i = -10; i >= -50; i -= 10) { if (image_angle < i) image_angle -= weight_effect; else break; }
for (var j =  10; j <=  50; j += 10) { if (image_angle > j) image_angle += weight_effect; else break; }

image_angle = clamp(image_angle, -max_tilt_deg, max_tilt_deg);

if (_drop_cooldown > 0) {
    _drop_cooldown--;
} else {
    if (image_angle >=  max_tilt_deg)  _drop_one_plate(+1);
    if (image_angle <= -max_tilt_deg)  _drop_one_plate(-1);
}