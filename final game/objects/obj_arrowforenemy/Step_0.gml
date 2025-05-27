// Step event of obj_arrowforenemy
x += lengthdir_x(speed, direction); // Move in the direction of the arrow
y += lengthdir_y(speed, direction);

// Step event of obj_arrowforenemy (where arrow hits player)
if (collision_rectangle(x - 5, y - 5, x + 5, y + 5, obj_player, false, false)) {
    // Deal damage to the player
    with (obj_player) {
       
        if (health <= 0) {
            // Handle player death
            instance_destroy(); // Destroy the player, or you can add a death animation
        }
    }
    instance_destroy(); // Destroy the arrow after it hits the player
}


// Optional: Destroy the arrow if it goes off-screen (for better performance)
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}