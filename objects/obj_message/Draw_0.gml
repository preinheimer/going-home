/// @description Insert description here
// You can write your code in this editor
draw_self();

var length = global.playerMessage;

ww = window_get_width();
hh = window_get_height();

x = (ww / 2) - sprite_width / 2;
y = (hh / 2) - sprite_height / 2;



image_xscale = 5;
image_yscale = 3;

draw_set_colour(c_black);

draw_text_ext(x + 10, y + 10, global.playerMessage, 13, sprite_width - 20);
show_debug_message("aloha sent");

var okay_x = x + (sprite_width / 2) - 32;
var okay_y = y + (sprite_height) - 32;

obj_okay = instance_create_layer(okay_x, okay_y, "GUI_TOP", obj_message_ok);
obj_okay.parentObject = id;


