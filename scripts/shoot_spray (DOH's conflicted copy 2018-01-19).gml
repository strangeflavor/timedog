///shoot_fan(turret,rate,speed)

var arg;
for (var i = 0; i < 16; i += 1;)
   {
   if argument_count > i
      {
      arg[i] = argument[i];
      }
   else
      {
      arg[i] = -1;
      }
   }

var xx,yy;
var _turret = arg[0];
if _turret == -1 {
    xx = x;
    yy = y;
} else {
    xx = getTurretX(_turret);
    yy = getTurretY(_turret);
}

var rate = arg[1];
if rate == -1 rate = 3;

var _speed = arg[2];
if _speed == -1 _speed = choose(3,3,4,4,5,6);

bullet_direction = 270+irandom(50)-25;

var _bulletID;

if objectAge mod rate == 0 {
    _bulletID = make(xx,yy,oBullet);
    _bulletID.direction = bullet_direction;
    _bulletID.speed = _speed;

}
