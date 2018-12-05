#define makeTurret
///makeTurret(id,xOffset,yOffset)
var _id = argument0;
var xx = argument1;
var yy = argument2;

turret[_id,0] = xx;
turret[_id,1] = yy;

#define getTurretX
///getTurretX(id)

var radialOffset = 0;
if turret_is_radial == true radialOffset = lengthdir_x(sprite_width/2,direction);


return x+turret[argument0,0]+radialOffset;

#define getTurretY
///getTurretY(id)

var radialOffset = 0;
if turret_is_radial == true radialOffset = lengthdir_y(sprite_height/2,direction);

return y+turret[argument0,1]+radialOffset;

#define getTurretRadialX
///getTurretRadialX(id)

return x+turret[argument0,0]+lengthdir_x(sprite_width/2,direction);

#define getTurretRadialY
///getTurretRadialY(id)

return y+turret[argument0,1]+lengthdir_y(sprite_height/2,direction);

#define make_bhpg_turret
///make_bhpg_turret(id)

bhpg_turret[argument0] = make(obj_bhpg_turret);
bhpg_turret[argument0].parent = id;

return bhpg_turret[argument0]