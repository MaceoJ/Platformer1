h_speed = 0;
grav = 0.1;
v_speed += grav;


//vertical collision check (Wall)
	if(place_meeting(x, y + v_speed, objWall)){
		while(!place_meeting(x, y + sign(v_speed), objWall)){
			y += sign(v_speed);
		}
		v_speed = 0;
	}
	y += v_speed;

if(sprite_index != sprPlayerAttack){
	image_index = 0;
	if(image_xscale = -1){
		instance_create_layer(x, y, "Instances", objSwordAttack);
		objSwordAttack.image_xscale = -1;
		objSwordAttack.image_alpha = 0;
	} else{
		instance_create_layer(x, y, "Instances", objSwordAttack);
		objSwordAttack.image_alpha = 0;
	}
	sprite_index = sprPlayerAttack;
}

if(image_index > image_number - 1){
	state = PLAYERSTATE.DEFAULT;
}