///form_curvedLeft(xoffset,count);
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
if xoffset == -1 xoffset = 0;

var count = arg[1];
if count < 1 count = 5;

for (var i=0;i<count;i+=1) {
    tId = make(vw/2+xoffset+i*2,-32,oMiniThex);

    tId.waitTime = (i+1)*6;//irandom(6);// i*10;
    tId.invulTime = 6;
    tId.path = pMoonShaped;
    tId.path_speed = 8;

    //tId.phaseCondition[0] = _PHASE_CONDITION_TIME;
    //tId.phaseConditionArguments[0,0] = i*30;
    /*
    tId.phaseDelay[1] = 90;
    tId.phase[1] = enemy_flyAway;
    tId.phaseArguments[1,0] = 120;    
    */

    /*
    with tId {
        path_start(pCurvedApproachMirror,5*scale,0,false);
    }
    */

    //timeline_position -= 10;
}
