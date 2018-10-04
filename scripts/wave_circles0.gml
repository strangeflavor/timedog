var _count = argument0;
var _heights;

if _count <= 1 {
    form_circles();
} else {
    switch _count {
        case 2:
            if irandom(1) == 0 {
                _heights[0] = 120;
                _heights[1] = 60;
            } else {
                _heights[0] = 60;
                _heights[1] = 120;
            }

            form_circles(0,-irandom(7)*10,-1,-1,_heights[0]);
            form_circles(30,irandom(7)*10,-1,-1,_heights[1]);
        break;
        case 3:
        break;
    }
}
