			// INPUTS //
// determine left or right movement
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;

// check if jumping
var jump_pressed = keyboard_check_pressed(vk_space);  // var makes varaible local to event


		// check for collisions
// check is standing on ground
is_grounded = place_meeting(x, y+2 , obj_ground);

// check if touching a ladder
is_climbing = place_meeting(x, y, obj_ladder);


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








