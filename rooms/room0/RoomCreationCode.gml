
/*


1. Make a new "level Creation" room
2. Let it save levels
3. let playable room load a level from file



*/
  
  
  
//Set Constants
//Seeds that work:
// 4x4 - 3
// 4x4 - 4
// 4x4 - 5


//File Loading stuff
var fileName = global.level;

if file_exists(fileName)
    {
		
		theJsonFile = file_text_open_read(fileName);
		theData = "";
		while (!file_text_eof(theJsonFile))
		{
			theData += file_text_read_string(theJsonFile);
			file_text_readln(theJsonFile);
		}
		file_text_close(theJsonFile);

		show_debug_message(theData);
    }else {
		show_debug_message("Unable to load file");
	}
	
theJsonMap = json_decode(theData);
show_debug_message("here's the json map");
show_debug_message(theJsonMap);
theList = ds_map_find_value(theJsonMap, "map");

jsPlayerStart = ds_map_find_value(theList, "start");
jsPlayerEnd = ds_map_find_value(theList, "exit");

mapGrid = ds_map_find_value(theList, "stuff");

messages = ds_map_find_value(theJsonMap, "message");



index = 0;
show_debug_message("Printing Map");
while(index++ < 16) {
	show_debug_message(mapGrid[|index]);
}

//game_end();

random_set_seed(6);



buildingsWide = ds_map_find_value(theList, "wide");
buildingsTall = ds_map_find_value(theList, "high");;

roadWidthpx = 48;
buildingSizepx = 64;
offsetpx = 100;
mapexit = [jsPlayerEnd[|0 ],jsPlayerEnd[|1 ]];
playerStart = [jsPlayerStart[|0 ],jsPlayerStart[|1 ]];

global.lockControls = false; 



spriteMap = [
	["yellow", spr_yellow],
	["red", spr_red],
	["orange", spr_orange],
	["green", spr_green],
	["violet", spr_violet],
	["brown", spr_brown],
	["blue", spr_blue]
	];
	
spriteMap2 = ds_map_create();
spriteMap2[? "yellow"] = spr_yellow;
spriteMap2[? "red"] = spr_red;
spriteMap2[? "orange"] = spr_orange;
spriteMap2[? "green"] = spr_green;
spriteMap2[? "violet"] = spr_violet;
spriteMap2[? "brown"] = spr_brown;
spriteMap2[? "white"] = spr_white;
spriteMap2[? "blue"] = spr_blue;


usedColoursMap = ds_map_create();

rules = [];


var size = ds_map_size(spriteMap2) ;
var key = ds_map_find_first(spriteMap2);
for (var i = 0; i < size; i++;) {
	
	sprite = spriteMap2[? key];
	
	rules[i] = [key, "none"];
	
   
    key = ds_map_find_next(usedColoursMap, key);
}




	
spriteColorCount = 8;

buildingGrid = [];


// Create Arena
var buildingsPlaced = 0;
for (i = 0; i < buildingsWide; i++) {
	for (j = 0; j < buildingsTall; j++) {
		
		//figure out building details
		var buildingX = offsetpx + roadWidthpx +  (i * (buildingSizepx + roadWidthpx));
		var buildingY = offsetpx + roadWidthpx +  (j * (buildingSizepx + roadWidthpx));
		
		
		//place it
		buildingIndex = instance_create_layer(buildingX, buildingY, "Instances", obj_red_building);	
		buildingIndex.sprite_index = spriteMap2[? mapGrid[|buildingsPlaced]];
		buildingGrid[i,j] = [mapGrid[|buildingsPlaced], spriteMap2[? mapGrid[|buildingsPlaced]]];
		
		// add it to the list of colours on this map
		if !ds_map_exists(usedColoursMap, mapGrid[|buildingsPlaced]) {
			ds_map_add(usedColoursMap, mapGrid[|buildingsPlaced], spriteMap2[? mapGrid[|buildingsPlaced]]);
		}
		
		
		buildingsPlaced++;
		
		var painted = 0;
		//Place a road to the right of the building, if this isn't the last column. 
		if (i < (buildingsWide - 1)) {
			var roadX = buildingX + buildingSizepx;
			var roadY = buildingY;
			roadIndex = instance_create_layer(roadX, roadY, "Instances", obj_road);
			roadIndex.sprite_index = spr_road_vertical;
			painted = painted  + 1;
		}
		
		if (j < (buildingsTall - 1)) {
			var roadX = buildingX;
			var roadY = buildingY + buildingSizepx;
			roadIndex = instance_create_layer(roadX, roadY, "Instances", obj_road);
			roadIndex.sprite_index = spr_road_horizontal;
			painted = painted  + 1;
		}
		
		if (painted == 2) {
			var roadX = buildingX + buildingSizepx;
			var roadY = buildingY + buildingSizepx;
			roadIndex = instance_create_layer(roadX, roadY, "Instances", obj_road);
			roadIndex.sprite_index = spr_road_intersection;
		}
		
	}
}




// Set up control box
var controlBoxX = 
	offsetpx + 
	(
		(
			(
				buildingsWide * buildingSizepx
			)  
			+ 
			(
				(buildingsWide - 1) * roadWidthpx
			)
		) 
		/ 2
	) 
	- 160;
var controlBoxY = offsetpx * 1.5 + (buildingsTall * (buildingSizepx + roadWidthpx));

controlBox = instance_create_layer(controlBoxX, controlBoxY, "INSTANCES", obj_control_bar);

//place control buttons
bx = controlBoxX + 10;
by = controlBoxY + 10;
controlButtons = [];


var size = ds_map_size(usedColoursMap) ;
var key = ds_map_find_first(usedColoursMap);
for (var i = 0; i < size; i++;) {
	
	sprite = usedColoursMap[? key];
	
	button = instance_create_layer(bx, by, "GUI", obj_control_building);
	button.sprite_index = sprite;
	button.myColor = key;
	button.image_xscale = 0.5;
	button.image_yscale = 0.5;
	bx += 32 + 10;
	controlButtons[i] = [key, sprite, button];
	   
   
    key = ds_map_find_next(usedColoursMap, key);
}





//Store what's in each box

//Store intersection points? 
intersections = [];
cross = instance_create_layer(offsetpx, offsetpx, "GUI", obj_crosshair);

for (i = 0; i < (buildingsWide + 1); i++) {
	for (j = 0; j < (buildingsTall + 1); j++) {	
		
		//First point 
		var intersectionX = offsetpx + (i * (buildingSizepx + roadWidthpx)) + (roadWidthpx / 2);
		var intersectionY = offsetpx + (j * (buildingSizepx + roadWidthpx)) + (roadWidthpx / 2);
		cross = instance_create_layer(intersectionX, intersectionY, "GUI", obj_crosshair);
		intersections[i, j] = [intersectionX, intersectionY];
	}
}

//Place Exit
var exitPoint = intersections[mapexit[0], mapexit[1]];



exitObj = instance_create_layer(exitPoint[0], exitPoint[1], "GUI", obj_exit);

//Move Player
var u = intersections[playerStart[0], playerStart[1]];

playerX = u[0];
playerY = u[1];

obj_player.x = playerX;
obj_player.y = playerY;
obj_player.mapexit = mapexit;
obj_player.controlButtons = controlButtons;
obj_player.buildingsTall = buildingsTall;
obj_player.buildingsWide = buildingsWide;
obj_player.intersections = intersections;
obj_player.playerStart = playerStart;
obj_player.destinationX = playerStart[0];
obj_player.destinationY = playerStart[1];



//Figure out how we'll know what things to look at as we go from a to b


//create go button
go_button = instance_create_layer(864, 640, "GUI", obj_run);
go_button.intersections = intersections; 
go_button.buildingGrid = buildingGrid;
go_button.rules = rules;
go_button.controlButtons = controlButtons;

reset_button = instance_create_layer(864, 700, "GUI", obj_reset);



global.playerMessage = ds_map_find_value(messages, "start");
show_debug_message("pre-aloha");
message = instance_create_layer(10, 10, "GUI", obj_message);

