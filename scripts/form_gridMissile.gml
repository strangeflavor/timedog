///form_gridMissile()

with make(vw/2+100,-80,oGridShip) {
    phase[0] = enemy_move;
    phaseArguments[0,0] = 270; // direction
    phaseArguments[0,1] = 6; // speed
    phaseCondition[0] = _PHASE_CONDITION_Y;
    phaseConditionArguments[0,0] = 96;

    phase[1] = enemy_stop;
    phaseArguments[1,0] = 64; // radius
    phaseArguments[1,1] = -2; // speed
    phaseArguments[1,2] = 1; // xbend
    phaseArguments[1,3] = .5; // ybend
    phaseCondition[1] = _PHASE_CONDITION_TIME;
    phaseConditionArguments[1,0] = 420;

    phase[2] = enemy_move;
    phaseArguments[2,0] = 90; // direction
    phaseArguments[2,1] = 8; // speed
}

