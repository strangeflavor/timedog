#define setup
///////////////////////////////////////////////
// screen stuff
///////////////////////////////////////////////

//globalvar scale,vw,vh,screen_w,screen_h,developer,debug,debugTimelineStartPos,base_w,base_h;
debug = 0;
scale = 1;
developer = false;
debugTimelineStartPos = -1;

gems = 0;

base_w = 480;
base_h = 640;
vw = base_w*scale;
vh = base_h*scale;
screen_w = display_get_width();
screen_h = display_get_height();

room_set_view(rTitle,0,true,0,0,vw,vh,0,0,vw,vh,0,0,0,0,-1)
room_set_view(rLevelSelect,0,true,0,0,vw,vh,0,0,vw,vh,0,0,0,0,-1)
room_set_view(rDeepSpace,0,true,0,0,vw,vh,0,0,vw,vh,0,0,0,0,-1)
room_set_view(rMysteryPlanet,0,true,0,0,vw,vh,0,0,vw,vh,0,0,0,0,-1)

///////////////////////////////////////////////
// gameplay
///////////////////////////////////////////////

//globalvar numLevels,numWorlds;
numLevels = 16; // levels per world
numWorlds = 10; // worlds total

createLevelData();

GAMEFLOW_completedLevel = false;
GAMEFLOW_currentLevel = -1;
GAMEFLOW_gemsCollectedInLevel = 0;

///////////////////////////////////////////////
// system objects
///////////////////////////////////////////////

make(oConsole);
make(controller);
make(oAudio);

room_goto_next();

#define switchtest
show('testing '+string(argument0));