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
  if (knockback_speed > 0.1) {
    var kb_x = lengthdir_x(knockback_speed, knockback_dir);
    var kb_y = lengthdir_y(knockback_speed, knockback_dir);
    
    var moved = false;

    // Try to move on X axis if no collision
    if (!place_meeting(x + kb_x, y, obj_ground)) {
        x += kb_x;
        moved = true;
    } else {
        // Stop horizontal knockback component
        kb_x = 0;
    }

    // Try to move on Y axis if no collision
    if (!place_meeting(x, y + kb_y, obj_ground)) {
        y += kb_y;
        moved = true;
    } else {
        // Stop vertical knockback component
        kb_y = 0;
    }

    // Recalculate speed and direction based on remaining components
    knockback_speed = point_distance(0, 0, kb_x, kb_y);
    if (knockback_speed > 0) {
        knockback_dir = point_direction(0, 0, kb_x, kb_y);
    }

    // Decay knockback speed
    knockback_speed *= knockback_decay;

    // If no movement possible, stop knockback
    if (!moved) {
        knockback_speed = 0;
    }
} else {
    knockback_speed = 0;
}





// Keep camera on player (you may need to make this dynamic)
var cam = view_camera[0];
camera_set_view_target(cam, id);
