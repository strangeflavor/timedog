#define addDialog
///addDialog(speaker,text);
speaker = argument0;
text = argument1;

dialogPanels += 1;

#define prepDialog
// prepDialog: fills dialog arrays
d = 0;
dIndex = 0;

switch argument0 {
    case rDeepSpace:
        dSprite[0] = sLevel1; // sprite
        dNumber[0] = 3; // number of frames to the dialog
        dFrameDuration[0,0] = 1; // multiplier for timestep between frames
        dFrameDuration[0,1] = 1;
        dFrameDuration[0,2] = 1;
        dFrameDuration[0,3] = 1;
        dFrameDuration[0,4] = -1;

        dSprite[1] = sLevel1B;
        dNumber[1] = 6;
        dFrameDuration[1,0] = 1; 
        dFrameDuration[1,1] = 1;
        dFrameDuration[1,2] = 1;
        dFrameDuration[1,3] = 1;
        dFrameDuration[1,4] = 1;
        dFrameDuration[1,5] = 3;
        dFrameDuration[1,6] = 1;
        dFrameDuration[1,7] = -1;

        dTotal = 1;
    break;
}
