//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPos;

uniform float radius;
uniform vec2 effect_pos;
uniform float radius_max;
uniform vec2 resolution;
uniform float width;

void main()
{
	vec2 new_coords = v_vTexcoord;
	float dist = abs(distance(v_vPos,  effect_pos) - radius);
	if(dist <= width)
	{
		float offset = ((radius_max - radius) / 5.);
		vec2 angle_vec = v_vPos - effect_pos;
		float eff_power =  1. - dist / width;
		angle_vec = normalize(angle_vec);
		new_coords += offset * angle_vec / resolution * eff_power;
		
		//Uncomment for texrepeat effect
		//if(new_coords.x < 0.)
		//	new_coords.x += 1.;
		//if(new_coords.y < 0.)
		//	new_coords.y += 1.;			
		
		//if(new_coords.x > 1.)
		//	new_coords.x -= 1.;
		//if(new_coords.y > 1.)
		//	new_coords.y -= 1.;			
	}

	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, new_coords);	
}