#define startroom
formationIndex = 0; // index for formation array (used to keep track of instance ids so formation leader can spawn pickups if its allies are dead)
if !mobile cursor_sprite = sCursorBig;

switch argument0 {
    case rGrandpa:
        make(oGrandpaIntro);
        music_loop(musicTitle);
    break;
    case rTitle:
        instance_create(-16,-16,oMenuBird);
        music_loop(musicTitle);
    break;
    case rDeepSpace:
        //make(oBG);
        //make(oKirBG);
        //make(oCloudsBG);
        createLevelManager();
        make(oShipIntro);
    break;
    case rLevelSelect:
        if audio_get_name(oAudio.musicPlaying) != 'musicTitle' {
            music_loop(musicTitle);
        }
    break;
}

#define startDialog
if levelManager.dialogPanels > -1 {
    make(oDialog);
    oHUD.showDialog = true;
} else {
    startGame();
}

#define endDialog
startGame();

#define startGame
GAMEFLOW_gemsCollectedInLevel = 0;
oShip.invincible = false;
oHUD.showDialog = false;
levelManager.alarm[0] = 1; // activate levelman!
music_loop(musicGame);
music_slow(choose(.8,.85,.9,.95,1,1,1.1,1.2));

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