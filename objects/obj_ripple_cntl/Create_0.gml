/// @description Init ripple controller
u_radius = shader_get_uniform(shdr_ripple, "radius");
u_effect_pos = shader_get_uniform(shdr_ripple, "effect_pos");
u_radius_max = shader_get_uniform(shdr_ripple, "radius_max");
u_resolution = shader_get_uniform(shdr_ripple, "resolution");
u_width = shader_get_uniform(shdr_ripple, "width");
effs = [];
eff_cnt = 0;

//Use this method to create effect
function effect_push(_pos = [0, 0], _radius_max = 150, _spd = 7)
{
	array_push(effs, {
		effect_pos : _pos,
		radius : 0,
		radius_max : _radius_max,
		spd : _spd,
	});
	eff_cnt ++;
}


//Replace these functions if nessesary
get_camera_pos = function()
{
	var cam_x = camera_get_view_x(view_get_camera(view_camera[0]));
	var cam_y = camera_get_view_y(view_get_camera(view_camera[0]));
	return [cam_x, cam_y];
}

get_camera_port = function()
{
	var cam_x = camera_get_view_width(view_get_camera(view_camera[0]));
	var cam_y = camera_get_view_height(view_get_camera(view_camera[0]));
	return [cam_x, cam_y];
}

get_view_port = function()
{
	var cam_x = view_wport[0];
	var cam_y = view_hport[0];
	return [cam_x, cam_y];
}

surf = -1;

//Used for efficiency testing
time = 0;