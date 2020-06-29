/// @description Insert description here
// You can write your code in this editor
	var key_left = keyboard_check(ord("A"));
	var key_right = keyboard_check(ord("D"));

if(!global.cam_transitioning && instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;

	

	//key press
	if(key_left){
		lastKeyPressed = -1;
	}
	if(key_right){
		lastKeyPressed = 1;
	}
	

	//Update camera (object) position
	x += (xTo - x + (lastKeyPressed * cam_x_Offset)) / 10;
	y += (yTo - y) / 10;

	/*
	x = clamp(x, view_w_half, room_width - view_w_half);
	y = clamp(y, view_h_half, room_height - view_h_half); */

	x = clamp(x, objPlayer.view_xmin + view_w_half, objPlayer.view_xmax - view_w_half);
	y = clamp(y, objPlayer.view_ymin + view_h_half, objPlayer.view_ymax - view_h_half);

	x += random_range(-shake_remain, shake_remain);
	y += random_range(-shake_remain, shake_remain);
	shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude));

	//update camera view position
	camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
}

	x += random_range(-shake_remain, shake_remain);
	y += random_range(-shake_remain, shake_remain);
	shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude));
	
	//update camera view position
	camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
	
	if(layer_exists("Assets_1")){
		layer_x("Assets_1", x/5);
	}
	if(layer_exists("Assets_2")){
		layer_x("Assets_2", x/3.5);
	}
	if(layer_exists("Assets_2")){
		layer_x("Assets_2", x/3);
	}
	if(layer_exists("Assets_3")){
		layer_x("Assets_3", x/2);
	}