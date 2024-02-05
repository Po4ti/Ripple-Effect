time_start = get_timer();
draw_set_alpha(1)
if ( surface_exists(buffer_surface))
{
    var NUM = 12
    var width = min(((radius_max - radius) / 3), 25)
    var offset = ((radius_max - radius) / 5)
    var d = (360 / NUM)
    var tex = surface_get_texture(buffer_surface)
    var tex_x = (texture_get_width(tex) / surface_get_width(buffer_surface))
    var tex_y = (texture_get_height(tex) / surface_get_height(buffer_surface))
    gpu_set_texrepeat(1)
    draw_primitive_begin_texture(5, tex)
    draw_set_color(c_white)
    for (var i = 0; i <= NUM; i += 1)
    {
        var xx = (x + lengthdir_x(radius, (i * d)))
        var yy = (y + lengthdir_y(radius, (i * d)))
        draw_vertex_texture(xx, yy, (tex_x * (xx + lengthdir_x(offset, (i * d)))), (tex_y * (yy + lengthdir_y(offset, (i * d)))))
        xx = (x + lengthdir_x((radius - width), (i * d)))
        yy = (y + lengthdir_y((radius - width), (i * d)))
        draw_vertex_texture(xx, yy, (tex_x * xx), (tex_y * yy))
    }
    for (i = 0; i <= NUM; i += 1)
    {
        xx = (x + lengthdir_x((radius + width), (i * d)))
        yy = (y + lengthdir_y((radius + width), (i * d)))
        draw_vertex_texture(xx, yy, (tex_x * xx), (tex_y * yy))
        xx = (x + lengthdir_x(radius, (i * d)))
        yy = (y + lengthdir_y(radius, (i * d)))
        draw_vertex_texture(xx, yy, (tex_x * (xx + lengthdir_x(offset, (i * d)))), (tex_y * (yy + lengthdir_y(offset, (i * d)))))
    }
    draw_primitive_end()
	gpu_set_texrepeat(0)
}
time_end = get_timer();

time += time_end - time_start;