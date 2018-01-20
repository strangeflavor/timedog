///sb_seek_arrive(x, y, slow_radius, weight)
///Return vector2 for steering towards given point with slowing inside a radius

var _target = vect2(argument[0], argument[1]);
var _slow_radius = argument[2];
var _weight = argument[3];

// subtract current position from target position and constrain to max_speed
//var _desired_velocity = vect_scaler(vect_subtract(_target,position),max_speed);
var _desired_velocity = vect_subtract(_target,position);
var _distance = vect_len(_desired_velocity);

var strikeDuration = -150;

if canstrike > 0 {
    if(_distance < _slow_radius) { //Inside strike radius
        doStrike = 1;
        endStrikeTimer = strikeDuration;
        canstrike = -320;
    }
} else {
    canstrike += 1;
    my_color = c_ltgray;
}

if doStrike {
    max_speed = max_speed_strike;
    max_force = lerp(max_force,max_force_strike,.5);
    _desired_velocity = vect_multr(vect_norm(_desired_velocity), max_speed);
    my_color = merge_color(c_red,c_white,sin(objectAge*.4));

    if endStrikeTimer > 0 doStrike = false;
    endStrikeTimer += 1;
} else { // Outside slowing radius
    max_speed = lerp(max_speed,max_speed_normal,.1);
    max_force = lerp(max_force,max_force_normal,.01);
    _desired_velocity = vect_multr(vect_norm(_desired_velocity), max_speed);

    if canstrike < 1 {
        my_color = c_ltgray;
        canstrike += 1;
    } else {
        my_color = c_white;
    }
}

/*
if(_distance < _slow_radius) { //Inside strike radius
    //_desired_velocity = vect_multr(vect_norm(_desired_velocity), (max_speed) * (_distance / _slow_radius));
    max_speed = max_speed_strike;
    max_force = lerp(max_force,max_force_strike,.5);
    _desired_velocity = vect_multr(vect_norm(_desired_velocity), max_speed);
    my_color = merge_color(c_red,c_white,sin(objectAge*.2));
} else { // Outside slowing radius
    max_speed = max_speed_normal;
    max_force = lerp(max_force,max_force_normal,.01);
    _desired_velocity = vect_multr(vect_norm(_desired_velocity), max_speed);

    if canstrike < 1 {
        my_color = c_ltgray;
        canstrike += 1;
    } else {
        my_color = c_white;
    }
}
*/

return (vect_multr(vect_subtract(_desired_velocity,velocity),_weight));
