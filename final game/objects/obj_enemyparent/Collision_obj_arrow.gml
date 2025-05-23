hit_count += 1;
instance_destroy(other); // destroy the arrow

if (hit_count == 1) {
    instance_change(obj_enemy2, true); // change to next form
} else if (hit_count == 2) {
    instance_change(obj_enemy3, true); // final form
} else {
    instance_destroy(); // optional: kill the enemy
}