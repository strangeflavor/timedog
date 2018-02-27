gems += value;
pickupsfx(sndGet);
repeat 3 make(x+irandom(6)-3,y+irandom(6)-3,oPickupCollectedFX);
kill();
