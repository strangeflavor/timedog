//var vx, vy, vc, vh;

draw_set_color(c_yellow);
draw_set_font(fArial);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

var vx = bw - 16;
var vy = 32;
//vh = screen_h;

var tempConsole, i;
tempConsole = ds_queue_create();
ds_queue_copy(tempConsole,oConsole.console_q);
i=0;
while(ds_queue_size(tempConsole)>0)
{
    draw_text_transformed(x+vx, y+vy + (i*24),ds_queue_dequeue(tempConsole),1,1,0);
    i+=1;
}
ds_queue_destroy(tempConsole);

