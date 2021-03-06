#define pg_addFormation
///pg_addFormation(space,duration,script,arg1,arg2,arg3,arg4,arg5)

var arg;
for (var i = 0; i < 16; i += 1;) {
    if argument_count > i
       {
       arg[i] = argument[i];
       }
    else
       {
       arg[i] = -1;
       }
}

pg_count += 1;
pg_formationArray[pg_count,0] = arg[0]; // space
pg_formationArray[pg_count,1] = arg[1]; // duration
pg_formationArray[pg_count,2] = arg[2]; // script
pg_formationArray[pg_count,3] = arg[3]; // arg1
pg_formationArray[pg_count,4] = arg[4]; // arg2
pg_formationArray[pg_count,5] = arg[5]; // arg3
pg_formationArray[pg_count,6] = arg[6]; // arg4
pg_formationArray[pg_count,7] = arg[7]; // arg5

/*
formationIndex+=1;

// fill array with junk to prevent the game from thinking we've destroyed the entire formation before all the enemies have spawned
for (i=0;i<50;i+=1) {
    formationArray[formationIndex,i] = 1;
}
*/


#define pg_getFormation
///pg_getFormation()

return irandom(pg_count);

#define pg_makeFormationScriptArray
var f = 0;

formScriptArray[f] = form_bez1;
f+=1;
formScriptArray[f] = form_bez2;
f+=1;
formScriptArray[f] = form_bez3;
f+=1;
formScriptArray[f] = form_bez4;
f+=1;
formScriptArray[f] = form_meteors;
f+=1;
formScriptArray[f] = form_boxChains0;
f+=1;
formScriptArray[f] = form_boxChains_Descent;
f+=1;
formScriptArray[f] = form_line;
f+=1;
formScriptArray[f] = form_orbit;
f+=1;
formScriptArray[f] = form_orbit_doubler;
f+=1;
formScriptArray[f] = form_orbit_expanding;
f+=1;
formScriptArray[f] = form_gridMissile;
f+=1;
formScriptArray[f] = form_curvedLeft;
f+=1;
formScriptArray[f] = form_curvedRight;
f+=1;
formScriptArray[f] = form_beamCannon;
f+=1;
formScriptArray[f] = form_simplesine;
f+=1;
formScriptArray[f] = form_fireAtPlayer;
f+=1;
formScriptArray[f] = form_multiShot;
f+=1;
formScriptArray[f] = form_crab;
f+=1;
formScriptArray[f] = form_circles;
f+=1;
formScriptArray[f] = form_invaders;
f+=1;
formScriptArray[f] = form_corkscrew;
f+=1;
formScriptArray[f] = form_arch;
f+=1;
formScriptArray[f] = form_missiles;
f+=1;
formScriptArray[f] = form_steerTowardPlayer;
f+=1;
formScriptArray[f] = form_diagWave;
f+=1;
formScriptArray[f] = form_bezSpiral;
f+=1;
formScriptArray[f] = form_bezWideSine;
f+=1;
formScriptArray[f] = wave_sines0;
f+=1;
formScriptArray[f] = form_mirror;
f+=1;
formScriptArray[f] = form_2mirror;

return f;

#define pg_makeBossScriptArray
var f = 0;

formBossScriptArray[f] = oMidBoss;
f+=1;
formBossScriptArray[f] = oMerchant;
f+=1;
formBossScriptArray[f] = oSkullKing;
f+=1;
formBossScriptArray[f] = oBattleship;
f+=1;
formBossScriptArray[f] = oOceanCreep;
f+=1;
formBossScriptArray[f] = oMantaBoss;
return f;