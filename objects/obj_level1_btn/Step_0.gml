//check if mouse is over button
var L = bbox_left;
var T = bbox_top;
var R = bbox_right;
var B = bbox_bottom;

if (point_in_rectangle(mouse_x, mouse_y, L, T, R, B)) {
    if (mouse_check_button_pressed(mb_left)) {
        room_goto(rm_level1);
		global.last_room = rm_level1;
    }
}