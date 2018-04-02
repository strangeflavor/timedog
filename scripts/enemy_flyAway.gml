#define enemy_flyAway
///enemy_flyAway(wait,direction)
speed = argument0;
if formationStartX < room_width/2 direction = 180 else direction = 0;

#define enemy_move_rotate
///enemy_move_rotate(destx,desty,speed,amount);

/// rotate_toward( angle, speed )
/*
var target_angle = argument[0];


image_angle += min(sign(angle_difference(image_angle, target_angle) * rotation_speed), angle_difference(image_angle, target_angle));
*/
var destx = x+argument[0];
var desty = y+argument[1];
var _speed = argument[2];
var _rotation_speed = argument[3];

var target_angle = point_direction(x,y,destx,desty);
target_angle = angle_difference(direction,target_angle) * _rotation_speed;

direction -= min(abs(target_angle), _rotation_speed) * sign(target_angle);
speed = _speed;
image_angle = direction;

#define enemy_move
///enemy_move(direction, speed, wiggleAmplitude)
// moves in a direction at a speed

var dir = argument0;
var spd = argument1;
if dir == -1 dir = 270;
if spd == -1 spd = 8;

if path_index != -1 path_end();
var _wiggleAmplitude = argument2;

direction = dir + _wiggleAmplitude*sin(objectAge*.1);
speed = spd;

#define enemy_stop
///enemy_stop()
// to do: friction

speed = 0;

#define enemy_steering
///enemy_steering(destx,desty,max_speed);
var _destx = argument0;
var _desty = argument1;
var _max_speed = argument2;
var _max_force = argument3;

_max_force = .1;
_max_speed = 4;

// reset steering
steering = vect2(0,0);

//steering = vect_add(steering, _destx, _desty, 1);
steering = vect_add(steering, sb_seek(_destx, _desty, 1));

//Limit steering by max_force
steering = vect_truncate(steering, _max_force); 

// Limit velocity to max_speed
velocity = vect_truncate(vect_add(velocity, steering),_max_speed); 

//Add velocity to position
position = vect_add(position, velocity);

//update xy
x = position[1];
y = position[2];

image_angle = vect_direction(velocity);
direction = vect_direction(velocity);

#define enemy_steering_player
///enemy_steering_player(max_speed,max_force);
//sb_seek_arrive(oShip.x,oShip.y,64,1);

var _destx = x;
var _desty = y; 
var _max_speed = argument0;
var _max_force = argument1;

if _max_speed == -1 _max_speed = max_speed else max_speed = _max_speed;
if _max_force == -1 _max_force = max_force else max_force = _max_force;

if instance_exists(oShip) {
    _destx = oShip.x;
    _desty = oShip.y;
}

// reset steering
steering = vect2(0,0);

//steering = vect_add(steering, _destx, _desty, 1);
steering = vect_add(steering, sb_seek(_destx, _desty, 1));
//steering = vect_add(steering, sb_seek_arrive(_destx, _desty, 64, .1));

//Limit steering by max_force
steering = vect_truncate(steering, _max_force); 

// Limit velocity to max_speed
velocity = vect_truncate(vect_add(velocity, steering),_max_speed); 

//Add velocity to position
position = vect_add(position, velocity);

//update xy
x = position[1];
y = position[2];

image_angle = vect_direction(velocity);
direction = vect_direction(velocity);

#define enemy_move_formation

#define enemy_FireAtPlayer
///enemy_FireAtPlayer

// fires toward player
var _turret = argument0;

if phaseArguments[currentPhase,1] > 0 {
    with make(getTurretX(_turret),getTurretY(_turret),oBullet) {
        direction = point_direction(x,y,oShip.x,oShip.y);
        speed = 5;
    }

    phaseArguments[currentPhase,1] -= 1;
}

#define enemy_FireInDirection
///enemy_FireInDirection()
// fires in the direction the enemy is facing
var arg;
for (var i = 0; i < 16; i += 1;) {
    if argument_count > i
       {
       arg[i] = argument[i];
       }
    else
       {
       arg[i] = -1;
       }
}

var _turret = arg[0];
//var _rounds = arg[1];
var _direction = arg[2];
if _direction == -1 _direction = direction;

if phaseArguments[currentPhase,1] > 0 {
    var numShots = 3;
    with make(getTurretX(_turret),getTurretY(_turret),oBullet) {
        direction = _direction;
        speed = 5;
    }

    if numShots == 3 {
        with make(getTurretX(_turret),getTurretY(_turret),oBullet) {
            direction = _direction-30;
            speed = 5;
        }

        with make(getTurretX(_turret),getTurretY(_turret),oBullet) {
            direction = _direction+30;
            speed = 5;
        }
    }

    phaseArguments[currentPhase,1] -= 1;
}

#define enemy_orbit
///enemy_orbit(radius,speed,xbend,ybend,movedirection,movespeed)
if cx == -1 {
    //Orbit = argument0; // Orbit distance
    Orbit = 0;
    Speed = argument1; // Orbital speed

    cx = x;
    cy = y;
}

if Orbit < argument0 Orbit += 1;

//var vx,vy;
var xbend = argument2;
var ybend = argument3;

if xbend == -1 xbend = 1;
if ybend == -1 ybend = 1;

var movedirection = argument4;
var movespeed = argument5;

// Orbital motion
Angle += Speed;
if(abs(Angle) >= 360) Angle = 0;

// Update position
x = lengthdir_x(Orbit*xbend, Angle) + cx;
y = lengthdir_y(Orbit*ybend, Angle) + cy;

// move center point
if movedirection != -1 {
    vx = lengthdir_x(movespeed, movedirection);
    vy = lengthdir_y(movespeed, movedirection);

    cx += vx;
    cy += vy;
}

#define enemy_move_patrol
///enemy_move(direction, speed, wiggleAmplitude)
// moves in a direction at a speed

var dir = argument0;
var spd = argument1;
if dir == -1 dir = 270;
if spd == -1 spd = 8;

if path_index != -1 path_end();
var _wiggleAmplitude = argument2;

if x + sprite_width/2 > vw speed_sign = -1;
if x - sprite_width/2 < 0 speed_sign = 1;

direction = dir + _wiggleAmplitude*sin(objectAge*.1);
speed = spd*speed_sign;