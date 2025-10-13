var gw = display_get_gui_width();
var gh = display_get_gui_height();
var cx = btn_anchor_x * gw;
var cy = btn_anchor_y * gh;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var rx1 = cx - btn_w * 0.5;
var ry1 = cy - btn_h * 0.5;
var rx2 = cx + btn_w * 0.5;
var ry2 = cy + btn_h * 0.5;

hovered = point_in_rectangle(mx, my, rx1, ry1, rx2, ry2);

if (hovered && mouse_check_button_pressed(mb_left)) {
    if (instance_exists(obj_game)) with (obj_game) reset_run();
    room_goto(restart_room);
}

