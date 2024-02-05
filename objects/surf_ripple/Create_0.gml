var cam = view_camera[0]
radius = 0
radius_max = 150
spd = 7
buffer_surface = surface_create(camera_get_view_width(cam), camera_get_view_height(cam))
surface_set_target(buffer_surface)
draw_clear(c_black)
surface_reset_target()

//radius_max = 400

time = 0;