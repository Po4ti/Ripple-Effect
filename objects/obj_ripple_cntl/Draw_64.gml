/// @description Efficiency test
draw_set_font(fnt_debug);
draw_set_color(c_black);

draw_text(50, 50, $"New: {time} microseconds");

var tt = 0;

with(surf_ripple)
{
	tt += time;	
}


draw_text(50, 80, $"Old: {tt} microseconds");
draw_text(50, 110, $"FPS: {fps_real}");

draw_set_color(c_white);



