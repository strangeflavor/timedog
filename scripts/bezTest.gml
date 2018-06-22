#define bezTest
//var yo = argument0;
/*
cp0X[0] = 480; cp0Y[0] = 545;
cp1X[0] = 326; cp1Y[0] = 526;
cp2X[0] = 305; cp2Y[0] = 409;
cp3X[0] = 328; cp3Y[0] = 296;

cp0X[1] = 331; cp0Y[1] = 293;
cp1X[1] = 336; cp1Y[1] = 178;
cp2X[1] = 477; cp2Y[1] = 193;
cp3X[1] = 462; cp3Y[1] = 309;

cp0X[2] = 463; cp0Y[2] = 312;
cp1X[2] = 408; cp1Y[2] = 427;
cp2X[2] = 187; cp2Y[2] = 280;
cp3X[2] = 258; cp3Y[2] = 149;
*/

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

for (var i=0;i<=64;i+=4) {
    if cpX[i] != -1 {
        cpID[0] = make(controlPoint);
        cpID[1] = make(controlPoint);
        cpID[2] = make(controlPoint);
        cpID[3] = make(controlPoint);
    }
}

/*
cpIndex += 1;
if cpIndex > cpMax cpIndex = 0;
*/

cp0.x = cp0X[cpIndex];
cp0.y = cp0Y[cpIndex];
cp1.x = cp1X[cpIndex];
cp1.y = cp1Y[cpIndex];
cp2.x = cp2X[cpIndex];
cp2.y = cp2Y[cpIndex];
cp3.x = cp3X[cpIndex];
cp3.y = cp3Y[cpIndex];

#define addBezPoint
