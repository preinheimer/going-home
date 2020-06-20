/// @description Insert description here
// You can write your code in this editor

var anim_length = 9;
var frame_size = 64;
var anim_speed = 12;

var xx = x-x_offset;
var yy = y-y_offset;

if (shouldMove == false) {
	x_frame = 0;
	y_frame = 10;
} else if (obj_player.moveDirection ==  "left") {
	y_frame = 9;
} else if (obj_player.moveDirection == "right") {
	y_frame = 11;
} else if (obj_player.moveDirection == "up") {
	y_frame = 8;
} else if (obj_player.moveDirection == "down") {
	y_frame = 10;
} 
draw_sprite_part(spr_base, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);
draw_sprite_part(spr_hair, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);
draw_sprite_part(spr_torso, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);
draw_sprite_part(spr_feet, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

if (x_frame < anim_length - 1) {
	x_frame += anim_speed/60;
} else {
	x_frame = 0;
}

draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);