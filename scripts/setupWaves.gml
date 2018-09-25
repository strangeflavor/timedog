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

script_execute(_waveScript);

make(waveListener);
