max_health = 3;
current_health = max_health;

game_over_triggered = false; // ✅ Define it here

persistent = true;

// Prevent duplicates
if (instance_number(obj_heart) > 1) {
    instance_destroy();
}