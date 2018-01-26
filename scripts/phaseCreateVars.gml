#define phaseCreateVars
currentPhase = 0;
for (var i=0;i<8;i+=1) {
    phase[i] = -1; // script to execute for this phase. enemies start in phase 0.
    phaseCondition[i] = -1; // condition to advance beyond this phase
}

#define formationTransferPhaseVars
var eID = argument0;

eID.currentPhase = 0;
for (var i=0;i<8;i+=1) {
    eID.phase[i] = phase[i]; // script to execute for this phase. enemies start in phase 0.
    eID.phaseCondition[i] = phaseCondition[i]; // condition to advance beyond this phase
}

#define checkPhaseCondition
trace(phaseCondition[currentPhase]);
switch phaseCondition[currentPhase] {
    case _PHASE_CONDITION_Y:
        if y > yStop show('ok');
        trace('checkin y')
    break;
    case _PHASE_CONDITION_TIME:
    break;
    case _PHASE_CONDITION_HP:
    break;
}

#define enemy_flyAway
//enemy_flyAway

if x < room_width/2 direction = 180 else direction = 0;
speed = 8;
