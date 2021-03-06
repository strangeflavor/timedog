#define phaseCreateVars
currentPhase = 0;
currentPhaseAge = 0;
currentPhaseDelay = 0;

for (var i=0;i<16;i+=1) {
    phaseDelay[i] = 0; // amount of time to delay before running the current phase
    phase[i] = -1; // script to execute for this phase. enemies start in phase 0.
    phaseCondition[i] = -1; // condition to advance beyond this phase

    // NB, phase scripts only use 6 arguments at the moment
    for (var j=0;j<6;j+=1) {
        phaseArguments[i,j] = -1; // passed to the script in phase[i], if any
        phaseConditionArguments[i,j] = -1; // condition to advance beyond this phase
    }
}

#define formationTransferPhaseVars
///formationTransferPhaseVars()

var eID = argument0;

eID.currentPhase = 0;
for (var i=0;i<16;i+=1) {
    eID.phase[i] = phase[i]; // script to execute for this phase. enemies start in phase 0.
    eID.phaseDelay[i] = phaseDelay[i];
    eID.phaseCondition[i] = phaseCondition[i]; // condition to advance beyond this phase

    for (var j=0;j<6;j+=1) {
        // NB, phase scripts only use 6 arguments at the moment
        eID.phaseArguments[i,j] = phaseArguments[i,j]; // passed to the script in phase[i], if any
        eID.phaseConditionArguments[i,j] = phaseConditionArguments[i,j]; // condition to advance beyond this phase
    }
}

eID.currentPhaseDelay = eID.phaseDelay[0];

#define checkPhaseCondition
var met_condition = false;
var _arg0 = phaseConditionArguments[currentPhase,0];
var _arg1 = phaseConditionArguments[currentPhase,1];
var _arg2 = phaseConditionArguments[currentPhase,2];

switch phaseCondition[currentPhase] {
    case _PHASE_CONDITION_X:
    break;
    case _PHASE_CONDITION_Y:
        var yStop = phaseConditionArguments[currentPhase,0];
        var exceededYStop = false;

        if sign(yStop) == 1 {
            if y >= yStop exceededYStop = true;
        } else {
            if y <= yStop exceededYStop = true;
        }
        
        if exceededYStop {
            y = yStop;
            timeline_running = false;
            path_end();
            met_condition = true;
        }
    break;
    case _PHASE_CONDITION_XY:
        var _dist = point_distance(x,y,_arg0,_arg1);
        var _spd = bezierSpeed;
        if _dist < 36 _spd = 9;

        move_towards_point(_arg0,_arg1,_spd)

        if _dist < 9 {
            x = _arg0;
            y = _arg1;

            met_condition = true;
        }
    break;
    case _PHASE_CONDITION_TIME:
        if currentPhaseAge > phaseConditionArguments[currentPhase,0] and phaseConditionArguments[currentPhase,0] > -1 {
            met_condition = true;
        }
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
        script_execute(phase[phase_index],phaseArguments[phase_index,0],phaseArguments[phase_index,1],phaseArguments[phase_index,2],phaseArguments[phase_index,3],phaseArguments[phase_index,4],phaseArguments[phase_index,5]);
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

// loop
if phase[currentPhase] == -999 {
    currentPhase = 0;
    currentPhaseDelay = phaseDelay[currentPhase];
}
#define run_script_on_chain
///run_script_on_chain
var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

if chainID.ran_script_on_chain[currentPhase] == false {
    chainID.ran_script_on_chain[currentPhase] = true;
    
    if arg[2] == -999 arg[2] = x+24;
    if arg[3] == -999 arg[3] = y-8;

    script_execute(arg[0],arg[1],arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9]);
}