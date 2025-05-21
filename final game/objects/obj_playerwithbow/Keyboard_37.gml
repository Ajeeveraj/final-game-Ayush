// In the Key Down Left event of obj_playerwithbow
if (!moving_right) {
    moving_left = true;
    instance_change(obj_playerwithbowleft, true); // Change object to obj_playerwithbowleft
    sprite_index = spr_playerwithbowleft; // If you want to change the sprite
}


