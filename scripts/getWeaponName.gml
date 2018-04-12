#define getWeaponName
var textArray;
for (var i=0;i<32;i+=1) textArray[i] = 'NONE';

textArray[0] = 'nothing';
textArray[1] = 'RAPID';
textArray[2] = 'TRI-BEAM';
textArray[3] = 'BOMB';
textArray[4] = 'SHIELD';

return textArray[argument0];

#define getWeaponCost
var costArray;
for (var i=0;i<32;i+=1) costArray[i] = 420;

costArray[0] = -1;
costArray[1] = 64;
costArray[2] = 333;
costArray[3] = 100;
costArray[4] = 1000;

return costArray[argument0];

#define getWeaponUnlock
///getWeaponUnlock()

switch argument0 {
    case 1:
        return WEAPON_rapid;
    break;
    case 2:
        return WEAPON_tribeam;
    break;
    case 3:
        return WEAPON_bomb;
    break;
    case 4:
        return WEAPON_shield;
    break;
    case 5:
        return WEAPON_warp;
    break;
}

#define setWeaponUnlock
///setWeaponUnlock(weaponindex)
// unlock weapon
switch argument0 {
    case 1:
        WEAPON_rapid = true;
    break;
    case 2:
        WEAPON_tribeam = true;
    break;
    case 3:
        WEAPON_bomb = true;
    break;
    case 4:
        WEAPON_shield = true;
    break;
}