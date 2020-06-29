/// @description Insert description here
// You can write your code in this editor

//Horizontal moving platforms
if(horizontal_platform){
	if(x < xMaxDist && platDir == dir.RIGHT){
		x += h_speed;
	} else if(x = xMaxDist){
		platDir = dir.LEFT;
		x += -h_speed;
	} else if(x < xMaxDist && platDir == dir.LEFT && x > xBegin){
		x += -h_speed;
	} else{
		platDir = dir.RIGHT;
	}

	if(place_meeting(x, y - 1, objPlayer)){
		if(platDir == dir.RIGHT){
			objPlayer.h_speed_carry = h_speed;
		} else{
			objPlayer.h_speed_carry = -h_speed;
		}
	
	}	
}

//Vertical moving platforms
if(vertical_platform){
	if(y < yMaxDist && platDir == dir.DOWN){
		y += v_speed;
	} else if(y = yMaxDist){
		platDir = dir.UP;
		y += -v_speed;
	} else if(y < yMaxDist && platDir == dir.UP && y > yBegin){
		y += -v_speed;
	} else{
		platDir = dir.DOWN;
	}
	
	if(place_meeting(x, y - 1, objPlayer)){
		if(platDir == dir.DOWN){
			objPlayer.v_speed_carry = v_speed;
		} else{
			objPlayer.v_speed_carry = -v_speed;
		}
	
	}	
}