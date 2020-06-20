/// @description Insert description here
// You can write your code in this editor
show_debug_message("Let's Reset the Map");

/**
Required Actions:
1. Move player to origin

2. Unlock controls
3. Archive past attempt of moves

**/

var intersections = obj_player.intersections;
var playerStart = obj_player.playerStart;


var u = intersections[playerStart[0], playerStart[1]];

var playerX = u[0];
var playerY = u[1];

//Move player to origin
obj_player.x = playerX;
obj_player.y = playerY;

//Set player to new position
obj_player.destinationX = playerStart[0];
obj_player.destinationY = playerStart[1];

//Set player to new position
obj_player.desiredX = playerStart[0];
obj_player.desiredY = playerStart[1];

//Set player's movement direction
obj_player.moveDirection = "down";

// 2 Unlock Controls
global.lockControls = false;
instance_destroy(obj_run.lockIcon);

//3 Archive past attempts :(
