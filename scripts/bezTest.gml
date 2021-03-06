#define bezTest
var size = argument0;

add_bez_index = 0;

addBezPoint(140,240);
addBezPoint(140,280);
addBezPoint(140,320);
addBezPoint(140,360);

if size > 0 {
    addBezPoint(190,240);
    addBezPoint(190,280);
    addBezPoint(190,320);
    addBezPoint(190,360);

    if size > 1 {    
        addBezPoint(290,240);
        addBezPoint(290,280);
        addBezPoint(290,320);
        addBezPoint(290,360);

        if size > 2 {        
            addBezPoint(340,240);
            addBezPoint(340,280);
            addBezPoint(340,320);
            addBezPoint(340,360);
        }
    }
}

#define bezTest_single
add_bez_index = 0;

addBezPoint(140,240);
addBezPoint(140,280);
addBezPoint(140,320);
addBezPoint(140,360);

#define bezData
var bezType = argument0;
add_bez_index = 0;

switch bezType {
    case 'w':
        addBezPoint(26,-2);
        addBezPoint(15,168);
        addBezPoint(72,203);
        addBezPoint(144,138);
        addBezPoint(149,136);
        addBezPoint(205,126);
        addBezPoint(153,223);
        addBezPoint(241,228);
        addBezPoint(239,228);
        addBezPoint(327,223);
        addBezPoint(275,126);
        addBezPoint(331,136);
        addBezPoint(336,138);
        addBezPoint(408,203);
        addBezPoint(465,168);
        addBezPoint(454,-2);
    break;
    case '1 wide sine':
        addBezPoint(4,210);
        addBezPoint(176,350);
        addBezPoint(317,114);
        addBezPoint(474,205);
    break;
    case 'low arc':
        addBezPoint(61,37);
        addBezPoint(10,252);
        addBezPoint(81,346);
        addBezPoint(108,391);
        addBezPoint(111,392);
        addBezPoint(167,473);
        addBezPoint(181,457);
        addBezPoint(235,463);
        addBezPoint(245,463);
        addBezPoint(299,457);
        addBezPoint(313,473);
        addBezPoint(369,392);
        addBezPoint(372,391);
        addBezPoint(399,346);
        addBezPoint(470,252);
        addBezPoint(419,37);
    break;
    case 'bez spiral':
        addBezPoint(42,3);
        addBezPoint(54,355);
        addBezPoint(262,320);
        addBezPoint(306,230);
        addBezPoint(306,228);
        addBezPoint(347,76);
        addBezPoint(173,38);
        addBezPoint(148,139);
        addBezPoint(147,138);
        addBezPoint(132,310);
        addBezPoint(342,225);
        addBezPoint(247,134);
        addBezPoint(245,133);
        addBezPoint(120,122);
        addBezPoint(234,240);
        addBezPoint(228,168);
    break;
    case 'curve away up right':
        addBezPoint(-27,280);
        addBezPoint(79,112);
        addBezPoint(102,390);
        addBezPoint(181,224);

        addBezPoint(178,224);
        addBezPoint(221,-18);
        addBezPoint(351,269);
        addBezPoint(459,-29);
    break;
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

        addBezPoint(159,149);
        addBezPoint(161,46);
        addBezPoint(317,50);
        addBezPoint(329,149);

        addBezPoint(327,148);
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
///createBezierControlPoints(_xoffset);
//var _xoffset = argument0;
var _xoffset = 0;
if argument_count > 0 _xoffset = argument[0];

for (var i=0;i<64;i+=4) {
    if cpX[i] != -1 {
        cpID[i] = make(controlPoint);
        cpID[i+1] = make(controlPoint);
        cpID[i+2] = make(controlPoint);
        cpID[i+3] = make(controlPoint);

        cpID[i].myBezier = id;
        cpID[i+1].myBezier = id;
        cpID[i+2].myBezier = id;
        cpID[i+3].myBezier = id;

        cpID[i].x = cpX[i] + _xoffset;
        cpID[i].y = cpY[i];

        cpID[i+1].x = cpX[i+1] + _xoffset;
        cpID[i+1].y = cpY[i+1];
        
        cpID[i+2].x = cpX[i+2] + _xoffset;
        cpID[i+2].y = cpY[i+2];

        cpID[i+3].x = cpX[i+3] + _xoffset;
        cpID[i+3].y = cpY[i+3];

        totalLength += 1;
    }
}

cpIndex = 0;

#define addBezPoint
cpX[add_bez_index] = argument0;
cpY[add_bez_index] = argument1;

if read_data_hmirror cpX[add_bez_index] = vw - cpX[add_bez_index];

add_bez_index += 1;