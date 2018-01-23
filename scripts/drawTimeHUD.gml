
var ttime = levelManager.alarm[1] div 60
var minutes = ttime div 60;
var seconds = ttime % 60;
var frames = (levelManager.alarm[1] % 60) % 60;
var subframes = '.'+string(irandom(9))+string(irandom(9));

if frames < 10 {
    frames = string(frames);
    frames = '0'+frames;
} else {
    frames = string(frames);
}

ttime = string(minutes)+':'+string(seconds)+':'+string(frames);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text_ext(vw-32,24,ttime,-1,-1);

draw_set_halign(fa_left);
draw_text_ext_transformed(vw-32,24,subframes,-1,-1,.5,.5,0);
