///screenResize(fullscreen)
// called from controller when vk_f4 is pressed
fullscreen = !fullscreen;
//if argument_count > 0 fullscreen = argument[0];

/*
surface_free(shock_surf);
if instance_exists(oBGGradient) surface_free(oBGGradient.surf_bg);
if instance_exists(oWadeMap) surface_free(oWadeMap.surf_map);
if instance_exists(oBGTextures) surface_free(oBGTextures.surf_bgtextures);
*/

if fullscreen {
    ww = display_get_width();
    hh = display_get_height();
    window_set_size(ww, hh);
    screen_w = ww;
    screen_h = hh;
} else {
    screen_w = display_get_width();
    screen_h = display_get_height();

    vw = base_w*scale;
    vh = base_h*scale;

    window_set_size(vw,vh);
    /*
    screen_w = base_w*screen_scale;
    screen_h = base_h*screen_scale;

    var aspect = base_w / base_h ; // get the GAME aspect ratio
    if (display_get_width() < display_get_height())
        {
        //portrait
        var ww = min(screen_w, display_get_width());
        var hh = ww / aspect;
        }
    else
        {
        //landscape
        var hh = min(screen_h, display_get_height());
        var ww = hh * aspect;
        }
    */
}

alarm[0] = 1; //recenter_window = true;

//trace('resized window to '+string(ww)+'x'+string(hh));
//show('ww: '+string(ww)+', hh: '+string(hh))
//show('display_get_width: '+string(display_get_width())+', display_get_height: '+string(display_get_height()))
/*
if ww > display_get_width() or hh > display_get_height() {
    screen_scale = 1;
    screenResize(false);
}
*/
