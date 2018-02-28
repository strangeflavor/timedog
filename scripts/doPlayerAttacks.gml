#define doPlayerAttacks
///doPlayerAttacks()

if attacking {
    switch weapon {
        // rapid
        case 1:
            normalShot(1,.7);
        break;
        // triple
        case 2:
            normalShot(12,1);
        break;
        // bomb
        case 3:
            normalShot(6,1);
        break;
    }
}

#define normalShot
///normalShot(rate,damage)
var rate = argument0;
var damage= argument1;

var shotID;

if canFire >= 1 {
    shotID = make(x,y-16*scale,oShot);
    shotID.damage = damage;
    canFire = -rate*scale;
} else {
    canFire += 1;
}
