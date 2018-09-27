#define wave_boxChains0
var _count = argument0;
var _heights;

if _count <= 1 {
    form_boxChains0();
} else {
    switch _count {
        case 2:
            _heights[0] = choose(140,270); if _heights[0] == 140 _heights[1] = 270 else _heights[1] = 140;
            form_boxChains0(-1,choose(-60,-30,0,30,60),h1);
            form_boxChains0(15,choose(90,120,150,180,210),h2);
        break;
        case 3:
            var heights_ds = ds_list_create();
            ds_list_add(heights_ds,100);
            ds_list_add(heights_ds,210);
            ds_list_add(heights_ds,320);
            ds_list_shuffle(heights_ds);

            _heights[0] = ds_list_find_value(heights_ds,0);
            _heights[1] = ds_list_find_value(heights_ds,1);
            _heights[2] = ds_list_find_value(heights_ds,2);

            form_boxChains0(-1,choose(-60,-30,0,30,60),_heights[0]);
            form_boxChains0(12,choose(90,120,150,180,210),_heights[1]);
            form_boxChains0(24,choose(-60,-30,0,30,60,90,120,150,180,210),_heights[2]);

            ds_list_destroy(heights_ds);
        break;
    }
}

#define wave_boxChains1
///wave_boxChains1
form_boxChains_Descent();