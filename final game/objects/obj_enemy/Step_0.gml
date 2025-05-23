// === Gravity ===
vspd += grav;
if (place_meeting(x, y + vspd, obj_ground)) {
    while (!place_meeting(x, y + sign(vspd), obj_ground)) {
        y += sign(vspd);
    }
    vspd = 0;
} else {
    y += vspd;
}

// === Follow Player (using parent)
var target = instance_nearest(x, y, obj_parentplayer);
if (target != noone) {
    if (x < target.x) {
        x += spd;
    } else if (x > target.x) {
        x -= spd;
    }
}

