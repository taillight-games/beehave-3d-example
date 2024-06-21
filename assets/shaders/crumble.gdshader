shader_type spatial;
render_mode unshaded, blend_mix, cull_disabled;

uniform float alpha = 0.0;

uniform float alpha_clip : hint_range(0.0, 1.0, 0.01);

uniform sampler2D main_tex : filter_nearest_mipmap;

uniform sampler2D noise_tex : filter_nearest_mipmap;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;

uniform float effect_start_time;

uniform vec2 noise_uv_offset;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	
	vec4 _tex = texture(main_tex, UV);
	vec4 a = texture(noise_tex, UV + noise_uv_offset);
	
	float _multiply_alpha;
	
	if (a.x > alpha_clip)
	{
		_multiply_alpha = 1.0;
	} else {
		_multiply_alpha = 0.0;
	}
	
	ALBEDO = _tex.rgb;
	
	ALPHA = _multiply_alpha;
	
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
