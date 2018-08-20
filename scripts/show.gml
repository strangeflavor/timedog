#define show
var i, arg;
for (i = 0; i < 16; i += 1;)
   {
   if argument_count > i
      {
      arg[i] = string(argument[i]);
      }
   else
      {
      arg[i] = '';
      }
   }

var _output = '';
for (i=0;i<16;i+=1) {
    if arg[i] != '' _output += ', '+arg[i];
}

_output = string_copy(_output,3,string_length(_output));
show_message(_output);

#define approach
///approach(a,b,amount)
// Moves "a" towards "b" by "amount" and returns the result
// Nice bcause it will not overshoot "b", and works in both directions
// Examples:
//      speed = Approach(speed, max_speed, acceleration);
//      hp = Approach(hp, 0, damage_amount);
//      hp = Approach(hp, max_hp, heal_amount);
//      x = Approach(x, target_x, move_speed);
//      y = Approach(y, target_y, move_speed);
 
if (argument0 < argument1)
{
    argument0 += argument2;
    if (argument0 > argument1)
        return argument1;
}
else
{
    argument0 -= argument2;
    if (argument0 < argument1)
        return argument1;
}
return argument0;

#define wave
///wave(from, to, duration, offset)

// Returns a value that will wave back and forth between [from-to] over [duration] seconds
// Examples
//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
//      x = Wave(-10,10,0.25,0)         -> move left and right quickly

// Or here is a fun one! Make an object be all squishy!! ^u^
//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)

a4 = (argument1 - argument0) * 0.5;
return argument0 + a4 + sin((((current_time * 0.001) + argument2 * argument3) / argument2) * (pi*2)) * a4;

#define wrap
/// @description Wrap(value, min, max)
/// @function Wrap
/// @param value
/// @param min
/// @param max
// Returns the value wrapped, values over or under will be wrapped around

if (argument0 mod 1 == 0)
{
	while (argument0 > argument2 || argument0 < argument1)
	{
		if (argument0 > argument2)
			argument0 += argument1 - argument2 - 1;
		else if (argument0 < argument1)
			argument0 += argument2 - argument1 + 1;
	}
	return(argument0);
}
else
{
	var vOld = argument0 + 1;
	while (argument0 != vOld)
	{
		vOld = argument0;
		if (argument0 < argument1)
			argument0 = argument2 - (argument1 - argument0);
		else if (argument0 > argument2)
			argument0 = argument1 + (argument0 - argument2);
	}
	return(argument0);
}

#define jumpInDirection
/// @description JumpInDirection(distance, direction)
/// @param distance
/// @param direction

// Teleports parent object to a spot based on given direction and distance

x += lengthdir_x(argument0,argument1)
y += lengthdir_y(argument0,argument1)

#define Chance
/// @description Chance(percent)
/// @param percent

// Returns true or false depending on RNG
// ex: 
//		Chance(0.7);	-> Returns true 70% of the time

return argument0 > random(1);
#define gauss
/// gauss(mean,deviation)
//
//  Returns a pseudo-random number with an exact Gaussian distribution.
//
//      mean        mean value of the distribution, real
//      deviation   standard deviation of distribution, real
//
/// GMLscripts.com/license

var x1, x2, w;

do {
    x1 = random(2) - 1;
    x2 = random(2) - 1;
    w = x1*x1 + x2*x2;
} until (0 < w && w < 1);

w = sqrt(-2 * ln(w)/w);
return argument0 + argument1 * x1 * w;