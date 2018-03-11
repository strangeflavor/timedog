///shoot_fan(turret,rate,speed)
var _turret = argument0;
var rate = argument1;
shoot_spray_speed = argument2;

bullet_direction = 270+irandom(50)-25;

if objectAge mod argument1 == 0 {
    with make(getTurretX(_turret),getTurretY(_turret),oBullet) {
        direction = other.bullet_direction;
        speed = other.shoot_spray_speed;
    }
    fired += 1;
}
