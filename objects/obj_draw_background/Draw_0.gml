// @description 

shader_set(shdr_bg);
shader_set_uniform_f_array(res_uniform, res);
shader_set_uniform_f(rep_cnt_uniform, 2);

draw_rectangle(0, 0, res[0], res[1], false);
shader_reset();









