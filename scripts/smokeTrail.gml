///smokeTrail
if (live_call()) return live_result;

if objectAge mod 5 == 0 {
    repeat(2) {
        
        with instance_create(x+nrandom(12),y+lengthdir_y(-24,other.direction)+nrandom(7),Smoke) {
            friction = 0;
            motion_add(other.direction+nrandom(5),3+nrandom(4));

            image_speed *= .4;
            image_xscale = choose(.5,1);
            image_yscale = image_xscale;
        }
    }
}
