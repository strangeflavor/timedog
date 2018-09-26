#define setupWaves
waveCount = 0;
wavesArray[128,16] = -1;

#define addWave
///addWave(script,optional,arguments,go,here)
var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

for (var j=0;j<16;j+=1) {    
    wavesArray[waveCount,j] = arg[j];
}

waveCount += 1;

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

make(waveListener);
