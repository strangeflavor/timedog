#define setupWaves
waveCount = -1;
for (var i=0; i<128; i+=1) {
    wavesArray[i,0] = -1;
    wavesArray2[i,0] = -1;
    hastenArray[i] = 0;
}

#define addWave
///addWave(script,optional,arguments,go,here)
waveCount += 1; // need to increment this before adding wave, since addWave2 uses the same index

var arg;

for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

for (var j=0;j<16;j+=1) {    
    wavesArray[waveCount,j] = arg[j];
}

#define addWave2
///addWave(script,optional,arguments,go,here)
var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

for (var j=0;j<16;j+=1) {    
    wavesArray2[waveCount,j] = arg[j];
}

#define readWave
///readWave
var _waveIndex = argument0;
var _waveScript = wavesArray[_waveIndex,0];
var _arg;
arg[1] = wavesArray[_waveIndex,1];
arg[2] = wavesArray[_waveIndex,2];
arg[3] = wavesArray[_waveIndex,3];
arg[4] = wavesArray[_waveIndex,4];
arg[5] = wavesArray[_waveIndex,5];
arg[6] = wavesArray[_waveIndex,6];
arg[7] = wavesArray[_waveIndex,7];
arg[8] = wavesArray[_waveIndex,8];
arg[9] = wavesArray[_waveIndex,9];
arg[10] = wavesArray[_waveIndex,10];
arg[11] = wavesArray[_waveIndex,11];
arg[12] = wavesArray[_waveIndex,12];
arg[13] = wavesArray[_waveIndex,13];
arg[14] = wavesArray[_waveIndex,14];
arg[15] = wavesArray[_waveIndex,15];

script_execute(_waveScript,arg[1],arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10],arg[11],arg[12],arg[13],arg[14],arg[15]);

// if wavesArray2 has a script assigned to it, create that wave as well
_waveScript = wavesArray2[_waveIndex,0];
if _waveScript > -1 {
    arg[1] = wavesArray2[_waveIndex,1];
    arg[2] = wavesArray2[_waveIndex,2];
    arg[3] = wavesArray2[_waveIndex,3];
    arg[4] = wavesArray2[_waveIndex,4];
    arg[5] = wavesArray2[_waveIndex,5];
    arg[6] = wavesArray2[_waveIndex,6];
    arg[7] = wavesArray2[_waveIndex,7];
    arg[8] = wavesArray2[_waveIndex,8];
    arg[9] = wavesArray2[_waveIndex,9];
    arg[10] = wavesArray2[_waveIndex,10];
    arg[11] = wavesArray2[_waveIndex,11];
    arg[12] = wavesArray2[_waveIndex,12];
    arg[13] = wavesArray2[_waveIndex,13];
    arg[14] = wavesArray2[_waveIndex,14];
    arg[15] = wavesArray2[_waveIndex,15];

    script_execute(_waveScript,arg[1],arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10],arg[11],arg[12],arg[13],arg[14],arg[15]);
}

var listener = make(waveListener);
listener.hasten = hastenArray[_waveIndex];

#define hastenWave
///hastenWave(numEnemies)



