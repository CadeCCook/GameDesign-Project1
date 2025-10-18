draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_black);



if (!variable_global_exists("shop")) global.shop = {};
var _s = global.shop;

if (!variable_struct_exists(_s, "jump_level"))   { _s.jump_level   = 0; _s.jump_max   = 5; }
if (!variable_struct_exists(_s, "lives_level"))  { _s.lives_level  = 0; _s.lives_max  = 3; }
if (!variable_struct_exists(_s, "speed_level"))  { _s.speed_level  = 0; _s.speed_max  = 5; }
if (!variable_struct_exists(_s, "control_mult_level")) { _s.control_mult_level = 0; _s.control_mult_max = 5; }

if (!variable_struct_exists(_s, "coin_mult_level")) { _s.coin_mult_level = 0; _s.coin_mult_max = 5; }

if (!variable_global_exists("shield_owned")) global.shield_owned = false;


if (!variable_global_exists("control_mult")) global.control_mult = 1 + 0.1 * _s.control_mult_level;
if (!variable_global_exists("speed_mult"))   global.speed_mult   = 1 + 0.1 * _s.speed_level;

if (!variable_global_exists("coin_mult"))    global.coin_mult    = 1 + 0.1 * _s.coin_mult_level;

//Coins only show in levels and in shop
if (room == rm_tutorial || room == rm_level1 || room == rm_shop){
    draw_set_colour(c_white)
    if (room == rm_shop){
        draw_set_colour(c_black);
    }
    draw_text(345, 141, "Coins: " + string(global.coins));
}

if (global.show_shop) {
    var px = 48, py = 64, pw = 450, ph = 400;
    draw_set_alpha(0.85);
    draw_set_colour(c_black);
    draw_rectangle(px, py, px+pw, py+ph, false);
    draw_set_alpha(1);

    draw_set_colour(c_white);
    draw_text(px+16, py+12, "UPGRADE SHOP");

    var mx_gui = device_mouse_x_to_gui(0);
    var my_gui = device_mouse_y_to_gui(0);
    var click  = mouse_check_button_pressed(mb_left);
    var click_used = false;

    // jump boost
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

    if (!click_used && click && point_in_rectangle(mx_gui, my_gui, btn_x1, btn_y1, btn_x2, btn_y2)) {
        if (lvl >= max_level) {
            audio_play_sound(_142608__autistic_lucario__error, 0, false);
        } else if (global.coins >= cost) {
            global.coins -= cost;
            global.shop.jump_level += 1;
            save_progress();
            click_used = true;
        } else {
            audio_play_sound(_142608__autistic_lucario__error, 0, false);
            click_used = true;
        }
    }

    //shield upgrade
    var shy = py + 110;
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

    if (!click_used && click && point_in_rectangle(mx_gui, my_gui, sbx1, sby1, sbx2, sby2)) {
        if (!shield_owned && global.coins >= shield_cost) {
            global.coins -= shield_cost;
            global.shield_owned = true;
            global.shield_charges = 1;
            save_progress();
        } else {
            audio_play_sound(_142608__autistic_lucario__error, 0, false);
        }
        click_used = true;
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

    if (!click_used && click && point_in_rectangle(mx_gui, my_gui, lbx1, lby1, lbx2, lby2)) {
        if (lives_lvl < lives_max && global.coins >= lives_cost) {
            global.coins -= lives_cost;
            global.shop.lives_level += 1;
            save_progress();

            // update starting lives for future runs
            recompute_starting_lives();


            if (global.lives < global.starting_lives) {
                global.lives = global.starting_lives;
                if (instance_exists(obj_plates)) with (obj_plates) {
                    lives = global.lives;
                    with (obj_plates) {
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
        click_used = true;
    }

    draw_text(px+pw-120, py+ph-24, "[S] Close");

    //coin mult upgrade
    var my  = py + 230;
    var mbx1 = px+16, mby1 = my, mbx2 = px+pw-16, mby2 = my+52;

    var coin_lvl = _s.coin_mult_level;
    var coin_max = _s.coin_mult_max;
    var coin_cost = (coin_lvl < coin_max) ? (400 + coin_lvl * 200) : 0;
    var can_buy_coin = (coin_lvl < coin_max) && (global.coins >= coin_cost);

    draw_set_colour(can_buy_coin ? make_colour_rgb(200,100,200) : make_colour_rgb(90,90,90));
    draw_rectangle(mbx1, mby1, mbx2, mby2, false);

    draw_set_colour(c_white);
    var coin_label = "Coin Multiplier (+10% per level)   Lvl " + string(coin_lvl) + "/" + string(coin_max);
    draw_text(mbx1+12, mby1+8, coin_label);

    var coin_price = (coin_lvl < coin_max) ? ("Cost: " + string(coin_cost) + " coins") : "MAXED";
    draw_text(mbx1+12, mby1+28, coin_price);

    if (!click_used && click && point_in_rectangle(mx_gui, my_gui, mbx1, mby1, mbx2, mby2)) {
        if (coin_lvl < coin_max && global.coins >= coin_cost) {
            global.coins -= coin_cost;
            _s.coin_mult_level = coin_lvl + 1;
            global.coin_mult = 1 + 0.1 * _s.coin_mult_level;
            save_progress();
        } else {
            audio_play_sound(_142608__autistic_lucario__error, 0, false);
        }
        click_used = true;
    }

	//speed boost upgrade
    var sy  = py + 290;
    var sbx1 = px+16, sby1 = sy, sbx2 = px+pw-16, sby2 = sy+52;

    var sp_lvl  = _s.speed_level;
    var sp_max  = _s.speed_max;
    var sp_cost = (sp_lvl < sp_max) ? (400 + (sp_lvl * 200)) : 0;
    var can_buy_speed = (sp_lvl < sp_max) && (global.coins >= sp_cost);

    draw_set_colour(can_buy_speed ? make_colour_rgb(160,140,60) : make_colour_rgb(90,90,90));
    draw_rectangle(sbx1, sby1, sbx2, sby2, false);

    draw_set_colour(c_white);
    var speed_label = "Speed (+10% per level)   Lvl " + string(sp_lvl) + "/" + string(sp_max);
    draw_text(sbx1+12, sby1+8, speed_label);

    var speed_price = (sp_lvl < sp_max) ? ("Cost: " + string(sp_cost) + " coins") : "MAXED";
    draw_text(sbx1+12, sby1+28, speed_price);

    if (!click_used && click && point_in_rectangle(mx_gui, my_gui, sbx1, sby1, sbx2, sby2)) {
        if (sp_lvl < sp_max && global.coins >= sp_cost) {
            global.coins -= sp_cost;
            _s.speed_level = sp_lvl + 1;
            global.speed_mult = 1 + 0.1 * _s.speed_level;
            save_progress();
        } else {
            audio_play_sound(_142608__autistic_lucario__error, 0, false);
        }
        click_used = true;
    }

    // balance upgrade
    var by  = py + 350;
    var bbx1 = px+16, bby1 = by, bbx2 = px+pw-16, bby2 = by+52;

    var bal_lvl  = _s.control_mult_level;
    var bal_max  = _s.control_mult_max;
    var bal_cost = (bal_lvl < bal_max) ? (400 + (bal_lvl * 200)) : 0;

    var can_buy_bal = (bal_lvl < bal_max) && (global.coins >= bal_cost);

    draw_set_colour(can_buy_bal ? make_colour_rgb(200,80,200) : make_colour_rgb(90,90,90));
    draw_rectangle(bbx1, bby1, bbx2, bby2, false);

    draw_set_colour(c_white);
    var bal_label = "Balance (+10% per level)   Lvl " + string(bal_lvl) + "/" + string(bal_max);
    draw_text(bbx1+12, bby1+8, bal_label);

    var bal_price = (bal_lvl < bal_max) ? ("Cost: " + string(bal_cost) + " coins") : "MAXED";
    draw_text(bbx1+12, bby1+28, bal_price);

    if (!click_used && click && point_in_rectangle(mx_gui, my_gui, bbx1, bby1, bbx2, bby2)) {
        if (bal_lvl < bal_max && global.coins >= bal_cost) {
            global.coins -= bal_cost;
            _s.control_mult_level = bal_lvl + 1;
            global.control_mult = 1 + (0.1 * _s.control_mult_level);
            save_progress();
        } else {
            audio_play_sound(_142608__autistic_lucario__error, 0, false);
        }
        click_used = true;
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

    draw_set_colour(c_white);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    draw_text(gw - 16, 16, mm_text + ":" + ss_text);
    draw_set_halign(fa_left);
}
