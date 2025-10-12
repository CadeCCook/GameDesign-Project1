last_speed = current_speed;

if (keyboard_check(vk_left) || keyboard_check(vk_right)) {
    if (instance_place(x, y+1, obj_block)) {
        current_speed = min(current_speed + acceleration, move_speed);
    } else {
        current_speed = min(current_speed + air_acceleration, move_speed);
    }
}

if (keyboard_check(vk_left) && !instance_place(x - current_speed, y - 2, obj_block)) {
    x -= current_speed;
    image_xscale = -1;
}

if (keyboard_check(vk_right) && !instance_place(x + current_speed, y - 2, obj_block)) {
    x += current_speed;
    image_xscale = 1;
}

if (!keyboard_check(vk_right) && !keyboard_check(vk_left)) {
    if (instance_place(x, y+1, obj_block)) {
        last_speed = 0;
        current_speed = 0;
    } else {
        last_speed = current_speed;
    }
}

if (keyboard_check_pressed(vk_up) && instance_place(x, y+1, obj_block)) {
    var bonus = 1 + 0.10 * global.shop.jump_level;
    var jump_impulse = base_jump_speed * bonus;
    vspeed = jump_impulse;
}

if (!instance_place(x, y+1, obj_block)) {
    gravity = 0.25;
} else {
    gravity = 0;
}

vspeed = min(vspeed, 12);