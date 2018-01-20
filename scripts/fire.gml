var sId;

switch argument0 {
    case 'triple':
        sId=instance_create(x+lengthdir_x(sprite_height/2,270),y,oBullet);
        sId.speed = 3*scale;
        sId.direction = 270;
        sId=instance_create(x+lengthdir_x(sprite_height/2,270-30),y,oBullet);
        sId.speed = 3*scale;
        sId.direction = 270-30;
        sId=instance_create(x+lengthdir_x(sprite_height/2,270+30),y,oBullet);
        sId.speed = 3*scale;
        sId.direction = 270+30;
    break;
}
