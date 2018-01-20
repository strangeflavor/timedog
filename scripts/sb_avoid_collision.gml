///sb_avoid_collision(object, see_ahead_distance, max_avoidance_force, weight)
///Return vector2 for avoiding colliding with specified object
///Requires collision_line_first from GMLscripts.com
///Objects used for avoidance must have position (vect2) variables set.
///If they move, they must also update their position variables in their step event.

//Note that this steering behaviour will try to avoid the given object, 
//but in no way will it actually prevent it from moving inside said object, 
//for example if the weighting of other steering behaviours overpowers this one. 
//Please see the solid_obj variable in obj_drone_flock_grid2 if you need that functionality.


var _avoid_obj = argument[0];
var _see_ahead_distance = argument[1];
var _max_avoidance_force = argument[2];
var _weight = argument[3];

//Actual XY position at end of line _see_ahead_distance length away from current position
var _see_ahead = vect_add(position, vect_multr(vect_norm(velocity), _see_ahead_distance));
//Find oject to avoid at this point
var _nearest_obj = collision_line_first(position[1], position[2],
                                        _see_ahead[1], _see_ahead[2],
                                        _avoid_obj,
                                        true,
                                        true);

if(_nearest_obj != noone) { //Object found
    //Move away from object
    var _avoidance_force = vect_subtract(_see_ahead, _nearest_obj.position);
    _avoidance_force = vect_norm(_avoidance_force);
    _avoidance_force = vect_multr(_avoidance_force, _max_avoidance_force);
    
    return vect_multr(_avoidance_force, _weight);
} else {
    return vect2(0,0);
}
                                        


