#define setup_state_paths
use_state_path = true;
disable_script = false; // allows you to run a state but disable 

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

for (var i=0;i<64;i+=1) state_scripts[i] = -1;
state_scripts[_APPROACH] = _state_APPROACH;
state_scripts[_BACKANDFORTH_HORI] = _state_BACKANDFORTH_HORI;
state_scripts[_MOVETOWARD] = _state_MOVETOWARD;
state_scripts[_MOVECENTER] = _state_MOVECENTER;

#define add_state_path
state_path[state_path_size] = argument0;
state_path_duration[state_path_size] = argument1;

if state_path_size == 0 current_state_duration = state_path_duration[state_path_size];

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
current_state_age = -1;
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
            if state_path_loop_position == -1 {
                state_path_position = state_path_size - 1;
            } else {
                state_path_position = state_path_loop_position;
            }
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
stateNames[_CIRCLE] = 'CIRCLE';
stateNames[_MOVETOWARD] = 'MOVETOWARD';
stateNames[_MOVECENTER] = 'MOVECENTER';
stateNames[_EMPTYSTATE0] = 'EMPTSTATE0';
stateNames[_EMPTYSTATE1] = 'EMPTSTATE1';
stateNames[_EMPTYSTATE2] = 'EMPTSTATE2';
stateNames[_EMPTYSTATE3] = 'EMPTSTATE3';
stateNames[_EMPTYSTATE4] = 'EMPTSTATE4';

if argument0 <= -1 {
    return '-1';
} else {
    return stateNames[argument0];
}

#define do_next_state
///do_next_state()

current_state_duration = -1;
#define change_state
///change_state(state,duration)
// forces a change in enemy state and resets current_state_age
// to re-enter the state path, set state_path_position again

state = argument0;
current_state_age = -1;
state_path_position = -1;
//if argument_count > 1 current_state_duration = argument1 else current_state_duration = -2;