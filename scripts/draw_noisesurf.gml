#define draw_noisesurf
draw_set_blend_mode_ext(4,2);

if surface_exists(noisesurf) {
    //if (view_wview[1] == vw and view_current == 0) or room == rTitle or room == rShop {
    if 1==1 {
        // draw new noise every n frames
        surface_set_target(noisesurf);
        if frac(objectAge/30) == 0 {
            switch irandom(1) {
                case 0:
                    //draw_sprite_ext(sBrak,0,vw/2+irandom(256)-128,vh/2+irandom(256)-128,1,1,1,c_white,.5);
                    draw_sprite_ext(sFilmGrain,irandom(2),vw/2+irandom(128)-64,vh/2+irandom(128)-64,choose(1,-1,2,-2),choose(1,-1,2,-2),1,c_white,.2);
                break;
                case 1:
                    draw_sprite_ext(sPaper,0,vw/2+irandom(128)-64,vh/2+irandom(128)-64,choose(1,-1,2,-2),choose(1,-1,2,-2),1,c_white,.5);
                break;
            }
        } else {
            // fade
            draw_set_alpha(.01);
            var c_fade = merge_color(bg_color,c_black,0);
            draw_rectangle_colour(0,0,vw,vh,c_fade,c_fade,c_fade,c_fade,false);
            draw_set_alpha(1);

            if irandom(400) == 1 {
                draw_clear_alpha(c2,.01);
                draw_set_alpha(1);
                draw_rectangle_color(0,0,vw,vh,c_black,c_black,c_black,c_black,false);
            }
        }
        surface_reset_target();
    }

    draw_surface_stretched(noisesurf, 0, 0, display_get_gui_width(), display_get_gui_height());
}

draw_set_blend_mode(bm_normal);

#define draw_kirbynoisesurf
draw_set_blend_mode_ext(3,8);
//makeBlendTester();

if surface_exists(noisesurf) {
    if (view_wview[1] == vw and view_current == 0) or room == rTitle or room == rShop {
        // draw new noise every n frames
        surface_set_target(noisesurf);
        if frac(objectAge/40) == 0 {
            switch irandom(1) {
                case 0:
                    //draw_sprite_ext(sBrak,0,vw/2+irandom(256)-128,vh/2+irandom(256)-128,1,1,1,c_white,.5);
                    draw_sprite_ext(sBrak,irandom(2),vw/2+irandom(128)-64,vh/2+irandom(128)-64,choose(1,-1,2,-2),choose(1,-1,2,-2),1,c_gray,.2);
                break;
                case 1:
                    draw_sprite_ext(sPaper,0,vw/2+irandom(128)-64,vh/2+irandom(128)-64,choose(1,-1,2,-2),choose(1,-1,2,-2),1,c_white,.5);
                break;
            }
        } else {
            // fade
            draw_set_alpha(.01);
            var c_fade = merge_color(bg_color,c_black,abs(sin(objectAge*.01)));
            //var c_fade = c_white;
            draw_rectangle_colour(0,0,vw,vh,c_fade,c_fade,c_fade,c_fade,false);
            draw_set_alpha(1);

            if irandom(400) == 1 {
                draw_clear_alpha(c2,.01);
                draw_set_alpha(1);
                draw_rectangle_color(0,0,vw,vh,c_black,c_black,c_black,c_black,false);
            }
        }
        surface_reset_target();
    }

    draw_surface_stretched(noisesurf, 0, 0, display_get_gui_width(), display_get_gui_height());
}

draw_set_blend_mode(bm_normal);
#define draw_moonnoisesurf
draw_set_blend_mode_ext(5,4);
//makeBlendTester();

if surface_exists(noisesurf) {
    if (view_wview[1] == vw and view_current == 0) or room == rTitle or room == rShop {
        // draw new noise every n frames
        surface_set_target(noisesurf);
        if frac(objectAge/60) == 0 {
            draw_sprite_ext(sFilmGrain,irandom(3),vw/2+irandom(128)-64,vh/2+irandom(128)-64,choose(-1,1),choose(-1,1),1,c_white,.25);
        } else {
            // fade
            draw_set_alpha(.1);
            var c_fade = merge_color(bg_color,c_black,abs(sin(objectAge*.01)));
            //var c_fade = c_white;
            draw_rectangle_colour(0,0,vw,vh,c_fade,c_fade,c_fade,c_fade,false);
            draw_set_alpha(1);

            /*
            if irandom(400) == 1 {
                draw_clear_alpha(c2,.01);
                draw_set_alpha(1);
                draw_rectangle_color(0,0,vw,vh,c_black,c_black,c_black,c_black,false);
            }
            */
        }
        surface_reset_target();
    }

    draw_surface_stretched(noisesurf, 0, 0, display_get_gui_width(), display_get_gui_height());
}

//makeBlendTester();
draw_set_blend_mode_ext(9,2);
draw_sprite_ext(sGradientCircle,0,vw/2+nrandom(64),vh/2+nrandom(64),4,4,0,c_white,1); // ? spotlight ?


draw_set_blend_mode(bm_normal);

#define draw_sun
var surf_w = argument0;
var surf_h = argument1;

draw_set_blend_mode_ext(5,4);
//makeBlendTester();

if surface_exists(noisesurf) {
    surface_set_target(noisesurf);

    if frac(objectAge/60) == 0 {
        draw_sprite_ext(sFilmGrain,irandom(3),surf_w/2+irandom(128)-64,surf_h/2+irandom(128)-64,choose(-1,1),choose(-1,1),1,c_white,.25);
    } else {
        // fade
        draw_set_alpha(.1);
        var c_fade = c_black;
        draw_rectangle_colour(0,0,surf_w,surf_h,c_fade,c_fade,c_fade,c_fade,false);
        draw_set_alpha(1);

        //makeBlendTester();
        draw_set_blend_mode_ext(noiseblendsurf,noiseblenddest);
        draw_sprite_ext(sAlphaGradientCircle,0,surf_w/2+nrandom(64),surf_h/2+nrandom(64),3,3,0,c_white,1); // ? spotlight ?
    }
    surface_reset_target();

    draw_surface_stretched_ext(noisesurf,0,0,vw,vh,c_white,1);
    //show(surf_w,surf_h)
}

if surface_exists(starssurf) {
    surface_set_target(starssurf);

    if frac(objectAge/60) == 0 {
        draw_sprite_ext(sFilmGrain,irandom(3),surf_w/2+irandom(128)-64,surf_h/2+irandom(128)-64,choose(-1,1),choose(-1,1),1,c_white,.25);
    } else {
        // fade
        draw_set_alpha(.1);
        var c_fade = c_black;
        draw_rectangle_colour(0,0,surf_w,surf_h,c_fade,c_fade,c_fade,c_fade,false);
        draw_set_alpha(1);

        //makeBlendTester();
        draw_set_blend_mode_ext(2,2);
        draw_sprite_ext(sGradientCircle,0,surf_w/2+nrandom(64),surf_h/2+nrandom(64),1.5,1.5,0,c_white,1); // ? spotlight ?

        if irandom(400) == 1 {
            draw_clear_alpha(c2,.01);
            draw_set_alpha(1);
            draw_rectangle_color(0,0,surf_w,surf_h,c_black,c_black,c_black,c_black,false);
        }
    }
    surface_reset_target();

    draw_surface_stretched_ext(starssurf,0,0,vw,vh,c_white,1);
}

draw_set_blend_mode(bm_normal);