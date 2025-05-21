// Move the arrow in the direction it's pointing
x += lengthdir_x(speed, direction);  // Move along the X axis
y += lengthdir_y(speed, direction);  // Move along the Y axis

// Optional: Destroy the arrow if it collides with the ground
if (place_meeting(x, y, obj_ground)) {
    instance_destroy();  // Destroy the arrow if it hits the ground
}

image_angle = point_direction(xprevious, yprevious, x, y)
