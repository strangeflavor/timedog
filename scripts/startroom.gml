#define startroom
formationIndex = 0; // index for formation array (used to keep track of instance ids so formation leader can spawn pickups if its allies are dead)

switch argument0 {
    case rTitle:
        instance_create(-16,-16,oMenu);
        music_loop(musicTitle);
    break;
    case rDeepSpace:
        // prepare waves, set up level
        createLevelManager();
        make(oHUD);
        make(oBG);

        music_loop(musicGame);
    break;
    case rLevelSelect:
        if audio_get_name(oAudio.musicPlaying) != 'musicTitle' {
            music_loop(musicTitle);
        }
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