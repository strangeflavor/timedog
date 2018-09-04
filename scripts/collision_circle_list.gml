#define collision_circle_list
/// collision_circle_list(x1,y1,radius,obj,prec,notme)
//
//  Returns a list data structure populated with the ids of instances 
//  colliding with a given circle, or noone if no instances found.
//
//      x1,y1       center of the collision circle (filled), real
//      radius      radius of the collision circle (filled), real
//      obj         object to check for collision (or all), real
//      prec        true for precise collision checking, bool
//      notme       true to ignore the calling instance, bool
//
/// GMLscripts.com/license

var x1,y1,radius,obj,prec,notme,dsid,i;
x1 = argument0;
y1 = argument1;
radius = argument2;
obj = argument3;
prec = argument4;
notme = argument5;
dsid = ds_list_create();
with (obj) {
    if (!notme || id != other.id) {
        i = collision_circle(x1,y1,radius,id,prec,false);
        if (i != noone) ds_list_add(dsid,i);
    }
}
if (ds_list_empty(dsid)) {
    ds_list_destroy(dsid);
    dsid = noone;
}
return dsid;


#define collision_line_first
/// collision_line_first(x1,y1,x2,y2,object,prec,notme)
//
//  Returns the instance id of an object colliding with a given line and
//  closest to the first point, or noone if no instance found.
//  The solution is found in log2(range) collision checks.
//
//      x1,y2       first point on collision line, real
//      x2,y2       second point on collision line, real
//      object      which objects to look for (or all), real
//      prec        if true, use precise collision checking, bool
//      notme       if true, ignore the calling instance, bool
//
/// GMLscripts.com/license

    var ox,oy,dx,dy,object,prec,notme,sx,sy,inst,i;
    ox = argument0;
    oy = argument1;
    dx = argument2;
    dy = argument3;
    object = argument4;
    prec = argument5;
    notme = argument6;
    sx = dx - ox;
    sy = dy - oy;
    inst = collision_line(ox,oy,dx,dy,object,prec,notme);
    if (inst != noone) {
        while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx /= 2;
            sy /= 2;
            i = collision_line(ox,oy,dx,dy,object,prec,notme);
            if (i) {
                dx -= sx;
                dy -= sy;
                inst = i;
            }else{
                dx += sx;
                dy += sy;
            }
        }
    }
    return inst;