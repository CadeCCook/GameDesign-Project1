//check if mouse is over button
if (position_meeting(mouse_x, mouse_y, obj_creditsbtn)) {
	hovered = true;
	
	//if left mouse button pressed goes to level 1
	if(mouse_check_button_pressed(mb_left)){
		room_goto(rm_credits);
	}
} else {
	hovered = false;
}