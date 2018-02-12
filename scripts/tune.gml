///tune(tuneIndex,tuneVarName,currentValue,increment);

var i, arg;
for (i = 0; i < 16; i += 1;)
   {
   if argument_count > i
      {
      arg[i] = argument[i];
      }
   else
      {
      arg[i] = 0;
      }
   }


if instance_number(oTuner) == 0 make(oTuner);

var currentValue, tuneIndex;
tuneIndex = arg[0]; // button to press to activate this tuner, plus the index to use to store its current value
oTuner.tuneVarName[tuneIndex] = arg[1];
oTuner.tuneStartingAmount[tuneIndex] = arg[2];
if arg[3] != 0 oTuner.tuneIncrementOverride[tuneIndex] = arg[3];

return oTuner.tuneStartingAmount[tuneIndex] + oTuner.tuneAmount[tuneIndex];

