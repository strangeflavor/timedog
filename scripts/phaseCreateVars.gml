#define phaseCreateVars
currentPhase = 0;
currentPhaseAge = 0;
currentPhaseDelay = 0;

for (var i=0;i<8;i+=1) {
    phaseDelay[i] = 0; // amount of time to delay before running the current phase
    phase[i] = -1; // script to execute for this phase. enemies start in phase 0.
    phaseCondition[i] = -1; // condition to advance beyond this phase

    // NB, phase scripts only use 4 arguments at the moment
    for (var j=0;j<4;j+=1) {
        phaseArguments[i,j] = -1; // passed to the script in phase[i], if any
        phaseConditionArguments[i,j] = -1; // condition to advance beyond this phase
    }
}

#define formationTransferPhaseVars
///formationTransferPhaseVars()

var eID = argument0;

eID.currentPhase = 0;
for (var i=0;i<8;i+=1) {
    eID.phase[i] = phase[i]; // script to execute for this phase. enemies start in phase 0.
    eID.phaseDelay[i] = phaseDelay[i];
    eID.phaseCondition[i] = phaseCondition[i]; // condition to advance beyond this phase

    for (var j=0;j<4;j+=1) {
        // NB, phase scripts only use 4 arguments at the moment
        eID.phaseArguments[i,j] = phaseArguments[i,j]; // passed to the script in phase[i], if any
        eID.phaseConditionArguments[i,j] = phaseConditionArguments[i,j]; // condition to advance beyond this phase
    }
}

eID.currentPhaseDelay = eID.phaseDelay[0];

#define checkPhaseCondition
var met_condition = false;
switch phaseCondition[currentPhase] {
    case _PHASE_CONDITION_X:
    break;
    case _PHASE_CONDITION_Y:
        var yStop = phaseConditionArguments[currentPhase,0];
        if y > yStop {
            y = yStop;
            timeline_running = false;
            path_end();
            met_condition = true;
        }
    break;
    case _PHASE_CONDITION_TIME:
        if currentPhaseAge > phaseConditionArguments[currentPhase,0] met_condition = true;
    break;
    case _PHASE_CONDITION_HP:
    break;
}

if met_condition advancePhase();

#define enemy_RunPhase
///enemy_RunPhase(phase_index);
// NB, phase scripts only use 4 arguments at the moment
var phase_index = argument0;
currentPhaseAge += 1;

if currentPhaseDelay >= 0 {
    currentPhaseDelay -= 1;
} else {
    if phase[phase_index] > -1 {
        script_execute(phase[phase_index],phaseArguments[phase_index,0],phaseArguments[phase_index,1],phaseArguments[phase_index,2],phaseArguments[phase_index,3]);
    }

    if currentPhase < 9 and phaseCondition[phase_index] > -1 {
        checkPhaseCondition();
    }
}

#define advancePhase
///advancePhase()
currentPhase += 1;
currentPhaseDelay = phaseDelay[currentPhase];
currentPhaseAge = 0;