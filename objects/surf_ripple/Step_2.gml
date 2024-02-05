time_start = get_timer();
var cam = view_camera[0]
var w = camera_get_view_width(cam)
var h = camera_get_view_height(cam)
if (!surface_exists(buffer_surface))
    buffer_surface = surface_create(w, h)
surface_set_target(buffer_surface)
draw_clear(c_black)
gpu_set_blendmode_ext(bm_one, bm_zero)
if surface_exists(application_surface)
    draw_surface(application_surface, 0, 0)
gpu_set_colorwriteenable(0, 0, 0, 1)
draw_set_alpha(1)
draw_rectangle(0, 0, w, h, false)
gpu_set_colorwriteenable(1, 1, 1, 1)
gpu_set_blendmode(bm_normal)
surface_reset_target()
time_end = get_timer();
time = time_end - time_start;
