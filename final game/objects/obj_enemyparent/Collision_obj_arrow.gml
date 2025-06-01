// Play the hit sound
audio_play_sound(snd_hit, 1, false); // <- use false instead of true (true = loop)

// Increment hit count
hit_count += 1;

// Destroy the arrow safely
with (other) {
    instance_destroy();
}


if (hit_count == 1) {
    instance_change(obj_enemy2, true); // change to next form
} else if (hit_count == 2) {
    instance_change(obj_enemy3, true); // final form
} else {
    instance_destroy(); // optional: kill the enemy
}