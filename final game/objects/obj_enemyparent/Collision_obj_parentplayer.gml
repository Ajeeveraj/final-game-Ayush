// Direction from enemy to player
var angle = point_direction(x, y, other.x, other.y);

// Set knockback
other.knockback_dir = angle;
other.knockback_speed = 30; // Tweak this value for stronger/weaker knockback

// Damage player
if (instance_exists(obj_heart)) {
    obj_heart.current_health -= 1;
}









