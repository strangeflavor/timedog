#define shoot_circle
///shoot_circle(density,x,y,radius,object,target,speed,imageaim);
// written by S20-TBL

var density,origin_x,origin_y,obj_dist,b_type,target,b_speed,imageaim;
density = argument0;  // controls the density of the circle pattern, in degrees
origin_x = argument1; // x coordinate of the bullet's origin
origin_y = argument2; // y coordinate of the bullet's origin
obj_dist = argument3; // distance from object at which bullet will be created
b_type = argument4;   // bullet object to be created
target = argument5;   // target object the bullet is supposed to aim at
b_speed = argument6;  // bullet speed
imageaim = argument7; // whether to set image_angle to direction or not

var _x, _y, bullet;
for (i=0; i<360; i+=density)   // controls the density of the bullet ring; smaller numbers mean tighter patterns
    {
    _x = origin_x + lengthdir_x(obj_dist, i);   // distance from the origin at which the bullet will spawn
    _y = origin_y + lengthdir_y(obj_dist, i);
    _bullet = instance_create(_x, _y, b_type);
    _bullet.direction = point_direction(x,y,target.x,target.y)+i;
    _bullet.speed = b_speed;   // a negative value will make the bullet go towards the origin of the object firing it
    if imageaim = 1 then _bullet.image_angle=_bullet.direction;
    }

#define shoot_circle2
///shoot_circle2(density,x,y,radius,object,speed,sprite,imageaim);
// written by S20-TBL
//this is for 360 attacks that aren't supposed to be aimed.

var density,origin_x,origin_y,obj_dist,b_type,b_speed,b_sprite,imageaim;
density = argument0;  // controls the density of the circle pattern, in degrees
origin_x = argument1; // x coordinate of the bullet's origin
origin_y = argument2; // y coordinate of the bullet's origin
obj_dist = argument3; // distance from object at which bullet will be created
b_type = argument4;   // bullet object to be created
b_speed = argument5;  // bullet speed
b_sprite = argument6;
imageaim = argument7; // whether to set image_angle to direction or not

var _x, _y, bullet;
for (i=0; i<360; i+=density)  // controls the density of the bullet ring; smaller numbers mean tighter patterns
    {
    _x = origin_x + lengthdir_x(obj_dist, i);   
    _y = origin_y + lengthdir_y(obj_dist, i);
    // ^^ distance from the origin at which the bullet will spawn
    
    // negative speed value will make bullet go towards origin of object firing it
    _bullet = instance_create(_x, _y, b_type);
    _bullet.sprite_index = b_sprite;
    _bullet.speed = b_speed; 
    _bullet.direction = i;
    if imageaim = 1 then _bullet.image_angle = i;
    }

#define shoot_spread
///shoot_spread(originx,originy,bullettype,shootsound,arc,numbullets,bulletspeed)
/*
Aimed bullet spread shot script
by Alluro
    
Function:
Shoots an arc of bullets aimed at the player.
    
Usage:
aimedspreadshot(origin_x,origin_y,bullettype,shootsound,arc,numbullets,bulletspeed)
        
Arguments:
originx,     : the x/y location where the shot will originate
originy
bullettype   : the bullet OBJECT to shoot
shootsound   : the sound to play when shooting (-1 plays no sound)
arc          : arc (in degrees) the spread will cover
numbullets   : the number of bullets in the spread
bulletspeed  : the speed the bullets will travel
        
Returns:
none
*/

//Variables from arguments
origin_x    = argument0
origin_y    = argument1
bullettype  = argument2
shootsound  = argument3
arc         = argument4
numbullets  = argument5
bulletspeed = argument6
imagedir    = argument7

//Get direction to shoot (from origin to player)
shootdir   = point_direction (origin_x, origin_y, obj_hitbox.x, obj_hitbox.y)

if numbullets > 1
    arcstart   = (shootdir - (arc / 2))
else
    arcstart   = shootdir
    
//play shoot sound (-1 plays no sound)
if shootsound >= 0
    {
    sound_stop(shootsound)
    sound_play(shootsound)
    }

for (bulletloop = 0; bulletloop < numbullets; bulletloop += 1)
    {
    mybullet = instance_create (origin_x, origin_y, bullettype)
    mybullet.direction = arcstart
    mybullet.speed = bulletspeed
    
    if imagedir = 1
        mybullet.image_angle = arcstart
    
    if numbullets > 1
        arcstart += arc / (numbullets - 1)
    }

