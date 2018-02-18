#define createLevelData
/*globalvar levelDataGrid; 
levelDataGrid = ds_grid_create(10,25);
ds_grid_set_region(levelDataGrid,0,9,0,24,-1);
*/

levelDataMap = ds_map_create();

var n = 0; // 'encoded' level index
var levelMap = -1;

for (var i=0;i<numLevels;i+=1) {
    for (var j=0;j<numWorlds;j+=1) {
        n = j*100 + i;
        levelMap = ds_map_create();
        levelMap[? "name"] = string(i+1);
        levelMap[? "playcount"] = 0;
        if i == 0 and j == 0 levelMap[? "locked"] = false else levelMap[? "locked"] = true;

        levelDataMap[? n] = levelMap;
    }
}

#define getLevelData
///getLevelData(levelID,key)

var levelMap = levelDataMap[? argument0];

return levelMap[? argument1];

#define prepareButton
///prepareButton(buttonID)
var buttonID = argument0;

buttonID.levelName = getLevelData(buttonID.levelID,"name");
buttonID.locked = getLevelData(buttonID.levelID,"locked");
#define unlockAdjacent
var completedLevel = argument0;
var buttonDistance = 80;
var buttonID_left,buttonID_right,buttonID_top,buttonID_bottom;

// right
buttonID_right = collision_point(completedLevel.x+buttonSize+buttonDistance,completedLevel.y+buttonSize/2,oButton,false,true) 
buttonID_left = collision_point(completedLevel.x-buttonDistance,completedLevel.y+buttonSize/2,oButton,false,true) 
buttonID_top = collision_point(completedLevel.x+buttonSize/2,completedLevel.y-buttonSize/2,oButton,false,true) 
buttonID_bottom = collision_point(completedLevel.x+buttonSize/2,completedLevel.y+buttonSize+buttonSize/2,oButton,false,true) 

var unlockTime = 1;

if unlockLevel(buttonID_top,unlockTime) unlockTime += 24;
if unlockLevel(buttonID_left,unlockTime) unlockTime += 24;
if unlockLevel(buttonID_right,unlockTime) unlockTime += 24;
if unlockLevel(buttonID_bottom,unlockTime) unlockTime += 24;
oLevelMenu.alarm[1] = unlockTime + 30;

#define unlockLevel
///unlockLevel(buttonID)
var levelMap;
var lID = argument0;
var unlockTime = argument1;

if lID != noone {
    if lID.locked {
        lID.alarm[0] = unlockTime;
        levelMap = levelDataMap[? lID.levelID];
        levelMap[? "locked"] = false;
        
        return true;
    }
}

return false;