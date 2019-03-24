#define form_boxChains0
///form_boxChains0(wait,xoffset,ystop,rate,path_speed,size);
trace('starting form boxchains0');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

_wait = arg[0];
if _wait < 0 _wait = 0;

var xoffset = arg[1];
_ystop = arg[2];
_rate = arg[3];
_path_speed = arg[4];
_size = arg[5];

if xoffset == -1 xoffset = -64 + choose(64,80,128,160,200);
if _ystop == -1 _ystop = vh/2 - choose(90,120,180,240); // choose(180,120,200,300,400);
if _path_speed == -1 _path_speed = choose(24,32,40);
if _rate == -1 _rate = 4;
if _size == -1 _size = 3;

newFormationID = getFormationID();

with make(-32+xoffset,32,fChain) {
    formationID = other.newFormationID;
    invul = true;

    wait = 1+other._wait;
    space = _LEFTCOLUMN;
    size = 3;
    enemy = oMiniThex;
    path = pLShape;
    _path_speed = other._path_speed;
    _path_scale_delta = .3;
    rate = other._rate;

    // fly away before reaching bottom of screen
    phaseCondition[0] = _PHASE_CONDITION_Y;
    phaseConditionArguments[0,0] = other._ystop - 60;

    phaseDelay[1] = 90;
    phase[1] = enemy_flyAway;
    phaseArguments[1,0] = 8;
}

with make(vw-32-(32*_size)+xoffset,-32,fChain) {
    formationID = other.newFormationID;
    invul = true;

    wait = 15+other._wait;
    space = _RIGHTCOLUMN;
    size = 3;
    enemy = oMiniThex;
    path = pLShapeMirror;
    _path_speed = other._path_speed;
    _path_scale_delta = .3;
    rate = other._rate;

    // fly away before reaching bottom of screen
    phaseCondition[0] = _PHASE_CONDITION_Y;
    phaseConditionArguments[0,0] = other._ystop;

    phaseDelay[1] = 60;
    phase[1] = enemy_flyAway;
    phaseArguments[1,0] = 8;
}

#define form_boxChains_Descent
///form_boxChains_Descent(xoffset,ystop,rate,path_speed,size,speed,direction,wait);
trace('starting form boxchains_descent');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var xoffset = arg[0];
_ystop = arg[1];
_rate = arg[2];
_path_speed = arg[3];
_size = arg[4];
_descentSpeed = arg[5];
_direction = arg[6];
_wait = arg[7];

if xoffset == -1 xoffset = choose(1,-1)*choose(0,60,120,180)
if _ystop == -1 _ystop = choose(vh/2,vh/3,vh/4) + nrandom(80);
if _rate == -1 _rate = 8;
if _path_speed == -1 _path_speed = 32;
if _size == -1 _size = 3;
if _wait == -1 _wait = 8;
if _direction == -1 _direction = 270;

newFormationID = getFormationID();

with make(vw/2-150+xoffset-(_size*16),32,fChain) {
    formationID = other.newFormationID;
    wait = other._wait;
    invul = true;

    space = _LEFTCOLUMN;
    size = other._size;
    enemy = oMiniThex;
    path = pLShape;
    _path_speed = other._path_speed;
    _path_scale_delta = .3;
    rate = other._rate;

    // fly away before reaching bottom of screen
    phaseCondition[0] = _PHASE_CONDITION_Y;
    phaseConditionArguments[0,0] = other._ystop - 60;

        advancePhase_AbsoluteTime[0] = 120+other._wait;
    phaseDelay[1] = _PHASE_DELAY_WAIT;
    phase[1] = enemy_move;//_formation;
    phaseArguments[1,0] = other._direction;
    phaseArguments[1,1] = 8;
    phaseArguments[1,2] = 8;
}

//with make(46+vw-(32*_size)+xoffset,-32,fChain) {
with make(vw/2+150+xoffset+(_size*16),32,fChain) {
    formationID = other.newFormationID;
    if other._direction == 270 wait = other._wait else wait = other._wait + 8;
    invul = true;

    space = _RIGHTCOLUMN;
    size = other._size;
    enemy = oMiniThex;
    path = pLShapeMirror;
    _path_speed = other._path_speed;
    _path_scale_delta = .3;
    rate = other._rate;

    // fly away before reaching bottom of screen
    phaseCondition[0] = _PHASE_CONDITION_Y;
    phaseConditionArguments[0,0] = other._ystop;

        advancePhase_AbsoluteTime[0] = 135+other._wait;
    phaseDelay[1] = _PHASE_DELAY_WAIT;
    phase[1] = enemy_move;
    phaseArguments[1,0] = other._direction;
    phaseArguments[1,1] = 8;
    phaseArguments[1,2] = 8;
}

#define form_line
///form_line(xoffset,yoffset,rate,size,direction,speed,attacker,wait)
var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

if _value newFormationID = getFormationID() else newFormationID = -1;

//var xoffset = arg[0];
var side = arg[0];
var yoffset = arg[1];
_rate = arg[2];
_size = arg[3];
_direction = arg[4];
_speed = arg[5];
_attacker = arg[6];
_wait = arg[7];

if yoffset == -1 yoffset = 30;
if _rate == -1 _rate = 6;
if _size == -1 _size = 5;
if _direction == -1 _direction = 330;
if _speed == -1 _speed = 9;
if _wait == -1 _wait = 1;

var xoffset;

if side == 1 { // right
    xoffset = vw + (_size-1) * _rate * _speed;
} else { // left
    if side == -1 {
        xoffset = -(_size-1) * _rate * _speed;
    } else {
        xoffset = vw/2+arg[0];
    }
}

stopTime = _size*6;//16;

with make(xoffset,yoffset,fChain) {
    active = false;
    wait = other._wait;
    formationID = other.newFormationID;

    direction = other._direction;
    speed = other._speed;

    rate = other._rate;
    size = other._size;

    enemy = oMiniThex;
    if other._attacker > -1 attacker[other._attacker] = 50; // fireAge of n enemy

    phaseDelay[0] = _PHASE_DELAY_WAIT;
        advancePhase_AbsoluteTime[0] = rate*size;
    phase[0] = enemy_move;
    phaseArguments[0,0] = other._direction;
    phaseArguments[0,1] = speed;
    phaseCondition[0] = _PHASE_CONDITION_TIME
    phaseConditionArguments[0,0] = _PHASE_DELAY_WAIT;
        advancePhase_AbsoluteTime[1] = other.stopTime;

    phase[1] = enemy_stop;
    phaseCondition[1] = _PHASE_CONDITION_TIME;
    phaseConditionArguments[1,0] = _PHASE_DELAY_WAIT;
    if other._slower advancePhase_AbsoluteTime[2] = 150 else advancePhase_AbsoluteTime[2] = 60;

    phase[2] = enemy_move;
    phaseArguments[2,0] = other._direction;
    phaseArguments[2,1] = -speed;
}

#define form_orbit
///form_orbit(wait,xoffset,yoffset)
var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

_wait = arg[0];
var xoffset = arg[1];
if xoffset == -1 xoffset = choose(1,-1)*irandom(vw/3)//_xoffset = (1+irandom(8)*vw) - vw/8;;

var yoffset = arg[2];
if yoffset == -1 yoffset = choose(12,24,60);
_direction = arg[3];

if _wait == -1 _wait = 6;

if xoffset > 0 {
    _direction = 270 - irandom(45) - 12;
} else {
    _direction = 270 + irandom(45) + 12;
}

newFormationID = getFormationID();

with make(vw/2+xoffset,32+yoffset,fChain) {
    formationID = other.newFormationID;
    enemy = oMiniThex;
    invul = true;
    size = 11;
    wait = 1+other._wait;
    rate = 4;

    phase[0] = enemy_orbit;
    phaseArguments[0,0] = 24; // orbit radius
    phaseArguments[0,1] = 9; // orbit speed

        phaseCondition[0] = _PHASE_CONDITION_TIME
        phaseConditionArguments[0,0] = _PHASE_DELAY_WAIT;
            advancePhase_AbsoluteTime[0] = choose(45,50,50);

    for (i=1;i<12;i+=2) {
        phase[i] = enemy_orbit;
        phaseArguments[i,0] = 24; //120; // orbit radius
        phaseArguments[i,1] = 11-i; // orbit speed
        phaseArguments[i,2] = 1; // xbend
        phaseArguments[i,3] = 1; // ybend
        phaseArguments[i,4] = other._direction; // direction
        if other._direction > 270 other._direction = 270 - irandom(45) - 12 - (i*2) else other._direction = 270 + irandom(45) + 12 + (i*2);
        phaseArguments[i,5] = 10-i; // speed
        phaseArguments[i,6] = 8; // radius delta

            phaseCondition[i] = _PHASE_CONDITION_TIME
            phaseConditionArguments[i,0] = _PHASE_DELAY_WAIT;
                advancePhase_AbsoluteTime[i] = 10+i*10;

        phase[i+1] = enemy_orbit;
        phaseArguments[i+1,0] = 24; // orbit radius
        phaseArguments[i+1,1] = 6; // orbit speed
        phaseArguments[i+1,6] = 120; // radius delta

            phaseCondition[i+1] = _PHASE_CONDITION_TIME
            phaseConditionArguments[i+1,0] = _PHASE_DELAY_WAIT;
                advancePhase_AbsoluteTime[i+1] = 20+i*10;
    }
}

#define form_orbit_expanding
///form_orbit_expanding(wait,xoffset,yoffset,direction,moveDelay)
var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

_wait = arg[0];
if _wait == -1 _wait = 1;

var xoffset = arg[1];
var yoffset = arg[2];
_direction = arg[3];
if _direction == -1 _direction = 270;
var moveDelay = arg[4];
if moveDelay == -1 moveDelay = 120;

//newFormationID = getFormationID();

with make(vw/2+xoffset,32+yoffset,fChain) {
    enemy = oMiniThex;
    invul = true;
    size = 12;
    wait = 1+other._wait;
    rate = 4;
    speedSign = choose(-1,1);

    phase[0] = enemy_orbit;
    phaseArguments[0,0] = 60; // radius
    phaseArguments[0,1] = speedSign*5; // speed
    phaseArguments[0,6] = 1; // radius delta

    phaseCondition[0] = _PHASE_CONDITION_TIME
    phaseConditionArguments[0,0] = _PHASE_DELAY_WAIT;
        advancePhase_AbsoluteTime[0] = moveDelay;

    phase[1] = enemy_orbit;
    phaseArguments[1,0] = 240; // radius
    phaseArguments[1,1] = speedSign*5; // speed
    phaseArguments[1,2] = 1; // xbend
    phaseArguments[1,3] = 1; // ybend
    phaseArguments[1,4] = other._direction; // direction
    phaseArguments[1,5] = 3; // speed
    phaseArguments[1,6] = 1; // radius delta
}
#define form_orbit_doubler
///form_orbit_doubler(wait,xoffset,yoffset)

//if (live_call()) return live_result;

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

_wait = arg[0];

var _enemy_x = arg[1];
var _enemy_y = arg[2];

if _enemy_x == -1 _enemy_x = vw/2 + choose(1,-1)*irandom(vw/4);
if _enemy_y == -1 _enemy_y = choose(40,60);

_direction = arg[3];

if _wait == -1 _wait = 6;

if _enemy_x > vw/2 {
    _direction = 270 - irandom(15) - 6;
} else {
    _direction = 270 + irandom(15) + 6;
}

newFormationID = getFormationID();

with make(_enemy_x,_enemy_y,fChain) {
    formationID = other.newFormationID;
    enemy = oMiniThex;
    invul = true;
    size = 6;
    wait = 1+other._wait;
    rate = 7;

    phase[0] = enemy_orbit;
    phaseArguments[0,0] = 24; // orbit radius
    phaseArguments[0,1] = 9; // orbit speed

        phaseCondition[0] = _PHASE_CONDITION_TIME
        phaseConditionArguments[0,0] = _PHASE_DELAY_WAIT;
            advancePhase_AbsoluteTime[0] = 50;

    for (i=1;i<12;i+=4) {
        // descend
        phase[i] = enemy_orbit;
        phaseArguments[i,0] = 24;
        phaseArguments[i,1] = 11-i; // orbit speed
        phaseArguments[i,2] = 1; // xbend
        phaseArguments[i,3] = 1; // ybend
        phaseArguments[i,4] = other._direction; // direction
        if other._direction > 270 other._direction = 270 - irandom(15) - 6 - i else other._direction = 270 + irandom(15) + 6 + i;
        phaseArguments[i,5] = 10; // speed
        phaseArguments[i,6] = 5; // radius delta

        phaseCondition[i] = _PHASE_CONDITION_TIME
        phaseConditionArguments[i,0] = _PHASE_DELAY_WAIT;

        if y > 100 {
                advancePhase_AbsoluteTime[i] = 2000; // causes new formation to fly offscreen
        } else {
                advancePhase_AbsoluteTime[i] = 20;
        }

        // create new formation
        phase[i+1] = run_script_on_chain;
        phaseArguments[i+1,0] = form_orbit_doubler;
            phaseArguments[i+1,1] = -1; // wait
            phaseArguments[i+1,2] = -999; // xoffset
            phaseArguments[i+1,3] = -999; // yoffset

            phaseCondition[i+1] = _PHASE_CONDITION_TIME
            phaseConditionArguments[i+1,0] = _PHASE_DELAY_WAIT;
                advancePhase_AbsoluteTime[i+1] = 3;

        // stop & wait for new formation to spawn
        phase[i+2] = enemy_orbit;
        phaseArguments[i+2,0] = 68; // orbit radius
        phaseArguments[i+2,1] = 6; // orbit speed
        phaseArguments[i+2,6] = 120; // radius delta

            phaseCondition[i+2] = _PHASE_CONDITION_TIME
            phaseConditionArguments[i+2,0] = _PHASE_DELAY_WAIT;
                advancePhase_AbsoluteTime[i+2] = 40;

        // fly back up!!
        phase[i+3] = enemy_orbit;
        phaseArguments[i+3,0] = 24; // orbit radius
        phaseArguments[i+3,1] = 6; // orbit speed
        phaseArguments[i+3,2] = 1; // xbend
        phaseArguments[i+3,3] = 1; // ybend
        phaseArguments[i+3,4] = other._direction; // direction
        if other._direction > 270 other._direction = 270 - irandom(15) - 6 - i else other._direction = 270 + irandom(15) + 6 + i;
        phaseArguments[i+3,5] = -10; // speed
        phaseArguments[i+3,6] = 120; // radius delta

            phaseCondition[i+3] = _PHASE_CONDITION_TIME
            phaseConditionArguments[i+3,0] = _PHASE_DELAY_WAIT;
                advancePhase_AbsoluteTime[i+3] = 180;
    }
}