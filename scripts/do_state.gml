#define do_state
//if state_scripts[argument0] > -1 script_execute(state_scripts[argument0]);
if state_scripts[argument0] > -1 and state_scripts[argument0] > -1 script_execute(state_scripts[argument0]);
current_state_age += 1;

#define _state_APPROACH
// _state_APPROACH
y+=yVel;
if y > ydest {
    if yVel > 0.1 {
        yVel *= .9;
    }
}

#define _state_BACKANDFORTH_HORI
// state_BACKANDFORTH_HORI
if (x < x1 and xVel < 0) or (x > x2 and xVel > 0) {
    xVel *= -1;
    slowdown = .2;
}
if slowdown < 1 slowdown += .025;
x += xVel*slowdown;

#define _state_MOVETOWARD
///state_MOVETOWARD

x = approach(x,x1,xVel);
y = approach(y,y1,xVel/2);
//move_towards_point(x1,y1,xVel);

//slowdown = 1;
//x += xVel*slowdown;
#define _state_MOVECENTER
// _state_MOVECENTER

x = approach(x,vw/2,xVel);
y = approach(y,vh/2,yVel);
