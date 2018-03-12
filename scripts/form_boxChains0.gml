#define form_boxChains0
///form_boxChains0(xoffset,ystop,rate,path_speed,size);
trace('starting form boxchains0');

var arg;
for (var i = 0; i < 16; i += 1;) {
    if argument_count > i
       {
       arg[i] = argument[i];
       }
    else
       {
       arg[i] = -1;
       }
}

var xoffset = arg[0];
_ystop = arg[1];
_rate = arg[2];
_path_speed = arg[3];
_size = arg[4];

if xoffset == -1 xoffset = 0;
if _ystop == -1 _ystop = vh/2 - choose(60,120,180); // choose(180,120,200,300,400);
if _rate == -1 rate = 4;
if _path_speed == -1 _path_speed = 32;
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
for (var i = 0; i < 16; i += 1;) {
    if argument_count > i
       {
       arg[i] = argument[i];
       }
    else
       {
       arg[i] = -1;
       }
}

var xoffset = arg[0];
_ystop = arg[1];
_rate = arg[2];
_path_speed = arg[3];
_size = arg[4];
_descentSpeed = arg[5];
_direction = arg[6];
_wait = arg[7];

if xoffset == -1 xoffset = 0;
if _ystop == -1 _ystop = vh/2 - choose(60,120,180); // choose(180,120,200,300,400);
if _rate == -1 rate = 4;
if _path_speed == -1 _path_speed = 32;
if _size == -1 _size = 3;
if _wait == -1 _wait = 0;
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
for (var i = 0; i < 16; i += 1;) {
    if argument_count > i
       {
       arg[i] = argument[i];
       }
    else
       {
       arg[i] = -1;
       }
}

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

if _wait == -1 _wait = 1;
if _rate == -1 rate = 9;

var xoffset;

if side == 1 { // right
    xoffset = vw + (_size-1) * _rate * _speed;
} else { // left
    xoffset = -(_size-1) * _rate * _speed;
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
