	//player movement values
	var move = key_right - key_left;
	wallJumpDelay = max(wallJumpDelay - 1, 0);
	if(wallJumpDelay == 0){
		h_speed = move * walkspd;
	}
	
	
	//wall jump
	if((onwall != 0) && (!isGrounded) && (key_jump)){
		wallJumpDelay = wallJumpDelay_max;
		h_speed = -onwall * h_Wjump;
		v_speed = v_Wjump;
		image_xscale = sign(h_speed);
		repeat(3){
				instance_create_layer(x, bbox_bottom, "Effects", objDust);
		}
		audio_play_sound(landingSound, 1, false);
	}
	grav = 0.1;
	v_speed += grav;
	if(v_speed > v_speed_max){
		v_speed = v_speed_max;
	}
	vanishDistance = 20;
	
	
	//jump functiionality
	//For Ledge Assistance with input buffering
	if (place_meeting(x, y + 1 ,objWall) || place_meeting(x, y + 1 ,objFallingPlatform)){
	    isGrounded = true;
	    grace_timer = grace_jump_time;
	} else{
	    isGrounded = false;
	    grace_timer--;
	}
	
	if (key_jump){
		jump_buffer_timer = jump_buffer;
	}
	if (jump_buffer_timer > 0){
	    jump_is_inside_buffer = true;
	} else{
	    jump_is_inside_buffer = false;
	}
	if(key_jump && isGrounded){
		sprite_index = sprPlayerTakeOff;
	}
	//this is sort of a failsafe for when the buffer frames are set to 0, just use the old jump
	if (jump_buffer = 0){
	    jump_is_inside_buffer = key_jump;
	}
	if(jump_is_inside_buffer){
	    if (isGrounded || grace_timer >0){
			v_speed = -3;
	        grace_timer = 0;
	        jump_buffer_timer = 0;
	    }
	    jump_buffer_timer--;
	}

	if(keyboard_check_released(vk_space)){
		v_speed *= 0.5;
	}

	var (h_speed_final) = h_speed + h_speed_carry;
	h_speed_carry = 0;

	//horizontal collision check (Wall)
	if(place_meeting(x + h_speed_final, y, objWall)){
		while(!place_meeting(x + sign(h_speed_final), y, objWall)){
			x += sign(h_speed_final);
		}
		h_speed_final = 0;
		h_speed = 0
	}
		//horizontal collision check (fallPlatform)
	if(place_meeting(x + h_speed_final, y, objFallingPlatform)){
		while(!place_meeting(x + sign(h_speed_final), y, objFallingPlatform)){
			x += sign(h_speed_final);
		}
		h_speed_final = 0;
		h_speed = 0;
	}	
	
		x += h_speed_final;
		
	//vertical collision check (Wall)
	if(place_meeting(x, y + v_speed, objWall)){
		while(!place_meeting(x, y + sign(v_speed), objWall)){
			y += sign(v_speed);
		}
		v_speed = 0;
	}
	
	//vertical collision check (fallPlatform)
	if(place_meeting(x, y + v_speed, objFallingPlatform)){
		while(!place_meeting(x, y + sign(v_speed), objFallingPlatform)){
			y += sign(v_speed);
		}
		v_speed = 0;
	}
	
	
	y += v_speed;
	
	
	//vanish mechanic
	vanishCooldown = max(vanishCooldown - 1, 0);
	if(vanish && (vanishCooldown == 0)){
		if(key_Lshift && key_right){
		grav = 0;
		for(i = 0; i <= vanishDistance; i++){
			if(place_meeting(x + 1 + i, y, objWall)){
				vanishDistance = i;
				break;
			}
		}
		x += move * vanishDistance;
		vanishCooldown = 30;
		} else if(key_Lshift && key_left){
			for(i = 0; i <= vanishDistance; i++){
				if(place_meeting(x - 1 - i, y, objWall)){
					vanishDistance = i;
					break;
				}
			}
			x += move * vanishDistance;
			vanishCooldown = 30;
		}
	}
	
	
	
	//Wall sliding
	if((place_meeting(x - 1, y, objWall) || place_meeting(x + 1, y, objWall)) && key_Rcontrol){
		wallsticking = true;
		v_speed = 0.2;
	} else{
		wallsticking = false;
	}
	onwall = place_meeting(x + 1, y, objWall) - place_meeting(x - 1, y, objWall);
	
	
	//animation	
	if(!isGrounded){
		image_speed = 1;
		if(key_right){
			image_xscale = 1;
		} else if(key_left){
			image_xscale = -1;
		}
		if(v_speed <= 0){						//check to play rising animation
			sprite_index = sprPlayerRising;		
		} else if(v_speed > 0){					//check to play falling animation
			sprite_index = sprPlayerFalling;
		}
		if(image_index == image_number - 1){	//Limit jump animation to 1 playthrough
			image_speed = 0;
		}
		genDust = 1;
		audio_stop_sound(runningSound);
	} else if((sprite_index == sprPlayerFalling) && isGrounded){
		if(genDust == 1){
			genDust = 0; 
			repeat(3){
				instance_create_layer(x, bbox_bottom, "Effects", objDust);
			}
			audio_play_sound(landingSound, 1, false);
		}
		sprite_index = sprPlayerLanding;
	}
	 else if(h_speed == 0){
		 audio_stop_sound(runningSound);
		sprite_index = sprPlayer;
		if(genDust == 1){
			genDust = 0; 
			repeat(3){
				instance_create_layer(x, bbox_bottom, "Effects", objDust);
			}
			audio_play_sound(landingSound, 1, false);
		}
	} else{
		image_speed = 1;
		sprite_index = sprPlayerRun;
		image_xscale = sign(h_speed);
		if(!audio_is_playing(runningSound)){
			audio_play_sound(runningSound, 0, false);
		}
		
		if(genDust == 1){
			genDust = 0; 
			repeat(3){
				instance_create_layer(x, bbox_bottom, "Effects", objDust);
			}
			audio_play_sound(landingSound, 1, false);
		}
	}