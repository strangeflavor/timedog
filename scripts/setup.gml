#define setup

//if (live_call()) return live_result;
make(obj_gmlive);
setupFiles();

if os_type == os_ios or os_type == os_android mobile = true else mobile = false;

developer = true;
debug = 0;
debugTimelineStartPos = -1;

///////////////////////////////////////////////
// screen stuff
///////////////////////////////////////////////

screen_w = display_get_width();
screen_h = display_get_height();

base_w = 480;
base_h = 640;
bw = base_w;
bh = base_h;

scale = max(1,floor(screen_h/base_h));

vw = base_w*scale;
vh = base_h*scale;

window_set_size(vw,vh);
// note that window_center() gets called in rTitle create event bc it won't work on the same set as window_set_size()

room_set_view(rTitle,0,true,0,0,vw,vh,0,0,vw,vh,0,0,0,0,-1)
room_set_view(rGrandpa,0,true,0,0,vw,vh,0,0,vw,vh,0,0,0,0,-1)
room_set_view(rLevelSelect,0,true,0,0,vw,vh,0,0,vw,vh,0,0,0,0,-1)
room_set_view(rDeepSpace,0,true,0,0,base_w,base_h,0,0,base_w,base_h,0,0,0,0,-1)
room_set_view(rMysteryPlanet,0,true,0,0,vw,vh,0,0,vw,vh,0,0,0,0,-1)

///////////////////////////////////////////////
// gameplay
///////////////////////////////////////////////

numLevels = 16; // levels per world
numWorlds = 6; // worlds total

createLevelData();

XP = 0;
XP_lvl[0] = 100;
XP_lvl[1] = 500;
XP_lvl[2] = 1000;
gems = 0;

GAMEFLOW_completedLevel = false;
GAMEFLOW_currentLevel = -1;
GAMEFLOW_gemsCollectedInLevel = 0;

WEAPON_rapid = false;
WEAPON_tribeam = false;
WEAPON_bomb = false;
WEAPON_shield = false;
WEAPON_warp = false;

choose_norepeat_lastvalue = -9999;
choose_norepeat_lastvalue2 = -9999;

///////////////////////////////////////////////
// system objects
///////////////////////////////////////////////

make(oConsole);
make(controller);
make(oAudio);

room_goto_next();

#define setupFiles
ini_open('settings.ini');
currentWorld = floor(ini_read_real("preferences", "world", 0));
ini_close();
// gems

// XP

#define saveFiles
ini_open('settings.ini');
ini_write_real("preferences", "world", floor(currentWorld));
ini_close();