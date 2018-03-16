#define setup_state_paths
use_state_path = true;

for (var i=0; i<128; i+=1) {
    state_path[i] = -1;
    attack_state_path[i] = -1;
    state_path_duration[i] = -1;
}

state_path_position = 0;
state_path_loop_position = 0;
state_path_loops = 0;
state_path_size = 0;

state_entered = false;
current_state_age = 0; // how long we've been in this state
current_state_duration = -1; // how long we will spend in the state total

attack_state_path_position = 0;
attack_state_path_size = 0;
attack_state_entered = false;

state_scripts[_WAIT] = -1;
state_scripts[_APPROACH] = _state_APPROACH;
state_scripts[_BACKANDFORTH_HORI] = _state_BACKANDFORTH_HORI;
state_scripts[_SPIRAL] = -1; //_state_BACKANDFORTH_HORI;
state_scripts[_CIRCLE] = -1; //_state_BACKANDFORTH_HORI;

#define add_state_path
state_path[state_path_size] = argument0;
state_path_duration[state_path_size] = argument1;
state_path_size += 1;

#define add_attack_state_path
attack_state_path[attack_state_path_size] = argument0;
attack_state_path_duration[attack_state_path_size] = argument1;
attack_state_path_size += 1;

#define start_state_paths
if state_path_size > 0 {
    state_path_position = 0;
    enter_state_path();
} else {
    state_path_position = -1;
}

if attack_state_path_size > 0 {
    attack_state_path_position = 0;
} else {
    attack_state_path_position = -1;
}

#define enter_state_path
state = state_path[state_path_position];
current_state_age = 0;
current_state_duration = state_path_duration[state_path_position];
state_entered = false;

#define update_state_path
if state_path_position > -1 {
    if current_state_duration > 0 {
        current_state_duration -= 1;
    } else {
        // update position for next state
        state_path_position += 1;

        // loop back to first position if this is the end
        if state_path_position >= state_path_size {
            state_path_position = state_path_loop_position;
            state_path_loops += 1;
        }

        // actually enter the new state
        enter_state_path();
    }
}

#define update_attack_state_path
if attack_state_path_position > -1 {
    if attack_state_path_duration[attack_state_path_position] > 0 {
        attack_state_path_duration[attack_state_path_position] -= 1;
    } else {
        // update position for next state
        attack_state_entered = false;
        attack_state_path_position += 1;

        // loop back to first position if this is the end
        if attack_state_path_position >= attack_state_path_size {
            attack_state_path_position = 0;
        }
    }
}
#define state_get_name
var stateNames;
stateNames[_NONE] = 'NONE';
stateNames[_WAIT] = 'WAIT';
stateNames[_MOVEHORI] = 'MOVEHORI';
stateNames[_MOVEVERT] = 'MOVEVERT';
stateNames[_APPROACH] = 'APPROACH';
stateNames[_BACKANDFORTH_HORI] = 'BACKANDFORTH_HORI';
stateNames[_SPIRAL] = 'SPIRAL';
stateNames[_ATK_BEAMS] = '_ATK_BEAMS';
stateNames[_CIRCLE] = '_CIRCLE';

return stateNames[argument0];
