image_speed = 0;

lives = variable_global_exists("lives") ? global.lives : 5;

max_tilt_deg        = 60;
tilt_nudge_back     = 10;
drop_cooldown_steps = 10;

//sprite mapping for plates
empty_frame_index = 0;
full_frame_index  = image_number - 1;

//changes art when player gets plate upgrade
function _sync_plate_sprite_from_lives() {
    if (lives <= 0) {
        image_index = empty_frame_index;
    } else {
        var max_visible_plates = abs(full_frame_index - empty_frame_index);
        var shown = clamp(lives, 1, max_visible_plates);
        if (full_frame_index > empty_frame_index) {
            image_index = empty_frame_index + shown;
        } else {
            image_index = empty_frame_index - shown;
        }
    }
}

_sync_plate_sprite_from_lives();

plate_weight       = weight_effect / max(lives, 1);
_drop_cooldown     = 0;
_game_over_pending = false;

//drop one plate
_drop_one_plate = function(sign) {
    image_angle += (sign > 0) ? -tilt_nudge_back : +tilt_nudge_back;

    weight_effect = clamp(weight_effect - plate_weight, 0, weight_effect);
    lives = max(lives - 1, 0);
    global.lives = lives;

    _sync_plate_sprite_from_lives();

    var px = x, py = y;
    if (lives > 0) {
        var stack_height = 28 - 5 * (5 - lives);
        var dx = lengthdir_x(stack_height, image_angle + 90);
        var dy = lengthdir_y(stack_height, image_angle + 90);
        px += dx; py += dy;
    }
    instance_create_layer(px, py, "Instances", obj_drop_plate);

    _drop_cooldown = drop_cooldown_steps;

    if (lives <= 0 && !_game_over_pending) {
        _game_over_pending = true;
        alarm[0] = 20;
    }
};