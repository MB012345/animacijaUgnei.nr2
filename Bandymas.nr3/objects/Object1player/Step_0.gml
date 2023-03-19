//zaidejo ivedimas
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//suskaiciuojame judesius
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+vsp,Object2wall)) && (key_jump)
{
	vsp = -5;
}

//horizontalus susidurimas
if (place_meeting(x+hsp,y,Object2wall))
{
	while (!place_meeting(x+sign(hsp),y,Object2wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//vertikalus susidurimas
if (place_meeting(x,y+vsp,Object2wall))
{
	while (!place_meeting(x,y+sign(vsp),Object2wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//animacija
if (!place_meeting(x,y+1,Object2wall))
{
	sprite_index = Sprite4air;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; 
	else image_index = 0;
}

else 
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = Sprite2player;
	}
	else 
	{
		sprite_index = Sprite3run;
	}
}

if (hsp != 0) image_xscale = sign(hsp);