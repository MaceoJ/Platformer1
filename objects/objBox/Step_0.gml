/// @description Insert description here
// You can write your code in this editor

grav = 0.1;
v_speed += grav;

if(collision_rectangle(x, y, x + sprite_width, y + sprite_height, objRope, false, true)){
	v_speed = 0;
}

//vertical collision check (Wall)
	if(place_meeting(x, y + v_speed, objWall)){
		while(!place_meeting(x, y + sign(v_speed), objWall)){
			y += sign(v_speed);
		}
		suspended = false;
		v_speed = 0;
	}
y += v_speed;

if(!suspended && genDust){
	genDust = false;
	repeat(10){
	instance_create_layer(x, bbox_bottom, "Effects", objDust);
	instance_create_layer(x + (sprite_width/2), bbox_bottom, "Effects", objDust);
	instance_create_layer(x + sprite_width, bbox_bottom, "Effects", objDust);
	}
	screen_shake(1, 15);
}

