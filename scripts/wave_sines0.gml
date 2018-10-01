#define wave_sines0
///wave_sines0(wait,xoffset,count);

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var _wait = arg[0];
if _wait <= 0 _wait = 1;

var _xoffset = arg[1];
if _xoffset == 1 _xoffset = 0;

var _width = arg[2];
if _width == -1 _width = 80;

var y0 = arg[3];
if y0 == -1 y0 = -32;

var y1 = arg[4];
if y1 == -1 y1 = -32;

var _count = arg[5];
if _count <= 0 _count = 1;

var eID = -1;

for (j=0;j<_count;j+=1) {
    eID = make(vw/2-_width+_xoffset,y0,fChain);
    eID.enemy = oMiniThex;
    eID.path = pSine;
    eID._path_speed = 6;//7+(other.j/2);
    eID.endaction = path_action_continue;
    eID.size = 9;
    eID.rate = 8;
    eID.wait = _wait;

    eID = make(vw/2+_width+_xoffset,y1,fChain);
    eID.enemy = oMiniThex;
    eID.path = pSine;
    eID._path_speed = 6;//7+(other.j/2);
    eID.endaction = path_action_continue;
    eID.size = 9;
    eID.rate = 8;
    eID.wait = _wait;
}

#define wave_sines1
///wave_sines1(count);
var _count = argument0;
if _count <= 0 _count = 2;

for (i=0;i<_count;i+=1) {
    newFormationID = getFormationID();

    with make(room_width-90,-32,fChain) {
        formationID = other.newFormationID;
        enemy = oMiniThex;
        path = pSine;
        _path_speed = 7;
        endaction = path_action_continue;
        size = 3;
        wait = 1+other.i*120;
    }

    with make(room_width-90-50,-32,fChain) {
        formationID = other.newFormationID;
        enemy = oMiniThex;
        path = pSine;
        _path_speed = 7;
        endaction = path_action_continue;
        size = 3;
        wait = 1+other.i*120 + nrandom(40);
    }

    with make(room_width-90+50,-32,fChain) {
        formationID = other.newFormationID;
        enemy = oMiniThex;
        path = pSine;
        _path_speed = 7;
        endaction = path_action_continue;
        size = 3;
        wait = 1+other.i*120 + 20 + nrandom(40);
    }
}