// When the player collides with the bow, change the player's object to obj_playerwithbow
instance_change(obj_playerwithbow, true); // The 'true' argument makes it preserve the player's position, etc.



// Destroy the bow object after collection
instance_destroy();


