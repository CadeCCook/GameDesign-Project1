image_xscale = obj_player.image_xscale

// Lock to player
x = obj_player.x + obj_player.sprite_width/2
y = obj_player.y - 11

// Acceleration modifiers for angle
/*
if (obj_player.current_speed > obj_player.last_speed){
	image_angle += acceleration_effect
}
if (obj_player.current_speed < obj_player.last_speed){
	image_angle -= acceleration_effect
}
*/

// Movement modifiers for angle
if (obj_player.current_speed > 0) {
	image_angle += movement_effect
}
if (obj_player.current_speed < 0) {
	image_angle -= movement_effect
}

// Jump modifiers for angle
if (keyboard_check_pressed(vk_up) and obj_player.vspeed == 0) {
	image_angle *= jump_effect
}

// Manual controls for angle
if (keyboard_check(ord("D"))){
	image_angle -= control_effect
}

if (keyboard_check(ord("A"))){
	image_angle += control_effect
}

// Passive tipping once beyond angle thresholds
// every 10 degrees of rotation up to 50 will increase the rate of tilting 
for (var i = -10; i >= -50; i -= 10){
	if (image_angle < i) {
		image_angle -= weight_effect
	} else {
		break
	}
}
	

for (var i = 10; i <= 50; i += 10){
	if (image_angle > i) {
		image_angle += weight_effect
	} else {
		break
	}
}

// Clamp stack angle at 60 degrees
image_angle = clamp(image_angle, -60, 60)

// Set add_momentum value to be used in obj_player
//add_momentum = -1*image_angle*momentum_modifier

// Leaning too far drops a plate/lose a life bumps angle back and reduces weight effect
if (image_angle >= 60) {
	image_angle -= 10
	weight_effect = clamp(weight_effect - plate_weight, 0, weight_effect)
	lives -= 1
	image_index = clamp(image_index - 1, 0, image_index)
	
	if (lives > 0) {
		var stack_height = 28 - 5 * (5 - lives);
		var dx = lengthdir_x(stack_height, image_angle + 90);
		var dy = lengthdir_y(stack_height, image_angle + 90);
		instance_create_layer(x + dx, y + dy, "Instances", obj_drop_plate);
	} else {
		image_index = 5
		instance_create_layer(x, y, "Instances", obj_drop_plate);
	}
}

if (image_angle <= -60) {
	image_angle += 10
	weight_effect = clamp(weight_effect - plate_weight, 0, weight_effect)
	lives -= 1
	image_index = clamp(image_index - 1, 0, image_index)
	
	// having 2 of these blocks seems really redundant but my brain hurts and I'm tired (fix later)
	if (lives > 0) {
		var stack_height = 28 - 5 * (5 - lives);
		var dx = lengthdir_x(stack_height, image_angle + 90);
		var dy = lengthdir_y(stack_height, image_angle + 90);
		instance_create_layer(x + dx, y + dy, "Instances", obj_drop_plate);
	} else {
		image_index = 5
		instance_create_layer(x, y, "Instances", obj_drop_plate);
	}	
}

