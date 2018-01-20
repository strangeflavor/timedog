#define do_state
if state_scripts[argument0] > -1 script_execute(state_scripts[argument0]);
current_state_age += 1;

#define _state_APPROACH
y+=yVel;
if y > ydest {
    if yVel > 0.1 {
        yVel *= .9;
    }
}

#define _state_BACKANDFORTH_HORI
if (x < x1 and xVel < 0) or (x > x2 and xVel > 0) {
    xVel *= -1;
    slowdown = .2;
}
if slowdown < 1 slowdown += .025;
x += xVel*slowdown