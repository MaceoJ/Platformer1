 /// @description Insert description here
// You can write your code in this editor
if(!instance_exists(objPlayer)){
	if(global.checkpoint == noone){
		global.checkpointX = 25;
		global.checkpointY = 150;
	} 
		instance_create_layer(global.checkpointX, global.checkpointY, "Instances", objPlayer);
}