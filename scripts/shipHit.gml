#define shipHit
///shipHit();
if weapon == 4 {
    weapon = -1
    buttonSize = 32;
    buttonUnlockBurst();
    with make(x+buttonSize/2+irandom(24)-12,y+buttonSize/2+irandom(20)-10,oButtonUnlockFX) {
        sprite_index = sNightbird;
        image_blend = c_white;
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
    }
    kill(other);
} else {
    if !invincible and other.dangerous {
        kill(self);
        shipDestroy();
        active = false;
        visible = false;
    }
}

#define shipDestroy
sfx(sndPlayerHit);

with oMegaThruster kill();
with oPickup kill();
with oEnemy {
    active = false;
    //visible = false;
    //kill();
}

room_speed = 10;
cursor_sprite = -1;

oBG.playerDestroyed_x = x;
oBG.playerDestroyed_y = y;
oBG.ded = true;
oBG.bg_color_rate = .05;

oBG.alarm[0] = 1;

with levelManager {
    active = false;
    timeline_running = false;
}
/*
with make(oFX) {
    image_speed = 0;
    sprite_index = sNightbird;
    speed = 0;
    direction = 0;
    gravity = 0;
}

with make(oFX) {
    image_speed = 0;
    sprite_index = sNightbirdWings;
    speed = 0;
    direction = 0;
    gravity = 0;
}
*/
with fMaze kill();
with mazeEndpoint kill();
with mazeEater kill();
with oMazeBlock speed = 0;
/*
sfx(sndPlayerHit);
room_speed = 10;

oBG.alarm[0] = 30;
levelManager.timeline_speed = 0;
levelManager.active = false;

make(vw/2,-64,failedLevel);

with make(oFX) {
    depth += 1;
    sprite_index = sBombLoop;
    image_xscale = 6;
    image_yscale = 6;
    image_speed = 1;
    image_alpha = 1;
}

with make(oFX) {
    sprite_index = sPlayerExplosion;
    image_xscale = 4;
    image_yscale = 4;
    image_speed = .5;
}
*/
/*
with make(x-16,y-16,oFX) {
    sprite_index = sPlayerExplosion;
    image_xscale = 3;
    image_yscale = -3;
    image_speed = .2;
    image_blend = make_color_rgb(0,160,248);
}

with make(x+16,y+16,oFX) {
    sprite_index = sPlayerExplosion;
    image_index = 1;
    image_xscale = -3;
    image_yscale = 3;
    image_speed = .2;
    image_blend = make_color_rgb(0,248,160);
}
*/
