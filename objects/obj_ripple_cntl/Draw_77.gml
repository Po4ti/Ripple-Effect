/// @description Draw effect to surface
time_start = get_timer();
if(eff_cnt > 0)
{
	if(!surface_exists(surf))
		surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
	surface_copy(surf, 0, 0, application_surface);
	
	shader_set(shdr_ripple);
	
	surface_set_target(surf);
	
	cam_pos = get_camera_pos();
	camera_port = get_camera_port();
	view_port = get_view_port();
	
	ratio = [view_port[0] / camera_port[0],
			 view_port[1] / camera_port[1]]

	shader_set_uniform_f_array(u_resolution, camera_port);
	
	array_foreach(effs, function(_element)
	{	
		var eff_view_pos = [_element.effect_pos[0] - cam_pos[0],
							_element.effect_pos[1] - cam_pos[1]];
		eff_view_pos[0] *= ratio[0];
		eff_view_pos[1] *= ratio[1];
		
		var width = min(((_element.radius_max - _element.radius) / 3), 25);
		
		shader_set_uniform_f(u_radius, _element.radius);
		shader_set_uniform_f(u_radius_max, _element.radius_max);
		
		shader_set_uniform_f_array(u_effect_pos, eff_view_pos);
		
		shader_set_uniform_f(u_width, width);
		
		draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);
		surface_copy(application_surface, 0, 0, surf);
	});
	shader_reset();
	surface_reset_target();
}
time_end = get_timer();
time = time_end - time_start;

