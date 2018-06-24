#define bezTest
cpX[0] = 480; cpY[0] = 545;
cpX[1] = 326; cpY[1] = 526;
cpX[2] = 305; cpY[2] = 409;
cpX[3] = 328; cpY[3] = 296;

cpX[4] = 331; cpY[4] = 293;
cpX[5] = 336; cpY[5] = 178;
cpX[6] = 477; cpY[6] = 193;
cpX[7] = 462; cpY[7] = 309;

cpX[8] = 463; cpY[8] = 312;
cpX[9] = 408; cpY[9] = 427;
cpX[10] = 187; cpY[10] = 280;
cpX[11] = 258; cpY[11] = 149;

#define createBezierControlPoints
///create control points
/*
cp0 = make(controlPoint);
cp1 = make(controlPoint);
cp2 = make(controlPoint);
cp3 = make(controlPoint);
cp0.image_blend = image_blend;
cp1.image_blend = image_blend;
cp2.image_blend = image_blend;
cp3.image_blend = image_blend;
*/

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

        /*
        cpID[i].image_blend = draw_set_color(merge_color(bezColors[myNumber],c_white,1*.05));
        cpID[i+1].image_blend = draw_set_color(merge_color(bezColors[myNumber],c_white,1*.05));
        cpID[i+2].image_blend = draw_set_color(merge_color(bezColors[myNumber],c_white,2*.05));
        cpID[i+3].image_blend = draw_set_color(merge_color(bezColors[myNumber],c_white,3*.05));
        */
        
        totalLength += 1;
    }
}

cpIndex = 0;

/*
cpIndex += 1;
if cpIndex > cpMax cpIndex = 0;

cp0.x = cp0X[cpIndex];
cp0.y = cp0Y[cpIndex];
cp1.x = cp1X[cpIndex];
cp1.y = cp1Y[cpIndex];
cp2.x = cp2X[cpIndex];
cp2.y = cp2Y[cpIndex];
cp3.x = cp3X[cpIndex];
cp3.y = cp3Y[cpIndex];
*/

#define addBezPoint
