for (var i = 0; i < max_health; i++) {
    var sprite_to_draw = (i < current_health) ? spr_heart : spr_heartempty;
    var heart_x = 160 + i * 320; // space between hearts
    var heart_y = 160;          // fixed vertical position
    draw_sprite(sprite_to_draw, 0, heart_x, heart_y);
}