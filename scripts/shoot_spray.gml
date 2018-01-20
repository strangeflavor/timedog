///shoot_fan(turret,rate)
var _turret = argument0;
var rate = argument1;

bullet_direction = 270+irandom(50)-25;

if objectAge mod argument1 == 0 {
    with make(getTurretX(_turret),getTurretY(_turret),oBullet) {
        direction = other.bullet_direction;
        speed = choose(3,3,4,4,5,6);
    }
}
