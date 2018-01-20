formationIndex+=1;

// fill array with junk to prevent the game from thinking we've destroyed the entire formation before all the enemies have spawned
for (i=0;i<50;i+=1) {
    formationArray[formationIndex,i] = 1;
}
