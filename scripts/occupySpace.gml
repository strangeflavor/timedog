#define occupySpace
///occupySpace(slot,duration)
// sets timers that determine how long a space will be considered occupied
// decremented in unoccupyTimers()

// -1 means we're forcing this space to be occupied until the enemy is destroyed
// (ie, bosses)
if argument1 == -1 {
    if levelManager.occupiedTimer[argument0] == 0 {
        levelManager.occupiedTimer[argument0] = -1;
        return true;
    } else {
        return false;
    }
} else {
    var thresh = 5;
    if levelManager.occupiedTimer[argument0] < thresh {
        levelManager.occupiedTimer[argument0] = argument1;
        return true;
    } else {
        return false;
    }
}

#define unoccupyTimers
///unoccupyTimers();

if occupiedTimer[_LEFTCOLUMN] > 0 occupiedTimer[_LEFTCOLUMN] -= 1;
if occupiedTimer[_RIGHTCOLUMN] > 0 occupiedTimer[_RIGHTCOLUMN] -= 1;
if occupiedTimer[_TOP] > 0 occupiedTimer[_TOP] -= 1;
if occupiedTimer[_CENTER] > 0 occupiedTimer[_CENTER] -= 1;

#define formationsOccupy
///formationsOccupy() 

//formationOccupies[fLogisticSpawner] = _CENTER;
//formationOccupies[fMaze] = _CENTER;
#define formationTransferVars
///passFormationVars(enemyID);

var enemyID = argument0;

enemyID.chainID = id;
enemyID.invul = invul;
enemyID.space = space;
enemyID.formationStartX = x;
enemyID.formationStartY = y;

// absolute formation control stuff
myEnemies[enemyCount] = enemyID;
enemyCount += 1;

if formationID > -1 {
    enemyID.formationID = formationID;
    addEnemyToFormationTracker(formationID);
}

if holdTimelineID > -1 {
    enemyID.holdTimelineID = holdTimelineID;
    addEnemyToFormationTracker(holdTimelineID);
}

#define getFormationID
///getFormationID()
formationTracker.nextFormationID += 1;
if formationTracker.nextFormationID > 127 formationTracker.nextFormationID = 0;
return formationTracker.nextFormationID;

#define addEnemyToFormationTracker
///addEnemyToFormationTracker(formationID)
var fID = argument0;

formationTracker.formationEnemies_Array[fID] += 1;

#define removeEnemyFromFormationTracker
///removeEnemyFromFormationTracker(formationID)

var fID = argument0;
formationTracker.formationEnemies_Array[fID] -= 1;

return formationTracker.formationEnemies_Array[fID];