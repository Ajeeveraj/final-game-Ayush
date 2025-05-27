if (current_health <= 0 && !game_over_triggered) {
    game_over_triggered = true;
    alarm[0] = 30; // Delay before restarting room
}