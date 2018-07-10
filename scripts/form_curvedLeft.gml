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

#define form_bez
/// form_meteors(size,rate);
trace('starting form bez');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _xoffset = arg[0];
if _xoffset == 1 _xoffset = 0;

////////////////////////
// make bez
////////////////////////

bID[0] = make(oBezier);
with bID[0] {
    bezTest();
    createBezierControlPoints();
}

////////////////////////
// chain up
////////////////////////

var _xoffset = arg[0];
if _xoffset == 1 _xoffset = 0;

with make(vw/2+_xoffset,-96,fBezChain) {
    bezierID = other.bID[0];
    enemy = oBezThex;
    bezierEndAction = 'update phase';
    bezierSpeed = 16;

    // this just prevents phase 0 from ending until we manually end it at the end of the bezier path

    phaseCondition[0] = _PHASE_CONDITION_TIME;
    phaseConditionArguments[0,0] = -1;

    phase[1] = enemy_move;

    phaseCondition[1] = _PHASE_CONDITION_XY;
    phaseConditionArguments[1,0] = 16;
    phaseConditionArguments[1,1] = 16;

    phase[2] = enemy_stop;
    phaseCondition[2] = _PHASE_CONDITION_TIME;
    phaseConditionArguments[2,0] = 150;

    phase[3] = enemy_move;
    phaseArguments[3,0] = -2;
    phaseArguments[3,1] = 9;

    size = 24;

    // g90 position data
    columns = 8;
    rows = 3;
    rate = 6;
    xspacing = 40;
    yspacing = 40;
    xo = 100;
    yo = 80;
}

/*
with make(oMiniThex) {
    depth = -6;
    invul = false;

    followBezier = true;
    bezierObjectArray[0] = other.bID[0];
    bezierEndAction = 'update phase';

    currentPhase = -1;
    phase[0] = enemy_move;

    phaseCondition[0] = _PHASE_CONDITION_XY;
    phaseConditionArguments[0,0] = 16;
    phaseConditionArguments[0,1] = 16;

    phase[1] = enemy_stop;
}
*/