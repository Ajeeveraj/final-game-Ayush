// Decrease lifetime of the arrow
lifetime -= 1;

// If the arrow's lifetime expires, destroy it
if (lifetime <= 0) {
    instance_destroy();
}
// Decrease lifetime of the arrow
lifetime -= 1;

// If the arrow's lifetime expires, destroy it
if (lifetime <= 0) {
    instance_destroy();
}

// Optional: Check if the arrow hits the player or another object (collision)
if (place_meeting(x, y, obj_player)) {
    // Apply damage or handle collision, then destroy arrow
    instance_destroy();
}