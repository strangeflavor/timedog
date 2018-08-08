#define manageManagers
///manageManagers()
//called from controller

// world 1: dog star
for (var i=0;i<100;i+=1) {
    managerArray[i] = levelManager;
    timelineArray[i] = -1;
}

managerArray[0] = levelMan000;
managerArray[1] = levelMan001;
managerArray[2] = levelManMidBoss_0;
managerArray[3] = levelManProcGen_0;
managerArray[4] = levelManMaze_0;
managerArray[5] = 999; // shop
managerArray[6] = levelMan006;
managerArray[7] = levelMan007;
managerArray[8] = levelMan008;
managerArray[9] = -9;
    timelineArray[9] = tLvl9;
managerArray[10] = levelMan010;

managerArray[12] = levelMan012;
managerArray[13] = levelMan013;
managerArray[14] = levelMan014;

// world 2: trash world
for (var i=100;i<200;i+=1) {
    managerArray[i] = levelManager;
    timelineArray[i] = -1;
}

managerArray[100] = trashLevel000;

// world 3: underwater
for (var i=200;i<300;i+=1) {
    managerArray[i] = levelManager;
    timelineArray[i] = -1;
}

managerArray[200] = ocean000;
managerArray[201] = ocean001;
managerArray[211] = oceanMantaBoss0;

// world 4: planet FM/cloud
for (var i=300;i<400;i+=1) {
    managerArray[i] = levelManager;
    timelineArray[i] = -1;
}

managerArray[300] = cloudLevel000;
managerArray[301] = cloudLevel001;

// world 5: skull planet
for (var i=400;i<500;i+=1) {
    managerArray[i] = levelManager;
    timelineArray[i] = -1;
}

managerArray[400] = skullLevel000;
managerArray[415] = skullBoss000;

// world 6: temple
for (var i=500;i<600;i+=1) {
    managerArray[i] = levelManager;
    timelineArray[i] = -1;
}

#define pickWave
///pickWave()
// clear out formationComplete array, this keeps track of when formations are done spawning so we can start to check for the end of wave
for (var i=0;i<32;i+=1) formationComplete[i] = false;

/*
switch irandom(3) {
    case 0:
        instance_create(vw/2,vh/2,fLogisticSpawner);
        if irandom(3) == 1 {
            with instance_create(vw/3,vh/2,fLogisticSpawner) {
                follow = true;
                invert = true;
            }
        }
    break;
    case 1:
        instance_create(vw/2,vh/2,fMaze);
    break;
    case 2:
        instance_create(vw/2,-16,fThexSpitter);
    break;
    case 3:
        instance_create(vw/2,vh/2,fDroneFollowers);
    break;
}
*/

var success = false;
var form = pg_getFormation();
var waveSpawned = false;

newFormationID = getFormationID();

var _formSlot = pg_formationArray[form,0];
var _formOccupyDuration = pg_formationArray[form,1];
var _formScript = pg_formationArray[form,2];

if occupySpace(_formSlot,_formOccupyDuration) {
    script_execute(_formScript,pg_formationArray[form,3],pg_formationArray[form,4],pg_formationArray[form,5],pg_formationArray[form,6],pg_formationArray[form,7]);
    waveSpawned = true;
}

return waveSpawned;

/*
switch form {
    case 0:
        if occupySpace(_LEFTCOLUMN,90) {
            with instance_create(-32,32,fChain) {
                formationID = other.newFormationID;
                enemy = oMiniThex;
                path = pLShape;
                size = 8;
                if irandom(10) _path_scale_delta = .1;
            }
            waveSpawned = true;
        }
    break;
    case 1:
        if occupySpace(_RIGHTCOLUMN,90) {
            with instance_create(room_width-32,32,fChain) {
                formationID = other.newFormationID;
                enemy = oMiniThex;
                path = pLShapeMirror;
                size = 8;
            }
            waveSpawned = true;
        }
    break;
    case 2:
        if occupySpace(_RIGHTCOLUMN,90) {
            with instance_create(room_width-64,32,fChain) {
                formationID = other.newFormationID;
                enemy = oMiniThex;
                path = pSine;
                endaction = path_action_continue;
                size = 5;
            }
            waveSpawned = true;
        }
    break;
    case 3:
    break;
    case 4:
        if occupySpace(_CENTER,120) {
            for (i=0;i<4;i+=2) {
                if instance_exists(oShip) {
                    with instance_create(16+(i*24)+(oShip.x+room_width/2) mod room_width,room_height+64,fChain) {
                        if x > room_width/2 path = pHalfCircleReversed else path = pHalfCircle;
                        path_speed = 12;
                        enemy = oMiniThex;

                        size = 5;
                    }
                }
            }
            waveSpawned = true;
        }
    break;
    case 6:
        if occupySpace(_RIGHTCOLUMN,400) {
            with make(room_width-64,-32,oBeamCannon) {
                path = pCurvedApproach;
                path_speed = 6;
                path_endtime = 45;
                endaction = path_action_stop;
            }
            waveSpawned = true;
        }
    break;
    case 7:
        if occupySpace(_LEFTCOLUMN,400) {
            with make(64,-32,oBeamCannon) {
                path = pCurvedApproachMirror;
                path_speed = 6;
                path_endtime = 45;
                endaction = path_action_stop;
            }
            waveSpawned = true;
        }
    break;
    case 8:
        if occupySpace(_LEFTCOLUMN,400) {
            with make(64,-32,oMultiShot) {
                formationID = other.newFormationID;
                path = pCurvedApproachMirror;
                path_speed = 6;
                path_endtime = 45;
                endaction = path_action_stop;
            }
            waveSpawned = true;
        }
    break;
}

return waveSpawned;
*/

#define endWave
for (var i=0;i<32;i+=1) formationComplete[i] = false;
checkForEndOfWave = false;

#define createLevelManager
///createLevelManager()
// called from startroom() in controller
var managerObject = levelManager;

// if -1, we're starting in debug mode and should go to debug room
if GAMEFLOW_currentLevel == -1 {
    managerObject = levelManDebug;
} else {
    managerObject = controller.managerArray[GAMEFLOW_currentLevel];
}

if managerObject >= 0 {
    trace('making '+string(object_get_name(managerObject)));
    make(managerObject);
} else {
    // if -1, we use a regular level manager and asign a timeline to it automatically
    var lID = make(levelManager);
    lID.winCondition = _WIN_TIMELINE_END;
    lID.winConditionValue = timelineArray[abs(managerObject)];
}

make(formationTracker);