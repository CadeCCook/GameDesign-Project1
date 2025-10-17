
if (hover) {
    var lvl     = global.shop.control_mult_level;
    var max_lvl = global.shop.control_mult_max;
    var eff     = 10 * lvl;
    var cost_now = (lvl < max_lvl) ? control_cost() : 0;

    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var bx = clamp(mx + 16, 16, gw - 260);
    var by = clamp(my + 16, 16, gh - 120);

    draw_set_alpha(0.88);
    draw_set_colour(make_colour_rgb(220, 80, 80));
    draw_rectangle(bx, by, bx + 240, by + 88, false);
    draw_set_alpha(1);

    draw_set_colour(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    draw_text(bx + 10, by + 8,  "Balance Control");
    draw_text(bx + 10, by + 28, "Level: " + string(lvl) + "/" + string(max_lvl));
    draw_text(bx + 10, by + 44, "Current Bonus: +" + string(eff) + "% control");

    var cost_str = (lvl < max_lvl) ? ("Cost: " + string(cost_now) + " coins") : "MAXED";
    draw_text(bx + 10, by + 60, cost_str);
}
