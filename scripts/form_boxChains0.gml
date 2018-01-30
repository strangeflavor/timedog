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

with make(-32+xoffset,32,fChain) {
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
    phaseArguments[1,0] = 120;
}

with make(vw-32-(32*_size)+xoffset,-32,fChain) {
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
    phaseArguments[1,0] = 120;
}
