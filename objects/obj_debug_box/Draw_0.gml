/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_colour(c_black);
draw_text(obj_debug_box.x, obj_debug_box.y, "X: " + string(obj_player.x));
draw_text(obj_debug_box.x + 100, obj_debug_box.y, "Y: " + string(obj_player.y));

draw_text(obj_debug_box.x, obj_debug_box.y + 50, "Grid X: " + string(obj_player.destinationX));
draw_text(obj_debug_box.x + 100, obj_debug_box.y + 50, "Grid Y: " + string(obj_player.destinationY));

draw_text(obj_debug_box.x, obj_debug_box.y + 100, "dX: " + string(obj_player.desiredX));
draw_text(obj_debug_box.x + 100, obj_debug_box.y + 100, "dY: " + string(obj_player.desiredY));