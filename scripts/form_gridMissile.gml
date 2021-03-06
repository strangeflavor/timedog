#define form_gridMissile
///form_gridMissile()
with make(bw/2+100,-80,oGridShip) {
    phase[0] = enemy_move;
    phaseArguments[0,0] = 270; // direction
    phaseArguments[0,1] = 6; // speed
    phaseCondition[0] = _PHASE_CONDITION_Y;
    phaseConditionArguments[0,0] = 96;

    phase[1] = enemy_stop;
    phaseArguments[1,0] = 64; // radius
    phaseArguments[1,1] = -2; // speed
    phaseArguments[1,2] = 1; // xbend
    phaseArguments[1,3] = .5; // ybend
    phaseCondition[1] = _PHASE_CONDITION_TIME;
    phaseConditionArguments[1,0] = 90;

    phase[2] = enemy_move;
    phaseArguments[2,0] = 90; // direction
    phaseArguments[2,1] = 12; // speed
}


#define form_beamCannon
/// form_beamCannon();
trace('starting form beamCannon');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var xoffset = arg[0];
if xoffset == -1 xoffset = 0;

with make(room_width/2+xoffset,-32,oBeamCannon) {
    path = pCurvedApproach;
    path_speed = 6;
    path_endtime = 45;
    endaction = path_action_stop;
}
#define form_fireAtPlayer
///form_fireAtPlayer()
trace('starting form fireAtPlayer');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var xpos = arg[0];
if xpos == -1 {
    if oShip.x > bw/2 xpos = 0 else xpos = bw;
}

var ypos = arg[1];
if ypos == -1 ypos = 0;

make(xpos,ypos,oFireAtPlayer);

#define form_multiShot
/// form_multiShot();
trace('starting form multiShot');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _xoffset = arg[0];
if _xoffset == -1 _xoffset = 0;

with make(bw/2+_xoffset,-32,oMultiShot) {
    //formationID = other.newFormationID;
    path = pCurvedApproachMirror;
    path_speed = 6;
    path_endtime = 45;
    endaction = path_action_stop;
}


#define form_crab
/// form_crab(xoffset);
trace('starting form crab');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _xoffset = arg[0];
if _xoffset == -1 _xoffset = 0;

with make(bw/2+_xoffset,32,oCrab) {
    direction = 270 + irandom(60)-30;
    speed = 5;
}
#define form_laserCrab
/// form_lasercrab(xoffset);
trace('starting form lasercrab');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _xoffset = arg[0];
if _xoffset == -1 _xoffset = 0;

with make(bw/2+_xoffset,32,oLaserCrab) {
    direction = 270 + irandom(60)-30;
    speed = 24;
}

#define form_largeAimer
/// form_largeAimer(xoffset);
trace('starting form_largeAimer');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _xoffset = arg[0];
if _xoffset == -1 _xoffset = 0;

with make(bw/2+_xoffset,-64,oWaiter) {
    changeInto = oMassFireAtPlayer;
    changeAge = other._wait;
}
#define form_circles
/// form_circles(wait,xoffset,ystart,xdest,ydest,moveduration);
trace('starting form circles');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

_wait = arg[0];
if _wait < 1 _wait = 1;

var _xoffset = arg[1];
var _ystart = arg[2];
if _xoffset == -1 _xoffset = choose_norepeat2(0,-bw/3,-bw/6,bw/3,bw/6);

if _ystart == -1 _ystart = -64;

var _xoffsetDest = arg[3];
var _ydest = arg[4];

var _moveduration = arg[5];

if _ydest == -1 _ydest = 120;
if _xoffsetDest == -1 _xoffsetDest = _xoffset;
if _moveduration == -1 _moveduration = 30;

var eID = make(bw/2+_xoffset,_ystart,oCircles);
eID._xoffsetDest = _xoffsetDest;
eID.ydest = _ydest;
eID.moveduration = _moveduration;
eID.active = false;

eID.alarm[11] = _wait;