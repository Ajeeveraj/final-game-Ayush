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


// Movement (example basic movement, add your logic here)
x += keyboard_check(vk_right) - keyboard_check(vk_left);
y += keyboard_check(vk_down) - keyboard_check(vk_up);

// BOW PICKUP CHECK
if (place_meeting(x, y, obj_bow)) {
    // Remove bow if it's there
    with (instance_place(x, y, obj_bow)) {
        instance_destroy();
    }

    // Transform to bow player
   // Create new player with bow
instance_create_layer(x, y, "Instances", obj_playerwithbow);

// Set camera to follow new player
var cam = view_camera[0];
camera_set_view_target(cam, obj_playerwithbow);

// Destroy old player
instance_destroy();
}







