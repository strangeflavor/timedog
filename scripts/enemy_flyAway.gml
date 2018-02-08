#define enemy_flyAway
///enemy_flyAway(wait,direction)
speed = argument0;
if formationStartX < room_width/2 direction = 180 else direction = 0;

#define enemy_move
///enemy_move(direction, speed)
// moves in a direction at a speed

direction = argument0;
speed = argument1;

#define enemy_move_formation

