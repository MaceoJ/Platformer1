/// @description Insert description here
// You can write your code in this editor
jump_is_inside_buffer = false;
if(hascontrol){
	//get key input
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);
	key_Lshift = keyboard_check_pressed(vk_lshift);
	key_Rcontrol = keyboard_check(vk_rcontrol);
	left_click = mouse_check_button(mb_left);
	
	switch(state){
		case PLAYERSTATE.DEFAULT:
			scr_player_default();
			break;
		case PLAYERSTATE.ATTACK:
			scr_player_attack();
			break;
	}
	
	if(left_click && isGrounded){
		state = PLAYERSTATE.ATTACK;
	}
}
