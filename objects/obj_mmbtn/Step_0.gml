//check if mouse is over button
if (position_meeting(mouse_x, mouse_y, obj_mmbtn)) {
	hovered = true;
	
	//if left mouse button pressed goes to level 1
	if(mouse_check_button_pressed(mb_left)){
		lives = global.lives
		room_goto(rm_start);
	}
} else {
	hovered = false;
}