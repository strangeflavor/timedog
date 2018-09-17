///smokeTrail
if objectAge mod 6 == 0 {
    repeat(2) {
        with instance_create(x+nrandom(4),y+nrandom(4),Smoke) {
            friction = 0;
            motion_add(other.direction+nrandom(10),1+nrandom(4));

            image_speed *= .5;
            image_xscale = choose(.5,1);
            image_yscale = image_xscale;
        }
    }
}
