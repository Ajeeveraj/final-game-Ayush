// Only run once per room
if (!variable_global_exists("room_switched")) {
    variable_global_set("room_switched", false);
}

if (!global.room_switched) {
    if (instance_number(obj_enemyparent) == 0) {
        global.room_switched = true;

        var next_room_index = room_next(room);
        if (next_room_index != -1) {
            room_goto(next_room_index);
		}
	}
}
if (instance_exists(obj_player)) {
    var target_x = obj_player.x - view_wview[0] / 2;
    var target_y = obj_player.y - view_hview[0] / 2;
    
    // Smoothly move towards target (lerp)
    view_xview[0] = lerp(view_xview[0], clamp(target_x, 0, room_width - view_wview[0]), 0.1);
    view_yview[0] = lerp(view_yview[0], clamp(target_y, 0, room_height - view_hview[0]), 0.1);
}