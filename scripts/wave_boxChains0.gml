#define wave_boxChains0
var _count = argument0;

if _count <= 0 {
    form_boxChains0();
} else {
    var h1, h2; h1 = choose(140,270); if h1 == 140 h2 = 270 else h2 = 140;

    form_boxChains0(-1,choose(-60,-30,0,30,60),h1);
    form_boxChains0(15,choose(90,120,150,180,210),h2);
}

#define wave_boxChains1
///wave_boxChains1
form_boxChains_Descent();