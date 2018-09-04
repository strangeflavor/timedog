#define makeTurret
///makeTurret(id,xOffset,yOffset)
var _id = argument0;
var xx = argument1;
var yy = argument2;

turret[_id,0] = xx;
turret[_id,1] = yy;

#define getTurretX
///getTurretX(id)

return x+turret[argument0,0];

#define getTurretY
///getTurretY(id)

return y+turret[argument0,1];
#define make_bhpg_turret
///make_bhpg_turret(id)

bhpg_turret[argument0] = make(obj_bhpg_turret);
bhpg_turret[argument0].parent = id;

return bhpg_turret[argument0]