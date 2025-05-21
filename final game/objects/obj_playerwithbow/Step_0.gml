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
// Check for shooting

<<<<<<< HEAD
<<<<<<< HEAD
if (keyboard_check_pressed(ord("H"))) {
    var arrow = instance_create_layer(x, y, "bow", obj_arrow);
    
   
    
    // Set the arrow's speed
    arrow.speed = 7;
}
if (mouse_check_button_pressed(mb_left)) {
    // Change the current object to obj_playerwithbowleft
    instance_change(obj_playerwithbowleft, true);
}
=======

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

>>>>>>> parent of bd3e06f (finished bow)
=======

  


// Move Left
if (keyboard_check(vk_left)) {
    if (!place_meeting(x - move_speed, y, obj_ground)) {
       
    }
    sprite_index = spr_playerwithbowleft;
    facing = -1;
}
// Move Right
else if (keyboard_check(vk_right)) {
    if (!place_meeting(x + move_speed, y, obj_ground)) {
       
    }
    sprite_index = spr_playerwithbow;
    facing = 1;
}

// Keep camera on player (you may need to make this dynamic)
var cam = view_camera[0];
camera_set_view_target(cam, id);
>>>>>>> 31471aa21ceec465d1c1e0d15a0c4392bd41dbaf
