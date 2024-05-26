shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx, depth_test_disabled, unshaded;

uniform vec4 FogColor : source_color = vec4(0.250818, 0.250818, 0.250818, 1.000000);
uniform float ProxFadePower = 1.5;
uniform sampler2D depth_tex_frg_2 : hint_depth_texture;



void fragment() {
// ColorParameter:5
	vec4 _color = FogColor;


// FloatParameter:15
	float n_out15p0 = ProxFadePower;


	float _alpha;
// ProximityFade:2
	{
		float __depth_tex = texture(depth_tex_frg_2, SCREEN_UV).r;
		//__depth_tex = 1.0;
		vec4 __depth_world_pos = INV_PROJECTION_MATRIX * vec4(vec3(SCREEN_UV, __depth_tex) * 2.0 - 1.0, 1.0);
		__depth_world_pos.xyz /= __depth_world_pos.w;
		_alpha = clamp(1.0 - smoothstep(__depth_world_pos.z + n_out15p0, __depth_world_pos.z, VERTEX.z), 0.0, 1.0);
	}


// Output:0
	ALBEDO = vec3(_color.xyz);
	//ALBEDO = texture(depth_tex_frg_2, SCREEN_UV).xyz;
	ALPHA = _alpha;


}