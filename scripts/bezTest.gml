#define bezTest
cp0X[0] = 32;
cp0Y[0] = vh/2;
cp1X[0] = 80;
cp1Y[0] = vh/2-50;
cp2X[0] = 140;
cp2Y[0] = vh/2+50;
cp3X[0] = 180;
cp3Y[0] = vh/2;

cpMax = 0;

/*
cp0X[1] = 32;
cp0Y[1] = vh/2 + 16;
cp1X[1] = 80;
cp1Y[1] = vh/2-50 + 16;
cp2X[1] = 140;
cp2Y[1] = vh/2+50 + 16;
cp3X[1] = cp3X[0];
cp3Y[1] = cp3Y[0];

cp0X[2] = 32;
cp0Y[2] = vh/2 - 16;
cp1X[2] = 80;
cp1Y[2] = vh/2-50 - 16;
cp2X[2] = 140;
cp2Y[2] = vh/2+50 - 16;
cp3X[2] = 180;
cp3Y[2] = cp3Y[1];

cpMax = 2;
*/

#define updateBezierControlPoints
///update control points
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
#define addBezPoint
