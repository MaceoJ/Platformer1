/// @description Insert description here
// You can write your code in this editor

if(surface_exists(surface)){
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	var _cx = camera_get_view_x(view_camera[0]);
	var _cy = camera_get_view_y(view_camera[0]);
	
	surface_set_target(surface);
	draw_set_color(c_black);
	draw_set_alpha(0.2);
	draw_rectangle(0,0,_cw, _ch,0);
	
	gpu_set_blendmode(bm_subtract);
	
	with(objPlayer){
		draw_sprite_ext(sprLight, 0, x - _cx, y - _cy, 0.5, 0.5, 0, c_white, 1);
	}
	
	gpu_set_blendmode(bm_normal);
	
	draw_set_alpha(1);
	surface_reset_target();
	draw_surface(surface, _cx, _cy);
	
} else{
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	
	surface = surface_create(_cw, _ch);
	surface_set_target(surface);
	draw_set_color(c_black);
	draw_set_alpha(0.2);
	draw_rectangle(0,0,_cw, _ch,0);
	
	surface_reset_target();
}