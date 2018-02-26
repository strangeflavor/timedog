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
