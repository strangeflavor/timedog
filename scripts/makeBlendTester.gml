if instance_number(blendTester) <= 0 {
    make(blendTester);
} else {
    draw_set_blend_mode_ext(blendTester.srcmode,blendTester.destmode);
    //trace(blendTester.srcmode);
    //trace(blendTester.destmode);
}
