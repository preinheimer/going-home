/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_left)) {
	x = x - 3;
}
if (keyboard_check(vk_right)) {
	x = x + 3;
}
if (keyboard_check(vk_up)) {
	y = y - 3;
}
if (keyboard_check(vk_down)) {
	y = y + 3;
}

if (sleepFrames > 0) {
	sleepFrames--;
	if (sleepFrames == 0) {
		
	}
	
}

//I'm really only good in straight lines
if (shouldMove == true) {
//	show_debug_message("I should move!");



	if (abs(desiredX - x) > 3) {
		desiredXMove = 3; 
	}else {
		desiredXMove = abs(desiredX - x); 
	}
		
	if (desiredX > x) {
		x += desiredXMove;
	}else if (desiredX < x) {
		x -= desiredXMove;
	}
	
	if (abs(desiredY - y) > 3) {
		desiredYMove = 3; 
	}else {
		desiredYMove = abs(desiredY - y); 
	}
	
	if (desiredY > y) {
		y += desiredYMove;
	}else if(desiredY < y) {
		y -= desiredYMove;
	}
	if (desiredX == x && desiredY == y) {
		shouldMove = false;
		
		//User is at the wining location
		if (destinationX == mapexit[0] && destinationY == mapexit[1]) {
			show_debug_message("AT EXIT");
			show_message("YOU WIN");
			global.levelComplete = global.level;
			room_goto(levelSelect);
		//user it is at a non-winning, perimiter location, this is trye if either value is at 0 or max for that dimension
		}else if (destinationX == 0 or destinationX == buildingsWide or destinationY == 0 or destinationY == buildingsTall) {
			show_message("YOU LOSE");
			
		}else {
			var stuff = shouldTurn(destinationX,destinationY,obj_player.moveDirection, buildingGrid, rules);
			show_debug_message("Player now knows to turn " + stuff);
			turnDirection = stuff;
			sleepFrames = 30;
		}
	}
	
}

