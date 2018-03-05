///draw_columnB()
var _radius = argument0;
var _color = argument1;

if !variable_instance_exists(id, "_timer") {
    _timer = 0;
    step = 0;
    npointsDefault = 180;
    npoints = npointsDefault;
}

stepstart = 0;
stepend = 1/60.0;

xleft = 0;
ybottom = 18;

_speed = .1;

ilength = 170;
 
//radius = (room_height*.9)/2;
radius = _radius;
//xcenter = x;
//ycenter = y;
xcenter = radius/2;
ycenter = radius/2;

ftime = _get_timer();

//npoints = 5 + (ftime);
rad = 3;

step = stepstart + (ftime * (stepend - stepstart));

draw_set_color(_color);

draw_set_blend_mode_ext(bm_src_alpha,bm_one);

for (i = 1; i < npoints; i+=1) {
    var a = 2*pi * step * i;
    //var radiusi = radius;
    var radiusi = radius*sin(a*ftime*.1); // VERY NICE
    _x = xcenter + cos(a) * (i/npoints) * radiusi;
    _y = ycenter + sin(a) * (i/npoints) * radiusi;
    draw_circle(_x, _y, rad,false);
}

draw_set_blend_mode(bm_normal);

draw_set_color(c_white);
