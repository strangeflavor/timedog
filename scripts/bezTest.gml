#define bezTest
add_bez_index = 0;

addBezPoint(480,545);
addBezPoint(326,526);
addBezPoint(325,417);
addBezPoint(328,296);

addBezPoint(328,296);
addBezPoint(336,178);
addBezPoint(477,193);
addBezPoint(462,309);

addBezPoint(462,309);
addBezPoint(408,427);
addBezPoint(172,323);
addBezPoint(192,238);

#define bezData
var bezType = argument0;
    add_bez_index = 0;

switch bezType {
    case 'test':
        addBezPoint(480,545);
        addBezPoint(326,526);
        addBezPoint(325,417);
        addBezPoint(328,296);
        
        addBezPoint(328,296);
        addBezPoint(336,178);
        addBezPoint(477,193);
        addBezPoint(462,309);
        
        addBezPoint(462,309);
        addBezPoint(408,427);
        addBezPoint(172,323);
        addBezPoint(192,238);
    break;
    case 'arch':
        addBezPoint(5,282);
        addBezPoint(136,322);
        addBezPoint(172,217);
        addBezPoint(158,148);
        
        addBezPoint(160,123);
        addBezPoint(161,46);
        addBezPoint(317,50);
        addBezPoint(332,132);
        
        addBezPoint(331,156);
        addBezPoint(314,234);
        addBezPoint(373,328);
        addBezPoint(472,305);
    break;
    case 'corkscrew':
        addBezPoint(68,9);
        addBezPoint(56,245);
        addBezPoint(89,417);
        addBezPoint(242,434);

        addBezPoint(261,434);
        addBezPoint(401,371);
        addBezPoint(359,195);
        addBezPoint(231,235);

        addBezPoint(207,253);
        addBezPoint(139,464);
        addBezPoint(496,426);
        addBezPoint(424,11);
    break;
}

#define createBezierControlPoints
///create control points

for (var i=0;i<64;i+=4) {
    if cpX[i] != -1 {
        cpID[i] = make(controlPoint);
        cpID[i+1] = make(controlPoint);
        cpID[i+2] = make(controlPoint);
        cpID[i+3] = make(controlPoint);

        cpID[i].x = cpX[i]; cpID[i].y = cpY[i];
        cpID[i+1].x = cpX[i+1]; cpID[i+1].y = cpY[i+1];
        cpID[i+2].x = cpX[i+2]; cpID[i+2].y = cpY[i+2];
        cpID[i+3].x = cpX[i+3]; cpID[i+3].y = cpY[i+3];

        totalLength += 1;
    }
}

cpIndex = 0;

#define addBezPoint
cpX[add_bez_index] = argument0;
cpY[add_bez_index] = argument1;

add_bez_index += 1;