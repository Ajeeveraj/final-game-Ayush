// INPUTS //
// Determine left or right movement
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;  // Scale by movement speed

// Check if jumping
var jump_pressed = keyboard_check_pressed(vk_space);  // Local variable for jump press


// Check for collisions
// Check if standing on ground
is_grounded = place_meeting(x, y + 2, obj_ground);

// Check if touching a ladder
is_climbing = place_meeting(x, y, obj_ladder);


// Movement
if (is_climbing) {
    // Climbing
    move_y = keyboard_check(vk_down) - keyboard_check(vk_up);
    move_y *= climb_speed;
} else {
    // Jumping
    if (is_grounded && jump_pressed) {
        move_y = jump_speed;
    } else if (move_y < max_fall_speed) {
        move_y += gravity_force;  // Apply gravity if falling
    }
}

// Actually move the player
move_and_collide(move_x, move_y, obj_ground);
show_debug_message("Current object: " + object_get_name(object_index));


// Move Left
if (keyboard_check(vk_left)) {
    if (!place_meeting(x - move_speed, y, obj_ground)) {
       
	}  }
  


// Keep camera on player (you may need to make this dynamic)
var cam = view_camera[0];
camera_set_view_target(cam, id);

