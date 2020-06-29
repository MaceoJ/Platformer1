/// @description Insert description here
// You can write your code in this editor


global.cam_transitioning = false;
cam = view_camera[0];
follow = objPlayer;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

cam_x_Offset = 10;

lastKeyPressed = 0;

shake_length  = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;