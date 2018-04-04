var foundLevel = false;
var i = 0;

while !foundLevel {
    if XP < XP_lvl[i] {
        foundLevel = true;
    } else {
        i+=1;
    }
}

return XP_lvl[i];
