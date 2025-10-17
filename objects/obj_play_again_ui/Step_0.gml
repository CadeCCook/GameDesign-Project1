
//check if mouse is over button
if (position_meeting(mouse_x, mouse_y, obj_play_again_ui)) {
	hovered = true;
	if (hovered && mouse_check_button_pressed(mb_left)) {
		if (instance_exists(obj_game)) with (obj_game) reset_run();
			lives = global.lives
			room_goto(restart_room);
	}
} else {
	hovered = false;
}