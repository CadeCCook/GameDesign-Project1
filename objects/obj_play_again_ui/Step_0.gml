//check if mouse is over button
if (position_meeting(mouse_x, mouse_y, obj_play_again_ui)) {
	hovered = true;
	
	//if left mouse button pressed goes to level 1
	if(mouse_check_button_pressed(mb_left)){
		if (instance_exists(obj_game)) with (obj_game) reset_run(); 
			room_restart();
		
	}
} else {
	hovered = false;
}
