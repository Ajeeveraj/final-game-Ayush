// In the Key Down Left event of obj_playerwithbow
if (!moving_right) {
    moving_left = true;
    instance_change(obj_playerwithbow, true); // Change object to obj_playerwithbowleft
    sprite_index = spr_playerwithbow; // If you want to change the sprite
}

