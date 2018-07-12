#define form_boxChains0
///form_boxChains0(xoffset,ystop,rate,path_speed,size);
trace('starting form boxchains0');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var xoffset = arg[0];
_ystop = arg[1];
_rate = arg[2];
_path_speed = arg[3];
_size = arg[4];

if xoffset == -1 xoffset = -64 + choose(64,80,128,160,200);
if _ystop == -1 _ystop = vh/2 - choose(60,120,180,240); // choose(180,120,200,300,400);
if _path_speed == -1 _path_speed = choose(16,24,32);
if _rate == -1 _rate = 4;
if _size == -1 _size = 3;

newFormationID = getFormationID();

with make(-32+xoffset,32,fChain) {
    formationID = other.newFormationID;
    invul = true;

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

    wait = 15;
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
var yoffset = arg[2];
_direction = arg[3];

if _wait == -1 _wait = 6;
if xoffset == -1 xoffset = 0;
if _direction == -1 _direction = 270;

newFormationID = getFormationID();

with make(vw/2+xoffset,32+yoffset,fChain) {
    formationID = other.newFormationID;
    enemy = oMiniThex;
    invul = true;
    size = 12;
    wait = 1+other._wait;
    rate = 4;

    //phaseDelay[0] = _PHASE_DELAY_WAIT;
        //advancePhase_AbsoluteTime[0] = 60;
    phase[0] = enemy_orbit;
    phaseArguments[0,0] = 24; // radius
    phaseArguments[0,1] = 9; // speed

    phaseCondition[0] = _PHASE_CONDITION_TIME
    //phaseConditionArguments[0,0] = 120; // snake string
    phaseConditionArguments[0,0] = _PHASE_DELAY_WAIT;
        advancePhase_AbsoluteTime[0] = 120;

    phase[1] = enemy_orbit;
    phaseArguments[1,0] = 24; // radius
    phaseArguments[1,1] = 9; // speed
    phaseArguments[1,2] = 1; // xbend
    phaseArguments[1,3] = 1; // ybend
    phaseArguments[1,4] = other._direction; // direction
    phaseArguments[1,5] = 12; // speed
    phaseArguments[1,6] = 1; // radius delta
}

#define form_orbit_expanding
///form_orbit_expanding(wait,xoffset,yoffset,direction,moveDelay)
var xoffset = argument1;
var yoffset = argument2;
_direction = argument3;
if _direction == -1 _direction = 270;
var moveDelay = argument4;
if moveDelay == -1 moveDelay = 120;

newFormationID = getFormationID();

with make(vw/2+xoffset,32+yoffset,fChain) {
    formationID = other.newFormationID;
    enemy = oMiniThex;
    invul = true;
    //path = pCircle;
    //_path_speed = 7+(other.i/2);
    //endaction = path_action_continue;
    size = 12;
    wait = 1+argument0;
    rate = 4;
    speedSign = choose(-1,1);

    //phaseDelay[0] = _PHASE_DELAY_WAIT;
        //advancePhase_AbsoluteTime[0] = 60;
    phase[0] = enemy_orbit;
    phaseArguments[0,0] = 60; // radius
    phaseArguments[0,1] = speedSign*5; // speed
    phaseArguments[0,6] = 1; // radius delta

    phaseCondition[0] = _PHASE_CONDITION_TIME
    //phaseConditionArguments[0,0] = 120; // snake string
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