var left  = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var up    = keyboard_check_pressed(vk_up);
var on_ground = instance_place(x, y+1, obj_block);

last_speed = current_speed;

if (left || right) {
    if (on_ground) {
        current_speed = min(current_speed + acceleration, move_speed);
    } else {
        current_speed = min(current_speed + air_acceleration, move_speed);
    }
}

var dx = 0;
var moving = false;
if (left && !instance_place(x - current_speed, y - 2, obj_block)) {
    dx -= current_speed;
    image_xscale = -1;
	sprite_index = spr_player_run;
	moving = true;
}
if (right && !instance_place(x + current_speed, y - 2, obj_block)) {
    dx += current_speed;
    image_xscale = 1;
	sprite_index = spr_player_run;
	moving = true;
}
if (moving == false) {
	sprite_index = spr_player	
}
x += dx;

if (!right && !left) {
    if (on_ground) {
        last_speed = 0;
        current_speed = 0;
    } else {
        last_speed = current_speed;
    }
}

if (up && on_ground) {
    var bonus = 1.4 + 0.10 * global.shop.jump_level;
    var jump_impulse = base_jump_speed * bonus;
    vspeed = jump_impulse;
}

if (!on_ground) {
    gravity = 0.25;
} else {
    gravity = 0;
}

vspeed = min(vspeed, 12);


if (on_ground && abs(dx) > 0.05) {
    if (sprite_index != spr_player_run) {
        sprite_index = spr_player_run;
        //image_speed  = 0.18;
    }
} 

else if (on_ground && abs(dx) == 0) {
    if (sprite_index != spr_player) {
        sprite_index = spr_player;
    }
    //image_speed = 0;
} 

if (up && on_ground) {
	if (sprite_index != spr_player_jump){
		sprite_index = spr_player_jump
	}
} 
/*
else if (!on_ground && vspeed > 1) {
	if (sprite_index != spr_marker){
		sprite_index = spr_marker
	}
} 
else if (!on_ground) {
	if (sprite_index != spr_bat){
		sprite_index = spr_bat
	}
}