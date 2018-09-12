#define bhpg_pattern_init
///bhpg_pattern_init(number of bullets, bullet spread, start angle, total arrays, array spread, begin spin speed, spin change rate, spin reverse, max spin speed, fire rate, object width,object height,x offset,y offset)

/***************************************************
  bhpg_pattern_init
  
  bullets - argument0 - total number of bullets per bullet array
  spread - argument1 - how spread out the bullets in individual arrays should be
  
  start_angle - argument2 - the angle for the pattern to start at
  
  total_arrays - argument2 - how many bullet arrays there should be
  array_spread - argument3 - total spread between the first and last array
  
  spin - argument4 - the speed at which the arrays will be spinning when the script is first called
  spin_mod - argument5 - how quickly the spin rate will speed up. should be set to 0 if max spin speed is disabled.
  spin_reverse - argument6 - set to 1 if you want the spin rate to reverse once it reaches a certain threshhold
  max_spin_spd - argument7 - the max spin rate before reversal begins
  
  fire_rate - argument8 - how often the enemy should fire (higher=slower rate of fire)
  
  object_width - argument11 - how wide is the object that is firing
  object_height - argument12 - how tall is the object that is firing
  x offset - argument13 - the horizontal offset from the object's x origin
  y offset - argument14 - the vertical offset from the object's y origin
 ***************************************************/

base_angle = 0;
shoot = 0;

for (var i=0;i<16;i+=1) bullets[i] = -1;

bullets[0] = argument0;
bulletsIndex = 0;

spread = argument1;

start_angle = argument2;

total_arrays = argument3;
array_spread = (argument4/total_arrays);

spin_start = argument5;
spin = spin_start;
spin_mod = argument6;
spin_reverse = argument7;
max_spin_spd = argument8;

fire_rate = argument9;

object_width = argument10;
object_height = argument11;
x_offset = argument12;
y_offset = argument13; 

b_ang = spread/bullets[0];

#define bhpg_bullet_init
///bhpg_bullet_init(bullet object, bullet speed, bullet acceleration, bullet curve);

/***************************************************
  bhpf_bullet_init
  bullet_object - argument0 - determines which object to use as a bullet
  bullet_speed - argument1 - determines how fast the bullets will move
  bullet_accel - argument2 - determines how quickly the bullet will accelerate or decelerate
  bullet_curve - argument3 - determines if the bullet will change directions after being fired
 ***************************************************/

bullet_object = argument0;
bullet_speed = argument1;
bullet_accel = argument2;
bullet_curve = argument3;

#define bhpg_pattern_step
///bhpg_pattern_step()
 
//control spread angles 
bb = max(1,bullets[bulletsIndex]-1);
aa = max(1,total_arrays-1);

a_ang = (array_spread/aa);
b_ang = (spread/bb);

if spin_direction_reverse {
    spin = -spin;
    spin_mod *= sign(spin);
    spin_direction_reverse = false;
}

if (shoot=0) {//fire rate control
    for (var j=0;j<total_arrays;j++) {//loop for each array
        for (var i=0;i<bullets[bulletsIndex];i++) {//loop for each bullet
            //determine the point where the bullets will fire from
            xx = x+x_offset+lengthdir_x(object_width,base_angle+(b_ang*i)+(a_ang*j)+start_angle);
            yy = y+y_offset+lengthdir_y(object_height,base_angle+(b_ang*i)+(a_ang*j)+start_angle);

            bullet = instance_create(xx,yy,bullet_object);//create a bullet at the desired location
            bullet.direction = base_angle+(b_ang*i)+(a_ang*j)+start_angle;//give that bullet the desired direction
            bullet.image_angle = base_angle+(b_ang*i)+(a_ang*j)+start_angle;//set the bullet's image_angle so it faces the same direction
            bullet.speed = bullet_speed;//give the bullet the desired speed
            bullet.accel = bullet_accel;
            bullet.curve = bullet_curve;
        }
    }

    base_angle += spin;//spin the arrays

    //spin += spin_mod;//increase or decrease spin speed

    if (spin_reverse = 1) {//if spin reverse is enables
        if (spin < -max_spin_spd || spin > max_spin_spd) {//reverse the spin once it reaches a certain speed
            spin_mod = -spin_mod;
        }
    }
}

shoot += 1;//fire rate control

if (shoot >= fire_rate) {//once shoot reaches our fire rate
    shoot = 0;//set it to 0 to shoot again
}

#define bhpg_bullet_tune
if (keyboard_check_pressed(vk_delete)) with oBullet kill();
if (keyboard_check_pressed(ord('F'))) spin_direction_reverse = true;

if (keyboard_check_pressed(vk_up)) menu_choice -= 1;
if (keyboard_check_pressed(vk_down)) menu_choice += 1;

if (menu_choice < 0) menu_choice = total_menu;
if (menu_choice > total_menu) menu_choice = 0;

bullets_col = c_white;
spin_col = c_white;
spin_mod_col = c_white;
spin_reverse_col = c_white;
max_spin_spd_col = c_white;
spin_reset_col = c_white;
spin_wait_col = c_white;
fire_rate_col = c_white;
spread_col = c_white;
start_angle_col = c_white;
total_arrays_col = c_white;
array_spread_col = c_white;
bullet_object_col = c_white;
bullet_accel_col = c_white;
bullet_speed_col = c_white;
bullet_curve_col = c_white;
object_width_col = c_white;
object_height_col = c_white;
x_offset_col = c_white;
y_offset_col = c_white;

switch (menu_choice) {
    case 0:
        bullets_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) bullets[bulletsIndex] -= 1;
        if (keyboard_check_pressed(vk_right)) bullets[bulletsIndex] += 1;
        break;
    case 1:
        spread_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) spread -= 5;
        if (keyboard_check_pressed(vk_right)) spread += 5;
        break;
    case 2:
        total_arrays_col = c_yellow;
    
        if (keyboard_check_pressed(vk_left)) total_arrays -= 1;
        if (keyboard_check_pressed(vk_right)) total_arrays += 1;
        break;
    case 3:
        array_spread_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) array_spread -= 5;
        if (keyboard_check_pressed(vk_right)) array_spread += 5;
        break;
    // start_angle
    case 4:
        start_angle_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) start_angle -= 5;
        if (keyboard_check_pressed(vk_right)) start_angle += 5;
        break;
    // spin
    case 5:
        spin_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) spin -= 5;
        if (keyboard_check_pressed(vk_right)) spin += 5;
        break;
    // spin_mod
    case 6:
        spin_mod_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) spin_mod -= 0.1;
        if (keyboard_check_pressed(vk_right)) spin_mod += 0.1;
        break;
    // spin_reverse
    case 7:
        spin_reverse_col = c_yellow;

        if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) spin_reverse = !spin_reverse;
        break;
    // max_spin_spd
    case 8:
        max_spin_spd_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) max_spin_spd -= 5;
        if (keyboard_check_pressed(vk_right)) max_spin_spd += 5;
        break;
    // spin_reset
    case 9:
        spin_reset_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) spin_reset -= 5;
        if (keyboard_check_pressed(vk_right)) spin_reset += 5;
        break;
    //spin_wait
    case 10:
        spin_wait_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) spin_reset_wait -= 5;
        if (keyboard_check_pressed(vk_right)) spin_reset_wait += 5;
        break;
    // fire_rate
    case 11:
        fire_rate_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) fire_rate -= 1;
        if (keyboard_check_pressed(vk_right)) fire_rate += 1;
        break;
    // bullet_speed
    case 12:
        bullet_speed_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) bullet_speed -= 1;
        if (keyboard_check_pressed(vk_right)) bullet_speed += 1;
        break;
    // accel
    case 13:
        bullet_accel_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) bullet_accel -= 0.01;
        if (keyboard_check_pressed(vk_right)) bullet_accel += 0.01;
        break;
    // bullet_curve
    case 14:
        bullet_curve_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) bullet_curve -= 1;
        if (keyboard_check_pressed(vk_right)) bullet_curve += 1;
        break;
    // object_width
    case 15:
        object_width_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) object_width -= 1;
        if (keyboard_check_pressed(vk_right)) object_width += 1;
        break;
    // object_height
    case 16:
        object_height_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) object_height -= 1;
        if (keyboard_check_pressed(vk_right)) object_height += 1;
        break;
    // x_offset
    case 17:
        x_offset_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) x_offset -= 1;
        if (keyboard_check_pressed(vk_right)) x_offset += 1;
      break;
    // y_offset
    case 18:
        y_offset_col = c_yellow;

        if (keyboard_check_pressed(vk_left)) y_offset -= 1;
        if (keyboard_check_pressed(vk_right)) y_offset += 1;
      break;
}

if (bullets < 1) bullets = 1;
if (fire_rate < 0) fire_rate = 0;
if (total_arrays < 1) total_arrays = 1;

if (start_angle > 359) start_angle = 0;
if (start_angle < 0) start_angle = 355;