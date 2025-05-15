		//movement
// climbing
if is_climbing {
	move_y = keyboard_check(vk_down) - keyboard_check(vk_up);
	move_y *= climb_speed;
}

else {
// jumping
	if (is_grounded && jump_pressed) {
	move_y = jump_speed;
}
else if move_y < max_fall_speed {
move_y += gravity_force;
	}
}
     //actually move player
move_and_collide(move_x, move_y, obj_ground);

if (global.hasBow) {
    // Code to shoot an arrow, trigger an attack, etc.
    if (mouse_check_button_pressed(mb_left)) {
        // Code to create an arrow or trigger an action
        instance_create_layer(x, y, "bow", obj_arrow); // Create an arrow at the player's position
    }
}

// Example of shooting arrows when the player has the bow
if (mouse_check_button_pressed(mb_left)) {
    // Create an arrow at the player's position
    instance_create_layer(x, y, "Arrows", obj_arrow); 
}


