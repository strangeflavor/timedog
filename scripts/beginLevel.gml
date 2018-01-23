#define beginLevel
switch winCondition {
    case _WIN_TIMELINE_END:
        timeline_index = winConditionValue;
        timeline_running = true;
        timeline_loop = false;
    break;
    case _WIN_FORMATIONS_COMPLETE:
        waveID = pickWave();
        wave += 1;
        
        alarm[1] = 60;
    break;
}

#define endLevel
if winCondition == _WIN_TIMELINE_END {
    if timeline_position > timeline_max_moment(timeline_index) { 
        timeline_running = false;
        trace('***** timeline done');
    }

    make(x,y,waveCompleteSplash);
}

#define setupTimeline
trace('setting timeline for spawner '+string(object_index));

timeline_index = tBasicFwd;
timeline_position = 0;
timeline_speed = 1;
timeline_loop = loop;

timeline_running = true;