#define wave_sines0
///wave_sines0(count);
var _count = argument0;
if _count <= 0 _count = 2;

for (i=0;i<_count;i+=1) {
    with make(vw/2+48,-32,fChain) {
        enemy = oMiniThex;
        path = pSine;
        _path_speed = 7+(other.i/2);
        endaction = path_action_continue;
        size = 9;
        wait = 1+other.i*180;
    }

    with make(vw/2-48,-96,fChain) {
        enemy = oMiniThex;
        path = pSine;
        _path_speed = 7+(other.i/2);
        endaction = path_action_continue;
        size = 9;
        wait = 120+other.i*180;
    }
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
