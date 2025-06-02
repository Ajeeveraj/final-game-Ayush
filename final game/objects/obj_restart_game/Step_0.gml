// Assuming viewport 0
var cam = view_camera[0];

// Camera position
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

// Camera size
var cam_w = camera_get_view_width(cam);

// Padding from the edge (adjust as needed)
var padding = 10;

// Set object's position at top right corner of viewport
x = cam_x + cam_w - padding - sprite_width;  // Right edge minus padding and sprite width
y = cam_y + padding;                          // Top edge plus padding