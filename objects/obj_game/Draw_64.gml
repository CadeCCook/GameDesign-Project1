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

//shield upgrade

var shy = py + 110; //just to set next button under the first
var sbx1 = px+16, sby1 = shy, sbx2 = px+pw-16, sby2 = shy+52;
var shield_cost = 500;
var shield_owned = global.shield_owned;
var can_buy_shield = (!shield_owned) && (global.coins >= shield_cost);

draw_set_colour(can_buy_shield ? make_colour_rgb(60,160,220) : make_colour_rgb(90,90,90));
draw_rectangle(sbx1, sby1, sbx2, sby2, false);

draw_set_colour(c_white);
var shield_label = "Shield (negate one mob hit)";
draw_text(sbx1+12, sby1+8, shield_label);

var shield_price = shield_owned ? "OWNED" : ("Cost: " + string(shield_cost) + " coins");
draw_text(sbx1+12, sby1+28, shield_price);


if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    if (point_in_rectangle(mx, my, sbx1, sby1, sbx2, sby2)) {
        if (!shield_owned && global.coins >= shield_cost) {
            global.coins -= shield_cost;
            global.shield_owned = true;
            global.shield_charges = 1;
            save_progress();
        }
    }
}

//lives upgrade

var ly  = py + 170;
var lbx1 = px+16, lby1 = ly, lbx2 = px+pw-16, lby2 = ly+52;

var lives_lvl = global.shop.lives_level;
var lives_max = global.shop.lives_max;
var lives_cost = (lives_lvl < lives_max) ? shop_lives_cost() : 0;
var can_buy_lives = (lives_lvl < lives_max) && (global.coins >= lives_cost);

draw_set_colour(can_buy_lives ? make_colour_rgb(160,120,60) : make_colour_rgb(90,90,90));
draw_rectangle(lbx1, lby1, lbx2, lby2, false);

draw_set_colour(c_white);
var lives_label = "More Plates (start +1 per level)   Lvl " + string(lives_lvl) + "/" + string(lives_max);
draw_text(lbx1+12, lby1+8, lives_label);

var lives_price = (lives_lvl < lives_max) ? ("Cost: " + string(lives_cost) + " coins") : "MAXED";
draw_text(lbx1+12, lby1+28, lives_price);


if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    if (point_in_rectangle(mx, my, lbx1, lby1, lbx2, lby2)) {
        if (lives_lvl < lives_max && global.coins >= lives_cost) {
            global.coins -= lives_cost;
            global.shop.lives_level += 1;
            save_progress();

            // update starting lives for future runs
            recompute_starting_lives();

            // optional: apply immediately if current lives are below new starting value
            if (global.lives < global.starting_lives) {
                global.lives = global.starting_lives;
                if (instance_exists(obj_plates)) with (obj_plates) {
                    lives = global.lives;
					with(obj_plates){
						show_debug_message("lives:" + string(lives))
						other.image_index = clamp(lives, 0, global.lives)
					}
                    plate_weight = weight_effect / max(lives, 1);
                    _drop_cooldown = 0;
                    _game_over_pending = false;
                    image_angle = 0;
                    visible = true;
                }
            }
        } else {
            audio_play_sound(_142608__autistic_lucario__error, 0, false);
        }
    }
}

    draw_text(px+pw-120, py+ph-24, "[S] Close");



// control upgrade
var my  = py + 230;
var mbx1 = px+16, mby1 = my, mbx2 = px+pw-16, mby2 = my+52;

var mult_lvl = global.shop.control_mult_level;
var mult_max = 5;
var mult_cost = 400 + (mult_lvl * 200);
var can_buy_mult = (mult_lvl < mult_max) && (global.coins >= mult_cost);

draw_set_colour(can_buy_mult ? make_colour_rgb(200,100,200) : make_colour_rgb(90,90,90));
draw_rectangle(mbx1, mby1, mbx2, mby2, false);

draw_set_colour(c_white);
var mult_label = "Multiplier (+10% per level)   Lvl " + string(mult_lvl) + "/" + string(mult_max);
draw_text(mbx1+12, mby1+8, mult_label);

var mult_price = (mult_lvl < mult_max) ? ("Cost: " + string(mult_cost) + " coins") : "MAXED";
draw_text(mbx1+12, mby1+28, mult_price);

if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    if (point_in_rectangle(mx, my, mbx1, mby1, mbx2, mby2)) {
        if (mult_lvl < mult_max && global.coins >= mult_cost) {
            global.coins -= mult_cost;
            global.shop.control_mult_level += 1;
            global.control_mult = 1 + (global.shop.control_mult_level * 0.1);
            save_progress();
        } else {
            audio_play_sound(_142608__autistic_lucario__error, 0, false);
        }
    }
}



}





//timer
if(room == rm_tutorial || room == rm_level1){
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
}