/// @description Insert description here
// You can write your code in this editor

h_speed = 0;
h_speed_carry = 0;
v_speed = 0;
v_speed_max = 4;
grav = 0.1;
walkspd = 1.5;
vanishDistance = 0;
isGrounded = true;
hascontrol = true;
wallsticking = false;
onwall = 0;
h_Wjump = 3;
v_Wjump = -2;
wallJumpDelay = 0;
wallJumpDelay_max = 18;
vanish_max = 1;
vanish = vanish_max;
vanishCooldown = 0;
genDust = 1;

grace_jump_time = 5; //number of grace period frames after leaving the ground you can still jump
grace_timer = grace_jump_time;
//for input buffering
jump_buffer = 5; //number of grace period frames between player pressing jump and hitting the ground when they will still jump
jump_buffer_timer = 0;


view_xmin = 0;
view_xmax = 320;
view_ymin = 0;
view_ymax = 180;

enum PLAYERSTATE{
DEFAULT,
ATTACK
};

state = PLAYERSTATE.DEFAULT;