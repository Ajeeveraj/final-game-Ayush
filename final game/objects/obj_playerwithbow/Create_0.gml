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


moving_left = false;
moving_right = false;
