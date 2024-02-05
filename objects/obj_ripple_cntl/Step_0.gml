/// @description Update effect
for(var i = 0; i < eff_cnt; i ++)
{
	if (effs[i].radius < effs[i].radius_max)
		effs[i].radius += effs[i].spd;
	else
	{
		array_delete(effs, i, 1);
		eff_cnt --;
		i --;
	}
}
