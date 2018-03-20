#define drawTimeHUD
/*
var ttime = levelManager.winConditionValue;//levelManager.alarm[1] div 60
var minutes = ttime div 360;
var seconds = ttime % 60;
//var frames = (levelManager.winConditionValue % 60) % 60;
//var frames = seconds % 60;
var frames = frac(ttime*.01);
var subframes = '.'+string(irandom(9))+string(irandom(9));
*/

var ttime = levelManager.winConditionValue;
var minutes = floor(ttime/60/60);
var seconds = floor((ttime/60) mod 60);
//var frames = irandom_range(10,59)
frames = floor(frac((ttime mod 60)*.01)*100);
//time_string = string(minutes) + ":" + string(seconds);


if minutes < 1 {
    minutes = '00:';
} else {
    minutes = string(minutes)+':';
}

if seconds < 10 {
    seconds = string(seconds);
    seconds = '0'+seconds;
}

if frames < 10 {
    frames = string(frames);
    frames = '0'+frames;
}


//ttime = string(minutes)+string(seconds);//+'.'+string(frames);
ttime = string(minutes)+string(seconds)+'.'+string(frames);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text_ext(vw-32,32,ttime,-1,-1);

draw_set_halign(fa_left);
//draw_text_ext_transformed(vw-32,24,subframes,-1,-1,.5,.5,0);

#define drawHUD
///drawHUD()
// equipped weapon
if weapon > 0 {
    var xx;
    xx = 60;
    draw_set_alpha(1);
    draw_sprite(sItemUI,0,xx-9,vh - 40);
    draw_sprite(sItemUI,weapon,xx-9,vh - 40);
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_color(c_dkgray);
    draw_text(xx+4,vh - 12,'EQ');
    draw_set_color(make_color_rgb(20+76,20+150,255));
    draw_text(xx+2,vh - 10,'EQ');
}

if instance_exists(levelManager) if levelManager.winCondition == _WIN_TIME drawTimeHUD();

#define drawDialog
var xx = 8;
var yy = 8;

gradientSlideIn += 2;
if room != rShop {
    draw_set_blend_mode_ext(0,3);
    draw_sprite_ext(sTopGradient,0,0,min(gradientSlideIn,-64),1,1,0,c_white,1);
    draw_set_blend_mode(bm_normal);
}

if oDialog.name == 'NARRATOR' {
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    //draw_text(xx+8,min(yy,gradientSlideIn+128),oDialog.text);
    draw_text_ext(xx+8,min(yy,gradientSlideIn+128),oDialog.text,-1,vw*.7);
} else {
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    if oDialog.speaker > -1 {
        draw_sprite(oDialog.speaker,0,xx,yy);
        draw_sprite(sDialogBub,0,xx,yy);
    }
    draw_set_color(c_blue);
    draw_text(xx+90,yy,oDialog.name);
    draw_set_color(c_white);
    draw_text_ext(xx+90,min(yy+16,gradientSlideIn+128),oDialog.text,-1,vw*.7);
}