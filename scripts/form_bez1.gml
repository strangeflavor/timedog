#define form_bez1
/// form_bez1
// used for testing bez designs!
trace('starting form bez 1');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _xoffset = arg[0];
if _xoffset == 1 _xoffset = 0;

////////////////////////
// make bez
////////////////////////

bID[0] = make(oBezier);
with bID[0] {
    bezTest(0);
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
    bezierEndAction = 'reset';
    bezierSpeed = 12;
    size = 2;
    rate = 16;

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

    // g90 position data
    /*
    columns = 8;
    rows = 3;
    xspacing = 40;
    yspacing = 40;
    xo = 100;
    yo = 80;
    */
}

#define form_bez2
/// form_bez2
// used for testing bez designs!
trace('starting form bez 2');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _xoffset = arg[0];
if _xoffset == 1 _xoffset = 0;

////////////////////////
// make bez
////////////////////////

bID[0] = make(oBezier);
with bID[0] {
    bezTest(1);
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
    bezierEndAction = 'reset';
    bezierSpeed = 12;
    size = 2;
    rate = 16;
    
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

    // g90 position data
    /*
    columns = 8;
    rows = 3;
    xspacing = 40;
    yspacing = 40;
    xo = 100;
    yo = 80;
    */
}

#define form_bez3
/// form_bez3
// used for testing bez designs!
trace('starting form bez 3');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _xoffset = arg[0];
if _xoffset == 1 _xoffset = 0;

////////////////////////
// make bez
////////////////////////

bID[0] = make(oBezier);
with bID[0] {
    bezTest(2);
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
    bezierEndAction = 'reset';
    bezierSpeed = 12;
    size = 2;
    rate = 16;
    
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

    // g90 position data
    /*
    columns = 8;
    rows = 3;
    xspacing = 40;
    yspacing = 40;
    xo = 100;
    yo = 80;
    */
}

#define form_bez4
/// form_bez4
// used for testing bez designs!
trace('starting form bez 4');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _xoffset = arg[0];
if _xoffset == 1 _xoffset = 0;

////////////////////////
// make bez
////////////////////////

bID[0] = make(oBezier);
with bID[0] {
    bezTest(3);
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
    bezierEndAction = 'reset';
    bezierSpeed = 12;
    size = 2;
    rate = 16;
    
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

    // g90 position data
    /*
    columns = 8;
    rows = 3;
    xspacing = 40;
    yspacing = 40;
    xo = 100;
    yo = 80;
    */
}

#define form_invaders
/// form_invaders(size,rate);
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
    bezData('corkscrew');
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
    // used in fBezChain to set individual destinations
    columns = 8;
    rows = 3;
    rate = 6;
    xspacing = 40;
    yspacing = 40;
    xo = 100;
    yo = 80;

}

#define form_corkscrew
/// form_invaders(size,rate);
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
    bezData('corkscrew');
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
    bezierSpeed = 12;

    // this just prevents phase 0 from ending until we manually end it at the end of the bezier path

    phaseCondition[0] = _PHASE_CONDITION_TIME;
    phaseConditionArguments[0,0] = -1;

    /*
    phase[1] = enemy_move;
    phaseCondition[1] = _PHASE_CONDITION_XY;
    phaseConditionArguments[1,0] = 16;
    phaseConditionArguments[1,1] = 16;

    phase[2] = enemy_stop;
    phaseCondition[2] = _PHASE_CONDITION_TIME;
    phaseConditionArguments[2,0] = 180;
    */
    phase[1] = enemy_move;
    phaseArguments[1,0] = 94;
    phaseArguments[1,1] = 9;

    size = 10;
    rate = 6;
}

#define form_arch
/// form_arch(wait,xoffset,endaction)
trace('starting form_arch');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _wait = arg[0];
if _wait <= 0 _wait = 1;

var _xoffset = arg[1];
if _xoffset == 1 _xoffset = 0;

_endaction = arg[2]; // 'update phase' (flies offscreen) or 'reverse' (bounces back and forth)

////////////////////////
// make bez
////////////////////////

bID[0] = make(oBezier);
with bID[0] {
    bezData('arch');
    createBezierControlPoints();
}

////////////////////////
// chain up
////////////////////////

var _xoffset = arg[0];
if _xoffset == 1 _xoffset = 0;

var eID = make(vw/2+_xoffset,-96,fBezChain);
eID.bezierID = other.bID[0];
eID.enemy = oBezThex;
eID.bezierSpeed = 16;

// this just prevents phase 0 from ending until we manually end it at the end of the bezier path
eID.phaseCondition[0] = _PHASE_CONDITION_TIME;
eID.phaseConditionArguments[0,0] = -1;

if _endaction <= 0 {
    eID.bezierEndAction = 'update phase';
    eID.phase[1] = enemy_move;
    eID.phaseArguments[1,0] = 0;
    eID.phaseArguments[1,1] = 9;
} else {
    eID.bezierEndAction = 'reverse';
}

eID.size = 24;
eID.rate = 6;
#define form_bezchain
/// form_curve0ff0(wait,bezData,xoffset,yoffset)
trace('starting form_bezchain');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _wait = arg[0];
if _wait <= 0 _wait = 1;

var _bezData = arg[1];
if _bezData == -1 _bezData = 'arch';

var _xoffset = arg[2];
if _xoffset == -1 _xoffset = 0;

var _yoffset = arg[3];

_hmirror = arg[4];

_endaction = 0;

////////////////////////
// make bez
////////////////////////

bID[0] = make(oBezier);
with bID[0] {
    read_data_hmirror = other._hmirror;
    read_data_ymirror = false;
    bezData(_bezData);
    createBezierControlPoints(_xoffset);
}

////////////////////////
// chain up
////////////////////////

//var eID = make(bw/2+_xoffset,-96,fBezChain);
var eID = make(bw/2,-96,fBezChain);
eID.bezierID = other.bID[0];
eID.enemy = oBezThex;
eID.bezierSpeed = 9;

// this just prevents phase 0 from ending until we manually end it at the end of the bezier path
eID.phaseCondition[0] = _PHASE_CONDITION_TIME;
eID.phaseConditionArguments[0,0] = -1;

if _endaction <= 0 {
    eID.bezierEndAction = 'update phase';
    eID.phase[1] = enemy_move;
    eID.phaseArguments[1,0] = 90;
    eID.phaseArguments[1,1] = 9;
} else {
    eID.bezierEndAction = 'reverse';
}

eID.size = 9;
eID.rate = 9;

#define form_diagWave
form_bezchain(0,'curve away up right');
#define form_bezSpiral
form_bezchain(0,'bez spiral');
#define form_bezWideSine
form_bezchain(0,'1 wide sine');