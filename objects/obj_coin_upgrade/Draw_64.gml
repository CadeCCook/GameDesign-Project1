draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(16, 16, "Coins: " + string(global.coins));

if (global.show_shop) {
    var px = 48, py = 64, pw = 450, ph = 280;
    draw_set_alpha(0.85);
    draw_set_colour(c_black);
    draw_rectangle(px, py, px+pw, py+ph, false);
    draw_set_alpha(1);

    draw_set_colour(c_white);
    draw_text(px+16, py+12, "UPGRADE SHOP");


    var cost = is_undefined(shop_jump_cost) ? 50 : shop_jump_cost();
    var lvl  = global.shop.jump_level;
    var max_level = global.shop.jump_max;

    var btn_x1 = px+16, btn_y1 = py+48, btn_x2 = px+pw-16, btn_y2 = py+100;
    var can_buy = (lvl < max_level) && (global.coins >= cost);


    var frame_col = can_buy ? make_colour_rgb(60,160,60) : make_colour_rgb(90,90,90);
    draw_set_colour(frame_col);
    draw_rectangle(btn_x1, btn_y1, btn_x2, btn_y2, false);

    draw_set_colour(c_white);
    var label = "Extra Jump Height  (+10% per level)   Lvl " + string(lvl) + "/" + string(max_level);
    draw_text(btn_x1+12, btn_y1+8, label);

    var price_label = (lvl < max_level) ? ("Cost: " + string(cost) + " coins") : "MAXED";
    draw_text(btn_x1+12, btn_y1+40, price_label);


    if (mouse_check_button_pressed(mb_left)) {
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);

        if (point_in_rectangle(mx, my, btn_x1, btn_y1, btn_x2, btn_y2)) {
            if (lvl >= max_level) {
                audio_play_sound(_142608__autistic_lucario__error, 0, false);
            } else if (global.coins >= cost) {
                global.coins -= cost;
                global.shop.jump_level += 1;
                save_progress();
                // add purchase success sound
            } else {
                audio_play_sound(_142608__autistic_lucario__error, 0, false);
            }
        }

}



    draw_text(px+pw-120, py+ph-24, "[S] Close");



}

//timer

if (room == rm_gameover) exit;

var gw = display_get_gui_width();

var t  = max(0, floor(global.level_time_left));
var mm = t div 60;
var ss = t mod 60;

var mm_text = (mm < 10) ? ("0" + string(mm)) : string(mm);
var ss_text = (ss < 10) ? ("0" + string(ss)) : string(ss);

draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(gw - 16, 16, mm_text + ":" + ss_text);
draw_set_halign(fa_left);