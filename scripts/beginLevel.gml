#define beginLevel
switch winCondition {
    case _WIN_TIMELINE_END:
        timeline_index = winConditionValue;
        timeline_running = true;
        timeline_loop = false;
        if debugTimelineStartPos > -1 timeline_position = debugTimelineStartPos;
    break;
    case _WIN_FORMATIONS_COMPLETE:
    case _WIN_TIME:
        alarm[1] = 60;
    break;
}

active = true;

#define catchEndLevel
var caughtEndLevel = false;

switch winCondition {
    case _WIN_TIMELINE_END:
        if timeline_position > timeline_max_moment(timeline_index) { 
            timeline_running = false;
            trace('***** timeline done');
            caughtEndLevel = true;
        }
    break;
    case _WIN_BOSS:
        if levelManager.bossDefeated {
            caughtEndLevel = true;
        }
    break;
    case _WIN_FORMATIONS_COMPLETE:
        if wave > 16 caughtEndLevel = true;
    break;
    case _WIN_TIME:
        if winConditionValue > -2 {
            if oHUD.showHud winConditionValue = max(-1,winConditionValue - 1);
            if winConditionValue <= 0 {
                caughtEndLevel = true;
                oHUD.showHud = false;
            }
        }
    break;
    /*
    case _WIN_TIME:
        if objectAge >= winConditionValue {
        
        }
    break;
    */
}

if keyboard_check_pressed(vk_f9) caughtEndLevel = true;

if caughtEndLevel {
    kill(fChain);

    gracePeriod -= 1;
    oShip.invincible = true;

    if gracePeriod <= 0 and instance_number(oEnemy) <= 0 {
        //levelManager.active = false;
        GAMEFLOW_completedLevel = true;
        make(vw/2,vh+64,endLevel);
        active = false;
    }
}



#define setupTimeline
trace('setting timeline for spawner '+string(object_index));

timeline_index = tBasicFwd;
timeline_position = 0;
timeline_speed = 1;
timeline_loop = loop;

timeline_running = true;