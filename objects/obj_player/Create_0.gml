/// @description Insert description here
// You can write your code in this editor
desiredX = x;
desiredY = y;

destinationX = 0;
destinationY = 0;

buildingsWide = 0;
buildingsTall = 0;


shouldMove = false;
moveDirection = "";

map = noone;
rules = [];

turnDirection = "";
mapexit = [];
controlButtons = "";

intersections = [];
playerStart = [];

sleepFrames = 0;

// sprite seetup
x_frame = 1;
y_frame = 704;
spr_base = spr_female_base_darkelf;
spr_torso = spr_female_torso_green_dress;
spr_hair = spr_female_hair_ponytail_black;
spr_feet = spr_female_feet_maroon;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);
