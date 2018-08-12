#define form_curvedLeft
///form_curvedLeft(xoffset,yoffset,count,speed,wait);
trace('starting form curved left');

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
if xoffset == -1 xoffset = -180;
var yoffset = arg[1];
if yoffset == -1 yoffset = -60;

var count = arg[2];
if count < 1 count = 5;

var _speed = arg[3];
if _speed == -1 _speed = 12;

_wait = arg[4];

newFormationID = getFormationID();

for (var i=0;i<count;i+=1) {
    tId = make(vw/2+xoffset+i*2,yoffset,oMiniThex);
    tId.formationID = other.newFormationID;
    addEnemyToFormationTracker(tId.formationID);

    tId.waitTime = (i+1)*6 + other._wait;//irandom(6);// i*10;
    tId.invulTime = 6;
    tId.path = pMoonShaped;
    tId.path_speed = _speed;
    tId.path_endaction = path_action_reverse;
}

#define form_curvedRight
///form_curvedRight(xoffset,yoffset,count,speed,wait);
trace('starting form curved left');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var xoffset = arg[0];
if xoffset == -1 xoffset = -180;
var yoffset = arg[1];
if yoffset == -1 yoffset = -60;

var count = arg[2];
if count < 1 count = 5;
var _speed = arg[3];
if _speed == -1 _speed = 12;

_wait = arg[4];

newFormationID = getFormationID();

for (var i=0;i<count;i+=1) {
    tId = make(vw/2+xoffset+i*2,yoffset,oMiniThex);
    tId.formationID = other.newFormationID;
    addEnemyToFormationTracker(tId.formationID);

    tId.waitTime = (i+1)*6 + other._wait;
    tId.invulTime = 6;
    tId.path = pMoonShaped;
    tId.path_speed = -_speed;
    tId.path_position = 1;
    tId.path_endaction = path_action_reverse;
}

#define form_simplesine
/// form_meteors(size,rate);
trace('starting form simplesine');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _xoffset = arg[0];
if _xoffset == 1 _xoffset = 0;

with make(vw/2+_xoffset,-96,fChain) {
    enemy = oMiniThex;
    path = pSine;
    _path_speed = 7; //7+(other.i/2);
    endaction = path_action_continue;
    size = 7;
    wait = 8;//+other.i*180;

    /*
    phaseCondition[0] = _PHASE_CONDITION_TIME;
    phaseConditionArguments[0,0] = 1;

    phase[1] = enemy_move;
    */
}

#define form_steerTowardPlayer
///form_steerTowardPlayer

trace('starting form steertowardplayer');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _xoffset = 0;

with make(vw/2+_xoffset,-32,oSteerTowardPlayer) {
}