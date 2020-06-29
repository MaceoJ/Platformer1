scr_player_movement();


with(instance_position(x, y, objBorder)){
	other.view_xmin = x;
	other.view_xmax = x + (320 * image_xscale);
	other.view_ymin = y;
	other.view_ymax = y + (180 * image_yscale);
	
}
