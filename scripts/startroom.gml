#define startroom
formationIndex = 0; // index for formation array (used to keep track of instance ids so formation leader can spawn pickups if its allies are dead)
levelComplete = false;

switch argument0 {
    case rTitle:
        instance_create(-16,-16,oMenu);
        lives = 3;
        //musicPlaying = sound_loop(musicTitle);
    break;
    case rDeepSpace:
        // prepare waves, set up level
        instance_create(vw/2,vh/2,levelManager);
        //musicPlaying = sound_loop(musicTrainJams);
    break;
}

#define endroom
/*
switch room {
    case rTitle:
    case rDeepSpace:
        sound_stop(musicPlaying);
    break;
}
*/
//sound_stop_all();
timeline_index = -1;