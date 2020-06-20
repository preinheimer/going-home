/// @description Insert description here
// You can write your code in this editor

if (global.lockControls == false) {
	

	show_debug_message(myColor);
	show_debug_message(arrow_object);
	show_debug_message(arrow_current_state);

	if (arrow_object == noone) {
	
		arrow_object = instance_create_layer(x + 16,y + 16,"GUI_TOP", obj_control_image);

		show_debug_message("Clicked: " + string(arrow_object));
		show_debug_message(x);
		show_debug_message(y);
		arrow_object.image_angle += 90;
		arrow_current_state = 90;
	}else if (arrow_object != noone && arrow_current_state == 90) {
		arrow_object.image_angle = -90;
		arrow_current_state = -90;
	}else if (arrow_object != noone && arrow_current_state == -90) {
		instance_destroy(arrow_object);
		arrow_object = noone;
		arrow_current_state = -4;
	}
} else {
	show_debug_message("Clicked, but locked");
}