//  movement varaibles 
move_speed = 3.9;
jump_speed = -13;  //upward jump
climb_speed = 3.5;
gravity_force = 0.5;
max_fall_speed = 5;
move_x = 0; //horizontal movment
move_y = 0;


// state variables  
is_grounded = false;  //on ground?
is_climbing = false;


// Collision with bow
if (place_meeting(x, y, obj_bow)) {
    instance_destroy(); // destroy the current player
    instance_create_layer(x, y, "bow", obj_playerwithbow);
}







