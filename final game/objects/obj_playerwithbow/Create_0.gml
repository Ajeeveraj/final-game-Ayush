//  movement varaibles 
move_speed = 4.9;
jump_speed = -15;  //upward jump
climb_speed = 3.5;
gravity_force = 0.7;
max_fall_speed = 5;
move_x = 0; //horizontal movment
move_y = 0;
move_x *= move_speed;  // Scale by movement speed

// state variables  
is_grounded = false;  //on ground?
is_climbing = false;

if (keyboard_check_pressed(vk_left)) {
    // Change the current object to obj_playerwithbowleft when the left arrow key is pressed
    instance_change(obj_playerwithbowleft, true);
}
facing = 1; // 1 = right, -1 = left