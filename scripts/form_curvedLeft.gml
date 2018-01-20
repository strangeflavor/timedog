trace('starting form curved left');

for (i=0;i<5;i+=1) {
    tId = instance_create(vw*.1,-32*scale,oMiniThex);

    tId.waitTime = irandom(6);// i*10;
    tId.path = pCurvedApproachMirror;
    tId.path_speed = 5*scale;

    /*
    with tId {
        path_start(pCurvedApproachMirror,5*scale,0,false);
    }
    */

    //timeline_position -= 10;
}
