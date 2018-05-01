/// shoot_spray(turret,rate,sprite);

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var xoffset = arg[0];
if xoffset == -1 xoffset = 0;


var _turret = arg[0];
var rate = arg[1];
shoot_spray_speed = arg[2];
_sprite = arg[3];

bullet_direction = 270+irandom(50)-25;

if objectAge mod rate == 0 {
    with make(getTurretX(_turret),getTurretY(_turret),oBullet) {
        direction = other.bullet_direction;
        speed = other.shoot_spray_speed;
        sprite_index = other._sprite;
        image_index = irandom(360);
    }
    fired += 1;
}
