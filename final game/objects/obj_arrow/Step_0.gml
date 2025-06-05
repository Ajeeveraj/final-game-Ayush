 if (sprite_index == spr_playerwithbowleft) {
    var arrow_x = x + 9;   // Always spawn the arrow at 9, 35 relative to the player
    var arrow_y = y + 35;  // Always spawn the arrow at 9, 35 relative to the player

    if (sprite_index == spr_playerwithbowleft) {
        // If the player is facing left
        var arrow = instance_create_layer(arrow_x, arrow_y, "Bow", obj_arrow);
        arrow.direction = 180;  // Arrow faces left (180 degrees)
        arrow_speed = 7;        // Adjust speed as needed
    }
    else if (sprite_index == spr_playerwithbow) {
        // If the player is facing right
        var arrow = instance_create_layer(arrow_x, arrow_y, "Bow", obj_arrow);
        arrow.direction = 0;    // Arrow faces right (0 degrees)
        arrow_speed = 7;        // Adjust speed as needed
    }
}