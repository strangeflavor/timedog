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