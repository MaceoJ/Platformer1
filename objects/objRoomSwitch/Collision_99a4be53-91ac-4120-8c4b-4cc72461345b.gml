/// @description Move to next room
// You can write your code in this editor
with(objPlayer){
	if(hascontrol){
		hascontrol = false;
		scr_transition(TRANS_MODE.NEXT);
	}
}


