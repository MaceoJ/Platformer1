/// @description Insert description here
// You can write your code in this editor

var on_platform = place_meeting(x, y - 1, objPlayer);

if(on_platform && !animation_shake_played){
	timer_countdown = 1;
	image_speed = 1;
	sprite_index = aniFallingPlatShake;
	if(image_index == image_number - 1){
		animation_shake_played = true;
		image_speed = 0;
		sprite_index = sprFallingPlat;
	}
	on_platform = 0;
}

if(timer_countdown){
	timer--;
	if(timer < 1){
		sprite_index = sprFallingPlat;
		timer_countdown = 0;
	}
}

if(timer < 1){
	y += v_speed;
	reposition_timer--;
	if(!animation_fall_played){
		image_speed = 0.5;
		sprite_index = aniFallingPlatFall;		//animation has 4 frames with the last frame being empty
		if(image_index == 0){
			image_alpha = 0.9;
		} else if(image_index == 1){
			image_alpha = 0.6;
		} else if(image_index == 2){
			image_alpha = 0.3;
		} else if(image_index == 3){
			image_alpha = 0;
			sprite_index = sprFallingPlat;
			animation_fall_played = true;
		} 
	}
}

if(reposition_timer < 1){
	if(!collision_rectangle(x_pos, x_pos + sprite_width, y_pos, y_pos + sprite_height, objPlayer, false, true)){
		timer = 60;
		timer_countdown = 0;
		y = y_pos;
		reposition_timer = 60;
		animation_shake_played = false;
		animation_fall_played = false;
		sprite_index = sprFallingPlat;
		image_alpha = 1;
	}
}

