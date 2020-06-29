/// @description Insert description here
// You can write your code in this editor

if(instance_exists(objPlayer)){
	if ((objPlayer.bbox_bottom) > y){
		mask_index = -1;
	} else{
		mask_index = sprPlatform;
	}
}

