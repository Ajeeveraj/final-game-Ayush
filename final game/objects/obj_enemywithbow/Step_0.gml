// === Gravity ===
vspd += grav;
if (place_meeting(x, y + vspd, obj_ground)) {
    while (!place_meeting(x, y + sign(vspd), obj_ground)) {
        y += sign(vspd);
    }
    vspd = 0;
} else {
    y += vspd;
}

// === Follow Player (using parent)
var target = instance_nearest(x, y, obj_parentplayer);
if (target != noone) {
    if (x < target.x) {
        x += spd;
    } else if (x > target.x) {
        x -= spd;
    }
}
// Update the shoot timer
shootTimer += 1;

// Find the active player instance
var playerInstance = undefined;

// Check for the active player instance (it could be obj_player, obj_playerwithbow, or obj_playerwithbowleft)
if (instance_exists(obj_player)) {
    playerInstance = obj_player;
}
else if (instance_exists(obj_playerwithbow)) {
    playerInstance = obj_playerwithbow;
}
else if (instance_exists(obj_playerwithbowleft)) {
    playerInstance = obj_playerwithbowleft;
}

// If a player instance is found, calculate the distance and shoot
if (playerInstance != undefined) {
    // Get the distance between the enemy and the player
    var distanceToPlayer = point_distance(x, y, playerInstance.x, playerInstance.y);
    
    // Debug: Print distance to the player (for troubleshooting)
    show_debug_message("Distance to player: " + string(distanceToPlayer));
    
    // Check if the player is within 700 pixels and if the enemy can shoot
    if (distanceToPlayer <= 700) { // Fire arrows when the player is 700 pixels or less away
        if (shootTimer >= shootCooldown) { // Only shoot if the cooldown has finished
            // Reset the cooldown timer
            shootTimer = 0;

            // Debug: Confirm shooting action is happening
            show_debug_message("Player within 700px, firing arrow!");

            // Create a new arrow instance (obj_arrowforenemy)
            var arrow = instance_create_layer(x, y, "Instances", obj_arrowforenemy);
            
            // Determine the direction to shoot: left or right based on player's position
            if (playerInstance.x < x) {
                // Player is to the left of the enemy
                arrow.direction = 180; // Shoot to the left
            } else {
                // Player is to the right of the enemy
                arrow.direction = 0;   // Shoot to the right
            }

            // Set the speed of the arrow
            arrow.speed = arrowSpeed;
            
            // Debug: Confirm arrow is created and fired
            show_debug_message("Arrow fired towards: " + string(arrow.direction == 180 ? "left" : "right"));
        } else {
            // Debug: Show cooldown status
            show_debug_message("Cooldown not finished: " + string(shootTimer));
        }
    } else {
        // Debug: Player is out of range
        show_debug_message("Player is out of range, no arrow fired.");
    }
}






