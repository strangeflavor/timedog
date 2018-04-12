#define draw_noisesurf
draw_set_blend_mode_ext(4,2);

if surface_exists(noisesurf) {
    if (view_wview[1] == vw and view_current == 0) or room == rTitle or room == rShop {
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