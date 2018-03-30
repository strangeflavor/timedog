#define doPlayerAttacks
///doPlayerAttacks()

if attacking {
    switch weapon {
        // rapid
        case 1:
            normalShot(1,1);
        break;
        // triple
        case 2:
            normalShot(2,.6);
            tripleShot(2,.4);
        break;
        case -1:        // de-shielded
        case 0:
        case 3:        // bomb
        case 4:         // shield
            normalShot(2,1);
        break;
    }
}

#define normalShot
///normalShot(rate,damage)
var rate = argument0;
var damage = argument1;

var shotID,yo;
yo = 40;

if canFire >= 1 {
    shotID = make(x,y-yo,oShot);
    shotID.damage = damage;
    canFire = -rate*scale;

    if weapon == 1 { // rapid
        shotID = make(x,y,oShot);
        shotID.damage = damage;
        canFire = -rate*scale;
    }
} else {
    canFire += 1;
}

#define tripleShot
///normalShot(rate,damage)
var rate = argument0;
var damage = argument1;

var shotID;

if canFireTriple >= 1 {
    shotID = make(x-24,y+32*scale,oShot);
    shotID.direction = 60;
    shotID.image_angle = shotID.direction-90;
    shotID.damage = damage;

    shotID = make(x+24,y+32*scale,oShot);
    shotID.damage = damage;
    shotID.direction = 120;
    shotID.image_angle = shotID.direction-90;

    canFireTriple = -rate*scale;
} else {
    canFireTriple += 1;
}
