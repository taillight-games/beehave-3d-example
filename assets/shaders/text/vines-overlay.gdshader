shader_type spatial;
render_mode blend_mix, vertex_lighting, specular_disabled, depth_draw_opaque;

uniform sampler2D albedo: filter_nearest_mipmap;

uniform float texture_scale = 1.0;

uniform sampler2D alpha_texture: filter_nearest_mipmap;

uniform float alpha_scale = 1.0;

uniform float vertex_power: hint_range(0.0, 1.0, 0.01) = 0.8;

vec4 triplanar_texture(sampler2D p_sampler, vec3 p_weights, vec3 p_triplanar_pos) {
		vec4 samp = vec4(0.0);
		samp += texture(p_sampler, p_triplanar_pos.xy) * p_weights.z;
		samp += texture(p_sampler, p_triplanar_pos.xz) * p_weights.y;
		samp += texture(p_sampler, p_triplanar_pos.zy * vec2(-1.0, 1.0)) * p_weights.x;
		return samp;
	}

	uniform float triplanar_scale = 1.0;
	uniform vec3 triplanar_offset;
	uniform float triplanar_sharpness = 0.5;

	varying vec3 triplanar_power_normal;
	varying vec3 triplanar_pos;


void vertex()
{
	COLOR = COLOR;
	// if its a floor, dont show vines
	if(NORMAL.y > 0.5)
	{
		COLOR = vec4(0.0);
	}
	/*
	{
		triplanar_power_normal = pow(abs(NORMAL), vec3(triplanar_sharpness));
		triplanar_power_normal /= dot(triplanar_power_normal, vec3(1.0));
		triplanar_pos = VERTEX * triplanar_scale + triplanar_offset;
		triplanar_pos *= vec3(1.0, -1.0, 1.0);
	}*/
		
}

void fragment() {
	// Called for every pixel the material is visible on.
	
	vec4 _color = texture(albedo, UV * texture_scale);
	
	//_color = triplanar_texture(albedo, triplanar_power_normal, triplanar_pos);
	
	vec4 _alpha = texture(alpha_texture, UV * alpha_scale);
	
	float _sky_alpha = COLOR.a;
	
	if(_sky_alpha < 0.8)
	{
		_sky_alpha -= 0.2;
	}
	
	ALBEDO = mix(_color.xyz, _color.xyz * COLOR.xyz, vertex_power);
	
	ALPHA = _alpha.r * _color.a * _sky_alpha;
}
