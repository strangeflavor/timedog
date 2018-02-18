#define pickWave
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
var slot = 8;

switch slot {
    case 0:
        if occupySpace(_LEFTCOLUMN,90) {
            with instance_create(-32,32,fChain) {
                enemy = oMiniThex;
                path = pLShape;
                size = 8;
                if irandom(10) _path_scale_delta = .1;
            }
        }
    break;
    case 1:
        if occupySpace(_RIGHTCOLUMN,90) {
            with instance_create(room_width-32,32,fChain) {
                enemy = oMiniThex;
                path = pLShapeMirror;
                size = 8;
            }
        }
    break;
    case 2:
        if occupySpace(_RIGHTCOLUMN,90) {
            with instance_create(room_width-64,32,fChain) {
                enemy = oMiniThex;
                path = pSine;
                endaction = path_action_continue;
                size = 5;
            }
        }
    break;
    case 3:
        with instance_create(-64,room_height/4,fChain) {
            enemy = oAimAtPlayer;
            size = 5;
        }
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
        }
    break;
    case 5:
        if occupySpace(_TOP,-1) {
            instance_create(room_width/2,-150,oMidBoss);
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
        }
    break;
    case 8:
        if occupySpace(_LEFTCOLUMN,400) {
            with make(64,-32,oMultiShot) {
                path = pCurvedApproachMirror;
                path_speed = 6;
                path_endtime = 45;
                endaction = path_action_stop;
            }
        }
    break;
}

return -1;

#define endWave
instance_create(vw/2,vh/2,waveCompleteSplash);
background_vspeed[0] += 1;
background_vspeed[1] += 1;

for (var i=0;i<32;i+=1) formationComplete[i] = false;
wave = -1;
checkForEndOfWave = false;

#define createLevelManager
var managerObject = managerArray[GAMEFLOW_currentLevel];

make(managerObject);
make(formationTracker);

#define manageManagers
///manageManagers()


// world 1
for (var i=0;i<100;i+=1) {
    managerArray[i] = levelManager;
}

managerArray[0] = levelMan000;
managerArray[1] = levelMan001;

for (var i=100;i<200;i+=1) {
    managerArray[i] = levelManager;
}

for (var i=300;i<400;i+=1) {
    managerArray[i] = levelManager;
}

for (var i=400;i<500;i+=1) {
    managerArray[i] = levelManager;
}

for (var i=500;i<600;i+=1) {
    managerArray[i] = levelManager;
}

for (var i=600;i<700;i+=1) {
    managerArray[i] = levelManager;
}

for (var i=700;i<800;i+=1) {
    managerArray[i] = levelManager;
}

for (var i=800;i<900;i+=1) {
    managerArray[i] = levelManager;
}

for (var i=900;i<1000;i+=1) {
    managerArray[i] = levelManager;
}
