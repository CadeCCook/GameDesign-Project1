//shield
if (global.shield_charges > 0) {
    global.shield_charges = 0;
    invuln = true;
    exit;
}

if(!invuln) {
    drop_plate();
}
invuln = true;
alarm[0] = 10;