#define form_bez
/// form_meteors(size,rate);
trace('starting form invaders');

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

#define form_invaders
/// form_meteors(size,rate);
trace('starting form invaders');

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
    phaseConditionArguments[2,0] = 180;

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
