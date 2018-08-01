#define form_meteors
/// form_meteors(size,rate,rateDelta);
trace('starting form meteors');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var size = arg[0];
var rate = arg[1];
var rateDelta = arg[2];

if size == -1 size = 12;
if rate == -1 rate = 60;
if rateDelta == 1 rateDelta = 1.25;

var mID = make(fMeteors);
mID.size = size;

#define form_missiles
/// form_meteors(size,rate,rateDelta);
trace('starting form meteors');

var arg;
for (var i = 0; i < 16; i += 1;) if argument_count > i arg[i] = argument[i] else arg[i] = -1;

var xx = arg[0];
 _enemy_xshuffle = arg[1];
var size = arg[2];
var rate = arg[3];
var rateDelta = arg[4];

if xx == -1 xx = vw/2;
if _enemy_xshuffle == -1 _enemy_xshuffle = vw/3;
if size == -1 size = 32;
if rate == -1 rate = 12;
if rateDelta == -1 rateDelta = 1;

var mID = make(xx,-32,fLargeMissiles);
mID.size = size;
mID._enemy_xshuffle = _enemy_xshuffle;
