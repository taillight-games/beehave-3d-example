// Created by Ryan Remer
// https://godotshaders.com/shader/gradienttexture-shader/
shader_type spatial;

uniform sampler2D color_ramp;

void light() {
	float dotnl = dot(NORMAL, LIGHT);
	float sample_position = max((dotnl + 1.0) / 2.01, 0.01);
	vec4 ramp_light = texture(color_ramp, vec2(sample_position, 0.0));
	vec3 diffuse_light = ramp_light.rgb * clamp(LIGHT_COLOR * ATTENUATION, vec3(0,0,0), vec3(1,1,1));
	DIFFUSE_LIGHT = max(diffuse_light, DIFFUSE_LIGHT);
}