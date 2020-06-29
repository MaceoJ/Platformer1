/// @description Insert description here
// You can write your code in this editor
with(self){
	if(collision_rectangle(x, y, x + sprite_width, y + sprite_height, objRope, false, true)){
		instance_destroy(collision_rectangle(x, y, x + sprite_width, y + sprite_height, objRope, false, true));
	}
}
instance_destroy();