/// @function shouldTurn(destinationX, destinationX, moveDirection, buildingGrid, rules)
/// @description Determine if the player should turn upon reaching an interseciton
/// @param {int} intersectionX The X value for the player's current position
/// @param {int} intersectionY The Y value for the player's current position
/// @param {string} moveDirection The direction the player travlled to get here
function shouldTurn(argument0, argument1, argument2, argument3, argument4) {

	var c = argument2;
	var d = argument3;
	var e = argument4;


	show_debug_message("The player is at " + string(destinationX) + ", " + string(destinationY) + "");
	show_debug_message("The player is at " + string(argument0) + ", " + string(argument1) + "");
	show_debug_message(directions);
	switch (moveDirection) {
		case "up":
			show_debug_message("Player moved up to get here");
			show_debug_message(moveDirection);
			// Moving Down? x, y || x+1, y
			var firstPassed = buildingGrid[destinationX -1, destinationY -1];
			var secondPassed = buildingGrid[destinationX, destinationY-1];
		
			show_debug_message("Player approached a " + firstPassed[0] + " building");
			show_debug_message("Player approached a " + secondPassed[0] + " building");
		break;
		case "down": 
			show_debug_message("Player moved down to get here");
			show_debug_message(moveDirection);
			// Moving Down? x, y+1 || x+1, Y+1
			var firstPassed = buildingGrid[destinationX -1, destinationY];
			var secondPassed = buildingGrid[destinationX, destinationY];
		
			show_debug_message("Player approached a " + firstPassed[0] + " building");
			show_debug_message("Player approached a " + secondPassed[0] + " building");
		break;
		case "right":
			show_debug_message("Player moved right to get here");
			show_debug_message(moveDirection);
		
		
			// Moving Right - x+1, y || x+1, y+1
			var firstPassed = buildingGrid[destinationX, destinationY -1];
			var secondPassed = buildingGrid[destinationX, destinationY];
		
			show_debug_message("Player approached a " + firstPassed[0] + " building");
			show_debug_message("Player approached a " + secondPassed[0] + " building");
		
		break;
		case "left":
			show_debug_message("Player moved left to get here");
			// Moving left  - x,y || x, y+1
			var firstPassed = buildingGrid[destinationX -1, destinationY -1];
			var secondPassed = buildingGrid[destinationX -1, destinationY];
		
			show_debug_message("Player approached a " + firstPassed[0] + " building");
			show_debug_message("Player approached a " + secondPassed[0] + " building");
		break;

	}



	var directionCount = array_length_1d(directions);
	show_debug_message("There's som Directions here maybe");

	var plannedDirection = "";
	var thisRound = "";


	for (i = 0; i < directionCount; i++) {
		var d = directions[i];
		show_debug_message(d);
		show_debug_message(d[0]);
		thisRound = "";

		if (firstPassed[0] == d[0]) {
			show_debug_message("Thanks to " + firstPassed[0] + " building, we should execute a " + d[1] + " turn");
			thisRound = d[1];
		}
	
		if (secondPassed[0] == d[0]) {
			show_debug_message("Thanks to " + secondPassed[0] + " building, we should execute a " + d[1] + " turn");
			thisRound = d[1];
		}
		if (thisRound != "") {
			if (plannedDirection == thisRound && plannedDirection != "") {
				show_debug_message("Aligned Rules, Following");	
				return plannedDirection;
			}
			if (plannedDirection != thisRound && plannedDirection != "") {
				show_debug_message("Contradictory Rules, going straight");	
				return "";
			}
			plannedDirection = thisRound;
		}else {
			show_debug_message("No rules for " + firstPassed[0] + " or " + secondPassed[0]);
		}
	
	}
	return plannedDirection;



}
