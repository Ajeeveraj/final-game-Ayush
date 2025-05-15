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


// BOW MECHANICS: Check if the player has the bow and can shoot
if (global.hasBow) {
    // Check if the left mouse button is pressed
    if (mouse_check_button_pressed(mb_left)) {
        // Calculate the direction to the cursor
        var cursor_x = mouse_x;
        var cursor_y = mouse_y;
        
        var dir = point_direction(x, y, cursor_x, cursor_y);  // Get the direction from player to the cursor

        // Debugging: Show where the arrow will spawn
        //draw_line(x, y, cursor_x, cursor_y);  // Optional: Remove this after debugging
        
        // Calculate the spawn position (slightly in front of the player)
        var spawn_offset = 0;  // Adjust this to be the correct distance from the player
        var spawn_x = x + lengthdir_x(spawn_offset, dir);  // Spawn X position in front of the player
        var spawn_y = y + lengthdir_y(spawn_offset, dir);  // Spawn Y position in front of the player

        // Create the arrow at the spawn position
        var arrow = instance_create_layer(spawn_x, spawn_y, "bow", obj_arrow);  // Create an arrow at the player's position
        
        // Set the arrow's direction and speed
        arrow.direction = dir;
        arrow.speed = arrow_speed;  // Make sure this is defined in obj_arrow
    }
}

