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
    if !invincible and other.dangerous kill(self);
}
