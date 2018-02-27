#define makeLevelButtons
///makeLevelButtons()
var buffer = 48;
var initialX = 64;
var initialY = 112;
var buttonDistance = 90;
var buttonsPerSide = 4;

buttonSize = 80;
var instanceID = -1;
var levelID = 0;
var world = 0;

for (var r=0;r<numWorlds*view_wview[0];r+=view_wview[0]) {
    for (var i=0;i<buttonsPerSide;i+=1) {
        for (var j=0;j<buttonsPerSide;j+=1) {
            instanceID = make(r+initialX+j*buttonDistance,initialY+i*buttonDistance,oLevelButton);
            instanceID.buttonSize = buttonSize;
            instanceID.levelID = levelID + world*100;
            instanceID.world = (r div view_wview[0]);
            prepareButton(instanceID);
            
            //if instanceID.levelID == 5 instanceID.shop = true;
            if controller.managerArray[instanceID.levelID] == 999 instanceID.shop = true;
            if controller.managerArray[instanceID.levelID] == levelManMidBoss_0 instanceID.boss = true;

            levelID += 1;
        }
    }
    world += 1;
    levelID = 0;
}

#define makeEraSliders
///makeEraSliders
instance_create(room_width/2,room_height-80,oEraSlider);
// big bang - - - - - - - - infinity