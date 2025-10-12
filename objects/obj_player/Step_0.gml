last_speed = current_speed

if (keyboard_check(vk_left) or keyboard_check(vk_right)) {
	if (instance_place(x, y+1, obj_block)) {
		current_speed = min(current_speed + acceleration, move_speed)
	} else {
		current_speed = min(current_speed + air_acceleration, move_speed)
	}
}

var moving = false

if (keyboard_check(vk_left) and !instance_place(x-current_speed, y-2, obj_block)) {
	x -= current_speed
	image_xscale = -1
	sprite_index = spr_player_run
	moving = true
}
	

if (keyboard_check(vk_right) and !instance_place(x+current_speed, y-2, obj_block)) {
	x += current_speed
	image_xscale = 1
	sprite_index = spr_player_run
	moving = true
}

if (moving == false) {
	sprite_index = spr_player	
}


if (!keyboard_check(vk_right) and !keyboard_check(vk_left)) {
	if (instance_place(x, y+1, obj_block)) {
		last_speed = 0
		current_speed = 0
	} else {
		last_speed = current_speed
	}
}


if (keyboard_check(vk_up)) {
	if (instance_place(x, y+1, obj_block)){
		vspeed = jump_height
	}
}

if (!instance_place(x, y+1, obj_block)){
	gravity = 0.25
} else{
	gravity = 0
}

vspeed = min(vspeed, 12)

//Move background with character
//var background_x = -x * .5;

//layer_x("Background", background_x);


