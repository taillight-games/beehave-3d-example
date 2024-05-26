shader_type canvas_item;

render_mode unshaded;
uniform sampler2D screen_texture : source_color, hint_screen_texture, repeat_disable, filter_nearest;

uniform int color_levels : hint_range(2, 256) = 32;

vec3 color_mix(vec3 a, vec3 b, float f ){
	f = clamp(abs(f), 0,1);
	float invf = 1.0 - f;
	return (a*f) + (b*invf);
}

vec3 quantize_color(vec3 color, int levels) {
    float quantizer = float(levels - 1);
    return floor(color * quantizer + 0.5) / quantizer;
}


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	
	vec3 screen_color = texture(screen_texture, SCREEN_UV).rgb;
	vec2 screen_coords = SCREEN_UV * 2.0 - 1.0;
	
	vec3 final_color = screen_color;
	
	final_color = quantize_color(final_color, color_levels);
	
	COLOR = vec4(final_color,1);
}



//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
