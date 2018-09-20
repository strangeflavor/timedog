///smokeTrail

if objectAge mod 5 == 0 {
    repeat(1) {
        //with instance_create(x,y+lengthdir_y(-48,other.direction)+nrandom(8),Smoke) {
        //with instance_create(x+nrandom(4),y+nrandom(8),Smoke) {
        with instance_create(x+lengthdir_x(-50,direction),y+lengthdir_y(-50,direction),Smoke) {
            depth = other.depth - 1;
            friction = 0;
            motion_add(other.direction,3+nrandom(4));

            image_speed *= .4;
            image_xscale = choose(.5,1);
            image_yscale = image_xscale;
        }
    }
}
