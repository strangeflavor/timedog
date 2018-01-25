#define x_axis_get
//return 2*(-.5 + (mouse_x / room_width));
return mouse_x / room_width;

#define y_axis_get
var o;
//o = 2*(-.5 + (mouse_y / room_height));
o = mouse_y / room_height;
return clamp(o,0,1);

#define _get_timer
_timer += 1/room_speed;//*.01;
return _timer