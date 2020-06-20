/// @description Insert description here
// You can write your code in this editor

show_debug_message("Clicked, Let's Run");

curX = obj_player.x;
curY = obj_player.y;

posX = obj_player.destinationX;
posY = obj_player.destinationY;




show_debug_message("Current X & Y: " + string(curX) + string(curY));

//Iniital Setup
show_debug_message("Clicked");
show_debug_message(clickCount);



if (global.lockControls == false) {
	global.lockControls = true;
	show_debug_message("Direction Setup");
	show_debug_message(controlButtons);
	var buttonCount = array_length_1d(controlButtons);
	
	var cbx = obj_control_bar.x;
	var cby = obj_control_bar.y; 
	
	lockIcon = instance_create_layer(cbx - 32, cby, "GUI_TOP", obj_locked);
	
	for(i=0; i < buttonCount; i++) {
		var curButton = controlButtons[i];
		var buttonObj = curButton[2];
		show_debug_message(buttonObj.myColor);
		show_debug_message(buttonObj.arrow_current_state);
		if (buttonObj.arrow_current_state == 90) {
			var dirCount = array_length_1d(directions);
			directions[dirCount] = [buttonObj.myColor, "left"];
		}else if (buttonObj.arrow_current_state == -90) { 
			var dirCount = array_length_1d(directions);
			directions[dirCount] = [buttonObj.myColor, "right"];
		}
		
	}
	show_debug_message(directions);
	obj_player.directions = directions;

} else {
	show_debug_message("Clicked");
	show_debug_message(clickCount);
}

show_debug_message("End Setup");

//If X changes - look up and down.
// Moving Right - int + 0,0 & int + 0,1
// Moving left  - int + 1,0 & int + 1,1

//If Y changes - look left and Y

// Moving Down? int + 0,0 & int + 1,0
// Moving UP? int + 0,1 & int + 1,1

if (obj_player.turnDirection != "") {
	switch (obj_player.moveDirection) {
		case "down":
			if (obj_player.turnDirection == "right") {
				obj_player.moveDirection = "left";
			}else {
				obj_player.moveDirection = "right";
			}
			break;
		case "right":
			if (obj_player.turnDirection == "right") {
				obj_player.moveDirection = "down";
			}else {
				obj_player.moveDirection = "up";
			}
			break;
		case "up":
			if (obj_player.turnDirection == "right") {
				obj_player.moveDirection = "right";
			}else {
				obj_player.moveDirection = "left";
			}
			break;
		case "left":
			if (obj_player.turnDirection == "right") {
				obj_player.moveDirection = "up";
			}else {
				obj_player.moveDirection = "down";
			}
			break;
	}
	obj_player.turnDirection = "";
}



switch (obj_player.moveDirection) {
	case "down":
		posY += 1;
		break;
	case "right":
		posX +=1;
		break;
	case "up":
		posY -= 1;
		break;
	case "left":
		posX -= 1;
		break;
}




a = intersections[posX,posY];
show_debug_message(a[0]);

obj_player.desiredX = a[0];
obj_player.desiredY = a[1];
obj_player.destinationX = posX;
obj_player.destinationY = posY;
obj_player.shouldMove = true;

obj_player.intersections = intersections; 
obj_player.buildingGrid = buildingGrid;
obj_player.rules = rules;

//script0(0,1,2);


clickCount +=1;
