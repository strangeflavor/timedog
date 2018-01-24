///////////////////////////////////////////////
// screen stuff
///////////////////////////////////////////////

globalvar scale,vw,vh,screen_w,screen_h,developer,debug;
debug = 0;
scale = 1;
developer = true;

vw = 480*scale;
vh = 640*scale;
screen_w = display_get_width();
screen_h = display_get_height();

room_set_view(rTitle,0,true,0,0,vw,vh,0,0,vw,vh,0,0,0,0,-1)
room_set_view(rDeepSpace,0,true,0,0,vw,vh,0,0,vw,vh,0,0,0,0,-1)
room_set_view(rMysteryPlanet,0,true,0,0,vw,vh,0,0,vw,vh,0,0,0,0,-1)

///////////////////////////////////////////////
// gameplay
///////////////////////////////////////////////

globalvar numLevels,numWorlds,currentLevel,completedLevel;
numLevels = 16; // levels per world
numWorlds = 10; // worlds total
currentLevel = -1;
completedLevel = false;

createLevelData();

///////////////////////////////////////////////
// system objects
///////////////////////////////////////////////

make(oConsole);
make(controller);
make(oAudio);

room_goto_next();
