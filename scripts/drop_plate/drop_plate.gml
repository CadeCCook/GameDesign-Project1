function drop_plate(){
	obj_plates.weight_effect = clamp(obj_plates.weight_effect - obj_plates.plate_weight, 0, obj_plates.weight_effect)
	lives -= 1
	obj_plates.image_index = clamp(obj_plates.image_index - 1, 0, obj_plates.image_index)
	
	if (lives > 0) {
		var stack_height = 28 - 5 * (5 - lives);
		var dx = lengthdir_x(stack_height, obj_plates.image_angle + 90);
		var dy = lengthdir_y(stack_height, obj_plates.image_angle + 90);
		instance_create_layer(obj_plates.x + dx, obj_plates.y + dy, "Instances", obj_drop_plate);
	} else {
		obj_plates.image_index = 5
		instance_create_layer(obj_plates.x, obj_plates.y, "Instances", obj_drop_plate);
	}
}