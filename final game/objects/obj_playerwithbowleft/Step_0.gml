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

if (keyboard_check_pressed(ord("H"))) {
    var arrow = instance_create_layer(x, y, "bow", obj_arrow);
    
   
    
    // Set the arrow's speed
    arrow.speed = 7;
}
if (keyboard_check_pressed(vk_left)) {
    // Change the current object to obj_playerwithbowleft when the left arrow key is pressed
    instance_change(obj_playerwithbowleft, true);
}