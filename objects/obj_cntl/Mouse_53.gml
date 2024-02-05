/// @description 
with(instance_create_depth(room_width - mouse_x, mouse_y, -100, surf_ripple))
	radius_max = 400;


with(obj_ripple_cntl)
{
	effect_push([mouse_x, mouse_y], 400, 7);
}