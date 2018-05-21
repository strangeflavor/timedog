#define make
///make(x,y,object_index)
var _instanceID;
if argument_count == 1 or argument_count == 2 _instanceID = instance_create(x,y,argument[0]);
if argument_count >= 3 _instanceID = instance_create(argument[0],argument[1],argument[2]);
return _instanceID;

#define kill
if argument_count == 0 instance_destroy() else with argument[0] instance_destroy();

#define select
/// select(index, ...values)
return argument[argument[0] + 1];
#define image_scale
///image_scale(scale)
image_xscale = argument0;
image_yscale = image_xscale;

#define nrandom
///nrandom(n)

return irandom(argument0) - argument0/2;
#define move_follow
/// move_follow(object,speed)
//
//  Makes the calling instance follow a given instance at a given speed.
//
//      object      object or instance (or all), real
//      speed       speed to follow at, real
//
/// GMLscripts.com/license
{
    if (point_distance(x,y,argument0.x,argument0.y) > 0) {
        direction = point_direction(x,y,argument0.x,argument0.y);
        speed = argument1;
    }
    return 0;
}
#define draw_reset
//clear draw vars to defaults
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
#define Bezier_Point_Find
///Bezier_Point_Find(lerp, p0x, p0y, p1x, p1y, p2x, p2y, p3x, p3y)
/*
Lerp is a value from 0-1 to find on the line between p0 and p3
p1 and p2 are the control points

returns array (x,y)
*/
var t   = argument0;
var p0x = argument1;
var p0y = argument2;
var p1x = argument3;
var p1y = argument4;
var p2x = argument5;
var p2y = argument6;
var p3x = argument7;
var p3y = argument8;

//Precalculated power math
var tt  = t  * t;
var ttt = tt * t;
var u   = 1  - t; //Inverted
var uu  = u  * u;
var uuu = uu * u;

//Calculate the point
var px =     uuu * p0x; //first term
var py =     uuu * p0y;
px += 3 * uu * t * p1x; //second term
py += 3 * uu * t * p1y;
px += 3 * u * tt * p2x; //third term 
py += 3 * u * tt * p2y;
px +=        ttt * p3x; //fourth term
py +=        ttt * p3y;

//Pack into an array
var PA; PA[0] = px; PA[1] = py;
return PA;