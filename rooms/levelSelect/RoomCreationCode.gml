show_debug_message("Aloha");


if (variable_global_exists("levelComplete")) {
	
	if (global.levelComplete = "level-1-0.json") {
		global.level = "level-1-1.json";
		room_goto(room0)
	}else {
		show_debug_message("------------------------------------------------");	
		show_debug_message("You're done!");	
		show_debug_message("------------------------------------------------");	
		game_end();
	}
	
	
} else {
	
	global.levelComplete = "";	
	
	global.level = "level-1-0.json";



	spriteMap2 = ds_map_create();
	spriteMap2[? "One"] = "level-1-0.json";
	spriteMap2[? "Two"] = "level-1-1.json";
	spriteMap2[? "Three"] = "level-1-1.json";
	spriteMap2[? "Four"] = "level-1-1.json";
	
	
	room_goto(room0)
	
}
